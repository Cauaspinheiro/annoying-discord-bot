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
end
