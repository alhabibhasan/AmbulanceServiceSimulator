(define (problem simpleProblem)
  (:domain Ambulance)
  (:objects
      h1 - helicopter
      t1 t2 t3 - truck
      p1 p2 - patient
      l1 l2 l3 l4 l5 l6 - location)
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

  (= (distance-between l1 l2) 10)
  (= (distance-between l2 l1) 10)
  (= (fuel_use l1 l2) 5)
  (= (fuel_use l2 l1) 5)

  (= (distance-between l2 l3) 14)
  (= (distance-between l3 l2) 14)
  (= (fuel_use l2 l3) 5)
  (= (fuel_use l3 l2) 5)


  (= (distance-between l3 l4) 12)
  (= (distance-between l4 l3) 12)
  (= (fuel_use l3 l4) 4)
  (= (fuel_use l4 l3) 4)

  (= (distance-between l4 l5) 15)
  (= (distance-between l5 l4) 15)
  (= (fuel_use l5 l4) 8)
  (= (fuel_use l4 l5) 8)

  (= (distance-between l5 l6) 5)
  (= (distance-between l6 l5) 5)
  (= (fuel_use l5 l6) 2)
  (= (fuel_use l6 l5) 2)

  (= (distance-between l5 l6) 5)
  (= (distance-between l5 l6) 5)
  (= (fuel_use l5 l6) 2)
  (= (fuel_use l6 l5) 2)

  (= (distance-between l4 l1) 17)
  (= (distance-between l1 l4) 17)
  (= (fuel_use l4 l1) 10)
  (= (fuel_use l1 l4) 10)

  (= (distance-travelled) 0)



  (= (max_fuel t1) 100)
  (= (max_fuel t2) 100)
  (= (max_fuel t3) 200)
  (= (fuel_level t1) 10)
  (= (fuel_level t2) 10)
  (= (fuel_level t3) 20)

  (= (max_fuel h1) 500)
  (= (fuel_level h1) 50)

  (fuel_pump l1)

  (at-vehicle t1 l1)
  (at-vehicle t2 l1)
  (at-vehicle t3 l3)
  (at-vehicle h1 l1)

  (= (vehicle-speed-up t1) 1)
  (= (vehicle-speed-up t2) 1)
  (= (vehicle-speed-up t3) 1)
  (= (vehicle-speed-up h1) 5)

  (at-patient p1 l6)
  (at-patient p2 l5)

  (= (patient-urgency p1) 6)
  (= (patient-urgency p2) 4)



  (hospital l1)
  (hospital l3)

  (vehicle-empty t1)
  (vehicle-empty t2)
  (vehicle-empty t3)
  (vehicle-empty h1)

  (= (time-to-prepare t1) 2)
  (= (time-to-prepare t2) 2)
  (= (time-to-prepare t3) 2)
  (= (time-to-prepare h1) 4)

  (= (vehicle-urgency h1) 5)
  (= (vehicle-urgency t1) 0)
  (= (vehicle-urgency t2) 0)

  )

  (:goal (and
              (patient-at-hospital p1)
              (patient-at-hospital p2)

              ))

              (:metric minimize (total-time))
  )
