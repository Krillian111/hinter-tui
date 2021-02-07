defmodule Hinter do
  @behaviour Ratatouille.App

  require Ui

  def init(_context) do
    Model.Root.init()
  end

  def update(model, msg) do
    Model.Root.update(model, msg)
  end

  def render(model) do
    case Ui.tab_sequence[model.tab] do
      :add -> Pages.Add.render(model)
      :rmv -> Pages.Remove.render(model)
    end
  end

end

Repository.Local.start_link("")
Ratatouille.run(Hinter)