# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(common_options INTERFACE)
add_library(desktop-app::common_options ALIAS common_options)

target_compile_features(common_options
INTERFACE
    cxx_std_17
)

target_compile_definitions(common_options
INTERFACE
    UNICODE
    _UNICODE
    $<IF:$<CONFIG:Debug>,_DEBUG,NDEBUG>
)

if (DESKTOP_APP_DISABLE_CRASH_REPORTS)
    target_compile_definitions(common_options
    INTERFACE
        DESKTOP_APP_DISABLE_CRASH_REPORTS
    )
endif()

if (WIN32)
    include(cmake/options_win.cmake)
elseif(APPLE)
    include(cmake/options_mac.cmake)
elseif(LINUX)
    include(cmake/options_linux.cmake)
else()
    message(FATAL_ERROR "Unknown platform type")
endif()