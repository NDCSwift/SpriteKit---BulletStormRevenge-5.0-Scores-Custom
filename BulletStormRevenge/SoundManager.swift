//
    // Project: BulletStormRevenge
    //  File: Untitled.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    
import AVFoundation

class SoundManager{
    static let shared = SoundManager()
    
    var backgroundMusicPlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
    
    private init() {} //prevent multiple instances
    
    func playBackgroundMusic(fileName: String, loop: Bool = true){
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else{
            print("error: BGM not found \(fileName).mp3")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.numberOfLoops = loop ? -1 : 0
            backgroundMusicPlayer?.volume = 0.1
            backgroundMusicPlayer?.play()
        } catch {
            print("error could not play BGM")
        }
        
    }
    
    func stopBackgroundMusic(){
        backgroundMusicPlayer?.stop()
    }
    
    func playSoundEffect(fileName: String){
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Error Sound effect file not found \(fileName).mp3")
            return
        }
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
            soundEffectPlayer?.play()
        } catch {
            print("error could not play sound effects")
        }
    }
    
    
}
