// Modu
// Создаю общий протокол Device от которого будут наследоваться другие устройства
protocol Device {
    var name: String { get set }
    var isWorking: Bool { get set }
    func status()
}
enum SmartMode{
    case sleep
    case safe
    case romantic
}
class Door: Device {
    var name: String
    init(name: String) {
        self.name = name
    }
    var isWorking: Bool = true
    var openOrClose: Bool = true
    var locked: Bool = false
    func close() {
        openOrClose = false
    }
    func open() {
        openOrClose = true
    }
    func lock() {
        locked = true
    }
    func unlock() {
        locked = false
    }
    func status() {
        if openOrClose == true, locked == false {
            print("Дверь \(name) открыта, замок открыт")
        }
        else if openOrClose == false && locked == true {
            print("Дверь \(name) закрыта, замок закрыт")
        }
        else {
            print("Дверь \(name) закрыта, замок открыт")
        }
    }
}
class Light: Device {
    var name: String
    init(name: String) {
        self.name = name
    }
    var isWorking: Bool = true
    var brightnessLevel: Int = 0
    func increaseBrightness() {
        if brightnessLevel < 10 {
            brightnessLevel += 1
        }
    }
    func decreaseBrightness() {
        if brightnessLevel > 0 {
            brightnessLevel -= 1
        }
    }
    func status() {
        print("Свет \(name), уровень яркости: \(brightnessLevel)")
    }
}
class Thermostat: Device {
    var name: String
    init(name: String) {
        self.name = name
    }
    var isWorking: Bool = true
    var temperature: Double = 20.0
    func increaseTemperature() {
        temperature += 1.0
    }
    func decreaseTemperature() {
        temperature -= 1.0
    }
    func status() {
        print("Термостат \(name), температура: \(temperature)°C")
    }
}
class TV: Device {
    var name: String
    init(name: String) {
        self.name = name
    }
    var isWorking: Bool = true
    var isTurnedOn: Bool = false
    var currentChannel: Int = 0
    var volumeLevel: Int = 0
    func turnOn() {
        isTurnedOn = true
    }
    func turnOff() {
        isTurnedOn = false
    }
    func changeChannel(to channel: Int) {
        if isTurnedOn {
            currentChannel = channel
        }
    }
    func increaseVolume() {
        if isTurnedOn && volumeLevel < 10 {
            volumeLevel += 1
        }
    }
    func status() {
        let powerStatus = isTurnedOn ? "включен" : "выключен"
        print("Телевизор \(name), статус: \(powerStatus), канал: \(currentChannel), громкость: \(volumeLevel)")
    }
}
class Curtain: Device {
    var name: String
    init(name: String) {
        self.name = name
    }
    var isWorking: Bool = true
    var isOpen: Bool = false
    func open() {
        isOpen = true
    }
    func close() {
        isOpen = false
    }
    func status() {
        let curtainStatus = isOpen ? "открыты" : "закрыты"
        print("Шторы \(name), статус: \(curtainStatus)")
    }
}
class SmartHome {
    var devices: [Device] = []
    public let smartHome = SmartHome()
    func addDevice(_ device: Device) {
        devices.append(device)
    }
    func updateDeviceStatus() {
        for device in devices {
            device.status()
        }
    }
    func lockAllDoors() {
        for device in devices {
            if let door = device as? Door {
                door.lock()
            }
        }
    }
    func closeAllCurtains() {
        for device in devices {
            if let curtain = device as? Curtain {
                curtain.close()
            }
        }
    }
    func setThermostatTemperature(_ temperature: Double) {
        for device in devices {
            if let thermostat = device as? Thermostat {
                thermostat.temperature = temperature
            }
        }
    }
    func printDeviceStatus(deviceName: String) {
        for device in smartHome.devices {
            if device.name == deviceName {
                device.status()
                return
            }
        }
        print("Устройство '\(deviceName)' не найдено.")
    }
    func printAllDeviceStatus() {
        smartHome.updateDeviceStatus()
    }
    func turnOnDevice(deviceName: String) {
        for var device in smartHome.devices {
            if device.name == deviceName {
                device.isWorking = true
                print("Устройство '\(deviceName)' включено.")
                return
            }
        }
        print("Устройство '\(deviceName)' не найдено.")
    }
    func turnOffDevice(deviceName: String) {
        for var device in smartHome.devices {
            if device.name == deviceName {
                device.isWorking = false
                print("Устройство '\(deviceName)' выключено.")
                return
            }
        }
        print("Устройство '\(deviceName)' не найдено.")
    }
    func increaseBrightness(deviceName: String) {
        for device in smartHome.devices {
            if device.name == deviceName, let light = device as? Light {
                light.increaseBrightness()
                print("Яркость устройства '\(deviceName)' увеличена.")
                return
            }
        }
        print("Устройство '\(deviceName)' не найдено или не является лампочкой.")
    }
    func decreaseBrightness(deviceName: String) {
        for device in smartHome.devices {
            if device.name == deviceName, let light = device as? Light {
                light.decreaseBrightness()
                print("Яркость устройства '\(deviceName)' уменьшена.")
                return
            }
        }
        print("Устройство '\(deviceName)' не найдено или не является лампочкой.")
    }
}
extension SmartHome {
    func setSmartMode(_ mode: SmartMode) {
        switch mode {
        case .sleep:
            for var device in devices {
                if !(device is Thermostat) {
                    device.isWorking = false
                }
            }
            setThermostatTemperature(25.0)
            lockAllDoors()
        case .safe:
            lockAllDoors()
            closeAllCurtains()
        case .romantic:
            for device in devices {
                if let tv = device as? TV {
                    tv.turnOn()
                    tv.changeChannel(to: 4)
                    tv.volumeLevel = 10
                } else if let curtain = device as? Curtain {
                    curtain.open()
                }
            }
            setThermostatTemperature(25.0)
        }
    }
}

