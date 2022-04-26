import gleam/http/request.{Request}
import gleam/http/response.{Response}
import gleam/bit_builder.{BitBuilder}
import gleam/string
import gleam/list
import gleam/erlang/file
import slaw/routes/root

pub fn router(req: Request(a)) {
  // turn the path we get into a list and clean it up a bit
  let deconstructed_path =
    string.split(req.path, on: "/")
    |> list.drop(1)

  // change route based on our path
  case deconstructed_path {
    [""] -> root.handler()
    ["assets", ..] -> {
      // this may look a bit janky. that's because it is.
      // TODO: how do we get the mime type here (do we really need it?)
      let file = file.read_bits(string.drop_left(req.path, 1))
      case file {
        Ok(a) ->
          response.new(200)
          |> response.set_body(bit_builder.from_bit_string(a))
        Error(_) -> not_found()
      }
    }
    // 404 if the path requested doesn't exist in our router
    _other -> not_found()
  }
}

pub fn not_found() -> Response(BitBuilder) {
  response.new(404)
  |> response.set_body(bit_builder.from_string("couldn't find that one, sorry"))
}
