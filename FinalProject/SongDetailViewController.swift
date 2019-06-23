//
//  SongDetailViewController.swift
//  FinalProject
//
//  Created by kevin on 2019/6/23.
//  Copyright © 2019 kevin. All rights reserved.
//

import UIKit
import AVFoundation

class SongDetailViewController: UIViewController {
    var song: Song!
    var looper: AVPlayerLooper?
    var playList = [Song]()
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var singerName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let songs = Song.readSongFromFile()
        {
            self.playList = songs
        }
        
        
        var songname:String = "歌曲: "
        songname += song.trackName
        
        var singername:String = "歌手: "
        singername += song.artistName
        var collectionname:String = "專輯: "
        collectionname += song.trackName
        
        var pprice:String = "＄"
        pprice += String(format: "%.2f",song.trackPrice!)
        
        
        songName.text =  songname
        singerName.text = singername
        collectionName.text = collectionname
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var dateString = dateFormatter.string(from: song.releaseDate)
        var date:String = "發行日期: "
        date += dateString
        releaseDate.text = dateString
        price.text = pprice
        //loop playing
        let url = song.previewUrl
        let player = AVQueuePlayer()
        let item = AVPlayerItem(url: url)
        looper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
        
    }
    
    @IBAction func AddLoveButtonPressed(_ sender: Any) {
        self.playList.append(self.song)
        Song.saveToFile(songs: self.playList)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
