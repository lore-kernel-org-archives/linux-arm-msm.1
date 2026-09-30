Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061DC4562B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779960; cv=none; b=lVOZwaQjSLJydrNZikAwx+nh839VMh4V6o7wZE0gIyudX8XuQeXnm/ef78k3RWu7m3UauToLU6x+Pat63qeg4BmCMB96cO+h1glpNCTKLH7TLe5z9vePhMFp8E4bcURsVvFDHpW6cLFQlw8RHT5dbyE3QFu9IpPdV4B2MBfzvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779960; c=relaxed/simple;
	bh=dogAdoQ/QCkQb5GhDzIyOp6UYu9xwRLxOLzN5HnPoIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PJlS7bhhffaklxd5B82hYDTJmJ99B3a7YcOS+sMy3meJQZL6KOn9sLYlocfash2x6yswKjhsaHu+07hf60b1B7vBu9iWgAERY1zmroWyv7L4hj69y8U+OCt2RTtdO1Tuq4hAw6FwsJPr1nIwwIlUdjAGi4LQQn56nFefIsw6BoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfCCPMna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU6uTaDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfCCPMna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU6uTaDN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE07Jc4178834
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pujGoTye8c8
	YObD45SWJzA4GPFiLYw7N42q3MidIndo=; b=gfCCPMnaNXdaKUY2Kf3BnL6i30m
	hPMuG2IFctl2aGrE80RioybPYMSgnsdUZnN/Bo0nqfkQ5PlufDHalBSJTUDkgJOQ
	UA+poj+spUeZh02UNH5cUN9/acH6AIyPtPrhjbWzYEbU9l8uF6dUrv9afOCZxYsT
	lXjPzyGe5RBe2lgquOgw3IuzlaOc3QdSnVJYQNh2TrD09u0Kqs4uv6TIPAonKBOb
	uQnm3qF3hw8jRxJVpe+OP0dgP1Asp9JDrc8OpPWDA/Ox9B+7/NXrV4AAOQtipfDu
	1VGipdvDlaJFqED8Ng19sJuw95FnwgwO2Baz//12Bn7DigzynoeWehTP+XQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3m02n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ceac22194so1093492eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779944; x=1791384744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pujGoTye8c8YObD45SWJzA4GPFiLYw7N42q3MidIndo=;
        b=JU6uTaDN2AcdXl38uB0FpK7436H7tJTapsGfmPpyMcgZ3zGGSoB1a9SzfecMLU1Bvt
         T10Dl9qWBTrjLg0AEFgfJndTi2DHwts3cHY8VGsxOspxcHlpdLdqFdQOJd3mVGiJF+Is
         gd3Brh2GJakZQjToqtBhNimFp6F/sQKZGfov1niVkuoAbE3IDe/hgik9m42y7bCBP+1j
         MH/nOQNEwQK5cct8mC0vdTYrW9CO8dLAiWFOVI8yINb0nTbU0DuBzPbMQNBzd34MIzkY
         E9eGnzw09yX+wXUtP8qZxzxx1dLr5McLLdECh6zde+xHaDqGmP9ZiJM0bswwnY31LB0m
         txIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779944; x=1791384744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pujGoTye8c8YObD45SWJzA4GPFiLYw7N42q3MidIndo=;
        b=SRznzKcbG6Gw8bkOHpXYZmxQm8Ji99Oac5jlWmnIx2r4VrXX34Q8LSi9mDw7pljAbr
         +SbWiWcZEj3DzHUKCnr6BuPUPwhN6loL30nbpqi4uWPP78cInMi5U003vfXsClAZr0mw
         LQg2VelQMfsPKC1un7qcRhrMNi4octZEPp8bTMvwyHF+oiGT7fYyoSQWjSP87e8GyYxZ
         /TCYGGREuboNx4pvpbbo6dh3D3D/qB6p/JhP3ac0mlg6G8PvNYoV6UtuNNfNK7+izk3d
         SLNRNoCqrSH9XEFPsXwz8HIguxmtZQOSJX3OSi6O4zcWOLlkjUK/RQ1YNq0jnCIyPj4b
         iImA==
X-Forwarded-Encrypted: i=1; AKwUvBxtDpN4OtZf/tzb+ga9Ao9pHbqmtCC3IycWGymxIXnuscDaSUILMjqc+/X08iAOtv7bPJQFi84sSELqAhDg@vger.kernel.org
X-Gm-Message-State: AFq9FYLMkeJ8Ei55ed5BR1Lvzwja/pB3HlRrkc/XQRiPYTOHC970xmm1
	GRlLXbkEemQmiIzlXXE64LF368jWWo38HRhvnEaWvI/evBqd674JOwJxvI0NjYV1R/LCvZfTlZa
	0+rg1nQYycAs3s8FdKGIJopE/xvu7L6lsLOz/LNXszL4jAcCzR3Lw/+vB5WSulZa/+ADB
X-Gm-Gg: AYBFou0VE6TFXO/8e9atBwFsJI+nDjij08mUQJ+wuuP1Mf8an7V+q55THQ9TWlaIb5h
	rUk1WJV9YsYJcTl+7TbPgZAqlAEl66AQok557olFArfmBhkFhQWI5epNhYFOQdKP1J+sNwKfF6r
	9hPGB5JaRUpGQrZGx7+Zp7V3uy7watAqI8Xf33wuEUswodTGvTUEDTJFEWiMHEneAD8CoMFI8ue
	HPrp4P4EXh17vlAqtHZsLawaL/pPsBiV+YhnOgmHCjAjPK4lN8WhVZ22E7Boc9u8BmR+dtPR3xp
	dDdSxKHIux7KyW8gha4iLCRtxj3+xv2nImxF2pcqjyeDa5H7wO08hPDYU9bGyKCcFw19lpq0f2q
	gaOGdVJBqhYLvvvu+AfSR3wC6D23/t/n0uogLFJOxNI5szirhzp4jlQk=
X-Received: by 2002:a05:7301:6192:10b0:34b:2362:90a8 with SMTP id 5a478bee46e88-34cdc4c0558mr2042938eec.19.1790779943581;
        Wed, 30 Sep 2026 07:52:23 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:10b0:34b:2362:90a8 with SMTP id 5a478bee46e88-34cdc4c0558mr2042887eec.19.1790779942856;
        Wed, 30 Sep 2026 07:52:22 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:22 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 3/6] trace: qpace: Add tracepoints for QPaCE operations
Date: Wed, 30 Sep 2026 07:52:12 -0700
Message-Id: <20260930145215.3380977-4-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fslgx0eApBIJQIcXIx33miC3feOfoBoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX9X0UQjPfTorM
 jvCVbQhy5yRWWQuQoGG9yLVywiQbuz1TcSu4Qn7FnTmspS05dFsHY4JVqqG3JBKtHkXmtnx1zuh
 IHGuwCi9PwskTeNSFoTRO7FKgqgbKpwG5G4S3AlNUvk181lN3OpZiwct7VPyvdDchhS3oaR+166
 5KHRkGcR1Ysgypbtf89r73vklj5t0bw9GJNR/pnzq0nTV7niPEVjxR4Mqh2ed4SFg9B/bBlb8iz
 S7XDSzrNBUJlj817h0RSVneN85sFjBijGwr5mDSu+2oxEMUG89hI0YQJ78ryq0nuSGvU/VmUhlf
 iSmfL8FxrkbCN33QcwiNw31Hubj0q0K/snbBnZLESa9/uqGpMYz02BbkX76lqKAVMbQZ0GdovqV
 zAN4B8eiUXen0qAzZ1Ds2xhYfMRgpVmH92kaV30YZXRREzoUC3KT21h2cLmK9Zc67a0WompVZp/
 4yadEvv+FXgCRj47pUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfXwF45mKkOk445
 GDo66KmpNDq5gpC80ZB3puPuOtmARIBlWFZY5scaAUMY94ml9J0T/a65uArGzga6fhqmotuGD+y
 NqfOLaQsYzf4z1dtjSFZAJTorfKbqZo=
X-Proofpoint-GUID: Fslgx0eApBIJQIcXIx33miC3feOfoBoN
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd2228 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TOX0-C0EfqkpjbOQ6sUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

Add ftrace tracepoints for the Qualcomm Page Compression Engine
to allow performance analysis and debugging of QPaCE hardware
operations.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 drivers/soc/qcom/qpace.c     | 12 +++++
 include/trace/events/qpace.h | 99 ++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 include/trace/events/qpace.h

diff --git a/drivers/soc/qcom/qpace.c b/drivers/soc/qcom/qpace.c
index 69aa14b7c477..f5b21ffbcbff 100644
--- a/drivers/soc/qcom/qpace.c
+++ b/drivers/soc/qcom/qpace.c
@@ -23,6 +23,9 @@
 
 #include "qpace_internal.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qpace.h>
+
 #define QPACE_REG_PAGE_SIZE 4096
 #define QPACE_CORE_CACHEINDEX_SIZE 4
 
@@ -310,6 +313,8 @@ int qpace_urgent_compress(dma_addr_t input_addr,
 	if (ret)
 		return ret;
 
+	trace_start_qpace_urgent_compress((u64)input_addr, (u64)output_addr);
+
 	urg_reg_num = get_cpu() % NUM_TRS_ERS_URG_CMD_REGS;
 	stat_reg = qpace_urgent_command_trigger(input_addr, output_addr, urg_reg_num,
 						algo->urg_comp_cntxt);
@@ -338,6 +343,7 @@ int qpace_urgent_compress(dma_addr_t input_addr,
 
 	ret = FIELD_GET(URG_CMD_0_ED_STAT_SIZE, stat_reg);
 out:
+	trace_end_qpace_urgent_compress((u64)input_addr, (u64)output_addr, ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qpace_urgent_compress);
@@ -356,6 +362,9 @@ int qpace_urgent_decompress(dma_addr_t input_addr,
 	if (ret)
 		goto out;
 
+	trace_start_qpace_urgent_decompress((u64)input_addr,
+					    (u64)output_addr, input_size);
+
 	urg_reg_num = get_cpu() % NUM_TRS_ERS_URG_CMD_REGS;
 	qpace_write_urg_cmd_ctx(qpace_priv, QPACE_URG_CMD_0_CFG_CNTXT_SIZE_n_OFFSET,
 				urg_reg_num, algo->urg_decomp_cntxt,
@@ -381,6 +390,9 @@ int qpace_urgent_decompress(dma_addr_t input_addr,
 
 	ret = FIELD_GET(URG_CMD_0_ED_STAT_SIZE, stat_reg);
 out:
+	trace_end_qpace_urgent_decompress((u64)input_addr,
+					  (u64)output_addr,
+					  input_size, ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qpace_urgent_decompress);
diff --git a/include/trace/events/qpace.h b/include/trace/events/qpace.h
new file mode 100644
index 000000000000..3f0ccdb8f206
--- /dev/null
+++ b/include/trace/events/qpace.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qpace
+
+#if !defined(_TRACE_QPACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QPACE_H
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(start_qpace_urgent_decompress,
+
+	TP_PROTO(u64 src, u64 dst, unsigned int size),
+	TP_ARGS(src, dst, size),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+		 __field(unsigned int, size)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+		 __entry->size = size;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx size=%u",
+		   __entry->src, __entry->dst, __entry->size)
+);
+
+TRACE_EVENT(end_qpace_urgent_decompress,
+
+	 TP_PROTO(u64 src, u64 dst, unsigned int size, int ret),
+	 TP_ARGS(src, dst, size, ret),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+		 __field(unsigned int, size)
+		 __field(int, ret)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+		 __entry->size = size;
+		 __entry->ret = ret;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx size=%u ret=%d",
+		   __entry->src, __entry->dst, __entry->size, __entry->ret)
+);
+
+TRACE_EVENT(start_qpace_urgent_compress,
+
+	 TP_PROTO(u64 src, u64 dst),
+	 TP_ARGS(src, dst),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx",
+		   __entry->src, __entry->dst)
+);
+
+TRACE_EVENT(end_qpace_urgent_compress,
+
+	 TP_PROTO(u64 src, u64 dst, int ret),
+	 TP_ARGS(src, dst, ret),
+
+	 TP_STRUCT__entry(
+		 __field(u64, src)
+		 __field(u64, dst)
+		 __field(int, ret)
+	 ),
+
+	 TP_fast_assign(
+		 __entry->src = src;
+		 __entry->dst = dst;
+		 __entry->ret = ret;
+	 ),
+
+	 TP_printk("src=0x%llx dst=0x%llx ret=%d",
+		   __entry->src, __entry->dst, __entry->ret)
+);
+
+#endif /* _TRACE_QPACE_H */
+
+#include <trace/define_trace.h>
