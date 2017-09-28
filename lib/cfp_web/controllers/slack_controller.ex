defmodule CfpWeb.SlackController do
  use CfpWeb, :controller

  plug :put_layout, "public.html"

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, email: email) do
    conn
    |> put_flash(:info, email)
    |> render "index.html"
  end


  
end
