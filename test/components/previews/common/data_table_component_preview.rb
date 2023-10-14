# frozen_string_literal: true

# @label Data Table Component
class Common::DataTableComponentPreview < ViewComponent::Preview
  # Data Table Component
  # --------------------
  # @param density select { choices: [condensed, normal, spacious] }
  def playground(density: "normal")
    items = (0..5).collect do |index|
      OpenStruct.new(
        name: "Item #{index}",
        travels_from: "Cacahue",
        invited_by: %w[Alberto Andrea].sample,
        invitation_status: %w[invitation_sent invitation_accepted invitation_declined assistance_cancelled].sample
      )
    end

    render Common::DataTableComponent.new(items:, density:) do |table|
      table.with_column("Name") { |item| tag.p(item.name) }
      table.with_column("Travels from") { |item| tag.p(item.travels_from) }
      table.with_column("Invited by") { |item| tag.p(item.invited_by) }
      table.with_column("Invitation status") { |item| tag.p(item.invitation_status) }
    end
  end
end
