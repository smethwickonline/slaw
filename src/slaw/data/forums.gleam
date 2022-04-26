import slaw/data/threads.{Thread}

pub type Forum {
  Forum(name: String, description: String, image: String, threads: List(Thread))
}
