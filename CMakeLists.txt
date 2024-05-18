cmake_minimum_required(VERSION 3.16)

project(Musicplayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Multimedia) # Find Multimedia library in Qt

qt_standard_project_setup()

qt_add_executable(appMusicplayer
    main.cpp
    PlayerController.h PlayerController.cpp
)

qt_add_qml_module(appMusicplayer
    URI Musicplayer
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES AudioInfoBox.qml
        QML_FILES ImageButton.qml

    # Add resources
    RESOURCES
    # Icons
    assets/icons/app_icon.png
    assets/icons/next_icon.png
    assets/icons/pause_icon.png
    assets/icons/play_icon.png
    assets/icons/previous_icon.png
    # Song photo
    assets/images/mozartNachtmusik.jpg
    assets/images/SymphonyNo5.jpg
    # Song gif
    assets/videos/air.mp4
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMusicplayer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMusicplayer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMusicplayer
    PRIVATE Qt6::Quick Qt6::Multimedia # add library "Multimadia" to project
)

include(GNUInstallDirs)
install(TARGETS appMusicplayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
