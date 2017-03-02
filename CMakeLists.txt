cmake_minimum_required(VERSION 3.5)
project(Echo_Server)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        src/Condition.cc
        src/Exception.cc
        src/InetAddress.cc
        src/PollPoller.cc
        src/Rio.cc
        src/Socket.cc
        src/TcpConnection.cc
        src/TcpServer.cc
        src/Thread.cc
        src/ThreadPool.cc
        src/Timer.cc
        src/TimerThread.cc)

INCLUDE_DIRECTORIES(include)
LINK_LIBRARIES(pthread)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
add_library(echo SHARED ${SOURCE_FILES})

install(TARGETS echo
        LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION ${CMAKE_INSTALL_PREFIX}/include/echo
        FILES_MATCHING PATTERN "*.h")