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
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
add_library(echo SHARED ${SOURCE_FILES})
