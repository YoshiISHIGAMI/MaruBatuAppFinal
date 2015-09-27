//
//  checkAnswerController.swift
//  MaruBatuAppFinal
//
//  Created by Yoshi Ishigami on 2015/09/27.
//  Copyright © 2015年 Yoshi Ishigami. All rights reserved.
//

import UIKit
import AudioToolbox
import Alamofire

class checkAnswerController: UITableViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    var soundResults = SystemSoundID(0)
    var soundCorrect = SystemSoundID(1)
    var soundIncorrect = SystemSoundID(2)
    
    var json:[AnyObject] = []
    var questionIndex: Int = 0
    var currentAnser: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSound()
        downloadQuestions()
    }
    
    func getSound(){
        //結果画面用音声ファイルを読み込み
        var soundUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("results", ofType:"mp3")!)
        AudioServicesCreateSystemSoundID(soundUrl, &soundResults)
        
        
        //問題正解用音声ファイルを読み込み
        soundUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("correct", ofType:"mp3")!)
        AudioServicesCreateSystemSoundID(soundUrl, &soundCorrect)
        
        
        //不正解用音声ファイルを読み込み
        soundUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("incorrect", ofType:"mp3")!)
        AudioServicesCreateSystemSoundID(soundUrl, &soundIncorrect)
    }
    
    func downloadQuestions(){
        
        let urlString = "https://dl.dropboxusercontent.com/s/qujld363mbo8olz/quiz_marubatsu.json"
        
        Alamofire.request(.GET, urlString).responseJSON{ _, response, result in
            
            if result.isSuccess, let json = result.value as? [AnyObject]{
                print(json)
            }
            
        }
        
    }
    
    
    @IBAction func tappedNoButton(sender: UIButton) {
        //AudioServicesPlaySystemSound(soundResults)
        //AudioServicesPlaySystemSound(soundCorrect)
        //AudioServicesPlaySystemSound(soundIncorrect)

    }

    @IBAction func tappedYesButton(sender: UIButton) {
        
    }
}