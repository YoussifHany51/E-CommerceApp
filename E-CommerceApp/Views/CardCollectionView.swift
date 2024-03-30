//
//  CardCollectionView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 30/03/2024.
//

import SwiftUI

struct CardCollectionView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: true){
            HStack(alignment:.center) {
                ForEach(1..<5){ i in
                    CardView(img: "collection\(i)").padding(6).frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .containerRelativeFrame(.horizontal, alignment: .center)
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
        .contentMargins(10, for: .scrollContent)
        .listRowInsets(EdgeInsets())
    }
}

#Preview {
    CardCollectionView()
}

struct CardView : View{
    var img = ""
    var body: some View{
        VStack{
            Image(img)
                .resizable()
                .scaledToFill()
        }
        .frame(width: 350,height: 130)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
