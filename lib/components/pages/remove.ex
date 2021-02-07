defmodule Pages.Remove do

  import Ratatouille.View
  alias Repository.Local, as: Repo
  alias Organisms.Navigation, as: Navigation
  alias Organisms.Content, as: Content
  require Ui

  def render(model) do
    view do
      Navigation.render(Ui.tab_rmv) 
      Content.render(model.tab, model.input) 
    end
  end
end