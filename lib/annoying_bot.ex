defmodule AnnoyingBot do
  defdelegate create_user(params), to: AnnoyingBot.Users.Create, as: :call
  defdelegate get_user_by_id(params), to: AnnoyingBot.Users.Read, as: :get_by_id

  defdelegate create_curse(params), to: AnnoyingBot.Curses.Create, as: :call
  defdelegate get_random_curse(), to: AnnoyingBot.Curses.Read, as: :get_random_curse
  defdelegate curse_user(params), to: AnnoyingBot.Curses.CurseUser, as: :call
end
