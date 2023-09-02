include

from(bucket: "MyTrip")
range(start -10, stop: now())
filter

attribute
varying 
void(main) {

}

from(bucket:"example-bucket")
  |> range(start:-1h)
  |> filter(fn:(r) =>
    r._measurement == "my-measurement" and
    r.my-tag-key == "my-tag-value"
  )

gl_Position = gl_Matrices[] *object_space;
limit

#group
