//
//  HomeReactor.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import ReactorKit
import RxFlow
import RxCocoa

final class HomeReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactor
    enum Action{
        case fetchTodos
    }
    enum Mutation{
        case setTodos(_ todos: [Todo])
    }
    struct State{
        var todos: [Todo]?
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension HomeReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetchTodos:
            return fetchTodos()
        default:
            return .empty()
        }
    }
}

// MARK: - Reduce
extension HomeReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setTodos(todos):
            newState.todos = todos
        }
        return newState
    }
}


// MARK: - Method
private extension HomeReactor{
    func fetchTodos() -> Observable<Mutation>{
        return NetworkManager.shared.fetchTodos()
            .filterSuccessfulStatusCodes()
            .map([Todo].self)
            .catch { [weak self] err in
                print(err.localizedDescription)
                self?.steps.accept(TestStep.alert(title: "TestDemo", message: "Failed to fetchTodos"))
                return .never()
            }
            .asObservable()
            .map { Mutation.setTodos($0) }
        
    }
    
}
