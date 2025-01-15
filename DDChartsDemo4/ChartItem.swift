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
}
