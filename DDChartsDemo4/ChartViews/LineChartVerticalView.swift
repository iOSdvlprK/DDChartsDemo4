//
//  LineChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    LineChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
}
