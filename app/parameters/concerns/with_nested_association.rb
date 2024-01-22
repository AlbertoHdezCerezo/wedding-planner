require "active_support/concern"

module WithNestedAssociation
  extend ActiveSupport::Concern

  def has_one(association_name, schema:, required: true)
    name = parameterize(association_name.to_s)

    if required
      required(name).hash(schema)
    else
      optional(name).hash(schema)
    end
  end

  def has_many(association_name, schema:, required: true)
    name = parameterize(association_name.to_s, has_many_association: true)

    if required
      required(name).array(schema)
    else
      optional(name).array(schema)
    end
  end

  private

  # Reformulates association name according to Rails nested association
  # parameters convention (association -> association_attributes)
  def parameterize(association_name, has_many_association: false)
    :"#{has_many_association ? association_name.pluralize : association_name}_attributes"
  end
end
