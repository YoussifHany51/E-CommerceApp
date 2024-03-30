//
//  HomeView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 30/03/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var searchTerm = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    CardCollectionView()
                }
            }
            .searchable(text: $searchTerm,placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "FIND YOUR ITEMS...")
        }
    }
}

#Preview {
    HomeView()
}
