//
//  ApiManager.swift
//  SHR Assesment
//
//  Created by Sneh  on 02/09/24.
//

import Foundation

class ApiManager {
    
   static let shared = ApiManager()
    
    func fetchApiData(lastid:Int, completionHandler: @escaping (_ model: DataModel?, _ error: Error?) -> Void) {
        let url = URL(string: "https://www.mysuperhumanrace-uat.com/api/liveFeedApis")
        var request =  URLRequest(url: url!)
        request.httpMethod = "POST"
        var message = PostData(action: "get_live_feed", data: ContentData(limit: "10", lastId: lastid))
        let data = try! JSONEncoder().encode(message)
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
     
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            print(data)
            if let error = error {
                print(error)
                completionHandler(nil, error)
            }
            
            guard let data = data else {
                completionHandler(nil,nil)
                return }
           print( data.prettyPrintedJsonString)
            
            do {
               let decodedResponse = try JSONDecoder().decode(DataModel.self, from: data)
                completionHandler(decodedResponse, nil)
            } catch {
                print(error)
                completionHandler(nil, error)
                
            }
            let statusCode = (response as! HTTPURLResponse).statusCode

                if statusCode == 200 {
                    print("SUCCESS")
                } else {
                    print("FAILURE")
                }
        }
        
        task.resume()
    }

}


public extension Data {
var prettyPrintedJsonString: NSString? {
// build json object with data
guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
// Convert data to string
let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
// replaced occurrences needed for url'slashes.
return prettyPrintedString.replacingOccurrences(of: "\\/", with: "/") as NSString
}
}
