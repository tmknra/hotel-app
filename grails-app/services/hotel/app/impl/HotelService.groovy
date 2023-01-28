package hotel.app.impl

import grails.gorm.transactions.Transactional
import org.hotelApp.Hotel

@Transactional
class HotelService implements hotel.app.HotelService{

    def serviceMethod() {

    }

    @Override
    Hotel save(Hotel hotel) {
        return null
    }

    @Override
    Hotel update(Hotel hotel) {
        return null
    }

    @Override
    void delete(Long id) {

    }
}
