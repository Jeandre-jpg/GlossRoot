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
    
    let model = try! MobileNetV2(configuration: .init())
    @State private var classificationLabel: String = ""
    
    private func performImageClasification(){
        guard let img = image,
              let resizedImage = img.resizeTo(size: CGSize(width: 224, height: 224)),
              let buffer = resizedImage.toBuffer() else{
            return
        }
        
        let output = try? model.prediction(image: buffer)
        
        if let output = output{
            self.classificationLabel = output.classLabel
            print(classificationLabel)
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        VStack{
            
            HStack(spacing: 10){
                Image("back")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.top, 70)
                    .frame(width: 35, height: 10, alignment: .center)
                
            }
            .padding(.leading, -170)
            
            
            Image("Ai")
            
                .aspectRatio(contentMode: .fit)
                .padding(.top, 350)
                .frame(width: 350, height: 350, alignment: .center)
            
            Spacer()
                .frame(width: 100)
            
            
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
                        
                        
                        Text("Please scan your beautiful within our borders")
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
                            
                            // classificationLabel = "Hello"
                            self.performImageClasification()
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
            
            
            
            ///////////////
            ///if statement
            ///
            
            if showsBlob {
                
                VStack{
                    
                    Image("BlobAi")
                        .frame(width: 300, height: 300, alignment: .center)
                        .padding(.top, -870)
    
                    Text(classificationLabel)
                        .font(.custom("Livvic-Medium", size: 15))
                        .foregroundColor(Color("Black"))
                        .padding(10)
                        .padding(.top, -750)
                    
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

   
  
        
//        ZStack{
//            Image("faceai")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .ignoresSafeArea()
//
//            VStack{
//
//                HStack(spacing: 10){
//                    Image("back")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .padding(1)
//
//                        .frame(width: 35, height: 35, alignment: .center)
//
//                }
//                .padding(.leading, -170)
//                .padding(.trailing, 20)
//
//                Spacer()
//                    .frame(height: 50)
//
//
//                VStack{
//                    Image("BlobAi")
//                        .frame(width: 300, height: 300, alignment: .center)
//                        .padding(.top, 10)
//
//
//
//                    Text("Jeandrè")
//                        .font(.custom("Livvic-Medium", size: 15))
//                        .foregroundColor(Color("Black"))
//                        .padding(10)
//                        .padding(.top, -200)
//
//                }
//            }
//        }
//    }
//}
//
//
//        ZStack{
//            Color("Pink")
//                .ignoresSafeArea()
//
//
//            OffsetTab(offset: $offset){
//                HStack(spacing: 0){
//                    ForEach(face){screen in
//
//                        VStack{
//
//                          HStack(spacing: 10){
//                                Image("back")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .padding(.top, -10)
//                                    .frame(width: 20, height: 20, alignment: .center)
//
//                            }
//                            .padding(.leading, -170)
//
//
//                            VStack{
//
//                                Spacer()
//                                    .frame(width: 150)
//
//                                VStack(spacing: 10){
//
//
//                                    RoundedRectangle(cornerRadius: 30)
//                                        .fill(Color("White"))
//                                        .frame(width: 350, height: 160)
//                                        .padding(.top, 200)
//
//                                    VStack{
//
//                                        Text(screen.title)
//                                            .font(.custom("DreamAvenue", size: 25))
//                                            .foregroundColor(Color("Black"))
//                                            .multilineTextAlignment(.center)
//                                            .padding(.top, -140)
//
//
//                                        Text(screen.description)
//                                            .font(.custom("Livvic-Regular", size: 12))
//                                            .foregroundColor(Color("Black"))
//                                            .multilineTextAlignment(.center)
//                                            .padding(.top, -110)
//
//                                        Spacer()
//                                            .frame(width: 100)
//
//                                    }
//                                }
//
//
//                            }//VStack
//                            .frame(width: getScreenBounds().width)
//                            .frame(maxHeight: .infinity)
//
//
//
//                        }
//                        .frame(width: getScreenBounds().width)
//                      .frame(maxHeight: .infinity)
//                      .background(Image(screen.image)
//                          .resizable()
//                          .ignoresSafeArea())
//
//                    }//ForEach
//                }//HStack
//
//
//            }//offset
//            .ignoresSafeArea()
//
//            if getIndex() == 0{
//
//                VStack(spacing: 10){
//
//                    Image("Ai")
//
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.top, 350)
//                        .frame(width: 350, height: 350, alignment: .center)
//
//                    Spacer()
//                        .frame(width: 150)
//
//                    Button{
//                        offset = min(offset + getScreenBounds().width * 2,
//                                     getScreenBounds().width * 2)
//                    }label: {
//                    ZStack{
//                        Image("camera")
//                            .aspectRatio(contentMode: .fit)
//                            .padding(.top, 60)
//                            .frame(width: 350, height: 350, alignment: .center)
//
//                                }//ZStack
//                    }//Button
//
//                        Spacer()
//
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(Color("Pink"))
//                        .frame(width: 350, height: 70)
//                        .padding(.top, -50)
//
//                    HStack(spacing: 20){
//
//
//                          Button{
//                              offset = min(offset + getScreenBounds().width * 2,
//                                           getScreenBounds().width * 2)
//                          }label: {
//                          ZStack{
//                              RoundedRectangle(cornerRadius: 30)
//                                  .fill(Color("Brown"))
//                                  .frame(width: 150, height: 50)
//                                  .padding(.top, 80)
//                                  .shadow(color: .gray, radius: 5, x: 0, y: 5)
//
//
//                                      Text("Skin Care")
//                                          .font(.custom("Livvic-SemiBoldItalic", size: 15))
//                                          .foregroundColor(Color("White"))
//                                          .padding(.top, 80)
//                                          .multilineTextAlignment(.center)
//
//
//                                      }//ZStack
//                          }//Button
//
//                        Button{
//                            offset = min(offset + getScreenBounds().width * 2,
//                                         getScreenBounds().width * 2)
//                        }label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 30)
//                                .fill(Color("Brown"))
//                                .frame(width: 150, height: 50)
//                                .padding(.top, 80)
//                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
//
//
//                                    Text("Beauty Care")
//                                        .font(.custom("Livvic-SemiBoldItalic", size: 15))
//                                        .foregroundColor(Color("White"))
//                                        .padding(.top, 80)
//                                        .multilineTextAlignment(.center)
//
//
//                                    }//ZStack
//                        }//Button
//                    }
//                    .padding(.top, -150)
//
//                }//VStack
//
//
//            }else if getIndex() == 1{
//
//                VStack(spacing: 10){
//
//                }//VStack
//
//
//            }else if getIndex() == 2{
//
//                VStack(spacing: 10){
//                    VStack{
//               Image("BlobAi")
//                   .frame(width: 300, height: 300, alignment: .center)
//                   .padding(.top, -450)
//
//
//
//                   Text("Jeandrè")
//                       .font(.custom("Livvic-Medium", size: 15))
//                       .foregroundColor(Color("Black"))
//                       .padding(10)
//                       .padding(.top, -350)
//
//                        Text("Jeandrè")
//                            .font(.custom("Livvic-Medium", size: 15))
//                            .foregroundColor(Color("Black"))
//                            .padding(10)
//                            .padding(.top, -330)
//
//                        Text("Jeandrè")
//                            .font(.custom("Livvic-Medium", size: 15))
//                            .foregroundColor(Color("Black"))
//                            .padding(10)
//                            .padding(.top, -310)
//
//           }
//
//                }//VStack
//
//            }
//
//        }
//    }
//
//        func getIndex()->Int{
//            let progress = (offset / getScreenBounds().width).rounded()
//
//            return Int(progress)
//        }
//
//}

        


struct FaceScanView_Previews: PreviewProvider {
    static var previews: some View {
        FaceScanView()
    }
}
