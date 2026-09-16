require "mkmf"

system("swift build -c release", chdir: __dir__)

swift_lib_dir = File.expand_path(".build/release", __dir__)

RbConfig::MAKEFILE_CONFIG["CC"] = "clang"

$INCFLAGS << " -I#{__dir__}/Sources/CounterShim/include"
$CFLAGS << " -O3 -Wall"
$LDFLAGS << " -Wl,-rpath,#{swift_lib_dir} -L#{swift_lib_dir} -lCounter"

create_makefile("swift_counter/swift_counter")
