//
//  ViewController.swift
//  DiceDeomApp
//
//  Created by Inkswipe on 5/29/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit

import AVFoundation


class ViewController: UIViewController,GameOverModelDelegate {
    func playAgain() {
        timer?.invalidate()
        timer = nil
        LastCounter = 0
        counter = 0
        let buttonAbsoluteFrame = self.view1.convert(self.view1.bounds, to: self.mainBackView)
        self.player1.frame = CGRect(x: buttonAbsoluteFrame.origin.x+self.view1.frame.height/2-15, y: buttonAbsoluteFrame.origin.y+self.view1.frame.width/2-15, width: 30, height: 30)
        self.diceBtn.isUserInteractionEnabled = true
    }
    

    
    var player: AVAudioPlayer?
    var player1: UIImageView!
    
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var view1: DiagonalLine!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: ArrowLeft!
    @IBOutlet weak var view5: DiagonalLine!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: ArrowDwon!
    @IBOutlet weak var view9: DiagonalLine!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: ArrowRignt!
    @IBOutlet weak var view13: DiagonalLine!
    @IBOutlet weak var view14: UIView!
    @IBOutlet weak var view15: UIView!
    @IBOutlet weak var view16: ArrowUP!
    @IBOutlet weak var view17: UIView!
    @IBOutlet weak var view18: ArrowRignt!
    @IBOutlet weak var view19: UIView!
    @IBOutlet weak var view20: ArrowDwon!
    @IBOutlet weak var view21: UIView!
    @IBOutlet weak var view22: ArrowLeft!
    @IBOutlet weak var view23: UIView!
    @IBOutlet weak var view24: ArrowUP!
    @IBOutlet weak var viewFinal: DiagonalLineCenter!
    
    @IBOutlet weak var diceBtn: UIButton!
    var counter = 0
    var LastCounter  = 0
    var timer : Timer?
    var viewArray : [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewArray.append(contentsOf: [view2,view3,view4,view5,view6,view7,view8,view9,view10,view11,view12,view13,view14,view15,view16,view17,view18,view19,view20,view21,view22,view23,view24,viewFinal])
        
        self.diceBtn.setImage(UIImage(named: "\(1)"), for: .normal)
        self.diceBtn.setImage(UIImage(named: "\(1)"), for: .focused)
        self.diceBtn.setImage(UIImage(named: "\(1)"), for: .highlighted)
        player1 = UIImageView(image: UIImage(named: "markerpng"))
        let buttonAbsoluteFrame = self.view1.convert(self.view1.bounds, to: self.mainBackView)
        self.player1.frame = CGRect(x: buttonAbsoluteFrame.origin.x+self.view1.frame.height/2-15, y: buttonAbsoluteFrame.origin.y+self.view1.frame.width/2-15, width: 30, height: 30)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        //tapGestureRecognizer.numberOfTapsRequired = 1
        player1.isUserInteractionEnabled = false
        player1.addGestureRecognizer(tapGestureRecognizer)
        self.mainBackView.addSubview(player1)
       
       
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.start()
        player1.isUserInteractionEnabled = false
        //self.diceBtn.isUserInteractionEnabled = true
        
    }
    func start()
    {
        //counter = 1
        if timer == nil
        {
            
            timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    override func viewDidLayoutSubviews() {
       
       
        
    }
    @objc func timerAction() {
        
        //self.player1.transform = CGAffineTransform(scaleX: 1, y: 1)
        self.move()
   
    }
    
    func move()
    {
       
        if counter < LastCounter
        {
           if viewArray.count != counter
           {
            let viewSelect = viewArray[counter]
            
            self.playSound(name: "Water Drop Sound High", exte: "wav")
            //self.player1.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                let buttonAbsoluteFrame = viewSelect.convert(viewSelect.bounds, to: self.mainBackView)
                self.player1.frame = CGRect(x: buttonAbsoluteFrame.origin.x+viewSelect.frame.height/2-15, y: buttonAbsoluteFrame.origin.y+viewSelect.frame.width/2-15, width: 30, height: 30)
                self.mainBackView.addSubview(self.player1)
                self.player1.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                
                
            }, completion: { finished in
                
               
                 self.player1.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
             counter += 1
            }
            else
            {
                self.diceBtn.isUserInteractionEnabled = true
                timer?.invalidate()
                timer = nil
                LastCounter = 0
                counter = 0
                let buttonAbsoluteFrame = self.view1.convert(self.view1.bounds, to: self.mainBackView)
                self.player1.frame = CGRect(x: buttonAbsoluteFrame.origin.x+self.view1.frame.height/2-15, y: buttonAbsoluteFrame.origin.y+self.view1.frame.width/2-15, width: 30, height: 30)
            }
        }
        else
        {
            self.diceBtn.isUserInteractionEnabled = true
            timer?.invalidate()
            timer = nil
            LastCounter = 0
        }
        
        if counter == 24
        {
            print("End Game")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameOverModel") as! GameOverModel
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
        
        
    }
    
    
    @IBAction func diceBtnClicked(_ sender: UIButton) {
        
        self.playSound(name: "MANYDICE", exte: "WAV")
        player1.isUserInteractionEnabled = true
        let randomNum:UInt32 = arc4random_uniform(6)
        sender.setImage(UIImage(named: "\(randomNum+1)"), for: .normal)
        sender.setImage(UIImage(named: "\(randomNum+1)"), for: .focused)
        sender.setImage(UIImage(named: "\(randomNum+1)"), for: .highlighted)
        LastCounter = Int(counter + Int(randomNum+1))
        
        if LastCounter > 24
        {
            LastCounter = 0
            self.diceBtn.isUserInteractionEnabled = true
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            sender.transform = sender.transform.rotated(by: CGFloat(Double.pi))
        }) { (finished) -> Void in
            
            
        }
        
        sender.isUserInteractionEnabled = false
        self.imageTapped(tapGestureRecognizer: UITapGestureRecognizer())
        
    }
    
    
    func foucus()  {
    
        if timer == nil
        {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction1), userInfo: nil, repeats: true)
        }
    }
     @objc func timerAction1() {
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
              self.player1.transform = CGAffineTransform(scaleX: 2, y: 2)
            
        }, completion: { finished in
             self.player1.transform = CGAffineTransform(scaleX: 1, y: 1)
            UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
            }, completion: { finished in
                
                  self.player1.transform = CGAffineTransform(scaleX: 1, y: 1)
                // self.player1.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
            })
            // self.player1.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
        })
        
    }

    func playSound(name:String!,exte:String!) {
        guard let url = Bundle.main.url(forResource: name, withExtension: exte) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
   
    

}

