//
//  ImagePicker.swift
//  Journal App
//
//  Created by 7744 on 2/13/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit

public protocol ImagePickerDelegate: class {
    func didSelectFirst(image: UIImage?)
    func didCancel()
}

//fileprivate protocol ImagePickerAllowEditing {
//
//    func changeAllowingEditingType()
//
//
//}
open class ImagePicker: NSObject {
    
    
    
//    func changeAllowingEditingType() {
//        self.pickerController.allowsEditing = false
//    }
    

    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?

    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()

        super.init()
        
    
        self.presentationController = presentationController
        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsEditing = false
        self.pickerController.mediaTypes = ["public.image"]
        
    }

    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
//            if type == .camera {
//            self.pickerController.allowsEditing = false
//            } else {
//                self.pickerController.allowsEditing = true
//
//            }
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }

    public func present(from sourceView: UIView) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        
        
        
        self.presentationController?.present(alertController, animated: true)
    }
    

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        if image == nil {
            
        } else {

        self.delegate?.didSelectFirst(image: image)
        }
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    
        guard let image = info[.originalImage] as? UIImage else {
            
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }

}

extension ImagePicker: UINavigationControllerDelegate {

}

//
//class ImagePickerAlertController: UIAlertController {
//
//    fileprivate var imagePickerAllowingEditingDelegate: ImagePickerAllowEditing?
//
//    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
//        if viewControllerToPresent.title == "Take photo" {
//            imagePickerAllowingEditingDelegate?.changeAllowingEditingType()
//        }
//    }
//
//
//
//}
