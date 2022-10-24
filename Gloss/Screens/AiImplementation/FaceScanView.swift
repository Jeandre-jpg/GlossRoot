//
//  FaceScanView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/17.
//

import SwiftUI
import Firebase
import FirebaseAuth
import CoreML
import Vision



struct FaceScanView: View {
    
    @State var showsBlob: Bool = false
    @State var offset: CGFloat = 0
    @State private var skintype = 0
    @State private var skintone = 0
    @State private var skinconcern = 0
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    @State private var classLabel: String = ""
    @State private var departmentLabel: String = ""
    
    private let classifier = try! SkinConcernsClass(mlModel: GlossifyMLClass(configuration: MLModelConfiguration()).model)
    
    private let department = try! SkinConcernsClass(mlModel: GlossifySkinToneMLClass(configuration: MLModelConfiguration()).model)
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        VStack{
            
            HStack(spacing: 10){
                ZStack{
                    NavigationLink(destination:
                                    DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                        .navigationBarBackButtonHidden(true)){
                            
                            Image("back")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 10, alignment: .center)
                            
                        }
                    
                }.offset(x: -150, y: 100)
            }
            
            
            Image("Ai")
            
                .aspectRatio(contentMode: .fit)
                .padding(.top, 350)
                .frame(width: 350, height: 350, alignment: .center)
            
         
            
            VStack{
                
                
                VStack(spacing: 10){
                    
                    VStack(spacing: 10){
                        
                        Button(action: {
                            self.showSheet = true

                        }, label: {
                            Image("camera")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                        }).padding()
                            .actionSheet(isPresented: $showSheet) {
                                ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                                    .default(Text("Photo Library")) {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                    },
                                    .default(Text("Camera")) {
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                    },
                                    .cancel()
                                ])
                            }
                        
                   
                        
                    }
                    .padding(.top, 450)
                    .frame(width: 50, height: 50, alignment: .center)
                    
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color("White"))
                        .frame(width: 350, height: 160)
                        .padding(.top, 200)
                    
                    VStack{
                        
                        
                        
                        Text("Let's get you set up!")
                            .font(.custom("DreamAvenue", size: 25))
                            .foregroundColor(Color("Black"))
                            .multilineTextAlignment(.center)
                            .padding(.top, -140)
                        
                        
                        Text("Please scan your beautiful face within our borders")
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Black"))
                            .multilineTextAlignment(.center)
                            .padding(.top, -110)
                        
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color("Pink"))
                        .frame(width: 350, height: 70)
                        .padding(.top, -80)
                    
                    HStack(spacing: 20){
                        
                        
                        Button(action:{
                            
                         
                            
                            if let img = self.image{
                                self.classifier?.classify(img){result in
                                    self.classLabel = result
                                    print(result)
             
                                }
                                
                                self.department?.classify(img){result in
                                    self.departmentLabel = result
                                    print(result)
             
                                }
                            }
                         
                            self.showsBlob = true
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("Brown"))
                                    .frame(width: 150, height: 50)
                                    .padding(.top, 120)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                
                                
                                Text("Classify Me")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                    .foregroundColor(Color("White"))
                                    .padding(.top, 120)
                                    .multilineTextAlignment(.center)
                                
                                
                            }//ZStack
                        })//Button
                        
                        Button{
                            
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("Brown"))
                                    .frame(width: 150, height: 50)
                                    .padding(.top, 120)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                
                                
                                Text("Beauty Care")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                    .foregroundColor(Color("White"))
                                    .padding(.top, 120)
                                    .multilineTextAlignment(.center)
                                
                                
                            }//ZStack
                        }//Button
                    }
                    .padding(.top, -200)
                }
                
                
                
                
            }//VStack
            .frame(width: getScreenBounds().width)
            .frame(maxHeight: .infinity)
            
      
            if showsBlob {
                
                VStack{
                    
                    Image("BlobAi")
                        .frame(width: 300, height: 300, alignment: .center)
                        .padding(.top, -870)
    
                    Text(classLabel)
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Black"))
                        .padding(10)
                        .padding(.top, -750)
                    
                    Text(departmentLabel)
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Black"))
                        .padding(10)
                        .padding(.top, 10)
                    
                }
            }

        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
        
        .frame(width: getScreenBounds().width)
        .frame(maxHeight: .infinity)
        .background( Image(uiImage: image ?? UIImage(named: "faceai")!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
        
        
    }
}


struct FaceScanView_Previews: PreviewProvider {
    static var previews: some View {
        FaceScanView()
    }
}
