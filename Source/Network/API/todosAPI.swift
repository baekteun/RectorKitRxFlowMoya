//
//  todosAPI.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Moya

enum todosAPI{
    case fetchTodos
    
}

extension todosAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/todos")!
    }
    
    var path: String {
        switch self{
        case .fetchTodos:
            return "/"
        }
    }
    
    var method: Method {
        switch self{
        case .fetchTodos:
            return .get
        }
    }
    
    var task: Task {
        switch self{
        case .fetchTodos:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
