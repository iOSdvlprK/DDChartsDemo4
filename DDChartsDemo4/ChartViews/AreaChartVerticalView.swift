//
//  AreaChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct AreaChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                AreaMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    AreaChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
}
