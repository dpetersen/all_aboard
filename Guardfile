guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { "spec/features" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { [ "spec/features", "spec/api" ] }
  watch(%r{^app/assets/javascripts/.+\.(js|coffee|hbs)$})  { [ "spec/features" ] }
end
