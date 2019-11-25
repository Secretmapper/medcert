defmodule MedcertWeb.PageController do
  use MedcertWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
