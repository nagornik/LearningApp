//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Anton Nagornyi on 01.05.2022.
//

import SwiftUI

@main
struct Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
