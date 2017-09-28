defmodule Cfp.Slack.Invitation do

  @moduledoc """
  Define Changeset for Slack invitation
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do: field :email

  @doc """
  A changeset for email address (in Slack)
  """
  def changeset(invitation, params \\ %{}) do
    invitation
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
  end

end
