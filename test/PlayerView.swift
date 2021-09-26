import UIKit
import SwiftUI

struct PlayerView:UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
