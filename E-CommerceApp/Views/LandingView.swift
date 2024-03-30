//
//  LandingView.swift
//  E-CommerceApp
//
//  Created by Youssif Hany on 29/03/2024.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            VStack{
                VStack{
                    Text("TASTES ON DEMAND")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .fontWeight(.black)
                        .baselineOffset(10.0)
                        .multilineTextAlignment(.center)
                        .kerning(1)
                    
                    Text("FIND YOUR PERFECT COLLECTIONS WITH EASE. SHOP NOW!")
                        .font(.title)
                        .foregroundStyle(.gray)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .bold()
                        .padding()
                }
                .padding()
                Spacer()
                NavigationLink(destination: MainView()) {
                    Text("Get Started")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.cyan)
                        .cornerRadius(30)
                        .padding()
                }
            }
            .background(Image("land1").resizable().scaledToFill()
                .edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    LandingView()
}
