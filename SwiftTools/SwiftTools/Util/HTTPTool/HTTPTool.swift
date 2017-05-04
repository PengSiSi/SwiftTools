//
//  HTTPTool.swift
//  SwiftTools
//
//  Created by 思 彭 on 2017/5/4.
//  Copyright © 2017年 思 彭. All rights reserved.

// 

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

private let HttpToolShareInstance = HTTPTool()

// 请求方式
enum MethodType {
    case GET
    case POST
}

/// 单例调用
class HTTPTool {
    
    class var shareInstance: HTTPTool {
        return HttpToolShareInstance
    }
}

extension HTTPTool {
    
    //MARK: GET && POST请求
    
    /// Get或者Post请求
    ///
    /// - Parameters:
    ///   - type: 请求方式
    ///   - URLString: 请求URL
    ///   - parameters: 请求参数
    ///   - success: 成功的回调
    ///   - failture: 失败的回调
    func requestData(_ type: MethodType, URLString: String, parameters: [String: Any]? = nil, success : @escaping (_ response : [String : AnyObject])->(),failture : @escaping (_ error : Error)->()) {
    
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters)
            .responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                // 成功的回调
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    //  if let value = response.result.value as? [String: AnyObject] {
                    success(value as! [String : AnyObject])
                    let json = JSON(value)
                    print(json)
                // 失败的回调
                case .failure(let error):
                    failture(error)
                    print("error:\(error)")
                }
        }
    }
    
    //MARK: 图片上传
    ///
    /// - Parameters: 参数
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success: 成功回调
    ///   - failture: 失败回调
    
    func upLoadImageRequest(URLString : String, params:[String:String], data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        let headers = ["content-type":"multipart/form-data"]
        Alamofire.upload(multipartFormData: { multipartFormData in
                //666多张图片上传
                let flag = params["flag"]
                let userId = params["userId"]
                
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
                
                for i in 0..<data.count {
                    multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
                }
        },
            to: URLString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
                            let json = JSON(value)
                            print(json)
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    failture(encodingError)
                }
        }
        )
    }
    
    //MARK: 文件下载
    
    ///   - URLString: 服务器url
    ///   - fileName: 文件名
    ///   - filePath: 文件路径
    
    func downLoadFileRequest(URLString: String, fileName: String, filePath: String) {
        /*
        let fileManager = FileManager.default
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let aFilePath = docPath.appendingPathComponent(filePath)
        let aFileNamePath = (aFilePath as NSString).appendingPathComponent(fileName)
        // 判断文件是否存在
        if fileManager.fileExists(atPath: aFilePath) {
            //文件夹路径存在
            if fileManager.fileExists(atPath: aFileNamePath) {
                
                // 提示: 此文件已下载，请在已下载中查看
            } else {
//                Alamofire.download(URLString, to: aFileNamePath)
            }
        }
 */
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent(filePath)
            let aFilePath = fileURL.appendingPathComponent(fileName)
            //两个参数表示如果有同名文件则会覆盖，如果路径中文件夹不存在则会自动创建
            return (aFilePath, [.removePreviousFile, .createIntermediateDirectories])
        }
        print(destination)
        //开始下载
        Alamofire.download(URLString, to: destination)
            .response { response in
                print(response)
                
                if let data = response.request?.value {
                    print("下载完毕!")
                    // 下载路径: file:///Users/sipeng/Library/Developer/CoreSimulator/Devices/59E51096-9523-4845-84E8-2BB5360FB50E/data/Containers/Data/Application/4610B75F-E375-4B53-BA81-58B056745AE7/Documents/sisi/logo.png
                    print(data)
                }
         }
    }
}
