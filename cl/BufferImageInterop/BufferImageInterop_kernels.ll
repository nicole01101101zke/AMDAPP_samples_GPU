; ModuleID = '../AMDAPP_samples/cl/BufferImageInterop/BufferImageInterop_kernels.cl'
source_filename = "../AMDAPP_samples/cl/BufferImageInterop/BufferImageInterop_kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%opencl.image2d_ro_t = type opaque
%opencl.image2d_wo_t = type opaque
%opencl.sampler_t = type opaque

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @sepiaToning(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %3 = tail call i64 @_Z13get_global_idj(i32 0) #6
  %4 = tail call i64 @_Z13get_global_idj(i32 1) #6
  %5 = tail call i64 @_Z15get_global_sizej(i32 0) #6
  %6 = mul i64 %5, %4
  %7 = add i64 %6, %3
  %8 = shl i64 %7, 32
  %9 = ashr exact i64 %8, 32
  %10 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %9
  %11 = load <4 x i8>, <4 x i8>* %10, align 4
  %12 = extractelement <4 x i8> %11, i64 0
  %13 = extractelement <4 x i8> %11, i64 1
  %14 = extractelement <4 x i8> %11, i64 2
  %15 = uitofp i8 %12 to double
  %16 = uitofp i8 %13 to double
  %17 = fmul double %16, 5.900000e-01
  %18 = tail call double @llvm.fmuladd.f64(double %15, double 3.000000e-01, double %17)
  %19 = uitofp i8 %14 to double
  %20 = tail call double @llvm.fmuladd.f64(double %19, double 1.100000e-01, double %18)
  %21 = fptrunc double %20 to float
  %22 = fpext float %21 to double
  %23 = fadd double %22, 0x40597851E0333333
  %24 = fptosi double %23 to i32
  %25 = icmp slt i32 %24, 255
  %26 = select i1 %25, i32 %24, i32 255
  %27 = fadd double %22, 0x404DF851DE333332
  %28 = fptosi double %27 to i32
  %29 = icmp slt i32 %28, 255
  %30 = select i1 %29, i32 %28, i32 255
  %31 = fadd double %22, 0x40322E1472CCCCCD
  %32 = fptosi double %31 to i32
  %33 = icmp slt i32 %32, 255
  %34 = select i1 %33, i32 %32, i32 255
  %35 = trunc i32 %26 to i8
  %36 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %9
  %37 = load <4 x i8>, <4 x i8>* %36, align 4
  %38 = insertelement <4 x i8> %37, i8 %35, i64 0
  %39 = trunc i32 %30 to i8
  %40 = insertelement <4 x i8> %38, i8 %39, i64 1
  %41 = trunc i32 %34 to i8
  %42 = insertelement <4 x i8> %40, i8 %41, i64 2
  store <4 x i8> %42, <4 x i8>* %36, align 4
  %43 = load <4 x i8>, <4 x i8>* %10, align 4
  %44 = shufflevector <4 x i8> %42, <4 x i8> %43, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  store <4 x i8> %44, <4 x i8>* %36, align 4
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @imageReverse(%opencl.image2d_ro_t* %0, %opencl.image2d_wo_t* %1) local_unnamed_addr #3 !kernel_arg_addr_space !3 !kernel_arg_access_qual !8 !kernel_arg_type !9 !kernel_arg_base_type !9 !kernel_arg_type_qual !7 {
  %3 = tail call i64 @_Z13get_global_idj(i32 0) #6
  %4 = trunc i64 %3 to i32
  %5 = tail call i64 @_Z13get_global_idj(i32 1) #6
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z15get_global_sizej(i32 0) #6
  %8 = trunc i64 %7 to i32
  %9 = insertelement <2 x i32> undef, i32 %4, i64 0
  %10 = insertelement <2 x i32> %9, i32 %6, i64 1
  %11 = tail call %opencl.sampler_t* @__translate_sampler_initializer(i32 20) #7
  %12 = bitcast <2 x i32> %10 to double
  %13 = tail call <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %0, %opencl.sampler_t* %11, double %12) #8
  %14 = xor i32 %4, -1
  %15 = add i32 %8, %14
  %16 = insertelement <2 x i32> %10, i32 %15, i64 0
  %17 = bitcast <2 x i32> %16 to double
  tail call void @_Z13write_imageui14ocl_image2d_woDv2_iDv4_j(%opencl.image2d_wo_t* %1, double %17, <4 x i32> %13) #9
  ret void
}

declare dso_local %opencl.sampler_t* @__translate_sampler_initializer(i32) local_unnamed_addr

; Function Attrs: convergent nounwind readonly
declare dso_local <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t*, %opencl.sampler_t*, double) local_unnamed_addr #4

; Function Attrs: convergent
declare dso_local void @_Z13write_imageui14ocl_image2d_woDv2_iDv4_j(%opencl.image2d_wo_t*, double, <4 x i32>) local_unnamed_addr #5

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { convergent nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { convergent nounwind readonly }
attributes #9 = { convergent nounwind }

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
!8 = !{!"read_only", !"write_only"}
!9 = !{!"image2d_t", !"image2d_t"}
