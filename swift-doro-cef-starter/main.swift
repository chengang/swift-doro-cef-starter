//
//  main.swift
//  swift-doro-cef-starter
//
//  Created by Gang Chen on 2024/11/26.
//

import AppKit

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
