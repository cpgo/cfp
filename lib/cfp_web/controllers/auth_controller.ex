defmodule CfpWeb.AuthController do
  use CfpWeb, :controller

  plug Ueberauth
  plug :put_layout, "public.html"

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Auth failure")
    |> redirect(to: public_path(conn, :index))
  end

  def callback(%{assigns: %{ueberauth_auth: data}} = conn, _params) do
    token = data.credentials.token
    id = data.extra.raw_info.user["id"]
    is_admin = Github.Organization.on_board?(id, token)
    conn
    |> put_flash(:info, "Yes")
    |> redirect(to: global_path(conn, :index))
  end

  def request(conn, _params) do
    url = Ueberauth.Strategy.Helpers.callback_url(conn)
    IO.inspect(conn)
    render(conn, "request.html", callback_url: url)
  end

  def delete(conn, _params) do
    # To be filled
    conn
    |> redirect(to: public_path(conn, :index))
  end
  
end
