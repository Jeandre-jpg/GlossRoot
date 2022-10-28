//
//  LoginView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/09.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @StateObject var vm = AuthManage()

    
    @State var userIsLoggedIn: Bool = false
    @State var offset: CGFloat = 0
    @State private var password: String = ""
    @State private var email: String = ""
    
    
    @State var isLoading: Bool = true
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oh No!"
    
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty
            {
            return "Please fill in all required info"
        }
        return nil
    }

    
    var body: some View {

        if userIsLoggedIn{
            DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
        }else{
            content
        }
    }

    var content: some View{
        ZStack{
            VStack{
                Image("Add")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .padding(.top, 10)
                
                Text("Log in to your Account")
                    .font(.custom("DreamAvenue", size: 25))
                    .foregroundColor(Color("Black"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 15)

                
                Text("Welcome back, please enter your details.")
                    .font(.custom("Livvic-Regular", size: 12))
                    .foregroundColor(Color("Black"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                
          Spacer()
                    .frame(height: 30)
                
                VStack{
                    
                    HStack(spacing: 10){
                        Rectangle()
                            .fill(Color("Grey"))
                            .frame(height: 1)
                            .padding(.leading)
                        
                        Text("Let's do it")
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
                    
                    Spacer()
                              .frame(height: 30)
                    
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
                        .disableAutocorrection(true)
                        .border(Color("Grey"))
                        .opacity(0.7)
                    
                        .frame(width: 350, height: 70)
                    
                    Text("Password *")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 5)
                        .padding(.leading, -170)
                        .padding(.bottom, -10)
                    
                    
                    SecureField("Password", text: $password)
                        .font(.custom("Livvic-Medium", size: 12))
                        .foregroundColor(Color("Black"))
                        .disableAutocorrection(true)
                        .multilineTextAlignment(.leading)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        .frame(width: 350, height: 70)
                    
                    Spacer()
                              .frame(height: 10)
                
                    
                    Button(action: {
                        vm.signIn(email: email, password: password)
                        
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("Brown"))
                                .frame(width: 350, height: 50)
                                .padding(.top, 20)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                            
                   
                                    Text("Log In")
                                        .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                        .foregroundColor(Color("White"))
                                        .padding(.top, 20)
                                        .multilineTextAlignment(.center)
                                    

                        }//ZStack
                    })//Button
                    .accessibilityIdentifier("loginButton")
                    
                    NavigationLink(destination:
                                    BoardingRegister()
                        .navigationBarBackButtonHidden(true)){
                        Text("Don’t have an account? Sign Up")
                                .font(.custom("Livvic-Regular", size: 12))
                                .foregroundColor(Color("Black"))
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                            
                        }//Nav

                
                }//VStack
                    
                }//VStack
            .onAppear{
                Auth.auth().addStateDidChangeListener{auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
                .frame(width: getScreenBounds().width)
                .frame(maxHeight: .infinity)
                .background(Color("Pink").ignoresSafeArea())
                
                
                
                
            }//ZStack
     
            .frame(width: getScreenBounds().width)
            .frame(maxHeight: .infinity)
            .background(Color("Pink").ignoresSafeArea())
            

    }
    
    }


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
