defmodule AuthController do
  use CfpWeb, :controller

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Auth failure")
    |> redirect(to: public_path(conn, :index))
  end

  def callback(conn, _params) do
    conn
    |> put_flash(:info, "Yes")
    |> redirect(to: public_path(conn, :index))
  end
  
end
