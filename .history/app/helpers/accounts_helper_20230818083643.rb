module AccountsHelper
  def profile_picture (account, width)
    image_path =account.image.present? ? account.image :"default.jpeg"
    image_tag (image_path,width: width)
  end
end
