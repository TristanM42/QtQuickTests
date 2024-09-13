cmake_minimum_required(VERSION 3.16)

project(QtQuickTests VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Widgets)
# target_link_libraries(mytarget PRIVATE Qt6::Widgets)

qt_add_executable(appQtQuickTests
    main.cpp
    dialog.cpp
    dialog.h
)

qt_add_qml_module(appQtQuickTests
    URI QtQuickTests
    VERSION 1.0
    QML_FILES
        main.qml
        ContainerPage.qml
        TabBarPage.qml
        ScrollViewPage.qml
        StackViewPage.qml
        PaneToolBarPage.qml
        SplitViewPage.qml
        CustomButton.qml
        RowWithEvenSpacing.qml
    QML_FILES SomePage.qml
SOURCES dialog.h dialog.cpp
)

set_target_properties(appQtQuickTests PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQuickTests
    PRIVATE Qt6::Quick)

install(TARGETS appQtQuickTests
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
