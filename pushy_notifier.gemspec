# frozen_string_literal: true

require_relative "lib/pushy_notifier/version"

Gem::Specification.new do |spec|
  spec.name = "pushy_notifier"
  spec.version = PushyNotifier::VERSION
  spec.authors = ["Your Name"]
  spec.email = ["your.email@example.com"]

  spec.summary = "A Ruby gem for push notifications using Pushy."
  spec.description = "This gem provides a simple interface to send push notifications via the Pushy service."
  spec.homepage = "https://your-gem-website.com"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://gem-server.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/your-username/your-gem-repo"
  spec.metadata["changelog_uri"] = "https://github.com/your-username/your-gem-repo/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment and modify the following line to add gem dependencies
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
