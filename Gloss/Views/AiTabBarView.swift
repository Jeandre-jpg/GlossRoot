//
//  AiTabBarView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/17.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct AiTabBarPreviewView: View {

    var body: some View {

        VStack {
            
            AiTabBarView(optionSelected:
                    .constant(0))
        }.background(Color("Pink"))
            .edgesIgnoringSafeArea(.all)
            .frame(width: 60, height: 50)
    }
}

struct AiTabBarView : View  {
    @Binding var optionSelected : Int

    var body : some View {
        ZStack(alignment: .center) {
            VerticalView(optionSelected: self.$optionSelected)
                .padding(.vertical, 65)
                .frame(width: 60, height: 350)
               


        }.background(.regularMaterial,
                     in: RoundedRectangle(cornerRadius: 100, style: .circular))
            .edgesIgnoringSafeArea(.all)





    }
}


struct VerticalView : View {

    @Binding var optionSelected : Int

    var body : some View {
        VStack {
            VStack {
                Button(action: {
                    self.optionSelected = 4
                }) {
                    VStack(spacing: 20){
                        Text("SCAN")
                            .rotationEffect(Angle(degrees: 270))
                            .font(.custom("Livvic-Regular", size: 10))
                            .foregroundColor(Color("Black"))
                            .padding(10)
                            .tracking(1)
                        
                    }
                }.foregroundColor(self.optionSelected == 4 ? .brown : .brown)

                
                Spacer()
                    .frame(height: 15)

                Button(action: {
                    self.optionSelected = 5
                }) {
                    VStack(spacing: 10){
                        Text("VIEW")
                            .rotationEffect(Angle(degrees: 270))
                            .font(.custom("Livvic-Bold", size: 10))
                            .foregroundColor(Color("Black"))
                            .padding(10)
                            .tracking(1)
                        
                    }
                }.foregroundColor(self.optionSelected == 5 ? .brown : .brown)

                Spacer()
                    .frame(height: 15)

                Button(action: {
                    self.optionSelected = 6
                }) {
                    VStack(spacing: 10){
                        Text("TRACK")
                            .rotationEffect(Angle(degrees: 270))
                            .font(.custom("Livvic-Regular", size: 10))
                            .foregroundColor(Color("Black"))
                            .padding(10)
                            .tracking(1)
                    }
                }.foregroundColor(self.optionSelected == 6 ? .brown : .brown)

            }
        }

    }
}



struct AiTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AiTabBarPreviewView()
    }
}
