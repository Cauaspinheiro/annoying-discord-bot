defmodule AnnoyingBot.Discord.UpdateUserCommand do
  alias AnnoyingBot.{User, Users}
  alias Nostrum.Api

  def call(msg) do
    words = msg.content
      |> String.split(" ", trim: true)
      |> Enum.filter(fn value -> value !== "" end)

    discord_id = Enum.at(words, 1)
    nickname = Enum.at(words, 2)

    params = %{discord_id: discord_id, nickname: nickname}

    with {:ok, user} <- validate_params(params), {:ok, _user} <- update_user(user, nickname) do
      Api.create_message(msg.channel_id, "#{discord_id} tem o apelido #{nickname} agora")
      else {:error, reason} ->
        Api.create_message(msg.channel_id, reason)
    end
  end

   defp validate_params(%{discord_id: discord_id, nickname: nickname}) when
    discord_id == nil or nickname == nil do
    {:error, "ERRO: VOCÊ PRECISA MARCAR UM USUÁRIO E PASSAR O NOVO APELIDO DELE"}
   end

  defp validate_params(%{discord_id: discord_id, nickname: nickname}) do
    with :ok <- validate_nickname(nickname),
      {:ok, %User{name: name} = user} <- get_user(discord_id) do
      unless name === nickname do
        {:ok, user}
        else {:error, "ERRO: MESMO APELIDO"}
      end
    end
  end

  defp get_user(discord_id) do
    with {:ok, user: user} <- Users.Read.get_by_discord(discord_id) do
      {:ok, user}
      else {:error, _reason} -> "ERRO: USUÁRIO NÃO ENCONTRADO"
    end
  end

  defp validate_nickname(nickname)  do
    unless nickname === nil do
      :ok
      else {
        :error,
        "ERRO: VOCÊ PRECISA PASSAR O NOVO APELIDO DO USUÁRIO COMO SEGUNDO PARÂMETRO"
      }
    end
  end

  defp update_user(%User{} = user,  nickname) do
    new_user = Ecto.Changeset.change(user, name: nickname)

    Users.Update.update(new_user)
  end
end
