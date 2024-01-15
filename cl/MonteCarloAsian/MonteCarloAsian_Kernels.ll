; ModuleID = '../AMDAPP_samples/cl/MonteCarloAsian/MonteCarloAsian_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/MonteCarloAsian/MonteCarloAsian_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._MonteCalroAttribVector = type { <4 x float>, <4 x float>, <4 x float>, <4 x float>, <4 x float>, <4 x float>, <4 x float> }
%struct._MonteCalroAttribScalar = type { float, float, float, float, float, float, float }

@mulFactor = dso_local local_unnamed_addr constant i32 4, align 4
@stateMask = dso_local local_unnamed_addr constant i32 1812433253, align 4
@thirty = dso_local local_unnamed_addr constant i32 30, align 4
@thirteen = dso_local local_unnamed_addr constant i32 13, align 4
@fifteen = dso_local local_unnamed_addr constant i32 15, align 4
@threeBytes = dso_local local_unnamed_addr constant i32 24, align 4
@mask = dso_local local_unnamed_addr constant [4 x i32] [i32 -33605633, i32 -276873347, i32 -8946819, i32 2146958127], align 16
@one = dso_local local_unnamed_addr constant float 1.000000e+00, align 4
@intMax = dso_local local_unnamed_addr constant float 0x41F0000000000000, align 4
@PI = dso_local local_unnamed_addr constant float 0x400921FB60000000, align 4
@two = dso_local local_unnamed_addr constant float 2.000000e+00, align 4

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @lshift128(<4 x i32> %0, <4 x i32>* nocapture %1) local_unnamed_addr #0 {
  %3 = extractelement <4 x i32> %0, i64 0
  %4 = shl i32 %3, 24
  %5 = insertelement <4 x i32> undef, i32 %4, i64 0
  %6 = extractelement <4 x i32> %0, i64 1
  %7 = shl i32 %6, 24
  %8 = lshr i32 %3, 8
  %9 = or i32 %7, %8
  %10 = insertelement <4 x i32> %5, i32 %9, i64 1
  %11 = extractelement <4 x i32> %0, i64 2
  %12 = shl i32 %11, 24
  %13 = lshr i32 %6, 8
  %14 = or i32 %12, %13
  %15 = insertelement <4 x i32> %10, i32 %14, i64 2
  %16 = extractelement <4 x i32> %0, i64 3
  %17 = shl i32 %16, 24
  %18 = lshr i32 %11, 8
  %19 = or i32 %17, %18
  %20 = insertelement <4 x i32> %15, i32 %19, i64 3
  store <4 x i32> %20, <4 x i32>* %1, align 16, !tbaa !3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @rshift128(<4 x i32> %0, <4 x i32>* nocapture %1) local_unnamed_addr #0 {
  %3 = extractelement <4 x i32> %0, i64 3
  %4 = lshr i32 %3, 24
  %5 = insertelement <4 x i32> undef, i32 %4, i64 3
  %6 = extractelement <4 x i32> %0, i64 2
  %7 = lshr i32 %6, 24
  %8 = shl i32 %3, 8
  %9 = or i32 %7, %8
  %10 = insertelement <4 x i32> %5, i32 %9, i64 2
  %11 = extractelement <4 x i32> %0, i64 1
  %12 = lshr i32 %11, 24
  %13 = shl i32 %6, 8
  %14 = or i32 %12, %13
  %15 = insertelement <4 x i32> %10, i32 %14, i64 1
  %16 = extractelement <4 x i32> %0, i64 0
  %17 = lshr i32 %16, 24
  %18 = shl i32 %11, 8
  %19 = or i32 %17, %18
  %20 = insertelement <4 x i32> %15, i32 %19, i64 0
  store <4 x i32> %20, <4 x i32>* %1, align 16, !tbaa !3
  ret void
}

; Function Attrs: convergent nounwind uwtable writeonly
define dso_local void @generateRand_Vector(<4 x i32> %0, <4 x float>* nocapture %1, <4 x float>* nocapture %2, <4 x i32>* nocapture %3) local_unnamed_addr #2 {
  %5 = lshr <4 x i32> %0, <i32 30, i32 30, i32 30, i32 30>
  %6 = xor <4 x i32> %5, %0
  %7 = mul <4 x i32> %6, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %8 = add <4 x i32> %7, <i32 1, i32 1, i32 1, i32 1>
  %9 = lshr <4 x i32> %8, <i32 30, i32 30, i32 30, i32 30>
  %10 = xor <4 x i32> %9, %8
  %11 = mul <4 x i32> %10, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %12 = add <4 x i32> %11, <i32 2, i32 2, i32 2, i32 2>
  %13 = lshr <4 x i32> %12, <i32 30, i32 30, i32 30, i32 30>
  %14 = xor <4 x i32> %13, %12
  %15 = mul <4 x i32> %14, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %16 = add <4 x i32> %15, <i32 3, i32 3, i32 3, i32 3>
  %17 = lshr <4 x i32> %16, <i32 30, i32 30, i32 30, i32 30>
  %18 = xor <4 x i32> %17, %16
  %19 = mul <4 x i32> %18, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %20 = add <4 x i32> %19, <i32 4, i32 4, i32 4, i32 4>
  %21 = extractelement <4 x i32> %0, i64 0
  %22 = shl i32 %21, 24
  %23 = extractelement <4 x i32> %0, i64 1
  %24 = shl i32 %23, 24
  %25 = lshr i32 %21, 8
  %26 = or i32 %24, %25
  %27 = extractelement <4 x i32> %0, i64 2
  %28 = shl i32 %27, 24
  %29 = lshr i32 %23, 8
  %30 = or i32 %28, %29
  %31 = extractelement <4 x i32> %0, i64 3
  %32 = shl i32 %31, 24
  %33 = lshr i32 %27, 8
  %34 = or i32 %32, %33
  %35 = extractelement <4 x i32> %16, i64 3
  %36 = lshr i32 %35, 24
  %37 = extractelement <4 x i32> %16, i64 2
  %38 = lshr i32 %37, 24
  %39 = shl i32 %35, 8
  %40 = or i32 %38, %39
  %41 = extractelement <4 x i32> %16, i64 1
  %42 = lshr i32 %41, 24
  %43 = shl i32 %37, 8
  %44 = or i32 %42, %43
  %45 = extractelement <4 x i32> %16, i64 0
  %46 = lshr i32 %45, 24
  %47 = shl i32 %41, 8
  %48 = or i32 %46, %47
  %49 = extractelement <4 x i32> %12, i64 0
  %50 = lshr i32 %49, 13
  %51 = and i32 %50, 473087
  %52 = extractelement <4 x i32> %20, i64 0
  %53 = shl i32 %52, 15
  %54 = xor i32 %48, %21
  %55 = xor i32 %54, %53
  %56 = xor i32 %55, %22
  %57 = xor i32 %56, %51
  %58 = insertelement <4 x i32> undef, i32 %57, i64 0
  %59 = extractelement <4 x i32> %12, i64 1
  %60 = lshr i32 %59, 13
  %61 = and i32 %60, 475005
  %62 = extractelement <4 x i32> %20, i64 1
  %63 = shl i32 %62, 15
  %64 = xor i32 %44, %23
  %65 = xor i32 %64, %63
  %66 = xor i32 %65, %26
  %67 = xor i32 %66, %61
  %68 = insertelement <4 x i32> %58, i32 %67, i64 1
  %69 = extractelement <4 x i32> %12, i64 2
  %70 = lshr i32 %69, 13
  %71 = and i32 %70, 490365
  %72 = extractelement <4 x i32> %20, i64 2
  %73 = shl i32 %72, 15
  %74 = xor i32 %40, %27
  %75 = xor i32 %74, %73
  %76 = xor i32 %75, %30
  %77 = xor i32 %76, %71
  %78 = insertelement <4 x i32> %68, i32 %77, i64 2
  %79 = extractelement <4 x i32> %12, i64 3
  %80 = lshr i32 %79, 13
  %81 = and i32 %80, 523055
  %82 = extractelement <4 x i32> %20, i64 3
  %83 = shl i32 %82, 15
  %84 = xor i32 %31, %36
  %85 = xor i32 %84, %83
  %86 = xor i32 %85, %34
  %87 = xor i32 %86, %81
  %88 = insertelement <4 x i32> %78, i32 %87, i64 3
  %89 = extractelement <4 x i32> %8, i64 0
  %90 = shl i32 %89, 24
  %91 = extractelement <4 x i32> %8, i64 1
  %92 = shl i32 %91, 24
  %93 = lshr i32 %89, 8
  %94 = or i32 %92, %93
  %95 = extractelement <4 x i32> %8, i64 2
  %96 = shl i32 %95, 24
  %97 = lshr i32 %91, 8
  %98 = or i32 %96, %97
  %99 = extractelement <4 x i32> %8, i64 3
  %100 = shl i32 %99, 24
  %101 = lshr i32 %95, 8
  %102 = or i32 %100, %101
  %103 = lshr i32 %82, 24
  %104 = lshr i32 %72, 24
  %105 = shl i32 %82, 8
  %106 = or i32 %104, %105
  %107 = lshr i32 %62, 24
  %108 = shl i32 %72, 8
  %109 = or i32 %107, %108
  %110 = lshr i32 %52, 24
  %111 = shl i32 %62, 8
  %112 = or i32 %110, %111
  %113 = extractelement <4 x i32> %16, i64 0
  %114 = lshr i32 %113, 13
  %115 = and i32 %114, 473087
  %116 = shl i32 %57, 15
  %117 = xor i32 %112, %89
  %118 = xor i32 %117, %116
  %119 = xor i32 %118, %90
  %120 = xor i32 %119, %115
  %121 = insertelement <4 x i32> undef, i32 %120, i64 0
  %122 = extractelement <4 x i32> %16, i64 1
  %123 = lshr i32 %122, 13
  %124 = and i32 %123, 475005
  %125 = shl i32 %67, 15
  %126 = xor i32 %109, %91
  %127 = xor i32 %126, %125
  %128 = xor i32 %127, %94
  %129 = xor i32 %128, %124
  %130 = insertelement <4 x i32> %121, i32 %129, i64 1
  %131 = extractelement <4 x i32> %16, i64 2
  %132 = lshr i32 %131, 13
  %133 = and i32 %132, 490365
  %134 = shl i32 %77, 15
  %135 = xor i32 %106, %95
  %136 = xor i32 %135, %134
  %137 = xor i32 %136, %98
  %138 = xor i32 %137, %133
  %139 = insertelement <4 x i32> %130, i32 %138, i64 2
  %140 = extractelement <4 x i32> %16, i64 3
  %141 = lshr i32 %140, 13
  %142 = and i32 %141, 523055
  %143 = shl i32 %87, 15
  %144 = xor i32 %99, %103
  %145 = xor i32 %144, %143
  %146 = xor i32 %145, %102
  %147 = xor i32 %146, %142
  %148 = insertelement <4 x i32> %139, i32 %147, i64 3
  %149 = extractelement <4 x i32> %12, i64 0
  %150 = shl i32 %149, 24
  %151 = extractelement <4 x i32> %12, i64 1
  %152 = shl i32 %151, 24
  %153 = lshr i32 %149, 8
  %154 = or i32 %152, %153
  %155 = extractelement <4 x i32> %12, i64 2
  %156 = shl i32 %155, 24
  %157 = lshr i32 %151, 8
  %158 = or i32 %156, %157
  %159 = extractelement <4 x i32> %12, i64 3
  %160 = shl i32 %159, 24
  %161 = lshr i32 %155, 8
  %162 = or i32 %160, %161
  %163 = lshr i32 %86, 24
  %164 = lshr i32 %76, 24
  %165 = shl i32 %87, 8
  %166 = or i32 %164, %165
  %167 = lshr i32 %66, 24
  %168 = shl i32 %77, 8
  %169 = or i32 %167, %168
  %170 = lshr i32 %56, 24
  %171 = shl i32 %67, 8
  %172 = or i32 %170, %171
  %173 = extractelement <4 x i32> %20, i64 0
  %174 = lshr i32 %173, 13
  %175 = and i32 %174, 473087
  %176 = shl i32 %120, 15
  %177 = xor i32 %172, %149
  %178 = xor i32 %177, %176
  %179 = xor i32 %178, %150
  %180 = xor i32 %179, %175
  %181 = insertelement <4 x i32> undef, i32 %180, i64 0
  %182 = extractelement <4 x i32> %20, i64 1
  %183 = lshr i32 %182, 13
  %184 = and i32 %183, 475005
  %185 = shl i32 %129, 15
  %186 = xor i32 %169, %151
  %187 = xor i32 %186, %185
  %188 = xor i32 %187, %154
  %189 = xor i32 %188, %184
  %190 = insertelement <4 x i32> %181, i32 %189, i64 1
  %191 = extractelement <4 x i32> %20, i64 2
  %192 = lshr i32 %191, 13
  %193 = and i32 %192, 490365
  %194 = shl i32 %138, 15
  %195 = xor i32 %166, %155
  %196 = xor i32 %195, %194
  %197 = xor i32 %196, %158
  %198 = xor i32 %197, %193
  %199 = insertelement <4 x i32> %190, i32 %198, i64 2
  %200 = extractelement <4 x i32> %20, i64 3
  %201 = lshr i32 %200, 13
  %202 = and i32 %201, 523055
  %203 = shl i32 %147, 15
  %204 = xor i32 %159, %163
  %205 = xor i32 %204, %203
  %206 = xor i32 %205, %162
  %207 = xor i32 %206, %202
  %208 = insertelement <4 x i32> %199, i32 %207, i64 3
  %209 = tail call <4 x float> @_Z14convert_float4Dv4_j(<4 x i32> %88) #10
  %210 = fmul <4 x float> %209, <float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000>
  %211 = tail call <4 x float> @_Z14convert_float4Dv4_j(<4 x i32> %148) #10
  %212 = fmul <4 x float> %211, <float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000>
  %213 = tail call <4 x float> @_Z3logDv4_f(<4 x float> %210) #10
  %214 = fmul <4 x float> %213, <float -2.000000e+00, float -2.000000e+00, float -2.000000e+00, float -2.000000e+00>
  %215 = tail call <4 x float> @_Z4sqrtDv4_f(<4 x float> %214) #10
  %216 = fmul <4 x float> %212, <float 0x401921FB60000000, float 0x401921FB60000000, float 0x401921FB60000000, float 0x401921FB60000000>
  %217 = tail call <4 x float> @_Z3cosDv4_f(<4 x float> %216) #10
  %218 = fmul <4 x float> %215, %217
  store <4 x float> %218, <4 x float>* %1, align 16, !tbaa !3
  %219 = tail call <4 x float> @_Z3sinDv4_f(<4 x float> %216) #10
  %220 = fmul <4 x float> %215, %219
  store <4 x float> %220, <4 x float>* %2, align 16, !tbaa !3
  store <4 x i32> %208, <4 x i32>* %3, align 16, !tbaa !3
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z14convert_float4Dv4_j(<4 x i32>) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z4sqrtDv4_f(<4 x float>) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z3logDv4_f(<4 x float>) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z3cosDv4_f(<4 x float>) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z3sinDv4_f(<4 x float>) local_unnamed_addr #3

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @calOutputs_Vector(<4 x float> %0, <4 x float> %1, <4 x float> %2, <4 x float> %3, <4 x float> %4, <4 x float>* nocapture %5, <4 x float>* nocapture %6, <4 x float>* nocapture %7, <4 x float>* nocapture %8) local_unnamed_addr #0 {
  %10 = fsub <4 x float> %3, %0
  %11 = fsub <4 x float> %4, %0
  %12 = extractelement <4 x float> %10, i64 0
  %13 = fcmp ogt float %12, 0.000000e+00
  %14 = shufflevector <4 x float> <float 0.000000e+00, float undef, float undef, float undef>, <4 x float> %10, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %15 = select i1 %13, <4 x float> %14, <4 x float> zeroinitializer
  %16 = select i1 %13, <4 x float> <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, <4 x float> zeroinitializer
  %17 = extractelement <4 x float> %10, i64 1
  %18 = fcmp ogt float %17, 0.000000e+00
  %19 = insertelement <4 x float> %16, float 1.000000e+00, i64 1
  %20 = shufflevector <4 x float> %15, <4 x float> %10, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %21 = select i1 %18, <4 x float> %20, <4 x float> %15
  %22 = select i1 %18, <4 x float> %19, <4 x float> %16
  %23 = extractelement <4 x float> %10, i64 2
  %24 = fcmp ogt float %23, 0.000000e+00
  %25 = insertelement <4 x float> %22, float 1.000000e+00, i64 2
  %26 = shufflevector <4 x float> %21, <4 x float> %10, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %27 = select i1 %24, <4 x float> %26, <4 x float> %21
  %28 = select i1 %24, <4 x float> %25, <4 x float> %22
  %29 = extractelement <4 x float> %10, i64 3
  %30 = fcmp ogt float %29, 0.000000e+00
  %31 = insertelement <4 x float> %28, float 1.000000e+00, i64 3
  %32 = shufflevector <4 x float> %27, <4 x float> %10, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %33 = select i1 %30, <4 x float> %32, <4 x float> %27
  %34 = select i1 %30, <4 x float> %31, <4 x float> %28
  %35 = extractelement <4 x float> %11, i64 0
  %36 = fcmp ogt float %35, 0.000000e+00
  %37 = shufflevector <4 x float> <float 0.000000e+00, float undef, float undef, float undef>, <4 x float> %11, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %38 = select i1 %36, <4 x float> %37, <4 x float> zeroinitializer
  %39 = select i1 %36, <4 x float> <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, <4 x float> zeroinitializer
  %40 = extractelement <4 x float> %11, i64 1
  %41 = fcmp ogt float %40, 0.000000e+00
  %42 = insertelement <4 x float> %39, float 1.000000e+00, i64 1
  %43 = shufflevector <4 x float> %38, <4 x float> %11, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %44 = select i1 %41, <4 x float> %43, <4 x float> %38
  %45 = select i1 %41, <4 x float> %42, <4 x float> %39
  %46 = extractelement <4 x float> %11, i64 2
  %47 = fcmp ogt float %46, 0.000000e+00
  %48 = insertelement <4 x float> %45, float 1.000000e+00, i64 2
  %49 = shufflevector <4 x float> %44, <4 x float> %11, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %50 = select i1 %47, <4 x float> %49, <4 x float> %44
  %51 = select i1 %47, <4 x float> %48, <4 x float> %45
  %52 = extractelement <4 x float> %11, i64 3
  %53 = fcmp ogt float %52, 0.000000e+00
  %54 = insertelement <4 x float> %51, float 1.000000e+00, i64 3
  %55 = shufflevector <4 x float> %50, <4 x float> %11, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %56 = select i1 %53, <4 x float> %55, <4 x float> %50
  %57 = select i1 %53, <4 x float> %54, <4 x float> %51
  %58 = fmul <4 x float> %34, %1
  store <4 x float> %58, <4 x float>* %5, align 16, !tbaa !3
  %59 = fmul <4 x float> %57, %2
  store <4 x float> %59, <4 x float>* %6, align 16, !tbaa !3
  store <4 x float> %33, <4 x float>* %7, align 16, !tbaa !3
  store <4 x float> %56, <4 x float>* %8, align 16, !tbaa !3
  ret void
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @calPriceVega_Vector(%struct._MonteCalroAttribVector* nocapture readonly byval(%struct._MonteCalroAttribVector) align 16 %0, i32 %1, <4 x i32>* nocapture readonly %2, <4 x float>* nocapture %3, <4 x float>* nocapture %4, <8 x float>* nocapture %5) local_unnamed_addr #4 !kernel_arg_addr_space !6 !kernel_arg_access_qual !7 !kernel_arg_type !8 !kernel_arg_base_type !9 !kernel_arg_type_qual !10 {
  %7 = alloca <4 x float>, align 16
  %8 = alloca <4 x float>, align 16
  %9 = alloca <4 x i32>, align 16
  %10 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 0
  %11 = load <4 x float>, <4 x float>* %10, align 16, !tbaa !3
  %12 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 1
  %13 = load <4 x float>, <4 x float>* %12, align 16, !tbaa !3
  %14 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 2
  %15 = load <4 x float>, <4 x float>* %14, align 16, !tbaa !3
  %16 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 3
  %17 = load <4 x float>, <4 x float>* %16, align 16, !tbaa !3
  %18 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 4
  %19 = load <4 x float>, <4 x float>* %18, align 16, !tbaa !3
  %20 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 5
  %21 = load <4 x float>, <4 x float>* %20, align 16, !tbaa !3
  %22 = getelementptr inbounds %struct._MonteCalroAttribVector, %struct._MonteCalroAttribVector* %0, i64 0, i32 6
  %23 = load <4 x float>, <4 x float>* %22, align 16, !tbaa !3
  %24 = tail call i64 @_Z12get_local_idj(i32 0) #10
  %25 = trunc i64 %24 to i32
  %26 = tail call i64 @_Z12get_local_idj(i32 1) #10
  %27 = trunc i64 %26 to i32
  %28 = tail call i64 @_Z12get_group_idj(i32 0) #10
  %29 = trunc i64 %28 to i32
  %30 = tail call i64 @_Z12get_group_idj(i32 1) #10
  %31 = trunc i64 %30 to i32
  %32 = tail call i64 @_Z14get_local_sizej(i32 0) #10
  %33 = trunc i64 %32 to i32
  %34 = tail call i64 @_Z14get_local_sizej(i32 1) #10
  %35 = trunc i64 %34 to i32
  %36 = tail call i64 @_Z15get_global_sizej(i32 0) #10
  %37 = trunc i64 %36 to i32
  %38 = tail call i64 @_Z13get_global_idj(i32 0) #10
  %39 = tail call i64 @_Z13get_global_idj(i32 1) #10
  %40 = mul i64 %39, %36
  %41 = add i64 %40, %38
  %42 = mul nsw i32 %37, %31
  %43 = sdiv i32 %42, %33
  %44 = add nsw i32 %43, %29
  %45 = mul nsw i32 %33, %27
  %46 = add nsw i32 %45, %25
  %47 = bitcast <4 x float>* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %47) #11
  store <4 x float> zeroinitializer, <4 x float>* %7, align 16, !tbaa !3
  %48 = bitcast <4 x float>* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %48) #11
  store <4 x float> zeroinitializer, <4 x float>* %8, align 16, !tbaa !3
  %49 = bitcast <4 x i32>* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %49) #11
  %50 = shl i64 %41, 32
  %51 = ashr exact i64 %50, 32
  %52 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 %51
  %53 = load <4 x i32>, <4 x i32>* %52, align 16, !tbaa !3
  store <4 x i32> %53, <4 x i32>* %9, align 16, !tbaa !3
  %54 = icmp sgt i32 %1, 1
  br i1 %54, label %55, label %57

55:                                               ; preds = %6
  %56 = fmul <4 x float> %17, %23
  br label %127

57:                                               ; preds = %127, %6
  %58 = phi <4 x float> [ %19, %6 ], [ %148, %127 ]
  %59 = phi <4 x float> [ %19, %6 ], [ %149, %127 ]
  %60 = phi <4 x float> [ zeroinitializer, %6 ], [ %157, %127 ]
  %61 = phi <4 x float> [ zeroinitializer, %6 ], [ %161, %127 ]
  %62 = sitofp i32 %1 to float
  %63 = insertelement <4 x float> undef, float %62, i32 0
  %64 = shufflevector <4 x float> %63, <4 x float> undef, <4 x i32> zeroinitializer
  %65 = fdiv <4 x float> %58, %64, !fpmath !11
  %66 = fdiv <4 x float> %59, %64, !fpmath !11
  %67 = fdiv <4 x float> %60, %64, !fpmath !11
  %68 = fdiv <4 x float> %61, %64, !fpmath !11
  %69 = fsub <4 x float> %65, %11
  %70 = fsub <4 x float> %66, %11
  %71 = extractelement <4 x float> %69, i64 0
  %72 = fcmp ogt float %71, 0.000000e+00
  %73 = shufflevector <4 x float> <float 0.000000e+00, float undef, float undef, float undef>, <4 x float> %69, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %74 = select i1 %72, <4 x float> %73, <4 x float> zeroinitializer
  %75 = select i1 %72, <4 x float> <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, <4 x float> zeroinitializer
  %76 = extractelement <4 x float> %69, i64 1
  %77 = fcmp ogt float %76, 0.000000e+00
  %78 = insertelement <4 x float> %75, float 1.000000e+00, i64 1
  %79 = shufflevector <4 x float> %74, <4 x float> %69, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %80 = select i1 %77, <4 x float> %79, <4 x float> %74
  %81 = select i1 %77, <4 x float> %78, <4 x float> %75
  %82 = extractelement <4 x float> %69, i64 2
  %83 = fcmp ogt float %82, 0.000000e+00
  %84 = insertelement <4 x float> %81, float 1.000000e+00, i64 2
  %85 = shufflevector <4 x float> %80, <4 x float> %69, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %86 = select i1 %83, <4 x float> %85, <4 x float> %80
  %87 = select i1 %83, <4 x float> %84, <4 x float> %81
  %88 = extractelement <4 x float> %69, i64 3
  %89 = fcmp ogt float %88, 0.000000e+00
  %90 = insertelement <4 x float> %87, float 1.000000e+00, i64 3
  %91 = shufflevector <4 x float> %86, <4 x float> %69, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %92 = select i1 %89, <4 x float> %91, <4 x float> %86
  %93 = select i1 %89, <4 x float> %90, <4 x float> %87
  %94 = extractelement <4 x float> %70, i64 0
  %95 = fcmp ogt float %94, 0.000000e+00
  %96 = shufflevector <4 x float> <float 0.000000e+00, float undef, float undef, float undef>, <4 x float> %70, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %97 = select i1 %95, <4 x float> %96, <4 x float> zeroinitializer
  %98 = select i1 %95, <4 x float> <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, <4 x float> zeroinitializer
  %99 = extractelement <4 x float> %70, i64 1
  %100 = fcmp ogt float %99, 0.000000e+00
  %101 = insertelement <4 x float> %98, float 1.000000e+00, i64 1
  %102 = shufflevector <4 x float> %97, <4 x float> %70, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %103 = select i1 %100, <4 x float> %102, <4 x float> %97
  %104 = select i1 %100, <4 x float> %101, <4 x float> %98
  %105 = extractelement <4 x float> %70, i64 2
  %106 = fcmp ogt float %105, 0.000000e+00
  %107 = insertelement <4 x float> %104, float 1.000000e+00, i64 2
  %108 = shufflevector <4 x float> %103, <4 x float> %70, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %109 = select i1 %106, <4 x float> %108, <4 x float> %103
  %110 = select i1 %106, <4 x float> %107, <4 x float> %104
  %111 = extractelement <4 x float> %70, i64 3
  %112 = fcmp ogt float %111, 0.000000e+00
  %113 = insertelement <4 x float> %110, float 1.000000e+00, i64 3
  %114 = shufflevector <4 x float> %109, <4 x float> %70, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %115 = select i1 %112, <4 x float> %114, <4 x float> %109
  %116 = select i1 %112, <4 x float> %113, <4 x float> %110
  %117 = fmul <4 x float> %67, %93
  %118 = fmul <4 x float> %68, %116
  %119 = fadd <4 x float> %92, %115
  %120 = fadd <4 x float> %117, %118
  %121 = shufflevector <4 x float> %119, <4 x float> %120, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %122 = sext i32 %46 to i64
  %123 = getelementptr inbounds <8 x float>, <8 x float>* %5, i64 %122
  store <8 x float> %121, <8 x float>* %123, align 32, !tbaa !3
  tail call void @_Z7barrierj(i32 1) #12
  %124 = mul nsw i32 %35, %33
  %125 = ashr i32 %124, 1
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %166, label %170

127:                                              ; preds = %164, %55
  %128 = phi <4 x i32> [ %53, %55 ], [ %165, %164 ]
  %129 = phi i32 [ 1, %55 ], [ %162, %164 ]
  %130 = phi <4 x float> [ zeroinitializer, %55 ], [ %161, %164 ]
  %131 = phi <4 x float> [ zeroinitializer, %55 ], [ %157, %164 ]
  %132 = phi <4 x float> [ %19, %55 ], [ %149, %164 ]
  %133 = phi <4 x float> [ %19, %55 ], [ %148, %164 ]
  %134 = phi <4 x float> [ %19, %55 ], [ %147, %164 ]
  %135 = phi <4 x float> [ %19, %55 ], [ %145, %164 ]
  %136 = phi <4 x float> [ zeroinitializer, %55 ], [ %143, %164 ]
  %137 = phi <4 x float> [ zeroinitializer, %55 ], [ %140, %164 ]
  call void @generateRand_Vector(<4 x i32> %128, <4 x float>* nonnull %7, <4 x float>* nonnull %8, <4 x i32>* nonnull %9) #13
  %138 = load <4 x float>, <4 x float>* %7, align 16, !tbaa !3
  %139 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %15, <4 x float> %138, <4 x float> %13)
  %140 = fadd <4 x float> %137, %139
  %141 = load <4 x float>, <4 x float>* %8, align 16, !tbaa !3
  %142 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %15, <4 x float> %141, <4 x float> %13)
  %143 = fadd <4 x float> %136, %142
  %144 = tail call <4 x float> @_Z3expDv4_f(<4 x float> %139) #10
  %145 = fmul <4 x float> %135, %144
  %146 = tail call <4 x float> @_Z3expDv4_f(<4 x float> %142) #10
  %147 = fmul <4 x float> %134, %146
  %148 = fadd <4 x float> %133, %145
  %149 = fadd <4 x float> %132, %147
  %150 = sitofp i32 %129 to float
  %151 = insertelement <4 x float> undef, float %150, i32 0
  %152 = shufflevector <4 x float> %151, <4 x float> undef, <4 x i32> zeroinitializer
  %153 = fmul <4 x float> %56, %152
  %154 = fsub <4 x float> %140, %153
  %155 = fmul <4 x float> %145, %154
  %156 = fdiv <4 x float> %155, %21, !fpmath !11
  %157 = fadd <4 x float> %131, %156
  %158 = fsub <4 x float> %143, %153
  %159 = fmul <4 x float> %147, %158
  %160 = fdiv <4 x float> %159, %21, !fpmath !11
  %161 = fadd <4 x float> %130, %160
  %162 = add nuw nsw i32 %129, 1
  %163 = icmp eq i32 %162, %1
  br i1 %163, label %57, label %164

164:                                              ; preds = %127
  %165 = load <4 x i32>, <4 x i32>* %9, align 16, !tbaa !3
  br label %127

166:                                              ; preds = %180, %57
  %167 = or i64 %26, %24
  %168 = trunc i64 %167 to i32
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %183, label %191

170:                                              ; preds = %57, %180
  %171 = phi i32 [ %181, %180 ], [ %125, %57 ]
  %172 = icmp ult i32 %46, %171
  br i1 %172, label %173, label %180

173:                                              ; preds = %170
  %174 = add i32 %171, %46
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds <8 x float>, <8 x float>* %5, i64 %175
  %177 = load <8 x float>, <8 x float>* %176, align 32, !tbaa !3
  %178 = load <8 x float>, <8 x float>* %123, align 32, !tbaa !3
  %179 = fadd <8 x float> %177, %178
  store <8 x float> %179, <8 x float>* %123, align 32, !tbaa !3
  br label %180

180:                                              ; preds = %173, %170
  tail call void @_Z7barrierj(i32 1) #12
  %181 = lshr i32 %171, 1
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %166, label %170

183:                                              ; preds = %166
  %184 = load <8 x float>, <8 x float>* %5, align 32
  %185 = shufflevector <8 x float> %184, <8 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %186 = sext i32 %44 to i64
  %187 = getelementptr inbounds <4 x float>, <4 x float>* %3, i64 %186
  store <4 x float> %185, <4 x float>* %187, align 16, !tbaa !3
  %188 = load <8 x float>, <8 x float>* %5, align 32
  %189 = shufflevector <8 x float> %188, <8 x float> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %190 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %186
  store <4 x float> %189, <4 x float>* %190, align 16, !tbaa !3
  br label %191

191:                                              ; preds = %183, %166
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %49) #11
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %48) #11
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %47) #11
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #5

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z3expDv4_f(<4 x float>) local_unnamed_addr #3

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #6

; Function Attrs: convergent nounwind uwtable
define dso_local void @generateRand_Scalar(i32* nocapture %0, i32* nocapture %1, i32 %2, float* nocapture %3, float* nocapture %4, i32* nocapture %5, i32 %6) local_unnamed_addr #7 {
  %8 = lshr i32 %2, 30
  %9 = xor i32 %8, %2
  %10 = mul i32 %9, 1812433253
  %11 = add i32 %10, 1
  %12 = lshr i32 %11, 30
  %13 = xor i32 %12, %11
  %14 = mul i32 %13, 1812433253
  %15 = add i32 %14, 2
  %16 = lshr i32 %15, 30
  %17 = xor i32 %16, %15
  %18 = mul i32 %17, 1812433253
  %19 = add i32 %18, 3
  %20 = lshr i32 %19, 30
  %21 = xor i32 %20, %19
  %22 = mul i32 %21, 1812433253
  %23 = add i32 %22, 4
  %24 = zext i32 %6 to i64
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  %26 = getelementptr inbounds i32, i32* %1, i64 %24
  %27 = and i32 %6, 3
  %28 = icmp eq i32 %27, 0
  %29 = add i32 %6, -1
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %1, i64 %30
  %32 = add i32 %6, 1
  %33 = and i32 %32, 3
  %34 = icmp eq i32 %33, 0
  %35 = zext i32 %32 to i64
  %36 = getelementptr inbounds i32, i32* %0, i64 %35
  %37 = zext i32 %27 to i64
  %38 = getelementptr inbounds [4 x i32], [4 x i32]* @mask, i64 0, i64 %37
  tail call void @_Z7barrierj(i32 1) #12
  store i32 %19, i32* %25, align 4, !tbaa !12
  store i32 %2, i32* %26, align 4, !tbaa !12
  tail call void @_Z7barrierj(i32 1) #12
  %39 = load i32, i32* %26, align 4, !tbaa !12
  %40 = shl i32 %39, 24
  br i1 %28, label %45, label %41

41:                                               ; preds = %7
  %42 = load i32, i32* %31, align 4, !tbaa !12
  %43 = lshr i32 %42, 8
  %44 = or i32 %43, %40
  br label %45

45:                                               ; preds = %7, %41
  %46 = phi i32 [ %44, %41 ], [ %40, %7 ]
  %47 = load i32, i32* %25, align 4, !tbaa !12
  %48 = lshr i32 %47, 24
  br i1 %34, label %53, label %49

49:                                               ; preds = %45
  %50 = load i32, i32* %36, align 4, !tbaa !12
  %51 = shl i32 %50, 8
  %52 = or i32 %51, %48
  br label %53

53:                                               ; preds = %49, %45
  %54 = phi i32 [ %52, %49 ], [ %48, %45 ]
  %55 = lshr i32 %15, 13
  %56 = load i32, i32* %38, align 4, !tbaa !12
  %57 = and i32 %56, %55
  %58 = shl i32 %23, 15
  %59 = xor i32 %39, %58
  %60 = xor i32 %59, %46
  %61 = xor i32 %60, %54
  %62 = xor i32 %61, %57
  tail call void @_Z7barrierj(i32 1) #12
  store i32 %23, i32* %25, align 4, !tbaa !12
  store i32 %11, i32* %26, align 4, !tbaa !12
  tail call void @_Z7barrierj(i32 1) #12
  %63 = load i32, i32* %26, align 4, !tbaa !12
  %64 = shl i32 %63, 24
  br i1 %28, label %69, label %65

65:                                               ; preds = %53
  %66 = load i32, i32* %31, align 4, !tbaa !12
  %67 = lshr i32 %66, 8
  %68 = or i32 %67, %64
  br label %69

69:                                               ; preds = %65, %53
  %70 = phi i32 [ %68, %65 ], [ %64, %53 ]
  %71 = load i32, i32* %25, align 4, !tbaa !12
  %72 = lshr i32 %71, 24
  br i1 %34, label %77, label %73

73:                                               ; preds = %69
  %74 = load i32, i32* %36, align 4, !tbaa !12
  %75 = shl i32 %74, 8
  %76 = or i32 %75, %72
  br label %77

77:                                               ; preds = %69, %73
  %78 = phi i32 [ %76, %73 ], [ %72, %69 ]
  %79 = lshr i32 %19, 13
  %80 = and i32 %56, %79
  %81 = shl i32 %62, 15
  %82 = xor i32 %63, %81
  %83 = xor i32 %82, %70
  %84 = xor i32 %83, %78
  %85 = xor i32 %84, %80
  tail call void @_Z7barrierj(i32 1) #12
  store i32 %62, i32* %25, align 4, !tbaa !12
  store i32 %15, i32* %26, align 4, !tbaa !12
  tail call void @_Z7barrierj(i32 1) #12
  %86 = load i32, i32* %26, align 4, !tbaa !12
  %87 = shl i32 %86, 24
  br i1 %28, label %92, label %88

88:                                               ; preds = %77
  %89 = load i32, i32* %31, align 4, !tbaa !12
  %90 = lshr i32 %89, 8
  %91 = or i32 %90, %87
  br label %92

92:                                               ; preds = %88, %77
  %93 = phi i32 [ %91, %88 ], [ %87, %77 ]
  %94 = load i32, i32* %25, align 4, !tbaa !12
  %95 = lshr i32 %94, 24
  br i1 %34, label %100, label %96

96:                                               ; preds = %92
  %97 = load i32, i32* %36, align 4, !tbaa !12
  %98 = shl i32 %97, 8
  %99 = or i32 %98, %95
  br label %100

100:                                              ; preds = %96, %92
  %101 = phi i32 [ %99, %96 ], [ %95, %92 ]
  %102 = lshr i32 %23, 13
  %103 = and i32 %56, %102
  %104 = shl i32 %85, 15
  %105 = xor i32 %86, %104
  %106 = xor i32 %105, %93
  %107 = xor i32 %106, %101
  %108 = xor i32 %107, %103
  tail call void @_Z7barrierj(i32 1) #12
  store i32 %85, i32* %25, align 4, !tbaa !12
  store i32 %19, i32* %26, align 4, !tbaa !12
  tail call void @_Z7barrierj(i32 1) #12
  %109 = uitofp i32 %62 to float
  %110 = fmul float %109, 0x3DF0000000000000
  %111 = tail call float @_Z3logf(float %110) #10
  %112 = fmul float %111, -2.000000e+00
  %113 = tail call float @_Z4sqrtf(float %112) #10
  %114 = uitofp i32 %85 to float
  %115 = fmul float %114, 0x401921FB60000000
  %116 = fmul float %115, 0x3DF0000000000000
  %117 = tail call float @_Z3cosf(float %116) #10
  %118 = fmul float %113, %117
  store float %118, float* %3, align 4, !tbaa !14
  %119 = tail call float @_Z3sinf(float %116) #10
  %120 = fmul float %113, %119
  store float %120, float* %4, align 4, !tbaa !14
  store i32 %108, i32* %5, align 4, !tbaa !12
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4sqrtf(float) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3logf(float) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3cosf(float) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3sinf(float) local_unnamed_addr #3

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @calOutputs_Scalar(float %0, float %1, float %2, float %3, float %4, float* nocapture %5, float* nocapture %6, float* nocapture %7, float* nocapture %8) local_unnamed_addr #8 {
  store float 0.000000e+00, float* %7, align 4, !tbaa !14
  store float 0.000000e+00, float* %8, align 4, !tbaa !14
  store float 0.000000e+00, float* %5, align 4, !tbaa !14
  store float 0.000000e+00, float* %6, align 4, !tbaa !14
  %10 = fsub float %3, %0
  %11 = fsub float %4, %0
  %12 = fcmp ogt float %10, 0.000000e+00
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  store float %1, float* %5, align 4, !tbaa !14
  store float %10, float* %7, align 4, !tbaa !14
  br label %14

14:                                               ; preds = %13, %9
  %15 = fcmp ogt float %11, 0.000000e+00
  br i1 %15, label %16, label %17

16:                                               ; preds = %14
  store float %2, float* %6, align 4, !tbaa !14
  store float %11, float* %8, align 4, !tbaa !14
  br label %17

17:                                               ; preds = %16, %14
  ret void
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @calPriceVega_Scalar(%struct._MonteCalroAttribScalar* nocapture readonly byval(%struct._MonteCalroAttribScalar) align 4 %0, i32 %1, i32* nocapture readonly %2, float* nocapture %3, float* nocapture %4, <2 x float>* nocapture %5, i32* nocapture %6, i32* nocapture %7) local_unnamed_addr #9 !kernel_arg_addr_space !16 !kernel_arg_access_qual !17 !kernel_arg_type !18 !kernel_arg_base_type !19 !kernel_arg_type_qual !20 {
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca i32, align 4
  %12 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 0
  %13 = load float, float* %12, align 4, !tbaa !21
  %14 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 1
  %15 = load float, float* %14, align 4, !tbaa !23
  %16 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 2
  %17 = load float, float* %16, align 4, !tbaa !24
  %18 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 3
  %19 = load float, float* %18, align 4, !tbaa !25
  %20 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 4
  %21 = load float, float* %20, align 4, !tbaa !26
  %22 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 5
  %23 = load float, float* %22, align 4, !tbaa !27
  %24 = getelementptr inbounds %struct._MonteCalroAttribScalar, %struct._MonteCalroAttribScalar* %0, i64 0, i32 6
  %25 = load float, float* %24, align 4, !tbaa !28
  %26 = tail call i64 @_Z12get_local_idj(i32 0) #10
  %27 = trunc i64 %26 to i32
  %28 = tail call i64 @_Z12get_local_idj(i32 1) #10
  %29 = trunc i64 %28 to i32
  %30 = tail call i64 @_Z12get_group_idj(i32 0) #10
  %31 = trunc i64 %30 to i32
  %32 = tail call i64 @_Z12get_group_idj(i32 1) #10
  %33 = trunc i64 %32 to i32
  %34 = tail call i64 @_Z14get_local_sizej(i32 0) #10
  %35 = trunc i64 %34 to i32
  %36 = tail call i64 @_Z14get_local_sizej(i32 1) #10
  %37 = trunc i64 %36 to i32
  %38 = tail call i64 @_Z15get_global_sizej(i32 0) #10
  %39 = trunc i64 %38 to i32
  %40 = tail call i64 @_Z13get_global_idj(i32 0) #10
  %41 = tail call i64 @_Z13get_global_idj(i32 1) #10
  %42 = mul i64 %41, %38
  %43 = add i64 %42, %40
  %44 = mul nsw i32 %39, %33
  %45 = sdiv i32 %44, %35
  %46 = add nsw i32 %45, %31
  %47 = mul nsw i32 %35, %29
  %48 = add nsw i32 %47, %27
  %49 = bitcast float* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %49) #11
  store float 0.000000e+00, float* %9, align 4, !tbaa !14
  %50 = bitcast float* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %50) #11
  store float 0.000000e+00, float* %10, align 4, !tbaa !14
  %51 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %51) #11
  %52 = shl i64 %43, 32
  %53 = ashr exact i64 %52, 32
  %54 = getelementptr inbounds i32, i32* %2, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !12
  store i32 %55, i32* %11, align 4, !tbaa !12
  %56 = icmp sgt i32 %1, 1
  br i1 %56, label %57, label %59

57:                                               ; preds = %8
  %58 = fmul float %19, %25
  br label %86

59:                                               ; preds = %86, %8
  %60 = phi float [ %21, %8 ], [ %107, %86 ]
  %61 = phi float [ %21, %8 ], [ %108, %86 ]
  %62 = phi float [ 0.000000e+00, %8 ], [ %114, %86 ]
  %63 = phi float [ 0.000000e+00, %8 ], [ %118, %86 ]
  %64 = sitofp i32 %1 to float
  %65 = fdiv float %60, %64, !fpmath !11
  %66 = fdiv float %61, %64, !fpmath !11
  %67 = fdiv float %62, %64, !fpmath !11
  %68 = fdiv float %63, %64, !fpmath !11
  %69 = fsub float %65, %13
  %70 = fsub float %66, %13
  %71 = fcmp ogt float %69, 0.000000e+00
  %72 = select i1 %71, float %69, float 0.000000e+00
  %73 = select i1 %71, float %67, float 0.000000e+00
  %74 = fcmp ogt float %70, 0.000000e+00
  %75 = select i1 %74, float %70, float 0.000000e+00
  %76 = select i1 %74, float %68, float 0.000000e+00
  %77 = fadd float %72, %75
  %78 = insertelement <2 x float> undef, float %77, i32 0
  %79 = fadd float %73, %76
  %80 = insertelement <2 x float> %78, float %79, i32 1
  %81 = sext i32 %48 to i64
  %82 = getelementptr inbounds <2 x float>, <2 x float>* %5, i64 %81
  store <2 x float> %80, <2 x float>* %82, align 8, !tbaa !3
  tail call void @_Z7barrierj(i32 1) #12
  %83 = mul nsw i32 %37, %35
  %84 = ashr i32 %83, 1
  %85 = icmp ugt i32 %84, 3
  br i1 %85, label %125, label %123

86:                                               ; preds = %121, %57
  %87 = phi i32 [ %55, %57 ], [ %122, %121 ]
  %88 = phi i32 [ 1, %57 ], [ %119, %121 ]
  %89 = phi float [ 0.000000e+00, %57 ], [ %118, %121 ]
  %90 = phi float [ 0.000000e+00, %57 ], [ %114, %121 ]
  %91 = phi float [ %21, %57 ], [ %108, %121 ]
  %92 = phi float [ %21, %57 ], [ %107, %121 ]
  %93 = phi float [ %21, %57 ], [ %106, %121 ]
  %94 = phi float [ %21, %57 ], [ %104, %121 ]
  %95 = phi float [ 0.000000e+00, %57 ], [ %102, %121 ]
  %96 = phi float [ 0.000000e+00, %57 ], [ %99, %121 ]
  call void @generateRand_Scalar(i32* %6, i32* %7, i32 %87, float* nonnull %9, float* nonnull %10, i32* nonnull %11, i32 %48) #13
  %97 = load float, float* %9, align 4, !tbaa !14
  %98 = tail call float @llvm.fmuladd.f32(float %17, float %97, float %15)
  %99 = fadd float %96, %98
  %100 = load float, float* %10, align 4, !tbaa !14
  %101 = tail call float @llvm.fmuladd.f32(float %17, float %100, float %15)
  %102 = fadd float %95, %101
  %103 = tail call float @_Z3expf(float %98) #10
  %104 = fmul float %94, %103
  %105 = tail call float @_Z3expf(float %101) #10
  %106 = fmul float %93, %105
  %107 = fadd float %92, %104
  %108 = fadd float %91, %106
  %109 = sitofp i32 %88 to float
  %110 = fmul float %58, %109
  %111 = fsub float %99, %110
  %112 = fmul float %104, %111
  %113 = fdiv float %112, %23, !fpmath !11
  %114 = fadd float %90, %113
  %115 = fsub float %102, %110
  %116 = fmul float %106, %115
  %117 = fdiv float %116, %23, !fpmath !11
  %118 = fadd float %89, %117
  %119 = add nuw nsw i32 %88, 1
  %120 = icmp eq i32 %119, %1
  br i1 %120, label %59, label %121

121:                                              ; preds = %86
  %122 = load i32, i32* %11, align 4, !tbaa !12
  br label %86

123:                                              ; preds = %135, %59
  %124 = icmp slt i32 %48, 4
  br i1 %124, label %138, label %148

125:                                              ; preds = %59, %135
  %126 = phi i32 [ %136, %135 ], [ %84, %59 ]
  %127 = icmp ult i32 %48, %126
  br i1 %127, label %128, label %135

128:                                              ; preds = %125
  %129 = add i32 %126, %48
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds <2 x float>, <2 x float>* %5, i64 %130
  %132 = load <2 x float>, <2 x float>* %131, align 8, !tbaa !3
  %133 = load <2 x float>, <2 x float>* %82, align 8, !tbaa !3
  %134 = fadd <2 x float> %132, %133
  store <2 x float> %134, <2 x float>* %82, align 8, !tbaa !3
  br label %135

135:                                              ; preds = %128, %125
  tail call void @_Z7barrierj(i32 1) #12
  %136 = lshr i32 %126, 1
  %137 = icmp ugt i32 %126, 7
  br i1 %137, label %125, label %123

138:                                              ; preds = %123
  %139 = load <2 x float>, <2 x float>* %82, align 8
  %140 = extractelement <2 x float> %139, i64 0
  %141 = shl i32 %46, 2
  %142 = add nsw i32 %141, %48
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float* %3, i64 %143
  store float %140, float* %144, align 4, !tbaa !14
  %145 = load <2 x float>, <2 x float>* %82, align 8
  %146 = extractelement <2 x float> %145, i64 1
  %147 = getelementptr inbounds float, float* %4, i64 %143
  store float %146, float* %147, align 4, !tbaa !14
  br label %148

148:                                              ; preds = %138, %123
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %51) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %50) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %49) #11
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3expf(float) local_unnamed_addr #3

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { convergent nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { convergent nounwind readnone }
attributes #11 = { nounwind }
attributes #12 = { convergent nounwind }
attributes #13 = { convergent }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i32 0, i32 0, i32 1, i32 1, i32 1, i32 3}
!7 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!8 = !{!"MonteCarloAttribVector", !"int", !"uint4*", !"float4*", !"float4*", !"float8*"}
!9 = !{!"struct _MonteCalroAttribVector", !"int", !"uint __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(8)))*"}
!10 = !{!"", !"", !"", !"", !"", !""}
!11 = !{float 2.500000e+00}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !4, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !4, i64 0}
!16 = !{i32 0, i32 0, i32 1, i32 1, i32 1, i32 3, i32 3, i32 3}
!17 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!18 = !{!"MonteCarloAttribScalar", !"int", !"uint*", !"float*", !"float*", !"float2*", !"uint*", !"uint*"}
!19 = !{!"struct _MonteCalroAttribScalar", !"int", !"uint*", !"float*", !"float*", !"float __attribute__((ext_vector_type(2)))*", !"uint*", !"uint*"}
!20 = !{!"", !"", !"", !"", !"", !"", !"", !""}
!21 = !{!22, !15, i64 0}
!22 = !{!"_MonteCalroAttribScalar", !15, i64 0, !15, i64 4, !15, i64 8, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24}
!23 = !{!22, !15, i64 4}
!24 = !{!22, !15, i64 8}
!25 = !{!22, !15, i64 12}
!26 = !{!22, !15, i64 16}
!27 = !{!22, !15, i64 20}
!28 = !{!22, !15, i64 24}
