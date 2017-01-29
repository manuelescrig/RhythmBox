//
//  RhythmBox.swift
//  RhythmBox (BPM) 🎵
//
//  Created by Manuel Escrig Ventura on 11/14/16.
//  @manuelescrig
//
//  Copyright © 2016 Manuel Escrig Ventura. All rights reserved.
//

import Foundation

/**
 The Beats per minute type
 
 See also: [Beats per minute](https://en.wikipedia.org/wiki/Tempo#Beats_per_minute)
 
 */
public typealias BPM = Int

/**
 The TimeSignature type
 Specifies how many beats are to be contained in each bar and which note value is to be given one beat
 
 - parameter upper: The upper numeral indicates how many such beats there are grouped together in a bar
 - parameter lower: The lower numeral indicates the note value that represents one beat (the beat unit)
 
 See also: [Time signature](https://en.wikipedia.org/wiki/Time_signature)
 
 */
public typealias TimeSignature = (upper:Int, lower:Int)

/**
 The CurrentBeat type
 */
public typealias CurrentBeat = Int

/**
 The CurrentSubBeat type
 */
public typealias CurrentSubBeat = Int

/**
 The CurrentNote type
 */
public typealias CurrentNote = Character

/**
 The Subdivision type with a pattern.
 Default value "1"
 */
public typealias Subdivision = String

/**
 The perform closure type
 - parameter CurrentBeat: Current beat (pulse) in each bar
 - Returns: NextStep (pause or resume)
 */
public typealias PerformClosure = (CurrentBeat, CurrentSubBeat, CurrentNote) -> NextStep

/**
 The enumeration describes the next step 'RhythmBox' has to do whenever the timer is triggered
 - parameter pause:    Pauses the timer.
 - parameter resume:   Continues the timer.
 */
public enum NextStep {
    case pause, resume
}

/**
 NextStep boolean value implementation
 */
fileprivate extension NextStep {
    
    var shouldStop: Bool {
        switch self {
        case .resume:   return false
        case .pause:    return true
        }
    }
}


// MARK: - RhythmBox class

/**
 # RhythmBox class 🎵
 The RhythmBox class allows the user to easily create a BPM timer
 with time signature, subdivision and current beat features
 
 See also: [RhythmBox github site](https://github.com/manuelescrig/RhythmBox)
 */
open class RhythmBox {
    
    
    // MARK: - Private properties
    
    /// The value in beats per minute
    fileprivate var bpm: BPM
    
    /// The time signature
    fileprivate var timeSignature: TimeSignature
    
    /// The current beat value
    fileprivate var currentBeat: CurrentBeat
    
    /// The current sub beat value
    fileprivate var currentSubBeat: CurrentSubBeat
    
    /// The current note value
    fileprivate var currentNote: CurrentNote
    
    /// The subdivision value
    fileprivate var subdivision: Subdivision

    /// The action to perform when the timer is triggered
    fileprivate var performClosure: PerformClosure?
    
    /// The timer instance
    private weak var timer: Timer?
    
    
    // MARK: - Public properties
    
    /// Timer is stopped or not
    public var isStopped = true
    
    /// The time interval to use for the timer object
    public var timeInterval: TimeInterval? {
        
        let bpm : Double = 60.0 / Double(self.bpm)
        let timeSignatureMultiplier : Double = 4 / Double(timeSignature.lower)
        let subdivisionMultiplier : Double = 1 / Double(subdivision.characters.count)
        
        return bpm * timeSignatureMultiplier * subdivisionMultiplier
    }
    
    
    // MARK: - Class Lifecycle
    
    /**
     Designated initializer
     - parameter bpm: The value in beats per minute
     - parameter timeSignature: Describe the time signature with two numerals
     - parameter subdivision: Describe subdivision type
     */
    public init(bpm: BPM, timeSignature: TimeSignature, subdivision: Subdivision) {
        self.bpm = bpm
        self.timeSignature = timeSignature
        self.subdivision = subdivision
        self.currentBeat = 1
        self.currentSubBeat = 1
        self.currentNote = "1"
    }
    
    /**
     Convenience initializer
     - parameter bpm: The value in beats per minute
     - parameter timeSignature: Describe the time signature with two numerals
     */
    public convenience init(bpm: BPM, timeSignature: TimeSignature) {
        self.init(bpm: bpm, timeSignature: timeSignature, subdivision: "1")
    }
    
    /**
     Convenience initializer
     - parameter bpm: The value in beats per minute
     */
    public convenience init(_ bpm: BPM) {
        self.init(bpm: bpm, timeSignature: (1,1), subdivision: "1")
    }
    
    /**
     Convenience initializer
     */
    public convenience init() {
        self.init(bpm: 120, timeSignature: (1,1), subdivision: "1")
    }
    
    /**
     Default deinit
     */
    deinit {
        self.timer?.invalidate()
        timer = nil
    }
    
    
    // MARK: - Public methods
    
    /**
     Sets a new 'BPM' value to the 'RhythmBox' timer
     - parameter bpm: The value in beats per minute
     */
    public func setBPM(bpm: BPM) {
        self.bpm = bpm
    }
    
    /**
     Sets a new 'TimeSignature' value to the 'RhythmBox' timer
     - parameter timeSignature: Describe the time signature with two numerals
     */
    public func setTimeSignature(timeSignature: TimeSignature) {
        self.timeSignature = timeSignature
    }
    
    /**
     Sets a new 'Subdivision' value to the 'RhythmBox' timer
     - parameter subdivision: Describe subdivision type
     */
    public func setSubdivision(subdivision: Subdivision) {
        self.subdivision = subdivision
    }
    
    /**
     Starts the 'RhythmBox' timer and performs the action when the timer is triggered
     The closure should return a boolean that indicates to stop or not the timer after
     the trigger. Return 'resume' to continue, return 'pause' to stop it
     */
    public func perform(closure: @escaping PerformClosure) {
        guard timer == nil else { return }
        guard let interval = timeInterval else { return }
        
        isStopped = false
        currentBeat = 1
        performClosure = closure
        timer = Timer.scheduledTimer(
            timeInterval: interval,
            target: self,
            selector: .Triggered,
            userInfo: nil,
            repeats: true
        )
    }
    
    /**
     Stops the 'RhythmBox' timer
     */
    public func stop() {
        timer?.invalidate()
        timer = nil
        
        isStopped = true
    }
    
    /**
     Restarts the 'RhythmBox' timer
     */
    public func restart() {
        stop()
        guard let _performClosure = performClosure else { return }
        _ = perform(closure: _performClosure)
    }
}


// MARK: - 'RhythmBox' Class extensions

fileprivate extension RhythmBox {
    
    /**
     Trigger function
     */
    @objc func _trigger(timer: Timer) {
        
        let pattern = subdivision.characters
        
        currentSubBeat = currentSubBeat + 1
        if (currentSubBeat > pattern.count) {
            currentSubBeat = 1
            
            currentBeat = currentBeat + 1
            if (currentBeat > timeSignature.upper) {
                currentBeat = 1
            }
        }
        
        currentNote = pattern[pattern.index(pattern.startIndex, offsetBy: currentSubBeat - 1 )]
        
        let stopTimer = performClosure?(currentBeat, currentSubBeat, currentNote).shouldStop ?? false
        guard stopTimer else { return }
        stop()
        
    }
}


// MARK: - Selectors Extensions

fileprivate extension Selector {
    
    /**
     Triggered selector
     */
    static let Triggered = #selector(RhythmBox._trigger(timer:))
}

