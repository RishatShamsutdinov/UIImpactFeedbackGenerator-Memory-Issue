//
//  ViewController.swift
//  UIImpacFeebackGeneratorMemoryIssue
//
//  Created by rishat on 04.05.2022.
//

import UIKit

class ViewController: UIViewController {

    private let impactFeedbackGenerators: [UIImpactFeedbackGenerator] = [
        .init(style: .soft),
        .init(style: .medium),
        .init(style: .heavy)
    ]
    private var timers: [Timer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        timers = impactFeedbackGenerators.map({ generator in
            return .scheduledTimer(
                timeInterval: 0.05,
                target: generator,
                selector: #selector(generator.impactOccurred as () -> Void),
                userInfo: nil,
                repeats: true
            )
        })
    }


}

