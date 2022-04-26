import gleam/io
import gleam/string
import gleam/int
import gleam/http/elli
import gleam/erlang/os
import slaw/router.{router}
import slaw/data/db

const version = "0.1"

pub fn main() {
  let port = case os.get_env("PORT") {
    Error(_) -> 3000
    Ok(i) -> {
      // crash if it ain't a number
      assert Ok(i) = int.parse(i)
      i
    }
  }

  let db = db.connect()

  // there are probably better ways to do this
  io.println(string.concat(["slaw ", version]))
  io.println(string.concat(["servin' on port ", int.to_string(port), " !!!"]))

  case elli.become(router, on_port: port) {
    i -> io.debug(i)
  }
  //TODO: slightly less terrible error handling
}
