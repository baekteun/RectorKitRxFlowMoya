//
//  TestStep.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

enum TestStep: Step{
    // Global
    case alert(title: String?, message: String?)
    case dismiss
    
    // Home
    case HomeIsRequired
}
