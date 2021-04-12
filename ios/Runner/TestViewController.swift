//
//  TestViewController.swift
//  Runner
//  Created by: TrungNam on 2021/04/08
//  Copyright © 2018 Money Forward, Inc. All rights reserved.
//


import Foundation
import AloeStackView
import RxSwift
import RxCocoa

class TestViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    lazy var boost = FlutterBoost.instance()
    override func viewDidLoad() {
        super.viewDidLoad()
        let alo = AloeStackView()
        alo.frame = view.frame
    
        view.addSubview(alo)
        view.layoutSubviews()
        view.layoutIfNeeded()
        
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.text = "go to Flutter page"
        btn.rx.tap.asDriver()
            .throttle(.seconds(1))
            .debug()
            .drive { [weak self] _ in
                print("go to Flutter page")
                self?.boost?.open("tab_flutter1", arguments: [
                    "animated": false
                ])
                                
            }.disposed(by: self.disposeBag)
        
    
        alo.addRow(btn)
        

    }
}
