//
//  TabBarView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/15.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct TabBarPreviewView: View {

    var body: some View {

        VStack {
            Spacer()
            TabBarView(optionSelected:
                    .constant(0))
        }.background(Color("Pink"))
            .edgesIgnoringSafeArea(.top)
    }
}

struct TabBarView : View  {
    @Binding var optionSelected : Int

    var body : some View {
        ZStack(alignment: .top) {
            HorizontalView(optionSelected: self.$optionSelected)
                .padding(.top, 20)
                .padding(.bottom, -10)
                .padding(.horizontal, 35)
                .background(Color("White"))


        }.background(.regularMaterial,
                     in: RoundedRectangle(cornerRadius: 40, style: .continuous))
            .edgesIgnoringSafeArea(.all)





    }
}

struct HorizontalView : View {

    @Binding var optionSelected : Int

    var body : some View {
        VStack {
            HStack {
                Button(action: {
                    self.optionSelected = 0
                }) {
                    VStack(spacing: 10){
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                            .frame(width: 35, height: 35, alignment: .center)

                        Text("Home")
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                    }
                }.foregroundColor(self.optionSelected == 0 ? .brown : .brown)

                Spacer()


                Button(action: {
                    self.optionSelected = 1
                }) {
                    VStack(spacing: 10){
                        Image("skincare")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                            .frame(width: 35, height: 35, alignment: .center)

                        Text("Skin care")
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                    }
                }.foregroundColor(self.optionSelected == 1 ? .brown : .brown)

                Spacer()

                Button(action: {
                    self.optionSelected = 2
                }) {
                    VStack(spacing: 10){
                        Image("eye")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                            .frame(width: 35, height: 35, alignment: .center)

                        Text("Beauty")
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))
                    }
                }.foregroundColor(self.optionSelected == 2 ? .brown : .brown)

                Spacer()

                Button(action: {
                    self.optionSelected = 3
                }) {
                    VStack(spacing: 10){
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                            .frame(width: 35, height: 35, alignment: .center)

                        Text("Account")
                            .font(.custom("Livvic-Regular", size: 12))
                            .foregroundColor(Color("Brown"))

                    }
                }.foregroundColor(self.optionSelected == 3 ? .brown : .brown)

            }
        }

    }
}



struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPreviewView()
    }
}
