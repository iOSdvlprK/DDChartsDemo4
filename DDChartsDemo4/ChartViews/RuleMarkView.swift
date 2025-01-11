//
//  RuleMarkView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/11/25.
//

import SwiftUI
import Charts

struct RuleMarkView: ChartContent {
    let selectedDay: String
    let salesOnSelectedDay: Double
    let intMode: Bool
    var precision: Int {
        intMode ? 0 : 1
    }
    
    let lineColor = Color.red
    
    var specifier: String {
        "%.\(precision)f"
    }
    
    var body: some ChartContent {
        RuleMark(y: .value("Sales", salesOnSelectedDay))
            .foregroundStyle(lineColor)
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
            .annotation(position: .topTrailing, alignment: .topTrailing, spacing: 0) {
                Text("\(salesOnSelectedDay, specifier: specifier)")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
    }
}
