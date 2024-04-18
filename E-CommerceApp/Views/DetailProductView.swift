//
//  DetailProductView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 06/04/2024.
//

import SwiftUI

struct DetailProductView: View {
    @State private var isExpanded:Bool =  false
    @State private var sizeIndex:Int = 3
    let sizeList = [40,41,42,43,44]
    let title:String
    let price:Int
    let description:String
    let image:[String]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: image[0])) { img in
                            img
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    VStack(alignment: .leading,spacing: 10){
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("5.0").fontWeight(.bold)
                            Text("(42 REVIEWS)")
                                .kerning(1)
                        }
                        .font(.caption)
                        HStack{
                            Text(title)
                                .font(.title3)
                                .fontWeight(.black)
                            Spacer()
                            Image(systemName: "link")
                                .foregroundStyle(.blue)
                        }
                        Text("DESCRIPTION :")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text(description)
                            .font(.caption)
                            .kerning(1)
                            .lineLimit(isExpanded ? nil : 2)
                            .overlay (
                                GeometryReader { proxy in
                                    Button(action: {
                                        isExpanded.toggle()
                                    }) {
                                        Text(isExpanded ? "less" : "Read more")
                                            .font(.caption).bold()
                                            .padding(.leading, 8.0)
                                            .padding(.top, 4.0)
                                            .background(Color.white)
                                            .foregroundStyle(.black)
                                    }
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                                }
                            )
                        Text("SIZE :")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        HStack {
                            ForEach(sizeList,id: \.self){ size in
                                Text("\(size)")
                                    .foregroundStyle(sizeIndex == size ? .white : .black)
                                    .padding()
                                    .background(sizeIndex == size ? Color.cyan : Color.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(6)
                                    .font(.caption)
                                    .onTapGesture {
                                        sizeIndex = size
                                    }
                            }
                        }
                        //MARK: Add to cart button
                        ZStack {
                            Capsule()
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            HStack{
                                VStack{
                                    Text("Price")
                                        .foregroundStyle(.white.opacity(0.8))
                                        .fontWeight(.bold)
                                        .font(.caption)
                                    HStack(spacing:0){
                                        Text("$")
                                        Text("\(price)")
                                    }
                                    .foregroundStyle(.white)
                                    .fontWeight(.black)
                                    .font(.title3)
                                }
                                .padding()
                                Spacer()
                                    Button{
                                        
                                    }label: {
                                        ZStack {
                                            Capsule()
                                                .foregroundStyle(.cyan)
                                            .frame(width:145,height: 40)
                                            Text("ADD TO CART")
                                                .foregroundStyle(.white)
                                                .font(.subheadline)
                                                .fontWeight(.heavy)
                                        }
                                    }
                            }
                        }
                        //
                    }
                }.padding()
            }
            .navigationTitle("ORDER DETAILS")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    
                }label: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                        .font(.caption)
                }
            }
        })
    }
}

#Preview {
    DetailProductView(title: "Nike Air Max", price: 0, description: "svdsnvnasdv",
                      image: ["collection1"])
}
