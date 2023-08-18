class Reservation::JsonProcessor

  def categorize_schema(params)
    model_type = false
    Reservation.inakay.map do |model|
      schema  = model::JSON_SCHEMA
      schemer = JSONSchemer.schema(schema)
      if schemer.valid?(JSON.parse(params))
        model_type = model
        break
      end
    end
    model_type
  end
end