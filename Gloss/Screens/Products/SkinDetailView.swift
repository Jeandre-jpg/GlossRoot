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
//import SwiftDrawer

struct SkinDetailView: View {
    @State var userIsLoggedIn: Bool = true
    @State private var showingCredits = false

    @ObservedObject private var skins = SkinproductsViewModel()
    @State var isShowingSheet = false
    
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            ScrollView{
                LazyVGrid(columns: colums){
                    ForEach(skins.skinproducts){skinproduct in
                        VStack{
                            
                            ZStack{
                                NavigationLink(destination:
                                                SkinDetailView()
                                    .navigationBarBackButtonHidden(true)){
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Color("White"))
                                            .frame(width: 160, height: 160)
                                            .padding(.top, 20)
                                            .opacity(1)
                                    }
                                
                              
                                        WebImage(url: URL(string:skinproduct.image))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120, height: 120)
                                    
                                    
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
}

struct SkinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkinDetailView()
    }
}
 
