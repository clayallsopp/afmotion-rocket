unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'afmotion-rocket/**/*.rb')).each { |file|
    app.files << file
  }

  app.pods do
    pod 'AFRocketClient', podspec: 'https://raw.github.com/usepropeller/AFRocketClient/master/AFRocketClient.podspec'
  end
end
