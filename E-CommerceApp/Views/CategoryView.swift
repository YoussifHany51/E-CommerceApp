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
    @ObservedObject var viewModel = ECommerceViewModel()
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.categries){ cat in
                        VStack {
                            VStack{
                                AsyncImage(url: URL(string: cat.image)){ image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                } placeholder: {
                                    ProgressView()
                                }
                                    
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(6)
                            Text(cat.name).textCase(.uppercase).fontWeight(.light).font(.caption2)
                        }
                    }
                }.padding()
            }
            .task {
                do{
                    viewModel.categries = try await viewModel.getCategoryData()
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
    CategoryView(viewModel: ECommerceViewModel())
}
