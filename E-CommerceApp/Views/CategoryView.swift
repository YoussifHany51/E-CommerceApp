//
//  CategoryView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 01/04/2024.
//

import SwiftUI

struct CategoryView: View {
    var image = "collection1"
    var title = "men"
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<4){ cat in
                        VStack {
                            VStack{
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(6)
                            Text(title).textCase(.uppercase).fontWeight(.medium)
                        }
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    CategoryView()
}
