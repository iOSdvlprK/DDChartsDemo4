//
//  ColorfulButtonView.swift
//  DDExploringCharts
//
//  Created by joe on 12/22/24.
//

import SwiftUI

struct ColorfulButtonView: View {
    @Binding var chartItem: ChartItem
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void
    
    @State private var flip: Bool = false
    
    var count: CGFloat {
        CGFloat(chartItem.barColors.count)
    }
    var factor: CGFloat {
        (dim - offset) / count
    }
    var lastColor: Color {
        chartItem.barColors.last ?? .black
    }
    
    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i) + offset
    }
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i + 1) + offset
    }
    
    var body: some View {
        ZStack {
            if chartItem.chartType == .bar {
                ForEach(0 ..< chartItem.barColors.count, id: \.self) { i in
                    RandomArcFromColorListView(
                        colors: chartItem.barColors,
                        index: i,
                        minRadius: minRadius(i: i, offset: offset),
                        maxRadius: maxRadius(i: i, offset: offset),
                        opacity: 0.9
                    )
                }
                
                Circle()
                    .stroke(lastColor, lineWidth: factor)
                    .frame(width: dim, height: dim)
            } else {
                Circle()
                    .fill(chartItem.lineAreaColor.gradient)
                    .frame(width: dim, height: dim)
            }
        }
        .rotation3DEffect(flip ? .zero : .degrees(180), axis: (x:
                .random(in: -1...1), y: .random(in: -1...1), z: 0))
        .onTapGesture {
            if chartItem.chartType == .bar {
                chartItem.barColors = Color.randomColorsN(n: chartItem.barColors.count)
            } else {
                chartItem.lineAreaColor = Color.random(colorList: colorsForLineAndArea)
            }
            
            withAnimation {
                flip.toggle()
            }
            
            // call action
            action()
        }
    }
}

#Preview {
    ColorfulButtonView(
        chartItem: .constant(.defaultChartItem),
        dim: 40,
        offset: 10,
        action: {}
    )
}
