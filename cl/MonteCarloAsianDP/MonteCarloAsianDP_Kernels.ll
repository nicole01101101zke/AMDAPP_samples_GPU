; ModuleID = '../AMDAPP_samples/cl/MonteCarloAsianDP/MonteCarloAsianDP_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/MonteCarloAsianDP/MonteCarloAsianDP_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._MonteCalroAttrib = type { <4 x double>, <4 x double>, <4 x double>, <4 x double>, <4 x double>, <4 x double>, <4 x double> }

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

; Function Attrs: convergent nounwind uwtable
define dso_local void @generateRand(<4 x i32> %0, <4 x double>* nocapture %1, <4 x double>* nocapture %2, <4 x i32>* nocapture %3) local_unnamed_addr #2 {
  %5 = alloca [8 x <4 x i32>], align 16
  %6 = alloca <4 x double>, align 32
  %7 = alloca <4 x double>, align 32
  %8 = alloca <4 x double>, align 32
  %9 = alloca <4 x double>, align 32
  %10 = bitcast [8 x <4 x i32>]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %10) #8
  %11 = lshr <4 x i32> %0, <i32 30, i32 30, i32 30, i32 30>
  %12 = xor <4 x i32> %11, %0
  %13 = mul <4 x i32> %12, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %14 = add <4 x i32> %13, <i32 1, i32 1, i32 1, i32 1>
  %15 = lshr <4 x i32> %14, <i32 30, i32 30, i32 30, i32 30>
  %16 = xor <4 x i32> %15, %14
  %17 = mul <4 x i32> %16, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %18 = add <4 x i32> %17, <i32 2, i32 2, i32 2, i32 2>
  %19 = lshr <4 x i32> %18, <i32 30, i32 30, i32 30, i32 30>
  %20 = xor <4 x i32> %19, %18
  %21 = mul <4 x i32> %20, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %22 = add <4 x i32> %21, <i32 3, i32 3, i32 3, i32 3>
  %23 = lshr <4 x i32> %22, <i32 30, i32 30, i32 30, i32 30>
  %24 = xor <4 x i32> %23, %22
  %25 = mul <4 x i32> %24, <i32 1812433253, i32 1812433253, i32 1812433253, i32 1812433253>
  %26 = add <4 x i32> %25, <i32 4, i32 4, i32 4, i32 4>
  %27 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 2
  %28 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 1
  %29 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 0
  br label %30

30:                                               ; preds = %44, %4
  %31 = phi i64 [ 0, %4 ], [ %118, %44 ]
  %32 = phi <4 x i32> [ zeroinitializer, %4 ], [ %48, %44 ]
  %33 = phi <4 x i32> [ zeroinitializer, %4 ], [ %47, %44 ]
  %34 = phi <4 x i32> [ zeroinitializer, %4 ], [ %46, %44 ]
  %35 = phi <4 x i32> [ zeroinitializer, %4 ], [ %45, %44 ]
  %36 = trunc i64 %31 to i32
  switch i32 %36, label %44 [
    i32 0, label %37
    i32 1, label %38
    i32 2, label %40
    i32 3, label %42
  ]

37:                                               ; preds = %30
  br label %44

38:                                               ; preds = %30
  %39 = load <4 x i32>, <4 x i32>* %29, align 16, !tbaa !3
  br label %44

40:                                               ; preds = %30
  %41 = load <4 x i32>, <4 x i32>* %28, align 16, !tbaa !3
  br label %44

42:                                               ; preds = %30
  %43 = load <4 x i32>, <4 x i32>* %27, align 16, !tbaa !3
  br label %44

44:                                               ; preds = %30, %42, %40, %38, %37
  %45 = phi <4 x i32> [ %35, %30 ], [ %0, %42 ], [ %26, %40 ], [ %22, %38 ], [ %18, %37 ]
  %46 = phi <4 x i32> [ %34, %30 ], [ %22, %42 ], [ %18, %40 ], [ %14, %38 ], [ %0, %37 ]
  %47 = phi <4 x i32> [ %33, %30 ], [ %43, %42 ], [ %41, %40 ], [ %39, %38 ], [ %26, %37 ]
  %48 = phi <4 x i32> [ %32, %30 ], [ %33, %42 ], [ %33, %40 ], [ %33, %38 ], [ %22, %37 ]
  %49 = extractelement <4 x i32> %46, i64 0
  %50 = shl i32 %49, 24
  %51 = extractelement <4 x i32> %46, i64 1
  %52 = shl i32 %51, 24
  %53 = lshr i32 %49, 8
  %54 = or i32 %52, %53
  %55 = extractelement <4 x i32> %46, i64 2
  %56 = shl i32 %55, 24
  %57 = lshr i32 %51, 8
  %58 = or i32 %56, %57
  %59 = extractelement <4 x i32> %46, i64 3
  %60 = shl i32 %59, 24
  %61 = lshr i32 %55, 8
  %62 = or i32 %60, %61
  %63 = extractelement <4 x i32> %48, i64 3
  %64 = lshr i32 %63, 24
  %65 = extractelement <4 x i32> %48, i64 2
  %66 = lshr i32 %65, 24
  %67 = shl i32 %63, 8
  %68 = or i32 %66, %67
  %69 = extractelement <4 x i32> %48, i64 1
  %70 = lshr i32 %69, 24
  %71 = shl i32 %65, 8
  %72 = or i32 %70, %71
  %73 = extractelement <4 x i32> %48, i64 0
  %74 = lshr i32 %73, 24
  %75 = shl i32 %69, 8
  %76 = or i32 %74, %75
  %77 = xor i32 %50, %49
  %78 = extractelement <4 x i32> %45, i64 0
  %79 = lshr i32 %78, 13
  %80 = and i32 %79, 473087
  %81 = xor i32 %77, %80
  %82 = extractelement <4 x i32> %47, i64 0
  %83 = shl i32 %82, 15
  %84 = xor i32 %81, %83
  %85 = xor i32 %84, %76
  %86 = getelementptr inbounds [8 x <4 x i32>], [8 x <4 x i32>]* %5, i64 0, i64 %31
  %87 = insertelement <4 x i32> undef, i32 %85, i64 0
  %88 = extractelement <4 x i32> %45, i64 1
  %89 = lshr i32 %88, 13
  %90 = and i32 %89, 475005
  %91 = extractelement <4 x i32> %47, i64 1
  %92 = shl i32 %91, 15
  %93 = xor i32 %90, %51
  %94 = xor i32 %93, %54
  %95 = xor i32 %94, %92
  %96 = xor i32 %95, %72
  %97 = insertelement <4 x i32> %87, i32 %96, i64 1
  %98 = extractelement <4 x i32> %45, i64 2
  %99 = lshr i32 %98, 13
  %100 = and i32 %99, 490365
  %101 = extractelement <4 x i32> %47, i64 2
  %102 = shl i32 %101, 15
  %103 = xor i32 %100, %55
  %104 = xor i32 %103, %58
  %105 = xor i32 %104, %102
  %106 = xor i32 %105, %68
  %107 = insertelement <4 x i32> %97, i32 %106, i64 2
  %108 = extractelement <4 x i32> %45, i64 3
  %109 = lshr i32 %108, 13
  %110 = and i32 %109, 523055
  %111 = extractelement <4 x i32> %47, i64 3
  %112 = shl i32 %111, 15
  %113 = xor i32 %110, %59
  %114 = xor i32 %113, %62
  %115 = xor i32 %114, %112
  %116 = xor i32 %115, %64
  %117 = insertelement <4 x i32> %107, i32 %116, i64 3
  store <4 x i32> %117, <4 x i32>* %86, align 16
  %118 = add nuw nsw i64 %31, 1
  %119 = icmp eq i64 %118, 4
  br i1 %119, label %120, label %30

120:                                              ; preds = %44
  %121 = load <4 x i32>, <4 x i32>* %29, align 16, !tbaa !3
  %122 = tail call <4 x double> @_Z15convert_double4Dv4_j(<4 x i32> %121) #9
  %123 = fmul <4 x double> %122, <double 0x3DF0000000000000, double 0x3DF0000000000000, double 0x3DF0000000000000, double 0x3DF0000000000000>
  %124 = load <4 x i32>, <4 x i32>* %28, align 16, !tbaa !3
  %125 = tail call <4 x double> @_Z15convert_double4Dv4_j(<4 x i32> %124) #9
  %126 = fmul <4 x double> %125, <double 0x3DF0000000000000, double 0x3DF0000000000000, double 0x3DF0000000000000, double 0x3DF0000000000000>
  store <4 x double> %123, <4 x double>* %6, align 32, !tbaa !3
  %127 = tail call <4 x double> @_Z3logDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %6) #10
  %128 = fmul <4 x double> %127, <double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00>
  store <4 x double> %128, <4 x double>* %7, align 32, !tbaa !3
  %129 = tail call <4 x double> @_Z4sqrtDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %7) #10
  %130 = fmul <4 x double> %126, <double 0x401921FB54442D11, double 0x401921FB54442D11, double 0x401921FB54442D11, double 0x401921FB54442D11>
  store <4 x double> %130, <4 x double>* %8, align 32, !tbaa !3
  %131 = tail call <4 x double> @_Z3cosDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %8) #10
  %132 = fmul <4 x double> %129, %131
  store <4 x double> %132, <4 x double>* %1, align 32, !tbaa !3
  store <4 x double> %130, <4 x double>* %9, align 32, !tbaa !3
  %133 = tail call <4 x double> @_Z3sinDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %9) #10
  %134 = fmul <4 x double> %129, %133
  store <4 x double> %134, <4 x double>* %2, align 32, !tbaa !3
  %135 = load <4 x i32>, <4 x i32>* %27, align 16, !tbaa !3
  store <4 x i32> %135, <4 x i32>* %3, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %10) #8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x double> @_Z15convert_double4Dv4_j(<4 x i32>) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z4sqrtDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z3logDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z3cosDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z3sinDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #4

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @calOutputs(<4 x double>* nocapture readonly byval(<4 x double>) align 32 %0, <4 x double>* nocapture readonly byval(<4 x double>) align 32 %1, <4 x double>* nocapture readonly byval(<4 x double>) align 32 %2, <4 x double>* nocapture readonly byval(<4 x double>) align 32 %3, <4 x double>* nocapture readonly byval(<4 x double>) align 32 %4, <4 x double>* nocapture %5, <4 x double>* nocapture %6, <4 x double>* nocapture %7, <4 x double>* nocapture %8) local_unnamed_addr #5 {
  %10 = load <4 x double>, <4 x double>* %0, align 32, !tbaa !3
  %11 = load <4 x double>, <4 x double>* %1, align 32, !tbaa !3
  %12 = load <4 x double>, <4 x double>* %2, align 32, !tbaa !3
  %13 = load <4 x double>, <4 x double>* %3, align 32, !tbaa !3
  %14 = load <4 x double>, <4 x double>* %4, align 32, !tbaa !3
  %15 = fsub <4 x double> %13, %10
  %16 = fsub <4 x double> %14, %10
  %17 = extractelement <4 x double> %15, i64 0
  %18 = fcmp ogt double %17, 0.000000e+00
  %19 = shufflevector <4 x double> <double 0.000000e+00, double undef, double undef, double undef>, <4 x double> %15, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %20 = select i1 %18, <4 x double> %19, <4 x double> zeroinitializer
  %21 = select i1 %18, <4 x double> <double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00>, <4 x double> zeroinitializer
  %22 = extractelement <4 x double> %15, i64 1
  %23 = fcmp ogt double %22, 0.000000e+00
  %24 = insertelement <4 x double> %21, double 1.000000e+00, i64 1
  %25 = shufflevector <4 x double> %20, <4 x double> %15, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %26 = select i1 %23, <4 x double> %25, <4 x double> %20
  %27 = select i1 %23, <4 x double> %24, <4 x double> %21
  %28 = extractelement <4 x double> %15, i64 2
  %29 = fcmp ogt double %28, 0.000000e+00
  %30 = insertelement <4 x double> %27, double 1.000000e+00, i64 2
  %31 = shufflevector <4 x double> %26, <4 x double> %15, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %32 = select i1 %29, <4 x double> %31, <4 x double> %26
  %33 = select i1 %29, <4 x double> %30, <4 x double> %27
  %34 = extractelement <4 x double> %15, i64 3
  %35 = fcmp ogt double %34, 0.000000e+00
  %36 = insertelement <4 x double> %33, double 1.000000e+00, i64 3
  %37 = shufflevector <4 x double> %32, <4 x double> %15, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %38 = select i1 %35, <4 x double> %37, <4 x double> %32
  %39 = select i1 %35, <4 x double> %36, <4 x double> %33
  %40 = extractelement <4 x double> %16, i64 0
  %41 = fcmp ogt double %40, 0.000000e+00
  %42 = shufflevector <4 x double> <double 0.000000e+00, double undef, double undef, double undef>, <4 x double> %16, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %43 = select i1 %41, <4 x double> %42, <4 x double> zeroinitializer
  %44 = select i1 %41, <4 x double> <double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00>, <4 x double> zeroinitializer
  %45 = extractelement <4 x double> %16, i64 1
  %46 = fcmp ogt double %45, 0.000000e+00
  %47 = insertelement <4 x double> %44, double 1.000000e+00, i64 1
  %48 = shufflevector <4 x double> %43, <4 x double> %16, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %49 = select i1 %46, <4 x double> %48, <4 x double> %43
  %50 = select i1 %46, <4 x double> %47, <4 x double> %44
  %51 = extractelement <4 x double> %16, i64 2
  %52 = fcmp ogt double %51, 0.000000e+00
  %53 = insertelement <4 x double> %50, double 1.000000e+00, i64 2
  %54 = shufflevector <4 x double> %49, <4 x double> %16, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %55 = select i1 %52, <4 x double> %54, <4 x double> %49
  %56 = select i1 %52, <4 x double> %53, <4 x double> %50
  %57 = extractelement <4 x double> %16, i64 3
  %58 = fcmp ogt double %57, 0.000000e+00
  %59 = insertelement <4 x double> %56, double 1.000000e+00, i64 3
  %60 = shufflevector <4 x double> %55, <4 x double> %16, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %61 = select i1 %58, <4 x double> %60, <4 x double> %55
  %62 = select i1 %58, <4 x double> %59, <4 x double> %56
  %63 = fmul <4 x double> %11, %39
  store <4 x double> %63, <4 x double>* %5, align 32, !tbaa !3
  %64 = fmul <4 x double> %12, %62
  store <4 x double> %64, <4 x double>* %6, align 32, !tbaa !3
  store <4 x double> %38, <4 x double>* %7, align 32, !tbaa !3
  store <4 x double> %61, <4 x double>* %8, align 32, !tbaa !3
  ret void
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @calPriceVega(%struct._MonteCalroAttrib* nocapture readonly byval(%struct._MonteCalroAttrib) align 32 %0, i32 %1, i32 %2, <4 x i32>* nocapture readonly %3, <4 x double>* nocapture %4, <4 x double>* nocapture %5) local_unnamed_addr #6 !kernel_arg_addr_space !6 !kernel_arg_access_qual !7 !kernel_arg_type !8 !kernel_arg_base_type !9 !kernel_arg_type_qual !10 {
  %7 = alloca <4 x double>, align 32
  %8 = alloca <4 x double>, align 32
  %9 = alloca <4 x i32>, align 16
  %10 = alloca <4 x double>, align 32
  %11 = alloca <4 x double>, align 32
  %12 = alloca <4 x double>, align 32
  %13 = alloca <4 x double>, align 32
  %14 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 0
  %15 = load <4 x double>, <4 x double>* %14, align 32, !tbaa !3
  %16 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 1
  %17 = load <4 x double>, <4 x double>* %16, align 32, !tbaa !3
  %18 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 2
  %19 = load <4 x double>, <4 x double>* %18, align 32, !tbaa !3
  %20 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 3
  %21 = load <4 x double>, <4 x double>* %20, align 32, !tbaa !3
  %22 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 4
  %23 = load <4 x double>, <4 x double>* %22, align 32, !tbaa !3
  %24 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 5
  %25 = load <4 x double>, <4 x double>* %24, align 32, !tbaa !3
  %26 = getelementptr inbounds %struct._MonteCalroAttrib, %struct._MonteCalroAttrib* %0, i64 0, i32 6
  %27 = load <4 x double>, <4 x double>* %26, align 32, !tbaa !3
  %28 = tail call i64 @_Z13get_global_idj(i32 0) #9
  %29 = tail call i64 @_Z13get_global_idj(i32 1) #9
  %30 = bitcast <4 x double>* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %30) #8
  store <4 x double> zeroinitializer, <4 x double>* %7, align 32, !tbaa !3
  %31 = bitcast <4 x double>* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %31) #8
  store <4 x double> zeroinitializer, <4 x double>* %8, align 32, !tbaa !3
  %32 = bitcast <4 x i32>* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %32) #8
  %33 = sext i32 %2 to i64
  %34 = mul i64 %29, %33
  %35 = add i64 %34, %28
  %36 = getelementptr inbounds <4 x i32>, <4 x i32>* %3, i64 %35
  %37 = load <4 x i32>, <4 x i32>* %36, align 16, !tbaa !3
  store <4 x i32> %37, <4 x i32>* %9, align 16, !tbaa !3
  %38 = icmp sgt i32 %1, 1
  br i1 %38, label %39, label %41

39:                                               ; preds = %6
  %40 = fmul <4 x double> %21, %27
  br label %109

41:                                               ; preds = %109, %6
  %42 = phi <4 x double> [ %23, %6 ], [ %126, %109 ]
  %43 = phi <4 x double> [ %23, %6 ], [ %127, %109 ]
  %44 = phi <4 x double> [ zeroinitializer, %6 ], [ %136, %109 ]
  %45 = phi <4 x double> [ zeroinitializer, %6 ], [ %141, %109 ]
  %46 = sitofp i32 %1 to double
  %47 = insertelement <4 x double> undef, double %46, i32 0
  %48 = shufflevector <4 x double> %47, <4 x double> undef, <4 x i32> zeroinitializer
  %49 = fdiv <4 x double> %42, %48
  %50 = fdiv <4 x double> %43, %48
  %51 = fdiv <4 x double> %44, %48
  %52 = fdiv <4 x double> %45, %48
  %53 = fsub <4 x double> %49, %15
  %54 = fsub <4 x double> %50, %15
  %55 = extractelement <4 x double> %53, i64 0
  %56 = fcmp ogt double %55, 0.000000e+00
  %57 = shufflevector <4 x double> <double 0.000000e+00, double undef, double undef, double undef>, <4 x double> %53, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %58 = select i1 %56, <4 x double> %57, <4 x double> zeroinitializer
  %59 = select i1 %56, <4 x double> <double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00>, <4 x double> zeroinitializer
  %60 = extractelement <4 x double> %53, i64 1
  %61 = fcmp ogt double %60, 0.000000e+00
  %62 = insertelement <4 x double> %59, double 1.000000e+00, i64 1
  %63 = shufflevector <4 x double> %58, <4 x double> %53, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %64 = select i1 %61, <4 x double> %63, <4 x double> %58
  %65 = select i1 %61, <4 x double> %62, <4 x double> %59
  %66 = extractelement <4 x double> %53, i64 2
  %67 = fcmp ogt double %66, 0.000000e+00
  %68 = insertelement <4 x double> %65, double 1.000000e+00, i64 2
  %69 = shufflevector <4 x double> %64, <4 x double> %53, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %70 = select i1 %67, <4 x double> %69, <4 x double> %64
  %71 = select i1 %67, <4 x double> %68, <4 x double> %65
  %72 = extractelement <4 x double> %53, i64 3
  %73 = fcmp ogt double %72, 0.000000e+00
  %74 = insertelement <4 x double> %71, double 1.000000e+00, i64 3
  %75 = shufflevector <4 x double> %70, <4 x double> %53, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %76 = select i1 %73, <4 x double> %75, <4 x double> %70
  %77 = select i1 %73, <4 x double> %74, <4 x double> %71
  %78 = extractelement <4 x double> %54, i64 0
  %79 = fcmp ogt double %78, 0.000000e+00
  %80 = shufflevector <4 x double> <double 0.000000e+00, double undef, double undef, double undef>, <4 x double> %54, <4 x i32> <i32 4, i32 0, i32 0, i32 0>
  %81 = select i1 %79, <4 x double> %80, <4 x double> zeroinitializer
  %82 = select i1 %79, <4 x double> <double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00>, <4 x double> zeroinitializer
  %83 = extractelement <4 x double> %54, i64 1
  %84 = fcmp ogt double %83, 0.000000e+00
  %85 = insertelement <4 x double> %82, double 1.000000e+00, i64 1
  %86 = shufflevector <4 x double> %81, <4 x double> %54, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  %87 = select i1 %84, <4 x double> %86, <4 x double> %81
  %88 = select i1 %84, <4 x double> %85, <4 x double> %82
  %89 = extractelement <4 x double> %54, i64 2
  %90 = fcmp ogt double %89, 0.000000e+00
  %91 = insertelement <4 x double> %88, double 1.000000e+00, i64 2
  %92 = shufflevector <4 x double> %87, <4 x double> %54, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %93 = select i1 %90, <4 x double> %92, <4 x double> %87
  %94 = select i1 %90, <4 x double> %91, <4 x double> %88
  %95 = extractelement <4 x double> %54, i64 3
  %96 = fcmp ogt double %95, 0.000000e+00
  %97 = insertelement <4 x double> %94, double 1.000000e+00, i64 3
  %98 = shufflevector <4 x double> %93, <4 x double> %54, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %99 = select i1 %96, <4 x double> %98, <4 x double> %93
  %100 = select i1 %96, <4 x double> %97, <4 x double> %94
  %101 = fmul <4 x double> %51, %77
  %102 = fmul <4 x double> %52, %100
  %103 = shl i64 %35, 1
  %104 = getelementptr inbounds <4 x double>, <4 x double>* %4, i64 %103
  store <4 x double> %76, <4 x double>* %104, align 32, !tbaa !3
  %105 = or i64 %103, 1
  %106 = getelementptr inbounds <4 x double>, <4 x double>* %4, i64 %105
  store <4 x double> %99, <4 x double>* %106, align 32, !tbaa !3
  %107 = getelementptr inbounds <4 x double>, <4 x double>* %5, i64 %103
  store <4 x double> %101, <4 x double>* %107, align 32, !tbaa !3
  %108 = getelementptr inbounds <4 x double>, <4 x double>* %5, i64 %105
  store <4 x double> %102, <4 x double>* %108, align 32, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %32) #8
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %31) #8
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %30) #8
  ret void

109:                                              ; preds = %144, %39
  %110 = phi <4 x i32> [ %37, %39 ], [ %145, %144 ]
  %111 = phi i32 [ 1, %39 ], [ %142, %144 ]
  %112 = phi <4 x double> [ zeroinitializer, %39 ], [ %141, %144 ]
  %113 = phi <4 x double> [ zeroinitializer, %39 ], [ %136, %144 ]
  %114 = phi <4 x double> [ %23, %39 ], [ %127, %144 ]
  %115 = phi <4 x double> [ %23, %39 ], [ %126, %144 ]
  %116 = phi <4 x double> [ %23, %39 ], [ %125, %144 ]
  %117 = phi <4 x double> [ %23, %39 ], [ %121, %144 ]
  call void @generateRand(<4 x i32> %110, <4 x double>* nonnull %7, <4 x double>* nonnull %8, <4 x i32>* nonnull %9) #11
  %118 = load <4 x double>, <4 x double>* %7, align 32, !tbaa !3
  %119 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %19, <4 x double> %118, <4 x double> %17)
  store <4 x double> %119, <4 x double>* %10, align 32, !tbaa !3
  %120 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %10) #10
  %121 = fmul <4 x double> %117, %120
  %122 = load <4 x double>, <4 x double>* %8, align 32, !tbaa !3
  %123 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %19, <4 x double> %122, <4 x double> %17)
  store <4 x double> %123, <4 x double>* %11, align 32, !tbaa !3
  %124 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %11) #10
  %125 = fmul <4 x double> %116, %124
  %126 = fadd <4 x double> %115, %121
  %127 = fadd <4 x double> %114, %125
  %128 = sitofp i32 %111 to double
  %129 = insertelement <4 x double> undef, double %128, i32 0
  %130 = shufflevector <4 x double> %129, <4 x double> undef, <4 x i32> zeroinitializer
  %131 = fmul <4 x double> %40, %130
  %132 = fdiv <4 x double> %121, %23
  store <4 x double> %132, <4 x double>* %12, align 32, !tbaa !3
  %133 = tail call <4 x double> @_Z3logDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %12) #10
  %134 = fsub <4 x double> %133, %131
  %135 = fdiv <4 x double> %134, %25
  %136 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %121, <4 x double> %135, <4 x double> %113)
  %137 = fdiv <4 x double> %125, %23
  store <4 x double> %137, <4 x double>* %13, align 32, !tbaa !3
  %138 = tail call <4 x double> @_Z3logDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %13) #10
  %139 = fsub <4 x double> %138, %131
  %140 = fdiv <4 x double> %139, %25
  %141 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %125, <4 x double> %140, <4 x double> %112)
  %142 = add nuw nsw i32 %111, 1
  %143 = icmp eq i32 %142, %1
  br i1 %143, label %41, label %144

144:                                              ; preds = %109
  %145 = load <4 x i32>, <4 x i32>* %9, align 16, !tbaa !3
  br label %109
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z3expDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #4

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x double> @llvm.fmuladd.v4f64(<4 x double>, <4 x double>, <4 x double>) #7

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone speculatable willreturn }
attributes #8 = { nounwind }
attributes #9 = { convergent nounwind readnone }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

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
!8 = !{!"MonteCarloAttrib", !"int", !"int", !"uint4*", !"double4*", !"double4*"}
!9 = !{!"struct _MonteCalroAttrib", !"int", !"int", !"uint __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*"}
!10 = !{!"", !"", !"", !"", !"", !""}
