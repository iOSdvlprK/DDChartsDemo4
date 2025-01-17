//
//  LeftChartButtonsView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/8/25.
//

import SwiftUI

struct LeftChartButtonsView: View {
    @Binding var chartItem: ChartItem
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    chartItem.chartType = .bar
                }
            }, label: {
                Text("BAR")
            })
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    chartItem.chartType = .line
                }
            }, label: {
                Text("LINE")
            })
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    chartItem.chartType = .area
                }
            }, label: {
                Text("AREA")
            })
            
            Spacer()
            
            ColorfulButtonView(
                colors: $chartItem.barColors,
                dim: 30,
                offset: 10,
                action: {}
            )
        }
        .padding()
    }
}

struct LeftChartButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LeftChartButtonsView(chartItem: .constant(.defaultChartItem))
            
            Spacer()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    ChartButtonsView(
//        barColors: .constant(defaultBarColors),
//        chartType: .constant(.bar),
//        isVerticalChart: .constant(true)
//    )
//}
