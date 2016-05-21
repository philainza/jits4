module ApplicationHelper

  def bootstrap_paperclip_picture(form, paperclip_object)
    if form.object.send("#{paperclip_object}?")
      image_tag form.object.send(paperclip_object).send(:url, :small)
    end
  end

  def can_display_post?(post)
    signed_in? && !current_user.has_blocked?(post.user) || !signed_in?
  end

  def avatar_profile_link(user, image_options={}, html_options={})
    link_to(image_tag(user.avatar.url(:thumb), image_options), profile_path(user), html_options)
  end

  def flash_class(type)
    case type
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
end
