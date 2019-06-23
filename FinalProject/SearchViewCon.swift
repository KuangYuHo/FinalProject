//
//  SearchViewCon.swift
//  FinalProject
//
//  Created by kevin on 2019/6/23.
//  Copyright © 2019 kevin. All rights reserved.
//

import UIKit

class SearchViewCon: UIViewController {
    var lock = 0
    @IBOutlet weak var searchText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func searchBottonPressed(_ sender: Any) {
        
    }
    override func prepare(for segue:UIStoryboardSegue,sender:Any?)
    {
        if let identifier = segue.identifier,let number = Int(identifier)
        {
            if(number==1)
            {
                let controller = segue.destination as! SearchResultTableViewController
                let urlF = "https://itunes.apple.com/search?term="
                let urlS = searchText.text
                //print(urlS)
                let urlL = "&media=music"
                controller.urlStr = urlF + urlS! + urlL
            
            }
            else if(number==0)
            {
                print("playlist")
            }
        }
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
