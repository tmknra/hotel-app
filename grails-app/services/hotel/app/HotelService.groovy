package hotel.app

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional
import org.hotelApp.Hotel

@Transactional
@Service(Hotel)
interface HotelService {
    Hotel save(Hotel hotel)
    Hotel update(Hotel hotel)
    void delete(Long id)
}
