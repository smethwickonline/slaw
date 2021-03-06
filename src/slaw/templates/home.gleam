// DO NOT EDIT: Code generated by matcha from home.matcha

import gleam/string_builder.{StringBuilder}
import gleam/list

import slaw/templates/head
import slaw/templates/header
import slaw/data/forums.{Forum}
import gleam/option

pub fn render_builder(name name: String, forums forums: List(Forum)) -> StringBuilder {
    let builder = string_builder.from_string("")
    let builder = string_builder.append(builder, "<!DOCTYPE html>
<html>

")
    let builder = string_builder.append(builder, head.render("slaw"))
    let builder = string_builder.append(builder, "

<body>
    <!-- TODO: This renders the header template each time the page is loaded, 
        instead of just baking its contents right into the home template,
        which is worse?? i think??? -->
        ")
    let builder = string_builder.append(builder, header.render())
    let builder = string_builder.append(builder, "

    <main class=\"narrow\">
                <h1>🍃 hey ")
    let builder = string_builder.append(builder, name)
    let builder = string_builder.append(builder, "!</h1>

                                <div class=\"forums\">
        ")
    let builder = list.fold(forums, builder, fn(builder, forum) {
            let builder = string_builder.append(builder, "
        <a class=\"forum-link\" href=\"/forum/")
    let builder = string_builder.append(builder, forum.slug)
    let builder = string_builder.append(builder, "\">
            ")
    let builder = case option.is_some(forum.image) {
        True -> {
                let builder = string_builder.append(builder, "
            <img src='")
    let builder = string_builder.append(builder, option.unwrap(forum.image, "/assets/placeholder.jpg"))
    let builder = string_builder.append(builder, "' alt=\"")
    let builder = string_builder.append(builder, forum.name)
    let builder = string_builder.append(builder, " header image\" />
            ")

            builder
        }
        False -> {
            
            builder
        }
}
    let builder = string_builder.append(builder, "
            <div class=\"forum\">
                <h3>")
    let builder = string_builder.append(builder, forum.name)
    let builder = string_builder.append(builder, "</h3>
                <p>")
    let builder = string_builder.append(builder, forum.description)
    let builder = string_builder.append(builder, "</p>
            </div>
        </a>
        ")

        builder
})
    let builder = string_builder.append(builder, "
        </div>
    </main>
</body>

</html>")

    builder
}

pub fn render(name name: String, forums forums: List(Forum)) -> String {
    string_builder.to_string(render_builder(name: name, forums: forums))
}
