//
//  ViewController.swift
//  CameraScanningUIKit
//
//  Created by Mihai Constantin on 21.03.2024.
//

import UIKit
import VisionKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scanButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        scanButton.setTitle("Scan Documents", for: .normal)
        scanButton.setImage(UIImage(systemName: "doc.viewfinder"), for: .normal)
    }
    
    @IBAction func scanButtonPressed(_ sender: Any) {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = self
        present(viewController, animated: true)
    }
}

extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        print("Found \(scan.pageCount)")

        for i in 0 ..< scan.pageCount {
            let img = scan.imageOfPage(at: i)
            // ... your code here
        }
        
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
        print(error)
        controller.dismiss(animated: true)
    }
}
