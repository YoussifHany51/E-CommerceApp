//
//  AllProductsView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 04/04/2024.
//

import SwiftUI

struct AllProductsView: View {
    @ObservedObject var viewModel = ECommerceViewModel()
    @State var viewMoreButton:Bool = true
    @State var isFavButton:Bool = false
    private let columns = [GridItem(.adaptive(minimum: 170))]
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text("ALL ITEMS")
                        .fontWeight(.heavy)
                    Spacer()
                    Button{
                        viewMoreButton.toggle()
                    }label: {
                        Text("VIEW MORE")
                            .font(.caption2)
                            .foregroundStyle(.blue)
                    }
                }.padding()
                LazyVGrid(columns: columns) {
                    //display products / 8 
                    ForEach(viewMoreButton ? viewModel.products[0..<viewModel.products.count / 8]:viewModel.products[0..<viewModel.products.count]){ product in
                        VStack(alignment:.leading) {
                                    HStack{
                                        AsyncImage(url: URL(string: product.images[0])) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 111, height: 111)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        }
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(6)
                            
                            HStack{
                                VStack{
                                    Text(product.title).fontWeight(.heavy)
                                    Text("\(product.price)").font(.caption2)
                                }
                                Spacer()
                                Button{
                                    isFavButton.toggle()
                                }label: {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(isFavButton ? .red :.gray)
                                }
                            }.padding()
                        }
                    }
                }
            }
            .task{
                do{
                    viewModel.products = try await viewModel.getProductsData()
                }catch APIError.invalidURL{
                    print("Invalid URL")
                }catch APIError.invalidData{
                    print("Invalid Data")
                }catch APIError.invalidResponse{
                    print("Invalid Response")
                }catch{
                    print("Unexcpected Error")
                }
            }
        }
    }
}

#Preview {
    AllProductsView()
}
