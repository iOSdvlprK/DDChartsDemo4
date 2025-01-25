//
//  MainViewWithTitleAndBorder.swift
//  DDChartsDemo4
//
//  Created by joe on 1/25/25.
//

import SwiftUI

struct MainViewWithTitleAndBorder: View {
    @State var chartItem: ChartItem = .defaultChartItem
    @State var editTitle: Bool = false
    var borderColor: Color {
        .black
        .opacity(chartItem.showBorder ? 1.0 : 0.0)
    }
    
    var body: some View {
        VStack {
            // top buttons
            HStack {
                Button(action: {
                    withAnimation {
                        chartItem.editMode.toggle()
                    }
                }, label: {
                    Image(systemName: chartItem.editMode ? "checkmark" : "square.and.pencil")
                })
                
                if !chartItem.editMode {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            // TODO: sharing
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
            }

            VStack(alignment: chartItem.titleAlignment) {
                if !editTitle {
                    Text(chartItem.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .onTapGesture {
                            editTitle.toggle()
                        }
                } else {
                    TextField(chartItem.title, text: $chartItem.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            editTitle.toggle()
                        }
                }
                
                // buttons and charts
                HStack {
                    // left chart buttons
                    if chartItem.editMode {
                        LeftChartButtonsView(chartItem: $chartItem)
                    }
                    
                    // the chart
                    ContentView(chartItem: $chartItem)
                    
                    // right chart buttons
                    if chartItem.editMode {
                        RightChartButtonsView(chartItem: $chartItem)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderColor)
            )
            .padding()
        }
    }
}

struct MainViewWithTitleAndBorder_Previews: PreviewProvider {
    static var previews: some View {
        MainViewWithTitleAndBorder()
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    MainViewWithTitleAndBorder()
//}
