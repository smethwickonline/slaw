import gleam/http/response.{Response}
import gleam/bit_builder.{BitBuilder}
import slaw/data/forums.{Forum}
import slaw/templates/home

pub fn handler() {
  let test_forum = forums.get_forums()
  let body = bit_builder.from_string(home.render("leah", test_forum))
  response.new(200)
  |> response.prepend_header("Content-Type", "text/html")
  |> response.set_body(body)
}
