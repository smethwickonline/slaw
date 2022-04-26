import gleam/bit_builder.{BitBuilder}
import gleam/http/response.{Response}

pub fn not_found() -> Response(BitBuilder) {
  response.new(404)
  |> response.set_body(bit_builder.from_string("couldn't find that one, sorry"))
}
