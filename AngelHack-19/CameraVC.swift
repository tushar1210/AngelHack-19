//
//  CameraVC.swift
//  AngelHack-19
//
//  Created by Tushar Singh on 04/05/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import CameraBackground
import Firebase

class CameraVC: UIViewController {

    var ctr=0
    var imageArr = [UIImage()]
    
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArr.removeAll()
        self.view.addCameraBackground(showButtons: true,
            buttonMargins: UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10),
            buttonsLocation: .top)
    }
    
     override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func addCapturedImages(img:UIImage){
        let imageView = UIImageView(frame: CGRect(x: 20, y: 50+ctr*100, width: 100, height: 100))
        imageView.image = img
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
        
    }
    
    
    
    @IBAction func sendButton(_ sender: Any) {
        if imageArr.count>0{
            performSegue(withIdentifier: "3", sender: nil)
        }else{
            let alert = UIAlertController(title: "Pictures needed", message: "Atleast one picture is needed to be selected", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert,animated: true)
        }
    }
    @IBAction func captureButton(_ sender: Any) {
        if ctr>=3{
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            let retry = UIAlertAction(title: "Retry", style: .default) { (action) in
                self.reloadViewFromNib()
                self.ctr=0
                self.imageArr.removeAll()
            }
            let alert = UIAlertController(title: "Max limit reached", message: "Please capture only three photos", preferredStyle: .alert)
            alert.addAction(action)
            alert.addAction(retry)
            self.present(alert,animated: true)
        }else{
            view.takeCameraSnapshot({
                self.view.alpha = 0
                UIView.animate(withDuration: 0.5) { self.view.alpha = 1 }
            },completion: {(capturedImage, error) -> () in
                self.view.freeCameraSnapshot()
                self.ctr+=1
                self.imageArr.append(capturedImage!)
                self.addCapturedImages(img: capturedImage!)
                print(self.imageArr)
            })
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="3"{
            if let vc = segue.destination as? ReportVC{
                vc.imgArr = imageArr
            }
        }
        
        
    }
}
extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) 
    }
}
