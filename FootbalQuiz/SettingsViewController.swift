//
//  SettingsViewController.swift
//  FootbalQuiz
//
//  Created by raiyan sharif on 9/7/20.
//  Copyright © 2020 raiyansharif. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController {
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func toggleBtnPressed(_ sender: UISwitch) {
        print(sender.isOn)
//        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Background", ofType: "mp3")!)
        if sender.isOn{
            
//            AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
//            AudioPlayer.prepareToPlay()
//            AudioPlayer.numberOfLoops = 10
//            AudioPlayer.play()
            
            let url = Bundle.main.url(forResource: "Background", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
        else{
//            AudioPlayer.stop()
            player?.stop()
        }
    }
    
    @IBAction func homeBtnPress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
