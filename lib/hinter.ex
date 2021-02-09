defmodule Hinter.App do
  @behaviour Ratatouille.App

  alias Hinter.Model.Root, as: Model
  alias Hinter.Pages.{Add, Remove}
  require Hinter.Ui

  def init(_context) do
    Model.init()
  end

  def update(model, msg) do
    Model.update(model, msg)
  end

  def render(model) do
    tab = Hinter.Ui.tab_sequence()[model.tab_index]

    case tab do
      :add -> Add.render(model)
      :rmv -> Remove.render(model)
    end
  end
end

