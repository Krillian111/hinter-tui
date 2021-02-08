defmodule Keys do
  use Const
  import Ratatouille.Constants, only: [key: 1]

  const(left, do: key(:arrow_left))
  const(right, do: key(:arrow_right))
  const(enter, do: key(:enter))
  const(space, do: key(:space))
  const(delete_keys, do: for(keyId <- [:backspace, :backspace2, :delete], do: key(keyId)))
end
