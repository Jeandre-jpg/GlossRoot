//
//  OnboardingView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/02.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var boarding: [Boarding] = [
        Boarding(image: "welcome", title: "Welcome", description: "We believe in proving the best skin care recommendations for any age, gender, ethnicity"),
        Boarding(image: "search", title: "Search & Discover", description: "We have dedicated set of products and routines hand picked for every skin type."),
        Boarding(image: "face", title: "Face Scan", description: "For better results, use our skin sensor tool to scan your face and detect areas you need to work on.")
    ]

    @AppStorage("Boarding") var isOnboarding: Bool = true
    
    @State var offset: CGFloat = 0
    var body: some View {
            
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            OffsetTab(offset: $offset){
              
                    
                    
                HStack(spacing: 0){
                    
                    ForEach(boarding){screen in
                        VStack{
                            VStack(spacing: 50){
                                
                                HStack{
                                    
                                        Image("LogoMain")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .padding(1)
                                            
                                            .frame(width: 100, height: 100, alignment: .leading)
               
                                    
                                    }.padding(.top, -40)
                                    .padding(.leading, -180)
                          
                                
                                Image(screen.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
                            }
                            .frame(width: getScreenBounds().width)
                            .frame(width: 300, height: 450)
                            .padding(.bottom, 150)
                            
                            
                            
                            VStack(spacing: 10){
                                Text(screen.title)
                                    .font(.custom("DreamAvenue", size: 40))
                                    .foregroundColor(Color("Black"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, -130)
                            }
                            
                            VStack(spacing: 10){
                                Text(screen.description)
                                    .font(.custom("Livvic-Regular", size: 15))
                                    .foregroundColor(Color("Black"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, -130)
                            }
                            .frame(width: 270, height: 100, alignment: .center)
                            
                        }
                        .ignoresSafeArea(.container, edges: .all)
                        .frame(width: getScreenBounds().width)
                        .frame(maxHeight: .infinity)
                        
                    }
                    
                    
                }
                
                
                .background(Color("Pink"))
               
                

                
                
        }//Offset
            .ignoresSafeArea()
            .overlay(
                VStack{
                    
                    HStack{
                        
                        ForEach(boarding.indices, id:\.self){ index in
                           Circle()
                                .fill(index == (getIndex()) ? Color("White"):Color("Brown"))
                                .frame(width: index == (getIndex()) ? 15:10, height: 10)
                                .padding(.vertical, 10)
                                .scaleEffect(index == (getIndex()) ? 1.3:0.85)
                               
                               
                        }
                        Spacer()
            
                        if(getIndex() == 2){
                            
                            
                            NavigationLink(destination:
                                            LoginView()
                                .navigationBarBackButtonHidden(true)){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color("White"))
                                            .frame(width: 120, height: 50)
                                        
                                        
                                        Text("Done")
                                            .font(.custom("Livvic-Bold", size: 15))
                                            .foregroundColor(Color("Black"))
                                            .padding(20)
                                            .multilineTextAlignment(.center)
                                            .underline()
                                    }.onTapGesture{
                                        isOnboarding = false
                                    }
                                }
                
           
            }else{
                Button{
                    offset = min(offset + getScreenBounds().width * 2,
                        getScreenBounds().width * 2)
                }label: {
                    
                    Text("Find out your skintype")
                       .font(.custom("Livvic-Regular", size: 15))
                       .foregroundColor(Color("Black"))
                       .padding(10)
                       .multilineTextAlignment(.center)
                       .underline()
               
                }
            }
        
                
            }.padding(.leading, 20)
                   
                }
                    .padding()
                    ,alignment: .bottom
                
        
            )
            
        }//Zstack
       
            
    }//Offset
        
    
    func getIndex()->Int{
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
