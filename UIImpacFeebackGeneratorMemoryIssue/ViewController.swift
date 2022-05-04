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

        let delay: TimeInterval = 0.0
        var delayFactor = 0

        timers = impactFeedbackGenerators.map({ generator in
            let timer = Timer.scheduledTimer(
                timeInterval: 0.05 + delay * TimeInterval(delayFactor),
                target: generator,
                selector: #selector(generator.impactOccurred as () -> Void),
                userInfo: nil,
                repeats: true
            )

            delayFactor += 1

            return timer
        })
    }


}

