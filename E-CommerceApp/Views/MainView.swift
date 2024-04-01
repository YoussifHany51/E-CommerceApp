//
//  MainView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 30/03/2024.
//

import SwiftUI

struct MainView: View {
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemCyan]
    }
    var body: some View {
        NavigationStack{
            VStack{
                HomeView()
            }
            .navigationTitle("SPATU")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.black)
                        .font(.body)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    
                } label: {
                    Image(systemName: "bell")
                        .foregroundStyle(.black)
                        .font(.body)
                }
            }
        })
    }
}

#Preview {
    MainView()
}
