package hotel.app

import grails.gorm.transactions.Transactional
import org.hotelApp.Country
import org.hotelApp.Hotel

import java.util.stream.Collectors

class HotelController {

    HotelService hotelService

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        List<Hotel> hotelList
        def hotelTotal
        if (params.searchInput == null) {
            hotelList = Hotel.list(params)
            hotelTotal = Hotel.count
        } else {
            def c = Hotel.createCriteria()

            Country country = Country.findByName(params.country as String)
            String string = params.searchInput
            hotelList = (c.list(params as Map) {
                eq('country', country)
                order('rating', 'desc')
                order('name', 'asc')
                /*
                     Не подхватывает метод eq(String propertyName, Object propertyValue, [ignoreCase: true/false]),
                     не смог разобраться в причине. В используемой версии согласно документации все должно работать.
                     Отфильтровал значения ниже через стримы.
                 * */
            } as List<Hotel>)
                    .stream()
                    .filter { hotel -> hotel.name.toLowerCase().contains(string) }
                    .collect(Collectors.toList())

            def list = Hotel.withCriteria {
                like('country', country)
            } as List<Hotel>
            hotelTotal = list.size()
        }
        render view: 'index',
                model:
                        [
                                hotelList : hotelList,
                                hotelTotal: hotelTotal,
                                max       : params.max,
                                offset    : params.offset
                        ]
    }

    def show(Long id) {
        def get = Hotel.get(id)
        respond get, model: 'show'
    }

    def saveNewHotel() {
        hotelService.save(params)
        redirect action: 'index'
    }

    def edit(Hotel hotel) {
        respond hotel
    }

    def update(Hotel hotel) {
        save(hotel)
        redirect action: 'index'
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        hotelService.delete(id)
        redirect action: 'index'
    }

    @Transactional
    def save(Hotel hotel) {
        if (hotel == null ) {
            flash.message = "Error"
            notFound()
            return
        }
        if (hotel.hasErrors()) {
            respond hotel.errors, view: 'index'
        }
        hotel.save flush: true
    }


    protected void notFound() {
        request.withFormat {
            form with {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotel.label', default: 'Hotel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
