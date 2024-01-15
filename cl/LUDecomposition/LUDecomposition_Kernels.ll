; ModuleID = '../AMDAPP_samples/cl/LUDecomposition/LUDecomposition_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/LUDecomposition/LUDecomposition_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @kernelLUDecompose(<4 x double>* nocapture %0, <4 x double>* nocapture %1, i32 %2, double* nocapture %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %5 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z12get_local_idj(i32 0) #5
  %10 = tail call i64 @_Z12get_local_idj(i32 1) #5
  %11 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %12 = sdiv i32 %2, 4
  %13 = trunc i64 %11 to i32
  %14 = add i32 %12, %13
  %15 = srem i32 %2, 4
  %16 = icmp eq i64 %9, 0
  br i1 %16, label %17, label %86

17:                                               ; preds = %4
  switch i32 %15, label %86 [
    i32 0, label %18
    i32 1, label %35
    i32 2, label %52
    i32 3, label %69
  ]

18:                                               ; preds = %17
  %19 = mul nsw i32 %14, %6
  %20 = add nsw i32 %19, %12
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %21
  %23 = load <4 x double>, <4 x double>* %22, align 32
  %24 = extractelement <4 x double> %23, i64 0
  %25 = mul nsw i32 %14, %2
  %26 = add nsw i32 %25, %12
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %27
  %29 = load <4 x double>, <4 x double>* %28, align 32
  %30 = extractelement <4 x double> %29, i64 0
  %31 = fdiv double %24, %30
  %32 = shl i64 %10, 32
  %33 = ashr exact i64 %32, 32
  %34 = getelementptr inbounds double, double* %3, i64 %33
  store double %31, double* %34, align 8, !tbaa !8
  br label %86

35:                                               ; preds = %17
  %36 = mul nsw i32 %14, %6
  %37 = add nsw i32 %36, %12
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %38
  %40 = load <4 x double>, <4 x double>* %39, align 32
  %41 = extractelement <4 x double> %40, i64 1
  %42 = mul nsw i32 %14, %2
  %43 = add nsw i32 %42, %12
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %44
  %46 = load <4 x double>, <4 x double>* %45, align 32
  %47 = extractelement <4 x double> %46, i64 1
  %48 = fdiv double %41, %47
  %49 = shl i64 %10, 32
  %50 = ashr exact i64 %49, 32
  %51 = getelementptr inbounds double, double* %3, i64 %50
  store double %48, double* %51, align 8, !tbaa !8
  br label %86

52:                                               ; preds = %17
  %53 = mul nsw i32 %14, %6
  %54 = add nsw i32 %53, %12
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %55
  %57 = load <4 x double>, <4 x double>* %56, align 32
  %58 = extractelement <4 x double> %57, i64 2
  %59 = mul nsw i32 %14, %2
  %60 = add nsw i32 %59, %12
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %61
  %63 = load <4 x double>, <4 x double>* %62, align 32
  %64 = extractelement <4 x double> %63, i64 2
  %65 = fdiv double %58, %64
  %66 = shl i64 %10, 32
  %67 = ashr exact i64 %66, 32
  %68 = getelementptr inbounds double, double* %3, i64 %67
  store double %65, double* %68, align 8, !tbaa !8
  br label %86

69:                                               ; preds = %17
  %70 = mul nsw i32 %14, %6
  %71 = add nsw i32 %70, %12
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %72
  %74 = load <4 x double>, <4 x double>* %73, align 32
  %75 = extractelement <4 x double> %74, i64 3
  %76 = mul nsw i32 %14, %2
  %77 = add nsw i32 %76, %12
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %78
  %80 = load <4 x double>, <4 x double>* %79, align 32
  %81 = extractelement <4 x double> %80, i64 3
  %82 = fdiv double %75, %81
  %83 = shl i64 %10, 32
  %84 = ashr exact i64 %83, 32
  %85 = getelementptr inbounds double, double* %3, i64 %84
  store double %82, double* %85, align 8, !tbaa !8
  br label %86

86:                                               ; preds = %52, %35, %18, %17, %69, %4
  tail call void @_Z7barrierj(i32 1) #6
  %87 = icmp sgt i32 %6, %2
  br i1 %87, label %88, label %166

88:                                               ; preds = %86
  %89 = shl i32 %8, 2
  %90 = add i32 %89, 4
  %91 = icmp sgt i32 %90, %2
  br i1 %91, label %92, label %166

92:                                               ; preds = %88
  %93 = mul nsw i32 %14, %6
  %94 = add nsw i32 %93, %8
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %95
  %97 = load <4 x double>, <4 x double>* %96, align 32
  %98 = extractelement <4 x double> %97, i64 0
  %99 = shl i64 %10, 32
  %100 = ashr exact i64 %99, 32
  %101 = getelementptr inbounds double, double* %3, i64 %100
  %102 = load double, double* %101, align 8, !tbaa !8
  %103 = mul nsw i32 %14, %2
  %104 = add nsw i32 %103, %8
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds <4 x double>, <4 x double>* %1, i64 %105
  %107 = load <4 x double>, <4 x double>* %106, align 32
  %108 = extractelement <4 x double> %107, i64 0
  %109 = fneg double %102
  %110 = tail call double @llvm.fmuladd.f64(double %109, double %108, double %98)
  %111 = extractelement <4 x double> %97, i64 1
  %112 = extractelement <4 x double> %107, i64 1
  %113 = tail call double @llvm.fmuladd.f64(double %109, double %112, double %111)
  %114 = extractelement <4 x double> %97, i64 2
  %115 = extractelement <4 x double> %107, i64 2
  %116 = tail call double @llvm.fmuladd.f64(double %109, double %115, double %114)
  %117 = extractelement <4 x double> %97, i64 3
  %118 = extractelement <4 x double> %107, i64 3
  %119 = tail call double @llvm.fmuladd.f64(double %109, double %118, double %117)
  %120 = icmp eq i32 %12, %8
  br i1 %120, label %121, label %161

121:                                              ; preds = %92
  %122 = icmp eq i32 %15, 0
  br i1 %122, label %123, label %129

123:                                              ; preds = %121
  %124 = getelementptr inbounds <4 x double>, <4 x double>* %0, i64 %95
  %125 = load <4 x double>, <4 x double>* %124, align 32
  %126 = insertelement <4 x double> %125, double %102, i64 0
  store <4 x double> %126, <4 x double>* %124, align 32
  %127 = load <4 x double>, <4 x double>* %96, align 32
  %128 = insertelement <4 x double> %127, double %113, i64 1
  store <4 x double> %128, <4 x double>* %96, align 32
  br label %147

129:                                              ; preds = %121
  %130 = insertelement <4 x double> %97, double %110, i64 0
  store <4 x double> %130, <4 x double>* %96, align 32
  %131 = icmp eq i32 %15, 1
  br i1 %131, label %132, label %138

132:                                              ; preds = %129
  %133 = load double, double* %101, align 8, !tbaa !8
  %134 = getelementptr inbounds <4 x double>, <4 x double>* %0, i64 %95
  %135 = load <4 x double>, <4 x double>* %134, align 32
  %136 = insertelement <4 x double> %135, double %133, i64 1
  store <4 x double> %136, <4 x double>* %134, align 32
  %137 = load <4 x double>, <4 x double>* %96, align 32
  br label %147

138:                                              ; preds = %129
  %139 = insertelement <4 x double> %130, double %113, i64 1
  store <4 x double> %139, <4 x double>* %96, align 32
  %140 = icmp eq i32 %15, 2
  br i1 %140, label %141, label %150

141:                                              ; preds = %138
  %142 = load double, double* %101, align 8, !tbaa !8
  %143 = getelementptr inbounds <4 x double>, <4 x double>* %0, i64 %95
  %144 = load <4 x double>, <4 x double>* %143, align 32
  %145 = insertelement <4 x double> %144, double %142, i64 2
  store <4 x double> %145, <4 x double>* %143, align 32
  %146 = load <4 x double>, <4 x double>* %96, align 32
  br label %158

147:                                              ; preds = %132, %123
  %148 = phi <4 x double> [ %137, %132 ], [ %128, %123 ]
  %149 = insertelement <4 x double> %148, double %116, i64 2
  store <4 x double> %149, <4 x double>* %96, align 32
  br label %158

150:                                              ; preds = %138
  %151 = insertelement <4 x double> %139, double %116, i64 2
  store <4 x double> %151, <4 x double>* %96, align 32
  %152 = icmp eq i32 %15, 3
  br i1 %152, label %153, label %158

153:                                              ; preds = %150
  %154 = load double, double* %101, align 8, !tbaa !8
  %155 = getelementptr inbounds <4 x double>, <4 x double>* %0, i64 %95
  %156 = load <4 x double>, <4 x double>* %155, align 32
  %157 = insertelement <4 x double> %156, double %154, i64 3
  store <4 x double> %157, <4 x double>* %155, align 32
  br label %166

158:                                              ; preds = %147, %141, %150
  %159 = phi <4 x double> [ %149, %147 ], [ %146, %141 ], [ %151, %150 ]
  %160 = insertelement <4 x double> %159, double %119, i64 3
  store <4 x double> %160, <4 x double>* %96, align 32
  br label %166

161:                                              ; preds = %92
  %162 = insertelement <4 x double> undef, double %110, i64 0
  %163 = insertelement <4 x double> %162, double %113, i64 1
  %164 = insertelement <4 x double> %163, double %116, i64 2
  %165 = insertelement <4 x double> %164, double %119, i64 3
  store <4 x double> %165, <4 x double>* %96, align 32
  br label %166

166:                                              ; preds = %161, %158, %153, %88, %86
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @kernelLUCombine(double* nocapture readonly %0, double* nocapture %1) local_unnamed_addr #4 !kernel_arg_addr_space !12 !kernel_arg_access_qual !13 !kernel_arg_type !14 !kernel_arg_base_type !14 !kernel_arg_type_qual !15 {
  %3 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %4 = trunc i64 %3 to i32
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %8 = icmp sgt i32 %4, %6
  br i1 %8, label %9, label %19

9:                                                ; preds = %2
  %10 = mul i64 %7, %3
  %11 = add i64 %10, %5
  %12 = shl i64 %11, 32
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds double, double* %0, i64 %13
  %15 = bitcast double* %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !8
  %17 = getelementptr inbounds double, double* %1, i64 %13
  %18 = bitcast double* %17 to i64*
  store i64 %16, i64* %18, align 8, !tbaa !8
  br label %19

19:                                               ; preds = %9, %2
  ret void
}

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0, i32 3}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"double4*", !"double4*", !"int", !"double*"}
!6 = !{!"double __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*", !"int", !"double*"}
!7 = !{!"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{i32 1, i32 1}
!13 = !{!"none", !"none"}
!14 = !{!"double*", !"double*"}
!15 = !{!"", !""}
