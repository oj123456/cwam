# app/presenters/presenter
class Presenters::Presenter
  attr_accessor :extracted_fields

  def initialize(object, extract_fields=[])
    @object, @extract_fields = object, extract_fields
  end

  def as_json(*)
    return nil if @object.nil?
    extract!
  end

  def extract!
    @extracted_fields = extract(* @extract_fields) if @extract_fields
  end

  def extract(*keys)
    keys = keys.map(&:to_sym)
    @object.attributes.select { |k, v| keys.include?(k.to_sym) }
  end
end
