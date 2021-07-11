//
//  MemoStorage.swift
//  StudyRxSwift
//
//  Created by kang jiyoun on 2021/07/11.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    //에러를 안뛰어주게 하는기능
    @discardableResult
    func createMemo(content : String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo : Memo , content : String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo : Memo) -> Observable<Memo>
}
