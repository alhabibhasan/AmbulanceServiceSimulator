(define (problem simpleProblem)
  (:domain Ambulance)
  (:objects
      t1 - truck
      p1 p2 p3 - patient
      l1 l2 l3 l4 - location)
  (:init

  (location-linked l1 l2)
  (location-linked l2 l1)

  (location-linked l2 l3)
  (location-linked l3 l2)

  (location-linked l3 l4)
  (location-linked l4 l3)

  (location-linked l4 l1)
  (location-linked l1 l4)

  (= (distance-between l1 l2) 10)
  (= (distance-between l2 l1) 10)
  (= (fuel_use l1 l2) 5)
  (= (fuel_use l2 l1) 5)

  (= (distance-between l2 l3) 14)
  (= (distance-between l3 l2) 14)
  (= (fuel_use l2 l3) 5)
  (= (fuel_use l3 l2) 5)


  (= (distance-between l3 l4) 100)
  (= (distance-between l4 l3) 100)
  (= (fuel_use l3 l4) 5)
  (= (fuel_use l4 l3) 5)


  (= (distance-between l4 l1) 200)
  (= (distance-between l1 l4) 200)
  (= (fuel_use l4 l1) 5)
  (= (fuel_use l1 l4) 5)

  (= (distance-travelled) 0)

  (= (max_fuel t1) 100)

  (= (fuel_level t1) 10)

  (fuel_pump l1)

  (at-vehicle t1 l1)

  (at-patient p1 l1)
  (= (patient-urgency p1) 2)

  (at-patient p2 l2)
  (= (patient-urgency p2) 4)

  (at-patient p3 l3)
  (= (patient-urgency p3) 4)



  (hospital l1)
  (vehicle-empty t1)

  (= (time-to-prepare t1) 2)
  (= (vehicle-speed-up t1) 1)
  (= (vehicle-urgency t1) 0)


  )

  (:goal (and
              (patient-at-hospital p1)
              (patient-at-hospital p2)
              (patient-at-hospital p3)
              ))

              (:metric minimize (total-time))
  )
