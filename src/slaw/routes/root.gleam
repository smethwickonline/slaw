import gleam/http/response.{Response}
import gleam/bit_builder.{BitBuilder}
import slaw/templates/home

pub fn handler() -> Response(BitBuilder) {
  let body = bit_builder.from_string(home.render("leah"))
  response.new(200)
  |> response.prepend_header("Content-Type", "text/html")
  |> response.set_body(body)
}
