
resource "aws_dynamodb_table_item" "author_cory_house" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "cory-house" }
    firstName = { "S": "Cory" }
    lastName  = { "S": "House" }
  })
}


resource "aws_dynamodb_table_item" "author_dan_abramov" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "dan-abramov" }
    firstName = { "S": "Dan" }
    lastName  = { "S": "Abramov" }
  })
}


resource "aws_dynamodb_table_item" "author_kent_dodds" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "kent-dodds" }
    firstName = { "S": "Kent" }
    lastName  = { "S": "Dodds" }
  })
}


resource "aws_dynamodb_table_item" "author_sarah_drasner" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "sarah-drasner" }
    firstName = { "S": "Sarah" }
    lastName  = { "S": "Drasner" }
  })
}


resource "aws_dynamodb_table_item" "author_max_stoiber" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "max-stoiber" }
    firstName = { "S": "Max" }
    lastName  = { "S": "Stoiber" }
  })
}


resource "aws_dynamodb_table_item" "author_ryan_florence" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "ryan-florence" }
    firstName = { "S": "Ryan" }
    lastName  = { "S": "Florence" }
  })
}


resource "aws_dynamodb_table_item" "author_michael_jackson" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "michael-jackson" }
    firstName = { "S": "Michael" }
    lastName  = { "S": "Jackson" }
  })
}


resource "aws_dynamodb_table_item" "author_rich_harris" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "rich-harris" }
    firstName = { "S": "Rich" }
    lastName  = { "S": "Harris" }
  })
}


resource "aws_dynamodb_table_item" "author_wes_bos" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "wes-bos" }
    firstName = { "S": "Wes" }
    lastName  = { "S": "Bos" }
  })
}


resource "aws_dynamodb_table_item" "author_addy_osmani" {
  table_name = module.table_authors.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "addy-osmani" }
    firstName = { "S": "Addy" }
    lastName  = { "S": "Osmani" }
  })
}


resource "aws_dynamodb_table_item" "course_react_in_depth" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "react-in-depth" }
    title     = { "S": "React in Depth" }
    authorId  = { "S": "cory-house" }
    length    = { "S": "4:30" }
    category  = { "S": "React" }
    watchHref = { "S": "http://www.pluralsight.com/courses/react-in-depth" }
  })
}


resource "aws_dynamodb_table_item" "course_advanced_redux_patterns" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "advanced-redux-patterns" }
    title     = { "S": "Advanced Redux Patterns" }
    authorId  = { "S": "dan-abramov" }
    length    = { "S": "3:45" }
    category  = { "S": "Redux" }
    watchHref = { "S": "http://www.pluralsight.com/courses/advanced-redux-patterns" }
  })
}


resource "aws_dynamodb_table_item" "course_testing_react_apps" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "testing-react-apps" }
    title     = { "S": "Testing React Apps" }
    authorId  = { "S": "kent-dodds" }
    length    = { "S": "2:30" }
    category  = { "S": "Testing" }
    watchHref = { "S": "http://www.pluralsight.com/courses/testing-react-apps" }
  })
}


resource "aws_dynamodb_table_item" "course_creative_svg_with_css" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "creative-svg-with-css" }
    title     = { "S": "Creative SVG with CSS" }
    authorId  = { "S": "sarah-drasner" }
    length    = { "S": "3:20" }
    category  = { "S": "CSS" }
    watchHref = { "S": "http://www.pluralsight.com/courses/creative-svg-with-css" }
  })
}


resource "aws_dynamodb_table_item" "course_styled_components_mastery" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "styled-components-mastery" }
    title     = { "S": "Styled Components Mastery" }
    authorId  = { "S": "max-stoiber" }
    length    = { "S": "2:50" }
    category  = { "S": "CSS-in-JS" }
    watchHref = { "S": "http://www.pluralsight.com/courses/styled-components-mastery" }
  })
}


resource "aws_dynamodb_table_item" "course_remix_essentials" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "remix-essentials" }
    title     = { "S": "Remix Essentials" }
    authorId  = { "S": "ryan-florence" }
    length    = { "S": "2:45" }
    category  = { "S": "Remix" }
    watchHref = { "S": "http://www.pluralsight.com/courses/remix-essentials" }
  })
}


resource "aws_dynamodb_table_item" "course_react_router_deep_dive" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "react-router-deep-dive" }
    title     = { "S": "React Router Deep Dive" }
    authorId  = { "S": "michael-jackson" }
    length    = { "S": "3:10" }
    category  = { "S": "Routing" }
    watchHref = { "S": "http://www.pluralsight.com/courses/react-router-deep-dive" }
  })
}


resource "aws_dynamodb_table_item" "course_svelte_fundamentals" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "svelte-fundamentals" }
    title     = { "S": "Svelte Fundamentals" }
    authorId  = { "S": "rich-harris" }
    length    = { "S": "2:40" }
    category  = { "S": "Svelte" }
    watchHref = { "S": "http://www.pluralsight.com/courses/svelte-fundamentals" }
  })
}


resource "aws_dynamodb_table_item" "course_beginner_javascript" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "beginner-javascript" }
    title     = { "S": "Beginner JavaScript" }
    authorId  = { "S": "wes-bos" }
    length    = { "S": "5:00" }
    category  = { "S": "JavaScript" }
    watchHref = { "S": "http://www.pluralsight.com/courses/beginner-javascript" }
  })
}


resource "aws_dynamodb_table_item" "course_performance_budgeting" {
  table_name = module.table_courses.this_dynamodb_table_name
  hash_key   = "id"

  item = jsonencode({
    id        = { "S": "performance-budgeting" }
    title     = { "S": "Performance Budgeting" }
    authorId  = { "S": "addy-osmani" }
    length    = { "S": "2:35" }
    category  = { "S": "Performance" }
    watchHref = { "S": "http://www.pluralsight.com/courses/performance-budgeting" }
  })
}
