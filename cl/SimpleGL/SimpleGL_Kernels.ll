; ModuleID = '../AMDAPP_samples/cl/SimpleGL/SimpleGL_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/SimpleGL/SimpleGL_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable writeonly
define dso_local spir_kernel void @sineWave(<4 x float>* nocapture %0, i32 %1, i32 %2, float %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %8 = trunc i64 %7 to i32
  %9 = uitofp i32 %6 to float
  %10 = uitofp i32 %1 to float
  %11 = fdiv float %9, %10, !fpmath !8
  %12 = uitofp i32 %8 to float
  %13 = uitofp i32 %2 to float
  %14 = fdiv float %12, %13, !fpmath !8
  %15 = tail call float @llvm.fmuladd.f32(float %11, float 2.000000e+00, float -1.000000e+00)
  %16 = tail call float @llvm.fmuladd.f32(float %14, float 2.000000e+00, float -1.000000e+00)
  %17 = tail call float @llvm.fmuladd.f32(float %15, float 4.000000e+00, float %3)
  %18 = tail call float @_Z3sinf(float %17) #3
  %19 = tail call float @llvm.fmuladd.f32(float %16, float 4.000000e+00, float %3)
  %20 = tail call float @_Z3cosf(float %19) #3
  %21 = fmul float %18, %20
  %22 = fmul float %21, 5.000000e-01
  %23 = insertelement <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, float %15, i32 0
  %24 = insertelement <4 x float> %23, float %22, i32 1
  %25 = insertelement <4 x float> %24, float %16, i32 2
  %26 = mul i32 %8, %1
  %27 = add i32 %26, %6
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %28
  store <4 x float> %25, <4 x float>* %29, align 16, !tbaa !9
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3sinf(float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3cosf(float) local_unnamed_addr #1

attributes #0 = { convergent nofree nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"float4*", !"uint", !"uint", !"float"}
!6 = !{!"float __attribute__((ext_vector_type(4)))*", !"uint", !"uint", !"float"}
!7 = !{!"", !"", !"", !""}
!8 = !{float 2.500000e+00}
!9 = !{!10, !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
