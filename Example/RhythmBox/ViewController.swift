//
//  ViewController.swift
//  RhythmBox
//
//  Created by Manuel Escrig Ventura on 11/17/2016.
//  Copyright (c) 2016 Manuel Escrig Ventura. All rights reserved.
//

import UIKit
import RhythmBox

class ViewController: UIViewController {

    @IBOutlet weak var action: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    @IBAction func action(_ sender: AnyObject) {
        

        let rhythmBox = RhythmBox(bpm: 120, timeSignature: (4,4))
        rhythmBox.perform {CurrentBeat, CurrentSubBeat, CurrentNote in
            
            print("CurrentBeat", CurrentBeat)
            print("CurrentSubBeat", CurrentSubBeat)
            
            return .resume
        }
        
        
        
        
        
    }
}

