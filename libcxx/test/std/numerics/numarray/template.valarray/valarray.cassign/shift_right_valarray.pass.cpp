//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// <valarray>

// template<class T> class valarray;

// valarray& operator>>=(const valarray& v);

#include <valarray>
#include <cassert>
#include <cstddef>

int main(int, char**)
{
    {
        typedef int T;
        T a1[] = { 1,   2,   3,    4,    5};
        T a2[] = { 6,   7,   8,    9,   10};
        T a3[] = {64, 256, 768, 2048, 5120};
        const unsigned N = sizeof(a1)/sizeof(a1[0]);
        std::valarray<T> v1(a1, N);
        std::valarray<T> v2(a2, N);
        std::valarray<T> v3(a3, N);
        v3 >>= v2;
        assert(v1.size() == v2.size());
        assert(v1.size() == v3.size());
        for (std::size_t i = 0; i < v1.size(); ++i)
            assert(v1[i] == v3[i]);
    }

  return 0;
}
