//
//  SkinProductsView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//


import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI
//import SwiftDrawer
struct SkinProductsView: View {
    @State var userIsLoggedIn: Bool = true
    @State private var showingCredits = false
    @State private var beautyFilter: String = "All"
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
                
                Text("SKIN CARE")
                    .font(.custom("DreamAvenue", size: 40))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 2)
                
                HStack{
                    
                    Text("ALL PRODUCTS")
                        .font(.custom("Livvic-SemiBold", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -160)
                        .padding(.top, 10)
                    
                    Text("(\(skins.skinproducts.count))")
                        .font(.custom("Livvic-SemiBold", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -70)
                        .padding(.top, 10)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 15){
                        Button(action: {
                            beautyFilter = "All"
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("ALL")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        Button(action: {
                            beautyFilter = "Serum"
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("SERUM")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        Button(action: {
                            //do filter
                            beautyFilter = "Cream"
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("CREAM")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        
                        Button(action: {
                            //do filter
                            beautyFilter = "Mask"
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("MASK")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        Button(action: {
                            //do filter
                            beautyFilter = "Lotion"
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("LOTION")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        
                        
                        Button(action: {
                            //do filter
                            beautyFilter = "Toner"
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("TONER")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        
                        
                        Button(action: {
                            //do filter
                            beautyFilter = "Cleanser"
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("CLEANSER")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                    }  .padding(.leading, 30)
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                }

                ScrollView{
                    LazyVGrid(columns: colums){
                        ForEach(skins.skinproducts){skinproduct in
                               if beautyFilter == "All"{

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
                                               .frame(width: 150, height: 70, alignment: .leading)

                                           Text(skinproduct.category)
                                               .font(.custom("Livvic-Regular", size: 15))
                                               .foregroundColor(Color("Black"))
                                               .padding(.top, -30)
                                               .frame(width: 150, height: 50, alignment: .leading)
                                       }


                                   
                               }else if skinproduct.category == beautyFilter{
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
                                               .frame(width: 150, height: 70, alignment: .leading)

                                           Text(skinproduct.category)
                                               .font(.custom("Livvic-Regular", size: 15))
                                               .foregroundColor(Color("Black"))
                                               .padding(.top, -30)
                                               .frame(width: 150, height: 50, alignment: .leading)
                                       }
                                   }


                             }
                           
                    
                            
                        }
                    }
                    
                 
                }
            }
        }.onAppear(){
            self.skins.fetchSkinproducts()
        }
    }
}





struct SkinProductsView_Previews: PreviewProvider {
    static var previews: some View {
        SkinProductsView()
    }
}
