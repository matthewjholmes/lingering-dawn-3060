six_flags = AmusementPark.create(name: 'Six Flags', cost_of_admission: 50)
universal = AmusementPark.create(name: 'Universal Studios', cost_of_admission: 90)

six_flags.rides.create(name: 'Ferris Wheel', thrill_rating: 3, open: true)
six_flags.rides.create(name: 'Ultimate Roller Coaster', thrill_rating: 9, open: true)
six_flags.rides.create(name: 'Retired Roller Coaster', thrill_rating: 10, open: false)
universal.rides.create(name: 'Jaws', thrill_rating: 7, open: true)
