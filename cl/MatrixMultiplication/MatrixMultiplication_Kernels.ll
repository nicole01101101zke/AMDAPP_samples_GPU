; ModuleID = '../AMDAPP_samples/cl/MatrixMultiplication/MatrixMultiplication_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/MatrixMultiplication/MatrixMultiplication_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @mmmKernel(<4 x float>* nocapture readonly %0, <4 x float>* nocapture readonly %1, <4 x float>* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %9 = trunc i64 %8 to i32
  %10 = lshr i32 %4, 2
  %11 = icmp eq i32 %3, 0
  %12 = shl i32 %9, 2
  br i1 %11, label %13, label %17

13:                                               ; preds = %5
  %14 = or i32 %12, 1
  %15 = or i32 %12, 2
  %16 = or i32 %12, 3
  br label %27

17:                                               ; preds = %5
  %18 = lshr i32 %3, 2
  %19 = mul i32 %12, %18
  %20 = or i32 %12, 1
  %21 = mul i32 %20, %18
  %22 = or i32 %12, 2
  %23 = mul i32 %22, %18
  %24 = or i32 %12, 3
  %25 = mul i32 %24, %18
  %26 = zext i32 %3 to i64
  br label %51

27:                                               ; preds = %51, %13
  %28 = phi i32 [ %16, %13 ], [ %24, %51 ]
  %29 = phi i32 [ %15, %13 ], [ %22, %51 ]
  %30 = phi i32 [ %14, %13 ], [ %20, %51 ]
  %31 = phi <4 x float> [ zeroinitializer, %13 ], [ %245, %51 ]
  %32 = phi <4 x float> [ zeroinitializer, %13 ], [ %213, %51 ]
  %33 = phi <4 x float> [ zeroinitializer, %13 ], [ %181, %51 ]
  %34 = phi <4 x float> [ zeroinitializer, %13 ], [ %149, %51 ]
  %35 = mul i32 %12, %10
  %36 = add i32 %35, %7
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %37
  store <4 x float> %34, <4 x float>* %38, align 16, !tbaa !8
  %39 = mul i32 %30, %10
  %40 = add i32 %39, %7
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %41
  store <4 x float> %33, <4 x float>* %42, align 16, !tbaa !8
  %43 = mul i32 %29, %10
  %44 = add i32 %43, %7
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %45
  store <4 x float> %32, <4 x float>* %46, align 16, !tbaa !8
  %47 = mul i32 %28, %10
  %48 = add i32 %47, %7
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %49
  store <4 x float> %31, <4 x float>* %50, align 16, !tbaa !8
  ret void

51:                                               ; preds = %17, %51
  %52 = phi i64 [ 0, %17 ], [ %246, %51 ]
  %53 = phi <4 x float> [ zeroinitializer, %17 ], [ %149, %51 ]
  %54 = phi <4 x float> [ zeroinitializer, %17 ], [ %181, %51 ]
  %55 = phi <4 x float> [ zeroinitializer, %17 ], [ %213, %51 ]
  %56 = phi <4 x float> [ zeroinitializer, %17 ], [ %245, %51 ]
  %57 = lshr exact i64 %52, 2
  %58 = trunc i64 %57 to i32
  %59 = add i32 %19, %58
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %60
  %62 = load <4 x float>, <4 x float>* %61, align 16, !tbaa !8
  %63 = add i32 %21, %58
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %64
  %66 = load <4 x float>, <4 x float>* %65, align 16, !tbaa !8
  %67 = add i32 %23, %58
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %68
  %70 = load <4 x float>, <4 x float>* %69, align 16, !tbaa !8
  %71 = add i32 %25, %58
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %72
  %74 = load <4 x float>, <4 x float>* %73, align 16, !tbaa !8
  %75 = trunc i64 %52 to i32
  %76 = mul i32 %10, %75
  %77 = add i32 %76, %7
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %78
  %80 = load <4 x float>, <4 x float>* %79, align 16, !tbaa !8
  %81 = trunc i64 %52 to i32
  %82 = or i32 %81, 1
  %83 = mul i32 %82, %10
  %84 = add i32 %83, %7
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %85
  %87 = load <4 x float>, <4 x float>* %86, align 16, !tbaa !8
  %88 = trunc i64 %52 to i32
  %89 = or i32 %88, 2
  %90 = mul i32 %89, %10
  %91 = add i32 %90, %7
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %92
  %94 = load <4 x float>, <4 x float>* %93, align 16, !tbaa !8
  %95 = trunc i64 %52 to i32
  %96 = or i32 %95, 3
  %97 = mul i32 %96, %10
  %98 = add i32 %97, %7
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %99
  %101 = load <4 x float>, <4 x float>* %100, align 16, !tbaa !8
  %102 = extractelement <4 x float> %62, i64 0
  %103 = extractelement <4 x float> %80, i64 0
  %104 = extractelement <4 x float> %62, i64 1
  %105 = extractelement <4 x float> %87, i64 0
  %106 = fmul float %104, %105
  %107 = tail call float @llvm.fmuladd.f32(float %102, float %103, float %106)
  %108 = extractelement <4 x float> %62, i64 2
  %109 = extractelement <4 x float> %94, i64 0
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float %107)
  %111 = extractelement <4 x float> %62, i64 3
  %112 = extractelement <4 x float> %101, i64 0
  %113 = tail call float @llvm.fmuladd.f32(float %111, float %112, float %110)
  %114 = extractelement <4 x float> %53, i64 0
  %115 = fadd float %114, %113
  %116 = insertelement <4 x float> undef, float %115, i64 0
  %117 = extractelement <4 x float> %80, i64 1
  %118 = extractelement <4 x float> %87, i64 1
  %119 = fmul float %104, %118
  %120 = tail call float @llvm.fmuladd.f32(float %102, float %117, float %119)
  %121 = extractelement <4 x float> %94, i64 1
  %122 = tail call float @llvm.fmuladd.f32(float %108, float %121, float %120)
  %123 = extractelement <4 x float> %101, i64 1
  %124 = tail call float @llvm.fmuladd.f32(float %111, float %123, float %122)
  %125 = extractelement <4 x float> %53, i64 1
  %126 = fadd float %125, %124
  %127 = insertelement <4 x float> %116, float %126, i64 1
  %128 = extractelement <4 x float> %80, i64 2
  %129 = extractelement <4 x float> %87, i64 2
  %130 = fmul float %104, %129
  %131 = tail call float @llvm.fmuladd.f32(float %102, float %128, float %130)
  %132 = extractelement <4 x float> %94, i64 2
  %133 = tail call float @llvm.fmuladd.f32(float %108, float %132, float %131)
  %134 = extractelement <4 x float> %101, i64 2
  %135 = tail call float @llvm.fmuladd.f32(float %111, float %134, float %133)
  %136 = extractelement <4 x float> %53, i64 2
  %137 = fadd float %136, %135
  %138 = insertelement <4 x float> %127, float %137, i64 2
  %139 = extractelement <4 x float> %80, i64 3
  %140 = extractelement <4 x float> %87, i64 3
  %141 = fmul float %104, %140
  %142 = tail call float @llvm.fmuladd.f32(float %102, float %139, float %141)
  %143 = extractelement <4 x float> %94, i64 3
  %144 = tail call float @llvm.fmuladd.f32(float %108, float %143, float %142)
  %145 = extractelement <4 x float> %101, i64 3
  %146 = tail call float @llvm.fmuladd.f32(float %111, float %145, float %144)
  %147 = extractelement <4 x float> %53, i64 3
  %148 = fadd float %147, %146
  %149 = insertelement <4 x float> %138, float %148, i64 3
  %150 = extractelement <4 x float> %66, i64 0
  %151 = extractelement <4 x float> %66, i64 1
  %152 = fmul float %151, %105
  %153 = tail call float @llvm.fmuladd.f32(float %150, float %103, float %152)
  %154 = extractelement <4 x float> %66, i64 2
  %155 = tail call float @llvm.fmuladd.f32(float %154, float %109, float %153)
  %156 = extractelement <4 x float> %66, i64 3
  %157 = tail call float @llvm.fmuladd.f32(float %156, float %112, float %155)
  %158 = extractelement <4 x float> %54, i64 0
  %159 = fadd float %158, %157
  %160 = insertelement <4 x float> undef, float %159, i64 0
  %161 = fmul float %151, %118
  %162 = tail call float @llvm.fmuladd.f32(float %150, float %117, float %161)
  %163 = tail call float @llvm.fmuladd.f32(float %154, float %121, float %162)
  %164 = tail call float @llvm.fmuladd.f32(float %156, float %123, float %163)
  %165 = extractelement <4 x float> %54, i64 1
  %166 = fadd float %165, %164
  %167 = insertelement <4 x float> %160, float %166, i64 1
  %168 = fmul float %151, %129
  %169 = tail call float @llvm.fmuladd.f32(float %150, float %128, float %168)
  %170 = tail call float @llvm.fmuladd.f32(float %154, float %132, float %169)
  %171 = tail call float @llvm.fmuladd.f32(float %156, float %134, float %170)
  %172 = extractelement <4 x float> %54, i64 2
  %173 = fadd float %172, %171
  %174 = insertelement <4 x float> %167, float %173, i64 2
  %175 = fmul float %151, %140
  %176 = tail call float @llvm.fmuladd.f32(float %150, float %139, float %175)
  %177 = tail call float @llvm.fmuladd.f32(float %154, float %143, float %176)
  %178 = tail call float @llvm.fmuladd.f32(float %156, float %145, float %177)
  %179 = extractelement <4 x float> %54, i64 3
  %180 = fadd float %179, %178
  %181 = insertelement <4 x float> %174, float %180, i64 3
  %182 = extractelement <4 x float> %70, i64 0
  %183 = extractelement <4 x float> %70, i64 1
  %184 = fmul float %183, %105
  %185 = tail call float @llvm.fmuladd.f32(float %182, float %103, float %184)
  %186 = extractelement <4 x float> %70, i64 2
  %187 = tail call float @llvm.fmuladd.f32(float %186, float %109, float %185)
  %188 = extractelement <4 x float> %70, i64 3
  %189 = tail call float @llvm.fmuladd.f32(float %188, float %112, float %187)
  %190 = extractelement <4 x float> %55, i64 0
  %191 = fadd float %190, %189
  %192 = insertelement <4 x float> undef, float %191, i64 0
  %193 = fmul float %183, %118
  %194 = tail call float @llvm.fmuladd.f32(float %182, float %117, float %193)
  %195 = tail call float @llvm.fmuladd.f32(float %186, float %121, float %194)
  %196 = tail call float @llvm.fmuladd.f32(float %188, float %123, float %195)
  %197 = extractelement <4 x float> %55, i64 1
  %198 = fadd float %197, %196
  %199 = insertelement <4 x float> %192, float %198, i64 1
  %200 = fmul float %183, %129
  %201 = tail call float @llvm.fmuladd.f32(float %182, float %128, float %200)
  %202 = tail call float @llvm.fmuladd.f32(float %186, float %132, float %201)
  %203 = tail call float @llvm.fmuladd.f32(float %188, float %134, float %202)
  %204 = extractelement <4 x float> %55, i64 2
  %205 = fadd float %204, %203
  %206 = insertelement <4 x float> %199, float %205, i64 2
  %207 = fmul float %183, %140
  %208 = tail call float @llvm.fmuladd.f32(float %182, float %139, float %207)
  %209 = tail call float @llvm.fmuladd.f32(float %186, float %143, float %208)
  %210 = tail call float @llvm.fmuladd.f32(float %188, float %145, float %209)
  %211 = extractelement <4 x float> %55, i64 3
  %212 = fadd float %211, %210
  %213 = insertelement <4 x float> %206, float %212, i64 3
  %214 = extractelement <4 x float> %74, i64 0
  %215 = extractelement <4 x float> %74, i64 1
  %216 = fmul float %215, %105
  %217 = tail call float @llvm.fmuladd.f32(float %214, float %103, float %216)
  %218 = extractelement <4 x float> %74, i64 2
  %219 = tail call float @llvm.fmuladd.f32(float %218, float %109, float %217)
  %220 = extractelement <4 x float> %74, i64 3
  %221 = tail call float @llvm.fmuladd.f32(float %220, float %112, float %219)
  %222 = extractelement <4 x float> %56, i64 0
  %223 = fadd float %222, %221
  %224 = insertelement <4 x float> undef, float %223, i64 0
  %225 = fmul float %215, %118
  %226 = tail call float @llvm.fmuladd.f32(float %214, float %117, float %225)
  %227 = tail call float @llvm.fmuladd.f32(float %218, float %121, float %226)
  %228 = tail call float @llvm.fmuladd.f32(float %220, float %123, float %227)
  %229 = extractelement <4 x float> %56, i64 1
  %230 = fadd float %229, %228
  %231 = insertelement <4 x float> %224, float %230, i64 1
  %232 = fmul float %215, %129
  %233 = tail call float @llvm.fmuladd.f32(float %214, float %128, float %232)
  %234 = tail call float @llvm.fmuladd.f32(float %218, float %132, float %233)
  %235 = tail call float @llvm.fmuladd.f32(float %220, float %134, float %234)
  %236 = extractelement <4 x float> %56, i64 2
  %237 = fadd float %236, %235
  %238 = insertelement <4 x float> %231, float %237, i64 2
  %239 = fmul float %215, %140
  %240 = tail call float @llvm.fmuladd.f32(float %214, float %139, float %239)
  %241 = tail call float @llvm.fmuladd.f32(float %218, float %143, float %240)
  %242 = tail call float @llvm.fmuladd.f32(float %220, float %145, float %241)
  %243 = extractelement <4 x float> %56, i64 3
  %244 = fadd float %243, %242
  %245 = insertelement <4 x float> %238, float %244, i64 3
  %246 = add nuw nsw i64 %52, 4
  %247 = icmp ult i64 %246, %26
  br i1 %247, label %51, label %27
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @mmmKernel_local(<4 x float>* nocapture readonly %0, <4 x float>* nocapture readonly %1, <4 x float>* nocapture %2, i32 %3, <4 x float>* nocapture %4) local_unnamed_addr #3 !kernel_arg_addr_space !11 !kernel_arg_access_qual !4 !kernel_arg_type !12 !kernel_arg_base_type !13 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z12get_local_idj(i32 0) #5
  %7 = tail call i64 @_Z14get_local_sizej(i32 0) #5
  %8 = tail call i64 @_Z12get_local_idj(i32 1) #5
  %9 = shl i64 %8, 2
  %10 = mul i64 %9, %7
  %11 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %12 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %13 = shl i64 %12, 2
  %14 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %15 = mul i64 %13, %14
  %16 = add i64 %15, %11
  %17 = sdiv i32 %3, 4
  %18 = sext i32 %17 to i64
  %19 = udiv i64 %18, %7
  %20 = icmp ugt i64 %7, %18
  br i1 %20, label %47, label %21

21:                                               ; preds = %5
  %22 = add i64 %10, %6
  %23 = mul i64 %13, %18
  %24 = add i64 %23, %6
  %25 = shl i64 %22, 32
  %26 = ashr exact i64 %25, 32
  %27 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %26
  %28 = add i64 %26, %7
  %29 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %28
  %30 = shl nsw i32 %17, 1
  %31 = shl i64 %7, 1
  %32 = add i64 %26, %31
  %33 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %32
  %34 = mul nsw i32 %17, 3
  %35 = mul i64 %7, 3
  %36 = add i64 %26, %35
  %37 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %36
  %38 = shl i64 %14, 2
  %39 = shl i64 %7, 2
  %40 = icmp eq i64 %39, 0
  %41 = or i64 %9, 1
  %42 = mul i64 %41, %7
  %43 = or i64 %9, 2
  %44 = mul i64 %43, %7
  %45 = or i64 %9, 3
  %46 = mul i64 %45, %7
  br label %63

47:                                               ; preds = %93, %5
  %48 = phi <4 x float> [ zeroinitializer, %5 ], [ %94, %93 ]
  %49 = phi <4 x float> [ zeroinitializer, %5 ], [ %95, %93 ]
  %50 = phi <4 x float> [ zeroinitializer, %5 ], [ %96, %93 ]
  %51 = phi <4 x float> [ zeroinitializer, %5 ], [ %97, %93 ]
  %52 = shl i64 %16, 32
  %53 = ashr exact i64 %52, 32
  %54 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %53
  store <4 x float> %51, <4 x float>* %54, align 16, !tbaa !8
  %55 = add i64 %53, %14
  %56 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %55
  store <4 x float> %50, <4 x float>* %56, align 16, !tbaa !8
  %57 = shl i64 %14, 1
  %58 = add i64 %53, %57
  %59 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %58
  store <4 x float> %49, <4 x float>* %59, align 16, !tbaa !8
  %60 = mul i64 %14, 3
  %61 = add i64 %53, %60
  %62 = getelementptr inbounds <4 x float>, <4 x float>* %2, i64 %61
  store <4 x float> %48, <4 x float>* %62, align 16, !tbaa !8
  ret void

63:                                               ; preds = %21, %93
  %64 = phi i64 [ 0, %21 ], [ %98, %93 ]
  %65 = phi <4 x float> [ zeroinitializer, %21 ], [ %97, %93 ]
  %66 = phi <4 x float> [ zeroinitializer, %21 ], [ %96, %93 ]
  %67 = phi <4 x float> [ zeroinitializer, %21 ], [ %95, %93 ]
  %68 = phi <4 x float> [ zeroinitializer, %21 ], [ %94, %93 ]
  %69 = mul i64 %64, %7
  %70 = add i64 %24, %69
  %71 = trunc i64 %70 to i32
  %72 = shl i64 %70, 32
  %73 = ashr exact i64 %72, 32
  %74 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %73
  %75 = load <4 x float>, <4 x float>* %74, align 16, !tbaa !8
  store <4 x float> %75, <4 x float>* %27, align 16, !tbaa !8
  %76 = add nsw i32 %17, %71
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %77
  %79 = load <4 x float>, <4 x float>* %78, align 16, !tbaa !8
  store <4 x float> %79, <4 x float>* %29, align 16, !tbaa !8
  %80 = add nsw i32 %30, %71
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %81
  %83 = load <4 x float>, <4 x float>* %82, align 16, !tbaa !8
  store <4 x float> %83, <4 x float>* %33, align 16, !tbaa !8
  %84 = add nsw i32 %34, %71
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %85
  %87 = load <4 x float>, <4 x float>* %86, align 16, !tbaa !8
  store <4 x float> %87, <4 x float>* %37, align 16, !tbaa !8
  tail call void @_Z7barrierj(i32 1) #6
  br i1 %40, label %93, label %88

88:                                               ; preds = %63
  %89 = mul i64 %38, %69
  %90 = add i64 %89, %11
  %91 = shl i64 %90, 32
  %92 = ashr exact i64 %91, 32
  br label %100

93:                                               ; preds = %100, %63
  %94 = phi <4 x float> [ %68, %63 ], [ %282, %100 ]
  %95 = phi <4 x float> [ %67, %63 ], [ %250, %100 ]
  %96 = phi <4 x float> [ %66, %63 ], [ %218, %100 ]
  %97 = phi <4 x float> [ %65, %63 ], [ %186, %100 ]
  tail call void @_Z7barrierj(i32 1) #6
  %98 = add nuw i64 %64, 1
  %99 = icmp ugt i64 %19, %98
  br i1 %99, label %63, label %47

100:                                              ; preds = %88, %100
  %101 = phi i64 [ 0, %88 ], [ %283, %100 ]
  %102 = phi <4 x float> [ %65, %88 ], [ %186, %100 ]
  %103 = phi <4 x float> [ %66, %88 ], [ %218, %100 ]
  %104 = phi <4 x float> [ %67, %88 ], [ %250, %100 ]
  %105 = phi <4 x float> [ %68, %88 ], [ %282, %100 ]
  %106 = lshr exact i64 %101, 2
  %107 = and i64 %106, 1073741823
  %108 = add i64 %10, %107
  %109 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %108
  %110 = load <4 x float>, <4 x float>* %109, align 16, !tbaa !8
  %111 = add i64 %42, %107
  %112 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %111
  %113 = load <4 x float>, <4 x float>* %112, align 16, !tbaa !8
  %114 = add i64 %44, %107
  %115 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %114
  %116 = load <4 x float>, <4 x float>* %115, align 16, !tbaa !8
  %117 = add i64 %46, %107
  %118 = getelementptr inbounds <4 x float>, <4 x float>* %4, i64 %117
  %119 = load <4 x float>, <4 x float>* %118, align 16, !tbaa !8
  %120 = mul i64 %101, %14
  %121 = add i64 %120, %92
  %122 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %121
  %123 = load <4 x float>, <4 x float>* %122, align 16, !tbaa !8
  %124 = or i64 %101, 1
  %125 = mul i64 %14, %124
  %126 = add i64 %125, %92
  %127 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %126
  %128 = load <4 x float>, <4 x float>* %127, align 16, !tbaa !8
  %129 = or i64 %101, 2
  %130 = mul i64 %14, %129
  %131 = add i64 %130, %92
  %132 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %131
  %133 = load <4 x float>, <4 x float>* %132, align 16, !tbaa !8
  %134 = or i64 %101, 3
  %135 = mul i64 %14, %134
  %136 = add i64 %135, %92
  %137 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %136
  %138 = load <4 x float>, <4 x float>* %137, align 16, !tbaa !8
  %139 = extractelement <4 x float> %110, i64 0
  %140 = extractelement <4 x float> %123, i64 0
  %141 = extractelement <4 x float> %110, i64 1
  %142 = extractelement <4 x float> %128, i64 0
  %143 = fmul float %141, %142
  %144 = tail call float @llvm.fmuladd.f32(float %139, float %140, float %143)
  %145 = extractelement <4 x float> %110, i64 2
  %146 = extractelement <4 x float> %133, i64 0
  %147 = tail call float @llvm.fmuladd.f32(float %145, float %146, float %144)
  %148 = extractelement <4 x float> %110, i64 3
  %149 = extractelement <4 x float> %138, i64 0
  %150 = tail call float @llvm.fmuladd.f32(float %148, float %149, float %147)
  %151 = extractelement <4 x float> %102, i64 0
  %152 = fadd float %151, %150
  %153 = insertelement <4 x float> undef, float %152, i64 0
  %154 = extractelement <4 x float> %123, i64 1
  %155 = extractelement <4 x float> %128, i64 1
  %156 = fmul float %141, %155
  %157 = tail call float @llvm.fmuladd.f32(float %139, float %154, float %156)
  %158 = extractelement <4 x float> %133, i64 1
  %159 = tail call float @llvm.fmuladd.f32(float %145, float %158, float %157)
  %160 = extractelement <4 x float> %138, i64 1
  %161 = tail call float @llvm.fmuladd.f32(float %148, float %160, float %159)
  %162 = extractelement <4 x float> %102, i64 1
  %163 = fadd float %162, %161
  %164 = insertelement <4 x float> %153, float %163, i64 1
  %165 = extractelement <4 x float> %123, i64 2
  %166 = extractelement <4 x float> %128, i64 2
  %167 = fmul float %141, %166
  %168 = tail call float @llvm.fmuladd.f32(float %139, float %165, float %167)
  %169 = extractelement <4 x float> %133, i64 2
  %170 = tail call float @llvm.fmuladd.f32(float %145, float %169, float %168)
  %171 = extractelement <4 x float> %138, i64 2
  %172 = tail call float @llvm.fmuladd.f32(float %148, float %171, float %170)
  %173 = extractelement <4 x float> %102, i64 2
  %174 = fadd float %173, %172
  %175 = insertelement <4 x float> %164, float %174, i64 2
  %176 = extractelement <4 x float> %123, i64 3
  %177 = extractelement <4 x float> %128, i64 3
  %178 = fmul float %141, %177
  %179 = tail call float @llvm.fmuladd.f32(float %139, float %176, float %178)
  %180 = extractelement <4 x float> %133, i64 3
  %181 = tail call float @llvm.fmuladd.f32(float %145, float %180, float %179)
  %182 = extractelement <4 x float> %138, i64 3
  %183 = tail call float @llvm.fmuladd.f32(float %148, float %182, float %181)
  %184 = extractelement <4 x float> %102, i64 3
  %185 = fadd float %184, %183
  %186 = insertelement <4 x float> %175, float %185, i64 3
  %187 = extractelement <4 x float> %113, i64 0
  %188 = extractelement <4 x float> %113, i64 1
  %189 = fmul float %188, %142
  %190 = tail call float @llvm.fmuladd.f32(float %187, float %140, float %189)
  %191 = extractelement <4 x float> %113, i64 2
  %192 = tail call float @llvm.fmuladd.f32(float %191, float %146, float %190)
  %193 = extractelement <4 x float> %113, i64 3
  %194 = tail call float @llvm.fmuladd.f32(float %193, float %149, float %192)
  %195 = extractelement <4 x float> %103, i64 0
  %196 = fadd float %195, %194
  %197 = insertelement <4 x float> undef, float %196, i64 0
  %198 = fmul float %188, %155
  %199 = tail call float @llvm.fmuladd.f32(float %187, float %154, float %198)
  %200 = tail call float @llvm.fmuladd.f32(float %191, float %158, float %199)
  %201 = tail call float @llvm.fmuladd.f32(float %193, float %160, float %200)
  %202 = extractelement <4 x float> %103, i64 1
  %203 = fadd float %202, %201
  %204 = insertelement <4 x float> %197, float %203, i64 1
  %205 = fmul float %188, %166
  %206 = tail call float @llvm.fmuladd.f32(float %187, float %165, float %205)
  %207 = tail call float @llvm.fmuladd.f32(float %191, float %169, float %206)
  %208 = tail call float @llvm.fmuladd.f32(float %193, float %171, float %207)
  %209 = extractelement <4 x float> %103, i64 2
  %210 = fadd float %209, %208
  %211 = insertelement <4 x float> %204, float %210, i64 2
  %212 = fmul float %188, %177
  %213 = tail call float @llvm.fmuladd.f32(float %187, float %176, float %212)
  %214 = tail call float @llvm.fmuladd.f32(float %191, float %180, float %213)
  %215 = tail call float @llvm.fmuladd.f32(float %193, float %182, float %214)
  %216 = extractelement <4 x float> %103, i64 3
  %217 = fadd float %216, %215
  %218 = insertelement <4 x float> %211, float %217, i64 3
  %219 = extractelement <4 x float> %116, i64 0
  %220 = extractelement <4 x float> %116, i64 1
  %221 = fmul float %220, %142
  %222 = tail call float @llvm.fmuladd.f32(float %219, float %140, float %221)
  %223 = extractelement <4 x float> %116, i64 2
  %224 = tail call float @llvm.fmuladd.f32(float %223, float %146, float %222)
  %225 = extractelement <4 x float> %116, i64 3
  %226 = tail call float @llvm.fmuladd.f32(float %225, float %149, float %224)
  %227 = extractelement <4 x float> %104, i64 0
  %228 = fadd float %227, %226
  %229 = insertelement <4 x float> undef, float %228, i64 0
  %230 = fmul float %220, %155
  %231 = tail call float @llvm.fmuladd.f32(float %219, float %154, float %230)
  %232 = tail call float @llvm.fmuladd.f32(float %223, float %158, float %231)
  %233 = tail call float @llvm.fmuladd.f32(float %225, float %160, float %232)
  %234 = extractelement <4 x float> %104, i64 1
  %235 = fadd float %234, %233
  %236 = insertelement <4 x float> %229, float %235, i64 1
  %237 = fmul float %220, %166
  %238 = tail call float @llvm.fmuladd.f32(float %219, float %165, float %237)
  %239 = tail call float @llvm.fmuladd.f32(float %223, float %169, float %238)
  %240 = tail call float @llvm.fmuladd.f32(float %225, float %171, float %239)
  %241 = extractelement <4 x float> %104, i64 2
  %242 = fadd float %241, %240
  %243 = insertelement <4 x float> %236, float %242, i64 2
  %244 = fmul float %220, %177
  %245 = tail call float @llvm.fmuladd.f32(float %219, float %176, float %244)
  %246 = tail call float @llvm.fmuladd.f32(float %223, float %180, float %245)
  %247 = tail call float @llvm.fmuladd.f32(float %225, float %182, float %246)
  %248 = extractelement <4 x float> %104, i64 3
  %249 = fadd float %248, %247
  %250 = insertelement <4 x float> %243, float %249, i64 3
  %251 = extractelement <4 x float> %119, i64 0
  %252 = extractelement <4 x float> %119, i64 1
  %253 = fmul float %252, %142
  %254 = tail call float @llvm.fmuladd.f32(float %251, float %140, float %253)
  %255 = extractelement <4 x float> %119, i64 2
  %256 = tail call float @llvm.fmuladd.f32(float %255, float %146, float %254)
  %257 = extractelement <4 x float> %119, i64 3
  %258 = tail call float @llvm.fmuladd.f32(float %257, float %149, float %256)
  %259 = extractelement <4 x float> %105, i64 0
  %260 = fadd float %259, %258
  %261 = insertelement <4 x float> undef, float %260, i64 0
  %262 = fmul float %252, %155
  %263 = tail call float @llvm.fmuladd.f32(float %251, float %154, float %262)
  %264 = tail call float @llvm.fmuladd.f32(float %255, float %158, float %263)
  %265 = tail call float @llvm.fmuladd.f32(float %257, float %160, float %264)
  %266 = extractelement <4 x float> %105, i64 1
  %267 = fadd float %266, %265
  %268 = insertelement <4 x float> %261, float %267, i64 1
  %269 = fmul float %252, %166
  %270 = tail call float @llvm.fmuladd.f32(float %251, float %165, float %269)
  %271 = tail call float @llvm.fmuladd.f32(float %255, float %169, float %270)
  %272 = tail call float @llvm.fmuladd.f32(float %257, float %171, float %271)
  %273 = extractelement <4 x float> %105, i64 2
  %274 = fadd float %273, %272
  %275 = insertelement <4 x float> %268, float %274, i64 2
  %276 = fmul float %252, %177
  %277 = tail call float @llvm.fmuladd.f32(float %251, float %176, float %276)
  %278 = tail call float @llvm.fmuladd.f32(float %255, float %180, float %277)
  %279 = tail call float @llvm.fmuladd.f32(float %257, float %182, float %278)
  %280 = extractelement <4 x float> %105, i64 3
  %281 = fadd float %280, %279
  %282 = insertelement <4 x float> %275, float %281, i64 3
  %283 = add nuw i64 %101, 4
  %284 = icmp ugt i64 %39, %283
  br i1 %284, label %100, label %93
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #4

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float4*", !"float4*", !"float4*", !"uint", !"uint"}
!6 = !{!"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"uint", !"uint"}
!7 = !{!"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 1, i32 1, i32 0, i32 3}
!12 = !{!"float4*", !"float4*", !"float4*", !"int", !"float4*"}
!13 = !{!"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"int", !"float __attribute__((ext_vector_type(4)))*"}
