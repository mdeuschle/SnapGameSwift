//
//  ViewController.swift
//  SnapGameSwift
//
//  Created by Matt Deuschle on 1/8/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    var timerInt = 0

    var imageTimer = NSTimer()
    var scoreInt = 0


    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var startOutlet: UIButton!
    @IBOutlet var snapOutlet: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        scoreInt = 0
        timerInt = 20

        scoreLabel.text = String(scoreInt)
        timerLabel.text = String(timerInt)

        // disable snap button so user can't get minus score if images are not matching
        snapOutlet.enabled = false

    }

    @IBAction func snap(sender: AnyObject) {

        // if the image in image1 equals image in image2, give user a point
        if imageView1.image == imageView2.image
        {
            // if true, then perform this action
            scoreInt += 1
            scoreLabel.text = String(scoreInt)
        }
        else
        {
            scoreInt -= 1
            scoreLabel.text = String(scoreInt)
        }
    }
    
    @IBAction func startGame(sender: AnyObject) {

        // if timer equals 20 we can start the game
        if timerInt == 20
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerUpdate"), userInfo: nil, repeats: true)

            startOutlet.enabled = false
            snapOutlet.enabled = true
        }

        // when game ends, make sure able to play again. If the timer = 0, that means the game has ended
        if timerInt == 0
        {
            scoreInt = 0
            timerInt = 20

            scoreLabel.text = String(scoreInt)
            timerLabel.text = String(timerInt)

            startOutlet.setTitle("Start", forState: UIControlState.Normal)

        }

    }

    // trigger every second by NSTimer

    func timerUpdate()
    {
        // take away 1 every time this function statement gets called (every second)
        timerInt -= 1
        timerLabel.text = String(timerInt)


        // everytme this gets called it picks a random number, which equals one of six pics
        let randomOne = arc4random_uniform(6)
        switch (randomOne)
        {
        case 0:
            imageView1.image = UIImage(named: "creature1")
            break
        case 1:
            imageView1.image = UIImage(named: "creature2")
            break
        case 2:
            imageView1.image = UIImage(named: "creature3")
            break
        case 3:
            imageView1.image = UIImage(named: "creature4")
            break
        case 4:
            imageView1.image = UIImage(named: "creature5")
            break
        case 5:
            imageView1.image = UIImage(named: "creature5")
            break
        default:
            break
        }

        let randomTwo = arc4random_uniform(6)
        switch (randomTwo)
        {
        case 0:
            imageView2.image = UIImage(named: "creature1")
            break
        case 1:
            imageView2.image = UIImage(named: "creature2")
            break
        case 2:
            imageView2.image = UIImage(named: "creature3")
            break
        case 3:
            imageView2.image = UIImage(named: "creature4")
            break
        case 4:
            imageView2.image = UIImage(named: "creature5")
            break
        case 5:
            imageView2.image = UIImage(named: "creature5")
            break
        default:
            break
        }



// stop timer once it reaches zero
        if timerInt == 0
        {
            timer.invalidate()

            startOutlet.enabled = true
            snapOutlet.enabled = false

            startOutlet.setTitle("Restart", forState: UIControlState.Normal)
        }

    }


}

