require 'haml'
require 'haml/exec'

namespace :haml do
  task :convert do
    Dir.glob("app/views/**/*.html.erb").each do |html|
      puts html + "..."
      Haml::Exec::HTML2Haml.new([html, html.gsub(".html.erb", ".haml")]).process_result
      File.delete(html)
    end
  end
end

