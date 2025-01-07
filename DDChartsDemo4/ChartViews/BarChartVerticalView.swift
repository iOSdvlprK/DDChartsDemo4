//
//  BarChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
                .foregroundStyle(by: .value("Day", item.day))
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    BarChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
}
