//
//  BodyModel.swift
//  SHR Assesment
//
//  Created by Sneh  on 02/09/24.
//

import Foundation


struct PostData: Encodable{
    var action: String
    var data: ContentData
}

struct ContentData : Encodable{
    var limit : String
    var lastId : Int
}
