//
//  KeyManager.swift
//  Touch Memo
//
//  Created by 一折 on 2021/1/11.
//

import Cocoa
import HotKey

class KeyManager: NSObject {
    static let shared = KeyManager()
    var hotKey :HotKey?
    
    func register(key:Key, modifiers: NSEvent.ModifierFlags) {
        self.hotKey = HotKey(key: key, modifiers: modifiers, keyDownHandler: {
            MemoManager.shared.postMemo()
        })
        Storage.saveKey(key: key)
        Storage.saveModifierFlags(modifiers: modifiers)
    }
    
    func pauseHotKey() {
        guard let hotKey = self.hotKey else {
            print("Could not get hotkey in KeyManager.hotKey")
            return
        }
        hotKey.isPaused = true
    }
    
    func resignHotKey() {
        guard let hotKey = self.hotKey else {
            print("Could not get hotkey in KeyManager.hotKey")
            return
        }
        hotKey.isPaused = false
    }
    
}
