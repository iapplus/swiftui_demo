//
//  request.swift
//  test
//
//  Created by interface on 2021/9/8.
//

import Foundation

class Request {
    static func get(url:String,success: @escaping (_ response:Data)->(),failed:@escaping (_ errMsg:Error)->()) {
        guard let url = URL(string: url) else {
            failed("Invalid URL" as! Error)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod="GET"
        URLSession.shared.dataTask(with: request){jsonData,request,err in
            
            if err==nil{
                guard let d = jsonData else{
                    return
                }
                success(d)
            }else{
                failed(err!)

            }
        }.resume()
    }
}
