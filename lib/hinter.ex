defmodule Hinter do
  @behaviour Ratatouille.App

  require Ui
  alias Model.Root, as: Model
  alias Pages.{Add, Remove}

  def init(_context) do
    Model.init()
  end

  def update(model, msg) do
    Model.update(model, msg)
  end

  def render(model) do
    case Ui.tab_sequence()[model.tab] do
      :add -> Add.render(model)
      :rmv -> Remove.render(model)
    end
  end
end

Repository.Local.start_link("")
Ratatouille.run(Hinter)
