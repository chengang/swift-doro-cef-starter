//
//  WindowController.swift
//  swift-doro-cef-starter
//
//  Created by Gang Chen on 2024/11/26.
//

import AppKit

class WindowController: NSWindowController {

    internal var defaultWindowSize = NSSize(width: 800, height: 600)

    convenience init() {
        self.init(windowNibName: "")
    }

    // Offical ref: https://developer.apple.com/documentation/appkit/nswindowcontroller/1535593-window
    // If the window was loaded,
    // the following methods are called in order:
    // windowWillLoad(), loadWindow(), and windowDidLoad().

    override func windowWillLoad() {
        super.windowWillLoad()
    }

    override func loadWindow() {
        var rect: NSRect = .zero
        if let screenSize = NSScreen.main?.visibleFrame.size {
            defaultWindowSize = NSSize(width: screenSize.width*0.85, height: screenSize.height*0.85)
            rect = NSMakeRect(
                screenSize.width/2 - defaultWindowSize.width/2,
                screenSize.height/2 - defaultWindowSize.height/2,
                defaultWindowSize.width,
                defaultWindowSize.height)
        }

        self.window = NSWindow(
            contentRect: rect,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: true)
        self.window?.contentMinSize = NSSize(width: 800, height: 600)
        self.window?.isMovableByWindowBackground = true
        self.window?.tabbingMode = .preferred
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        self.window?.contentViewController = (NSApplication.shared.delegate as! AppDelegate).viewController
        self.window?.setFrameAutosaveName("com.yikuyiku.swift.programmaticMacAppStarter")

        self.window?.title = ProcessInfo.processInfo.processName
        self.window?.titlebarAppearsTransparent = false
        self.window?.contentView?.wantsLayer = true
        //self.window?.titlebarSeparatorStyle = .none
        self.window?.titleVisibility = .hidden
        self.window?.toolbarStyle = .unified
        self.window?.toolbar = NSToolbar()
        self.window?.setContentSize(self.defaultWindowSize)
    }
}
