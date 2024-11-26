//
//  AppDelegate.swift
//  swift-doro-cef-starter
//
//  Created by Gang Chen on 2024/11/26.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    let viewController = ViewController()
    let windowController = WindowController()

    var customMenu: NSMenu {
        let appMenu = NSMenuItem()
        appMenu.submenu = NSMenu()
        let appName = ProcessInfo.processInfo.processName
        appMenu.submenu?.addItem(NSMenuItem(title: String(localized: "About \(appName)"),
                                            action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: ""))
        appMenu.submenu?.addItem(NSMenuItem.separator())
        appMenu.submenu?.addItem(NSMenuItem(title: String(localized: "Quit \(appName)"),
                                            action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        let menu = NSMenu(title: String(localized: "Main Menu"))
        menu.addItem(appMenu)
        return menu
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        NSApplication.shared.mainMenu = customMenu
        windowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationShouldAutomaticallyLocalizeKeyEquivalents(_ application: NSApplication) -> Bool {
        return true
    }


}

