defmodule AnnoyingBotWeb.UsersView do
  alias AnnoyingBot.User

  def render("create_user.json", %{user: %User{} = %{id: id, name: name}}) do
    %{
      user: %{
        id: id,
        name: name
      }
    }
  end

  def render("users.json", %{users: users}) do
    Enum.map(users, fn value -> %{
      name: value.name,
      id: value.id,
      discord_id: value.discord_id,
      updated_at: value.updated_at,
      inserted_at: value.inserted_at
    }
    end)
  end
end
