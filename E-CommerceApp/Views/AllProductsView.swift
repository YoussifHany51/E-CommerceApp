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
    var columns = Array(repeating: GridItem(.flexible(),spacing: 20),count:2)
    var body: some View {
        NavigationStack{
            ScrollView{
                ViewALLItemSection.padding()
                LazyVGrid(columns: columns) {
                    //display products / 8
                        ForEach(viewMoreButton ? viewModel.products[0..<viewModel.products.count / 8]:viewModel.products[0..<viewModel.products.count]){ product in
                            VStack(alignment:.leading) {
                                NavigationLink(destination:DetailProductView(title:product.title,price: product.price, description: product.description, image:product.images )) {
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
                                }
                                
                                HStack{
                                    VStack{
                                        Text(product.title).fontWeight(.heavy)
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


#Preview {
    AllProductsView()
}

extension AllProductsView{
   private var ViewALLItemSection:some View{
        HStack{
            Text("ALL ITEMS")
                .fontWeight(.heavy)
            Spacer()
            Button{
                viewMoreButton.toggle()
            }label: {
                Text(viewMoreButton ? "VIEW MORE" : "VIEW LESS")
                    .font(.caption2)
                    .foregroundStyle(.blue)
            }
        }
    }
}
