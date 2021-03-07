defmodule AnnoyingBot.Curse do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:phrase, :type]

  schema "curses" do
    field :phrase, :string
    field :type, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(:phrase)
    |> validate_inclusion(:type, ["offline", "online", "general"])
  end
end
