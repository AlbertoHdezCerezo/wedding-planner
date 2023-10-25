# frozen_string_literal: true

module ComponentHelper
  def icon_component(icon:, size: :base, **system_arguments)
    render(Common::IconComponent.new(icon, size:, **system_arguments))
  end

  def base_component(tag: :div, **system_arguments, &)
    render(BaseComponent.new(tag:, **system_arguments), &)
  end

  def horizontal_description_list_component(separator: "·", **system_arguments, &)
    render(Common::HorizontalDescriptionListComponent.new(separator:, **system_arguments), &)
  end
end
