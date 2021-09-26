//
//  ContentView.swift
//  test
//
//  Created by interface on 2021/9/7.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fullText: String = "This is some editable text..."
    @State private var speed = 50.0
    @State private var isEditing = false
    @State private var bbb:Float=80.0
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad{
            NavigationView(content: {
                List {
                    NavigationLink(destination: Text("hello world")) {
                        Text("首页")
                    }
                    NavigationLink(destination: Text("hello world1")) {
                        Text("爱好")
                    }
                    NavigationLink(destination: Text("hello world23")) {
                        Text("我的")
                    }
                }.navigationBarTitle(Text("ContentView"))
//                StackNavigationViewStyle()
//                DoubleColumnNavigationViewStyle()
            }).navigationViewStyle(DoubleColumnNavigationViewStyle())
        }else{
            NavigationView(content: {
                TabView {
                    Home1().tabItem {
                        Image(systemName: "house.fill")
                        Text("首页")
                    }.navigationTitle("").navigationBarHidden(true)
                    Home2().tabItem {
                        Image(systemName: "heart.circle.fill")
                        Text("爱好")
                    }.navigationTitle("").navigationBarHidden(true)
                    Home3().tabItem {
                        Image(systemName: "person.fill")
                        Text("我的")
                    }.navigationTitle("").navigationBarHidden(true)
                }
                .font(.headline).accentColor(Color.pink)
            }).navigationTitle("").navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SubView:View {
    @Binding var title:String
    var body: some View{
        Text(title)
    }
}

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var number: String
}




struct MyButton:View {
    var body:some View{
        Button("Press Me") {
            print("Button pressed!")
        }.foregroundColor(Color.white)
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Capsule())
    }
}


struct geometryReaderView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // 2.
                Text("One")
                    .frame(width: geometry.size.width, height: geometry.size.height/2)
                    .background(Color.red)
                
                HStack {
                    // 3.
                    Text("Two")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(Color.blue)
                    Text("Three")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(Color.yellow)
                }
            }
        }
    }
}
