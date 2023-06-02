protocol SmartHome {
    func command()
}
// Создаю общий протокол Device от которого будут наследоваться другие устройства
protocol Device {
    var name: String { get set }
    var isWorking: Bool { get set }
    func status()
}

class Door: Device {
    var name: String
    init(name: String) {
        self.name = name
    }
    var isWorking: Bool = true
    var openOrClose: Bool = true
    func close() {
        openOrClose = false
    }
    func open() {
        openOrClose = true
    }
    func status() {
        if openOrClose == true {
            print("Дверь \(name) открыта")
        }
        else {
            print("Дверь \(name) закрыта")
        }
    }
}
