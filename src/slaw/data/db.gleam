import gleam/pgo

pub fn connect() -> pgo.Connection {
  let db =
    pgo.connect(
      pgo.Config(..pgo.default_config(), host: "localhost", database: "slaw"),
    )
  db
}
