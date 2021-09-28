//
//  Home2.swift
//  test
//
//  Created by interface on 2021/9/22.
//
import SwiftUI

struct Home2:View {
    @State var isShow:Bool = false
    @State var isShow1Button:Bool = true
    
    @State var li1:[String] = ["a","b","c"]
    
    @ObservedObject var so:SharedObject = SharedObject()
    
    
    @State var ip:String = "点击开始网络请求"
    var body: some View {
//        List(1..<100) { row in
//            Text("Row \(row)")
//        }
//        .refreshable {
//            print("Do your refresh work here")
//        }
        ScrollView(.vertical, showsIndicators: true, content: {

            
            ForEach(li1,id: \.self){ l in
                Text(l)
            }
            
            if isShow1Button {
                Button{
                    isShow1Button = false
                } label: {
                    Image(systemName: "chevron.left").font(.body.bold()).foregroundColor(Color.blue).frame(width: 40, height: 40).background(RoundedRectangle(cornerRadius: 12.0).strokeBorder(Color.blue.opacity(0.8),lineWidth: 1))
                }
            }else{
                Button("点击") {
                    isShow1Button = true
                }
            }
            
            
            
            
            Text("Hello World 2").frame(width: UIScreen.main.bounds.width, alignment: .leading)
            Text(so.name)
            Spacer(minLength: 100)
            Button(ip) {
                print("网络请求")
                
                let json = """
                {
                    "name": "Durian"
                }
                """.data(using: .utf8)!
                
                
                
                if let decodedResponse = try? JSONDecoder().decode(Person.self, from: json){
                    print(decodedResponse.name)
                }
                Task{
                    let rrr = Request()
                    await rrr.test()
                }
                Request.get(url: "https://httpbin.org/get") { data in
                    let decoder = JSONDecoder()
                    
                    do{
                        let people = try decoder.decode(HTTPBinGet.self, from: data)
                        print(people.origin.description)
                        ip = people.origin.description
                    }catch{
                        
                    }
                    
                    
                }   failed: { err in
                    print(err,"---")
                }
                
                isShow = true
            }.actionSheet(isPresented: $isShow) {
                ActionSheet(
                    title: Text("标题"),
                    message: Text("消息"),
                    buttons: [
                        .destructive(Text("Import"),
                                     action: {
                                         print("Import")
                                     }),
                        .cancel()
                    ])
            }
            MyButton().opacity(0).animation(.easeIn(duration: 2).delay(2))
            Button("Press Me") {
                print("Button pressed!")
                so.name="Hello 12345"
            }
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            
            //            Button("Tap Me") {
            //                withAnimation(.interpolatingSpring(
            //                                mass: 1,
            //                                stiffness: 80,
            //                                damping: 4,
            //                                initialVelocity: 0)) {
            //                    self.isShow.toggle()
            //                }
            //            }
            //            .offset(y: isShow ? 40 : 0)
            
            Text("Hello World 2").font(.system(size: 22)).rotationEffect(.degrees(90)).foregroundColor(.red)
            
        })
    }
}

struct Person:Codable{
    let name: String
}
