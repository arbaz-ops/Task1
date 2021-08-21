//
//  ViewController.swift
//  Task1
//
//  Created by Mac on 20/08/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        progressView.progress = 0.0
    }
    
    
    
    @IBAction func downloadTapped(_ sender: Any) {
    
        AF.request("https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg").downloadProgress { progress in
            let downloadProgress = Float(progress.fractionCompleted)
            self.progressView.progress = downloadProgress
            
        }.responseData { response in
            guard let data = response.data else {
                return
            }
            self.imageView.image = UIImage(data: data)
            
        }
    
    }
    

}

