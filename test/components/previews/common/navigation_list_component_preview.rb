# frozen_string_literal: true

# @label Navigation List Component
class Common::NavigationListComponentPreview < ViewComponent::Preview
  # Navigation List Component
  # -------------------------
  # Action List component variant which uses list items
  # as links. By default it reads the current page path
  # (`url_for`) and highlights the item/s whose `url`
  # match the path. You can overwrite this behavior
  # either by passing a custom URL to the component
  # via the `url` parameter, or on each individual
  # links via the `active` slot parameter
  def default
    render Common::NavigationListComponent.new(url: "/link1") do |list|
      list.with_heading(title: "Title")
      list.with_link_default(url: "/link1", label: "link 1")
      list.with_link_default(url: "/link2", label: "link 2")
      list.with_link_default(url: "/link3", label: "link 3")

      list.with_link_divider

      list.with_link_default(url: "/link1", label: "with leading visual") do |link|
        link.with_leading_visual_icon(icon: "arrow-left")
      end
      list.with_link_default(url: "/link2", label: "with trailing visual") do |link|
        link.with_trailing_visual_icon(icon: "box-pencil")
      end
      list.with_link_default(url: "/link3", label: "with leading and trailing visual") do |link|
        link.with_leading_visual_icon(icon: "arrow-left")
        link.with_trailing_visual_icon(icon: "box-pencil")
      end
    end
  end

  # @param url text
  # @param size select { choices: [base, lg] }
  def playground(url: "/link1", size: :base)
    render Common::NavigationListComponent.new(size:, url:) do |list|
      list.with_heading(title: "Title")
      list.with_link_default(url: "/link1", label: "link 1")
      list.with_link_default(url: "/link2", label: "link 2")
      list.with_link_default(url: "/link3", label: "link 3")

      list.with_link_divider

      list.with_link_default(url: "/link1", label: "with leading visual") do |link|
        link.with_leading_visual_icon(icon: "arrow-left")
      end
      list.with_link_default(url: "/link2", label: "with trailing visual") do |link|
        link.with_trailing_visual_icon(icon: "box-pencil")
      end
      list.with_link_default(url: "/link3", label: "with leading and trailing visual") do |link|
        link.with_leading_visual_icon(icon: "arrow-left")
        link.with_trailing_visual_icon(icon: "box-pencil")
      end
    end
  end
end
