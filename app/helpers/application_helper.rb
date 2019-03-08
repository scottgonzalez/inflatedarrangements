module ApplicationHelper
  def open_graph(options)
    html = <<-RUBY
      <meta property="og:title" content="#{options[:title]}">
      <meta property="og:description" content="#{options[:description]}">
      <link rel="image_src" href="#{options[:image_url]}">
      <meta property="og:image" content="#{options[:image_url]}">
      <meta property="og:image:width" content="#{options[:image_width]}">
      <meta property="og:image:height" content="#{options[:image_height]}">
    RUBY

    content_for :open_graph, html.html_safe
  end
end
