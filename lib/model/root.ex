defmodule Hinter.Model.Root do
  alias Hinter.Repository.Local, as: Repo
  require Hinter.Ui
  require Hinter.Keys

  def init() do
    %{
      tab_index: 0,
      input: ""
    }
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: Hinter.Keys.left()}} ->
        %{
          model
          | tab_index: Integer.mod(model.tab_index - 1, 2),
            input: ""
        }

      {:event, %{key: Hinter.Keys.right()}} ->
        %{
          model
          | tab_index: Integer.mod(model.tab_index + 1, 2),
            input: ""
        }

      {:event, %{key: Hinter.Keys.enter()}} ->
        save_hint(model.tab_index, model.input)
        model

      {:event, %{key: key}} when key in Hinter.Keys.delete_keys() ->
        %{
          model
          | input: String.slice(model.input, 0..-2)
        }

      {:event, %{key: Hinter.Keys.space()}} ->
        %{
          model
          | input: model.input <> " "
        }

      {:event, %{ch: char}} ->
        %{
          model
          | input: model.input <> <<char::utf8>>
        }

      _ ->
        model
    end
  end

  defp save_hint(key, value) do
    Repo.add_hint(key, value)
  end
end
