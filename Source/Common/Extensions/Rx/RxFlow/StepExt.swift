//
//  StepExt.swift
//  RectorKitRxFlowMoya
//
//  Created by 최형우 on 2021/12/11.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

extension Step{
    var asTestStep: TestStep?{
        return self as? TestStep
    }
}
