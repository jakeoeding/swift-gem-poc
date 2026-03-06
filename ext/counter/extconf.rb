require "mkmf"

system("swift build -c release --static-swift-stdlib")

$CFLAGS << " -O3 -Wall"
$LDFLAGS << " ./.build/release/libCounter.a"

create_makefile("counter/counter")
