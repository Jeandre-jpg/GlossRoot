//
//  SkinButtonFilter.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/30.
//

import SwiftUI

struct SkinButtonFilter: View {
    

    var placeholder: String
    
    var body: some View {
        
        Text("")
//        ZStack{
//
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(Color("MediumLight"))
//                        .frame(width: 100, height: 35)
//                        .padding(.top, 1)
//                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
//                    Text(placeholder)
//                        .font(.custom("Livvic-SemiBoldItalic", size: 12))
//                        .foregroundColor(Color("Black"))
//                        .padding(.top, 1)
//                        .multilineTextAlignment(.center)
//
//        }//ZSTack
    }
}

struct SkinButtonFilter_Previews: PreviewProvider {
    static var previews: some View {
        SkinButtonFilter(placeholder: "")
    }
}
