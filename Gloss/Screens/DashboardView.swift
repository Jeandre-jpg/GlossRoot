//
//  DashboardView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/09.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack{
                
                HStack(spacing: 10){
                    Image("burgermenu")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(1)
                    
                        .frame(width: 35, height: 35, alignment: .center)
                    Spacer()
                    
                    Image("spotsearch")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(1)
                    
                        .frame(width: 35, height: 35, alignment: .center)
                    
                    Image("cart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(1)
                    
                        .frame(width: 35, height: 35, alignment: .center)
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Text("WELCOME BACK")
                    .font(.custom("Livvic-Regular", size: 12))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 30)
                
                Text("UserName")
                    .font(.custom("DreamAvenue", size: 40))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 0)
                
                Text("TOP PRODUCT")
                    .font(.custom("Livvic-Regular", size: 12))
                    .foregroundColor(Color("Brown"))
                    .padding(.leading, -170)
                    .padding(.top, 30)
                
                HStack(spacing: 20){
                    
                    Image("SkinCreamery")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(10)
                        .frame(width: 300, height: 300)
                        .padding(.leading, -30)
                    
                    VStack(spacing: 30){
                        
                        Text("Scan Me")
                            .rotationEffect(Angle(degrees: 270))
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Black"))
                            .padding(.top, 30)
                        
                        Text("Overview")
                            .rotationEffect(Angle(degrees: 270))
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Black"))
                            .padding(.top, 30)
                        
                        Text("Track Me")
                            .rotationEffect(Angle(degrees: 270))
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Black"))
                            .padding(.top, 30)
                      
                        
                    }.padding(.leading, 10)
                }
                
                Spacer()
               
       
                Button(action: {
                   // sessionService.logout()
                },label: {
                    Text("Log Out")
                })
               
                
            }
            .frame(width: getScreenBounds().width)
            .padding(.top, 10)
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SessionServiceImpl())
    }
}
