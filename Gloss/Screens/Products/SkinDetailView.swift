//
//  SkinDetailView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI
import AVKit

struct SkinDetailView: View {
   
    @State private var showingCredits = false
    @State private var infoFilter: String = "Description"
    @ObservedObject private var skinproduct = SkinproductsViewModel()
    var skinproduct2 : Skinproducts
    

    
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
                    
                    
                    HStack{
                    
                Button(action: {
                    try? Auth.auth().signOut()
                }, label: {
                    Image("logout")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(1)
                        .frame(width: 35, height: 35, alignment: .center)
                })

                Spacer()
                        
                        ZStack{
                            NavigationLink(destination:
                                            DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                                .navigationBarBackButtonHidden(true)){
                                    
                                    Image("back")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 10, alignment: .center)
                                      
                                    
                                }
                            
                        }.offset(x: -20, y: -1)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, -100)
                    
                    
                    WebImage(url: URL(string:skinproduct2.image))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                }
                .padding(.top,
                         -10)
                
                VStack(spacing: 20){
                    VStack{
                        Text(skinproduct2.name)
                            .font(.custom("Livvic-SemiBold", size: 25))
                            .foregroundColor(Color("Brown"))
                            .frame(width: 350, height: 100)
                            .padding(.leading, -100)
                            .padding(.top, 90)
                        
                        Text(skinproduct2.subtitle)
                            .font(.custom("Livvic-Regular", size: 15))
                            .foregroundColor(Color("Brown"))
                            .frame(width: 350, height: 100)
                            .padding(.leading, -30)
                            .padding(.top, -10)
                    }
                    .frame(width: 300, height: 100, alignment: .leading)
                    .frame(alignment: .center)
                    .ignoresSafeArea(.all)
                    
                    
                    HStack(spacing: 10){
                        Rectangle()
                            .fill(Color("Grey"))
                            .frame(height: 1)
                            .frame(width: 350)
                            .padding(.trailing)
                            .padding(.top, 100)
                    }
                        
                    HStack{
                        VStack{
                            
                            Text("Price")
                                .font(.custom("Livvic-Bold", size: 20))
                                .foregroundColor(Color("Black"))
                            
                            Text(String("R \(skinproduct2.price).00"))
                                .font(.custom("Livvic-Regular", size: 15))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 1)
                        }
                        
                        Spacer()
                            .frame(width: 200)
                        
                        VStack{
                            
                            Text("Size")
                                .font(.custom("Livvic-Bold", size: 20))
                                .foregroundColor(Color("Black"))
                            
                           
                                Text(skinproduct2.size)
                                .font(.custom("Livvic-Regular", size: 15))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 1)
                            
                        }
                    }
                    .padding(.top, -30)
                    .padding(.leading, -60)
                    .frame(width: 300, height: 100)
                    .frame(alignment: .center)
                    .ignoresSafeArea()
                }
                
                HStack(spacing: 10){
                    Rectangle()
                        .fill(Color("Grey"))
                        .frame(height: 1)
                        .frame(width: 350)
                        .padding(.trailing)
                        .padding(.top, -10)
                }
                    
                
              
                
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(spacing: 15){
                            
                            Button(action: {
                               infoFilter = "Description"
                                
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
                              infoFilter  = "Tutorial"
                                
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
                               infoFilter = "Ingredients"
                                
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
                        
                   
                       
                    }
                
                    .padding(.top, -30)
                
                if infoFilter == "Description" {
                    VStack{
                        
                        Text(skinproduct2.description)
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                            .opacity(0.9)
                           
                    }
                    .frame(width: 350, height: 100)
                    .frame(alignment: .center)
                    .ignoresSafeArea()
                }else if infoFilter == "Tutorial" {
                    VStack{
                        
//                        VideoPlayer(player: AVPlayer(url: URL(string: (skinproduct2.tutorial))!))
//
                      
                        
                        Text(skinproduct2.tutorial)
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                            .opacity(0.9)
                           
                    }
                    .frame(width: 350, height: 100)
                    .frame(alignment: .center)
                    .ignoresSafeArea()
                }else if infoFilter == "Ingredients" {
                    VStack{
                        
                        Text(skinproduct2.ingredients)
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                            .opacity(0.9)
                           
                    }
                    .frame(width: 350, height: 100)
                    .frame(alignment: .center)
                    .ignoresSafeArea()
                }
                
                
                       
                
            } .padding(.leading, 10)
                .frame(alignment: .leading)
                .ignoresSafeArea()
            
            
        }.ignoresSafeArea()

    }
}

struct SkinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkinDetailView(skinproduct2:Skinproducts(category: "Mask", description: "Oil-free. With salicylic acid. Formulated with ClearDefend Technology™ to help clear spots and defend against new breakouts from first use for healthy looking, spot proof skin. Suitable for sensitive skin: Questions or comments? 0808 238 6006. ® Trademark ©Johnson & Johnson (Pty) Ltd 2016. Contact us: 0860 410032 (SA only).", image: "https://firebasestorage.googleapis.com/v0/b/glossroot.appspot.com/o/acne_skinproduct_4.jpeg?alt=media&token=55c26e9e-1ee8-47e4-ba17-623a5ebddba0", ingredients: "Aqua, Glycerin, Kaolin, Bentonite, Sodium Methyl Cocoyl Taurate, Trideceth-9, Salicylic Acid, Benzalkonium Chloride, Menthol, C12-15 Alkyl Lactate, Cetyl Lactate, Cocamidopropyl PG-Dimonium Chloride Phosphate, Lactic Acid, PEG-5 Ethylhexanoate, Coconut Acid, Sodium Chloride, Xanthan Gum, Disodium EDTA, Citric Acid, Sodium Citrate, Sodium Hydroxide, Chlorphenesin, Parfum, CI 77891.", name: "Neutrogena Clear Pore Face Mask", price: 132, size: "150ml", skinconcern: "Acne", skintype: "Oily", subtitle: "Neutrogena Visibly Clear 2-in-1 Wash & Mask 150ml doubles up to remove impurities and spot-causing bacteria in two ways. Use as a daily wash to remove dirt and oil and keep skin clear, or as a mask to absorb excess oils and unblock pores.", tutorial: "https://www.youtube.com/watch?v=jt8FLZWVVDw&ab_channel=TheMakeupMessSA", wherebuy: "Clicks"))
    }
}
 
