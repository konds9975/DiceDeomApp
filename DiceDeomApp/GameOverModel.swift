//
//  GameOverModel.swift
//  DiceDeomApp
//
//  Created by Inkswipe on 5/30/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit
protocol GameOverModelDelegate {
    func playAgain()
}

class GameOverModel: UIViewController {

     var delegate: GameOverModelDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.isOpaque = false
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .clear
    }

    @IBAction func playAgainBtnClicked(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        self.delegate?.playAgain()
        
    }
    


}
