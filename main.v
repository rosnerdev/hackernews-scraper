import net.html
import net.http

fn main() {
    content := http.get_text("https://news.ycombinator.com/")

	mut parsed_content := html.parse(content)

	articles := parsed_content.get_tag_by_attribute_value("class", "athing")

	for article in articles {
		for titleline in article.get_tags_by_attribute_value("class", "titleline") {
			a_tag := titleline.get_tags("a")[0]

			title := a_tag.content
			href := a_tag.attributes["href"]

			println("\033[36m$title - \033[32m$href\n\033[31m")
		}
	}
}