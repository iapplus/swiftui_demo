//
//  test.swift
//  test
//
//  Created by interface on 2021/9/8.
//

import SwiftUI

struct SubView1:View {
    var body: some View{
        Group{
            Text("hkjhhkhkjkhkh")
        }
        Section(header: Text("header"), footer: Text("hello")){
            List {
                Group {
                    Text("Row 19")
                    Text("Row 2")
                    Text("Row 3")
                    Text("Row 4")
                    Text("Row 5")
                    Text("Row 6")
                }
                Text("----")
                Group {
                    Text("Row 7")
                    Text("Row 8")
                    Text("Row 9")
                    Text("Row 10")
                    Text("Row 11")
                }
            }
        }.navigationTitle("title")
//        List {
//            Group {
//                Text("Row 19")
//                Text("Row 2")
//                Text("Row 3")
//                Text("Row 4")
//                Text("Row 5")
//                Text("Row 6")
//            }
//
//            Group {
//                Text("Row 7")
//                Text("Row 8")
//                Text("Row 9")
//                Text("Row 10")
//                Text("Row 11")
//            }
//        }
        
    }
}

struct SubView1_Previews: PreviewProvider {
    static var previews: some View {
        SubView1()
    }
}


class SharedObject:ObservableObject{
    @Published var name:String = "abcdef"
}
