defmodule AnnoyingBot.Discord.GetUserCommand do
  alias AnnoyingBot.{Users, User}
  alias Nostrum.Api

  def call(msg) do
    discord_id = String.split(msg.content, " ", trim: true)
      |> Enum.at(1)

    with :ok <- validate_discord(discord_id) do
      case get_user_by_discord(discord_id) do
        {:error, reason} -> Api.create_message(msg.channel_id, reason)
        {:ok, users} -> Api.create_message(msg.channel_id, users)
      end
      else {:error, reason} -> Api.create_message(msg.channel_id, reason)
    end
  end

  defp validate_discord(discord_id) when discord_id == nil or discord_id == "" do
    {:error, "ERRO: VOCÊ PRECISA MARCAR UM USUÁRIO COMO PRIMEIRO PARÂMETRO"}
  end

  defp validate_discord(discord) do
    with true <- String.starts_with?(discord, "<@!"),
      true <- String.ends_with?(discord, ">") do
      :ok
      else _ -> {:error, "ERRO: VOCÊ PRECISA MARCAR UM USUÁRIO COMO PRIMEIRO PARÂMETRO"}
    end
  end

  defp get_user_by_discord(discord) do
    with {:ok, user: user} <- Users.Read.get_by_discord(discord) do
      {:ok, format_user(user)}
      else {:error, _reason} -> "ERRO: USUÁRIO NÃO ENCONTRADO"
    end
  end

  defp format_user(%User{
    discord_id: discord_id, inserted_at: inserted_at,
    id: id, name: name, created_by: created_by}) do

    date = Enum.join([inserted_at.day, inserted_at.month, inserted_at.year], "/")

    first_line = "#{discord_id} -- Criado por #{created_by}\n"
    info = "```Apelido: #{name} | Criado em: #{date} | ID: #{id}```"

    first_line <> info
  end
end
