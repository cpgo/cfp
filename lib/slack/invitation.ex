defmodule Slack.Invitation do

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
    |> cast(params, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
  end

  @doc """
  perform validation on user parameters
  """
  def perform(parameters) do
    change = changeset(%__MODULE__{}, parameters)
    if change.valid? do
      {:ok, {change, change.changes.email}}
    else
      {:error, {change, Util.pop_error(change)}}
    end
  end

end
