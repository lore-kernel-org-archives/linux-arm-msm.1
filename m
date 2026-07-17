Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F8F38D3F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274641; cv=none; b=scehAzTwcBmjz762Dq+cC73ipmRDuRN9IIjAiLv29tNRrmK43GZpWEnBAcJm/A4Uuu/likrgsM43FMB6L0qLTNmrh+IshnB0HoNweVaxq3Z4tgppR/U8jI/2INRNlBji1iq0zJAbxoYQke1BxB3U9uMeDR5Gp8MxfH5zkXkM2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274641; c=relaxed/simple;
	bh=vOfnmeXU0cqc3MHekNbIYc2ae8UgN9gwMn0gpt2wTmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTFyYqduSUrsFsRDx0XsnuwfM7cAkg6aEwNYqSviKGtC0kau+h0Wc2jhyhow6SuEvgD0x/S7M0SzSKWa5JCwql9Wq+KR63vL3py8nUOjFS8Y47E9cRDxMXpfOdpYSJU8T/xYw4Td9FPA9u6rjLce/Ld0+zY5TXUPWrioQ8TeYUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTPolJQO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POqBhbdA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTPolJQO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POqBhbdA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQTA794251
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvTYPin2ZMDeLYHmh2fTtQMYHF63GklDWCdhpRXRrfk=; b=OTPolJQOy9Eoje3J
	VB/VUMJYHo7iEXObPS3seUwg+STUVzr+TPpAunyH8ISXPv4fummBQliJQRJy9Z4m
	88Pc/aDj5LPIcgzQgrRLxRTuAJp/mdyeU4dtfgXAK+lEfhMRECfNmQmQI5iv08L0
	czASHDXsIlvnwWRZejqw2+xpMRFkv3ZtIiYNmUF0/bVVocWwyi3kOpI1JfjmKNp0
	lzuxPOBqFNMr2FNLw4pPrmPwUI8t0SXUkrwU3KFP16OnDRY9IKJ1FRSm/xNBMmsI
	wxQn6QHKIoYGLdHPgW+l2+gCsYFZ39fYGSlpi0v71Ap7ZFJvsYZj0Opp5rP0UHHe
	Y0txfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jpqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84854c2f888so13664921b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784274635; x=1784879435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvTYPin2ZMDeLYHmh2fTtQMYHF63GklDWCdhpRXRrfk=;
        b=POqBhbdA09aU/Aj30W6C9TLdwi3Gi1Otw3eS7bzKMyTFzRJ/dQvqY6L64Bb2H/C32j
         LdoeIevgFID8ic1TKodHzbU3I7Ts7paWllwWF+tYFqArKABYhBaEa9IGivjldMLGt6nU
         DL4LTpUI2RiNHb+E/juAY2jd6y9+GwpJujQ0ekb0hrrqL0zFUVYm7CjtnMd+peaFazdr
         z+5s7VmWrAnsZ4Nyr5od7CW4YQlKO5eStn2eddAXm6KQPUjKJILRJXh8TBoNtN80BtFP
         b68qcDR7dyqudpb30JgodQ8jtP5jTp00H984YIv7yxB5xjZ1hITAQTVW4m1a/rlM1NZB
         NH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784274635; x=1784879435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvTYPin2ZMDeLYHmh2fTtQMYHF63GklDWCdhpRXRrfk=;
        b=VCkPTj4P+3Wdkqcqrrmk0cx2646DFu7yjOw8NQdRNnr7vrxeyDybcQj5djtBzYzZD6
         ENOfai9lvCuSw+fi8lkU1a0EnUiy69lUrTeS4IerG4w23ykASp7zCOYLN2TWx3LsswQX
         lidfxqAMHr0vXiwF9msf4iQpPeKxcEv4WMuk9tWhZQwo5GzV4BFk03kTLNFI61ZlBjov
         v+Cbre6FjiLtaXfUBPvtFoKl/MuFMD82k4sAHKBcxwx+bslITzbnTYwglmDckfmZcss3
         +xecHHfCMXz16ls4ZfTRj/HEc4H+5JfwTqVZOHFM/lPUlvbyVvAy0IAyGxz3Hw3rAgM8
         OGNA==
X-Gm-Message-State: AOJu0Yw8Bfyd4OBHpGvI0JmCJI6qz0jjUgSk8oG9GSgVtJn3un0sFtKE
	wyySP+z1H1ymNJROWe1W4LZuY0iJ0xBgsWRibSpJutDk3a4u51czS4gLe7eec0t7/IB/7FWrcpQ
	3S07LUEifLrTrqEURGGJCTI5KS2BMONvZH+MbssneDv/nUqS5E8G5vph75S48fXbas+Rl
X-Gm-Gg: AfdE7cn2Ujwr/fFiMOjwaOkiYWS13En3oMYL8gtJk2xyKsVIUDGt1QbqNR8z9+zyXDM
	zrXlXByG6qh5/yyhfiMwSYg4MdR2HW0wBVPrMkoQae5t7NBXzywxzv+dGOw60DpHOriDnRQoBhT
	c7wDTptEc3jEmbvlb4vrJPa2EzFyuu+yc6haTbQd9diJ2wefkG0RfGcy5d3Je6YhKg8lGBvdS4n
	jND+ViqL/eQ3JRhxwYNpLsFBNVAt0gKnBUtT9e+U9C1gj644zD5Zkv0Nyez8Wds5ZXdo7WLmV2V
	HTvmynfsfm4PIQ+Nb7f+POymRbvyszkrkVCmb1kVieQYN5dc2rrj87PZor0OGyXjsQj0/P42/Nh
	XUJrqt/dHiKPncxEy1G84YEOUwt0Z
X-Received: by 2002:a05:6a20:a109:b0:3c3:a4f4:c5be with SMTP id adf61e73a8af0-3c3ad604d37mr1639034637.2.1784274635093;
        Fri, 17 Jul 2026 00:50:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:3c3:a4f4:c5be with SMTP id adf61e73a8af0-3c3ad604d37mr1639006637.2.1784274634489;
        Fri, 17 Jul 2026 00:50:34 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f223sm449323a12.9.2026.07.17.00.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:50:34 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:19:44 +0530
Subject: [PATCH v2 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpmh-timeout-debug-v1-v2-3-81ade4fcdb49@oss.qualcomm.com>
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274624; l=8106;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=hHp2PU5h+PtbUQkU62WFx5wOCGcIHx3udLLCNvTmcEY=;
 b=Ymi5rJWG+9RBKluoh/3fDyj3eEb5/o2RmdaWSl7+qSC0k9cwHycfcv+XsmV6EReO7fQcNMpau
 5/w9uvfQvJ4DFvRU3qm3wjgLvAAKkufvM31JIdU/WCqHratdyTO5u9D
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 7OtdG-m65bYqmFvy_iMeiTiQIxYFr2DR
X-Proofpoint-ORIG-GUID: 7OtdG-m65bYqmFvy_iMeiTiQIxYFr2DR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX5afQs7DU0iD3
 TCZGPEJLVw+CouND4M95G+7PS3CtjcBGOoF2SjXvpdp6cuLfQkHWBbwUWsJ8wVGpbgswa3qbyhr
 Z4mYP06cUd/Ny/gQWHEtp30/S6/OLtU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXzC9My+WmtSIm
 +QTtiOPbOX1O2XF0W//xr49JZS2nmF4ETmbNCvTR85hS5tIk1q3+QQVQ1FKvRNxQtVsaKzorhNG
 QNddrXn3ZKAFOjEc2SP2Em4dfcHsWToovMIkX8w7nL5bXAthpiA1Nl8LBvWCK00tOextMvGT56P
 z1Jqd9cBdCy6I6gsRbej/S3MnIF/Vfsbk7oHxxdpuKDaap+Am8mlYj7PmEm8jmptmNcOeRiMFdG
 hgvl3nmB3kezqquQ+RB+r2EYxpibhhER6dVkaG4e5vAtUXrJrfoBhxYLkXbeFev5o4PXXN/q9fG
 ejjcR4SNBLhqJJ8/G1AEKkiESCKp0KikEaLNFvEA5MrH4AGTuJg3JYRuZNxxvzymJ76Ef0s55lo
 Zuvq6Jz8oo/yOElbrCeEZE7jC/Zu6HCs7kdTPfLQXdnIfxfx4rvAt/MyvOJeKwlFBAigv0N1gGc
 rUET8ukgd35JfokWWLw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59decb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=trosdIjOZtX46syy6LIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170076

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

Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-internal.h |  5 +++
 drivers/soc/qcom/rpmh-rsc.c      | 90 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          |  4 ++
 3 files changed, 99 insertions(+)

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
index 66928ca40b9a..a8ccd4085a1b 100644
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
 
@@ -684,6 +686,92 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
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
@@ -1105,6 +1193,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	drv->irq = irq;
+
 	/*
 	 * CPU PM/genpd notification are not required for controllers that support
 	 * 'HW solver' mode where they can be in autonomous mode executing low
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ca37da3dc2b1..268f52088fdd 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -255,6 +255,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
@@ -266,6 +267,8 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	if (!ret)
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
 	WARN_ON(!ret);
 	return (ret > 0) ? 0 : -ETIMEDOUT;
 }
@@ -383,6 +386,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 			 * the completion that we're going to free once
 			 * we've returned from this function.
 			 */
+			rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compls[i]);
 			WARN_ON(1);
 			ret = -ETIMEDOUT;
 			goto exit;

-- 
2.43.0

