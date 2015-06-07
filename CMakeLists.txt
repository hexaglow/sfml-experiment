cmake_minimum_required(VERSION 2.6)
set(Name SFMLTest)
include(ExternalProject)
project(${Name})

set(SFML_ROOT "${CMAKE_BINARY_DIR}/SFML")
set(CMAKE_INSTALL_PREFIX ${SFML_ROOT})
message("SFML will be installed into ${SFML_ROOT}")
ExternalProject_Add(sfml
	GIT_REPOSITORY https://github.com/LaurentGomila/SFML.git
	GIT_TAG 2.3
	CMAKE_ARGS -DBUILD_SHARED_LIBS=NO -DCMAKE_INSTALL_PREFIX=${SFML_ROOT}
)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake" ${CMAKE_MODULE_PATH})
set(SFML_STATIC_LIBRARIES TRUE)
find_package(SFML
	COMPONENTS system graphics window network audio
)

if(SFML_FOUND)
	set(SourcePath "${CMAKE_SOURCE_DIR}/Source/")
	file(GLOB SourceFiles "${SourcePath}/*.cpp")
	add_executable(${Name} ${SourceFiles})
	add_dependencies(${Name} sfml)

	include_directories(${SFML_INCLUDE_DIR})
	target_link_libraries(${Name} ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})
else()
	message("SFML not found - build it, then re-run cmake")
endif()