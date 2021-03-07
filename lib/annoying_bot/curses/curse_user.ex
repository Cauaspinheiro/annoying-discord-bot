defmodule AnnoyingBot.Curses.CurseUser do
  alias AnnoyingBot.{User, Curse}

  def call(%{"user_id" => user_id, "type" => type}) do
    with {:ok, user: %User{name: name}} <- AnnoyingBot.get_user_by_id(user_id),
      {:ok, curse: %Curse{phrase: phrase}} <- AnnoyingBot.get_random_curse(type) do
      replace_phrase_with_user(phrase, name)
    end
  end

  defp replace_phrase_with_user(phrase, user_name) do
    message = Regex.replace(~r/{([a-z]+)?}/, phrase, fn -> user_name end)

    {:ok, message}
  end
end
