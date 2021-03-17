defmodule AnnoyingBot.Discord.CreateMessageHandler do
  alias AnnoyingBot.Discord.{CurseUserCommand, CreateUserCommand, CreateCurseCommand}

  def call(msg) do
    list = String.split(msg.content, " ", trim: true)

    case String.downcase(Enum.at(list, 0)) do
      "!xingar" -> CurseUserCommand.call(msg)
      "!registrar" -> CreateUserCommand.call(msg)
      "!xingamento" -> CreateCurseCommand.call(msg)
      _ -> :ignore
    end
  end
end
