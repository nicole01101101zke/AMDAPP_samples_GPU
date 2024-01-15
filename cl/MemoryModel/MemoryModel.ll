; ModuleID = '../AMDAPP_samples/cl/MemoryModel/MemoryModel.cl'
source_filename = "../AMDAPP_samples/cl/MemoryModel/MemoryModel.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@mask = dso_local local_unnamed_addr constant [4 x i32] [i32 1, i32 -1, i32 2, i32 -2], align 16
@MemoryModel.localBuffer = internal unnamed_addr global [64 x i32] undef, align 16

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @MemoryModel(i32* nocapture %0, i32* nocapture readonly %1) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %3 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %5 = getelementptr inbounds i32, i32* %1, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !7
  %7 = getelementptr inbounds [64 x i32], [64 x i32]* @MemoryModel.localBuffer, i64 0, i64 %3
  store i32 %6, i32* %7, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #4
  %8 = and i64 %3, 63
  %9 = getelementptr inbounds [64 x i32], [64 x i32]* @MemoryModel.localBuffer, i64 0, i64 %8
  %10 = load i32, i32* %9, align 4, !tbaa !7
  %11 = add i64 %3, 1
  %12 = and i64 %11, 63
  %13 = getelementptr inbounds [64 x i32], [64 x i32]* @MemoryModel.localBuffer, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !7
  %15 = add nsw i32 %14, %10
  %16 = add i64 %3, 2
  %17 = and i64 %16, 63
  %18 = getelementptr inbounds [64 x i32], [64 x i32]* @MemoryModel.localBuffer, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !7
  %20 = add nsw i32 %19, %15
  %21 = add i64 %3, 3
  %22 = and i64 %21, 63
  %23 = getelementptr inbounds [64 x i32], [64 x i32]* @MemoryModel.localBuffer, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !7
  %25 = add nsw i32 %24, %20
  %26 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %27 = and i64 %26, 3
  %28 = getelementptr inbounds [4 x i32], [4 x i32]* @mask, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !7
  %30 = mul nsw i32 %29, %25
  %31 = getelementptr inbounds i32, i32* %0, i64 %4
  store i32 %30, i32* %31, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

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
!3 = !{i32 1, i32 1}
!4 = !{!"none", !"none"}
!5 = !{!"int*", !"int*"}
!6 = !{!"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
