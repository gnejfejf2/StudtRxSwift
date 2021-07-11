//
//  MemortStorage.swift
//  StudyRxSwift
//
//  Created by kang jiyoun on 2021/07/11.
//

import Foundation
import RxSwift

class MemoryStorage : MemoStorageType {
    private var list : [Memo] = [Memo(content: "Hello"),Memo(content: "RxSwift")]
    
    ///BehaviorSubject는 구독 후에 가장 최근 아이템을 전달합니다.
    ///메모값이 변경된후 전달하는 변수같음
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        //onNext -> 새로운값을 전달
        store.onNext(list)
        
        return Observable.just(memo)
    }
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updateMemo = Memo(original: memo, content: content)
        if let index = list.firstIndex(where: {$0 == memo }){
            list.remove(at: index)
            list.insert(updateMemo, at: index)
        }
        store.onNext(list)
        
        
        return Observable.just(updateMemo)
        
    }
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: {$0 == memo }){
            list.remove(at: index)
           
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    
}
