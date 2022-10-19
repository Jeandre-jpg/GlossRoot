//
//  SkinConcernsClass.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/17.
//

import Foundation
import CoreML
import Vision
import UIKit

class SkinConcernsClass{
    private let model: VNCoreMLModel
    private var completion: (String) -> Void = { _ in }
    
    private lazy var requests: [VNCoreMLRequest] = {
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                return
            }
            
            if !results.isEmpty {
                if let result = results.first{
                    self.completion(result.identifier)
                }
            }
            
        }
        
        request.imageCropAndScaleOption = .centerCrop
        return [request]
        
    }()
    
    init?(mlModel:MLModel){
        if let model = try? VNCoreMLModel(for: mlModel){
            self.model = model
        }else {
            return nil
        }
    }
    
    func classify(_ image: UIImage, completion: @escaping (String)-> Void){
        self.completion = completion
        DispatchQueue.global().async {
            guard let cgImage = image.cgImage else{
                return
            }
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do{
                try handler.perform(self.requests)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
}
