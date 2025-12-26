; ModuleID = '/home/inf2021/chzerdalis/Desktop/LAB3/ECE340-Embedded-Systems/Lab3_Acceleration/lab3/lsal/max_loop/solution2/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #0

; Function Attrs: noinline
define void @apatb_compute_matrices_ir(i8* %query, i8* %database, i32* %max_index, i16* %direction_matrix) local_unnamed_addr #1 {
entry:
  %query_copy = alloca [32 x i8], align 512
  %malloccall = tail call i8* @malloc(i64 65598)
  %database_copy = bitcast i8* %malloccall to [65598 x i8]*
  %max_index_copy = alloca i32, align 512
  %malloccall1 = tail call i8* @malloc(i64 4198272)
  %direction_matrix_copy = bitcast i8* %malloccall1 to [2099136 x i16]*
  %0 = bitcast i8* %query to [32 x i8]*
  %1 = bitcast i8* %database to [65598 x i8]*
  %2 = bitcast i16* %direction_matrix to [2099136 x i16]*
  call fastcc void @copy_in([32 x i8]* %0, [32 x i8]* nonnull align 512 %query_copy, [65598 x i8]* %1, [65598 x i8]* %database_copy, i32* %max_index, i32* nonnull align 512 %max_index_copy, [2099136 x i16]* %2, [2099136 x i16]* %direction_matrix_copy)
  %3 = getelementptr inbounds [32 x i8], [32 x i8]* %query_copy, i32 0, i32 0
  %4 = getelementptr inbounds [2099136 x i16], [2099136 x i16]* %direction_matrix_copy, i32 0, i32 0
  call void @apatb_compute_matrices_hw(i8* %3, i8* %malloccall, i32* %max_index_copy, i16* %4)
  call fastcc void @copy_out([32 x i8]* %0, [32 x i8]* nonnull align 512 %query_copy, [65598 x i8]* %1, [65598 x i8]* %database_copy, i32* %max_index, i32* nonnull align 512 %max_index_copy, [2099136 x i16]* %2, [2099136 x i16]* %direction_matrix_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([32 x i8]* readonly, [32 x i8]* noalias align 512, [65598 x i8]* readonly, [65598 x i8]* noalias, i32* readonly, i32* noalias align 512, [2099136 x i16]* readonly, [2099136 x i16]* noalias) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0a32i8([32 x i8]* align 512 %1, [32 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a65598i8([65598 x i8]* %3, [65598 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
  call fastcc void @onebyonecpy_hls.p0a2099136i16([2099136 x i16]* %7, [2099136 x i16]* %6)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a32i8([32 x i8]* noalias align 512, [32 x i8]* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq [32 x i8]* %0, null
  %3 = icmp eq [32 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x i8], [32 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [32 x i8], [32 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a65598i8([65598 x i8]* noalias, [65598 x i8]* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq [65598 x i8]* %0, null
  %3 = icmp eq [65598 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [65598 x i8], [65598 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [65598 x i8], [65598 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 65598
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast i32* %0 to i8*
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a2099136i16([2099136 x i16]* noalias, [2099136 x i16]* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq [2099136 x i16]* %0, null
  %3 = icmp eq [2099136 x i16]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [2099136 x i16], [2099136 x i16]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i16* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [2099136 x i16], [2099136 x i16]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i16* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 2, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2099136
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([32 x i8]*, [32 x i8]* noalias readonly align 512, [65598 x i8]*, [65598 x i8]* noalias readonly, i32*, i32* noalias readonly align 512, [2099136 x i16]*, [2099136 x i16]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a32i8([32 x i8]* %0, [32 x i8]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a65598i8([65598 x i8]* %2, [65598 x i8]* %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a2099136i16([2099136 x i16]* %6, [2099136 x i16]* %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_compute_matrices_hw(i8*, i8*, i32*, i16*)

define void @compute_matrices_hw_stub_wrapper(i8*, i8*, i32*, i16*) #5 {
entry:
  %4 = bitcast i8* %0 to [32 x i8]*
  %5 = bitcast i8* %1 to [65598 x i8]*
  %6 = bitcast i16* %3 to [2099136 x i16]*
  call void @copy_out([32 x i8]* null, [32 x i8]* %4, [65598 x i8]* null, [65598 x i8]* %5, i32* null, i32* %2, [2099136 x i16]* null, [2099136 x i16]* %6)
  %7 = bitcast [32 x i8]* %4 to i8*
  %8 = bitcast [65598 x i8]* %5 to i8*
  %9 = bitcast [2099136 x i16]* %6 to i16*
  call void @compute_matrices_hw_stub(i8* %7, i8* %8, i32* %2, i16* %9)
  call void @copy_in([32 x i8]* null, [32 x i8]* %4, [65598 x i8]* null, [65598 x i8]* %5, i32* null, i32* %2, [2099136 x i16]* null, [2099136 x i16]* %6)
  ret void
}

declare void @compute_matrices_hw_stub(i8*, i8*, i32*, i16*)

attributes #0 = { argmemonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
