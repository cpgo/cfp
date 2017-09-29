defmodule CfpWeb.SlackController do
  use CfpWeb, :controller

  plug :put_layout, "public.html"

  alias Slack.Invitation

  def index(conn, _params) do
    changeset = Invitation.changeset(%Invitation{})
    render(conn, "index.html", changeset: changeset)
  end

  def new(conn, params), do: index(conn, params)

  def create(conn, %{"invitation" => params }) do
    {changeset, flash, message} =
      case Invitation.perform(params) do
	{:ok, {change, email}} ->
	  {change, :info, email}
	{:error, {change, error_message}} ->
	  {change, :error, error_message}
      end
    conn
    |> put_flash(flash, message)
    |> render("index.html", changeset: changeset)
  end
  
end
