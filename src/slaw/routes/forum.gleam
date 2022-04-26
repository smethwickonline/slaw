import gleam/http/request.{Request}
import gleam/http/response
import gleam/bit_builder
import gleam/io

pub fn handler(req: Request(a)) {
  io.debug(req)
  response.new(200)
  |> response.set_body(bit_builder.from_string("forum"))
}
