# frozen_string_literal: true

class Planner::ApplicationController < ApplicationController
  before_action :authenticate_user!
end
