# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Infers +layout+ for each controller +request+
  layout :request_format_based_layout

  private

  # Overwrites default behavior of +Turbo+ module. Sets a +stream+ layout to wrap around
  # all +Rails+ responses to +turbo_stream+ requests.
  # More information in:
  # - https://github.com/hotwired/turbo/issues/273
  # - https://github.com/hotwired/turbo-rails/blob/main/app/controllers/turbo/frames/frame_request.rb#L16
  def request_format_based_layout
    if request.format.turbo_stream?
      # Our +stream+ layout just contains an additional +turbo_stream+ to
      # append new flash messages to the UI. This way we do not need to
      # set flash messages manually on each +turbo_stream+ view
      "turbo_rails/stream"
    elsif turbo_frame_request?
      "turbo_rails/frame"
    end
  end
end
