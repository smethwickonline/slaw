import slaw/data/users.{User}

pub type Post {
  Post(content: String, owner: User)
}
