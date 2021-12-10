//
//  NetworkManager.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxSwift
import Moya

protocol NetworkManagerType: class{
    func fetchTodos() -> Single<Response>
}

final class NetworkManager: NetworkManagerType{
    static let shared = NetworkManager()
    
    private let provider = MoyaProvider<todosAPI>()
    
    func fetchTodos() -> Single<Response> {
        return provider.rx.request(.fetchTodos, callbackQueue: .global())
    }
    
    
}
