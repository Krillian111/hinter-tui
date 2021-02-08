defmodule Model.Root do
  import Ratatouille.Constants, only: [key: 1]
  alias Repository.Local, as: Repo
  require Keys

  def init() do
    %{
      tab: 0,
      value: Repo.value(),
      input: ""
    }
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: Keys.left()}} ->
        %{
          model
          | tab: Integer.mod(model.tab - 1, 2)
        }

      {:event, %{key: Keys.right()}} ->
        %{
          model
          | tab: Integer.mod(model.tab + 1, 2)
        }

      {:event, %{key: Keys.enter()}} ->
        %{
          model
          | value: save(model.input)
        }

      {:event, %{key: key}} when key in Keys.delete_keys() ->
        %{
          model
          | input: String.slice(model.input, 0..-2)
        }

      {:event, %{key: Keys.space()}} ->
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

  defp save(to_save) do
    Repo.add_hint(to_save)
    to_save
  end
end
