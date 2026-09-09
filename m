Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D9360EE2
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930607; cv=none; b=Zs87iBCFn+Qzh8+z5kHSyDYwM+n/GN9HKSZvyET+tHVh1UTQUFneZQ1L/h+n/66QQUyrftXCtbXgqStEE1qr/5xunvuOoqynNVbTIUBXVYVKlWDWHk8eU7tajxixM1h3oJXWvv0VGfzFK7jEb98UTC2guZwVuEcoqkg/yag16NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930607; c=relaxed/simple;
	bh=Z6l42kmbZIdLCp5HS8lQr0U0ximrV+BKEFCMLwjPxeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ps/hKhpvSPdPtOgNh3gX6Kw+Hb9KYL1ylyi14zzVsWmq+gki31T1PznOYHwBhVS2dm9aTax8SDP43j2lo4165Wtgq+G0tAzktdqzG/pOGV8AKwwFmcZmb08nQi76KgOmCbFZAAPr+CHgsBYHzUl2ytUtcB0MWroe742DXBp5PYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K18kkAmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKA+mNaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K18kkAmi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKA+mNaJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892U27B639416
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 05:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=; b=K18kkAmif3x1TjjK
	uJObuExx6LB+gE1we25xFO0WdKAUf4IVEzTENFu52Jb1MsyCSM44DY7TYy+6G9zJ
	9at74JJaH828qzvRnmzoGR3ykcz0RmOOpsmzv5cpenEjj21qmTVHsuDvte7VCHZv
	IVxLcv4yWgl+VpKA2J/lHj9ivAnhfnRoJAVEwrAHU7yrVHfVrhmpglxNMkeHW89k
	g/DA20UhVjg2x6aPEk6K8pU2aeGRwCeEKdjcULN3UPmKlO8Z3ysaRmYQEstHrZzN
	/Qgtk89c3vcq+YvcWaAxooZ2wtf07oUhhR/w67frXKVihz+KjOixto3jKQgvCKUA
	xJHI2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqj8g2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:10:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so8712225a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 22:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788930604; x=1789535404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=;
        b=kKA+mNaJflHRdUzDe8XWOftUWh/MIj6lmwUo4y9iQVCdfy+Jzm20faVdeiCOMlunYW
         j0DBfaJ4mxQbGTMQ+QgEwbZkqhF8ipiRaWpw23utMBIDCex/nANjuizN+xY26OBfHhT4
         mq+6LZTwUvhAQizqg0QwypYABHbQWlg75cxRQ4gH0zDaB/DHXkg6q+7JFORr3OGnXfTu
         WB4fBkYJvyBjmLQUdaKzNMTArAWi5u1YVH/CJJrw/ltW8/T52fFQbOzihQr9lsISexJo
         wUK7ZNAapsUXvBkrIa0wiyScPc8Sza782ceWxpEw2cYEpfbjJEAPu0ituKsMn6ll0xr5
         sQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930604; x=1789535404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=;
        b=lwdkVT3bJyGwbhNJpkOPq4KNr5AxYDxhuP0hQON2o25YQnuIJlST1aYOZlX0oUx9mW
         B+YQlB9ATs37WT7wpcYZbBSb7bvRgxaaxbFwHLJ5gG4g9RYdooyX8Ijuh5Y+Dr+2vIWW
         YnKDo94cUWqWwJhopFcSvakmBjMaoUwvSwAPrkD+Q7tf/Y0hySYzUerPPmjYp4YLNPTt
         Eg57vWm9YRPoHmvqNBYpKQoiaKzK4iZWG1/G9oYZyH2Ou0f8wLfaImAWjRyjBJ6qk5PN
         //7aRLZnvy2UH3UM/ZA/J++R4g0wNNUtkcDeEXfXrxEgOu6MGxL/+Lyzdf5u0HDFyMWH
         RVqg==
X-Forwarded-Encrypted: i=1; AKwUvBxF5A+QX8icW8BeXH8BAmI2izfSsxKl5Kv63/nYjm7ogDLBL1yefNaQZdkfLC3NVea7IQYurOxoIheaqL7c@vger.kernel.org
X-Gm-Message-State: AFuF++llSYbNPTSC8z3VOww0MKsAslUJRe9Rc+tG58wCBvqeebQ9mAjI
	SNVvkWlmTHT7I2jEyQpDWcrZ2J34/N43WTpDxmFiaamzLBMDGhbIpkYgbeB/1sVS4AHuup8Wrgx
	Cs2EVEvKSzZOnL/uw86nden4T78nw4lYv6XgmMMwas9iOo09TpUdUmNPjXuFoMK57wbvG
X-Gm-Gg: AYBFou1sI6vxdj81pc53pt6qrjkGBW+2bUoTBTyAyeSravIa6tfzJIp2kc5d1fR4CXS
	td+W8P2sks+F2aKdfKdgMgSR5vQet0xNlaiMNt2C4hEVA6+xVmKIU41mu6Ls6NaXc/YmjjIhiEs
	PVqNfAUKkihRuZjKeB9/lcy48BFNujoEWqEIjcFwAnL0JJPSUv9000xJ4uz9I4VYniFcOqAxBKg
	lCYURo8yK9djzDwPWyBrpHXROtvPGKY8RZzGbjLj4q4d72xQVmLmBPDDNfDnYIumOf/pCt0b5Gi
	pDJPFlPYuOVeaY/8NFRnEq1x5PHz+ZpgFdmKg9j+1qKqG40DyPK3nF2TM44US+YsBqVO/A+bDRH
	ygx2UBJXBLuTr/2IHmYSOYPzEVIt3T0xqBw==
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr46023239a91.13.1788930604003;
        Tue, 08 Sep 2026 22:10:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr46023202a91.13.1788930603460;
        Tue, 08 Sep 2026 22:10:03 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm11082833eec.14.2026.09.08.22.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:10:03 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:39:42 +0530
Subject: [PATCH v2 2/3] dmaengine: qcom: gpi: Add trace event support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-add-trace-support-gpio-v2-2-01f81739bb88@oss.qualcomm.com>
References: <20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com>
In-Reply-To: <20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788930590; l=3171;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=Z6l42kmbZIdLCp5HS8lQr0U0ximrV+BKEFCMLwjPxeM=;
 b=a+84aITZZeq5C0RC92obMoyCfcKCmGzAhKOA9KCHsw6rACt4jMGB9JuiD4f88JdjzLo/6cVrU
 s7f3Ek7nL32A1+19YDhjQ4AIKAWPVmYW1EyasXKpuf65vFAbstiPmfr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: EiIEdrCG7eQ9x7cktx0EJqnkC2U8qs-L
X-Proofpoint-GUID: EiIEdrCG7eQ9x7cktx0EJqnkC2U8qs-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1NiBTYWx0ZWRfX63aeIhWoAW3j
 iOuZZHj2YKnoNaNW8NEQmu+9UQpbvTZV07rpJSsSjHrmcveIsyEXZJF0Bq5fDXmBmslXJuDVrZr
 1i/SYdXaDovD09+a2mAPLAI1v+euft7to3R0sf86BGfNlgx48PkahoJh077M7v1jPINdR4r5ODB
 BLpEol3gBfz9Lu/J6gcMsLiPLXGcc992z2Dogw8826TS1z2XbgC31ndjYMSpZE25tOjV9PMN6ZC
 lpdGl2eoJTY//ER0zynGskRHJhARpsy80V7DJej4VKJG5ZgeRqUKKKgl0/0hIslxRVIpC1eiavy
 7euL6hln3Kh4zlW4ZMnKH17YWumv6EO9iWUAGeq9ZLbHJGFICnDFVjgVlBncVfSup39K6LJF9I/
 q3YsH91SCmElNQ6K6AJlZZxgKAdfVRSSO5iChEt1Lcbx71FVTyFcqZjq478yDSi7UHLf3wko3pJ
 wmIq91DlNGnVc/6fQsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1NiBTYWx0ZWRfX1DGIcdP41UaO
 gclU8KGk4Wjd0MwmgqX9RShBIGIcxiVs7VOWq9S8ldILBpEI/P3HBiCt3vhBvYRmLsVLBpTl03W
 8MKOI1oPXtEEks3XzIj4g1sc4fT5SVo=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa0ea2c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vNIMIT6v7fynGdS8nZ4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090056

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

