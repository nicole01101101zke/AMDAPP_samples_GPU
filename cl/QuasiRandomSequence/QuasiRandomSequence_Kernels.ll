; ModuleID = '../AMDAPP_samples/cl/QuasiRandomSequence/QuasiRandomSequence_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/QuasiRandomSequence/QuasiRandomSequence_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @QuasiRandomSequence_Vector(<4 x float>* nocapture %0, <4 x i32>* nocapture readonly %1, <4 x i32>* nocapture %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %8 = shl i32 %6, 2
  %9 = insertelement <4 x i32> undef, i32 %8, i32 0
  %10 = or i32 %8, 1
  %11 = insertelement <4 x i32> %9, i32 %10, i32 1
  %12 = or i32 %8, 2
  %13 = insertelement <4 x i32> %11, i32 %12, i32 2
  %14 = or i32 %8, 3
  %15 = insertelement <4 x i32> %13, i32 %14, i32 3
  %16 = tail call float @_Z3powff(float 2.000000e+00, float 3.200000e+01) #4
  %17 = icmp slt i32 %6, 8
  br i1 %17, label %18, label %23

18:                                               ; preds = %3
  %19 = trunc i64 %7 to i32
  %20 = shl i32 %19, 3
  %21 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %22 = trunc i64 %21 to i32
  br label %124

23:                                               ; preds = %124, %3
  tail call void @_Z7barrierj(i32 1) #5
  %24 = and <4 x i32> %15, <i32 1, i32 1, i32 1, i32 1>
  %25 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 0
  %26 = load i32, i32* %25, align 4, !tbaa !8
  %27 = insertelement <4 x i32> undef, i32 %26, i32 0
  %28 = shufflevector <4 x i32> %27, <4 x i32> undef, <4 x i32> zeroinitializer
  %29 = mul nuw <4 x i32> %28, %24
  %30 = lshr <4 x i32> %15, <i32 1, i32 1, i32 1, i32 1>
  %31 = and <4 x i32> %30, <i32 1, i32 1, i32 1, i32 1>
  %32 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 1
  %33 = load i32, i32* %32, align 4, !tbaa !8
  %34 = insertelement <4 x i32> undef, i32 %33, i32 0
  %35 = shufflevector <4 x i32> %34, <4 x i32> undef, <4 x i32> zeroinitializer
  %36 = mul nuw <4 x i32> %35, %31
  %37 = xor <4 x i32> %36, %29
  %38 = lshr <4 x i32> %15, <i32 2, i32 2, i32 2, i32 2>
  %39 = and <4 x i32> %38, <i32 1, i32 1, i32 1, i32 1>
  %40 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 2
  %41 = load i32, i32* %40, align 4, !tbaa !8
  %42 = insertelement <4 x i32> undef, i32 %41, i32 0
  %43 = shufflevector <4 x i32> %42, <4 x i32> undef, <4 x i32> zeroinitializer
  %44 = mul nuw <4 x i32> %43, %39
  %45 = xor <4 x i32> %44, %37
  %46 = lshr <4 x i32> %15, <i32 3, i32 3, i32 3, i32 3>
  %47 = and <4 x i32> %46, <i32 1, i32 1, i32 1, i32 1>
  %48 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 3
  %49 = load i32, i32* %48, align 4, !tbaa !8
  %50 = insertelement <4 x i32> undef, i32 %49, i32 0
  %51 = shufflevector <4 x i32> %50, <4 x i32> undef, <4 x i32> zeroinitializer
  %52 = mul nuw <4 x i32> %51, %47
  %53 = xor <4 x i32> %52, %45
  %54 = lshr <4 x i32> %15, <i32 4, i32 4, i32 4, i32 4>
  %55 = and <4 x i32> %54, <i32 1, i32 1, i32 1, i32 1>
  %56 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 4
  %57 = load i32, i32* %56, align 4, !tbaa !8
  %58 = insertelement <4 x i32> undef, i32 %57, i32 0
  %59 = shufflevector <4 x i32> %58, <4 x i32> undef, <4 x i32> zeroinitializer
  %60 = mul nuw <4 x i32> %59, %55
  %61 = xor <4 x i32> %60, %53
  %62 = lshr <4 x i32> %15, <i32 5, i32 5, i32 5, i32 5>
  %63 = and <4 x i32> %62, <i32 1, i32 1, i32 1, i32 1>
  %64 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 5
  %65 = load i32, i32* %64, align 4, !tbaa !8
  %66 = insertelement <4 x i32> undef, i32 %65, i32 0
  %67 = shufflevector <4 x i32> %66, <4 x i32> undef, <4 x i32> zeroinitializer
  %68 = mul nuw <4 x i32> %67, %63
  %69 = xor <4 x i32> %68, %61
  %70 = lshr <4 x i32> %15, <i32 6, i32 6, i32 6, i32 6>
  %71 = and <4 x i32> %70, <i32 1, i32 1, i32 1, i32 1>
  %72 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 6
  %73 = load i32, i32* %72, align 4, !tbaa !8
  %74 = insertelement <4 x i32> undef, i32 %73, i32 0
  %75 = shufflevector <4 x i32> %74, <4 x i32> undef, <4 x i32> zeroinitializer
  %76 = mul nuw <4 x i32> %75, %71
  %77 = xor <4 x i32> %76, %69
  %78 = lshr <4 x i32> %15, <i32 7, i32 7, i32 7, i32 7>
  %79 = and <4 x i32> %78, <i32 1, i32 1, i32 1, i32 1>
  %80 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 7
  %81 = load i32, i32* %80, align 4, !tbaa !8
  %82 = insertelement <4 x i32> undef, i32 %81, i32 0
  %83 = shufflevector <4 x i32> %82, <4 x i32> undef, <4 x i32> zeroinitializer
  %84 = mul nuw <4 x i32> %83, %79
  %85 = xor <4 x i32> %84, %77
  %86 = lshr <4 x i32> %15, <i32 8, i32 8, i32 8, i32 8>
  %87 = and <4 x i32> %86, <i32 1, i32 1, i32 1, i32 1>
  %88 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 8
  %89 = load i32, i32* %88, align 4, !tbaa !8
  %90 = insertelement <4 x i32> undef, i32 %89, i32 0
  %91 = shufflevector <4 x i32> %90, <4 x i32> undef, <4 x i32> zeroinitializer
  %92 = mul nuw <4 x i32> %91, %87
  %93 = xor <4 x i32> %92, %85
  %94 = lshr <4 x i32> %15, <i32 9, i32 9, i32 9, i32 9>
  %95 = and <4 x i32> %94, <i32 1, i32 1, i32 1, i32 1>
  %96 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 9
  %97 = load i32, i32* %96, align 4, !tbaa !8
  %98 = insertelement <4 x i32> undef, i32 %97, i32 0
  %99 = shufflevector <4 x i32> %98, <4 x i32> undef, <4 x i32> zeroinitializer
  %100 = mul nuw <4 x i32> %99, %95
  %101 = xor <4 x i32> %100, %93
  %102 = lshr <4 x i32> %15, <i32 10, i32 10, i32 10, i32 10>
  %103 = and <4 x i32> %102, <i32 1, i32 1, i32 1, i32 1>
  %104 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 10
  %105 = load i32, i32* %104, align 4, !tbaa !8
  %106 = insertelement <4 x i32> undef, i32 %105, i32 0
  %107 = shufflevector <4 x i32> %106, <4 x i32> undef, <4 x i32> zeroinitializer
  %108 = mul nuw <4 x i32> %107, %103
  %109 = xor <4 x i32> %108, %101
  %110 = lshr <4 x i32> %15, <i32 11, i32 11, i32 11, i32 11>
  %111 = and <4 x i32> %110, <i32 1, i32 1, i32 1, i32 1>
  %112 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 0, i64 11
  %113 = load i32, i32* %112, align 4, !tbaa !8
  %114 = insertelement <4 x i32> undef, i32 %113, i32 0
  %115 = shufflevector <4 x i32> %114, <4 x i32> undef, <4 x i32> zeroinitializer
  %116 = mul nuw <4 x i32> %115, %111
  %117 = xor <4 x i32> %116, %109
  %118 = tail call <4 x float> @_Z14convert_float4Dv4_j(<4 x i32> %117) #4
  %119 = insertelement <4 x float> undef, float %16, i32 0
  %120 = shufflevector <4 x float> %119, <4 x float> undef, <4 x i32> zeroinitializer
  %121 = fdiv <4 x float> %118, %120, !fpmath !12
  %122 = and i64 %4, 4294967295
  %123 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %122
  store <4 x float> %121, <4 x float>* %123, align 16, !tbaa !13
  ret void

124:                                              ; preds = %18, %124
  %125 = phi i32 [ %6, %18 ], [ %132, %124 ]
  %126 = add i32 %125, %20
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %127
  %129 = load <4 x i32>, <4 x i32>* %128, align 16, !tbaa !13
  %130 = sext i32 %125 to i64
  %131 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 %130
  store <4 x i32> %129, <4 x i32>* %131, align 16, !tbaa !13
  %132 = add i32 %125, %22
  %133 = icmp slt i32 %132, 8
  br i1 %133, label %124, label %23
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3powff(float, float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z14convert_float4Dv4_j(<4 x i32>) local_unnamed_addr #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @QuasiRandomSequence_Scalar(float* nocapture %0, i32* nocapture readonly %1, i32* nocapture %2) local_unnamed_addr #3 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !14 !kernel_arg_base_type !14 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %8 = tail call float @_Z3powff(float 2.000000e+00, float 3.200000e+01) #4
  %9 = icmp slt i32 %6, 32
  br i1 %9, label %10, label %15

10:                                               ; preds = %3
  %11 = trunc i64 %7 to i32
  %12 = shl i32 %11, 5
  %13 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %14 = trunc i64 %13 to i32
  br label %77

15:                                               ; preds = %77, %3
  tail call void @_Z7barrierj(i32 1) #5
  %16 = and i32 %6, 1
  %17 = load i32, i32* %2, align 4, !tbaa !8
  %18 = mul nuw nsw i32 %17, %16
  %19 = lshr i32 %6, 1
  %20 = and i32 %19, 1
  %21 = getelementptr inbounds i32, i32* %2, i64 1
  %22 = load i32, i32* %21, align 4, !tbaa !8
  %23 = mul nuw nsw i32 %22, %20
  %24 = xor i32 %23, %18
  %25 = lshr i32 %6, 2
  %26 = and i32 %25, 1
  %27 = getelementptr inbounds i32, i32* %2, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !8
  %29 = mul nuw nsw i32 %28, %26
  %30 = xor i32 %29, %24
  %31 = lshr i32 %6, 3
  %32 = and i32 %31, 1
  %33 = getelementptr inbounds i32, i32* %2, i64 3
  %34 = load i32, i32* %33, align 4, !tbaa !8
  %35 = mul nuw nsw i32 %34, %32
  %36 = xor i32 %35, %30
  %37 = lshr i32 %6, 4
  %38 = and i32 %37, 1
  %39 = getelementptr inbounds i32, i32* %2, i64 4
  %40 = load i32, i32* %39, align 4, !tbaa !8
  %41 = mul nuw nsw i32 %40, %38
  %42 = xor i32 %41, %36
  %43 = lshr i32 %6, 5
  %44 = and i32 %43, 1
  %45 = getelementptr inbounds i32, i32* %2, i64 5
  %46 = load i32, i32* %45, align 4, !tbaa !8
  %47 = mul nuw nsw i32 %46, %44
  %48 = xor i32 %47, %42
  %49 = lshr i32 %6, 6
  %50 = and i32 %49, 1
  %51 = getelementptr inbounds i32, i32* %2, i64 6
  %52 = load i32, i32* %51, align 4, !tbaa !8
  %53 = mul nuw nsw i32 %52, %50
  %54 = xor i32 %53, %48
  %55 = lshr i32 %6, 7
  %56 = and i32 %55, 1
  %57 = getelementptr inbounds i32, i32* %2, i64 7
  %58 = load i32, i32* %57, align 4, !tbaa !8
  %59 = mul nuw nsw i32 %58, %56
  %60 = xor i32 %59, %54
  %61 = lshr i32 %6, 8
  %62 = and i32 %61, 1
  %63 = getelementptr inbounds i32, i32* %2, i64 8
  %64 = load i32, i32* %63, align 4, !tbaa !8
  %65 = mul nuw nsw i32 %64, %62
  %66 = xor i32 %65, %60
  %67 = lshr i32 %6, 9
  %68 = and i32 %67, 1
  %69 = getelementptr inbounds i32, i32* %2, i64 9
  %70 = load i32, i32* %69, align 4, !tbaa !8
  %71 = mul nuw nsw i32 %70, %68
  %72 = xor i32 %71, %66
  %73 = tail call float @_Z13convert_floatj(i32 %72) #4
  %74 = fdiv float %73, %8, !fpmath !12
  %75 = and i64 %4, 4294967295
  %76 = getelementptr inbounds float, float* %0, i64 %75
  store float %74, float* %76, align 4, !tbaa !15
  ret void

77:                                               ; preds = %10, %77
  %78 = phi i32 [ %6, %10 ], [ %85, %77 ]
  %79 = add i32 %78, %12
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %1, i64 %80
  %82 = load i32, i32* %81, align 4, !tbaa !8
  %83 = sext i32 %78 to i64
  %84 = getelementptr inbounds i32, i32* %2, i64 %83
  store i32 %82, i32* %84, align 4, !tbaa !8
  %85 = add i32 %78, %14
  %86 = icmp slt i32 %85, 32
  br i1 %86, label %77, label %15
}

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z13convert_floatj(i32) local_unnamed_addr #1

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 3}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"float4*", !"uint4*", !"uint4*"}
!6 = !{!"float __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{float 2.500000e+00}
!13 = !{!10, !10, i64 0}
!14 = !{!"float*", !"uint*", !"uint*"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !10, i64 0}
