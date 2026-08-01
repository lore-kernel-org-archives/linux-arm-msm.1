Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709930FC03
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571254; cv=none; b=feXPsoeT0PB5vzHOsBDSjuFIyRIX16x2oKlDQ31lBVlgEaPlZjQs9Xp9BUqo7Ib40xyO+JNaiPHOSNf77Cah+8rB9MuHH7NPlezUJ/gCxDTBmnQmOnLLIvV8Edy04I0gxi0uEpnz+MIggxe+LL4vn92RO38w9Q7HzPPQ7/lGuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571254; c=relaxed/simple;
	bh=ETMJ6aJUjQDC/YVIh0I4Vf8wferbQVh2mtgDYw8tyfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jv5iQuBNZ/1nP06VZ+VNrMuTRSrueuc22HV6AzOSmd4ZWK05dL/pld6BnHVLUO8r8ZuZEqP8p8y3zrgINMbMNw6m5hy5EbbAkFL38Tpfow7RsP4Poeg9g790XdTkroCQ+4qgp4L4fEOphUfF67Cftkz85FYubTqNKTUJhgLxu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QM7+urB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFKNjRrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QM7+urB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFKNjRrb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713M7ug2061133
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 08:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zt4rjJh0Mr/fd1Jmxd+h3Cy43pcxP7RnHzW6QwphjHA=; b=QM7+urB+fekjmjVQ
	dIgMM/MBGQ8Z8CRv1a65slxzRRs6dayNDygRKQ9jxHzZnf9uVDUkuV9aJnTdmtKO
	d8CJ0Rnj15v9uO3wnRSkgUpLCRxk+BY0kxzIj/64GJdykMLKbM/NQ7gJy95jvCLi
	SCPLd9MjNzj++8FR8tgAaSXQ0pa59gMQ825lKTvXKkVf9ckx0AEny49XwCvPxJFj
	JyIjTacuirnfKD2g/F9sIx0acqIquhhhBksrAtX9nRArGgzxVILuZuTYki+FnmXQ
	AKNm5sdED2WJ+qC6tS6jWy2rE4BELTlTxRsmnRSkyh+j2NOi7FDa0E6/JcL0+6Yp
	RYRKKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx0guy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 08:00:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so2987914a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 01:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785571250; x=1786176050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zt4rjJh0Mr/fd1Jmxd+h3Cy43pcxP7RnHzW6QwphjHA=;
        b=OFKNjRrbU5TP5vuslCqLRaGjnLSrQZzNoOaK06JiYn8e430s/+GthTgiecHrqe74Za
         L8fEM/smRa5Hch1/OAXTDhktmEZ6hqqxfC9qubiBQpP+qavky4NgCik5jQm5EMQ+eTGS
         /zTEISk9ILv6kZsqr25ZO6JBLt1p55UNl+ZVTvgYg+txsXyh1tDD8G+VpzYKoUAPwB7l
         WsvKVBYFjK/7GkC/dlE5U9Vu3VC3izFPKvsrLmP80TW/9Lu+hpEKqzx6P8ZNM0zGFVdX
         oMLNKocIpCnxtpJtUs9B3e9mRvyTXbb1x8Zn7wXMcMH7yf3T80VE2ngnESw5v6DMqdKF
         Ekwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785571250; x=1786176050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zt4rjJh0Mr/fd1Jmxd+h3Cy43pcxP7RnHzW6QwphjHA=;
        b=WLHqUn+6lZiMWEki+zwTRH6J0XPmhOVWwsEH3OV8xxWadi+b0ZBW83Om9OuB0Y6fje
         QD2F8ncNyQNLbyIwEhOEuK0FP/MOFnDxfesPEcoEvRTr6/S8jLb3fUCuQSJ8Qj/LaoQd
         qZbAFJUl24mTazO+1jvsBERv8zt097TuTAXx+YLmrKCeoRTBxj2tFe2JWdApSR6mL8s+
         ZmWaY3xJB652ZROqt30J9hstgQky6arocCgPoHl+Pe7hq2VXlfxDI94x4rV01bi2r9R4
         yePikp0BSRY3gI7Kpy1bj6/ce0aJql6ic38ZLG3fDGMR7/Zbb2KjR5ws4u1h7bb6Dxmj
         1FXQ==
X-Forwarded-Encrypted: i=1; AHgh+RriiwITXVFR/3/y7Qd52LVxXvytI7KS/JQ5+HPqKDKa2UJGa4i0OaMByGwq1+wHGfw7cT1ALLbuvyci5Skz@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpM3Cr80u1F61D66Er7SJi3xtIOyFeQKqXSEchwZeniAr9346
	9gGyjpuMOf3sgjRCO3tUtdyJHCTvKluEXW7QQ2RB2kCEguQi9T1uSxTzMwZTp/hP993hy8gqs+C
	6FNnomvn88bpTy0i2o/EJ8oVw2OfXSLSvLf58FQ1W2JQvBj09m7TdJTPwW7Bv0InFx+MOVGIXXJ
	hx
X-Gm-Gg: AR+sD13zSBe6SiehedRGQJQ982O20tG/NVOAJILr36eRwqB5XlLR4QTi8ug6QqBYrmL
	OuscO5hdidQsPqG16/bpjFxovoXaDaiBwo6L8WFHkafizEVa4g2RpEQgK/FNkBcdX0Bk0FFgWCo
	Qyc97qfOwVnGSpzmHAo8QF4km7X+nr9PSCfoshw0YWv7YGwxsPpfV/h/ryuF521b6UZx/0eFrvh
	+6bb4CvuXJWOKOt2hd2M5zuHoDp4qMiHxrl9B/xRwA9zXC4LMro2Abu3rJFb+VwxgJIWg0wM39v
	lXrwVXUUt2DaG2qzKGCu3f+EEDhlP8rqo+9oIfME0h2MM2dI2CotXMhH8sRLyD9yMtwFCZ676/j
	D9JS/3bld+o8z3VAl2bMcT5rpegcJGw==
X-Received: by 2002:a17:90b:4b81:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38fbc3e5c7bmr2526012a91.2.1785571250392;
        Sat, 01 Aug 2026 01:00:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4b81:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38fbc3e5c7bmr2525970a91.2.1785571249836;
        Sat, 01 Aug 2026 01:00:49 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm24739838eec.28.2026.08.01.01.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 01:00:49 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:30:27 +0530
Subject: [PATCH v6 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-read-rpmh-v5-v6-1-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785571241; l=7518;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=qXqGyOeLWQGaBEmgdBm09rvUYbv256ay6Gp1qlrL2is=;
 b=w3CvmUdDEukecARXLPWxqGRpVLKhbwemHPkaR/u8ouktez+9BtTuXoCLyBsZ+W6N5ECZsqv7M
 xC45j8Z2bQtArcbEkqvatIqZ2TQkwbZaycRQUhe/7/p/FzwHA+kiB4R
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX6FWTeDrI3L7g
 DcMC//hgcnN+wYqiDejNYrQYWoGn3HP5RxjwIEorkwMQjw1Y4WT2vSoK55rllmdl4+msQC8ncFk
 /9FJAeDtJAPhbo2eGtITfqqXbcNypYCqrX52zEAmdns+0rnvh9sqgx02M9+zDMfqqoRS91a2Y6S
 ObCgyicYfABig8q2LBK3UbfSXCarjwYwcp+53QopJL08TBwzI891VkSpzT571etmFcrmih9jgcw
 p9tRucGm6omLTyBzC3hw/+6Xzivz6aCzXr5syZ0OtU2ot8TCVTBvOWMkEQSNKroGWXZJcDBTOSF
 8MBVAUkMKKFfCDn9McbNyRYwHGPxOy40TgvljW3zuzQh0d7V4Af6+tBYEKczFIz1tcqAknq90k2
 STHyUS1Im7932cwySyqz6m5VZ1YZvJX64iNV3d6d5wZFnnaShnrkQGRkoz669wEwPv5LrZl2LN+
 gXE3c7o0AiDqo/4Pzbg==
X-Proofpoint-GUID: 8AdSGQ8rBK9ndNlTTqzD6Na0st-BQVD4
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6da7b3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RgaPuue0vXMEEcOqpiYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX7zoypCGr1vGR
 qa0mxO97f99Lgi9PcCX8V0qhFMIFarEan95qA9UAzmjQmjj/msv0SoiuoY7gCDMJRZSZPz2xFGv
 W8L1SPuNn3LGtIKVqCFSFXhmuyhSkoM=
X-Proofpoint-ORIG-GUID: 8AdSGQ8rBK9ndNlTTqzD6Na0st-BQVD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010057

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

All rpmh_*() APIs so far have supported placing votes for various resource
settings but the H/W also have option to read resource settings.

Add new rpmh_read() API to allow clients to read back resource setting
from H/W. This will be useful for clients like regulators, which currently
don't have a way to know the settings applied during bootloader stage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 13 +++++++++++--
 drivers/soc/qcom/rpmh.c     | 47 +++++++++++++++++++++++++++++++++++++++++----
 include/soc/qcom/rpmh.h     |  5 +++++
 include/soc/qcom/tcs.h      |  2 ++
 4 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493..ec85c457ea45 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -443,6 +443,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	int i;
 	unsigned long irq_status;
 	const struct tcs_request *req;
+	u32 reg;
 
 	irq_status = readl_relaxed(drv->tcs_base + drv->regs[RSC_DRV_IRQ_STATUS]);
 
@@ -453,6 +454,11 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 		trace_rpmh_tx_done(drv, i, req);
 
+		if (req->is_read) {
+			reg = drv->regs[RSC_DRV_CMD_RESP_DATA];
+			req->cmds[0].data = read_tcs_reg(drv, reg, i);
+		}
+
 		/* Clear AMC trigger & enable modes and
 		 * disable interrupt for this TCS
 		 */
@@ -493,13 +499,15 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
 	u32 msgid;
-	u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
+	u32 cmd_msgid = CMD_MSGID_LEN;
 	u32 cmd_enable = 0;
 	struct tcs_cmd *cmd;
 	int i, j;
 
 	/* Convert all commands to RR when the request has wait_for_compl set */
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
+	if (!msg->is_read)
+		cmd_msgid |= CMD_MSGID_WRITE;
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];
@@ -513,7 +521,8 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 
 		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, j, msgid);
 		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, j, cmd->addr);
-		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
+		if (!msg->is_read)
+			write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
 		trace_rpmh_send_msg(drv, tcs_id, msg->state, j, msgid, cmd);
 	}
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ca37da3dc2b1..f881c4c757ec 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -175,6 +175,9 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	struct cache_req *req;
 	int i;
 
+	if (rpm_msg->msg.is_read)
+		goto send_data;
+
 	/* Cache the request in our store and link the payload */
 	for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
 		req = cache_rpm_request(ctrlr, state, &rpm_msg->msg.cmds[i]);
@@ -182,6 +185,7 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 			return PTR_ERR(req);
 	}
 
+send_data:
 	if (state == RPMH_ACTIVE_ONLY_STATE) {
 		ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
 	} else {
@@ -194,7 +198,7 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 }
 
 static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
-		const struct tcs_cmd *cmd, u32 n)
+		const struct tcs_cmd *cmd, u32 n, bool is_read)
 {
 	if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
 		return -EINVAL;
@@ -204,10 +208,45 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 	req->msg.state = state;
 	req->msg.cmds = req->cmd;
 	req->msg.num_cmds = n;
+	req->msg.is_read = is_read;
 
 	return 0;
 }
 
+/**
+ * rpmh_read: Read a resource value
+ *
+ * @dev: The device making the request
+ * @cmd: The payload having address of resource to read
+ *
+ * Reads the value for the resource address given in tcs_cmd->addr
+ * and returns the tcs_cmd->data filled with same.
+ *
+ * Context: May sleep. Do not call from atomic contexts.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
+{
+	DECLARE_COMPLETION_ONSTACK(compl);
+	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	int ret;
+
+	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
+	if (ret)
+		return ret;
+
+	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	cmd[0].data = rpm_msg.cmd[0].data;
+
+	return (ret > 0) ? 0 : -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(rpmh_read);
+
 /**
  * rpmh_write_async: Write a set of RPMH commands
  *
@@ -230,7 +269,7 @@ int rpmh_write_async(const struct device *dev, enum rpmh_state state,
 		return -ENOMEM;
 	rpm_msg->needs_free = true;
 
-	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n);
+	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n, false);
 	if (ret) {
 		kfree(rpm_msg);
 		return ret;
@@ -257,7 +296,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
 	int ret;
 
-	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
 	if (ret)
 		return ret;
 
@@ -352,7 +391,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 	rpm_msgs = req->rpm_msgs;
 
 	for (i = 0; i < count; i++) {
-		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i]);
+		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i], false);
 		cmd += n[i];
 	}
 
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index bdbee1a97d36..14ecbf242b6b 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -11,6 +11,8 @@
 
 
 #if IS_ENABLED(CONFIG_QCOM_RPMH)
+int rpmh_read(const struct device *dev, struct tcs_cmd *cmd);
+
 int rpmh_write(const struct device *dev, enum rpmh_state state,
 	       const struct tcs_cmd *cmd, u32 n);
 
@@ -24,6 +26,9 @@ void rpmh_invalidate(const struct device *dev);
 
 #else
 
+static inline int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
+{ return -ENODEV; }
+
 static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
 			     const struct tcs_cmd *cmd, u32 n)
 { return -ENODEV; }
diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
index cff67ce25488..45b8513be2f9 100644
--- a/include/soc/qcom/tcs.h
+++ b/include/soc/qcom/tcs.h
@@ -51,6 +51,7 @@ struct tcs_cmd {
  * struct tcs_request: A set of tcs_cmds sent together in a TCS
  *
  * @state:          state for the request.
+ * @is_read:        set for read only requests
  * @wait_for_compl: wait until we get a response from the h/w accelerator
  *                  (same as setting cmd->wait for all commands in the request)
  * @num_cmds:       the number of @cmds in this request
@@ -58,6 +59,7 @@ struct tcs_cmd {
  */
 struct tcs_request {
 	enum rpmh_state state;
+	bool is_read;
 	u32 wait_for_compl;
 	u32 num_cmds;
 	struct tcs_cmd *cmds;

-- 
2.43.0

