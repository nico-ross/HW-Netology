// 1

enum TVСhannel: String {
    case first = "Euronews"
    case second = "Nickelodeon"
    case third = "Boomerang"
    case fourth = "Discovery"
    case fifth = "Sport 24"
}

class TelevisionSet {
    var tvModel: (brand: String, model: String)
    var isTurnedOn: Bool = false
    var currentChannel: TVСhannel
    init(tvModel: (String, String), currentChannel: TVСhannel) {
        self.tvModel = tvModel
        self.currentChannel = currentChannel
    }
    func showWhatsNow() {
        isTurnedOn == false ?
        print("The tv is off. Turn it on first") :
        print("\(self.currentChannel.rawValue) is on tv now")
    }
}

let sonyTV = TelevisionSet(tvModel: ("Sony", "Trinitron"), currentChannel: .first)

sonyTV.isTurnedOn = true
sonyTV.showWhatsNow()

sonyTV.currentChannel = .fourth
sonyTV.showWhatsNow()

print("")

// 2

struct TVSettings {
    var tvVolume: Float = 0.2 {
        didSet {
            if !(0...1).contains(tvVolume) {
                print("Incorrect value. Enter a floating-point number from 0 to 1")
                print("Default volume activated")
                tvVolume = 0.2
            }
        }
    }
    var isColor: Bool
}

class PortableTV: TelevisionSet {
    var ptvSetting: TVSettings
    
    init(tvModel: (String, String), currentChannel: TVСhannel, ptvSetting: TVSettings) {
        self.ptvSetting = ptvSetting
        super.init(tvModel: tvModel, currentChannel: currentChannel)
    }
    
    override func showWhatsNow() {
        if isTurnedOn == false {
            print("The ptv is off. Turn it on first (.turnOn)")
        } else {
            print("\(self.currentChannel.rawValue) is on ptv now")
            print("In \(self.ptvSetting.isColor == true ? "color" : "b&w").", terminator: " ")
            print("Volume - \(UInt8(self.ptvSetting.tvVolume * 100))%")
        }
    }
}

let sonyPTV = PortableTV(tvModel: ("Sony", "Watchman"), currentChannel: .second, ptvSetting: .init(isColor: true))

sonyPTV.isTurnedOn = true
sonyPTV.ptvSetting.tvVolume = 0.45678

sonyPTV.showWhatsNow()

print("")

// 3*

enum ConnectionOption: String {
    case radioAntenna = "TV connected to antenna"
    case videoRecorder = "Receiving data from the video recorder"
}

class NewEraTV: TelevisionSet {
    var connectionMode: ConnectionOption
    
    init(tvModel: (String, String), currentChannel: TVСhannel, connectionMode: ConnectionOption) {
        self.connectionMode = connectionMode
        super.init(tvModel: tvModel, currentChannel: currentChannel)
    }
    
    override func showWhatsNow() {
        if isTurnedOn == false {
            print("The tv is off. Turn it on first (.turnOn)")
        } else {
            print(self.connectionMode.rawValue)
            guard connectionMode == .radioAntenna else { return }
            print("\(self.currentChannel.rawValue) is on tv now")
        }
    }
}

let sonyNewTV = NewEraTV(tvModel: ("Sony", "RCA"), currentChannel: .third, connectionMode: .videoRecorder)

sonyNewTV.isTurnedOn = true
sonyNewTV.showWhatsNow()
