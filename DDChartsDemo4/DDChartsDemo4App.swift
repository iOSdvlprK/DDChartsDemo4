//
//  DDChartsDemo4App.swift
//  DDChartsDemo4
//
//  Created by joe on 1/7/25.
//

import SwiftUI

@main
struct DDChartsDemo4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                dailySales: defaultDailySales,
                min: 0.0,
                max: 700.0,
                barColors: defaultBarColors
            )
        }
    }
}
