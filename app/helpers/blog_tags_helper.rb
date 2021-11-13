module BlogTagsHelper
  def tag_join(model)
    if model.blank? || model.tag.blank?
      nil
    else
      #model.tag.map { |tag| tag.name }
      model.tag
    end
  end
end
