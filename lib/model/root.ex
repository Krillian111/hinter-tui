defmodule Model.Root do
  alias Repository.Local, as: Repo
  require Keys

  def init() do
    %{
      tab: 0,
      value: Repo.value(0),
      input: ""
    }
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: Keys.left()}} ->
        %{
          model
          | tab: Integer.mod(model.tab - 1, 2),
            input: ""
        }

      {:event, %{key: Keys.right()}} ->
        %{
          model
          | tab: Integer.mod(model.tab + 1, 2),
            input: ""
        }

      {:event, %{key: Keys.enter()}} ->
        save_hint(model.tab, model.input)
        model

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

  defp save_hint(key, value) do
    Repo.add_hint(key, value)
  end
end
