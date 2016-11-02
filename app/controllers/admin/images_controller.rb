class Admin::ImagesController < Admin::BaseController
  # skip_before_action :require_admin, only: [:new, :create, :show]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image has been uploaded!"
      redirect_to admin_image_path(@image)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:url, :avatar)
  end
end
