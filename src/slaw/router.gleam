import gleam/http/request.{Request}
import gleam/string
import gleam/list
import slaw/routes/root
import slaw/routes/assets
import slaw/routes/forum
import slaw/status

pub fn router(req: Request(a)) {
  // turn the path we get into a list and clean it up a bit
  let deconstructed_path =
    string.split(req.path, on: "/")
    |> list.drop(1)

  // change route based on our path
  case deconstructed_path {
    [""] -> root.handler()
    ["assets", ..] -> assets.handler(req)
    ["forum", ..] -> forum.handler(req)
    // 404 if the path requested doesn't exist in our router
    _other -> status.not_found()
  }
}
