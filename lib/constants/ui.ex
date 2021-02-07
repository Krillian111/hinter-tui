defmodule Ui do
  use Const

  @add :add
  @rmv :rmv

  const tab_add, do: @add
  const tab_rmv, do: @rmv
  const tab_sequence, do: %{0 => @add, 1 => @rmv}

end