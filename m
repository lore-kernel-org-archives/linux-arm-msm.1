Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11436330B0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515190; cv=none; b=uZfZ9dYNbW+IloSwHdiq1AiqKemDISKpAJ7743CZdd1Ni6Y7POWkAu1LX+2h2OO7YBCaEsJn57npS5dWInSSLAUyc/8e1W7/cbKHje5OJq9LVHqxnUaDJ7L9L7D/eq0/nl3eT+n2tsUyBInocCtnPE5qJgRr6QIgAnBUApO+qCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515190; c=relaxed/simple;
	bh=3j8AEHjzX+9550KljDfUhuyZS6KOakt9tAOqLzYz8X8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFV4JYQBjx3iojjpUVh7JLBeyc0WeoKxMU7MX1A8hwKiV7emMbnnBUvMk72qdNB4VW60ecctV64rhEjuyw4UHrO/hWipElJ9Nmaptur71pA7L8joHgphzZQbARFYv2HOhBoN25cSGbPxkDji9I6UVW0a1j439lt44OlhnQFfieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUY8/Aa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiEUj9Xo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUY8/Aa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiEUj9Xo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62GQx2992786
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0ImcTbASTXashGK30gReg9bTkWROKC+hTyfARBxTac=; b=hUY8/Aa7iZVYFWKT
	VLyajmYQ+mHU/d4sjdGJoKmIBCBikudpcFV7/edKtg7FkYbmvoGDnZAJz9uQ2i8g
	DbyVsNNXRk1tGzf4jtDuHK35B6WckqS7PePeVTBcXnMc7NHlZvLpH0M3fwneMnLf
	+bJjZlV47C7v24A69cXF1hbHhabUS1YVG0sakbkzQnw22OrjZUCoOfQLNj7lMv2e
	6yNkdeSQYwvYy3TuFnOmqUttE7GIHWfvyACJOn1y9mswCiVmA5XqIWU1kyRXrJbD
	HquglXt/trjsZvIErvAJduqopVohD3DnMX5f6AgLtWSIiz2BxaETcCqdP7c53hgp
	oC0mPQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049dkqwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so801659a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786515187; x=1787119987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ImcTbASTXashGK30gReg9bTkWROKC+hTyfARBxTac=;
        b=CiEUj9Xo1FslHTUxkgEvVPYEJcSWvg+zvJDFNf83vxSjmFJsjwJE+WYKbfbcCfp1jn
         aUP5/sIRfLXHDYuG9cCYpYX/Dg3SjMOJoSUmW2nwOlwsSLRva/BFrv/xvMpJc5wkR9fA
         qk+nu5OWAvz9QPh2V3dG26+SEr/qy3as9E85IDo+lEl4SOFscp0fhm1KmAVun7pCL/r1
         3DrM9CmjtrhQ2+bbyw9aqqVoyXbp+25cQA+e20VicgQ5vg0P2eg40m+WkmmfbjHegOtq
         Gs/5pwYIfIzvbizHUV7363rtGScZvY3t0cEBWQDfqbV12Es23xAGnq1EgU9+IvW/QTvE
         v1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515187; x=1787119987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0ImcTbASTXashGK30gReg9bTkWROKC+hTyfARBxTac=;
        b=g6UrqZdsW5xujIYRvm0PToYwLDIeiDlPsBObUhcYOo9+DZyDjmITpFr9gQoCvlVZnd
         YtwhQJH3D8YFGQp1FqdxJsJ1qaXSEX/SYWys9YHP9HW+REijBZ7xyBUA2tYUD/pdRDkB
         BSXXSbomOOALp/5v8LiX2cU8EWLK4luc+a2nXC87bt57D5wkZ+yPXf1IvcElalvXLPLG
         el6e/U1Q0esI4n2q9PG+E/lfeFlY1DHtiFEKfv/kCR5PRbyry+rRJBjg/lU2Wa09a+VL
         CDWqC0DbgsHqxPmVPLrmDf0DxUyMeNlAQLJ8iaA61Fo/L/zeUc3L5D468mZ5Jr15Xgsv
         2lmQ==
X-Gm-Message-State: AOJu0YxCxQr+gx0W5kfjtbsff3ZEhvz2hCnT+9dnFaQq+1A6vHWRkQ5Y
	I4uXh/bAfAaEFaer4v6EuI+E5s23vMpUErNMpKRbDxW/h9pLD2CScUmHCyekn5ookQ3DCYybj7d
	OpXALtMi/PmYFrelwNwesMTqnGgOhLznvCxmeK7fYgpNfCjYXH8gaOPY9SiZD3nHvpA0a
X-Gm-Gg: AR+sD12blam7KSDpSgWiOudGCmGTZ8ep57B0YzpDs9jTBpKiFLyMtvTUrI99L85B2TH
	3jAtgCGN2cAg+FX5d5WjFK1QF5dAU2zx6Ap2/L+0DfhE2rvxsygXYJTzGHHJ9yNgCjBRJ8YMOB9
	Evjoqftjjmsp9SFOBy/TfkipFEE7jJTR/C7TGt2VbPshlngrw1McQGblNtzjJeCDkQRkN+lWwiR
	BTuzQdDuRMF4c4XY6UDkFpn7NQIeybWZd7LMQlDnhLwK0eL+4WnQBDAkU5ehEWHNsKfKi/IIsxy
	dv47jqNdGzUXC3pGi7YOanExQLycqpyYCq8Xih3+o9kh1mdVuDZl2hSZ66f5jazcH38hNJYrErW
	N1xktGMVTQekbk1C/BqI8QpAI7evA
X-Received: by 2002:a05:6a00:4089:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84fb5517d0fmr2940994b3a.20.1786515187144;
        Tue, 11 Aug 2026 23:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4089:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84fb5517d0fmr2940946b3a.20.1786515186471;
        Tue, 11 Aug 2026 23:13:06 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2587fsm525814b3a.49.2026.08.11.23.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:13:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:42:24 +0530
Subject: [PATCH v3 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
In-Reply-To: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786515174; l=9063;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=67Fa8CY1mNY2j2rKzygRueeKlXerFEDLCtJHVlrIpPs=;
 b=/LEuk/Pj8ChTaWLO2YnQCloTzSMg5jFscDlIh8RbxfHooPR3tEJFTckiFN/7v7QnKeVbNE8oC
 KDDMFQC1zdDDtEpkScOTXtZZlpVlZZmBP/YX7hwIQjbahRwhY+5Nnm5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfXw6U26683wzXn
 rLHvX/EtpLZMJSYM0zVgs/Un/3xQkdNA/V/L38kKE1ZxDMWOMWnrGEN+wO53lV+hCk8eRttwT20
 wl/VrdH8DmDhAvAaoyLH7U+ThL2NPKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfX91PsEBhRl1O+
 KjL6iIlpB229PYo9fyoBLqO72KFIilhPXU7+hX/lEV0gg9jKEcXWQqrZD+4OxGI8RC0uwrB1qgU
 pa/dLfmg1UjXNQQjGSvCrWz7DagzEoFqKVd3WyywY6I/PwGPmH4kwrXnoDWLyUblz1UZgAv6vAE
 pEZ/4opWr1B2s4YHwD+rCq1DDf6BA3c9jiy8gdbC8e/rq+/P72Xk4L2uFUC2k9eU3wFZUZYPyxf
 PbFac+bT6MQgHV9gF4MSAB9sAPWvV8UR7SxeQOfEJwwUgIw8w1ZI/PfSs241JobmwLus6iWwAa+
 pXaFUftJ18ejur+uzMt2Tk7f+5rhi0rwJ1mo7yVQk77lObX9HHk6wTOv+com5xkPdxs2psZ0cnj
 1odvpXJXPAJtjRQSPbO7hdDiHfpXAiuf1/ZT1p3U5Cgfk02alrZdN9ADqg61MswOSCoqAqGmA4j
 dXsnsUriNNFNhDVo2jw==
X-Proofpoint-GUID: 7e-XZHIMNYL15r5lLUM9bxiT_C11HpOD
X-Authority-Analysis: v=2.4 cv=CbA4Irrl c=1 sm=1 tr=0 ts=6a7c0ef4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=MagqEQorHcLrW7LXruoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: 7e-XZHIMNYL15r5lLUM9bxiT_C11HpOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120047

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

When an RPMh transfer times out there is no visibility into which
TCS was stuck, what commands it was carrying, or whether the
completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
capture this state at timeout:

- Iterates all in-use TCSes and dumps per-TCS control register
  state (controller status, AMC mode, IRQ status) and per-command
  register state (address, data, message ID, completion status).
  The accelerator type (ARC/VRM/BCM) is decoded from the address
  using cmd_db_hw_type_str().

- Queries the GIC pending state for the RSC IRQ via
  irq_get_irqchip_state() to distinguish two failure modes:
  * AOSS firmware did not respond (IRQ never fired)
  * Linux lockup (IRQ pending at GIC but handler never ran)

- Reports the completion object state to cross-check with the
  IRQ status.

Store the IRQ number in struct rsc_drv to enable the GIC query.

Wire rpmh_rsc_debug() into the rpmh_write(), rpmh_write_batch(), and
rpmh_read() timeout paths so that all three blocking RPMh callers
produce the same structured TCS/GIC diagnostic output on timeout.

Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-internal.h |  5 +++
 drivers/soc/qcom/rpmh-rsc.c      | 90 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          | 12 +++++-
 3 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index e3cf1beff803..c06f81da140e 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -98,6 +98,9 @@ struct rsc_ver {
  * @tcs_base:           Start address of the TCS registers in this controller.
  * @id:                 Instance id in the controller (Direct Resource Voter).
  * @num_tcs:            Number of TCSes in this DRV.
+ * @irq:                IRQ number used by the TCS completion interrupt;
+ *                      stored to allow querying GIC pending state for
+ *                      timeout diagnostics.
  * @rsc_pm:             CPU PM notifier for controller.
  *                      Used when solver mode is not present.
  * @cpus_in_pm:         Number of CPUs not in idle power collapse.
@@ -123,6 +126,7 @@ struct rsc_drv {
 	void __iomem *tcs_base;
 	int id;
 	int num_tcs;
+	int irq;
 	struct notifier_block rsc_pm;
 	struct notifier_block genpd_nb;
 	atomic_t cpus_in_pm;
@@ -141,6 +145,7 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv,
 			     const struct tcs_request *msg);
 void rpmh_rsc_invalidate(struct rsc_drv *drv);
 void rpmh_rsc_write_next_wakeup(struct rsc_drv *drv);
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl);
 
 void rpmh_tx_done(const struct tcs_request *msg);
 int rpmh_flush(struct rpmh_ctrlr *ctrlr);
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index f881af35ecfc..ffef4ffc7c4c 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -10,6 +10,7 @@
 #include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -89,6 +90,7 @@ enum {
 #define CMD_MSGID_LEN			8
 #define CMD_MSGID_RESP_REQ		BIT(8)
 #define CMD_MSGID_WRITE			BIT(16)
+#define CMD_STATUS_TRIGGERED		BIT(0)
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
@@ -693,6 +695,92 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return 0;
 }
 
+static void print_tcs_info(struct rsc_drv *drv, int tcs_id,
+			   bool *aoss_irq_sts)
+{
+	const struct tcs_request *req = get_req_from_tcs(drv, tcs_id);
+	unsigned long cmds_enabled;
+	char rname[CMD_DB_ID_SIZE + 1];
+	u32 addr, data, msgid, sts, irq_sts;
+	bool in_use = test_bit(tcs_id, drv->tcs_in_use);
+	int i;
+
+	sts = read_tcs_reg(drv, drv->regs[RSC_DRV_STATUS], tcs_id);
+	cmds_enabled = read_tcs_reg(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id);
+	if (!cmds_enabled)
+		return;
+
+	if (!req)
+		goto print_tcs_data;
+
+	data = read_tcs_reg(drv, drv->regs[RSC_DRV_CONTROL], tcs_id);
+	irq_sts = readl_relaxed(drv->tcs_base + drv->regs[RSC_DRV_IRQ_STATUS]);
+	pr_warn("Request: tcs-in-use:%s state=%d wait_for_compl=%u\n",
+		in_use ? "YES" : "NO",
+		req->state, req->wait_for_compl);
+	pr_warn("TCS=%d [ctrlr-sts:%s amc-mode:0x%x irq-sts:%s]\n",
+		tcs_id, sts ? "IDLE" : "BUSY", data,
+		(irq_sts & BIT(tcs_id)) ? "DONE" : "WAITING");
+
+	*aoss_irq_sts = !!(irq_sts & BIT(tcs_id));
+
+print_tcs_data:
+	/* All TCSes on a given SoC have the same number of commands per TCS. */
+	for_each_set_bit(i, &cmds_enabled, drv->tcs[0].ncpt) {
+		addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, i);
+		data = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, i);
+		msgid = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, i);
+		sts = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_STATUS], tcs_id, i);
+		cmd_db_read_name(addr, rname, sizeof(rname));
+		pr_warn("\tCMD=%d [addr=0x%x(%s/%s) data=0x%x %s sts=%s%s%s]\n",
+			i, addr, cmd_db_hw_type_str(addr), rname, data,
+			(msgid & CMD_MSGID_RESP_REQ) ? "resp-required" : "fire-n-forget",
+			(sts & CMD_STATUS_TRIGGERED) ? "triggered" : "-",
+			(sts & CMD_STATUS_ISSUED) ? "+sent-to-aoss" : "",
+			(sts & CMD_STATUS_COMPL) ? "+resp-received" : "");
+	}
+}
+
+/**
+ * rpmh_rsc_debug() - Dump debug information on a transfer timeout.
+ * @drv:   The RSC controller.
+ * @compl: The completion object that timed out.
+ *
+ * Dumps TCS state for all in-use TCSes and reports which accelerators
+ * did not respond, to aid in diagnosing RPMH timeout failures.
+ */
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
+{
+	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
+	bool gic_irq_sts, aoss_irq_sts = false;
+	int i, busy = 0;
+
+	pr_err("RSC:%s\n", drv->name);
+
+	for (i = 0; i < drv->num_tcs; i++) {
+		if (!test_bit(i, drv->tcs_in_use))
+			continue;
+		busy++;
+		print_tcs_info(drv, i, &aoss_irq_sts);
+	}
+
+	if (!rsc_irq_data) {
+		pr_err("No IRQ data for RSC:%s\n", drv->name);
+		return;
+	}
+
+	irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING, &gic_irq_sts);
+	pr_warn("HW IRQ %lu is %s at GIC\n", rsc_irq_data->hwirq,
+		gic_irq_sts ? "PENDING" : "NOT PENDING");
+	pr_warn("Completion is %s\n",
+		completion_done(compl) ? "done" : "not done");
+
+	if ((busy && !gic_irq_sts) || !aoss_irq_sts)
+		pr_err("ERROR: Accelerator(s) at AOSS did not respond\n");
+	else if (gic_irq_sts)
+		pr_err("ERROR: IRQ pending at GIC but not handled within timeout\n");
+}
+
 /**
  * find_slots() - Find a place to write the given message.
  * @tcs:    The tcs group to search.
@@ -1114,6 +1202,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	drv->irq = irq;
+
 	/*
 	 * CPU PM/genpd notification are not required for controllers that support
 	 * 'HW solver' mode where they can be in autonomous mode executing low
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index f881c4c757ec..095c73f3f75f 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -230,6 +230,7 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
@@ -241,6 +242,10 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	if (!ret) {
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
+		WARN_ON(1);
+	}
 	cmd[0].data = rpm_msg.cmd[0].data;
 
 	return (ret > 0) ? 0 : -ETIMEDOUT;
@@ -294,6 +299,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
@@ -305,7 +311,10 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
-	WARN_ON(!ret);
+	if (!ret) {
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
+		WARN_ON(1);
+	}
 	return (ret > 0) ? 0 : -ETIMEDOUT;
 }
 EXPORT_SYMBOL_GPL(rpmh_write);
@@ -422,6 +431,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 			 * the completion that we're going to free once
 			 * we've returned from this function.
 			 */
+			rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compls[i]);
 			WARN_ON(1);
 			ret = -ETIMEDOUT;
 			goto exit;

-- 
2.43.0

