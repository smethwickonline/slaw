import gleam/http/request.{Request}
import gleam/http/response
import gleam/bit_builder
import gleam/string
import gleam/erlang/file
import slaw/status

// TODO: file IO is slow!! get some sort of caching in order here
pub fn handler(req: Request(a)) {
  // this may look a bit janky. that's because it is.
  // TODO: how do we get the mime type here (do we really need it?)
  let file = file.read_bits(string.drop_left(req.path, 1))
  case file {
    Ok(a) ->
      response.new(200)
      |> response.set_body(bit_builder.from_bit_string(a))
    Error(_) -> status.not_found()
  }
}
