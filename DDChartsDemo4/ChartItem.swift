//
//  ChartItem.swift
//  DDChartsDemo4
//
//  Created by joe on 1/15/25.
//

import SwiftUI

struct ChartItem: Identifiable {
    let id = UUID()
    var dailySales: [DailySalesType]
    var barColors: [Color]
    var editMode: Bool
    var selectedDay: String
    var min: Double
    var max: Double
    var title: String
    var titleAlignment: HorizontalAlignment
    var chartType: ChartType
    var isVerticalChart: Bool
    var intMode: Bool
    var lineAreaColor: Color
    
    static let defaultChartItem: ChartItem = .init(
        dailySales: defaultDailySales,
        barColors: defaultBarColors,
        editMode: true,
        selectedDay: "Wed",
        min: 0,
        max: 1000,
        title: "Happy New Year",
        titleAlignment: .leading,
        chartType: .bar,
        isVerticalChart: true,
        intMode: true,
        lineAreaColor: .purple
    )
}
