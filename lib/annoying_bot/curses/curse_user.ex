defmodule AnnoyingBot.Curses.CurseUser do
  alias AnnoyingBot.{User, Curse}

  def call(%{"user_id" => user_id}) do
    %User{name: name} = AnnoyingBot.get_user_by_id(user_id)
    %Curse{phrase: phrase} = AnnoyingBot.get_random_curse()

    message = Regex.replace(~r/{([a-z]+)?}/, phrase, fn -> name end)

    {:ok, message}
  end
end
