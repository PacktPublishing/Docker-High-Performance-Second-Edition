app = proc do |env|
  # Edit the "hello world" string to update the application.
  [200, {}, %w(hello world)]
end
