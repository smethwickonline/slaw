import gleam/io
import gleam/string
import gleam/int
import gleam/bit_builder.{BitBuilder}
import gleam/http/elli
import gleam/http/request.{Request}
import gleam/http/response.{Response}
import slaw/templates/home

pub fn router(req: Request(a)) {
  // TODO: this only matches exact paths
  case req.path {
    "/" -> root()
  }
  // "" if strings.starts_with("/test") -> {
  //   let body = bit_builder.from_string("aaaaaa")
  //   response.new(200)
  //   |> response.set_body(body)
  // }
}

pub fn main() {
  let port = 3000

  io.println("slaw 0.1")
  // there are probably better ways to do this
  let msg = string.concat(["servin' on port ", int.to_string(port), " !!!"])
  io.println(msg)

  elli.become(router, on_port: 3000)
}

pub fn root() -> Response(BitBuilder) {
  let body = bit_builder.from_string(home.render("leah"))
  response.new(200)
  |> response.prepend_header("Content-Type", "text/html")
  |> response.set_body(body)
}
