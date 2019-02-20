//
//  SoundViewController.swift
//  SwiftMousouLINE
//
//  Created by Naoki Arakawa on 2019/02/19.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var timer1 = Timer()
    
    var countUp = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面が初めに表示された時に非表示にする
        imageView2.isHidden = true
        
        //ラベルを非表示
        timeLabel.isHidden = true
        
        //音声を再生する
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
            do {
             
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                //プレイヤー作成失敗
                //その場合は、プレイヤーはnilとする
                audioPlayer = nil

            }
            
        } else {
            
         //urlがnilなので再生できない
            fatalError("Url is nil.")
            
            
        }
    }
    
    
    @IBAction func tap(_ sender: Any) {
        
        //imageView2の非表示を表示に変える
        imageView2.isHidden = false
        timeLabel.isHidden = false
        timeLabel.text = "0"
        
        //タイマーをスタートさせてラベルに秒数を表示
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (Timer) in
            
            //カウントアップをしていく
            self.countUp += 1
            
            
            //その数字をラベルに反映
            self.timeLabel.text = String(self.countUp)
            
        })
        
        //baby.mp3の音声を再生する
        babyVoice()

        
    }
    
    func babyVoice() {
        
    
    
    if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            
        } catch {
            //プレイヤー作成失敗
            //その場合は、プレイヤーはnilとする
            audioPlayer = nil
            
        }
        
    } else {
    
    //urlがnilなので再生できない
    fatalError("Url is nil.")
    
    
    }
        
    }
    
    
    
    @IBAction func deny(_ sender: Any) {
        
        //電話を切る
        
        //音声をストップさせる
        audioPlayer?.stop()
        
        //画面をViewControllerに戻す
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
    

   
}
