//
//  Home1.swift
//  test
//
//  Created by interface on 2021/9/23.
//

import SwiftUI

struct Home1:View {
    @State var isShow:Bool = true
    @State var title:String = "Hello World"
    @AppStorage("username") var username: String = "Anonymous"
    
    @ObservedObject var so:SharedObject = SharedObject()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { proxy in
                VStack{
                    NavigationLink("跳转swift控制器", destination: myController()).frame(width: proxy.size.width, height: 40)
                    NavigationLink("跳转swiftUI界面", destination: SwiftUIView()).navigationBarTitle("title")
                    myView()
                    
                    RoundedRectangle(cornerRadius: 12).frame(width: proxy.size.width, height: 100).foregroundColor(Color.green).gesture(DragGesture().onChanged({ v in
                        print(v.location.x)
                    })).offset(x: 0, y: 0).shadow(radius: 1)
                    //                PlayerView()
                    ZStack{
                        Circle().stroke(Color.gray, lineWidth: 20).opacity(0.1)
                        Circle().trim(from: 0, to: 0.9).stroke(Color.red, lineWidth:20).rotationEffect(.degrees(-90))
                            .overlay(Text("100%"))
                    }.padding(10).frame(width: proxy.size.width, height: 200)
                    
                    //                    Text("Navigate").sheet(isPresented: $isShow, content: {
                    //                        myController()
                    //                    })
                    
                    NavigationLink("跳转geometryReader") {
                        geometryReaderView()
                    }
                }
            }.padding(.horizontal, 8)
        }
    }
}


struct myView:UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let mLable = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20));
        mLable.text = "Hello World"
        mLable.textColor = UIColor.red
        return mLable;
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct myController:UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        //        1.用代码创建控制器类
        
        //        let controller = UIViewController()
        //        let mLable = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20));
        //        mLable.text = "Hello World"
        //        mLable.textColor = UIColor.red
        //        controller.view.addSubview(mLable)
        //        return controller;
        
        //        2.从storyboard实例化控制器类
        let storyboard:UIStoryboard = UIStoryboard(name: "MyStoryBoard", bundle: nil);
        let controller =  storyboard.instantiateViewController(withIdentifier: "myStoryboardController_1")
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
