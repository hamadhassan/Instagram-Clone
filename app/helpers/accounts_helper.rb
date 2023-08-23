# frozen_string_literal: true

module AccountsHelper
  def profile_picture(account, width)
    image_path = account.image.present? ? account.image : 'default.jpeg'
    image_tag(image_path, width:, class: 'img-circle')
  end

  def can_edit_profile?(profile_id)
    account_signed_in? && current_account.id == profile_id
  end
end
