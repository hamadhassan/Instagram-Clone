module AccountsHelper
  def profile_picture (account, width)
    image_path =account.image.present? ? account.image.
  end
end
