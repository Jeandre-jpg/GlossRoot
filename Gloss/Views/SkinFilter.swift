//
//  SkinFilter.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/30.
//

import SwiftUI


struct SkinFilter: View {
    

    var name: String
    var category: String

    
    var body: some View {
      VStack{
            Text(name)
              .font(.custom("Livvic-SemiBold", size: 12))
              .foregroundColor(Color("Black"))
              .padding(.top, 10)
              .padding(.leading, 10)

          Text(category)
              .font(.custom("Livvic-Regular", size: 15))
              .foregroundColor(Color("Black"))
              .padding(.top, -10)
              .padding(.leading, -70)
  }
    }
}

struct SkinFilter_Previews: PreviewProvider {
    static var previews: some View {
        SkinFilter(name: "", category: "")
    }
}
