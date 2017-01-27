class Presenters::RecipePresenter < Presenters::Presenter
  def initialize(object)
    fields_to_extract = %i(id title slug)
    super(object, fields_to_extract)
  end

  # override parent's as_json
  def as_json(*)
    extract!
  end
  def as_json_detailed(*)
    extract!
  end
end
