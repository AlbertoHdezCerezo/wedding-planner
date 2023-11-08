# frozen_string_literal: true

# @label Data Table Component
class Common::DataTableComponentPreview < ViewComponent::Preview
  # Data Table Component
  # --------------------
  # @param density select { choices: [condensed, normal, spacious] }
  def playground(density: "normal")
    hosts = %w[Alberto Andrea]
    statuses = %w[invitation_sent invitation_accepted invitation_declined assistance_cancelled]

    items = (0..5).collect do |index|
      OpenStruct.new( # rubocop:disable Style/OpenStructUse
        name: "Item #{index}",
        travels_from: "Cacahue",
        invited_by: hosts.sample,
        invitation_status: statuses.sample
      )
    end

    render_with_template(locals: { items:, density: })
  end

  # `DataTableComponent` counts with a `empty_state` slot. If
  # defined, the table will be replaced by a empty state when
  # there are no items to be displayed.
  def with_empty_state
    render_with_template
  end
end
