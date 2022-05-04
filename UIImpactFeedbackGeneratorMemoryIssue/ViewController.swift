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
            return .scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                generator.impactOccurred()

                // simulate background workload of a Unity engine
                for _ in 0..<10 {
                    DispatchQueue.global().async {
                        for _ in 0...100 {
                            autoreleasepool {
                                let _ = arc4random()
                            }
                        }
                    }
                }
            }
        })
    }


}

