; ModuleID = '../AMDAPP_samples/cl/GaussianNoiseGL/GaussianNoiseGL_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/GaussianNoiseGL/GaussianNoiseGL_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%opencl.image2d_wo_t = type opaque

@gaussian_transform.iv0 = internal global [256 x i32] undef, align 16
@gaussian_transform.iv1 = internal global [256 x i32] undef, align 16

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @gaussian_transform(<4 x i8>* nocapture readonly %0, %opencl.image2d_wo_t* %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %5 = tail call i64 @_Z15get_global_sizej(i32 0) #3
  %6 = shl i64 %5, 1
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %8 = mul i64 %6, %7
  %9 = add i64 %8, %4
  %10 = add i64 %5, %4
  %11 = add i64 %8, %10
  %12 = shl i64 %9, 32
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %13
  %15 = bitcast <4 x i8>* %14 to i32*
  %16 = load i32, i32* %15, align 4, !tbaa !8
  %17 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %16) #3
  %18 = shl i64 %11, 32
  %19 = ashr exact i64 %18, 32
  %20 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %19
  %21 = bitcast <4 x i8>* %20 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !8
  %23 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %22) #3
  %24 = extractelement <4 x float> %17, i64 0
  %25 = extractelement <4 x float> %17, i64 1
  %26 = fadd float %24, %25
  %27 = extractelement <4 x float> %17, i64 2
  %28 = fadd float %27, %26
  %29 = extractelement <4 x float> %17, i64 3
  %30 = fadd float %29, %28
  %31 = extractelement <4 x float> %23, i64 0
  %32 = extractelement <4 x float> %23, i64 1
  %33 = fadd float %31, %32
  %34 = extractelement <4 x float> %23, i64 2
  %35 = fadd float %34, %33
  %36 = extractelement <4 x float> %23, i64 3
  %37 = fadd float %36, %35
  %38 = fmul float %30, -2.500000e-01
  %39 = fptosi float %38 to i32
  %40 = tail call float @ran1(i32 %39, i32* getelementptr inbounds ([256 x i32], [256 x i32]* @gaussian_transform.iv0, i64 0, i64 0)) #4
  %41 = fmul float %37, -2.500000e-01
  %42 = fptosi float %41 to i32
  %43 = tail call float @ran1(i32 %42, i32* getelementptr inbounds ([256 x i32], [256 x i32]* @gaussian_transform.iv1, i64 0, i64 0)) #4
  %44 = insertelement <2 x float> undef, float %40, i32 0
  %45 = insertelement <2 x float> %44, float %43, i32 1
  %46 = bitcast <2 x float> %45 to double
  %47 = tail call double @BoxMuller(double %46) #4
  %48 = bitcast double %47 to <2 x float>
  %49 = extractelement <2 x float> %48, i64 0
  %50 = sitofp i32 %2 to float
  %51 = fmul float %49, %50
  %52 = insertelement <4 x float> undef, float %51, i32 0
  %53 = shufflevector <4 x float> %52, <4 x float> undef, <4 x i32> zeroinitializer
  %54 = fadd <4 x float> %17, %53
  %55 = fdiv <4 x float> %54, <float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02>, !fpmath !11
  %56 = extractelement <2 x float> %48, i64 1
  %57 = fmul float %56, %50
  %58 = insertelement <4 x float> undef, float %57, i32 0
  %59 = shufflevector <4 x float> %58, <4 x float> undef, <4 x i32> zeroinitializer
  %60 = fadd <4 x float> %23, %59
  %61 = fdiv <4 x float> %60, <float 2.550000e+02, float 2.550000e+02, float 2.550000e+02, float 2.550000e+02>, !fpmath !11
  %62 = trunc i64 %4 to i32
  %63 = insertelement <2 x i32> undef, i32 %62, i64 0
  %64 = trunc i64 %7 to i32
  %65 = insertelement <2 x i32> %63, i32 %64, i64 1
  %66 = trunc i64 %10 to i32
  %67 = insertelement <2 x i32> undef, i32 %66, i64 0
  %68 = insertelement <2 x i32> %67, i32 %64, i64 1
  %69 = bitcast <2 x i32> %65 to double
  tail call void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t* %1, double %69, <4 x float> %55) #4
  %70 = bitcast <2 x i32> %68 to double
  tail call void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t* %1, double %70, <4 x float> %61) #4
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z14convert_float4Dv4_h(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local float @ran1(i32, i32*) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local double @BoxMuller(double) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t*, double, <4 x float>) local_unnamed_addr #2

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!3 = !{i32 1, i32 1, i32 0}
!4 = !{!"none", !"write_only", !"none"}
!5 = !{!"uchar4*", !"image2d_t", !"int"}
!6 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"image2d_t", !"int"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{float 2.500000e+00}
