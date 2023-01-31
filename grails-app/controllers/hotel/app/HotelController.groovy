package hotel.app

import grails.gorm.transactions.Transactional
import hotel.app.impl.HotelService
import org.hotelApp.Country
import org.hotelApp.Hotel

class HotelController {

    HotelService hotelService

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index() {
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
        if (hotel == null) {
            notFound()
            return
        }
        if (hotel.hasErrors()) {
            respond hotel.errors, view: 'create'
        }
        hotel.save flush: true
        redirect action: 'index'
    }

    def hotelList() {
        println params
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        def hotelList
        if (params.searchInput == null) {
            hotelList = Hotel.list(params)
        } else {
            def c = Hotel.createCriteria()
            hotelList = c.list(params) {
                like('country', Country.findByName(params.searchInput.toString()))
//                and {
//                    eq('country', Country.findByName(params.country.toString()))
//                }

            }
            println hotelList
        }
        println params
        respond template: 'index'
        model:
        [
                hotelList : hotelList,
                hotelTotal: Hotel.count,
                max       : params.max,
                offset    : params.offset
        ]
    }

    protected void notFound() {
        request.withFormat {
            form with {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotel.label', default: 'Hotel'), params.id]) as Object
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
