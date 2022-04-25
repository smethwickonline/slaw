import gleam/io
import gleam/string
import gleam/list
import gleam/int
import gleam/bit_builder.{BitBuilder}
import gleam/http/elli
import gleam/http/request.{Request}
import gleam/http/response.{Response}
import slaw/templates/home

const version = "0.1"

const port = 3000

pub fn router(req: Request(a)) {
  // turn the path we get into a list and clean it up a bit
  let deconstructed_path =
    string.split(req.path, on: "/")
    |> list.drop(1)

  // change route based on our path
  case deconstructed_path {
    [""] -> root()
    ["test", ..] -> {
      let body = bit_builder.from_string("quick lil test !!")
      response.new(200)
      |> response.prepend_header("Content-Type", "text/html")
      |> response.set_body(body)
    }
    // 404 if the path requested doesn't exist in our router
    _other ->
      response.new(404)
      |> response.set_body(bit_builder.from_string(
        "couldn't find that one, sorry",
      ))
  }
}

pub fn main() {
  // there are probably better ways to do this
  io.println(string.concat(["slaw ", version]))
  io.println(string.concat(["servin' on port ", int.to_string(port), " !!!"]))

  elli.become(router, on_port: port)
}

pub fn root() -> Response(BitBuilder) {
  let body = bit_builder.from_string(home.render("leah"))
  response.new(200)
  |> response.prepend_header("Content-Type", "text/html")
  |> response.set_body(body)
}
