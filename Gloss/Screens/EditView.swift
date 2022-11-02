//
//  EditView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/16.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct EditView: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var age: Int = 1
    @State private var gender: Array = ["Female", "Male", "Transgender", "Gender Neutral", "Non-binary", "Agender", "Other"]
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var selectedIndex = 0
    @State var offset: CGFloat = 0
    @State private var skintype = 0
    @State private var skintone = 0
    @State private var skinconcern = 0
    @State var beauty: Beauty
    
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack(spacing: 8){
              
                    NavigationLink(destination:
                                    DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                        .navigationBarBackButtonHidden(true)){
                            Image("back")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.leading, -170)
                                .frame(width: 25, height: 25)
                                .padding(.top, -40)
                        }
                
                
                Text("Your Profile")
                    .font(.custom("DreamAvenue", size: 40))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                
                
        
                
                HStack(spacing: 10){
                    
                    VStack{
                        
                        Text("Username:")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(beauty.username)
                                .font(.custom("Livvic-Medium", size: 20))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, -75)
                                .frame(width: 75, height: 15)
                                .padding(.top, 20)
                            
                            
                        }
                    }
                    
                    Spacer()
                        .frame(width: 75)
                    
                    VStack{
                        
                        Text("Surname:")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(beauty.surname)
                                .font(.custom("Livvic-Medium", size: 20))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, -75)
                                .frame(width: 75, height: 15)
                                .padding(.top, 20)
                            
                            
                        }
                    }
                    
                    
                    
                    
                }
                .padding(.top, 5)
                .padding(.leading, -20)
                .padding(.bottom, 15)
                
                HStack(spacing: 10){
                    Rectangle()
                        .fill(Color("Grey"))
                        .frame(height: 1)
                        .frame(width: 350)
                        .padding(.trailing)
                }
                
                VStack{
                    
                    Text("Email Adress:")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 5)
                        .padding(.leading, -170)
                        .padding(.bottom, 5)
                    
                    
                    Text(beauty.email)
                        .font(.custom("Livvic-Medium", size: 20))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -160)
                        .frame(width: 75, height: 15)
                        .padding(.top, 20)
                        .padding(.bottom, 15)
                    
                    
                    HStack(spacing: 10){
                        Rectangle()
                            .fill(Color("Grey"))
                            .frame(height: 1)
                            .frame(width: 350)
                            .padding(.trailing)
                    }
                }
             
                HStack(spacing: 10){
                    
                    VStack{
                        
                        Text("Gender:")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(beauty.gender)
                                .font(.custom("Livvic-Medium", size: 20))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, -75)
                                .frame(width: 75, height: 15)
                                .padding(.top, 20)
                            
                            
                        }
                    }
                    
                    Spacer()
                        .frame(width: 75)
                    
                    VStack{
                        
                        Text("Age:")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(String(beauty.age))
                                .font(.custom("Livvic-Medium", size: 20))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, -75)
                                .frame(width: 75, height: 15)
                                .padding(.top, 20)
                            
                            
                        }
                    }
                  
                   
                    
                }
                
                
                .padding(.top, 5)
                .padding(.leading, -20)
                .padding(.bottom, 15)
                
                VStack(spacing: 8){
                    
                    HStack(spacing: 10){
                        Rectangle()
                            .fill(Color("Grey"))
                            .frame(height: 1)
                            .frame(width: 350)
                            .padding(.trailing)
                    }
                    
                    Text("Skin Concerns:")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 10)
                        .padding(.leading, -170)
                        .padding(.bottom, 10)

    

                HStack{

//                    Text(String(skinconcern == 1 ? "Acne": skinconcern == 2 ? "Dryness": skinconcern == 3 ? "Oily Skin": skinconcern == 4 ? "Eczema": skinconcern == 5 ? "Wrinkles": skinconcern == 6 ? "Dark Undereyes": skinconcern == 7 ? "Hyper-Pigmentation": skinconcern == 8 ? "Sensitivity": skinconcern == 9 ? "Scars" : "None"))
//                        .font(.custom("Livvic-Medium", size: 15))
//                        .foregroundColor(Color("Brown"))
//                        .frame(width: 300, height: 15)
//                        .padding(.all, 20)
//                        .border(Color("Grey"))
//                        .opacity(0.7)
//                        .padding(.top, 10)
                    
                    Text("Acne")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .frame(width: 300, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        .padding(.top, 10)


                
            }

                }
                
            }//Vstack
            .padding(.top, -50)
            
        }//ZStack
        .onAppear{

            FirestoreViewModel.fetchUser(uid: Auth.auth().currentUser?.uid ?? "", onSuccess: {user in
                self.beauty = user
            })
        }

    }
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(beauty: Beauty(name: "Hansin", surname: "Prema", age: 23, email: "hansin@gmail.com", gender: "male", skinconcern: 1, skintone: 4, skintype: 4, username: "Hansin"))
    }
}
