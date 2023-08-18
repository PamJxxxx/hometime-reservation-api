class Reservation::JsonProcessor
  def categorize_schema(params)
    subclass = nil
    Reservation.subklasses.map do |model|
      schema = model::JSON_SCHEMA

      if valid_schema(schema, params)
        subclass = model
        break
      end
    end
    subclass
  end

  private

  def valid_schema(schema, params)
    schemer = JSONSchemer.schema(schema)
    schemer.valid?(JSON.parse(params))
  end
end
