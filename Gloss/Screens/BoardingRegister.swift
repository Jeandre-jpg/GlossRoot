//
//  BoardingRegister.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/09.
//

import SwiftUI

struct BoardingRegister: View {
    
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var age: Int = 1
    @State private var gender: Array = ["Female", "Male", "Other"]
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var selectedIndex = 0
    @State var offset: CGFloat = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            
            OffsetTab(offset: $offset){
                HStack(spacing: 0){
                    ForEach(boardReg){screen in
                        
                        VStack{
                            VStack{
                                Image(screen.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .padding(.top, 10)
                                
                                Text(screen.title)
                                    .font(.custom("DreamAvenue", size: 25))
                                    .foregroundColor(Color("Black"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 15)
                                
                              
                                Text(screen.description)
                                    .font(.custom("Livvic-Regular", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 5)
                                
                                Spacer()
                              
                            }//VStack
                            .frame(width: getScreenBounds().width)
                            .frame(maxHeight: .infinity)
                            .background(Color("Pink").ignoresSafeArea())
                            
                            
                        }//VStack
                        .frame(width: getScreenBounds().width)
                        .frame(maxHeight: .infinity)
                        .background(Color("Pink").ignoresSafeArea())
                    }//ForEach
                }//HStack
                
            }//offset
            
            if getIndex() == 0{
            
            VStack(spacing: 10){

                    Spacer()
                    
                    VStack{
                        
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("Pink"))
                            .border(Color("Grey"))
                            .frame(width: 350, height: 50)
                            .padding(.top, 20)
                            .opacity(0.5)
                        
                        
                        HStack(spacing: 10){
                            Image("Facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            
                            Image("Google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.leading, 20)
                        }.padding(.top, -50)
                        
                        HStack(spacing: 10){
                            Rectangle()
                                .fill(Color("Grey"))
                                .frame(height: 1)
                                .padding(.leading)
                            
                            Text("OR")
                                .font(.custom("DreamAvenue", size: 12))
                                .foregroundColor(Color("Grey"))
                                .multilineTextAlignment(.center)
                                .padding(.top, 0)
                            
                            Rectangle()
                                .fill(Color("Grey"))
                                .frame(height: 1)
                                .padding(.trailing)
                            
                        }
                        .padding(10)
                        
                    }//VStack
                    
                    Text("Name * \(username)")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 5)
                        .padding(.leading, -170)
                        .padding(.bottom, -10)
                    
                    
                    TextField("Username", text: $username)
                        .font(.custom("Livvic-Medium", size: 12))
                        .foregroundColor(Color("Black"))
                        .multilineTextAlignment(.leading)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                    
                        .frame(width: 350, height: 70)
                    
                    
                    
                    Text("Surname *")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 5)
                        .padding(.leading, -170)
                        .padding(.bottom, -10)
                    
                    
                    TextField("Surname", text: $surname)
                        .font(.custom("Livvic-Medium", size: 12))
                        .foregroundColor(Color("Black"))
                        .multilineTextAlignment(.leading)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                    
                        .frame(width: 350, height: 70)
                    
                    
                    Text("Email Adress *")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 5)
                        .padding(.leading, -170)
                        .padding(.bottom, -10)
                    
                    
                    TextField("Email Adress", text: $email)
                        .font(.custom("Livvic-Medium", size: 12))
                        .foregroundColor(Color("Black"))
                        .multilineTextAlignment(.leading)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        .frame(width: 350, height: 70)
                    
                    
                    
                    Button{
                        offset = min(offset + getScreenBounds().width * 2,
                                     getScreenBounds().width * 2)
                        
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("Brown"))
                                .frame(width: 350, height: 50)
                                .padding(.top, 20)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                            
                            NavigationLink(destination:
                                            BoardingRegister()
                                .navigationBarBackButtonHidden(true)){
                                    Text("Next")
                                        .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                        .foregroundColor(Color("White"))
                                        .padding(.top, 20)
                                        .multilineTextAlignment(.center)
                                    
                                }//Nav
                        }//ZStack
                    }//Button
                    
                
        
                
                
                    Button{
                        offset = min(offset + getScreenBounds().width * 2,
                                     getScreenBounds().width * 2)
                    }label: {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label:{
                            
                        
                                Text("Already have an account? Log In")
                                    .font(.custom("Livvic-Regular", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                        })
                          
                    }//Button
                }//VStack
                
            }else if getIndex() == 1{
                
                VStack(spacing: 10){
                    
                    VStack{
                        HStack {
                            
                            Menu{
                                Picker(selection: $age, label: EmptyView()){
                                    ForEach(0..<100){
                                        Text("\($0)")
                                    }
                                }
                                
                            }label:{
                                
                                VStack{
                                    
                                    Text("Age *")
                                        .font(.custom("Livvic-Medium", size: 15))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                        .padding(.leading, -170)
                                        .padding(.bottom, -10)
                                    
                                    HStack{
                                        Text(String(age))
                                            .font(.custom("Livvic-Medium", size: 12))
                                            .foregroundColor(Color("Black"))
                                        
                                        
                                        
                                        Text("⌵")
                                            .offset(y: -4)
                                            .font(.custom("Livvic-Medium", size: 12))
                                            .foregroundColor(Color("Black"))
                                        
                                    }
                                    .border(Color("Grey"))
                                    .opacity(0.7)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 5)
                                    .padding(.leading, -170)
                                    .padding(.bottom, -10)
                                    .frame(width: 350, height: 70)
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                        }//Hstack
                        
                        HStack{
                            Menu{
                                Picker(selection: $selectedIndex, label: EmptyView()){
                                    ForEach(0 ..< gender.count, id: \.self){
                                        Text(self.gender[$0])
                                    }
                                }
                            }label: {
                                VStack{
                                    
                                    Text("Gender *")
                                        .font(.custom("Livvic-Medium", size: 15))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                        .padding(.leading, 70)
                                    
                                    HStack{
                                        Text(String(gender[selectedIndex]))
                                            .font(.custom("Livvic-Medium", size: 12))
                                            .foregroundColor(Color("Black"))
                                        
                                        
                                        
                                        Text("⌵")
                                            .offset(y: -4)
                                            .font(.custom("Livvic-Medium", size: 12))
                                            .foregroundColor(Color("Black"))
                                        
                                    }
                                    .border(Color("Grey"))
                                    .opacity(0.7)
                                    .multilineTextAlignment(.leading)
                                    .padding(.all, 20)
                                    .frame(width: 350, height: 70)
                                }
                            }
                            
                        }
                    }
                }
                
                //

            }else if getIndex() == 2{
                
                VStack(spacing: 10){
                    Spacer()
                    
                    VStack{
                        
                        Text("Hello 3")
                        
                    }
                }
            }else if getIndex() == 3{
                
                VStack(spacing: 10){
                    Spacer()
                    
                    VStack{
                        
                        Text("Hello 4")
                        
                    }
                }
            }else if getIndex() == 4{
                
                VStack(spacing: 10){
                    Spacer()
                    
                    VStack{
                        
                        Text("Hello 5")
                        
                    }
                }
            }
            
        }.ignoresSafeArea()
        //ZStack
  
    }//Body
    
    
    func getIndex()->Int{
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }
    
}//View


struct BoardingRegister_Previews: PreviewProvider {
    static var previews: some View {
        BoardingRegister()
    }
}

//HStack {
//        Text(String(age))
//        Spacer()
//        Text("⌵")
//            .offset(y: -4)
//    }//Hstack
//    .font(.custom("Livvic-Regular", size: 12))
//    .foregroundColor(Color("Black"))
//    .multilineTextAlignment(.center)
//    .padding(.top, 10)
//    .padding(.bottom, 10)
//        }
//
//
//    HStack {
//        Text(String(gender[selectedIndex]))
//        Spacer()
//        Text("⌵")
//            .offset(y: -4)
//    }//HStack
//    .font(.custom("Livvic-Regular", size: 12))
//    .foregroundColor(Color("Black"))
//    .multilineTextAlignment(.center)
//    .padding(.top, 10)
//    .padding(.bottom, 10)
//        }//Vstack
    
