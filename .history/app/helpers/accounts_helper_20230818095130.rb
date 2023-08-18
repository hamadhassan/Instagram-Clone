module AccountsHelper
  def profile_picture (account, width)
    image_path =account.image.present? ? account.image : "default.jpeg"
    image_tag(image_path,width: width, class:"img-circle")
  end
  def can_edit_profile?
    account_signed_in?
  end
end
