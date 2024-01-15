; ModuleID = '../AMDAPP_samples/cl/ImageOverlap/ImageOverlap_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/ImageOverlap/ImageOverlap_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%opencl.image2d_ro_t = type opaque
%opencl.image2d_wo_t = type opaque
%opencl.sampler_t = type opaque

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @OverLap(%opencl.image2d_ro_t* %0, %opencl.image2d_ro_t* %1, %opencl.image2d_wo_t* %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %7 = trunc i64 %6 to i32
  %8 = insertelement <2 x i32> undef, i32 %5, i64 0
  %9 = insertelement <2 x i32> %8, i32 %7, i64 1
  %10 = tail call %opencl.sampler_t* @__translate_sampler_initializer(i32 0) #5
  %11 = bitcast <2 x i32> %9 to double
  %12 = tail call <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %0, %opencl.sampler_t* %10, double %11) #6
  %13 = tail call <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %1, %opencl.sampler_t* %10, double %11) #6
  %14 = add <4 x i32> %13, %12
  tail call void @_Z13write_imageui14ocl_image2d_woDv2_iDv4_j(%opencl.image2d_wo_t* %2, double %11, <4 x i32> %14) #7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

declare dso_local %opencl.sampler_t* @__translate_sampler_initializer(i32) local_unnamed_addr

; Function Attrs: convergent nounwind readonly
declare dso_local <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t*, %opencl.sampler_t*, double) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local void @_Z13write_imageui14ocl_image2d_woDv2_iDv4_j(%opencl.image2d_wo_t*, double, <4 x i32>) local_unnamed_addr #3

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { convergent nounwind readonly }
attributes #7 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1}
!4 = !{!"read_only", !"read_only", !"write_only"}
!5 = !{!"image2d_t", !"image2d_t", !"image2d_t"}
!6 = !{!"", !"", !""}
