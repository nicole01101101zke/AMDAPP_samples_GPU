; ModuleID = '../AMDAPP_samples/cl/BlackScholesDP/BlackScholesDP_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/BlackScholesDP/BlackScholesDP_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local void @phi(<4 x double>* nocapture readonly byval(<4 x double>) align 32 %0, <4 x double>* nocapture %1) local_unnamed_addr #0 {
  %3 = alloca <4 x double>, align 32
  %4 = alloca <4 x double>, align 32
  %5 = load <4 x double>, <4 x double>* %0, align 32, !tbaa !3
  store <4 x double> %5, <4 x double>* %3, align 32, !tbaa !3
  %6 = tail call <4 x double> @_Z4fabsDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %3) #6
  %7 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %6, <4 x double> <double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E>, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>)
  %8 = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %7
  %9 = fneg <4 x double> %5
  %10 = fmul <4 x double> %5, %9
  %11 = fmul <4 x double> %10, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  store <4 x double> %11, <4 x double>* %4, align 32, !tbaa !3
  %12 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %4) #6
  %13 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %8, <4 x double> <double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943>, <4 x double> <double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0>)
  %14 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %8, <4 x double> %13, <4 x double> <double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68>)
  %15 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %8, <4 x double> %14, <4 x double> <double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B>)
  %16 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %8, <4 x double> %15, <4 x double> <double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC>)
  %17 = fmul <4 x double> %12, <double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00>
  %18 = fmul <4 x double> %8, %17
  %19 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %18, <4 x double> %16, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>)
  %20 = fcmp uge <4 x double> %5, zeroinitializer
  %21 = fsub <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %19
  %22 = select <4 x i1> %20, <4 x double> %19, <4 x double> %21
  store <4 x double> %22, <4 x double>* %1, align 32, !tbaa !3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z4fabsDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x double> @llvm.fmuladd.v4f64(<4 x double>, <4 x double>, <4 x double>) #3

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z3expDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @blackScholes(<4 x double>* nocapture readonly %0, i32 %1, <4 x double>* nocapture %2, <4 x double>* nocapture %3) local_unnamed_addr #4 !kernel_arg_addr_space !6 !kernel_arg_access_qual !7 !kernel_arg_type !8 !kernel_arg_base_type !9 !kernel_arg_type_qual !10 {
  %5 = alloca <4 x double>, align 32
  %6 = alloca <4 x double>, align 32
  %7 = alloca <4 x double>, align 32
  %8 = alloca <4 x double>, align 32
  %9 = alloca <4 x double>, align 32
  %10 = alloca <4 x double>, align 32
  %11 = alloca <4 x double>, align 32
  %12 = alloca <4 x double>, align 32
  %13 = alloca <4 x double>, align 32
  %14 = alloca <4 x double>, align 32
  %15 = alloca <4 x double>, align 32
  %16 = tail call i64 @_Z13get_global_idj(i32 0) #7
  %17 = tail call i64 @_Z13get_global_idj(i32 1) #7
  %18 = sext i32 %1 to i64
  %19 = mul i64 %17, %18
  %20 = add i64 %19, %16
  %21 = getelementptr inbounds <4 x double>, <4 x double>* %0, i64 %20
  %22 = load <4 x double>, <4 x double>* %21, align 32, !tbaa !3
  %23 = fsub <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %22
  %24 = fmul <4 x double> %23, <double 1.000000e+02, double 1.000000e+02, double 1.000000e+02, double 1.000000e+02>
  %25 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %22, <4 x double> <double 1.000000e+01, double 1.000000e+01, double 1.000000e+01, double 1.000000e+01>, <4 x double> %24)
  %26 = fmul <4 x double> %23, <double 1.000000e+01, double 1.000000e+01, double 1.000000e+01, double 1.000000e+01>
  %27 = fadd <4 x double> %22, %26
  %28 = fmul <4 x double> %23, <double 5.000000e-02, double 5.000000e-02, double 5.000000e-02, double 5.000000e-02>
  %29 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %22, <4 x double> <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, <4 x double> %28)
  %30 = fmul <4 x double> %23, <double 1.000000e-01, double 1.000000e-01, double 1.000000e-01, double 1.000000e-01>
  %31 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %22, <4 x double> <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, <4 x double> %30)
  store <4 x double> %27, <4 x double>* %13, align 32, !tbaa !3
  %32 = tail call <4 x double> @_Z4sqrtDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %13) #6
  %33 = fmul <4 x double> %32, %31
  %34 = fdiv <4 x double> %25, %25
  store <4 x double> %34, <4 x double>* %14, align 32, !tbaa !3
  %35 = tail call <4 x double> @_Z3logDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %14) #6
  %36 = fmul <4 x double> %31, %31
  %37 = fmul <4 x double> %36, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %38 = fadd <4 x double> %29, %37
  %39 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %38, <4 x double> %27, <4 x double> %35)
  %40 = fdiv <4 x double> %39, %33
  %41 = fsub <4 x double> %40, %33
  %42 = fneg <4 x double> %29
  %43 = fmul <4 x double> %27, %42
  store <4 x double> %43, <4 x double>* %15, align 32, !tbaa !3
  %44 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %15) #6
  %45 = fmul <4 x double> %25, %44
  %46 = bitcast <4 x double>* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %46)
  %47 = bitcast <4 x double>* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %47)
  store <4 x double> %40, <4 x double>* %11, align 32, !tbaa !3
  %48 = tail call <4 x double> @_Z4fabsDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %11) #6
  %49 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %48, <4 x double> <double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E>, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %50 = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %49
  %51 = fneg <4 x double> %40
  %52 = fmul <4 x double> %40, %51
  %53 = fmul <4 x double> %52, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  store <4 x double> %53, <4 x double>* %12, align 32, !tbaa !3
  %54 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %12) #6
  %55 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %50, <4 x double> <double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943>, <4 x double> <double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0>) #8
  %56 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %50, <4 x double> %55, <4 x double> <double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68>) #8
  %57 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %50, <4 x double> %56, <4 x double> <double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B>) #8
  %58 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %50, <4 x double> %57, <4 x double> <double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC>) #8
  %59 = fmul <4 x double> %54, <double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00>
  %60 = fmul <4 x double> %50, %59
  %61 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %60, <4 x double> %58, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %62 = fcmp uge <4 x double> %40, zeroinitializer
  %63 = fsub <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %61
  %64 = select <4 x i1> %62, <4 x double> %61, <4 x double> %63
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %46)
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %47)
  %65 = bitcast <4 x double>* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %65)
  %66 = bitcast <4 x double>* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %66)
  store <4 x double> %41, <4 x double>* %9, align 32, !tbaa !3
  %67 = tail call <4 x double> @_Z4fabsDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %9) #6
  %68 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %67, <4 x double> <double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E>, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %69 = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %68
  %70 = fneg <4 x double> %41
  %71 = fmul <4 x double> %41, %70
  %72 = fmul <4 x double> %71, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  store <4 x double> %72, <4 x double>* %10, align 32, !tbaa !3
  %73 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %10) #6
  %74 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %69, <4 x double> <double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943>, <4 x double> <double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0>) #8
  %75 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %69, <4 x double> %74, <4 x double> <double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68>) #8
  %76 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %69, <4 x double> %75, <4 x double> <double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B>) #8
  %77 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %69, <4 x double> %76, <4 x double> <double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC>) #8
  %78 = fmul <4 x double> %73, <double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00>
  %79 = fmul <4 x double> %69, %78
  %80 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %79, <4 x double> %77, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %81 = fcmp uge <4 x double> %41, zeroinitializer
  %82 = fsub <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %80
  %83 = select <4 x i1> %81, <4 x double> %80, <4 x double> %82
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %65)
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %66)
  %84 = fneg <4 x double> %45
  %85 = fmul <4 x double> %83, %84
  %86 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %25, <4 x double> %64, <4 x double> %85)
  %87 = getelementptr inbounds <4 x double>, <4 x double>* %2, i64 %20
  store <4 x double> %86, <4 x double>* %87, align 32, !tbaa !3
  %88 = bitcast <4 x double>* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %88)
  %89 = bitcast <4 x double>* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %89)
  store <4 x double> %51, <4 x double>* %7, align 32, !tbaa !3
  %90 = tail call <4 x double> @_Z4fabsDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %7) #6
  %91 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %90, <4 x double> <double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E>, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %92 = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %91
  store <4 x double> %53, <4 x double>* %8, align 32, !tbaa !3
  %93 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %8) #6
  %94 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %92, <4 x double> <double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943>, <4 x double> <double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0>) #8
  %95 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %92, <4 x double> %94, <4 x double> <double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68>) #8
  %96 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %92, <4 x double> %95, <4 x double> <double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B>) #8
  %97 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %92, <4 x double> %96, <4 x double> <double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC>) #8
  %98 = fmul <4 x double> %93, <double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00>
  %99 = fmul <4 x double> %92, %98
  %100 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %99, <4 x double> %97, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %101 = fcmp ule <4 x double> %40, zeroinitializer
  %102 = fsub <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %100
  %103 = select <4 x i1> %101, <4 x double> %100, <4 x double> %102
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %88)
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %89)
  %104 = bitcast <4 x double>* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %104)
  %105 = bitcast <4 x double>* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %105)
  store <4 x double> %70, <4 x double>* %5, align 32, !tbaa !3
  %106 = tail call <4 x double> @_Z4fabsDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %5) #6
  %107 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %106, <4 x double> <double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E, double 0x3FCDA6711871100E>, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %108 = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %107
  store <4 x double> %72, <4 x double>* %6, align 32, !tbaa !3
  %109 = tail call <4 x double> @_Z3expDv4_d(<4 x double>* nonnull byval(<4 x double>) align 32 %6) #6
  %110 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %108, <4 x double> <double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943, double 0x3FF548CDD6F42943>, <4 x double> <double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0, double 0xBFFD23DD4EF278D0>) #8
  %111 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %108, <4 x double> %110, <4 x double> <double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68, double 0x3FFC80EF025F5E68>) #8
  %112 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %108, <4 x double> %111, <4 x double> <double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B, double 0xBFD6D1F0E5A8325B>) #8
  %113 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %108, <4 x double> %112, <4 x double> <double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC, double 0x3FD470BF3A92F8EC>) #8
  %114 = fmul <4 x double> %109, <double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00, double 0xBFD988453365DE00>
  %115 = fmul <4 x double> %108, %114
  %116 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %115, <4 x double> %113, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #8
  %117 = fcmp ule <4 x double> %41, zeroinitializer
  %118 = fsub <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %116
  %119 = select <4 x i1> %117, <4 x double> %116, <4 x double> %118
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %104)
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %105)
  %120 = fneg <4 x double> %25
  %121 = fmul <4 x double> %103, %120
  %122 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %45, <4 x double> %119, <4 x double> %121)
  %123 = getelementptr inbounds <4 x double>, <4 x double>* %3, i64 %20
  store <4 x double> %122, <4 x double>* %123, align 32, !tbaa !3
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #5

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z4sqrtDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare dso_local <4 x double> @_Z3logDv4_d(<4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #2

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { convergent nounwind }
attributes #7 = { convergent nounwind readnone }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i32 1, i32 0, i32 1, i32 1}
!7 = !{!"none", !"none", !"none", !"none"}
!8 = !{!"double4*", !"int", !"double4*", !"double4*"}
!9 = !{!"double __attribute__((ext_vector_type(4)))*", !"int", !"double __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*"}
!10 = !{!"const", !"", !"", !""}
