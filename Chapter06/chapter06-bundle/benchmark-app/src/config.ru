app = proc do |env|
  Math.sqrt rand
  [200, {}, %w(hello world)]
end

run app
