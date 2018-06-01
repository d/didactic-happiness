xargs --verbose --no-run-if-empty -n1 --arg-file ~/src/d/naughty-booleans-sources.txt clang-query-6.0 -f (egrep -v '^//' ~/src/d/naughty-booleans-clang-query.txt | psub)

parallel --no-run-if-empty --keep-order -n1 --arg-file ~/src/d/naughty-booleans-sources.txt clang-query-6.0 --extra-arg="-fcolor-diagnostics" -f (egrep -v '^//' ~/src/d/naughty-booleans-clang-query.txt | psub)