# frozen_string_literal: true

module ComponentHelper
  def base_component(tag: :div, **system_arguments, &)
    render(BaseComponent.new(tag:, **system_arguments), &)
  end

  def button_component(label:, size: :medium, scheme: :primary, **system_arguments, &)
    render(Common::ButtonComponent.new(label:, size:, scheme:, **system_arguments), &)
  end

  def icon_component(icon:, size: :base, **system_arguments)
    render(Common::IconComponent.new(icon, size:, **system_arguments))
  end

  def icon_button_component(icon:, size: :medium, scheme: :primary, **system_arguments)
    render(Common::IconButtonComponent.new(icon:, size:, scheme:, **system_arguments))
  end

  def horizontal_description_list_component(separator: "·", **system_arguments, &)
    render(Common::HorizontalDescriptionListComponent.new(separator:, **system_arguments), &)
  end

  def title_component(title:, **system_arguments, &)
    render(Common::TitleComponent.new(title:, **system_arguments), &)
  end
end
