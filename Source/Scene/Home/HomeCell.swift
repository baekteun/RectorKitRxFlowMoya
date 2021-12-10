//
//  HomeCell.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit

final class HomeCell: BaseTableViewCell<Todo>{
    // MARK: - Identifier
    static let identifier = "HOME"
    
    // MARK: - Properties
    private lazy var userIDLabel = UILabel()
    
    private lazy var isCompletedImage = UIImageView()
    
    private lazy var titleLabel = UILabel()
    
    // MARK: - UI
    override func configureCell() {
        super.configureCell()
        addView()
        setLayout()
    }
    private func addView(){
        [userIDLabel, isCompletedImage, titleLabel].forEach{ addSubview($0) }
    }
    private func setLayout(){
        userIDLabel.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(3)
            $0.centerY.equalToSuperview()
        }
        isCompletedImage.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailing).inset(15)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(36)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(userIDLabel.snp.trailing).offset(7)
            $0.trailing.equalTo(isCompletedImage.snp.leading).inset(7)
        }
    }
    override func bind(_ model: Todo) {
        userIDLabel.text = "\(model.userId)"
        titleLabel.text = model.title
        isCompletedImage.image = model.completed ? .init(systemName: "square") : .init(systemName: "checkmark.square")
    }
}
