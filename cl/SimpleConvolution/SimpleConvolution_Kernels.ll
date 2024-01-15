; ModuleID = '../AMDAPP_samples/cl/SimpleConvolution/SimpleConvolution_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/SimpleConvolution/SimpleConvolution_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @simpleConvolution(i32* nocapture %0, i32* nocapture readonly %1, float* nocapture readonly %2, <2 x i32> %3, <2 x i32> %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = extractelement <2 x i32> %3, i64 0
  %9 = extractelement <2 x i32> %3, i64 1
  %10 = urem i32 %7, %8
  %11 = udiv i32 %7, %8
  %12 = extractelement <2 x i32> %4, i64 0
  %13 = extractelement <2 x i32> %4, i64 1
  %14 = add i32 %12, -1
  %15 = lshr i32 %14, 1
  %16 = add i32 %13, -1
  %17 = lshr i32 %16, 1
  %18 = tail call i32 @llvm.usub.sat.i32(i32 %10, i32 %15)
  %19 = add i32 %10, %15
  %20 = icmp ult i32 %19, %8
  %21 = add i32 %8, -1
  %22 = select i1 %20, i32 %19, i32 %21
  %23 = tail call i32 @llvm.usub.sat.i32(i32 %11, i32 %17)
  %24 = add i32 %11, %17
  %25 = icmp ult i32 %24, %9
  %26 = add i32 %9, -1
  %27 = select i1 %25, i32 %24, i32 %26
  %28 = icmp ugt i32 %18, %22
  br i1 %28, label %38, label %29

29:                                               ; preds = %5
  %30 = icmp ugt i32 %23, %27
  %31 = sub i32 %17, %11
  %32 = sub i32 %15, %10
  br label %33

33:                                               ; preds = %29, %44
  %34 = phi float [ 0.000000e+00, %29 ], [ %45, %44 ]
  %35 = phi i32 [ %18, %29 ], [ %46, %44 ]
  br i1 %30, label %44, label %36

36:                                               ; preds = %33
  %37 = add i32 %32, %35
  br label %48

38:                                               ; preds = %44, %5
  %39 = phi float [ 0.000000e+00, %5 ], [ %45, %44 ]
  %40 = fadd float %39, 5.000000e-01
  %41 = fptoui float %40 to i32
  %42 = and i64 %6, 4294967295
  %43 = getelementptr inbounds i32, i32* %0, i64 %42
  store i32 %41, i32* %43, align 4, !tbaa !8
  ret void

44:                                               ; preds = %48, %33
  %45 = phi float [ %34, %33 ], [ %63, %48 ]
  %46 = add i32 %35, 1
  %47 = icmp ugt i32 %46, %22
  br i1 %47, label %38, label %33

48:                                               ; preds = %36, %48
  %49 = phi float [ %34, %36 ], [ %63, %48 ]
  %50 = phi i32 [ %23, %36 ], [ %64, %48 ]
  %51 = add i32 %31, %50
  %52 = mul i32 %51, %12
  %53 = add i32 %37, %52
  %54 = mul i32 %50, %8
  %55 = add i32 %54, %35
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %1, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !8
  %59 = uitofp i32 %58 to float
  %60 = zext i32 %53 to i64
  %61 = getelementptr inbounds float, float* %2, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !12
  %63 = tail call float @llvm.fmuladd.f32(float %59, float %62, float %49)
  %64 = add i32 %50, 1
  %65 = icmp ugt i32 %64, %27
  br i1 %65, label %44, label %48
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.usub.sat.i32(i32, i32) #2

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"uint*", !"uint*", !"float*", !"uint2", !"uint2"}
!6 = !{!"uint*", !"uint*", !"float*", !"uint __attribute__((ext_vector_type(2)))", !"uint __attribute__((ext_vector_type(2)))"}
!7 = !{!"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !10, i64 0}
