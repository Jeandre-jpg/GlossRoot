//
//  SkinConcernView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/11/01.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI

struct SkinConcernView: View {
    

    
    @State var userIsLoggedIn: Bool = true
    @State private var showingCredits = false
    @State private var beautyFilter: String = "All"
    @Binding var beautyFilter2: String
    @State var count: Int = 0
    @ObservedObject private var skins = SkinproductsViewModel()

    @State var isShowingSheet = false
    
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    

    
    
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack{
                
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
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Text("BASED ON YOUR")
                    .font(.custom("Livvic-Regular", size: 12))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 30)
                
                Text("SKIN CONCERN")
                    .font(.custom("DreamAvenue", size: 40))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 2)
                
                HStack{
                    
                    Text("Products for \(beautyFilter2) ")
                        .font(.custom("Livvic-SemiBold", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -160)
                        .padding(.top, 10)
                }
                

                ScrollView{
                    LazyVGrid(columns: colums){
                        ForEach(skins.skinproducts){skinproduct in
                            
                            if beautyFilter2 == ""{

                            }else if skinproduct.skinconcern == beautyFilter2{
                              
                              VStack{
                                  ZStack{
                                      RoundedRectangle(cornerRadius: 20, style: .continuous)
                                          .fill(Color("White"))
                                          .frame(width: 160, height: 160)
                                          .padding(.top, 20)
                                          .opacity(1)
                                      
                                      NavigationLink(destination:
                                                      SkinDetailView(skinproduct2:skinproduct)
                                          .navigationBarBackButtonHidden(true)){
                                              WebImage(url: URL(string:skinproduct.image))
                                                  .resizable()
                                                  .aspectRatio(contentMode: .fit)
                                                  .frame(width: 120, height: 120)
                                          }
                                      
                                  }
                                  
                                  VStack{
                                      
                                      
                                      
                                      Text(skinproduct.name)
                                          .font(.custom("Livvic-SemiBold", size: 12))
                                          .foregroundColor(Color("Black"))
                                          .padding(.top, 10)
                                          .padding(.leading, 10)
                                      
                                      Text(skinproduct.category)
                                          .font(.custom("Livvic-Regular", size: 15))
                                          .foregroundColor(Color("Black"))
                                          .padding(.top, -10)
                                          .padding(.leading, -70)
                                  }
                              }
                            }

                            
                        }
                    }
                    
                 
                }
            }
        }.onAppear(){
                skins.fetchSkinproducts()

            
        }
    }
}

struct SkinConcernView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConcernView( beautyFilter2: .constant("Acne"))
    }
}
