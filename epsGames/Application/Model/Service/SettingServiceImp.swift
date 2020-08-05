import Foundation

protocol SettingService {
    
    var isLoad: Bool { get } //признак загрузки всех настроек
    
    func loadPlatforms() -> [Platform]
    
    func loadPatitions() -> [Patition]
    
}

final class SettingServiceImpl: SettingService {
    
    var isLoad: Bool
    
    init() { //}(configuration: Configuration) {
        isLoad = false
        //self.configuration = configuration
    }
    
    func loadPlatforms() -> [Platform] {
        print("=loadPlatforms")
        return []
    }
    
    func loadPatitions() -> [Patition] {
        print("=loadPatitions")
        return []
    }
    
    
}

