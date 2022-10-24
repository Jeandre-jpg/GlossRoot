//
//  FaceFilterViewModel.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//

//
//import Foundation
//import UIKit
//import Vision
//
//public typealias FaceLandmarkPerimeter = [CGPoint]
//
//public struct FaceViewFaceFilterViewModelModel {
//  internal(set) public var landmarks: [FaceLandmarkType: FaceLandmarkPerimeter]
//
//  internal(set) public var boundingBox = CGRect.zero
//
//  init() {
//    landmarks = [:]
//  }
//
//  static func faceViewModel(from faceObservation: VNFaceObservation,
//                            landmarkMaker: (VNFaceLandmarkRegion2D?) -> FaceLandmarkPerimeter?,
//                            boundingBoxMaker: (CGRect) -> CGRect) -> FaceFilterViewModel? {
//    guard let landmarks = faceObservation.landmarks else {
//      return nil
//    }
//
//    var viewModel = FaceFilterViewModel()
//
//    viewModel.boundingBox = boundingBoxMaker(faceObservation.boundingBox)
//
//    if let leftEye = landmarkMaker(landmarks.leftEye) {
//      viewModel.landmarks[.leftEye] = leftEye
//    }
//
//    if let rightEye = landmarkMaker(landmarks.rightEye) {
//      viewModel.landmarks[.rightEye] = rightEye
//    }
//
//    if let leftEyebrow = landmarkMaker(landmarks.leftEyebrow) {
//      viewModel.landmarks[.leftEyebrow] = leftEyebrow
//    }
//
//    if let rightEyebrow = landmarkMaker(landmarks.rightEyebrow) {
//      viewModel.landmarks[.rightEyebrow] = rightEyebrow
//    }
//
//    if let nose = landmarkMaker(landmarks.nose) {
//      viewModel.landmarks[.nose] = nose
//    }
//
//    if let outerLips = landmarkMaker(landmarks.outerLips) {
//      viewModel.landmarks[.outerLips] = outerLips
//    }
//
//    if let innerLips = landmarkMaker(landmarks.innerLips) {
//      viewModel.landmarks[.innerLips] = innerLips
//    }
//
//    if let faceContour = landmarkMaker(landmarks.faceContour) {
//      viewModel.landmarks[.faceContour] = faceContour
//    }
//
//    return viewModel
//  }
//}
//
