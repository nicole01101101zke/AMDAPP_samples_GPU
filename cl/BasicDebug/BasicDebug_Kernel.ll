; ModuleID = '../AMDAPP_samples/cl/BasicDebug/BasicDebug_Kernel.cl'
source_filename = "../AMDAPP_samples/cl/BasicDebug/BasicDebug_Kernel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [36 x i8] c"Output vector data: f4 = %2.2v4hlf\0A\00", align 1
@printfKernel.data = internal unnamed_addr global [10 x i32] undef, align 16
@.str.1 = private unnamed_addr constant [19 x i8] c"\09This is group %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"\09Output LDS data:  %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"the global ID of this thread is : %d\0A\00", align 1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @printfKernel(float* nocapture readonly %0) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %2 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %3 = trunc i64 %2 to i32
  %4 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %7 = trunc i64 %6 to i32
  %8 = icmp eq i32 %3, 10
  br i1 %8, label %9, label %22

9:                                                ; preds = %1
  %10 = load float, float* %0, align 4, !tbaa !7
  %11 = insertelement <4 x float> undef, float %10, i32 0
  %12 = getelementptr inbounds float, float* %0, i64 1
  %13 = load float, float* %12, align 4, !tbaa !7
  %14 = insertelement <4 x float> %11, float %13, i32 1
  %15 = getelementptr inbounds float, float* %0, i64 2
  %16 = load float, float* %15, align 4, !tbaa !7
  %17 = insertelement <4 x float> %14, float %16, i32 2
  %18 = getelementptr inbounds float, float* %0, i64 3
  %19 = load float, float* %18, align 4, !tbaa !7
  %20 = insertelement <4 x float> %17, float %19, i32 3
  %21 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i64 0, i64 0), <4 x float> %20) #5
  br label %22

22:                                               ; preds = %9, %1
  %23 = and i64 %6, 4294967295
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* @printfKernel.data, i64 0, i64 %23
  store i32 %7, i32* %24, align 4, !tbaa !11
  tail call void @_Z7barrierj(i32 1) #6
  %25 = icmp eq i32 %7, 10
  br i1 %25, label %26, label %30

26:                                               ; preds = %22
  %27 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %5) #5
  %28 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @printfKernel.data, i64 1, i64 0), align 8, !tbaa !11
  %29 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0), i32 %28) #5
  br label %30

30:                                               ; preds = %26, %22
  %31 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), i32 %3) #5
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #3

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent }
attributes #6 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1}
!4 = !{!"none"}
!5 = !{!"float*"}
!6 = !{!""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
