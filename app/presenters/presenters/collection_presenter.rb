class Presenters::CollectionPresenter < Presenters::Presenter
  def initialize(klass, array, *params)
    @klass, @array, @params = klass, array, params
  end

  def as_json(*)
    @array.map { |i| @klass.new(i, *@params) }.compact
  end

  def as_json_detailed(*)
    @array.map { |i| @klass.new(i, *@params).as_json_detailed }.compact
  end
end
