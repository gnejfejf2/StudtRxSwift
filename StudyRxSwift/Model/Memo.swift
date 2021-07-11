//
//  Memo.swift
//  StudyRxSwift
//
//  Created by kang jiyoun on 2021/07/11.
//

import Foundation


struct Memo : Equatable {
    var content : String
    var inserDate : Date = Date()
    var identity : String
    
    init(content : String){
        self.content = content
        self.identity = String(self.inserDate.timeIntervalSinceReferenceDate)
    }
    
    init (original : Memo , content : String){
        self = original
        self.content = content
    }
}
