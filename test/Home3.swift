//
//  Home3.swift
//  test
//
//  Created by interface on 2021/9/22.
//

import SwiftUI



struct Home3:View {
    var contacts: [Contact] = [
        Contact(name: "John Doe", number: "202-555-0122"),
        Contact(name: "Oscar Hansen", number: "202-555-0147"),
        Contact(name: "Freddie Wilde", number: "202-555-0138"),
        Contact(name: "Maria Owen", number: "202-555-0122")
    ]
    
    @State var x :Int = 0
    // 2.
    @State private var isRedacted: Bool = false
    @State private var isShow:Bool = true
    @State private var isNetwork:Bool = false
    
    var body: some View {
        
        VStack {
            if isNetwork {
                List(contacts) { contact in
                    HStack {
                        Image(systemName: "person.circle.fill")
                        VStack(alignment: .leading) {
                            Text("\(contact.name)")
                            Text("\(contact.number)")
                        }
                    }
                    // 4.
                    .redacted(reason:  isRedacted ? .placeholder : .init())
                    
                }.navigationTitle(Text("Contacts"))
            }else{
                Text("无数据")
            }
            ScrollView(.vertical, showsIndicators: false) {
                Toggle(isOn: $isShow, label: {
                    Text("显示隐藏")
                })
                if isShow{
                    Toggle(isOn: $isShow, label: {
                        Text("Redact View")
                    })
                    Toggle(isOn: $isNetwork, label: {
                        Text("使能网络")
                    })
                    Toggle(isOn: $isRedacted, label: {
                        Text("使能网络")
                    })
                    if isNetwork {
                        List(contacts) { contact in
                            HStack {
                                Image(systemName: "person.circle.fill")
                                VStack(alignment: .leading) {
                                    Text("\(contact.name)")
                                    Text("\(contact.number)")
                                }
                            }
                            // 4.
                            .redacted(reason:  isRedacted ? .placeholder : .init())
                            
                        }.navigationTitle(Text("Contacts"))
                    }else{
                        Text("无数据")
                    }
                    
                }else{
                    Text("网络错误")
                    Button(action: {
                        isShow=true
                    }, label: {
                        Text("重试")
                    })
                }
            }.padding()
        }.onAppear {
         
            Request.get(url: "https://httpbin.org/get") { data in
                let decoder = JSONDecoder()
                do{
                    let people = try decoder.decode(HTTPBinGet.self, from: data)
                    print(people.origin.description)
                }catch{
                }
            }   failed: { err in
                print(err,"---")
            }
        }.onDisappear {
        }
    }
}
