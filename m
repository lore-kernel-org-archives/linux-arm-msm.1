Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE5459AD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114900; cv=none; b=D3W9au0ezviThgAcwuqejwB0IMGfV0mnE6nfZvN/G2WaJ4Z9qb+P4Kf+Srs7PRwHzyLH0g/D/Q49zGe/uGIaIN81/QPeYGZsByC60VAk35SrOgbeRhFZie38KkiJ53VorawMp4SE0SSn/uwDcYfdaiHEFXuI4mpcfvEAyXaxcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114900; c=relaxed/simple;
	bh=l7ErUg/Gg3Aom3MSmnZqch9BtbQc58QP4+xqEKE3pq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMH78bWT31hOnjo9Pi1pWKoV504wRIawUVjVf2zHuV12iIGLUWZc+hIDcdCvQjvQdy0Pi5FTFgM6vvwm5mmM/vlqjWtzNKgHwfkXzeyLLl35w0mf04ix0P9zyj9tXbeP7Z6qMVI2nj2ntpKSWToYI9OVcOd/rDMO4Is8g8JDYr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyjGTbHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j43epbP6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyjGTbHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j43epbP6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kjb1423592
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cF5pcE97r6I
	aBJP5DTSwQbf09nAuH6aMv0U0j9AZomc=; b=dyjGTbHzcwqlsFv9z2EfSSJG6Op
	nE7ku81E4gvgOdCSGrUPvs4a1+3R0IuC9qRh2I5jb3fuAl46zOMHYs19WM1PLmcC
	8VYgfvfvyNhNVjwoe4EABNqTWV3SeKaPNsc0FYEu5EVwp6sDktwJmk5uGBJlZEPa
	JF6XSN2P/YPBZJXmbB2erjqQmkam/2LNScziLOyPqtVqpYD0ZsyCEGB520MJ77p7
	vDC1icCu0X6mMPlfDjMsuPxc4sl/fc0CqDT1/fRNkU+juvj4K7wpHZDqNfkyc2j2
	2iJA29G+2rcHCr/BtMI9DFCXTLnDpeyG17JxrOkfRVqzEzOxKOz70zzKUdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8gp62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91049eac948so8782356d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114896; x=1789719696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF5pcE97r6IaBJP5DTSwQbf09nAuH6aMv0U0j9AZomc=;
        b=j43epbP62vx5tT7c3ybGGPI7pijKU2V+InUbeKjXFJbkXc/GB9B49nwNNt+FOrqSwR
         LkzuZtMb4GTy/oiUcMw7hvtAohvvSWe2DiusDw5+DTYbqAlbtNfJJ7HZJVxC9QMPzj/K
         YT/DIUsPOpMyxBazVzMSokFx1HfqKBxoGQoxVUM4BdBVISd+kf+PZs1rTKFz3d/yay2k
         2ul5xf34IzTZZmHAVcD5lQOYJX89eg7udiYnd26W1kl84v3E+Ol6fFKmEGgI3Vb6GlBn
         DAGOvtyFw4g8q+ExyhVW9wOHr93xtHq0mw915L1OywUJGmVmedc3Bv9zmdyMWHNOd8mM
         WQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114896; x=1789719696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cF5pcE97r6IaBJP5DTSwQbf09nAuH6aMv0U0j9AZomc=;
        b=rSEyGdih+Ygryvnevp7prrrqsQi7rP8t4bp/ZYlEUsLgp2b+/FXBJh1ZdJwWqT9gui
         aofvr0d6y6+2KIKwphmSkivl6iG1GncaRDr7fS8K8RBZdc41CT1MEyVuLTqi3PyZzKBH
         pW51V2r58jN8NQg+Bgai8mL1bpPw2Uy29NHvPRg+mdOiukk1Fdf9HUqy4VAwK+K618K4
         6ExgRit+NBj599LlQkmS131oXpsfdGUfs6NYwjHdXH+SiLcWlJLBaAvZ9QTicA80KD1Q
         DgtYvAwBbXXdV8fka74fL77aTGzU79H+dxh9t/n+fZKOWxy4Q7LzUtnCm7pKKPuSJvGa
         Thpw==
X-Forwarded-Encrypted: i=1; AKwUvBx6GPqV7SntQT7gmk8n589RK6O1t585HaXJhRWxOpzaCXs5dQnGZBbo7dl7a9o3giEB1I5jkq4ZCFTJDMkW@vger.kernel.org
X-Gm-Message-State: AFuF++kk7LMW8AIRu6tBlE1c5/GpQImTh7U52wzL1CTlZtOs+RjqtWZX
	XavHxERr+brtFPHC811Stm8+O76ozE2Cu7dbWLUWoMWK6VjYiaBb8igkFWYDpNSrO42g/bqhkPT
	PoSw68UcQOTC+phoiypYeARxG0ReC+zRgfASn5IRUB2LO+P3mHQMQ+vE6f6H0/zP9+nRq
X-Gm-Gg: AYBFou2KQndLvVbdwtWcHx0tpZ+aU1ks6N621PCon83EJhxZq4rheR51YRPSWSv9KHB
	HhKh7MEb8Wn+db3dJz5oMuW9REeIv0mwEq42r50imrHqxcgQgsNtftrR30zYcZCMwu+F4HiKxre
	ByhuhWgEx8M9FP+9lufOE8KSY/Z3hE+5z0GGwzw96fiSTrMFi9s0thX9er0E3Auxt7XwwGglXyU
	YMReSRFs50rygSb3ObPNBmxT+FF5FMDynTEs856WXjQVv6i/znSvjkx0BQRuA2/Q/OdTvK0ix3p
	mFHZHCK4B13ozDYBODaotCfNTCEkwbf1NpPyuhQ+oCZGYPZoO43rwJesnSXI8SPx3SmzeQkU5Db
	sEGqhSrbPz5gn8g==
X-Received: by 2002:a05:620a:2705:b0:939:ad19:c5a4 with SMTP id af79cd13be357-939ea2451camr345799885a.39.1789114896291;
        Fri, 11 Sep 2026 01:21:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2705:b0:939:ad19:c5a4 with SMTP id af79cd13be357-939ea2451camr345796385a.39.1789114895857;
        Fri, 11 Sep 2026 01:21:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] soundwire: qcom: program MM_SYNC for multi-master
Date: Fri, 11 Sep 2026 09:21:11 +0100
Message-ID: <c6372f2e597585241e077405c234adf1fa445b68.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fi5lUlDLnZnkkiXeKBb-zlFIgKYJw5PW
X-Proofpoint-ORIG-GUID: fi5lUlDLnZnkkiXeKBb-zlFIgKYJw5PW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNSBTYWx0ZWRfX3dHTqVr0/1vb
 gA4gOsBa5DpYWxxwK/7SqadGd97R0qUJKSD/zBrlObcI/X3sN7a3F9lBps8ITkJAca/KZhlG0tx
 TKcnatE/GKRIN/r9TRBVLuij3mXDM2qxAThQdEAROUIfwvrAefdf0rcQU88q+AGttwyi0EdKYM5
 XXpG8v3Ob9gx02is1ZiuHwWpNh3zSkN94pRq/5Iv+Dm0l0CRnV6YVON3UuqVGO/109hjEPOVEjN
 e1I7gAoavRn/2etc9tgoOEqbcAoZ3fnZh4Jawg2C2qErqPl89n7ockBnUQZTcxBYsfqeb9bC101
 ohLuRuAake7xXxwesqmGa70ZReuJePGw/wR+06QFE/XpHR2ieJOc5H/yrwS2ajnOqas+1EPKae4
 lP583XReqFfYZl2BAHpnPBJzR1HcOKq5JnviuRS5c9UFXty7hhhAP5TBtbcMvxSTv0CqPrJ54dD
 4jDXwBY5pUZuaQNmbFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNSBTYWx0ZWRfX+1YQPpQXAR3s
 zh3MYBvnYFbhpk1EdDWgaIllybQKENOLzPOzGulCs6qF1RmYpOAulgFCFJKJ3TRxvW3xmMuhwAD
 rHME8Z7BFGyf337Ao7x7+/5L8Bdxn+E=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3ba11 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=c7LmfZLfTtV-q45nPo4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110115

The primary and dependent frame generators must lock to a single
SWR_CLK for the shared bus to run. Program SWRM_V3_MM_SYNC_CONFIG
on both sides at init, and re-apply on resume as the register does
not survive a clock stop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a5f39868161a..3b9b1a53b082 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -46,6 +46,18 @@
 #define SWRM_V3_COMP_PARAMS_RD_FIFO_DEPTH			GENMASK(23, 18)
 
 #define SWRM_COMP_MASTER_ID					0x104
+
+#define SWRM_V3_MM_SYNC_CONFIG					0x108
+#define SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK			GENMASK(15, 0)
+#define SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER			BIT(16)
+#define SWRM_V3_MM_SYNC_MASK_CONTROL_BITS			BIT(17)
+
+#define SWRM_V3_COMP_FEATURE_CFG				0x10
+#define  SWRM_V3_COMP_FEATURE_CFG_BASE				0x00E
+#define  SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN			BIT(9)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL			BIT(10)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE	BIT(12)
+
 #define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_V2_0_INTERRUPT_STATUS				0x5000
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
@@ -892,6 +904,37 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
 	return false;
 }
 
+static void qcom_swrm_program_mm_sync(struct qcom_swrm_ctrl *ctrl)
+{
+	struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+	u32 conn_mask;
+
+	if (!peer)
+		return;
+
+	conn_mask = BIT(peer->bus.controller_id - 1) &
+		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;
+
+	if (ctrl->is_primary) {
+		ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG, conn_mask);
+		ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+				SWRM_V3_COMP_FEATURE_CFG_BASE |
+				SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+		return;
+	}
+
+	ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG,
+			SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER |
+			SWRM_V3_MM_SYNC_MASK_CONTROL_BITS | conn_mask);
+
+	ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+			SWRM_V3_COMP_FEATURE_CFG_BASE |
+			SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+			SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+}
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -918,6 +961,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	qcom_swrm_program_mm_sync(ctrl);
+
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
@@ -1909,6 +1954,8 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
+		qcom_swrm_program_mm_sync(ctrl);
+
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-- 
2.53.0

