Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130D3EC808
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304117; cv=none; b=rkMKRRwngGTlaDOnkE9QcG8QAe/+/bxhugYvfB749qaKSi6FX8hiaoyA0gzPSwzDWi2Q+Ck7HUl98qALIJH9X3xGj5qQtYL9Zq6w0CcDy4+S2etVua1c+5bLBnJtoBmw7BZXIt7iz38rn90LNvD6tgG+7dmnzxFbm/+r2tADZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304117; c=relaxed/simple;
	bh=st7+2RLBtLVybtoS2yGS90Bce/yZ8E3s6EntD7ajDjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaL8eC4fzovhGAIJq2BozbvA0PuX1jtdrl2mZEy5jQRCZ8dwi6xztYnYkm0j9vNUI0ESXh48VLh5yq+Gyt6cH7JI75BcBJvpwOCphrFvzJRsr/d4qLaUvVYyyAd1IO9zrRxR/htsN8/EPLPHS0cbuwLZDzY1RV+hWRpZh+FHwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EidypPZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtgelJDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EidypPZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtgelJDP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAV9hA2614375
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHyEsG0xo3BEItrcpTsmjJGGFpOMslQI9IalS5y/Wdk=; b=EidypPZMfKFHZOZD
	CmdV2VjDf0w1hZOoViHzX2p2YcVczwGxYGZ9rIkDd0QfKnLzMZlFWJIhebJh+8Hx
	conpRYAGkYLeqTfnpkuhLUXxVU2nQWtzrrx18LGaWWtIbfcZlyptdBTueqJcoFsf
	LE2R4JNLMv7702aF94v8LNQ2aOkEk+I0BFH5YpVl5GgI2Pksrm9JMeoHZFuCqF6Z
	ODeXZhJgbH31k1QT7Av+/5mHnpdhbOYZjApzZ62pJpT/FbhXpMYeywuwZC4eDafH
	qt+hqmZvVJ15JMFEF178q1HjvtH1mgUSTfL9eVbE5kExANYsKRHfXzEDUrUoBwzd
	AMjVeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ck89r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:55:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so639474a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789304114; x=1789908914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHyEsG0xo3BEItrcpTsmjJGGFpOMslQI9IalS5y/Wdk=;
        b=GtgelJDPKTQISs6owDMPgmI2gx//PUDO/iYMRqTgA+m7o20MOoMxuH/1TZ8qRuikOL
         4k2bYNxOu4HdvvGCNCjV67gOPEKaagfs22AoZ02d1Iv/kAR/G/G38rrqV0JWGs1RQpAN
         YnWR+cpHye2JsVP85LFsAW3HgvO8RZdqAXW3SRxPdkVRnLPFc5Z4sb2M/mCpPifP42Fg
         J+HZ9plEcplmy9dJ/B8anno36TJigxXleF3lXgbzpdWf4M7qhnuzjH81qONrMarOnZIp
         KfbLSj8lY5KP57+LPn7niowuH6BK2QSjkCLi1Ft4FvwggTp3xARzMd53pOdVxwehNuMS
         +T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789304114; x=1789908914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHyEsG0xo3BEItrcpTsmjJGGFpOMslQI9IalS5y/Wdk=;
        b=LaYunzOWEiuAIPYfGxnBx5Vo/USw4fs5CWWcw8LoRjlP7IkDGU4KngJP9LAXHWrNU/
         qfdT8cxXbVqEQxNEuxCKDaJQPyYbM4iMVOcKydg5+zYwcdsGKwiOmanQQX+l6jxWA1gH
         K7/X4pizqH/M1aeVvXiOR5IsqcCUE7BzEdTSsx1Loqgzg7ZNce2il2H/rtaaqJNtSpBe
         HdKz7CJbhKj5dxkOjjBQZdyChGymxzqP++JJNkUnQWPiqn/yE0dSzKSGWUP7w6+fvm0/
         /gjlAi+0KKKu2GBlcH2HNI4eT2cw+BvyNyzzBYt6mwpzfQCG+VONlDMzq4HAsC7tt9Nt
         XMEA==
X-Gm-Message-State: AFuF++n+1nm6lI4JFRSPPVibMhZ+jqFQXOpzf8LBOYw4aHZkyRTxnI25
	BcNvbP8aFDaq9jdGfFrXc61pE++8U3Cyd3d3c0cJQRbrF49ep9DUcx2xLDikx4JVzgsAV2RNjXq
	EE+osPmieBFc5xnM41e0eUmojcKQQJpr4Lky5hELP3uOdOHdp0CwqIBONmyNrpkVjQ8AKZ96NOW
	HF
X-Gm-Gg: AYBFou39R+5jl7vEngrW3UyoUoRDeI7tFW5LPj6d6Gz0WkxL6G6oJrnxVHdveuln1kb
	kVUNsvIRU5Ugv2bOPG4G4RFoiuSpwlgisQru0ZEJ/43GU+4pX7ZLvf4INNDTKWy4rPujtrIh7Xe
	VUgDs78aI5ldsWSTDIFVe2z5Qm6SvzbZcq/MolUqHk5qBM46+qt/g9GRZbIKWSS1VBvWCVDYEQP
	y7V7eJe4lYeG9Wy+7q6St3NfJHrPp5+MOmoxa5Q8bHom2/OtDiWVNb210Z3ELzOB4+inI/iVt6v
	iu726Lobp4gOrXFvOn46od+gEZ1tzlFxn9zW0JM0aQBlMT84nif8J/49FqdbUG4Sdzs3QgnPDsy
	CXeCn6VNPcflAGc/Oz4By3XRt4fMf
X-Received: by 2002:a17:90b:3a0c:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39d9bc10065mr22904657a91.1.1789304114170;
        Sun, 13 Sep 2026 05:55:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0c:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39d9bc10065mr22904602a91.1.1789304113666;
        Sun, 13 Sep 2026 05:55:13 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm18027211c88.1.2026.09.13.05.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:55:13 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 18:24:25 +0530
Subject: [PATCH v4 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rpmh-timeout-debug-v1-v4-3-e94d3e416ea1@oss.qualcomm.com>
References: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
In-Reply-To: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789304099; l=9712;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=cFSfk480HWFmQews/kB8NaOZPyiRJUPYC/066WP91oI=;
 b=MafbvCMENboOKcnpsiv3+G+iw37PCEqCMMdT0ZbNPCHNeNd+xIxREOb2K91FgJp86/f3FOqJi
 A1PUlMMQWX9BqjIWTClBe68ZOYqp8vAv04MH6gUyFKAE9PDSMM3GEfg
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX/r+iesdJm5Ea
 Ti7Cu7OQBDSvR0BoihQxAf4rYc7l5WFiMCMaWcePieBxSH8P9MyPg196Cr5eJfcFBv+2N6nK299
 qP1XK0dPU5tjkrM6XWJRNJXUfksB53uEDjs08woVQebVPngZWIDVBEzOC4/iT5aZSLym/crOARq
 7fdpbv5qkKh2GK2bRcLCp3szbDrguUr/Y4bU2Szfbdnp9T/B4bIq5j+kmo92myU7jTOV7/UrqA7
 FSH5NGagD+xGdirdEieLDBSGefSTd3EkejoSD9KzseiySgF0MAlLXu3RQSSh3AqeFHpgCJMmema
 7aGBDmNzWaSeM6TSbB97EWAh/othO+9T82fWh0GHplxLP6zHie12VdGRYe28oeftVTO4tsIlTAl
 xN0TzM8RqCdmd5ZDAO68bndCx4b4Vxjb1r60LlGh6jOj1xr0J34VeSNz/EFQKQbI1nsJoMwgygo
 VeAWyNA5jjHdyeYbMRA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa69d33 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=yjXalD45XKnNG4PGhjAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX5N0gaeeVoPdQ
 26Bm/JmEW0EMCgmLN0BQsTK+Ov+yc/zp7TjExC5HKurzBBdtCQt4zBn11kJzra7i9L0+QOkastv
 xYKApoY94IdC2aFyogjsOodSDaYeygw=
X-Proofpoint-GUID: PIcGwO3_i6FrIjXzoRwW88SuRDkuNdDJ
X-Proofpoint-ORIG-GUID: PIcGwO3_i6FrIjXzoRwW88SuRDkuNdDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130184

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
 drivers/soc/qcom/rpmh-rsc.c      | 94 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          | 14 +++++-
 3 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 39441a25af9b..4e465bdb5a27 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -104,6 +104,9 @@ struct rsc_ver {
  * @tcs_base:           Start address of the TCS registers in this controller.
  * @id:                 Instance id in the controller (Direct Resource Voter).
  * @num_tcs:            Number of TCSes in this DRV.
+ * @irq:                IRQ number used by the TCS completion interrupt;
+ *                      stored to allow querying GIC pending state for
+ *                      timeout diagnostics.
  * @rsc_pm:             CPU PM notifier for controller.
  *                      Used when solver mode is not present.
  * @cpus_in_pm:         Number of CPUs not in idle power collapse.
@@ -131,6 +134,7 @@ struct rsc_drv {
 	void __iomem *tcs_base;
 	int id;
 	int num_tcs;
+	int irq;
 	struct notifier_block rsc_pm;
 	struct notifier_block genpd_nb;
 	atomic_t cpus_in_pm;
@@ -149,6 +153,7 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv,
 			     const struct tcs_request *msg);
 void rpmh_rsc_invalidate(struct rsc_drv *drv);
 void rpmh_rsc_write_next_wakeup(struct rsc_drv *drv);
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl);
 
 void rpmh_tx_done(const struct tcs_request *msg);
 int rpmh_flush(struct rpmh_ctrlr *ctrlr);
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c4542318eac4..2aa5e035d3f1 100644
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
@@ -25,6 +26,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/wait.h>
 
 #include <clocksource/arm_arch_timer.h>
@@ -89,6 +91,7 @@ enum {
 #define CMD_MSGID_LEN			8
 #define CMD_MSGID_RESP_REQ		BIT(8)
 #define CMD_MSGID_WRITE			BIT(16)
+#define CMD_STATUS_TRIGGERED		BIT(0)
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
@@ -693,6 +696,95 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
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
+	dev_warn(drv->dev, "Request: tcs-in-use:%s state=%d wait_for_compl=%u\n",
+		 str_yes_no(in_use), req->state, req->wait_for_compl);
+	dev_warn(drv->dev, "TCS=%d [ctrlr-sts:%s amc-mode:0x%x irq-sts:%s]\n",
+		 tcs_id, sts ? "IDLE" : "BUSY", data,
+		 (irq_sts & BIT(tcs_id)) ? "DONE" : "WAITING");
+
+	*aoss_irq_sts = !!(irq_sts & BIT(tcs_id));
+
+print_tcs_data:
+	/* All TCSes on a given RSC have the same number of commands per TCS. */
+	for_each_set_bit(i, &cmds_enabled, drv->tcs[0].ncpt) {
+		addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, i);
+		data = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, i);
+		msgid = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, i);
+		sts = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_STATUS], tcs_id, i);
+		cmd_db_read_name(addr, rname, sizeof(rname));
+		dev_warn(drv->dev,
+			 "\tCMD=%d [addr=0x%x(%s/%s) data=0x%x %s sts=%s%s%s]\n",
+			 i, addr, cmd_db_hw_type_str(addr), rname, data,
+			 (msgid & CMD_MSGID_RESP_REQ) ? "resp-required" :
+							 "fire-n-forget",
+			 (sts & CMD_STATUS_TRIGGERED) ? "triggered" : "-",
+			 (sts & CMD_STATUS_ISSUED) ? "+sent-to-aoss" : "",
+			 (sts & CMD_STATUS_COMPL) ? "+resp-received" : "");
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
+	dev_err(drv->dev, "Timeout on RSC %s\n", drv->name);
+
+	for (i = 0; i < drv->num_tcs; i++) {
+		if (!test_bit(i, drv->tcs_in_use))
+			continue;
+		busy++;
+		print_tcs_info(drv, i, &aoss_irq_sts);
+	}
+
+	if (!rsc_irq_data) {
+		dev_err(drv->dev, "No IRQ data for RSC:%s\n", drv->name);
+		return;
+	}
+
+	irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING, &gic_irq_sts);
+	dev_warn(drv->dev, "HW IRQ %lu is %s at GIC\n", rsc_irq_data->hwirq,
+		 gic_irq_sts ? "PENDING" : "NOT PENDING");
+	dev_warn(drv->dev, "Completion is %s\n",
+		 completion_done(compl) ? "done" : "not done");
+
+	if ((busy && !gic_irq_sts) || !aoss_irq_sts)
+		dev_err(drv->dev,
+			"ERROR: Accelerator(s) at AOSS did not respond\n");
+	else if (gic_irq_sts)
+		dev_err(drv->dev,
+			"ERROR: IRQ pending at GIC but not handled within timeout\n");
+}
+
 /**
  * find_slots() - Find a place to write the given message.
  * @tcs:    The tcs group to search.
@@ -1114,6 +1206,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	drv->irq = irq;
+
 	/*
 	 * CPU PM/genpd notification are not required for controllers that support
 	 * 'HW solver' mode where they can be in autonomous mode executing low
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 360242a315e3..1f10b85514f1 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -224,7 +224,7 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 }
 
 /**
- * rpmh_read: Read a resource value
+ * rpmh_read() - Read a resource value
  *
  * @dev: The device making the request
  * @cmd: The payload having address of resource to read
@@ -240,6 +240,7 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
@@ -251,6 +252,10 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	if (!ret) {
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
+		WARN_ON(1);
+	}
 	cmd[0].data = rpm_msg.cmd[0].data;
 
 	return (ret > 0) ? 0 : -ETIMEDOUT;
@@ -308,6 +313,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
@@ -319,7 +325,10 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
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
@@ -438,6 +447,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 			 * the completion that we're going to free once
 			 * we've returned from this function.
 			 */
+			rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compls[i]);
 			WARN_ON(1);
 			ret = -ETIMEDOUT;
 			goto exit;

-- 
2.43.0

