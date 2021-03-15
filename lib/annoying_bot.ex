defmodule AnnoyingBot do
  defdelegate create_user(params), to: AnnoyingBot.Users.Create, as: :call
  defdelegate get_user_by_id(params), to: AnnoyingBot.Users.Read, as: :get_by_id
  defdelegate get_user_by_discord(params), to: AnnoyingBot.Users.Read, as: :get_by_discord
  defdelegate get_user_by_name(params), to: AnnoyingBot.Users.Read, as: :get_by_name
  defdelegate get_all_users(), to: AnnoyingBot.Users.Read, as: :all

  defdelegate create_curse(params), to: AnnoyingBot.Curses.Create, as: :call
  defdelegate get_random_curse(type), to: AnnoyingBot.Curses.Read, as: :get_random_curse
  defdelegate get_all_curses(), to: AnnoyingBot.Curses.Read, as: :all
end
