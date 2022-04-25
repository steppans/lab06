include(InstallRequiredSystemLibraries)
# Name of package
set (CPACK_PACKAGE_NAME "solver")
# Number of version of package
set(_VERSION_MAJOR 1)
set(_VERSION_MINOR 0)
set(_VERSION_PATCH 0)

set(CPACK_PACKAGE_VERSION_MAJOR "${_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${_VERSION_PATCH}")

option(GENERATOR "")

if(${GENERATOR} MATCHES BIN)
        set(CPACK_DEBIAN_PACKAGE_MAINTAINER "steppans")
        install(TARGETS solver DESTINATION bin)
endif()

if(${GENERATOR} MATCHES ARC)
	install(FILES equation.cpp
	              ../formatter_lib/formatter.cpp
		      ../formatter_ex_lib/formatter_ex.cpp
		      ../solver_lib/solver.cpp
		DESTINATION code)
	install(TARGETS formatter_ex solver_lib LIBRARY DESTINATION lib)
endif()

include(CPack)
