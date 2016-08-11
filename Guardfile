guard :minitest do
  watch(%r{^test\/.*_test\.rb$})
  watch(%r{^app\/(.*)\/(.*)\/(.*)\.rb$})  { |m| "test/#{m[1]}/#{m[2]}/#{m[3]}_test.rb" }
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  watch(%r{^test/support/.*\.rb$})  { 'test' }
end
