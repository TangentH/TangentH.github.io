# Only a title and body text are required. Validate optional fields when supplied.
require "yaml"
require "date"
root = File.expand_path("..", __dir__)
errors = []
%w[_projects _experience _publications].each do |folder|
  Dir.glob(File.join(root, folder, "*.md")).sort.each do |path|
    name = path.delete_prefix(root + "/")
    begin
      text = File.read(path, encoding: "UTF-8")
      parts = text.match(/\A---[ \t]*\r?\n(.*?)\r?\n---[ \t]*(?:\r?\n|\z)(.*)\z/m)
      raise 'start the file with --- lines enclosing title: "Your title"' unless parts
      data = YAML.safe_load(parts[1], permitted_classes: [Date], aliases: false) || {}
      raise "metadata must contain named fields such as title" unless data.is_a?(Hash)
      raise "title must be nonempty text" unless data["title"].is_a?(String) && !data["title"].strip.empty?
      if !data["order"].nil? && !data["order"].is_a?(Integer)
        raise "order is optional; when supplied, use an integer"
      end
      raise "visible must be true or false" unless [true, false, nil].include?(data["visible"])
      raise "add a short description below the closing --- line" if parts[2].strip.empty?
      if data["image"]
        raise "image must be a local path starting with /" unless data["image"].is_a?(String) && data["image"].match?(%r{\A/(?!/)})
        raise "image file does not exist" unless File.file?(File.join(root, data["image"]))
      end
      links = data["links"] || []
      raise "links must be a list when supplied" unless links.is_a?(Array)
      links.each do |link|
        raise "each link needs a label and url" unless link.is_a?(Hash)
        raise "each link needs a label" if link["label"].to_s.strip.empty?
        raise "link URL must start with https://, http:// or /" unless link["url"].to_s.match?(%r{\A(?:https?://|/(?!/))})
      end
    rescue StandardError => e
      errors << "#{name}: #{e.message}"
    end
  end
end
abort errors.join("\n") unless errors.empty?
puts "Content metadata is valid."
