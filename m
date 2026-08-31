Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3E4A2062
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194223; cv=none; b=kfOitVoRkgK31chBkr8iGtlxSu9cjMi5oa0Yl69y/LwOqiHO8g3lpLK7K6iaf/DRMlSzL7hpmX8LZYx9eEtQl86VRfQupxjkOC9ARhRvtBuBMhYfyzSs/f8K4YKp0E/GsGWDTruIZolmGrmv2dE6r8NOQ1pV6XB8gvmBCoXPFHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194223; c=relaxed/simple;
	bh=Z6l42kmbZIdLCp5HS8lQr0U0ximrV+BKEFCMLwjPxeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dca+iJ4UrzOhcanWKvFeOpb5go2BtfOC1DIUtxCZSUe93cYfxDHur1AXxLEFR4tN26aVhrRsVYmeIo0YOAUPPlaDpHcAVqOB4QUCfbiQnP16ni7D6wwDVjhrmXW3pPqrVC702mew7vbvvbwr2eSyFsMhBfe9lunOND5zQcs9sNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2IveTK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxcXym8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2IveTK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxcXym8l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq9ad305896
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=; b=O2IveTK+m5vfkkZG
	dDTk22atmDu69bjKVVwAIjdcv541EekKqOs5kPQ4LH6BjdfZWCR86mxk3n9VfzTb
	keyQbUSHxdA0OXbb8lIW5gfGuUR95VDEYRkpAPrpZHOrNUhAC+tc+nqDKm0xQoDp
	e5LfPIJ1vraSGXFjinQgod08IyGf76gmC4VEjoKxr4PFXBkvSpiqJdbUvaYw+OWT
	tLeh+Pl4yX7DT9pcIVoegCx2ZWYLucZFyVaQbulJyw9vlJBwtwfGWeYvZOqFto0i
	SlhXzKpHamXTxpisfOfzNWGYbLEEcbmFAGx89LBQ5DYhX5WfE5YCPfWLAeJh2ltT
	9/Qjvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pmahv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:36:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so6372685a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194219; x=1788799019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=;
        b=DxcXym8loc9mJa98HYbiqtbxFNqGVWSFnz7NXY2EFH8wN6B4HNIxuAwQkCG7iT1K1j
         RJPzXvYMTMxTsgDZQzblQYJC67/X8+pGljMfOlVhzekFm8LMaYrA7qBc8j7ZQ6sD/0nG
         sA9URfmBTzOeh70qgw8aOVEIwXDpmJGEXwmF46Xb/7cJC4aMFPQleVlxZxQ9wOT9KX9o
         BqpQJyNv2oswef14qQkaBcwBGSh8hGnSCqRcJt8IFFsUqLsIgbNMY5srL8DaNAag/xbe
         s6VpxExlDjCLV6rhDWDkjhrA5l10wzBacj4WJNOHQT+i+UDK2jWWi0o+E741x8tbSzii
         m3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194219; x=1788799019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=;
        b=IFkxM8VZgkykshyRePAwxQjZWrMVOewNNiv5YvKnmjpS+xGphoVBqt+9CswogDUtCv
         xpsFC2WXCMkrPyLmeMsUXZ5yiVkDXJYKcOTQwNAxRp3Qoqq1vcoK037538YCVy6vw+6v
         64pwwdLfbvB1p9Ey+8Hm/KynS4eX6cpCBDBElO8KcMsziTq1tGPDtKnimyc4RtFfgGtq
         GqBCH58spIKs9vH+e1uQExv7KCKbAsJm0ANWL0jdrD4AvxNEL58G/+nF7PWs3Ioyd+gd
         ydysoMYflikQ7K3xR2tguSO95oMyL4OZwJUuIPj6FczQgBf3JI/suJiCw6fSorGPmegg
         NC7w==
X-Forwarded-Encrypted: i=1; AKwUvBwFup5VyNmYByh6JNCMfciC4uGPNMDck9QRxEumnMTWwefrCg3gFZLnRnJXT5GLbJAAuLlZME2c2Pr5JaHU@vger.kernel.org
X-Gm-Message-State: AFuF++mPxHi5CKwP+X1G6MtNLpCCr1mOSjJg6lyJa6b6MP1vpYZyc5B8
	z7bhUC79fWoe1XcEMlIIipfvshkizNPo3TXiF8HAznNTaHzZUWZuvQ8v7SknglqkdJuZbIqYoYw
	l9Min6xRD14YmvQGmglfqTOWQWBNoiFPYeAhyUdaHvQXU4Nhl3AbtcvMOzuJsYhr+H7iq
X-Gm-Gg: AYBFou002ELs9nhLix3pgqDT6sbACJ1wlW+9FE5r58H9OEvkR0LSbVA22bb9bKj4oQB
	GL1bHlWmDH8lPI2t+q5oNt3esxi9Ak8zsROsh1DfFgZTavx/uXGlkJKTSkimgZYMpnxLrQrqevB
	nHJwIvVBeHlLRUHwzXmHvFIBZZH60rBsZG2/bzy08j6zig96wWLlkXUZATAA3PlOsu/+9mv/eRv
	FZEO3ljtWckgs1Zx73DV6DoWnwMC+RjcVvQ1h0rosfe11Q/9DcrdAPMxHO6lL1OnRhKy2qZCmkZ
	o2F2FBGBR+LzPl0qPJLVVsVszM4iuOCe5U5j5se/4nwT3bYrXD71XYdC45Om2tDDknzEJtzGKt/
	LvjEVm347lqyFBrsrFgO65RP8DdP0LSUBHA==
X-Received: by 2002:a17:90b:534b:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-398ceefee8emr15995913a91.18.1788194218942;
        Mon, 31 Aug 2026 09:36:58 -0700 (PDT)
X-Received: by 2002:a17:90b:534b:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-398ceefee8emr15995835a91.18.1788194218342;
        Mon, 31 Aug 2026 09:36:58 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm271260a91.12.2026.08.31.09.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:36:58 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 22:06:36 +0530
Subject: [PATCH 2/3] dmaengine: qcom: gpi: Add trace event support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-add-trace-support-gpio-v1-2-7b0fd0d0ddb3@oss.qualcomm.com>
References: <20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com>
In-Reply-To: <20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788194205; l=3171;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=Z6l42kmbZIdLCp5HS8lQr0U0ximrV+BKEFCMLwjPxeM=;
 b=GH6eTEeWfr3q8FZmKLVtP/Zvo7mbg7bRxvyH5HMvr2vnuU6wPNZRQ7Dhu5TmRGyWsUWugLqDz
 4Bdn7VAthiaBQO14bh3VBklpdJzojchBUcacFtCu4c4EuQFLJSF2/R1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: 4zXoe99VQhbGSgxnDmg2NAAxQDWXhrHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX210Jfk6CbR+P
 yd+5YZd45LpREzgQemlOpzIryB/QBX7r1/3Y38U88+apDNVrg5qBTJJJDj3RDzw5Sg2947PEdj+
 2qyMPcSTXvC0JP9vwFaz4dWOcdR0EX/NzB92qU+S1uixptLLiWtlg+UuNqhVYtIM4r2npogb+8c
 oPinP5ubAo4/5brzdSmYj/JYs7xU5A+6tF+EL8WMZ7CBHJIqBTk/NBUl/dJYvohbM5TM6zRfBj2
 zOQsgRyTzoUIa8L/Inqsa3pYbiyNRQrfevJWfWvb/3oAQWJU7IFDQNbxHh7MSUuCOUErB2c5m9p
 9R9x6O/LbLS5C9hv57WqSY5+0dI3mwGRn2afHaSRmjZ2A8CCMdFSw8Pvr42Fp0S2q3odejU/By7
 hH3LsDrFjqdBosp+N65K0tm4KOzqW9Zo/CKh8/o3zMcogeTSOYHoBfnIn/Rl8iGcVoI0qIdWN5b
 E1c5S0Xqa4yvWN1Isaw==
X-Proofpoint-GUID: 4zXoe99VQhbGSgxnDmg2NAAxQDWXhrHA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX+aYmxPZ79OiT
 hm4NMLkTnfdcdROp9KKtzhN+XHR4unZzw3NKCmdi2Prd+smW7uaOFaNy2QBYp84PiGRV9dNqW17
 yLqm4FgsEbkrCEnWndNppYxPI4gxZ4A=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a95adab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vNIMIT6v7fynGdS8nZ4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

Wire up the qcom_gpi tracepoints into the GPI DMA engine driver to
provide runtime visibility into driver behavior without requiring
invasive debug patches.

Tracepoints are added at the same points as their existing dev_dbg()
counterparts: channel/event command dispatch in gpi_send_cmd(),
top-level interrupt type in gpi_handle_irq(), channel state
transitions in gpi_process_ch_ctrl_irq(), completion event handling
in gpi_process_xfer_compl_event() and gpi_process_imed_data_event(),
and TRE queuing in gpi_issue_pending().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..b09354a73b46 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -17,6 +17,9 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_gpi.h>
+
 #define TRE_TYPE_DMA		0x10
 #define TRE_TYPE_IMMEDIATE_DMA	0x11
 #define TRE_TYPE_GO		0x20
@@ -683,6 +686,7 @@ static int gpi_send_cmd(struct gpii *gpii, struct gchan *gchan,
 
 	dev_dbg(gpii->gpi_dev->dev,
 		"sending cmd: %s:%u\n", TO_GPI_CMD_STR(gpi_cmd), chid);
+	trace_gpi_send_cmd(gpii->gpi_dev->dev, chid, gpi_cmd, TO_GPI_CMD_STR(gpi_cmd));
 
 	/* send opcode and wait for completion */
 	reinit_completion(&gpii->cmd_completion);
@@ -773,6 +777,7 @@ static void gpi_process_ch_ctrl_irq(struct gpii *gpii)
 		if (gpii->gpi_cmd == GPI_CH_CMD_DE_ALLOC)
 			state = DEFAULT_CH_STATE;
 		gchan->ch_state = state;
+		trace_gpi_ch_ctrl_irq(gpii->gpi_dev->dev, chid, gchan->ch_state);
 
 		/*
 		 * Triggering complete all if ch_state is not a stop in process.
@@ -841,6 +846,7 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 
 	offset = GPII_n_CNTXT_TYPE_IRQ_OFFS(gpii->gpii_id);
 	type = gpi_read_reg(gpii, gpii->regs + offset);
+	trace_gpi_irq_status(gpii->gpi_dev->dev, gpii_id, type);
 
 	do {
 		/* global gpii error */
@@ -968,6 +974,8 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 	smp_wmb();
 
 	chid = imed_event->chid;
+	trace_gpi_ev_process(gpii->gpi_dev->dev, chid, IMMEDIATE_DATA_EV_TYPE,
+			     imed_event->code, imed_event->status, imed_event->length);
 	if (imed_event->code == MSM_GPI_TCE_EOT && gpii->ieob_set) {
 		if (chid == GPI_RX_CHAN)
 			goto gpi_free_desc;
@@ -1043,6 +1051,8 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	smp_wmb();
 
 	chid = compl_event->chid;
+	trace_gpi_ev_process(gpii->gpi_dev->dev, chid, XFER_COMPLETE_EV_TYPE,
+			     compl_event->code, compl_event->status, compl_event->length);
 	if (compl_event->code == MSM_GPI_TCE_EOT && gpii->ieob_set) {
 		if (chid == GPI_RX_CHAN)
 			goto gpi_free_desc;
@@ -1887,6 +1897,7 @@ static void gpi_issue_pending(struct dma_chan *chan)
 	}
 
 	gpi_desc = to_gpi_desc(vd);
+	trace_gpi_queue_xfer(gpii->gpi_dev->dev, gchan->chid, gpi_desc->num_tre);
 	for (i = 0; i < gpi_desc->num_tre; i++) {
 		tre = &gpi_desc->tre[i];
 		gpi_queue_xfer(gpii, gchan, tre, &wp);

-- 
2.34.1

