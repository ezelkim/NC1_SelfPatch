//
//  UUIApp.swift
//  UUI
//
//  Created by Kim minju  on 4/15/24.
//

import SwiftUI

@main

struct UUIApp: App {
    let dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            // TODO: Environment Obj를 넘겨 주는 방법 찾아서 적용
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
