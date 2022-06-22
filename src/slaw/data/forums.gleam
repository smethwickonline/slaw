import slaw/data/threads.{Thread}
import gleam/option.{None, Option, Some}

pub type Forum {
  Forum(
    slug: String,
    name: String,
    description: String,
    image: Option(String),
    threads: Option(List(Thread)),
  )
}

pub fn get_forums() -> List(Forum) {
  [
    Forum(
      slug: "test",
      name: "test forum",
      description: "a test forum (for testing purposes)",
      image: Some(
        "https://images.unsplash.com/photo-1578926078693-4eb3d4499e43?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=808&q=80",
      ),
      threads: None,
    ),
    Forum(
      slug: "another",
      name: "another test forum",
      description: "two of them ?!?!?!?",
      image: None,
      threads: None,
    ),
    Forum(
      slug: "chat",
      name: "medley",
      description: "off topic chat and such",
      image: None,
      threads: None,
    ),
  ]
}
