# frozen_string_literal: true

DEFAULT_FACTORIES_PATH = "lib/factories"

# Add "lib/factories" as additional path to load factories from
FactoryBot.definition_file_paths << Rails.root.join("lib/factories")

# Set "lib/factories" as directory where generator will place new factories
Rails.application.config.generators { |g| g.factory_bot(dir: DEFAULT_FACTORIES_PATH) }
