# frozen_string_literal: true

module ComponentHelper
  def action_list_component(size: :base, **system_arguments, &)
    render(Common::ActionListComponent.new(size:, **system_arguments), &)
  end

  def base_component(tag: :div, **system_arguments, &)
    render(BaseComponent.new(tag:, **system_arguments), &)
  end

  def button_component(label:, size: :medium, scheme: :primary, **system_arguments, &)
    render(Common::ButtonComponent.new(label:, size:, scheme:, **system_arguments), &)
  end

  def empty_state_component(icon:, title:, subtitle: nil, button_label: nil, button_path: nil, button_arguments: {})
    render Common::EmptyStateComponent.new(icon:, title:, subtitle:, button_label:, button_path:, button_arguments:)
  end

  def horizontal_description_list_component(separator: "·", size: :medium, **system_arguments, &)
    render(Common::HorizontalDescriptionListComponent.new(separator:, size:, **system_arguments), &)
  end

  def icon_component(icon:, size: :base, **system_arguments)
    render(Common::IconComponent.new(icon, size:, **system_arguments))
  end

  def icon_button_component(icon:, size: :medium, scheme: :primary, **system_arguments)
    render(Common::IconButtonComponent.new(icon:, size:, scheme:, **system_arguments))
  end

  def horizontal_description_list_component(separator: "·", **system_arguments, &) # rubocop:todo Lint/DuplicateMethods
    render(Common::HorizontalDescriptionListComponent.new(separator:, **system_arguments), &)
  end

  def modal_component(**system_arguments, &)
    render(Common::ModalComponent.new(**system_arguments), &)
  end

  def navigation_list_component(url: url_for, size: :base, **system_arguments, &)
    render(Common::NavigationListComponent.new(url:, size:, **system_arguments), &)
  end

  def tab_navigation_component(url: url_for, **system_arguments, &)
    render(Common::TabNavigationComponent.new(url:, **system_arguments), &)
  end

  def title_component(title:, size: :medium, **system_arguments, &)
    render(Common::TitleComponent.new(title:, size:, **system_arguments), &)
  end
end
