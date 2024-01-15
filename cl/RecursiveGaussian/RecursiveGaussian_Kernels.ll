; ModuleID = '../AMDAPP_samples/cl/RecursiveGaussian/RecursiveGaussian_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/RecursiveGaussian/RecursiveGaussian_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @transpose_kernel(<4 x i8>* nocapture %0, <4 x i8>* nocapture readonly %1, <4 x i8>* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %10 = trunc i64 %9 to i32
  %11 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %12 = trunc i64 %11 to i32
  %13 = tail call i64 @_Z12get_local_idj(i32 1) #4
  %14 = trunc i64 %13 to i32
  %15 = mul i32 %10, %3
  %16 = add i32 %15, %8
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %17
  %19 = bitcast <4 x i8>* %18 to i32*
  %20 = load i32, i32* %19, align 4, !tbaa !8
  %21 = mul i32 %14, %5
  %22 = add i32 %21, %12
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds <4 x i8>, <4 x i8>* %2, i64 %23
  %25 = bitcast <4 x i8>* %24 to i32*
  store i32 %20, i32* %25, align 4, !tbaa !8
  tail call void @_Z7barrierj(i32 1) #5
  %26 = mul i32 %8, %4
  %27 = add i32 %26, %10
  %28 = load i32, i32* %25, align 4, !tbaa !8
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %29
  %31 = bitcast <4 x i8>* %30 to i32*
  store i32 %28, i32* %31, align 4, !tbaa !8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @RecursiveGaussian_kernel(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1, i32 %2, i32 %3, float %4, float %5, float %6, float %7, float %8, float %9, float %10, float %11) local_unnamed_addr #0 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !14 !kernel_arg_type_qual !15 {
  %13 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %14 = trunc i64 %13 to i32
  %15 = icmp ult i32 %14, %2
  br i1 %15, label %16, label %143

16:                                               ; preds = %12
  %17 = icmp sgt i32 %3, 0
  br i1 %17, label %18, label %30

18:                                               ; preds = %16
  %19 = insertelement <4 x float> undef, float %4, i32 0
  %20 = shufflevector <4 x float> %19, <4 x float> undef, <4 x i32> zeroinitializer
  %21 = insertelement <4 x float> undef, float %5, i32 0
  %22 = shufflevector <4 x float> %21, <4 x float> undef, <4 x i32> zeroinitializer
  %23 = insertelement <4 x float> undef, float %8, i32 0
  %24 = shufflevector <4 x float> %23, <4 x float> undef, <4 x i32> zeroinitializer
  %25 = fneg <4 x float> %24
  %26 = insertelement <4 x float> undef, float %9, i32 0
  %27 = shufflevector <4 x float> %26, <4 x float> undef, <4 x i32> zeroinitializer
  %28 = fneg <4 x float> %27
  %29 = zext i32 %3 to i64
  br label %44

30:                                               ; preds = %44, %16
  %31 = phi i1 [ false, %16 ], [ %17, %44 ]
  tail call void @_Z7barrierj(i32 2) #5
  br i1 %31, label %32, label %143

32:                                               ; preds = %30
  %33 = insertelement <4 x float> undef, float %6, i32 0
  %34 = shufflevector <4 x float> %33, <4 x float> undef, <4 x i32> zeroinitializer
  %35 = insertelement <4 x float> undef, float %7, i32 0
  %36 = shufflevector <4 x float> %35, <4 x float> undef, <4 x i32> zeroinitializer
  %37 = insertelement <4 x float> undef, float %8, i32 0
  %38 = shufflevector <4 x float> %37, <4 x float> undef, <4 x i32> zeroinitializer
  %39 = fneg <4 x float> %38
  %40 = insertelement <4 x float> undef, float %9, i32 0
  %41 = shufflevector <4 x float> %40, <4 x float> undef, <4 x i32> zeroinitializer
  %42 = fneg <4 x float> %41
  %43 = zext i32 %3 to i64
  br label %86

44:                                               ; preds = %44, %18
  %45 = phi i64 [ 0, %18 ], [ %84, %44 ]
  %46 = phi <4 x float> [ zeroinitializer, %18 ], [ %66, %44 ]
  %47 = phi <4 x float> [ zeroinitializer, %18 ], [ %70, %44 ]
  %48 = phi <4 x float> [ zeroinitializer, %18 ], [ %47, %44 ]
  %49 = trunc i64 %45 to i32
  %50 = mul i32 %49, %2
  %51 = add i32 %50, %14
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %52
  %54 = load <4 x i8>, <4 x i8>* %53, align 4
  %55 = extractelement <4 x i8> %54, i64 0
  %56 = uitofp i8 %55 to float
  %57 = insertelement <4 x float> undef, float %56, i32 0
  %58 = extractelement <4 x i8> %54, i64 1
  %59 = uitofp i8 %58 to float
  %60 = insertelement <4 x float> %57, float %59, i32 1
  %61 = extractelement <4 x i8> %54, i64 2
  %62 = uitofp i8 %61 to float
  %63 = insertelement <4 x float> %60, float %62, i32 2
  %64 = extractelement <4 x i8> %54, i64 3
  %65 = uitofp i8 %64 to float
  %66 = insertelement <4 x float> %63, float %65, i32 3
  %67 = fmul <4 x float> %22, %46
  %68 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %20, <4 x float> %66, <4 x float> %67)
  %69 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %25, <4 x float> %47, <4 x float> %68)
  %70 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %28, <4 x float> %48, <4 x float> %69)
  %71 = extractelement <4 x float> %70, i64 0
  %72 = fptoui float %71 to i8
  %73 = insertelement <4 x i8> undef, i8 %72, i32 0
  %74 = extractelement <4 x float> %70, i64 1
  %75 = fptoui float %74 to i8
  %76 = insertelement <4 x i8> %73, i8 %75, i32 1
  %77 = extractelement <4 x float> %70, i64 2
  %78 = fptoui float %77 to i8
  %79 = insertelement <4 x i8> %76, i8 %78, i32 2
  %80 = extractelement <4 x float> %70, i64 3
  %81 = fptoui float %80 to i8
  %82 = insertelement <4 x i8> %79, i8 %81, i32 3
  %83 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %52
  store <4 x i8> %82, <4 x i8>* %83, align 4, !tbaa !8
  %84 = add nuw nsw i64 %45, 1
  %85 = icmp eq i64 %84, %29
  br i1 %85, label %30, label %44

86:                                               ; preds = %32, %86
  %87 = phi i64 [ %43, %32 ], [ %92, %86 ]
  %88 = phi <4 x float> [ zeroinitializer, %32 ], [ %110, %86 ]
  %89 = phi <4 x float> [ zeroinitializer, %32 ], [ %88, %86 ]
  %90 = phi <4 x float> [ zeroinitializer, %32 ], [ %91, %86 ]
  %91 = phi <4 x float> [ zeroinitializer, %32 ], [ %114, %86 ]
  %92 = add nsw i64 %87, -1
  %93 = trunc i64 %92 to i32
  %94 = mul i32 %93, %2
  %95 = add i32 %94, %14
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %96
  %98 = load <4 x i8>, <4 x i8>* %97, align 4
  %99 = extractelement <4 x i8> %98, i64 0
  %100 = uitofp i8 %99 to float
  %101 = insertelement <4 x float> undef, float %100, i32 0
  %102 = extractelement <4 x i8> %98, i64 1
  %103 = uitofp i8 %102 to float
  %104 = insertelement <4 x float> %101, float %103, i32 1
  %105 = extractelement <4 x i8> %98, i64 2
  %106 = uitofp i8 %105 to float
  %107 = insertelement <4 x float> %104, float %106, i32 2
  %108 = extractelement <4 x i8> %98, i64 3
  %109 = uitofp i8 %108 to float
  %110 = insertelement <4 x float> %107, float %109, i32 3
  %111 = fmul <4 x float> %36, %89
  %112 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %34, <4 x float> %88, <4 x float> %111)
  %113 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %39, <4 x float> %91, <4 x float> %112)
  %114 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %42, <4 x float> %90, <4 x float> %113)
  %115 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %96
  %116 = load <4 x i8>, <4 x i8>* %115, align 4
  %117 = extractelement <4 x i8> %116, i64 0
  %118 = uitofp i8 %117 to float
  %119 = insertelement <4 x float> undef, float %118, i32 0
  %120 = extractelement <4 x i8> %116, i64 1
  %121 = uitofp i8 %120 to float
  %122 = insertelement <4 x float> %119, float %121, i32 1
  %123 = extractelement <4 x i8> %116, i64 2
  %124 = uitofp i8 %123 to float
  %125 = insertelement <4 x float> %122, float %124, i32 2
  %126 = extractelement <4 x i8> %116, i64 3
  %127 = uitofp i8 %126 to float
  %128 = insertelement <4 x float> %125, float %127, i32 3
  %129 = fadd <4 x float> %114, %128
  %130 = extractelement <4 x float> %129, i64 0
  %131 = fptoui float %130 to i8
  %132 = insertelement <4 x i8> undef, i8 %131, i32 0
  %133 = extractelement <4 x float> %129, i64 1
  %134 = fptoui float %133 to i8
  %135 = insertelement <4 x i8> %132, i8 %134, i32 1
  %136 = extractelement <4 x float> %129, i64 2
  %137 = fptoui float %136 to i8
  %138 = insertelement <4 x i8> %135, i8 %137, i32 2
  %139 = extractelement <4 x float> %129, i64 3
  %140 = fptoui float %139 to i8
  %141 = insertelement <4 x i8> %138, i8 %140, i32 3
  store <4 x i8> %141, <4 x i8>* %115, align 4, !tbaa !8
  %142 = icmp sgt i64 %87, 1
  br i1 %142, label %86, label %143

143:                                              ; preds = %86, %30, %12
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #3

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 3, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"uchar4*", !"uchar4*", !"uchar4*", !"uint", !"uint", !"uint"}
!6 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"uint", !"uint", !"uint"}
!7 = !{!"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!12 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!13 = !{!"uchar4*", !"uchar4*", !"int", !"int", !"float", !"float", !"float", !"float", !"float", !"float", !"float", !"float"}
!14 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"int", !"int", !"float", !"float", !"float", !"float", !"float", !"float", !"float", !"float"}
!15 = !{!"const", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
