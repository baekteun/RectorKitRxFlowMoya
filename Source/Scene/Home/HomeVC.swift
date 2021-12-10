//
//  HomeVC.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RxRelay
import RxViewController

final class HomeVC: baseVC<HomeReactor>{
    // MARK: - Properties
    private let tableView = UITableView().then {
        $0.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
    }
    
    
    
    // MARK: - UI
    override func addView() {
        [tableView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    override func configureVC() {
    }
    
    // MARK: - Reactor
    override func bindAction(reactor: HomeReactor) {
        self.rx.viewWillAppear
            .map { _ in Reactor.Action.fetchTodos }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    override func bindState(reactor: HomeReactor) {
        let shareState = reactor.state.share(replay: 1)
        
        shareState
            .compactMap { $0.todos }
            .bind(to: self.tableView.rx.items(cellIdentifier: HomeCell.identifier, cellType: HomeCell.self)) { index, element, cell in
                cell.model = element
            }
            .disposed(by: disposeBag)
    }
}
