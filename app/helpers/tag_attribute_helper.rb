# frozen_string_literal: true

module TagAttributeHelper
  def tag_attributes(*hashes)
    Html::TagAttributes.build(*hashes).to_h
  end
end
