//
//  test.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/26.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI

struct test: View {
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color("White"))
                        .frame(width: 400, height: 300)
                        .opacity(1)
                    
                    
                    Image("test")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                }
                
                VStack(spacing: 20){
                    Text("Title")
                        .font(.custom("Livvic-SemiBold", size: 20))
                        .foregroundColor(Color("Brown"))
                        .frame(width: 300, height: 100)
                    
                    Text("subtitle")
                        .font(.custom("Livvic-SemiBold", size: 15))
                        .foregroundColor(Color("Brown"))
                        .opacity(0.9)
                        
                    VStack{
                        
                        Text("lololol")
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                            .opacity(0.9)
                            .frame(width: 350, height: 100)
                    }
                    .padding(.leading, -170)
                    .frame(alignment: .leading)
                    .ignoresSafeArea()
                    
                    Text("Price")
                       .font(.custom("Livvic-Bold", size: 15))
                       .foregroundColor(Color("Black"))
              
            

                   Text("RRR")
                       .font(.custom("Livvic-Regular", size: 12))
                       .foregroundColor(Color("Black"))
                    
                    Text("Size")
                        .font(.custom("Livvic-Bold", size: 15))
                        .foregroundColor(Color("White"))

                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("MediumLight"))
                            .frame(width: 100, height: 35)
                            .padding(.top, 1)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        Text("SERUM")
                            .font(.custom("Livvic-SemiBoldItalic", size: 12))
                            .foregroundColor(Color("Black"))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.leading, -170)
                .frame(alignment: .leading)
                .ignoresSafeArea()
                
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(spacing: 15){
                            
                            Button(action: {
                                //do filter
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color("Brown"))
                                        .frame(width: 100, height: 35)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                    Text("DETAILS")
                                        .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                        .foregroundColor(Color("White"))
                                        
                                        .multilineTextAlignment(.center)
                                }//ZStack
                            })//Button
                            
                            Button(action: {
                                //do filter
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color("Brown"))
                                        .frame(width: 100, height: 35)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                    Text("TUTORIAL")
                                        .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                        .foregroundColor(Color("White"))
                                        
                                        .multilineTextAlignment(.center)
                                }//ZStack
                            })//Button
                            
                            
                            Button(action: {
                                //do filter
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color("Brown"))
                                        .frame(width: 100, height: 35)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                    Text("INGREDIENTS")
                                        .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                        .foregroundColor(Color("White"))
                                        
                                        .multilineTextAlignment(.center)
                                }//ZStack
                            })//Button
                        }
                        .padding(.leading, 30)
                           .padding(.bottom, 20)
                           .padding(.top, 30)
                        
                        VStack{
                            
                            Text("subtitle")
                                .font(.custom("Livvic-SemiBold", size: 15))
                                .foregroundColor(Color("Brown"))
                                .opacity(0.9)
                        }
                        .padding(.leading, -140)
                        .frame(alignment: .leading)
                        .ignoresSafeArea()
                        
                        Button(action: {
                           
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("Brown"))
                                    .frame(width: 350, height: 50)
                                    .padding(.top, 20)
                                    .padding(.leading, 10)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                
                       
                                        Text("Let's Shop!")
                                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                            .foregroundColor(Color("White"))
                                            .padding(.top, 20)
                                            .multilineTextAlignment(.center)
                                
                                        

                            }//ZStack
                            .padding(.leading, 10)
                            .frame(alignment: .leading)
                            .ignoresSafeArea()
                        })//Button
                        
                       
                    }
                       
                
            }
            
            
        }.ignoresSafeArea()

    }
}
   
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
