//
//  SwiftUIWebinarApp.swift
//  SwiftUIWebinar
//
//  Created by user on 09.04.2021.
//

import SwiftUI

@main
struct SwiftUIWebinarApp: App {
    let channelData = ChannelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(channelData)
        }
    }
}
