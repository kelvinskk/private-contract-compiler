; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=x86-64 -mattr=+sha | FileCheck %s --check-prefix=CHECK --check-prefix=GENERIC
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=goldmont | FileCheck %s --check-prefix=CHECK --check-prefix=GOLDMONT
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=cannonlake | FileCheck %s --check-prefix=CHECK --check-prefix=CANNONLAKE
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=znver1 | FileCheck %s --check-prefix=CHECK --check-prefix=ZNVER1

;
; SHA1
;

define <4 x i32> @test_sha1msg1(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> *%a2) {
; GENERIC-LABEL: test_sha1msg1:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    sha1msg1 %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    sha1msg1 (%rdi), %xmm0 # sched: [9:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha1msg1:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    sha1msg1 %xmm1, %xmm0 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha1msg1 (%rdi), %xmm0 # sched: [7:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha1msg1:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    sha1msg1 %xmm1, %xmm0 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha1msg1 (%rdi), %xmm0 # sched: [10:1.00]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha1msg1:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    sha1msg1 %xmm1, %xmm0 # sched: [2:1.00]
; ZNVER1-NEXT:    sha1msg1 (%rdi), %xmm0 # sched: [9:1.00]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a2
  %2 = tail call <4 x i32> @llvm.x86.sha1msg1(<4 x i32> %a0, <4 x i32> %a1)
  %3 = tail call <4 x i32> @llvm.x86.sha1msg1(<4 x i32> %2, <4 x i32> %1)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha1msg1(<4 x i32>, <4 x i32>)

define <4 x i32> @test_sha1msg2(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> *%a2) {
; GENERIC-LABEL: test_sha1msg2:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    sha1msg2 %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    sha1msg2 (%rdi), %xmm0 # sched: [9:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha1msg2:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    sha1msg2 %xmm1, %xmm0 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha1msg2 (%rdi), %xmm0 # sched: [7:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha1msg2:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    sha1msg2 %xmm1, %xmm0 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha1msg2 (%rdi), %xmm0 # sched: [10:1.00]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha1msg2:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    sha1msg2 %xmm1, %xmm0 # sched: [1:0.50]
; ZNVER1-NEXT:    sha1msg2 (%rdi), %xmm0 # sched: [8:0.50]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a2
  %2 = tail call <4 x i32> @llvm.x86.sha1msg2(<4 x i32> %a0, <4 x i32> %a1)
  %3 = tail call <4 x i32> @llvm.x86.sha1msg2(<4 x i32> %2, <4 x i32> %1)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha1msg2(<4 x i32>, <4 x i32>)

define <4 x i32> @test_sha1nexte(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> *%a2) {
; GENERIC-LABEL: test_sha1nexte:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    sha1nexte %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    sha1nexte (%rdi), %xmm0 # sched: [9:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha1nexte:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    sha1nexte %xmm1, %xmm0 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha1nexte (%rdi), %xmm0 # sched: [7:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha1nexte:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    sha1nexte %xmm1, %xmm0 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha1nexte (%rdi), %xmm0 # sched: [10:1.00]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha1nexte:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    sha1nexte %xmm1, %xmm0 # sched: [1:1.00]
; ZNVER1-NEXT:    sha1nexte (%rdi), %xmm0 # sched: [8:1.00]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a2
  %2 = tail call <4 x i32> @llvm.x86.sha1nexte(<4 x i32> %a0, <4 x i32> %a1)
  %3 = tail call <4 x i32> @llvm.x86.sha1nexte(<4 x i32> %2, <4 x i32> %1)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha1nexte(<4 x i32>, <4 x i32>)

define <4 x i32> @test_sha1rnds4(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> *%a2) {
; GENERIC-LABEL: test_sha1rnds4:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    sha1rnds4 $3, %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # sched: [9:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha1rnds4:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    sha1rnds4 $3, %xmm1, %xmm0 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # sched: [7:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha1rnds4:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    sha1rnds4 $3, %xmm1, %xmm0 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # sched: [10:1.00]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha1rnds4:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    sha1rnds4 $3, %xmm1, %xmm0 # sched: [6:1.00]
; ZNVER1-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # sched: [13:1.00]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a2
  %2 = tail call <4 x i32> @llvm.x86.sha1rnds4(<4 x i32> %a0, <4 x i32> %a1, i8 3)
  %3 = tail call <4 x i32> @llvm.x86.sha1rnds4(<4 x i32> %2, <4 x i32> %1, i8 3)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha1rnds4(<4 x i32>, <4 x i32>, i8)

;
; SHA256
;

define <4 x i32> @test_sha256msg1(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> *%a2) {
; GENERIC-LABEL: test_sha256msg1:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    sha256msg1 %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    sha256msg1 (%rdi), %xmm0 # sched: [9:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha256msg1:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    sha256msg1 %xmm1, %xmm0 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha256msg1 (%rdi), %xmm0 # sched: [7:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha256msg1:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    sha256msg1 %xmm1, %xmm0 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha256msg1 (%rdi), %xmm0 # sched: [10:1.00]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha256msg1:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    sha256msg1 %xmm1, %xmm0 # sched: [2:1.00]
; ZNVER1-NEXT:    sha256msg1 (%rdi), %xmm0 # sched: [9:1.00]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a2
  %2 = tail call <4 x i32> @llvm.x86.sha256msg1(<4 x i32> %a0, <4 x i32> %a1)
  %3 = tail call <4 x i32> @llvm.x86.sha256msg1(<4 x i32> %2, <4 x i32> %1)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha256msg1(<4 x i32>, <4 x i32>)

define <4 x i32> @test_sha256msg2(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> *%a2) {
; GENERIC-LABEL: test_sha256msg2:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    sha256msg2 %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    sha256msg2 (%rdi), %xmm0 # sched: [9:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha256msg2:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    sha256msg2 %xmm1, %xmm0 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha256msg2 (%rdi), %xmm0 # sched: [7:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha256msg2:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    sha256msg2 %xmm1, %xmm0 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha256msg2 (%rdi), %xmm0 # sched: [10:1.00]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha256msg2:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    sha256msg2 %xmm1, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    sha256msg2 (%rdi), %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a2
  %2 = tail call <4 x i32> @llvm.x86.sha256msg2(<4 x i32> %a0, <4 x i32> %a1)
  %3 = tail call <4 x i32> @llvm.x86.sha256msg2(<4 x i32> %2, <4 x i32> %1)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha256msg2(<4 x i32>, <4 x i32>)

define <4 x i32> @test_sha256rnds2(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> %a2, <4 x i32> *%a3) {
; GENERIC-LABEL: test_sha256rnds2:
; GENERIC:       # %bb.0:
; GENERIC-NEXT:    movaps %xmm0, %xmm3 # sched: [1:1.00]
; GENERIC-NEXT:    movaps %xmm2, %xmm0 # sched: [1:1.00]
; GENERIC-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3 # sched: [5:1.00]
; GENERIC-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm3 # sched: [9:1.00]
; GENERIC-NEXT:    movaps %xmm3, %xmm0 # sched: [1:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; GOLDMONT-LABEL: test_sha256rnds2:
; GOLDMONT:       # %bb.0:
; GOLDMONT-NEXT:    movaps %xmm0, %xmm3 # sched: [1:1.00]
; GOLDMONT-NEXT:    movaps %xmm2, %xmm0 # sched: [1:1.00]
; GOLDMONT-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3 # sched: [4:1.00]
; GOLDMONT-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm3 # sched: [7:1.00]
; GOLDMONT-NEXT:    movaps %xmm3, %xmm0 # sched: [1:1.00]
; GOLDMONT-NEXT:    retq # sched: [4:1.00]
;
; CANNONLAKE-LABEL: test_sha256rnds2:
; CANNONLAKE:       # %bb.0:
; CANNONLAKE-NEXT:    vmovaps %xmm0, %xmm3 # sched: [1:0.33]
; CANNONLAKE-NEXT:    vmovaps %xmm2, %xmm0 # sched: [1:0.33]
; CANNONLAKE-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3 # sched: [5:1.00]
; CANNONLAKE-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm3 # sched: [10:1.00]
; CANNONLAKE-NEXT:    vmovaps %xmm3, %xmm0 # sched: [1:0.33]
; CANNONLAKE-NEXT:    retq # sched: [7:1.00]
;
; ZNVER1-LABEL: test_sha256rnds2:
; ZNVER1:       # %bb.0:
; ZNVER1-NEXT:    vmovaps %xmm0, %xmm3 # sched: [1:0.50]
; ZNVER1-NEXT:    vmovaps %xmm2, %xmm0 # sched: [1:0.50]
; ZNVER1-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3 # sched: [4:1.00]
; ZNVER1-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm3 # sched: [11:1.00]
; ZNVER1-NEXT:    vmovaps %xmm3, %xmm0 # sched: [1:0.50]
; ZNVER1-NEXT:    retq # sched: [1:0.50]
  %1 = load <4 x i32>, <4 x i32>* %a3
  %2 = tail call <4 x i32> @llvm.x86.sha256rnds2(<4 x i32> %a0, <4 x i32> %a1, <4 x i32> %a2)
  %3 = tail call <4 x i32> @llvm.x86.sha256rnds2(<4 x i32> %2, <4 x i32> %1, <4 x i32> %a2)
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.x86.sha256rnds2(<4 x i32>, <4 x i32>, <4 x i32>)
