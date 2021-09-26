//
//  SwiftUIView.swift
//  test
//
//  Created by interface on 2021/9/26.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
            Spacer(minLength: 10)
            Text("OK")
        }.navigationBarTitleDisplayMode(.large)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
