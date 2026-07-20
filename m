Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84CA37F73C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561847; cv=none; b=fuTmtccbINzK8HkuRfeB5KO/Qa/x/PVUUuhSKhdf9vv9tMVHHPACY6XiNK0QOsxKbKmFYQKMvA9Wfl3KLRR+/I2EghFJ9TV+NncR8StNiWJh9LaFee+n81oB/RPCrlX9oxis4WJEIE6NTMPgR4hKg09F01uJ3ci4zFrkUlinoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561847; c=relaxed/simple;
	bh=ETMJ6aJUjQDC/YVIh0I4Vf8wferbQVh2mtgDYw8tyfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFKZTAK8BTwmUIGORUtiCAqfK+U2J0lcN/OcYluBJiM2alyt844GUUkZVTcZMA1FAYiay2F0w5tzUqVZ1J60tn7i6T66SvVs/AKOBkKVGXyR6CaFTnLr84LqP08bfbfXAc2YGUxBIYLOA2zjm48SyIJni2dXEFrluNQnjFZ9iUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipSiQkGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mwgm8z2q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipSiQkGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mwgm8z2q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLcBK2819412
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zt4rjJh0Mr/fd1Jmxd+h3Cy43pcxP7RnHzW6QwphjHA=; b=ipSiQkGMB8uT7Q4J
	agNdYf0/hXgoXHNPVd6QxvV9Y/o5j+mJNxJC0X/nTmiQ5jQZHzwR3XN19B63bcZb
	THK/Ng7KQZQUXqUgRR96qj6qbfZjUYBMEDHQLS5EwWE+gkxILSfeAYA6aH2IUMJK
	dODwpbhLE5/EnDTeHW9t6zkW5Q6x2GrQCcbg4OWYy7x34PyuMb+n8UbJU5x+zpKw
	Jble9j+dZHSQhXEtd6zeSWZizau9ox5vRZKUCXxbTFfm/fpESVINp3N+Byqab4KE
	asCQoI/BSPUPxQA7V/D8x2Yus9u0Ty0tiQZDvowxvGvSQUopZJpzOqLqdBDyP2M7
	KZHAgQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9wtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so4335039a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784561843; x=1785166643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zt4rjJh0Mr/fd1Jmxd+h3Cy43pcxP7RnHzW6QwphjHA=;
        b=Mwgm8z2q4T7HpaXNZCXqcpAsuYe8BRknLfzX39kP8VQ1eP7pWLCWWZylrAsAapLXzj
         X5z+GWJmHK2lZ15efCbOuAAehElYjkKFj1BrMQYM+JM5xVCAfpxB4jW0wkWSHSk3yfer
         djjGHJdJCWFfknu7koEV50ei/M7MUk0MveEfainyEcGVREmRE6AuvcVRiMNjOvtJNOba
         qxWYPJADldYJusp6F7aDq+q+dCH9Mkm/0kNexLs67AqsP0HxBP+kDrHoaDEW0ILlmN6M
         X6Tu3zDMjq6Ix5mmyqjT7xrwyJCt2P46vm4XE47uFNdoVXwY5x8Q4xh8vpeaQM/ovjxN
         C5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561843; x=1785166643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zt4rjJh0Mr/fd1Jmxd+h3Cy43pcxP7RnHzW6QwphjHA=;
        b=hb7XH6M4RlmcHG9oF9Z9OUrxTgEAnv8glDKzQGUrnCHsSGbsyqSv1+hJ19QCx74nFB
         Y5hKnLTNX5LIY6Ka+TOsExlXC/eXaNH7xdLrfwALZphPVFcQIf/1n4B0ec05V6I0/UvE
         fwoTHr7K1G43XJzzEWiZdmO0hhJoAEpqaO7o6vrfENui2vWR85HXLogYuAbxWg80DBtO
         PIZzuKbolyTfuCzCTQkq3b+3WqZeKBIz4SIapFiRBUdtcQBwFoOiuIVb+1GrPt2TxJMX
         QVdVZplxg6xkL/R9XeF+teqZeb2EPUza4RMZQU/QQfAua+Py/tSUGfA2zTNL8oFB4l4g
         zB4w==
X-Forwarded-Encrypted: i=1; AHgh+RrWymMW5LVvUf1s3osz/yvMrwKa29vQS5yUcQoeAzgtHbq//SCdSNs/YZzTOcVlFb1L7Hm8WbDKUD6QnM43@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7Fzu0YL/eWA/4QHrInvEXRtnePASa4GDE+jZwPkojtzUH8Y+
	5pDreXUsOKCcG3dXdQICTesNPBNNBa9t39db/TozMDKLcWnRkBEVVMjO3ZnOXeu138aD/gZjNGr
	GbuABIbHHfZSeXti4/eaWDIj7qp6O0iokCqII/UfJzJuxMfWati0RkEqHcc1Rr4beUriE
X-Gm-Gg: AfdE7cm9kKO2amHH83XDSeeYtGjEVyxpsu5LnXEJI6SQ5rLdXIKKc6emYHUE1X+AecN
	BM+/30vrkTq/mrKpStVMHhg4sW9DApx450FrGvHTEXksBKe32sVmjhmnLlhKViRYUO/0orIF4sO
	0PQHxZYXIiIZ5XqDxprF5PBh7JBF0CHASvL4uOOKzxZhu21SwlIe5KBukdnPBFB6mtefJRy74VG
	P4bNsE5V2a5F4okGzV3lGOIH409EiUVM9sw9gDTMpuW4wau51vG8hI+YyTZ235vd6Pn1HHpVoMx
	iPXgrFIsQzHvp6YK4CR4Knr010DOxrrJ99+LRpzl6xROP/0tf3gs7iItVkolL5A/6cCz66xifP9
	PiZf17YzGi+g2Or36Bqdx4MUa4+wPUw==
X-Received: by 2002:a05:6a20:93a1:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3c38d8cffe2mr20870661637.7.1784561843091;
        Mon, 20 Jul 2026 08:37:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:93a1:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3c38d8cffe2mr20870450637.7.1784561840272;
        Mon, 20 Jul 2026 08:37:20 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm38572824eec.0.2026.07.20.08.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:37:19 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:06:38 +0530
Subject: [PATCH v5 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-b4-read-rpmh-v5-v5-1-cb93fb95f565@oss.qualcomm.com>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
In-Reply-To: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784561832; l=7518;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=qXqGyOeLWQGaBEmgdBm09rvUYbv256ay6Gp1qlrL2is=;
 b=6ul/ktN9Prl8u5PIImBi705mcNY4nnFZWSGcRTGElrIVGRRufutuFCuRllUCF9MapIDEIgq96
 G2CFTS4d4scC24rHqTj6norLmSpjUIsTTwVgArb+r62QiQdW1k1Loav
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: FCRf0w4Xuom5W90VafpSHuKGBjda3Nvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX5m6S6qDECfzk
 6uPMpAc0IIYb9Bo0Y5GrgNBf649rbS45QbLjEhS23/x42czx/dNJUILZ30M4xgfcz6VIWWp9UMj
 UyVjsxfBbImXkOqlc/pwyv6W9olKeXwWgNHgDfxfU+QPckiLg0rgeIVjfkC9ULDakEm4VfrL5bQ
 nPnMyG/LXNOMNsEGF4EcUU04DCdqMWexp2RsYW791uK5rlTEF3RJnkgvSsjRGzhrGRKxdiN54wg
 l+FaT7xayZ/m1gqx046ZVAHB+b9xnjTm0xElZpP499UUcFSir9oeD5F/vDkWYdGgDEq93Xx6Gvy
 uNOeqZWrwW43eX47jZGQBZL8PctpJAQi1Leke5vKPu3S1mdrArFwvg2SkfuEkHfa+tEhgp7H4K6
 83rnolc9w9/3dPQzfqOZDOpAexvmTXIJDtGIrY/5I05xzdqs4U4OeEk77ymg8c3yYLqN0ys9VuE
 1hmNQqDsRWo58M+pMvQ==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e40b4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RgaPuue0vXMEEcOqpiYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: FCRf0w4Xuom5W90VafpSHuKGBjda3Nvc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX3cyjMnB2GDd8
 5qc/XWvWcJZnNomWh2SP8XYGjVhYBdrBhtTU0uyVosHnkkGt0qxKTQu7D0g9+ch4H0VAOImwbZy
 LqhYzHaG4ze0BtDHHXovYHMFYCdkeqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200174

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

