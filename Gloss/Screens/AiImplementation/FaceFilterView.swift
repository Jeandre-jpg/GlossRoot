//
//  FaceFilterView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI


struct FaceFilterView: View {
    
    @State var userIsLoggedIn: Bool = true
    @State private var showingCredits = false
    
    @ObservedObject private var beauties = BeautyproductsViewModel()
    @State var isShowingSheet = false
    
    
    
    var body: some View {
        
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
                Image("face_place")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            
            
            VStack{
                
                HStack{
                    NavigationLink(destination:
                                    DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                        .navigationBarBackButtonHidden(true)){
                            
                            Image("back")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 10, alignment: .center)
                            
                        }
                    Spacer()
                }.padding(.leading, 10)
                
                Spacer()
                
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(beauties.beautyproducts,  id: \.self){beautyproduct in
                            
                            HStack{
                               
                                
                                HStack{
                                   
                                            
                                            WebImage(url: URL(string:beautyproduct.image))
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                        
                                }
                                .padding(.leading, 20)
                                
                                Spacer()
                                
                                VStack{
                                    
                                    NavigationLink(destination:
                                                    TutorialView(beautyproduct: beautyproduct)
                                        .navigationBarBackButtonHidden(true)){
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 30)
                                                    .fill(Color("Brown"))
                                                    .frame(width: 150, height: 50)
                                                    .padding(.top, 20)
                                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                                
                                                
                                                Text("Try It!")
                                                    .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                                    .foregroundColor(Color("White"))
                                                    .padding(.top, 20)
                                                    .multilineTextAlignment(.center)
                                            }
                                        
                                    }
                                       
                                        .padding(.leading, -100)
                                       
                                    
                                    Text(beautyproduct.name)
                                        .font(.custom("Livvic-SemiBold", size: 12))
                                        .foregroundColor(Color("Black"))
                                        .padding(.top, -10)
                                        .padding(.leading, -50)
                                        .frame(width: 150, height: 70, alignment: .leading)
                                    
                                    Text(beautyproduct.subtitle)
                                        .font(.custom("Livvic-Regular", size: 10))
                                        .foregroundColor(Color("Black"))
                                        .padding(.top, -50)
                                        .padding(.leading, -70)
                                        .frame(width: 100, height: 100, alignment: .leading)
                                }
                                
                                
                             
                            } .background(Color("White") .cornerRadius(20))
                                .frame(width: 350, height: 250)
                                .padding(.all, 20)
                                .padding(.top, 100)
                          
                           
                           
                        }
                        Spacer()
                       
                    }
                   
                    
                }
             
               
                
                
            }.padding(.all, 20)
            
        }.onAppear(){
            self.beauties.fetchBeautyproducts()
        }
        
        .frame(width: getScreenBounds().width)
        .frame(maxHeight: .infinity)
       
    }
}

       


struct FaceFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FaceFilterView()
    }
}
