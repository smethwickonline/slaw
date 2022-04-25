import gleam/io
import gleam/string
import gleam/int
import gleam/http/elli
import slaw/router.{router}

const version = "0.1"

const port = 3000

pub fn main() {
  // there are probably better ways to do this
  io.println(string.concat(["slaw ", version]))
  io.println(string.concat(["servin' on port ", int.to_string(port), " !!!"]))

  elli.become(router, on_port: port)
}
