(define (problem simpleProblem)
  (:domain Ambulance)
  (:objects
      h1 - helicopter
      t1 t2 t3 t4 t5 - truck
      p1 p2 p3 p4 - patient
      l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 - location)
  (:init

  (location-linked l1 l2)
  (location-linked l2 l1)

  (location-linked l2 l3)
  (location-linked l3 l2)

  (location-linked l3 l4)
  (location-linked l4 l3)

  (location-linked l4 l1)
  (location-linked l1 l4)

  (location-linked l4 l5)
  (location-linked l5 l4)

  (location-linked l5 l6)
  (location-linked l6 l5)

  (location-linked l6 l7)
  (location-linked l7 l6)

  (location-linked l7 l8)
  (location-linked l8 l7)

  (location-linked l8 l3)
  (location-linked l3 l8)

  (location-linked l8 l4)
  (location-linked l4 l8)

  (location-linked l1 l9)
  (location-linked l9 l1)

  (location-linked l9 l10)
  (location-linked l10 l9)

  (location-linked l10 l6)
  (location-linked l6 l10)

  (location-linked l10 l6)
  (location-linked l6 l10)

  (= (distance-between l1 l2) 6)
  (= (distance-between l2 l1) 6)
  (= (fuel_use l1 l9) 6)
  (= (fuel_use l9 l1) 6)

  (= (distance-between l1 l9) 20)
  (= (distance-between l9 l1) 20)
  (= (fuel_use l1 l9) 6)
  (= (fuel_use l9 l1) 6)

  (= (distance-between l9 l10) 10)
  (= (distance-between l10 l9) 10)
  (= (fuel_use l9 l10) 15)
  (= (fuel_use l10 l9) 15)

  (= (distance-between l4 l5) 15)
  (= (distance-between l5 l4) 15)
  (= (fuel_use l5 l4) 8)
  (= (fuel_use l4 l5) 8)

  (= (distance-between l5 l6) 5)
  (= (distance-between l5 l6) 5)
  (= (fuel_use l5 l6) 2)
  (= (fuel_use l6 l5) 2)

  (= (distance-between l5 l6) 5)
  (= (distance-between l5 l6) 5)
  (= (fuel_use l5 l6) 2)
  (= (fuel_use l6 l5) 2)

  (= (distance-between l3 l8) 5)
  (= (distance-between l8 l3) 5)
  (= (fuel_use l3 l8) 2)
  (= (fuel_use l8 l3) 2)

  (= (distance-between l8 l4) 25)
  (= (distance-between l4 l8) 25)
  (= (fuel_use l8 l4) 15)
  (= (fuel_use l4 l8) 15)

  (= (distance-between l8 l7) 15)
  (= (distance-between l7 l8) 15)
  (= (fuel_use l8 l4) 15)
  (= (fuel_use l4 l8) 15)

  (= (distance-between l7 l6) 10)
  (= (distance-between l6 l7) 10)
  (= (fuel_use l7 l6) 10)
  (= (fuel_use l6 l7) 10)

  (= (distance-between l7 l6) 7)
  (= (distance-between l6 l7) 7)
  (= (fuel_use l7 l6) 7)
  (= (fuel_use l6 l7) 7)

  (= (distance-between l6 l10) 13)
  (= (distance-between l10 l6) 13)
  (= (fuel_use l6 l10) 10)
  (= (fuel_use l10 l6) 10)

  (= (distance-between l4 l1) 17)
  (= (distance-between l1 l4) 17)
  (= (fuel_use l1 l4) 10)
  (= (fuel_use l4 l1) 10)


  (= (distance-travelled) 0)



  (= (max_fuel t1) 100)
  (= (max_fuel t2) 100)
  (= (max_fuel t3) 100)
  (= (max_fuel t4) 200)
  (= (max_fuel t5) 200)

  (= (fuel_level t1) 1)
  (= (fuel_level t2) 1)
  (= (fuel_level t3) 2)
  (= (fuel_level t4) 100)
  (= (fuel_level t5) 50)


  (= (max_fuel h1) 500)
  (= (fuel_level h1) 250)

  (fuel_pump l1)
  (fuel_pump l3)
  (fuel_pump l9)

  (at-vehicle t1 l1)
  (at-vehicle t2 l1)
  (at-vehicle t3 l3)
  (at-vehicle t4 l1)
  (at-vehicle t5 l2)

  (at-vehicle h1 l1)

  (= (vehicle-speed-up t1) 1)
  (= (vehicle-speed-up t2) 1)
  (= (vehicle-speed-up t3) 1)
  (= (vehicle-speed-up t4) 1)
  (= (vehicle-speed-up t5) 1)

  (= (vehicle-speed-up h1) 5)

  (at-patient p1 l5)
  (at-patient p2 l1)
  (at-patient p3 l3)
  (at-patient p4 l4)



  (= (patient-urgency p1) 9)
  (= (patient-urgency p2) 4)
  (= (patient-urgency p4) 4)
  (= (patient-urgency p3) 9)




  (hospital l1)
  (hospital l4)

  (vehicle-empty t1)
  (vehicle-empty t2)
  (vehicle-empty t3)
  (vehicle-empty t4)
  (vehicle-empty t5)

  (vehicle-empty h1)

  (= (time-to-prepare t1) 2)
  (= (time-to-prepare t2) 2)
  (= (time-to-prepare t3) 2)
  (= (time-to-prepare t4) 2)
  (= (time-to-prepare t5) 2)

  (= (time-to-prepare h1) 4)

  (= (vehicle-urgency h1) 5)
  (= (vehicle-urgency t1) 0)
  (= (vehicle-urgency t2) 0)
  (= (vehicle-urgency t3) 0)
  (= (vehicle-urgency t4) 0)
  (= (vehicle-urgency t5) 0)


  )

  (:goal (and
              (patient-at-hospital p1)
              (patient-at-hospital p2)
              (patient-at-hospital p3)
              (patient-at-hospital p4)


              ))

              (:metric minimize (total-time))
  )
