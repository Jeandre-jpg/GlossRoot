//
//  BoardingRegister.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/09.
//

import SwiftUI

struct BoardingRegister: View {
    
    @StateObject private var vm = RegisterViewModelImpl(service: RegisterServiceImpl())

    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var age: Int = 1
    @State private var gender: Array = ["Female", "Male", "Other"]
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var selectedIndex = 0
    @State var offset: CGFloat = 0
    @State private var skintype = 0
    @State private var skintone = 0
    @State private var skinconcern = 0
    
    
    
    
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
                    .frame(width: 250)
                    
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
                    
                    Text("Name * \(name)")
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Brown"))
                        .padding(.top, 5)
                        .padding(.leading, -170)
                        .padding(.bottom, -10)
                    
                    
                TextField("Nameame", text: $vm.userDetails.name)
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
                    
                    
                    TextField("Surname", text: $vm.userDetails.surname)
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
                    
                    
                    TextField("Email Adress", text: $vm.userDetails.email)
                        .font(.custom("Livvic-Medium", size: 12))
                        .foregroundColor(Color("Black"))
                        .multilineTextAlignment(.leading)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        .frame(width: 350, height: 70)
                    
                    
                    
                Button{
                    offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                    
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("Brown"))
                            .frame(width: 350, height: 50)
                            .padding(.top, 20)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        
                     
                                Text("Next")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                    .foregroundColor(Color("White"))
                                    .padding(.top, 20)
                                    .multilineTextAlignment(.center)
                                
                          
                    }//ZStack
                }//Button
                
        
                
                
                    Button{
                        offset = min(offset + getScreenBounds().width ,
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

        Spacer()
            .frame(height: 250)
        
        VStack(spacing: 10){
            
            HStack(spacing: 10){
                
                
                Menu{
                    Picker(selection: $vm.userDetails.age, label: EmptyView()){
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
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(String(age))
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 10)
                                .frame(width: 75, height: 15)
                            
                            
                            Spacer()
                            Text("⌵")
                                .offset(y: -4)
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.all, 5)
                                .padding(.leading, -10)
                            
                            
                        }
                        
                        .frame(width: 120, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        
                        
                    }
                }
                
                
                Menu {
                    Picker(selection: $vm.userDetails.gender, label: EmptyView()) {
                        ForEach(0 ..< gender.count , id: \.self) {
                            Text(self.gender[$0])
                        }//Foreach
                    }//Picker
                } label: {
                    
                    VStack{
                        
                        Text("Gender *")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -70)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(String(gender[selectedIndex]))
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 10)
                                .frame(width: 75, height: 15)
                            
                            
                            Spacer()
                            Text("⌵")
                                .offset(y: -4)
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.all, 5)
                                .padding(.leading, -10)
                                
                            
                            
                        }
                        
                        .frame(width: 120, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        
                        
                    }
                    
                    
                }
            
        }
            .padding(.top, 5)
            .padding(.leading, -20)
            .padding(.bottom, -5)


            
            Text("Password *")
                .font(.custom("Livvic-Medium", size: 15))
                .foregroundColor(Color("Brown"))
                .padding(.leading, -170)
                .padding(.bottom, -10)
                .padding(.top, 15)
            
            
            SecureField("Password", text: $vm.userDetails.password)
                .font(.custom("Livvic-Medium", size: 12))
                .foregroundColor(Color("Black"))
                .multilineTextAlignment(.leading)
                .padding(.all, 20)
                .padding(.top, 5)
                .border(Color("Grey"))
                .opacity(0.7)
                .frame(width: 350, height: 70)
            
            
            Text("Confirm Password *")
                .font(.custom("Livvic-Medium", size: 15))
                .foregroundColor(Color("Brown"))
                .padding(.leading, -170)
                .padding(.bottom, -10)
            
            
            SecureField("Confirm Password", text: $vm.userDetails.password)
                .font(.custom("Livvic-Medium", size: 12))
                .foregroundColor(Color("Black"))
                .multilineTextAlignment(.leading)
                .padding(.all, 20)
                .padding(.top, 5)
                .border(Color("Grey"))
                .opacity(0.7)
                .frame(width: 350, height: 70)
            
            Text("Username * \(username)")
                .font(.custom("Livvic-Medium", size: 15))
                .foregroundColor(Color("Brown"))
                .padding(.top, 5)
                .padding(.leading, -170)
                .padding(.bottom, -10)
            
            
        TextField("Username", text: $vm.userDetails.username)
                .font(.custom("Livvic-Medium", size: 12))
                .foregroundColor(Color("Black"))
                .multilineTextAlignment(.leading)
                .padding(.all, 20)
                .padding(.top, 5)
                .border(Color("Grey"))
                .opacity(0.7)
            
                .frame(width: 350, height: 70)
            
                Button{
                    offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                    
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("Brown"))
                            .frame(width: 350, height: 50)
                            .padding(.top, 20)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        
                        
                        Text("Next")
                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                            .foregroundColor(Color("White"))
                            .padding(.top, 20)
                            .multilineTextAlignment(.center)
                        
                    
                    }//ZStack
                }//Button
            
      }//Button
  }//VStack
  
       
    

              
               
                //

            }else if getIndex() == 2{
                
                VStack(spacing: 10){

                    Spacer()
                            .frame(height: 250)
                    
                    
                    VStack(spacing: 10){
                        
                        Text("What’s your Skin Type?")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Grey"))
                            .padding(.top, 20)
                            .padding(.bottom, 20)

                        HStack(spacing: 30){
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobDry")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Dry")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                            })
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                VStack(spacing: 10){
                                    Image("BlobNormal")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Normal")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                          
                         
                            })
                            
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                VStack(spacing: 10){
                                    Image("BlobCombination")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Combination")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                        
                                
                            })
                            
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                
                                VStack(spacing: 10){
                                    Image("BlobOily")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Oily")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                               
                                
                            })
                           
                        }
                        
                   
                    }
                    
                    
                    VStack(spacing: 10){
                        
                        Text("What’s your Skin Tone?")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Grey"))
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        
                        HStack(spacing: 10){
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobLight")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Light")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                               
                            })
                            .frame(width: 100, height: 100)
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobMedium")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Medium")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                              
                            })
                            .frame(width: 100, height: 100)
                            
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobDark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Dark")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                                
                            })
                            .frame(width: 100, height: 100)
                            
                        }
               
                        
                        HStack(spacing: 10){
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobMediumLight")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Medium Light")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                              
                            })
                            .frame(width: 100, height: 100)
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobMediumDark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60)
                                    
                                    Text("Medium Dark")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                               
                            })
                            .frame(width: 100, height: 100)
                        }
                        
                        Button{
                            offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                            
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("Brown"))
                                    .frame(width: 350, height: 50)
                                    .padding(.top, 20)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                
                             
                                        Text("Next")
                                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                            .foregroundColor(Color("White"))
                                            .padding(.top, 20)
                                            .multilineTextAlignment(.center)
                                        
                                  
                            }//ZStack
                        }//Button
                    
                    

                    
              }//Button
          }//VStack
          
                
                
            }else if getIndex() == 3{
                
                
                VStack(spacing: 10){

                  Spacer()
                        .frame(height: 220)
                    
                    VStack(spacing: 10){
                        
                        Text("What’s your Skin Concern?")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Grey"))
                            .padding(.top, 20)
                            .padding(.bottom, 20)

                        HStack(spacing: 30){
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobDry")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                    
                                    Text("Dry")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                            })
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                VStack(spacing: 10){
                                    Image("BlobDryness")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                    
                                    Text("Dryness")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                          
                         
                            })
                            
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                VStack(spacing: 10){
                                    Image("BlobOilySkin")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                    
                                    Text("Oily Skin")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                            })
                        }
                        
                        HStack(spacing: 30){
                                Button(action: {
                                    // Do something...
                                }, label: {
                                    VStack(spacing: 10){
                                        Image("BlobEczema")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 80)
                                        
                                        Text("Eczema")
                                            .font(.custom("Livvic-Regular", size: 12))
                                            .foregroundColor(Color("Brown"))
                                            .padding(.top, 5)
                                    }
                                })
                                
                                Button(action: {
                                    // Do something...
                                }, label: {
                                    
                                    VStack(spacing: 10){
                                        Image("BlobWrinkles")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 80)
                                        
                                        Text("Wrinkles")
                                            .font(.custom("Livvic-Regular", size: 12))
                                            .foregroundColor(Color("Brown"))
                                            .padding(.top, 5)
                                    }
                              
                             
                                })
                                
                                
                                Button(action: {
                                    // Do something...
                                }, label: {
                                    
                                    VStack(spacing: 10){
                                        Image("BlobDarkUndereyes")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 80)
                                        
                                        Text("Dark Undereyes")
                                            .font(.custom("Livvic-Regular", size: 12))
                                            .foregroundColor(Color("Brown"))
                                            .padding(.top, 5)
                                    }
                                })
                            
                        }
                        
                        HStack(spacing: 30){
                            Button(action: {
                                // Do something...
                            }, label: {
                                VStack(spacing: 10){
                                    Image("BlobHyperPigmentation")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                    
                                    Text("Hyper-Pigmentation")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                            })
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                VStack(spacing: 10){
                                    Image("BlobSensitivity")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                    
                                    Text("Sensitivity")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                          
                         
                            })
                            
                            
                            Button(action: {
                                // Do something...
                            }, label: {
                                
                                VStack(spacing: 10){
                                    Image("BlobScars")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                    
                                    Text("Scars")
                                        .font(.custom("Livvic-Regular", size: 12))
                                        .foregroundColor(Color("Brown"))
                                        .padding(.top, 5)
                                }
                            })
                        
                    }
                        
                        
                        
                   
                    }

                    .padding(.all, 20)
                    .padding(.top, 20)
                        
                        NavigationLink(destination:
                                        DashboardView()
                            .navigationBarBackButtonHidden(true)){
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("Brown"))
                                    .frame(width: 350, height: 50)
                                    .padding(.top, 20)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                
                               
                                        Text("Finish")
                                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                            .foregroundColor(Color("White"))
                                            .padding(.top, 20)
                                            .multilineTextAlignment(.center)
                                
                                        
                                    }//Nav

                            }//ZStack
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
