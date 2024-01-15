; ModuleID = '../AMDAPP_samples/cl/ImageBandwidth/ImageBandwidth_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/ImageBandwidth/ImageBandwidth_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%opencl.image2d_ro_t = type opaque
%opencl.sampler_t = type opaque
%opencl.image2d_wo_t = type opaque

@read_kernel.lcount = internal global i32 undef, align 4

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @read_kernel(%opencl.image2d_ro_t* %0, i32* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %76, label %7

7:                                                ; preds = %5
  %8 = tail call %opencl.sampler_t* @__translate_sampler_initializer(i32 18) #4
  %9 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %10 = trunc i64 %9 to i32
  %11 = insertelement <2 x i32> <i32 undef, i32 0>, i32 %10, i32 0
  %12 = tail call i64 @_Z12get_local_idj(i32 0) #5
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %7
  %15 = tail call i64 @_Z12get_local_idj(i32 1) #5
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  store i32 0, i32* @read_kernel.lcount, align 4, !tbaa !7
  br label %18

18:                                               ; preds = %7, %14, %17
  tail call void @_Z7barrierj(i32 1) #6
  %19 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %20 = icmp eq i32 %2, 0
  br label %28

21:                                               ; preds = %63
  %22 = tail call i32 @_Z10atomic_addPU7CLlocalVjj(i32* nonnull @read_kernel.lcount, i32 %65) #6
  tail call void @_Z7barrierj(i32 1) #6
  %23 = tail call i64 @_Z12get_group_idj(i32 1) #5
  %24 = tail call i64 @_Z14get_num_groupsj(i32 0) #5
  %25 = mul i64 %24, %23
  %26 = tail call i64 @_Z12get_group_idj(i32 0) #5
  %27 = add i64 %25, %26
  br i1 %13, label %68, label %76

28:                                               ; preds = %18, %63
  %29 = phi i32 [ 0, %18 ], [ %65, %63 ]
  %30 = phi i32 [ 0, %18 ], [ %66, %63 ]
  %31 = phi <2 x i32> [ %11, %18 ], [ %64, %63 ]
  br i1 %20, label %63, label %32

32:                                               ; preds = %28
  %33 = tail call i64 @_Z15get_global_sizej(i32 1) #5
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi i32 [ %29, %32 ], [ %58, %34 ]
  %36 = phi i32 [ 0, %32 ], [ %59, %34 ]
  %37 = phi i64 [ %19, %32 ], [ %61, %34 ]
  %38 = phi <2 x i32> [ %31, %32 ], [ %40, %34 ]
  %39 = trunc i64 %37 to i32
  %40 = insertelement <2 x i32> %38, i32 %39, i64 1
  %41 = bitcast <2 x i32> %40 to double
  %42 = tail call <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t* %0, %opencl.sampler_t* %8, double %41) #7
  %43 = extractelement <4 x i32> %42, i64 0
  %44 = icmp eq i32 %43, %3
  %45 = zext i1 %44 to i32
  %46 = add i32 %35, %45
  %47 = extractelement <4 x i32> %42, i64 1
  %48 = icmp eq i32 %47, %3
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = extractelement <4 x i32> %42, i64 2
  %52 = icmp eq i32 %51, %3
  %53 = zext i1 %52 to i32
  %54 = add i32 %50, %53
  %55 = extractelement <4 x i32> %42, i64 3
  %56 = icmp eq i32 %55, %3
  %57 = zext i1 %56 to i32
  %58 = add i32 %54, %57
  %59 = add nuw i32 %36, 1
  %60 = and i64 %37, 4294967295
  %61 = add i64 %33, %60
  %62 = icmp eq i32 %59, %2
  br i1 %62, label %63, label %34

63:                                               ; preds = %34, %28
  %64 = phi <2 x i32> [ %31, %28 ], [ %40, %34 ]
  %65 = phi i32 [ %29, %28 ], [ %58, %34 ]
  %66 = add nuw nsw i32 %30, 1
  %67 = icmp ult i32 %66, %4
  br i1 %67, label %28, label %21

68:                                               ; preds = %21
  %69 = tail call i64 @_Z12get_local_idj(i32 1) #5
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %71, label %76

71:                                               ; preds = %68
  %72 = load i32, i32* @read_kernel.lcount, align 4, !tbaa !7
  %73 = udiv i32 %72, %4
  %74 = and i64 %27, 4294967295
  %75 = getelementptr inbounds i32, i32* %1, i64 %74
  store i32 %73, i32* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %21, %68, %71, %5
  ret void
}

declare dso_local %opencl.sampler_t* @__translate_sampler_initializer(i32) local_unnamed_addr

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readonly
declare dso_local <4 x i32> @_Z12read_imageui14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t*, %opencl.sampler_t*, double) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_addPU7CLlocalVjj(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_num_groupsj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @write_kernel(i32* nocapture readnone %0, %opencl.image2d_wo_t* %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !11 !kernel_arg_type !12 !kernel_arg_base_type !12 !kernel_arg_type_qual !6 {
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %34, label %7

7:                                                ; preds = %5
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %9 = insertelement <4 x i32> undef, i32 %3, i32 0
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer
  %11 = trunc i64 %8 to i32
  %12 = insertelement <2 x i32> <i32 undef, i32 0>, i32 %11, i32 0
  %13 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %14 = icmp eq i32 %2, 0
  br label %15

15:                                               ; preds = %30, %7
  %16 = phi i32 [ 0, %7 ], [ %32, %30 ]
  %17 = phi <2 x i32> [ %12, %7 ], [ %31, %30 ]
  br i1 %14, label %30, label %18

18:                                               ; preds = %15, %18
  %19 = phi i32 [ %25, %18 ], [ 0, %15 ]
  %20 = phi i64 [ %28, %18 ], [ %13, %15 ]
  %21 = phi <2 x i32> [ %23, %18 ], [ %17, %15 ]
  %22 = trunc i64 %20 to i32
  %23 = insertelement <2 x i32> %21, i32 %22, i64 1
  %24 = bitcast <2 x i32> %23 to double
  tail call void @_Z13write_imageui14ocl_image2d_woDv2_iDv4_j(%opencl.image2d_wo_t* %1, double %24, <4 x i32> %10) #6
  %25 = add nuw i32 %19, 1
  %26 = tail call i64 @_Z15get_global_sizej(i32 1) #5
  %27 = and i64 %20, 4294967295
  %28 = add i64 %26, %27
  %29 = icmp eq i32 %25, %2
  br i1 %29, label %30, label %18

30:                                               ; preds = %18, %15
  %31 = phi <2 x i32> [ %17, %15 ], [ %23, %18 ]
  %32 = add nuw i32 %16, 1
  %33 = icmp eq i32 %32, %4
  br i1 %33, label %34, label %15

34:                                               ; preds = %30, %5
  ret void
}

; Function Attrs: convergent
declare dso_local void @_Z13write_imageui14ocl_image2d_woDv2_iDv4_j(%opencl.image2d_wo_t*, double, <4 x i32>) local_unnamed_addr #2

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind }
attributes #7 = { convergent nounwind readonly }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"read_only", !"none", !"none", !"none", !"none"}
!5 = !{!"image2d_t", !"uint*", !"uint", !"uint", !"uint"}
!6 = !{!"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"none", !"write_only", !"none", !"none", !"none"}
!12 = !{!"uint*", !"image2d_t", !"uint", !"uint", !"uint"}
