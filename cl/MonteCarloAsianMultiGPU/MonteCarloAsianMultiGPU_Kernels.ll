; ModuleID = '../AMDAPP_samples/cl/MonteCarloAsianMultiGPU/MonteCarloAsianMultiGPU_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/MonteCarloAsianMultiGPU/MonteCarloAsianMultiGPU_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._MonteCalroAttrib = type { <4 x float>, <4 x float>, <4 x float>, <4 x float>, <4 x float>, <4 x float>, <4 x float> }

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @lshift128(<4 x i32> %0, i32 %1, <4 x i32>* nocapture %2) local_unnamed_addr #0 {
  %4 = sub i32 0, %1
  %5 = extractelement <4 x i32> %0, i64 0
  %6 = and i32 %1, 31
  %7 = shl i32 %5, %6
  %8 = insertelement <4 x i32> undef, i32 %7, i64 0
  %9 = extractelement <4 x i32> %0, i64 1
  %10 = shl i32 %9, %6
  %11 = and i32 %4, 31
  %12 = lshr i32 %5, %11
  %13 = or i32 %10, %12
  %14 = insertelement <4 x i32> %8, i32 %13, i64 1
  %15 = extractelement <4 x i32> %0, i64 2
  %16 = shl i32 %15, %6
  %17 = lshr i32 %9, %11
  %18 = or i32 %16, %17
  %19 = insertelement <4 x i32> %14, i32 %18, i64 2
  %20 = extractelement <4 x i32> %0, i64 3
  %21 = shl i32 %20, %6
  %22 = lshr i32 %15, %11
  %23 = or i32 %21, %22
  %24 = insertelement <4 x i32> %19, i32 %23, i64 3
  store <4 x i32> %24, <4 x i32>* %2, align 16, !tbaa !3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @rshift128(<4 x i32> %0, i32 %1, <4 x i32>* nocapture %2) local_unnamed_addr #0 {
  %4 = sub i32 0, %1
  %5 = extractelement <4 x i32> %0, i64 3
  %6 = and i32 %1, 31
  %7 = lshr i32 %5, %6
  %8 = insertelement <4 x i32> undef, i32 %7, i64 3
  %9 = extractelement <4 x i32> %0, i64 2
  %10 = lshr i32 %9, %6
  %11 = and i32 %4, 31
  %12 = shl i32 %5, %11
  %13 = or i32 %10, %12
  %14 = insertelement <4 x i32> %8, i32 %13, i64 2
  %15 = extractelement <4 x i32> %0, i64 1
  %16 = lshr i32 %15, %6
  %17 = shl i32 %9, %11
  %18 = or i32 %16, %17
  %19 = insertelement <4 x i32> %14, i32 %18, i64 1
  %20 = extractelement <4 x i32> %0, i64 0
  %21 = lshr i32 %20, %6
  %22 = shl i32 %15, %11
  %23 = or i32 %21, %22
  %24 = insertelement <4 x i32> %19, i32 %23, i64 0
  store <4 x i32> %24, <4 x i32>* %2, align 16, !tbaa !3
  ret void
}

; Function Attrs: convergent nounwind uwtable writeonly
define dso_local void @generateRand(<4 x i32> %0, <4 x float>* nocapture %1, <4 x float>* nocapture %2, <4 x i32>* nocapture %3) local_unnamed_addr #2 {
  %5 = alloca [8 x <4 x i32>], align 16
  %6 = bitcast [8 x <4 x i32>]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %6) #6
  %7 = lshr <4 x i32> %0, <i32 30, i32 30, i32 30, i32 30>
  %8 = xor <4 x i32> %7, %0
  %9 = mul <4 x i32> %8, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %10 = add <4 x i32> %9, <i32 1, i32 1, i32 1, i32 1>
  %11 = lshr <4 x i32> %10, <i32 30, i32 30, i32 30, i32 30>
  %12 = xor <4 x i32> %11, %10
  %13 = mul <4 x i32> %12, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %14 = add <4 x i32> %13, <i32 2, i32 2, i32 2, i32 2>
  %15 = lshr <4 x i32> %14, <i32 30, i32 30, i32 30, i32 30>
  %16 = xor <4 x i32> %15, %14
  %17 = mul <4 x i32> %16, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %18 = add <4 x i32> %17, <i32 3, i32 3, i32 3, i32 3>
  %19 = lshr <4 x i32> %18, <i32 30, i32 30, i32 30, i32 30>
  %20 = xor <4 x i32> %19, %18
  %21 = mul <4 x i32> %20, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %22 = add <4 x i32> %21, <i32 4, i32 4, i32 4, i32 4>
  %23 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 2
  %24 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 1
  %25 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 0
  br label %26

26:                                               ; preds = %40, %4
  %27 = phi i64 [ 0, %4 ], [ %114, %40 ]
  %28 = phi <4 x i32> [ zeroinitializer, %4 ], [ %44, %40 ]
  %29 = phi <4 x i32> [ zeroinitializer, %4 ], [ %43, %40 ]
  %30 = phi <4 x i32> [ zeroinitializer, %4 ], [ %42, %40 ]
  %31 = phi <4 x i32> [ zeroinitializer, %4 ], [ %41, %40 ]
  %32 = trunc i64 %27 to i32
  switch i32 %32, label %40 [
    i32 0, label %33
    i32 1, label %34
    i32 2, label %36
    i32 3, label %38
  ]

33:                                               ; preds = %26
  br label %40

34:                                               ; preds = %26
  %35 = load <4 x i32>, <4 x i32>* %25, align 16, !tbaa !3
  br label %40

36:                                               ; preds = %26
  %37 = load <4 x i32>, <4 x i32>* %24, align 16, !tbaa !3
  br label %40

38:                                               ; preds = %26
  %39 = load <4 x i32>, <4 x i32>* %23, align 16, !tbaa !3
  br label %40

40:                                               ; preds = %26, %38, %36, %34, %33
  %41 = phi <4 x i32> [ %31, %26 ], [ %0, %38 ], [ %22, %36 ], [ %18, %34 ], [ %14, %33 ]
  %42 = phi <4 x i32> [ %30, %26 ], [ %18, %38 ], [ %14, %36 ], [ %10, %34 ], [ %0, %33 ]
  %43 = phi <4 x i32> [ %29, %26 ], [ %39, %38 ], [ %37, %36 ], [ %35, %34 ], [ %22, %33 ]
  %44 = phi <4 x i32> [ %28, %26 ], [ %29, %38 ], [ %29, %36 ], [ %29, %34 ], [ %18, %33 ]
  %45 = extractelement <4 x i32> %42, i64 0
  %46 = shl i32 %45, 24
  %47 = extractelement <4 x i32> %42, i64 1
  %48 = shl i32 %47, 24
  %49 = lshr i32 %45, 8
  %50 = or i32 %48, %49
  %51 = extractelement <4 x i32> %42, i64 2
  %52 = shl i32 %51, 24
  %53 = lshr i32 %47, 8
  %54 = or i32 %52, %53
  %55 = extractelement <4 x i32> %42, i64 3
  %56 = shl i32 %55, 24
  %57 = lshr i32 %51, 8
  %58 = or i32 %56, %57
  %59 = extractelement <4 x i32> %44, i64 3
  %60 = lshr i32 %59, 24
  %61 = extractelement <4 x i32> %44, i64 2
  %62 = lshr i32 %61, 24
  %63 = shl i32 %59, 8
  %64 = or i32 %62, %63
  %65 = extractelement <4 x i32> %44, i64 1
  %66 = lshr i32 %65, 24
  %67 = shl i32 %61, 8
  %68 = or i32 %66, %67
  %69 = extractelement <4 x i32> %44, i64 0
  %70 = lshr i32 %69, 24
  %71 = shl i32 %65, 8
  %72 = or i32 %70, %71
  %73 = xor i32 %46, %45
  %74 = extractelement <4 x i32> %41, i64 0
  %75 = lshr i32 %74, 13
  %76 = and i32 %75, 473087
  %77 = xor i32 %73, %76
  %78 = extractelement <4 x i32> %43, i64 0
  %79 = shl i32 %78, 15
  %80 = xor i32 %77, %79
  %81 = xor i32 %80, %72
  %82 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 %27
  %83 = insertelement <4 x i32> undef, i32 %81, i64 0
  %84 = extractelement <4 x i32> %41, i64 1
  %85 = lshr i32 %84, 13
  %86 = and i32 %85, 475005
  %87 = extractelement <4 x i32> %43, i64 1
  %88 = shl i32 %87, 15
  %89 = xor i32 %86, %47
  %90 = xor i32 %89, %50
  %91 = xor i32 %90, %88
  %92 = xor i32 %91, %68
  %93 = insertelement <4 x i32> %83, i32 %92, i64 1
  %94 = extractelement <4 x i32> %41, i64 2
  %95 = lshr i32 %94, 13
  %96 = and i32 %95, 490365
  %97 = extractelement <4 x i32> %43, i64 2
  %98 = shl i32 %97, 15
  %99 = xor i32 %96, %51
  %100 = xor i32 %99, %54
  %101 = xor i32 %100, %98
  %102 = xor i32 %101, %64
  %103 = insertelement <4 x i32> %93, i32 %102, i64 2
  %104 = extractelement <4 x i32> %41, i64 3
  %105 = lshr i32 %104, 13
  %106 = and i32 %105, 523055
  %107 = extractelement <4 x i32> %43, i64 3
  %108 = shl i32 %107, 15
  %109 = xor i32 %106, %55
  %110 = xor i32 %109, %58
  %111 = xor i32 %110, %108
  %112 = xor i32 %111, %60
  %113 = insertelement <4 x i32> %103, i32 %112, i64 3
  store <4 x i32> %113, <4 x i32>* %82, align 16
  %114 = add nuw nsw i64 %27, 1
  %115 = icmp eq i64 %114, 4
  br i1 %115, label %116, label %26

116:                                              ; preds = %40
  %117 = load <4 x i32>, <4 x i32>* %25, align 16, !tbaa !3
  %118 = tail call <4 x float> @_Z14convert_float4Dv4_j(<4 x i32> %117) #7
  %119 = fmul <4 x float> %118, <float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000>
  %120 = load <4 x i32>, <4 x i32>* %24, align 16, !tbaa !3
  %121 = tail call <4 x float> @_Z14convert_float4Dv4_j(<4 x i32> %120) #7
  %122 = fmul <4 x float> %121, <float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000, float 0x3DF0000000000000>
  %123 = tail call <4 x float> @_Z3logDv4_f(<4 x float> %119) #7
  %124 = fmul <4 x float> %123, <float -2.000000e+00, float -2.000000e+00, float -2.000000e+00, float -2.000000e+00>
  %125 = tail call <4 x float> @_Z4sqrtDv4_f(<4 x float> %124) #7
  %126 = fmul <4 x float> %122, <float 0x401921FB60000000, float 0x401921FB60000000, float 0x401921FB60000000, float 0x401921FB60000000>
  %127 = tail call <4 x float> @_Z3cosDv4_f(<4 x float> %126) #7
  %128 = fmul <4 x float> %125, %127
  store <4 x float> %128, <4 x float>* %1, align 16, !tbaa !3
  %129 = tail call <4 x float> @_Z3sinDv4_f(<4 x float> %126) #7
  %130 = fmul <4 x float> %125, %129
  store <4 x float> %130, <4 x float>* %2, align 16, !tbaa !3
  %131 = load <4 x i32>, <4 x i32>* %23, align 16, !tbaa !3
  store <4 x i32> %131, <4 x i32>* %3, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %6) #6
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
define dso_local void @calOutputs(<4 x float> %0, <4 x float> %1, <4 x float> %2, <4 x float> %3, <4 x float> %4, <4 x float>* nocapture %5, <4 x float>* nocapture %6, <4 x float>* nocapture %7, <4 x float>* nocapture %8) local_unnamed_addr #0 {
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
define dso_local spir_kernel void @calPriceVega(%struct._MonteCalroAttrib* nocapture readonly byval(%struct._MonteCalroAttrib) align 16 %0, i32 %1, i32 %2, <4 x i32>* nocapture readonly %3, <4 x float>* nocapture %4, <4 x float>* nocapture %5) local_unnamed_addr #4 !kernel_arg_addr_space !6 !kernel_arg_access_qual !7 !kernel_arg_type !8 !kernel_arg_base_type !9 !kernel_arg_type_qual !10 {
  %7 = alloca <4 x float>, align 16
  %8 = alloca <4 x float>, align 16
  %9 = alloca <4 x i32>, align 16
  %10 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 0
  %11 = load <4 x float>, <4 x float>* %10, align 16, !tbaa !3
  %12 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 1
  %13 = load <4 x float>, <4 x float>* %12, align 16, !tbaa !3
  %14 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 2
  %15 = load <4 x float>, <4 x float>* %14, align 16, !tbaa !3
  %16 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 3
  %17 = load <4 x float>, <4 x float>* %16, align 16, !tbaa !3
  %18 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 4
  %19 = load <4 x float>, <4 x float>* %18, align 16, !tbaa !3
  %20 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 5
  %21 = load <4 x float>, <4 x float>* %20, align 16, !tbaa !3
  %22 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 6
  %23 = load <4 x float>, <4 x float>* %22, align 16, !tbaa !3
  %24 = tail call i64 @_Z13get_global_idj(i32 0) #7
  %25 = tail call i64 @_Z13get_global_idj(i32 1) #7
  %26 = bitcast <4 x float>* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %26) #6
  store <4 x float> zeroinitializer, <4 x float>* %7, align 16, !tbaa !3
  %27 = bitcast <4 x float>* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %27) #6
  store <4 x float> zeroinitializer, <4 x float>* %8, align 16, !tbaa !3
  %28 = bitcast <4 x i32>* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %28) #6
  %29 = sext i32 %2 to i64
  %30 = mul i64 %25, %29
  %31 = add i64 %30, %24
  %32 = getelementptr inbounds <4 x i32>, <4 x i32>* %3, i64 %31
  %33 = load <4 x i32>, <4 x i32>* %32, align 16, !tbaa !3
  store <4 x i32> %33, <4 x i32>* %9, align 16, !tbaa !3
  %34 = icmp sgt i32 %1, 1
  br i1 %34, label %35, label %37

35:                                               ; preds = %6
  %36 = fmul <4 x float> %17, %23
  br label %105

37:                                               ; preds = %105, %6
  %38 = phi <4 x float> [ %19, %6 ], [ %122, %105 ]
  %39 = phi <4 x float> [ %19, %6 ], [ %123, %105 ]
  %40 = phi <4 x float> [ zeroinitializer, %6 ], [ %132, %105 ]
  %41 = phi <4 x float> [ zeroinitializer, %6 ], [ %137, %105 ]
  %42 = sitofp i32 %1 to float
  %43 = insertelement <4 x float> undef, float %42, i32 0
  %44 = shufflevector <4 x float> %43, <4 x float> undef, <4 x i32> zeroinitializer
  %45 = fdiv <4 x float> %38, %44, !fpmath !11
  %46 = fdiv <4 x float> %39, %44, !fpmath !11
  %47 = fdiv <4 x float> %40, %44, !fpmath !11
  %48 = fdiv <4 x float> %41, %44, !fpmath !11
  %49 = fsub <4 x float> %45, %11
  %50 = fsub <4 x float> %46, %11
  %51 = extractelement <4 x float> %49, i64 0
  %52 = fcmp ogt float %51, 0.000000e+00
  %53 = shufflevector <4 x float> <float 0.000000e+00, float undef, float undef, float undef>, <4 x float> %49, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %54 = select i1 %52, <4 x float> %53, <4 x float> zeroinitializer
  %55 = select i1 %52, <4 x float> <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, <4 x float> zeroinitializer
  %56 = extractelement <4 x float> %49, i64 1
  %57 = fcmp ogt float %56, 0.000000e+00
  %58 = insertelement <4 x float> %55, float 1.000000e+00, i64 1
  %59 = shufflevector <4 x float> %54, <4 x float> %49, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %60 = select i1 %57, <4 x float> %59, <4 x float> %54
  %61 = select i1 %57, <4 x float> %58, <4 x float> %55
  %62 = extractelement <4 x float> %49, i64 2
  %63 = fcmp ogt float %62, 0.000000e+00
  %64 = insertelement <4 x float> %61, float 1.000000e+00, i64 2
  %65 = shufflevector <4 x float> %60, <4 x float> %49, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %66 = select i1 %63, <4 x float> %65, <4 x float> %60
  %67 = select i1 %63, <4 x float> %64, <4 x float> %61
  %68 = extractelement <4 x float> %49, i64 3
  %69 = fcmp ogt float %68, 0.000000e+00
  %70 = insertelement <4 x float> %67, float 1.000000e+00, i64 3
  %71 = shufflevector <4 x float> %66, <4 x float> %49, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %72 = select i1 %69, <4 x float> %71, <4 x float> %66
  %73 = select i1 %69, <4 x float> %70, <4 x float> %67
  %74 = extractelement <4 x float> %50, i64 0
  %75 = fcmp ogt float %74, 0.000000e+00
  %76 = shufflevector <4 x float> <float 0.000000e+00, float undef, float undef, float undef>, <4 x float> %50, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %77 = select i1 %75, <4 x float> %76, <4 x float> zeroinitializer
  %78 = select i1 %75, <4 x float> <float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, <4 x float> zeroinitializer
  %79 = extractelement <4 x float> %50, i64 1
  %80 = fcmp ogt float %79, 0.000000e+00
  %81 = insertelement <4 x float> %78, float 1.000000e+00, i64 1
  %82 = shufflevector <4 x float> %77, <4 x float> %50, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %83 = select i1 %80, <4 x float> %82, <4 x float> %77
  %84 = select i1 %80, <4 x float> %81, <4 x float> %78
  %85 = extractelement <4 x float> %50, i64 2
  %86 = fcmp ogt float %85, 0.000000e+00
  %87 = insertelement <4 x float> %84, float 1.000000e+00, i64 2
  %88 = shufflevector <4 x float> %83, <4 x float> %50, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %89 = select i1 %86, <4 x float> %88, <4 x float> %83
  %90 = select i1 %86, <4 x float> %87, <4 x float> %84
  %91 = extractelement <4 x float> %50, i64 3
  %92 = fcmp ogt float %91, 0.000000e+00
  %93 = insertelement <4 x float> %90, float 1.000000e+00, i64 3
  %94 = shufflevector <4 x float> %89, <4 x float> %50, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %95 = select i1 %92, <4 x float> %94, <4 x float> %89
  %96 = select i1 %92, <4 x float> %93, <4 x float> %90
  %97 = fmul <4 x float> %47, %73
  %98 = fmul <4 x float> %48, %96
  %99 = shl i64 %31, 1
  %100 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %99
  store <4 x float> %72, <4 x float>* %100, align 16, !tbaa !3
  %101 = or i64 %99, 1
  %102 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %101
  store <4 x float> %95, <4 x float>* %102, align 16, !tbaa !3
  %103 = getelementptr inbounds <4 x float>, <4 x float>* %5, i64 %99
  store <4 x float> %97, <4 x float>* %103, align 16, !tbaa !3
  %104 = getelementptr inbounds <4 x float>, <4 x float>* %5, i64 %101
  store <4 x float> %98, <4 x float>* %104, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %28) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %27) #6
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %26) #6
  ret void

105:                                              ; preds = %140, %35
  %106 = phi <4 x i32> [ %33, %35 ], [ %141, %140 ]
  %107 = phi i32 [ 1, %35 ], [ %138, %140 ]
  %108 = phi <4 x float> [ zeroinitializer, %35 ], [ %137, %140 ]
  %109 = phi <4 x float> [ zeroinitializer, %35 ], [ %132, %140 ]
  %110 = phi <4 x float> [ %19, %35 ], [ %123, %140 ]
  %111 = phi <4 x float> [ %19, %35 ], [ %122, %140 ]
  %112 = phi <4 x float> [ %19, %35 ], [ %121, %140 ]
  %113 = phi <4 x float> [ %19, %35 ], [ %117, %140 ]
  call void @generateRand(<4 x i32> %106, <4 x float>* nonnull %7, <4 x float>* nonnull %8, <4 x i32>* nonnull %9) #8
  %114 = load <4 x float>, <4 x float>* %7, align 16, !tbaa !3
  %115 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %15, <4 x float> %114, <4 x float> %13)
  %116 = tail call <4 x float> @_Z3expDv4_f(<4 x float> %115) #7
  %117 = fmul <4 x float> %113, %116
  %118 = load <4 x float>, <4 x float>* %8, align 16, !tbaa !3
  %119 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %15, <4 x float> %118, <4 x float> %13)
  %120 = tail call <4 x float> @_Z3expDv4_f(<4 x float> %119) #7
  %121 = fmul <4 x float> %112, %120
  %122 = fadd <4 x float> %111, %117
  %123 = fadd <4 x float> %110, %121
  %124 = sitofp i32 %107 to float
  %125 = insertelement <4 x float> undef, float %124, i32 0
  %126 = shufflevector <4 x float> %125, <4 x float> undef, <4 x i32> zeroinitializer
  %127 = fmul <4 x float> %36, %126
  %128 = fdiv <4 x float> %117, %19, !fpmath !11
  %129 = tail call <4 x float> @_Z3logDv4_f(<4 x float> %128) #7
  %130 = fsub <4 x float> %129, %127
  %131 = fdiv <4 x float> %130, %21, !fpmath !11
  %132 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %117, <4 x float> %131, <4 x float> %109)
  %133 = fdiv <4 x float> %121, %19, !fpmath !11
  %134 = tail call <4 x float> @_Z3logDv4_f(<4 x float> %133) #7
  %135 = fsub <4 x float> %134, %127
  %136 = fdiv <4 x float> %135, %21, !fpmath !11
  %137 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %121, <4 x float> %136, <4 x float> %108)
  %138 = add nuw nsw i32 %107, 1
  %139 = icmp eq i32 %138, %1
  br i1 %139, label %37, label %140

140:                                              ; preds = %105
  %141 = load <4 x i32>, <4 x i32>* %9, align 16, !tbaa !3
  br label %105
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z3expDv4_f(<4 x float>) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #5

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { convergent nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }
attributes #7 = { convergent nounwind readnone }
attributes #8 = { convergent }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i32 0, i32 0, i32 0, i32 1, i32 1, i32 1}
!7 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!8 = !{!"MonteCarloAttrib", !"int", !"int", !"uint4*", !"float4*", !"float4*"}
!9 = !{!"struct _MonteCalroAttrib", !"int", !"int", !"uint __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*"}
!10 = !{!"", !"", !"", !"", !"", !""}
!11 = !{float 2.500000e+00}
