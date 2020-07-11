//
//  GameLevelViewController.swift
//  FootbalQuiz
//
//  Created by raiyan sharif on 11/7/20.
//  Copyright © 2020 raiyansharif. All rights reserved.
//

import UIKit

class GameLevelViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    // Assistant Editor
    // Control-Click-Drag Button
    // Change to Action to return function
    // outlet collection for tileSelected
    
    @IBAction func tileSelected(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board
        let pos = board!.getRowAndColumn(forTile: sender.tag)
        let buttonBounds = sender.bounds
        var buttonCenter = sender.center
        var slide = true
        if board!.canSlideTileUp(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.y -= buttonBounds.size.height
        } else if board!.canSlideTileDown(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.y += buttonBounds.size.height
        } else if board!.canSlideTileLeft(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.x -= buttonBounds.size.width
        } else if board!.canSlideTileRight(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.x += buttonBounds.size.width
        } else {
            slide = false
        }
        if slide {
            board!.slideTile(atRow: pos!.row, Column: pos!.column)
            // sender.center = buttonCenter // or animate the change
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {sender.center = buttonCenter})
            if (board!.isSolved()) {
                UIView.animate(withDuration: 0.5) { () -> Void in
                    self.view.window!.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }
                
                UIView.animate(withDuration: 0.5, delay: 0.45, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                    self.view.window!.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
                }, completion: nil)
            }
        } // end if slide
    } // end tileSelected
    
    //@IBAction func shuffleTiles(_ sender: AnyObject) {
    @IBAction func shuffleTiles(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board!
        let shuffle = (sender.tag == 30)
        
        if (shuffle) {
            board.scramble(numTimes: appDelegate.numShuffles)
            sender.tag = 31
            sender.title = "Solve"
            self.boardView.setNeedsLayout()
        } else {
            sender.tag = 30
            sender.title = "Shuffle"
            board.resetBoard()
            self.boardView.setNeedsLayout()
        }
    }  // end shuffleTiles()
    
    @IBAction func switchView(_ sender: UIBarButtonItem) {
        let viewOff = (sender.tag == 20)
        
        if (viewOff) {
            sender.tag = 21
            sender.title = "Image"
            boardView.switchTileImages(false)
        } else {
            sender.tag = 20
            sender.title = "Numbers"
            boardView.switchTileImages(true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    @IBAction func home_button_pressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
