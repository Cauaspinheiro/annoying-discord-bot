defmodule AnnoyingBot do
  defdelegate create_user(params), to: AnnoyingBot.Users.Create, as: :call
  defdelegate create_curse(params), to: AnnoyingBot.Curses.Create, as: :call
end
