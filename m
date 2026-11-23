Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454073;
	b=PmaBBQ+awDhZI720GTSkK7ezqkNjc6St2cfJ+bfVv/4Wcuke15y3PwKM4azss2zls5C+
	 Tg8CNLVu7ipg3DJEa6cIxdbqz6PgGWwHmulXDFOkYrpSi1yzIQvpDdwXN9NWPrV2KNO4b
	 gsgMTE8mIRpQwIty376TFbO0GxE7KnzOztKirLxI5slKnQihhU/AgpMwyFyPwYajUiZUJ
	 ktm7/wLVzlEsquMEKrjHBIWZF40/9rkKU/5H4OIIPD5NyI+ATVeS7R7nE49yrMAIrOvpy
	 /EU4TBX/alkOthfgLd5ug/Wy7l5q56xFnaEe9cLv/y4NrqM8xMl2hQlXDQZ2tzhra6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
	b=fYvnAN4cb/xeiCiHTvveITlt8CFDnzgNL2d1aOAoD0DMWyvvHOvfh9xPkS79eQmsXthh
	 HkGMSR2OtAntJjtwIn4fbTHOfMfDbXnX/00X6rmV42OFHMG0YXcWTKGkeESBHWo41la/q
	 e7WO5+h1Rx+dZTEQRXAdGMo+hZHsi5BXtOCqTNftf0sLtzYOE+3549BRUE4lASYMXXzOn
	 MVdiZTLyw2hszK2Yivt7ZNxAqyrZkRH+3ABCbmPoKNW/bS4Km/Sjk0ZYexhniViG5DSFS
	 uN0QLnS1ExJx25VYqiz/5Rosj3o5ej6lss1yilsSG/ggp2wvh65fDdLebIAcUJclwig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="juNq/kq3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ1KRd1U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35E606A697
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E35E606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juNq/kq3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ1KRd1U
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnJx1861241
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BFs5eXxfxc5
	hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=; b=juNq/kq3v3/m83E684FI0cXBlc9
	EYxHFjBLjBIWDAg3NBHb+VClOhVOyb/+7WiBpF28scbJFskh3IrcOGQat/M6J7kk
	b3F6FtR18X0CE27YPOML+LYEpzERnzrXiMUG6PNOrqnloTUjLBgDn8Kn3/S+m57R
	QOTY2NMbbZiTphTmH2vPJWnM3076xdzxrI/E3FlLngSzbgKKh4uzUkXSyF/irpNj
	u4V/4+Tj2JXhdonk5D5M5hvH9hX/h4LAuABJvh09LokGdjb8SXP8oq1HfK99hdYd
	X8yGxPED8QdFhCgXZyHKIlfr0DQGNWAS0M0vxCb4xmsl8cusXFFjlqggqag==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2gnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4d1e90b9eso28966697b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454072; x=1796058872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=GZ1KRd1Uct1EmlSnhzzfTOhhwlX5V3+TkiqAsk/taacB1aF+YOAjtWiO4fX5H+NQxU
         D8p4xS2ypqQkYJUtvXHOMCnw7juHBYY56jXSWm5o85G4Pmyu755IO1g5yW+JBhONS3JH
         d0uGFrDjclCiTEy06iBin7zMy9twLpux4xCl6t/rn8W6Z7BafPcHS9j/LVc9lhfKxYd9
         scJTCtwiUs6IRV7C9njlyv5YmvcuXh99NbYlWKNt0N0QJrSetTueZQDP9BQmyo5xV26R
         fNWi0MUcYAVImYzLbdIsFEINkmz++DKLvxEAnFoOh540KGoyApcEtJXnTpZxlMLV0Z2s
         djWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454072; x=1796058872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=Ig8Ls/a91CKbJibQ0vRPan68dXXVAumetakyPClddAdCEEgvy6kg1U5CI+jmSK3Qmn
         KU7DvzmHO6Cd6JHX8UZM72TS6fYE1t+LV9Tg7MTz60GgHAzkCWm/6y6LlTtyvdef8Wxg
         BDpU7rk8vk7YrAbP0jSnkyVBHM8uOztFrEJyMrCeJAo0pcGM3AOkp1P1udtXaTfXol9/
         EFmqS1ZI/0YYnwnCnUd6ogkvcBe/VUB0HnU3x6QLO7zAtTJj2RyBGmKjgt9aNaUEQFC2
         8JrGhXYroNTk42Tn5vFCMVv9MbXsWd3AB6ItrpGn9YBDNzmi3BeESBQ61/nqYnlPCMnw
         PQqA==
X-Forwarded-Encrypted: i=1; AL+hErGfoQZZLc6cHHsua+B70+cFegI7bodXCd2MHU4x+lez5eWn24CcuUbrq44wmlal9I2+co/PSOjyaQi1r7WL@vger.kernel.org
X-Gm-Message-State: APuU4Z94NGnD3TUdIFuSwy+8lqsGBn4r8v5AyHsi0VLhqumjd5r+SywQ
	TUquD+IPiljLqBBdHxGYSB4T4kcaI9J3HBfhgvfM8IaYJyJlalOBhZTotfEOMRycWOa5MtZeizb
	9cRzjvLNgTUXLbC4kDTHbDx48RRAMSkBYvwnwPayWpKrAUWpvIeP5ZDhPd8mLT1R5K4ZV
X-Gm-Gg: AZFdTZeEEIFdcicYuk60d0GjjgshUHQrFLFrLqKYazG1aG/YLdwrdJ+Yi8PGMYiomnm
	kQ3tOtwUvPbuTmh2O+qYF8HlO93mmKrw358Xh3LFpToxl/W1kOGIMHYaxmgKgwqhER80bO0gHgA
	yLZ3UbXjHV8ZnnpceFzB9q5qQPdRQ2rOTPuVUMPXhZzO6OKvAtSGVAedyZJqfzKVPPQeNoXSEWs
	U02c+U+g5V3ko/agLgWA8Wsea3ajxg7DkmEHktwZq7wupN3cUcHVx+ZXwCmz8r9A6vCllm5qH02
	n1ZLKiG528WQbf31+PYeMlGGXt4W8e/MdImEDDmNcNknmnwBcAx6FyBkFxukUlY+STCuwxaVozF
	QCl41FONlT/KbXpODc8+Qc6jmCWoU5xiKLIPVWamJSeUkidiim/bhjm9dx0e7YZr/
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273367b3.52.1795454071585;
        Mon, 23 Nov 2026 09:14:31 -0800 (PST)
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273187b3.52.1795454070951;
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soundwire: qcom: program MM_SYNC for multi-master
Date: Mon, 23 Nov 2026 17:14:11 +0000
Message-ID: <20261123171411.444381-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX+sCv+B8Qo7J6
 lD1+y4200wJReTp+al2LAG+vLJtjbQ9zq9G9ntOT997sC1aQBp+xUG3sRrb/0Fufu/0syOIv34T
 B0/r41G2yadWqmTXHHEiJa3lIkWLq/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXxB57fFpk8Cks
 jEXiPYq/tb7Wmziy7onQek8taQ70mqzV5ySYai9M1tH11qyBkFh3QQoVlkbAjJK6haMhKsC5yJI
 GFvJKObAIQ1KLrvlVOhVaXs91H4OlSsrAXFZ1M5viXvF6z1HcO61dneCBypXJVfNHo7jY2MbxDu
 YKG6ph3/ia5TBHWtmcYY5pB9BBJVhJFOuTUfRD0ISa46+h7CZg90/E3v/MsMKWoWGCDkBbo+oqv
 hnAiL6ussoBJVbWlruMyKmV5hQtn35OMNx70LIskRN9bnHSfHNWQmO6G7dw84EDcmG/cnw4K2nL
 IxxaM9Ccj3jrwNOO1QC7Y3DK7vk1EWeVWCk0MzTsXcJLfHSlEH8DNXXi2CJdlezK3hD6YUV8zC5
 oU6OpQK5asMve22QXsQLxdCps/CCKq4KFFjmpoRgLtAfgV196Z/vt0EZTZ8AvNcVNfyoBuXB2X+
 H5Vm0j1g8Z2ZE27xrXQ==
X-Proofpoint-ORIG-GUID: yUwo6Sw0BucSvUaGw9rtJmN25FvEhPOK
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b047478 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=c7LmfZLfTtV-q45nPo4A:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: yUwo6Sw0BucSvUaGw9rtJmN25FvEhPOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

The primary and dependent frame generators must lock to a single
SWR_CLK for the shared bus to run. Program SWRM_V3_MM_SYNC_CONFIG
on both sides at init, and re-apply on resume as the register does
not survive a clock stop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 396b57d8eb0e..20c805204de5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -48,6 +48,18 @@
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
@@ -949,6 +961,43 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
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
+	if (peer->bus.controller_id < 1) {
+		dev_warn_once(ctrl->dev,
+			      "multi-master peer has no qcom,controller-id; MM_SYNC skipped\n");
+		return;
+	}
+
+	conn_mask = BIT(peer->bus.controller_id - 1) &
+		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;
+
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY) {
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
@@ -977,6 +1026,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	qcom_swrm_program_mm_sync(ctrl);
+
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
@@ -2059,6 +2110,11 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
+		qcom_swrm_program_mm_sync(ctrl);
+		/* dependent was resumed first via the device link */
+		if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl)
+			qcom_swrm_program_mm_sync(ctrl->peer_ctrl);
+
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-- 
2.53.0

