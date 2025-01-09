//
//  TitleAlignmentButton.swift
//  DDChartsDemo4
//
//  Created by joe on 1/9/25.
//

import SwiftUI

struct TitleAlignmentButton: View {
    @Binding var titleAlignment: HorizontalAlignment
    
    var body: some View {
        VStack(spacing: 0) {
            SimpleTitleButtonView(
                titleAlignment: $titleAlignment,
                myAlignment: .leading,
                iconName: "align.horizontal.left.fill"
            )
            SimpleTitleButtonView(
                titleAlignment: $titleAlignment,
                myAlignment: .center,
                iconName: "align.horizontal.center.fill"
            )
            SimpleTitleButtonView(
                titleAlignment: $titleAlignment,
                myAlignment: .trailing,
                iconName: "align.horizontal.right.fill"
            )
        }
        .padding(5)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 0.3)
        }
    }
}

struct TitleAlignmentButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
            
            TitleAlignmentButton(titleAlignment: .constant(.center))
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    TitleAlignmentButton(titleAlignment: .constant(.center))
//}
