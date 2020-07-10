//
//  GameOptionViewController.swift
//  FootbalQuiz
//
//  Created by raiyan sharif on 10/7/20.
//  Copyright © 2020 raiyansharif. All rights reserved.
//

import UIKit

class GameOptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func hoem_btn_pressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func play_game_level(_ sender: UIButton) {
        print(sender.tag)
        if(sender.tag == 1){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameLevelViewController") as! GameLevelViewController
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated:true, completion:nil)
        }

    }
    
    
    
}
