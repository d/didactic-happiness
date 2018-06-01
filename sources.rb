require 'pathname'
require 'json'

commands = JSON.load(File.read('compile_commands.json'))
gpdb_path = Pathname.new('~/workspace/gpdb').expand_path
initdb = gpdb_path + 'src/bin/initdb'
backend = gpdb_path + 'src/backend'
timezone = gpdb_path + 'src/timezone'
puts commands.select {|c|
  [initdb, backend, timezone].map(&:to_s).any? {|dir|
    (gpdb_path + c['directory']).to_s.start_with?(dir)
  }
}.map { |c|
  (Pathname.new(c['directory']).relative_path_from(gpdb_path) + c['file']).to_s
}.join("\n")
