protocol SmartHome {
    func command()
}
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

