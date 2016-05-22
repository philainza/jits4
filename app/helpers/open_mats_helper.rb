module OpenMatsHelper
  def starts_in(open_mat)
    current_time = Time.now
    if open_mat.expired?
      content_tag(:strong, 'All Done!')
    else
      "Starts " + distance_of_time_in_words(current_time, open_mat.starts_at) + " from now"
    end
  end

  def image_for(open_mat)
    if open_mat.image_file_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag open_mat.image_file_name
    end
  end

  def host?(open_mat)
    session[:user_id] == open_mat.user_id
  end
end
