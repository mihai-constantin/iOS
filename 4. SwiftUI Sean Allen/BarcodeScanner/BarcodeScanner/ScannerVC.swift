//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Mihai Constantin on 28.12.2023.
//

import UIKit
import AVFoundation

enum CameraError: String {
    case invalidDeviceInput = "Something is wrong with the camera. We are unable to capture the input."
    case invalidScanValue   = "The value scanned is not valid. This app scans EAB-8 and EAN-13."
}

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
    func didFail(with error: CameraError)
}

final class ScannerVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    weak var delegate: ScannerVCDelegate?
    
    init(delegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            delegate?.didFail(with: .invalidDeviceInput)
            return
        }
        
        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            delegate?.didFail(with: .invalidDeviceInput)
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
            delegate?.didFail(with: .invalidDeviceInput)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
            delegate?.didFail(with: .invalidDeviceInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            delegate?.didFail(with: .invalidDeviceInput)
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill
        if let previewLayer = previewLayer {
            view.layer.addSublayer(previewLayer)
        }
        captureSession.startRunning()
    }
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            delegate?.didFail(with: .invalidScanValue)
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            delegate?.didFail(with: .invalidScanValue)
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            delegate?.didFail(with: .invalidScanValue)
            return
        }
        
        delegate?.didFind(barcode: barcode)
    }
}
