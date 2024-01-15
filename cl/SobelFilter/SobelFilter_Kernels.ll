; ModuleID = '../AMDAPP_samples/cl/SobelFilter/SobelFilter_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/SobelFilter/SobelFilter_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @sobel_filter(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %3 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %4 = trunc i64 %3 to i32
  %5 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z15get_global_sizej(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z15get_global_sizej(i32 1) #3
  %10 = mul i32 %8, %6
  %11 = add i32 %10, %4
  %12 = icmp eq i32 %4, 0
  br i1 %12, label %87, label %13

13:                                               ; preds = %2
  %14 = trunc i64 %9 to i32
  %15 = add i32 %8, -1
  %16 = icmp ugt i32 %15, %4
  %17 = icmp ne i32 %6, 0
  %18 = and i1 %17, %16
  %19 = add i32 %14, -1
  %20 = icmp ugt i32 %19, %6
  %21 = and i1 %18, %20
  br i1 %21, label %22, label %87

22:                                               ; preds = %13
  %23 = add nsw i32 %11, -1
  %24 = sub i32 %23, %8
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %25
  %27 = bitcast <4 x i8>* %26 to i32*
  %28 = load i32, i32* %27, align 4, !tbaa !8
  %29 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %28) #3
  %30 = sub i32 %11, %8
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %31
  %33 = bitcast <4 x i8>* %32 to i32*
  %34 = load i32, i32* %33, align 4, !tbaa !8
  %35 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %34) #3
  %36 = add nsw i32 %11, 1
  %37 = sub i32 %36, %8
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %38
  %40 = bitcast <4 x i8>* %39 to i32*
  %41 = load i32, i32* %40, align 4, !tbaa !8
  %42 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %41) #3
  %43 = sext i32 %23 to i64
  %44 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %43
  %45 = bitcast <4 x i8>* %44 to i32*
  %46 = load i32, i32* %45, align 4, !tbaa !8
  %47 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %46) #3
  %48 = sext i32 %11 to i64
  %49 = sext i32 %36 to i64
  %50 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %49
  %51 = bitcast <4 x i8>* %50 to i32*
  %52 = load i32, i32* %51, align 4, !tbaa !8
  %53 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %52) #3
  %54 = add i32 %23, %8
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %55
  %57 = bitcast <4 x i8>* %56 to i32*
  %58 = load i32, i32* %57, align 4, !tbaa !8
  %59 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %58) #3
  %60 = add i32 %11, %8
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %61
  %63 = bitcast <4 x i8>* %62 to i32*
  %64 = load i32, i32* %63, align 4, !tbaa !8
  %65 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %64) #3
  %66 = add i32 %36, %8
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %67
  %69 = bitcast <4 x i8>* %68 to i32*
  %70 = load i32, i32* %69, align 4, !tbaa !8
  %71 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %70) #3
  %72 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %35, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float> %29)
  %73 = fadd <4 x float> %72, %42
  %74 = fsub <4 x float> %73, %59
  %75 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %65, <4 x float> <float -2.000000e+00, float -2.000000e+00, float -2.000000e+00, float -2.000000e+00>, <4 x float> %74)
  %76 = fsub <4 x float> %75, %71
  %77 = fsub <4 x float> %29, %42
  %78 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %47, <4 x float> <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, <4 x float> %77)
  %79 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %53, <4 x float> <float -2.000000e+00, float -2.000000e+00, float -2.000000e+00, float -2.000000e+00>, <4 x float> %78)
  %80 = fadd <4 x float> %79, %59
  %81 = fsub <4 x float> %80, %71
  %82 = tail call <4 x float> @_Z5hypotDv4_fS_(<4 x float> %76, <4 x float> %81) #3
  %83 = fmul <4 x float> %82, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %84 = tail call i32 @_Z14convert_uchar4Dv4_f(<4 x float> %83) #3
  %85 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %48
  %86 = bitcast <4 x i8>* %85 to i32*
  store i32 %84, i32* %86, align 4, !tbaa !8
  br label %87

87:                                               ; preds = %2, %22, %13
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z14convert_float4Dv4_h(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #2

; Function Attrs: convergent nounwind readnone
declare dso_local i32 @_Z14convert_uchar4Dv4_f(<4 x float>) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z5hypotDv4_fS_(<4 x float>, <4 x float>) local_unnamed_addr #1

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1}
!4 = !{!"none", !"none"}
!5 = !{!"uchar4*", !"uchar4*"}
!6 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
