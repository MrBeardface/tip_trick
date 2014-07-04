class TipsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :index, :show, :destroy, :edit, :update]
	before_action :correct_user,   only: [:destroy, :edit]

	def new
		@tips = Tip.new
	end

	def create
		@tips = current_user.tips.build(tips_params)
		if @tips.save
			flash[:success] = "Tip created!"
      redirect_to tips_path
    else
    	@feed_item = []
      render 'static_pages/home'
    end
  end

	def index
		@tips = Tip.all
	end

	def show
  	@tips = Tip.find(params[:id])
	end

	def destroy
    @tip.destroy
    redirect_to current_user
  end

  def edit
  	@tip = Tip.find(params[:id])
  end

  def update
  	@tip = Tip.find(params[:id])
    if @tip.update_attributes(tips_params)
      flash[:success] = "Tip updated!"
      redirect_to tips_path
    else
    	flash[:alert] = "You can't edit that fool!"
    	render tips_path
    end
  end

private

    def tips_params
      params.require(:tip).permit(:content)
    end

    def correct_user
      @tip = current_user.tips.find_by(id: params[:id])
      redirect_to root_url if @tip.nil?
    end
end