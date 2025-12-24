#pragma once

#include <iostream>
#include <cmath>

struct cplx {
    int64_t Real, Imag;

    cplx(int64_t real = 0, int64_t imag = 0) : Real(real), Imag(imag) {}

    cplx operator+(const cplx &other) const {
        return { Real + other.Real, Imag + other.Imag };
    }

    cplx operator-(const cplx &other) const {
        return { Real - other.Real, Imag - other.Imag };
    }

    cplx operator*(const cplx &other) const {
        return { Real * other.Real - Imag * other.Imag, Real * other.Imag + Imag * other.Real };
    }

    friend std::ostream &operator<<(std::ostream &os, const cplx &c) {
        os << c.Real << " " << "+-"[c.Imag < 0] << " j" << abs(c.Imag);
        return os;
    }
};