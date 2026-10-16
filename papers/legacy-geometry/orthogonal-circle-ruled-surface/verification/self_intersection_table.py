"""Numerical illustration only: emit the two positive-half labels and image.

Matplotlib is unavailable in the registered runtime. Redirect stdout to a CSV
file if desired; no floating-point sample participates in the exact proof.
"""
import csv
import math
import sys


def row(v):
    h = v**3 + 7*v*v + 3*v + 5
    x = 2*(1+v)*(3+v*v)/h
    y = (1+v)**2*(1+3*v*v)/((1-v)*h)
    delta = 16*(1+v)**3*(1+v*v)*(1-4*v-v*v)/((1-v)*h*h)
    assert delta >= -1e-14
    root = math.sqrt(max(0, delta))
    a, b = (x+root)/2, (x-root)/2
    length = (1+v)*(1+3*v*v)/h
    u, up = (a-length)/(2*a), (b-length)/(2*b)
    assert 0 < b <= a <= 1+1e-14 and min(u, up) >= -1e-14
    image = (1-length,
             (3-v)*math.sqrt((1+v)*(1+v*v)*(1+3*v*v))/(h*math.sqrt(1-v)),
             2*math.sqrt(2)*v*math.sqrt((1+v)*(v*v+3))/(h*math.sqrt(1-v)))
    for aa, uu in [(a, u), (b, up)]:
        actual = (1-aa+2*aa*uu, (1-uu)*math.sqrt(aa*(2-aa)),
                  uu*math.sqrt(max(0, 1-aa*aa)))
        assert max(abs(p-q) for p, q in zip(actual, image)) < 1e-12
    return (v, math.acos(1-a), u, math.acos(1-b), up, *image)


def main():
    writer = csv.writer(sys.stdout, lineterminator="\n")
    writer.writerow(["v", "t_plus", "u_plus", "t_minus", "u_minus", "image_x",
                     "image_y", "image_z"])
    for j in range(17):
        writer.writerow(f"{value:.15g}" for value in row((math.sqrt(5)-2)*j/16))


if __name__ == "__main__":
    main()
