defmodule AnnoyingBot.Discord.CreateMessageHandler do
  alias AnnoyingBot.Discord.{CreateCurseCommand, CreateUserCommand}
  alias AnnoyingBot.Discord.{GetAllUsersCommand, GetUserCommand}
  alias AnnoyingBot.Discord.{CurseUserCommand}

  def call(msg) do
    list = String.split(msg.content, " ", trim: true)

    case String.downcase(Enum.at(list, 0)) do
      "!xingar" -> CurseUserCommand.call(msg)
      "!registrar" -> CreateUserCommand.call(msg)
      "!xingamento" -> CreateCurseCommand.call(msg)
      "!usuarios" -> GetAllUsersCommand.call(msg)
      "!usuario" -> GetUserCommand.call(msg)
      _ -> :ignore
    end
  end
end
