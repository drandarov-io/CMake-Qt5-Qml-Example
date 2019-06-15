## CMAKE ##
cmake_minimum_required(VERSION 3.10.2)
set(CMAKE_CXX_STANDARD 17)

# Set CMake flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS} -Wall -std=c++11 -fstrict-aliasing -pedantic-errors -pedantic -Wno-deprecated-declarations -Wno-unused-variable")

# Set source directory
set(CMAKE_CURRENT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Set prefix path
set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu")

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)
# Create code from a list of Qt designer ui files
set(CMAKE_AUTOUIC ON)
# Set CMake Rcc
set(CMAKE_AUTORCC ON)



## PROJECT ##
project(CMake-Qt5-Qml-Example)

# OpenCV Qt5
find_package(OpenCV 4.1.0 REQUIRED)
find_package(Qt5 COMPONENTS Core Gui Widgets Test Concurrent OpenGL Qml Quick REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS} ${Qt5Widgets_INCLUDE_DIRS} ${QtQml_INCLUDE_DIRS})
add_definitions(${Qt5Widgets_DEFINITIONS} ${QtQml_DEFINITIONS} ${${Qt5Quick_DEFINITIONS}})

qt5_add_resources(QT_RESOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../resources/qml.qrc)



## SOURCES ##
if(NOT DEFINED HEADERS)
    file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
endif()

if(NOT DEFINED SOURCES)
    file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
endif()

source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})

add_executable(${CMAKE_PROJECT_NAME} ${HEADERS} ${SOURCES} ${QT_RESOURCES})

target_link_libraries(${CMAKE_PROJECT_NAME}
        ${OpenCV_LIBS}
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
        Qt5::Test
        Qt5::Concurrent
        Qt5::OpenGL
        Qt5::Qml
        Qt5::Quick)