//
//  Page47DrawingTools.swift
//  The Color Rap Book
//
//  Created by 7744 on 4/24/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit
import ColorSlider
import CropViewController

extension DetailPageController: CropViewControllerDelegate {
    @objc func handleUndo() {
        canvas.undo()
        
    }
    
    @objc func handleRedo() {
//        redo starts here
        canvas.redo()
        
    }
    
    @objc func handleClear() {
        showAlert(title: "Clear Everything?", message: "You cannot undo this action", handlerOK: { action in
            print(action)
            self.canvas.clear()
               }, handlerCancel: nil, yesButton: "Yes", cancelButton: "Nah")
    }
    
    @objc func handleWidthSlider() {
//        print(widthSlider.value)
//        canvas.setStrokeWidth(width: drawingToolPanel.widthSlider.value)
    }
    
    @objc func handleComplete() {
        showAlert(title: "Is Everything Completed?!", message: "", handlerOK: { action in
            self.showTextFieldAlert(title: "What is your caption?", message: "Make your own rap!", yesButton: "Complete!")
            
        }, handlerCancel: {actionCancel in
            print("Action Cancel called")
        }, yesButton: "Yes", cancelButton: "Not yet")
    }
    
    @objc func handleChangeBackground() {
        self.imagePicker.present(from: self.drawingToolPanel.backgroundChangeButton)
    }
    
                  
    
    @objc func changedColor(slider: ColorSlider) {
         let color = slider.color
//        print("who sent it, ", slider)
        print("what color is it, ", color)
        panGesture.isEnabled = false
         canvas.setStrokeColor(color: color)
        if color == UIColor(hue: 1.0, saturation: 1.0, brightness: 1.0, alpha: 1.0) {
            drawingToolPanel.pencilButton.tintColor = .black
            drawingToolPanel.penButton.tintColor = .black
            drawingToolPanel.brushButton.tintColor = .black
        } else {
            drawingToolPanel.pencilButton.tintColor = color
            drawingToolPanel.penButton.tintColor = color
            drawingToolPanel.brushButton.tintColor = color
        }
          // ...
      }

     
     @objc func touchUpFinished() {
        panGesture.isEnabled = true
         print("touch up")
     }
    
    @objc func drawingPageStartButtonTap() {
              self.imagePicker.present(from: self.startButton)
             
              
          }
      
    @objc func whiteBackgroundButtonTap() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label1.alpha = 0
            self.startButton.alpha = 0
            self.startButton.isEnabled = false
            self.noPictureButton.alpha = 0
            self.noPictureButton.isEnabled = false
        },completion: {_ in
            UIView.animate(withDuration: 1.2, animations: {
              self.drawingPageBackgroundImage = UIImage(named: "page47Blank")
              self.drawingSceneAfterImageSelected()
        
          
            })
            
            
        })
    }
    
    func didSelectFirst(image: UIImage?){
        presentCropViewController(originalImage: image!)
    }
    
    func didSelectSecond(image: UIImage?) {
        print("selected")
        UIView.animate(withDuration: 0.5, animations: {
            self.label1.alpha = 0
            self.startButton.alpha = 0
            self.startButton.isEnabled = false
            self.noPictureButton.alpha = 0
            self.noPictureButton.isEnabled = false
        },completion: {_ in
            UIView.animate(withDuration: 1.2, animations: {
                self.drawingPageBackgroundImage = image ?? UIImage(named: "page47Blank")
                self.drawingSceneAfterImageSelected()
            })
            
            
        })
      }
    
    func presentCropViewController(originalImage: UIImage) {
      let image: UIImage = originalImage
      
      let cropViewController = CropViewController(image: image)
      cropViewController.delegate = self
      present(cropViewController, animated: true, completion: nil)
    }

    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            // 'image' is the newly cropped version of the original image
            didSelectSecond(image: image)
        dismiss(animated: true, completion: nil)
        }
    
    
    func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
        didCancel()
        dismiss(animated: true, completion: nil)

    }
    
    
    func didCancel() {
           return
       }

    
    func setUpStackView() {
        //        dragPic.backgroundColor = .red
        
//        ATTENTION: COLOR SLIDER MUST BE SEPARATE FROM THE DRAWING PANEL TO MAKE THE WHOLE THING WORK
        //          view.addSubview(stackView)
        view.addSubview(drawingToolPanel)
        self.drawingToolPanel.addSubview(colorSlider)
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            self.drawingToolPanel.translatesAutoresizingMaskIntoConstraints = false
            self.drawingToolPanel.anchorCenterXToSuperview()
            
            self.drawingToolPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -self.screenHeight * 0.05).isActive = true
            self.drawingToolPanel.widthAnchor.constraint(equalToConstant: 716.8).isActive = true
            self.drawingToolPanel.heightAnchor.constraint(equalToConstant: 120).isActive = true
            
            colorSlider.translatesAutoresizingMaskIntoConstraints = false
            colorSlider.leadingAnchor.constraint(equalTo: self.drawingToolPanel.redoButton.trailingAnchor, constant: 71.68).isActive = true
            colorSlider.widthAnchor.constraint(equalToConstant: 193.536).isActive = true
            colorSlider.topAnchor.constraint(equalTo: self.drawingToolPanel.topAnchor, constant: 20).isActive = true
            colorSlider.heightAnchor.constraint(equalToConstant: 35.84).isActive = true
        }
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.drawingToolPanel.translatesAutoresizingMaskIntoConstraints = false
            self.drawingToolPanel.anchorCenterXToSuperview()
            //        stackViewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.screenWidth * 0.15).isActive = true
            self.drawingToolPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -self.screenHeight * 0.03).isActive = true
            self.drawingToolPanel.widthAnchor.constraint(equalToConstant: 560).isActive = true
            self.drawingToolPanel.heightAnchor.constraint(equalToConstant: 93.75).isActive = true
            
            colorSlider.translatesAutoresizingMaskIntoConstraints = false
            colorSlider.leadingAnchor.constraint(equalTo: self.drawingToolPanel.redoButton.trailingAnchor, constant: 56).isActive = true
            colorSlider.widthAnchor.constraint(equalToConstant: 151.2).isActive = true
            colorSlider.topAnchor.constraint(equalTo: self.drawingToolPanel.topAnchor, constant: 15.625).isActive = true
            colorSlider.heightAnchor.constraint(equalToConstant: 28).isActive = true
            
        }
        colorSlider.alpha = 0
        
        panGesture.object = self.drawingToolPanel
        self.drawingToolPanel.addGestureRecognizer(panGesture)

    }
    

        
        
     func drawingPageFirstSceneSetup() {
//        self.startButton.setTitle("Select a picture for background", for: .normal)
//        self.noPictureButton.setTitle("Draw on a white backbground", for: .normal)
        self.startButton.setImage(UIImage(named: "selectBackground"), for: .normal)
        self.noPictureButton.setImage(UIImage(named: "noPictureButton"), for: .normal)
//        self.startButton.backgroundColor = .blue
//        self.noPictureButton.backgroundColor = .blue
        self.startButton.addTarget(self, action: #selector(drawingPageStartButtonTap), for: .touchUpInside)
        self.noPictureButton.addTarget(self, action: #selector(whiteBackgroundButtonTap), for: .touchUpInside)
        self.startButton.isEnabled = true
        self.noPictureButton.isEnabled = true
        self.startButton.addButtonShadow()
        self.noPictureButton.addButtonShadow()
        self.startButton.frame = CGRect(x: screenWidth * 0.30, y: screenHeight * 0.805, width: screenWidth * 0.4, height: screenHeight * 0.17)
        view.addSubview(startButton)
        self.noPictureButton.frame = CGRect(x: screenWidth * 0.30, y: screenHeight * 0.635 - 10, width: screenWidth * 0.4, height: screenHeight * 0.17)
        view.addSubview(noPictureButton)
        label1.textAlignment = .center
        //            label.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        label1.textColor = .black
        label1.frame = CGRect(x: screenWidth * 0.0572, y: screenHeight * 0.0981, width: screenWidth * 0.8856, height: screenHeight * 0.46)
        label1.font = UIFont(name: "Morgan_bold", size: 100)
        label1.adjustsFontSizeToFitWidth = true
        //            self.labelAnimation(label: label, string: labelArray[pageNum-1], check: 0)
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseIn, animations: {
            //                self.labelAnimation(label: label, string: self.labelArray, check: 0)
            self.labelAnimationNotPrinting(label: self.label1, string: self.labelArray[myVariable.state-1])
            self.label1.alpha = 1
        }, completion: {_ in
            UIView.animate(withDuration: 1.0, animations: {
                self.startButton.alpha = 1
                self.noPictureButton.alpha = 1
            },completion: nil)
            
        })
        
    }
    
    func drawingSceneAfterImageSelected() {
        self.backgroundImageView.image = self.drawingPageBackgroundImage 
         self.elementsEnteringStorage(state: myVariable.state)
         self.canvas.alpha = 1
         self.canvas.isHidden = false
         self.canvas.backgroundColor = .clear
         self.drawingToolPanel.alpha = 1
        self.colorSlider.alpha = 1
        self.nextButton.alpha = 0
        self.showMoreButton.alpha = 0
        self.previousButton.alpha = 0
         self.page47Phase = 1
    }
        
      
        
    public func gestureRecognizer(gestureRecognizer: CustomPanGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if (touch.view!.isDescendant(of: self.drawingToolPanel) && touch.view != self.drawingToolPanel){
               return false
           }
           return true
       }
        
    
    func page47DoneSetup() {
        page47Phase = 2
        let defaults = UserDefaults.standard
        let string = defaults.object(forKey: "userInputString")
//        print("String, ", string   )
        self.canvas.isUserInteractionEnabled = false
        labelArray[myVariable.state - 1] = string as? String ?? ""
//        print(labelArray)
//        readAllData()
        backgroundChangeForward(imageView: backgroundImageView, delay: 0, state: myVariable.state, label: label)
        
    }
        
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             print("Im here")
                   self.dismiss(animated: true, completion: { () -> Void in

                })
                    print("Im here")
        }
    
    
    
    
    
    }

        
        
        

extension DetailPageController {
    
    func showAlert(title: String, message: String, handlerOK: ((UIAlertAction) -> Void)?, handlerCancel: ((UIAlertAction) -> Void)?, yesButton:String, cancelButton:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: yesButton, style: .destructive, handler: handlerOK)
        let actionCancel = UIAlertAction(title: cancelButton, style: .cancel, handler: handlerCancel)
        alert.addAction(action)
        alert.addAction(actionCancel)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func showTextFieldAlert(title: String, message: String, yesButton:String) {
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        

        let confirmAction = UIAlertAction(title: yesButton, style: .default, handler: {_ in
            guard let textFields = alert.textFields,
                textFields.count > 0 else {
                    print("Could not find textfield")
                    // Could not find textfield
                    return
            }
            
             let field = textFields[0]
            // store your data
            UserDefaults.standard.set(field.text, forKey: "userInputString")
            UserDefaults.standard.synchronize()
            do {
                let dir: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as URL
                let url = dir.appendingPathComponent("Data.rtf")
                try field.text?.appendLineToURL(fileURL: url as URL)
                let result = try String(contentsOf: url as URL, encoding: String.Encoding.utf8)
            }
            catch {
                print("Could not write to file")
            }
            self.page47DoneSetup()
        })
        
        
        alert.addTextField { (textField) in
          textField.placeholder = "Type here!"
        }
        
        
        alert.addAction(confirmAction)

        
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
    
    @objc func pencilButtonClicked()
    {
        
        //        drawingToolPanel.pencilButton.isSelected = true
        drawingToolPanel.pencilButton.setImage(UIImage(named: "selectedPencil"), for: .normal)
        drawingToolPanel.brushButton.setImage(UIImage(named: "brushNormal"), for: .normal)
        drawingToolPanel.penButton.setImage(UIImage(named: "penNormal"), for: .normal)
        canvas.setStrokeWidth(width: 5)
        
 
        
    }
    
    @objc func penButtonClicked() {
        drawingToolPanel.penButton.setImage(UIImage(named: "penSelected"), for: .normal)
        drawingToolPanel.pencilButton.setImage(UIImage(named: "normalPencil"), for: .normal)
        drawingToolPanel.brushButton.setImage(UIImage(named: "brushNormal"), for: .normal)
        canvas.setStrokeWidth(width: 10)
        

    }
    
    
    @objc func brushButtonClicked() {
        drawingToolPanel.brushButton.setImage(UIImage(named: "brushSelected"), for: .normal)
        drawingToolPanel.pencilButton.setImage(UIImage(named: "normalPencil"), for: .normal)
        drawingToolPanel.penButton.setImage(UIImage(named: "penNormal"), for: .normal)
        canvas.setStrokeWidth(width: 30)
    
    }
    
    
    
    
    
}



class DrawingToolPanel: UIView {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    
    
        lazy var undoButton: UIButton = {
            let button = UIButton(type: .system)
    //        button.setTitle("Undo", for: .normal)
            button.setImage(UIImage(named: "undo"), for: .normal)
    //        button.titleLabel?.font = UIFont(name: "Morgan_bold", size: 14)
         
    //        button.frame.size.width = UIScreen.main.bounds.width * 0.1
            return button
        }()
        
        lazy var redoButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(named: "redo"), for: .normal)
            return button
        }()
        
        
        lazy var clearButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Clear", for: .normal)
            button.titleLabel?.font = UIFont(name: "Morgan_bold", size: 14)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.isExclusiveTouch = true
    //        button.frame.size.width = UIScreen.main.bounds.width * 0.1
            return button
        }()
        
        lazy var completeButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setTitle("Complete", for: .normal)
             button.titleLabel?.font = UIFont(name: "Morgan_bold", size: 14)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.setTitleColor(.red, for: .normal)
            button.isExclusiveTouch = true
            return button
        }()
        
        lazy var backgroundChangeButton: UIButton = {
               let button = UIButton(type: .system)
               button.setTitle("change\nbackground", for: .normal)
            button.titleLabel?.numberOfLines = 2
            button.titleLabel?.font = UIFont(name: "Morgan_bold", size: 14)
             button.titleLabel?.textAlignment = .center
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            return button
           }()
        
        
        lazy var colorSlider: ColorSlider = {
            let slider = ColorSlider(orientation: .horizontal, previewSide: .top)
            slider.isExclusiveTouch = true
            return slider
        }()
    
    lazy var pencilButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "normalPencil"), for: .normal)
        button.tintColor = .red
        
        return button
    }()
    
    lazy var penButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "penSelected"), for: .normal)
        button.tintColor = .red
        
        return button
    }()
    
    
    lazy var brushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "brushNormal"), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    
    
    
    //        lazy var widthSlider: UISlider = {
    //            let slider = UISlider()
    //            slider.minimumValue = 1
    //            slider.maximumValue = 20
    //            slider.setValue(10, animated: false)
    //            slider.isExclusiveTouch = true
    //
    //
    //    //        slider.frame.size.width = UIScreen.main.bounds.width * 0.25
    //            return slider
    //        }()
    
    
    let dragPic = UIImageView(image: UIImage(named: "drag"))
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = UIScreen.main.bounds.height * 0.06
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 50
        
        self.addSubview(dragPic)
        
        self.addSubview(undoButton)
        self.addSubview(redoButton)
        self.addSubview(clearButton)
        self.addSubview(colorSlider)
        //                   self.addSubview(widthSlider)
        self.addSubview(pencilButton)
        self.addSubview(penButton)
        self.addSubview(brushButton)
        self.addSubview(completeButton)
        self.addSubview(backgroundChangeButton)
        
        redoButton.translatesAutoresizingMaskIntoConstraints = false
        colorSlider.translatesAutoresizingMaskIntoConstraints = false
        pencilButton.translatesAutoresizingMaskIntoConstraints = false
        penButton.translatesAutoresizingMaskIntoConstraints = false
        brushButton.translatesAutoresizingMaskIntoConstraints = false
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundChangeButton.translatesAutoresizingMaskIntoConstraints = false
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            
            //        add all buttons
          
            
            
            
            //        from left to right start configuring the location of the buttons and sliders
            

            
            
            
            //        undo button dimensions
            undoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 107.52).isActive = true
            undoButton.widthAnchor.constraint(equalToConstant: 35.84).isActive = true
            undoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            undoButton.heightAnchor.constraint(equalToConstant: 35.84).isActive = true
            
            //        redo button dimensions
            redoButton.leadingAnchor.constraint(equalTo: self.undoButton.trailingAnchor, constant: 21.504).isActive = true
            redoButton.widthAnchor.constraint(equalTo: undoButton.widthAnchor, multiplier: 1).isActive = true
            redoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            redoButton.heightAnchor.constraint(equalToConstant: 35.84).isActive = true
            
            
            //        clear button dimensios
            clearButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 107.52).isActive = true
            clearButton.widthAnchor.constraint(equalToConstant: 93.184).isActive = true
            clearButton.topAnchor.constraint(equalTo: self.undoButton.topAnchor, constant: 40).isActive = true
            clearButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            //        color slider dimensions
            colorSlider.leadingAnchor.constraint(equalTo: self.redoButton.trailingAnchor, constant: 71.68).isActive = true
            colorSlider.widthAnchor.constraint(equalToConstant: 193.536).isActive = true
            colorSlider.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            colorSlider.heightAnchor.constraint(equalToConstant: 35.84).isActive = true
            
            //           penxil button dimensions
            pencilButton.leadingAnchor.constraint(equalTo: self.redoButton.trailingAnchor, constant: 71.68).isActive = true
            //                   pencilButton.widthAnchor.constraint(equalToConstant: 193.536).isActive = true
            pencilButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
            pencilButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 55).isActive = true
            pencilButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
            //            pen button dimensions
            penButton.leadingAnchor.constraint(equalTo: self.pencilButton.trailingAnchor, constant: 57.768).isActive = true
            //                   pencilButton.widthAnchor.constraint(equalToConstant: 193.536).isActive = true
            penButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
            penButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 55).isActive = true
            penButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
            //            brush button dimensions
            brushButton.leadingAnchor.constraint(equalTo: self.penButton.trailingAnchor, constant: 57.768).isActive = true
            //                   pencilButton.widthAnchor.constraint(equalToConstant: 193.536).isActive = true
            brushButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
            brushButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 55).isActive = true
            brushButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
            //        complete button dimensions
            completeButton.leadingAnchor.constraint(equalTo: self.colorSlider.trailingAnchor, constant: 71.68).isActive = true
            completeButton.widthAnchor.constraint(equalToConstant: 71.68).isActive = true
            completeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            completeButton.heightAnchor.constraint(equalToConstant: 35.84).isActive = true
            
            //        change background button dimensions
            backgroundChangeButton.leadingAnchor.constraint(equalTo: self.colorSlider.trailingAnchor, constant: 71.68).isActive = true
            backgroundChangeButton.widthAnchor.constraint(equalToConstant: 71.68).isActive = true
            backgroundChangeButton.topAnchor.constraint(equalTo: self.completeButton.topAnchor, constant: 40).isActive = true
            backgroundChangeButton.heightAnchor.constraint(equalToConstant: 35.84).isActive = true
            
            
              
                   
                   //            stackView.alignment = .center
                   //            stackView.spacing = self.screenWidth * 0.03
                   
                   
                   //        stackView is invisible until page 47
                   colorSlider.alpha = 0
            self.alpha = 0
                   
                   
                   
                   
                   dragPic.translatesAutoresizingMaskIntoConstraints = false
                   dragPic.anchorCenterYToSuperview()
                   dragPic.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
                   dragPic.heightAnchor.constraint(equalToConstant: self.screenWidth * 0.04).isActive = true
                   dragPic.widthAnchor.constraint(equalToConstant: self.screenWidth * 0.04).isActive = true
                   
                   //        print("stackLeadAnchor", stackView.leadingAnchor)
                   //        print("stacktrailanchor", stackView.trailingAnchor)
               }
               
               
               if UIDevice.current.userInterfaceIdiom == .phone {
                   
                   //        add all buttons
                   
                   
                   //        from left to right start configuring the location of the buttons and sliders
               
                   
                   
                   //        undo button dimensions
                   undoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 84).isActive = true
                   undoButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
                   undoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.625).isActive = true
                   undoButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
                   
                   //        redo button dimensions
                   redoButton.leadingAnchor.constraint(equalTo: self.undoButton.trailingAnchor, constant: 16.86).isActive = true
                   redoButton.widthAnchor.constraint(equalTo: undoButton.widthAnchor, multiplier: 1).isActive = true
                   redoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.625).isActive = true
                   redoButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
                   
                   
                   //        clear button dimensios
                   clearButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 84).isActive = true
                   clearButton.widthAnchor.constraint(equalToConstant: 72.8).isActive = true
                   clearButton.topAnchor.constraint(equalTo: self.undoButton.topAnchor, constant: 31.25).isActive = true
                   clearButton.heightAnchor.constraint(equalToConstant: 39.0625).isActive = true
                   
                   //        color slider dimensions
                   colorSlider.leadingAnchor.constraint(equalTo: self.redoButton.trailingAnchor, constant: 56).isActive = true
                   colorSlider.widthAnchor.constraint(equalToConstant: 151.2).isActive = true
                colorSlider.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.625).isActive = true
                colorSlider.heightAnchor.constraint(equalToConstant: 28).isActive = true
                
                //        width slider dimentions
                //                   widthSlider.widthAnchor.constraint(equalToConstant: 151.2).isActive = true
                //
//                                pencilButton.leadingAnchor.constraint(equalTo: self.redoButton.trailingAnchor, constant: 56).isActive = true
//                                pencilButton.widthAnchor.constraint(equalToConstant: 17.3).isActive = true
//                                pencilButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 39.0625).isActive = true
//                                pencilButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
                //
                pencilButton.leadingAnchor.constraint(equalTo: self.redoButton.trailingAnchor, constant: 56).isActive = true
                pencilButton.widthAnchor.constraint(equalToConstant: 20.9).isActive = true
                pencilButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 42).isActive = true
                pencilButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
                
                penButton.leadingAnchor.constraint(equalTo: self.pencilButton.trailingAnchor, constant: 44.25).isActive = true
                penButton.widthAnchor.constraint(equalToConstant: 20.9).isActive = true
                penButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 42).isActive = true
                penButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
                
                brushButton.leadingAnchor.constraint(equalTo: self.penButton.trailingAnchor, constant: 44.25).isActive = true
                brushButton.widthAnchor.constraint(equalToConstant: 20.9).isActive = true
                brushButton.topAnchor.constraint(equalTo: self.colorSlider.topAnchor, constant: 42).isActive = true
                brushButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
                
                
                
                //        complete button dimensions
                completeButton.leadingAnchor.constraint(equalTo: self.colorSlider.trailingAnchor, constant: 56).isActive = true
                   completeButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
                   completeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.625).isActive = true
                   completeButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
                   
                   //        change background button dimensions
                   backgroundChangeButton.leadingAnchor.constraint(equalTo: self.colorSlider.trailingAnchor, constant: 56).isActive = true
                   backgroundChangeButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
                   backgroundChangeButton.topAnchor.constraint(equalTo: self.completeButton.topAnchor, constant: 31.25).isActive = true
                   backgroundChangeButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
                   
                   

                   
                   //            stackView.alignment = .center
                   //            stackView.spacing = self.screenWidth * 0.03
                   
                   
                   //        stackView is invisible until page 47
                   colorSlider.alpha = 0
                   self.alpha = 0
                   
                   
                   
                   
                   dragPic.translatesAutoresizingMaskIntoConstraints = false
                   dragPic.anchorCenterYToSuperview()
                   dragPic.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
                   dragPic.heightAnchor.constraint(equalToConstant: self.screenWidth * 0.04).isActive = true
                   dragPic.widthAnchor.constraint(equalToConstant: self.screenWidth * 0.04).isActive = true
                   
               }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
        
        
    
    
    
    
    
    
    
    
    
