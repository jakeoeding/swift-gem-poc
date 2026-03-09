require "mkmf"

system("swift build -c release")

swift_lib_dir = File.expand_path(".build/release")

$CFLAGS << " -O3 -Wall"
$LDFLAGS << " -Wl,-rpath,#{swift_lib_dir} -L./.build/release -lCounter"

create_makefile("swift_counter/swift_counter")
