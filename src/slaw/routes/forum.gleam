import gleam/http/request.{Request}
import gleam/http/response.{Response}
import gleam/bit_builder.{BitBuilder}
import gleam/list
import gleam/uri
import gleam/io
import gleam/result
import slaw/data/forums.{Forum}
import slaw/templates/forum
import slaw/status

pub fn handler(req: Request(a)) -> Response(BitBuilder) {
  let path =
    req.path
    |> uri.path_segments()

  let [_, slug] = path

  case find_forum(slug) {
    Ok(a) -> {
      let body = bit_builder.from_string(forum.render(a))
      response.new(200)
      |> response.prepend_header("Content-Type", "text/html")
      |> response.set_body(body)
    }
    Error(_) -> status.not_found()
  }
}

fn find_forum(slug: String) -> Result(Forum, Nil) {
  forums.get_forums()
  |> list.find(fn(a) { a.slug == slug })
}
