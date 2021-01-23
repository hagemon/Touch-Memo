//
//  PreferencesWindow.swift
//  Touch Memo
//
//  Created by 一折 on 2021/1/11.
//

import Cocoa
import HotKey

class PreferencesWindow: NSWindow {

    @IBOutlet weak var textField: NSTextField!
    var keyListener: Any?
    
    override func awakeFromNib() {
        self.textField.placeholderString = Storage.getModifierFlags().description+Storage.getKey().description
        self.keyListener = NSEvent.addLocalMonitorForEvents(matching: .keyDown, handler: {
            event in
            if !event.modifierFlags.isEmpty{
                self.textField.stringValue = event.modifierFlags.description+event.charactersIgnoringModifiers!
                KeyManager.shared.register(
                    key: Key(carbonKeyCode: UInt32(event.keyCode))!,
                    modifiers: event.modifierFlags
                )
            }
            return nil
        })
        self.level = .normal
        super.awakeFromNib()
        KeyManager.shared.pauseHotKey()
    }
    
    override func close() {
        KeyManager.shared.resignHotKey()
        if self.keyListener != nil {
            NSEvent.removeMonitor(self.keyListener!)
        }
        super.close()
    }
    
}