; ModuleID = '../AMDAPP_samples/cl/MatrixTranspose/MatrixTranspose_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/MatrixTranspose/MatrixTranspose_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @matrixTranspose(<4 x float>* nocapture %0, <4 x float>* nocapture readonly %1, <4 x float>* nocapture %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z15get_global_sizej(i32 0) #3
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z12get_group_idj(i32 1) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z14get_num_groupsj(i32 0) #3
  %11 = trunc i64 %10 to i32
  %12 = add i32 %9, %7
  %13 = urem i32 %12, %11
  %14 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %15 = trunc i64 %14 to i32
  %16 = tail call i64 @_Z12get_local_idj(i32 1) #3
  %17 = trunc i64 %16 to i32
  %18 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  %19 = trunc i64 %18 to i32
  %20 = mul i32 %13, %19
  %21 = add i32 %20, %15
  %22 = mul i32 %19, %7
  %23 = add i32 %22, %17
  %24 = shl i32 %5, 2
  %25 = mul i32 %24, %23
  %26 = add i32 %21, %25
  %27 = shl i32 %17, 2
  %28 = mul i32 %27, %19
  %29 = add i32 %28, %15
  %30 = sext i32 %26 to i64
  %31 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %30
  %32 = load <4 x float>, <4 x float>* %31, align 16, !tbaa !8
  %33 = sext i32 %29 to i64
  %34 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %33
  store <4 x float> %32, <4 x float>* %34, align 16, !tbaa !8
  %35 = add i32 %26, %5
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %36
  %38 = load <4 x float>, <4 x float>* %37, align 16, !tbaa !8
  %39 = add i32 %29, %19
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %40
  store <4 x float> %38, <4 x float>* %41, align 16, !tbaa !8
  %42 = shl i32 %5, 1
  %43 = add i32 %26, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %44
  %46 = load <4 x float>, <4 x float>* %45, align 16, !tbaa !8
  %47 = shl i32 %19, 1
  %48 = add i32 %29, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %49
  store <4 x float> %46, <4 x float>* %50, align 16, !tbaa !8
  %51 = mul i32 %5, 3
  %52 = add i32 %26, %51
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %53
  %55 = load <4 x float>, <4 x float>* %54, align 16, !tbaa !8
  %56 = mul i32 %19, 3
  %57 = add i32 %29, %56
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %58
  store <4 x float> %55, <4 x float>* %59, align 16, !tbaa !8
  tail call void @_Z7barrierj(i32 1) #4
  %60 = add i32 %22, %15
  %61 = add i32 %20, %17
  %62 = mul i32 %24, %61
  %63 = add i32 %60, %62
  %64 = shl i32 %15, 2
  %65 = mul i32 %64, %19
  %66 = add i32 %65, %17
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %67
  %69 = load <4 x float>, <4 x float>* %68, align 16, !tbaa !8
  %70 = add i32 %66, %19
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %71
  %73 = load <4 x float>, <4 x float>* %72, align 16, !tbaa !8
  %74 = add i32 %66, %47
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %75
  %77 = load <4 x float>, <4 x float>* %76, align 16, !tbaa !8
  %78 = add i32 %66, %56
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %79
  %81 = load <4 x float>, <4 x float>* %80, align 16, !tbaa !8
  %82 = shufflevector <4 x float> %69, <4 x float> %73, <4 x i32> <i32 0, i32 4, i32 undef, i32 undef>
  %83 = shufflevector <4 x float> %82, <4 x float> %77, <4 x i32> <i32 0, i32 1, i32 4, i32 undef>
  %84 = shufflevector <4 x float> %83, <4 x float> %81, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %85 = sext i32 %63 to i64
  %86 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %85
  store <4 x float> %84, <4 x float>* %86, align 16, !tbaa !8
  %87 = shufflevector <4 x float> %69, <4 x float> %73, <4 x i32> <i32 1, i32 5, i32 undef, i32 undef>
  %88 = shufflevector <4 x float> %87, <4 x float> %77, <4 x i32> <i32 0, i32 1, i32 5, i32 undef>
  %89 = shufflevector <4 x float> %88, <4 x float> %81, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %90 = add i32 %63, %5
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %91
  store <4 x float> %89, <4 x float>* %92, align 16, !tbaa !8
  %93 = shufflevector <4 x float> %69, <4 x float> %73, <4 x i32> <i32 2, i32 6, i32 undef, i32 undef>
  %94 = shufflevector <4 x float> %93, <4 x float> %77, <4 x i32> <i32 0, i32 1, i32 6, i32 undef>
  %95 = shufflevector <4 x float> %94, <4 x float> %81, <4 x i32> <i32 0, i32 1, i32 2, i32 6>
  %96 = add i32 %63, %42
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %97
  store <4 x float> %95, <4 x float>* %98, align 16, !tbaa !8
  %99 = shufflevector <4 x float> %69, <4 x float> %73, <4 x i32> <i32 3, i32 7, i32 undef, i32 undef>
  %100 = shufflevector <4 x float> %99, <4 x float> %77, <4 x i32> <i32 0, i32 1, i32 7, i32 undef>
  %101 = shufflevector <4 x float> %100, <4 x float> %81, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %102 = add i32 %63, %51
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %103
  store <4 x float> %101, <4 x float>* %104, align 16, !tbaa !8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_num_groupsj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 3}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"float4*", !"float4*", !"float4*"}
!6 = !{!"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
