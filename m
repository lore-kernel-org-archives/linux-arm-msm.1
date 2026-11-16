Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835143;
	b=e/pM6MWnfXR4EDMPibX2rYCUyBn5Qq+oOpi5JeTdPXH5Upvvmehyxl06N3Bnbjur/YxD
	 juKQ+u7t08jnSZRf6FaWWlpVo/8+/YZ1vtQCBSRE7vArqnO83EJnPJZ7JAtDl/nR7YIdn
	 dvyjRRUbjR64iRYtT/4SVVlMN/4NriU8YEG5DZTJsYJBkae/A11gHfdVxMNI0MSuB5ah7
	 Yjxi/5A9zqXXQ5utI7dNpvyudpWOW7HuFB15LnCO6NovN/if/xtQWTvko7ibtokjQRWOt
	 A9eSQ2ROEzO2cMLeluxa/avwI5ho1FUogXAJ4KfP/Ky6VWUNrCtFKiOY7YlUFHBOMhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FIVPnD50EX4S0ADQSI/wOp6ZVRAhbJD8QVbyPX8w2gY=;
	b=feJy84L+TTx9R2HGLtaL6EDd4C1Gv49iS+4QC2/Oc/b5aNZXa2sBAL7ntRoOFJ/rsTB7
	 98AkrCeYzUpE9Jl8GAzoGfMkDBwuL237QhRfyqjg7kJX73kDlTL2I8BkBaIfE0ZV8Wsy7
	 59cBFrN/e6Ayrp4sRUTlF/fKHWmqXaKFDyzztGCFV7jVNj8yB4C4Wp4kuAAtHzAocqZrw
	 SesCYMQ6RIqZz+K/EDnNnHLm5VR3UIZnGjdyUrUvJkpP5BfaQOP3+7zsmaSWBFtoHOwno
	 8onqujaV1zwVNEmWRP762bwfXAUl62neTZfYVxIwGodm11JTwE4+q0kcfW6u0X9mmEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPlmW6Qj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD6UWBhs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D734606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D734606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPlmW6Qj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD6UWBhs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC10KC536333
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIVPnD50EX4S0ADQSI/wOp6ZVRAhbJD8QVbyPX8w2gY=; b=KPlmW6QjmfepMvGy
	AqFuZYuZqe+SdBCkb9Q8TzIz2KeR+bmRF74k7Ncmwbq3aB0z5wzfoFbnKkq9meh2
	+wXqzycPdSLn3SCirhKC66VCUnUuiDvxwH9j9dz6yEQU9xBIQFSOjIVhchrofQtK
	d60fBNQzt7x0sDiNTXNRbYQWxFUY+4m00iqj0av1rEKXbz9L3jOOPFf85up7dg5R
	v5kl3fXTfmOY5zIbVRNVUfhHtYb3U3Cixo7w3mw3N6mTzl8wof7RjhMGA5sckRAp
	kvxWyti3Acg+WQYuVsWNxuXWXz2Y+NQr5TBTRrs29Gte+Evy8Lwt/KQwx2D5pkaL
	y7Bnyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqggp9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:19:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so986837385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835141; x=1795439941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIVPnD50EX4S0ADQSI/wOp6ZVRAhbJD8QVbyPX8w2gY=;
        b=fD6UWBhsBnlcozrFonmHNcqsspBvJA5N2vesk/pY5kI6NwQPwkKMvOcSAORRU8h8tp
         ADOGboujkyxr09bz711LXjdNI4oUP/3vKxVVjIN4BTk1v02S6KBIB0NoFHKz6aGvY8FO
         ABVNQntEe3a2mCfwjeS8Msw49p3e54DAUSjzdEPBACjC5w9OvSmkP863N6oJdAWBZwSw
         70IHcAsdndrv7LWUSFtpP7rWhQ7nMQ+ZX5djLzXp/bXUkK5Aa6c9RJLJHrMYpxsUnuwo
         t1mzhbzeQRF3C+xzY3tQawymNJfwRoQBg0c4Ytg8TRoacm91ARfGizS1ssoNukdjwKro
         MM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835141; x=1795439941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIVPnD50EX4S0ADQSI/wOp6ZVRAhbJD8QVbyPX8w2gY=;
        b=HklyYrqVkWZHW1wiGwytLanzLKZzq9Qhuc6GjxCRQYIvUn7R4cpsX7fEeyQssKEY/f
         /c3f5UtH7e2FLq8Uc84853Fat4hsIQDdFLaXajuUs0iBiD78Jrf7rY25tCdnAoMxzv3c
         +/eBqhCQTnAUy3D2yHe8wM5KV94Gsg2ntxlBwXvbOzcMzOR3NIeXYryTHkvJst0Y3x3r
         C66Pc0Yz9ohjm2xvlqc0+DohKqpsyBhyqnNvev08wSCor5F1enw1xrhHWVmcNVaOCnv7
         SQeYM1swom/63mIkZj0a/azpoHO5iE3WhKnfqoyX/RY8ViEskrZm18pVs3XcXXfNEhx8
         tvIA==
X-Forwarded-Encrypted: i=1; AL+hErGu/PGMQm4y4lPFxVCRQ8wx1PO3wtvkyCvB47xkaRP1u8VblboqyXo/pGkJ8YzgRLEzBaw1isjwuX78wDhK@vger.kernel.org
X-Gm-Message-State: APuU4Z9vAaqQcVSujfxmhlTKJGqEWY0wI1WsfVNaOvo7ppirhz9CR6nv
	CkF65RR94cr0v6NrHqmca+/1umlNeS0KncQwX82Rv1wXCM0+xWDTtiNwClap1D1PEFFa6+21Ary
	Ld81GeWwLwJbs26QL5Dhy/wFFz2Rg2YbH6z0WWWjK9IWy6ygAraYKdxEFN/0HHwZd8VQK
X-Gm-Gg: AYBFou32e0Y62gH3T9d4yazQ/sXm2zWtxfLcDDY1G7Sdz4RZ97lGDU+mV5kxkLQ+zs5
	vKC83ZCmnOCqWjo7FgYyQFbTSHHG9YIccXifP8Ng9CcMejzszXTA3VJgEt9bl9gmwoSdBBFo143
	FsZo1uqIeYTjBRYmH8/+eijAzmPkY9YzQy2c4I67iXlCLRKi37K0uDNpsMXCVA5tuM0lpYvmTQC
	q8XEi/2oj0cJ7p6FDuQyTPz4SQcbR1fW1tY9wyeQfVF0Gf0cJr6Jng+OhxkOyglOpghuddRwS8T
	Uw7l1whfgeVv3wJ7bOtD3jLZ9Eau20nqsaSCZJI67lC3/XVBb662kzhPW2+z5Psc91xF+Tg4+av
	do2bvgOlOSOFUmihlVuE3UZX4kKyCBfnVRPi52pEcsAyqH4XUwA6sgSsDnYkW5dWkSqEjugG7wI
	pt
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1447443985a.67.1794835140562;
        Mon, 16 Nov 2026 05:19:00 -0800 (PST)
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1447439685a.67.1794835140037;
        Mon, 16 Nov 2026 05:19:00 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:59 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:50 +0530
Subject: [PATCH v3 11/11] phy: qcom: edp: Add Nord eDP/DP PHY support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-nord-drv-dt-v3-11-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=10721;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Eu0id8yu9Mzw5aOSnQtYz/XfuowTz3vy5rElr+dtuHg=;
 b=u2Eug5hdnMG0guprkqGEqoE0Gg3EQX09UXBDRfRETnd8rEGlzxeHXzkwS2TwR0LU34fk/eI/a
 mH16VHEtxrDDCXyt5Kuo+fQjq9itkT1nevf8dhTijeEMO4X6e5SAOaY
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX5agbOgi+8Vsv
 WOWPGilJlFyuT8W2mSd8sK0k27ODDr3/zRGadKRDzkGJ9/lhq9KxxvrdHAyCD+4f17CjlPrJM07
 76+YH6HI/iuDL9MLG1mVgOd173VEPSI=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb02c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=USxDkvc5C5W9gJns0o8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Vm3H7ovajHe8P4kwVvaMsFy_QMfOiaKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX3CDotByai8Tk
 Gs+n4RbaMQhQEyfuHQJzftM3ueVJ4vNeLyULjWq9wMezmhKaNcRPkdpXoxqzWnhXvrZsGtDT7im
 Sk934Vvz60pk8rJLwCG/oZ4qMgL85AGXcKp/JQ7VOIphc7npvoq1IHC5Ja6oV6YPU+ChEUqC+Vj
 7SenUIuUngoDFEJK4SYJKLqGCDcioysz5Iw6Oxq+56tXbUeUpbB23U0vA8ntxQxSVPuCK6tnK44
 vLZEjLy0xOWoDju8FYwN3o2xAY25MkZntf9xJoXtmjBWyog+ExO9lK0tWpALZFxSIfFAJ0C7M1Q
 Ag7Ww7+YF4ykxLH3cEf4Zas4ZL9DnHRvo6x6nyXZgtKtMh8F1NDLinZ5PMQr5dcEv1QLaEXYkeg
 wv6jaJK3hPFPG1K+wIEBUUE4c09MlwDDi2hmGbirHEgU+6ykPAcX4w5/ZqLY1e7DlabxmUk1drs
 z2Hz3DhMadHoiCDt3rQ==
X-Proofpoint-GUID: Vm3H7ovajHe8P4kwVvaMsFy_QMfOiaKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add eDP/DP PHY support for the Qualcomm Nord SoC.  Nord uses a
different QSERDES COM register layout from existing v8 SoCs, so
dedicated NORD_DP_QSERDES_COM_* offsets are used throughout.

Key additions:
- SSC and PLL configuration per HPG Tables 2-8 and 2-9
- Power-on and reset-SM callbacks polling the relocated COM status
  registers
- Voltage-swing and pre-emphasis tables for RBR/HBR and HBR2/HBR3
- LDO, TX resistor calibration, and set_voltages callbacks
- AUX channel and VCO divider config tables
- 'qcom,nord-dp-phy' OF compatible

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 258 ++++++++++++++++++++++++++++++++++++
 1 file changed, 258 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 41bcfffbb357..eb8beda84196 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -27,6 +27,7 @@
 #include "phy-qcom-qmp-qserdes-com-v6.h"
 
 #include "phy-qcom-qmp-qserdes-dp-com-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8-nord.h"
 
 /* EDP_PHY registers */
 #define DP_PHY_CFG                              0x0010
@@ -1514,6 +1515,262 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static const u8 nord_dp_pre_emp_hbr_rbr[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x02, 0xff, 0xff, 0xff },
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
+	.swing_hbr_rbr		= &dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2	= &dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr	= &nord_dp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2	= &dp_pre_emp_hbr2_hbr3,
+};
+
+/* Nord DP PHY register offsets (relocated from v8 base) */
+#define DP_PHY_TX2_TX3_LANE_CTL_NORD		0x00c0
+#define DP_PHY_STATUS_NORD			0x0110
+#define DP_PHY_LDO_CFG_NORD			0x00f0
+#define DP_PHY_TX_LN0_DRV_LVL_NORD		0x00e4
+#define DP_PHY_TX_LN1_DRV_LVL_NORD		0x00e8
+#define TXn_TX_BAND_NORD			0x0024
+
+static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 step1;
+	u32 step2;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		step1 = 0x83;
+		step2 = 0x02;
+		break;
+
+	case 2700:
+	case 5400:
+		step1 = 0x18;
+		step2 = 0x02;
+		break;
+
+	case 8100:
+		step1 = 0x5b;
+		step2 = 0x02;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + NORD_DP_QSERDES_COM_SSC_EN_CENTER);
+	writel(0x00, edp->pll + NORD_DP_QSERDES_COM_SSC_ADJ_PER1);
+	writel(0x6b, edp->pll + NORD_DP_QSERDES_COM_SSC_PER1);
+	writel(0x02, edp->pll + NORD_DP_QSERDES_COM_SSC_PER2);
+	writel(step1, edp->pll + NORD_DP_QSERDES_COM_SSC_STEP_SIZE1_MODE0);
+	writel(step2, edp->pll + NORD_DP_QSERDES_COM_SSC_STEP_SIZE2_MODE0);
+
+	return 0;
+}
+
+static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 dec_start_mode0;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 lock_cmp_en;
+	u32 hsclk_sel;
+	u32 code1_mode0;
+	u32 code2_mode0;
+	u32 core_clk_div_mode0 = 0x14;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		hsclk_sel = 0x0c;
+		dec_start_mode0 = 0x54;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x06;
+		lock_cmp1_mode0 = 0x37;
+		lock_cmp2_mode0 = 0x04;
+		lock_cmp_en = 0x04;
+		code1_mode0 = 0x8d;
+		code2_mode0 = 0x27;
+		break;
+
+	case 2700:
+		hsclk_sel = 0x04;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x07;
+		lock_cmp2_mode0 = 0x07;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		break;
+
+	case 5400:
+		hsclk_sel = 0x01;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x0f;
+		lock_cmp2_mode0 = 0x0e;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		break;
+
+	case 8100:
+		hsclk_sel = 0x03;
+		dec_start_mode0 = 0x4f;
+		div_frac_start2_mode0 = 0xa0;
+		div_frac_start3_mode0 = 0x01;
+		lock_cmp1_mode0 = 0x17;
+		lock_cmp2_mode0 = 0x15;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0x14;
+		code2_mode0 = 0x25;
+		core_clk_div_mode0 = 0x0a;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + NORD_DP_QSERDES_COM_SVS_MODE_CLK_SEL);
+	writel(0x0b, edp->pll + NORD_DP_QSERDES_COM_SYSCLK_EN_SEL);
+	writel(0x02, edp->pll + NORD_DP_QSERDES_COM_SYS_CLK_CTRL);
+	writel(0x0c, edp->pll + NORD_DP_QSERDES_COM_CLK_ENABLE1);
+	writel(0x06, edp->pll + NORD_DP_QSERDES_COM_SYSCLK_BUF_ENABLE);
+	writel(0x30, edp->pll + NORD_DP_QSERDES_COM_CLK_SELECT);
+	writel(hsclk_sel, edp->pll + NORD_DP_QSERDES_COM_HSCLK_SEL_1);
+	writel(0x07, edp->pll + NORD_DP_QSERDES_COM_PLL_IVCO);
+	writel(lock_cmp_en, edp->pll + NORD_DP_QSERDES_COM_LOCK_CMP_EN);
+	writel(0x36, edp->pll + NORD_DP_QSERDES_COM_PLL_CCTRL_MODE0);
+	writel(0x16, edp->pll + NORD_DP_QSERDES_COM_PLL_RCTRL_MODE0);
+	writel(0x06, edp->pll + NORD_DP_QSERDES_COM_CP_CTRL_MODE0);
+	writel(dec_start_mode0, edp->pll + NORD_DP_QSERDES_COM_DEC_START_MODE0);
+	writel(0x00, edp->pll + NORD_DP_QSERDES_COM_DIV_FRAC_START1_MODE0);
+	writel(div_frac_start2_mode0, edp->pll + NORD_DP_QSERDES_COM_DIV_FRAC_START2_MODE0);
+	writel(div_frac_start3_mode0, edp->pll + NORD_DP_QSERDES_COM_DIV_FRAC_START3_MODE0);
+	writel(0x12, edp->pll + NORD_DP_QSERDES_COM_CMN_CONFIG_1);
+	writel(0x3f, edp->pll + NORD_DP_QSERDES_COM_INTEGLOOP_GAIN0_MODE0);
+	writel(0x00, edp->pll + NORD_DP_QSERDES_COM_INTEGLOOP_GAIN1_MODE0);
+	writel(0x00, edp->pll + NORD_DP_QSERDES_COM_VCO_TUNE_MAP);
+	writel(lock_cmp1_mode0, edp->pll + NORD_DP_QSERDES_COM_LOCK_CMP1_MODE0);
+	writel(lock_cmp2_mode0, edp->pll + NORD_DP_QSERDES_COM_LOCK_CMP2_MODE0);
+	writel(0x0a, edp->pll + NORD_DP_QSERDES_COM_BG_TIMER);
+	writel(core_clk_div_mode0, edp->pll + NORD_DP_QSERDES_COM_CORECLK_DIV_MODE0);
+	writel(0x00, edp->pll + NORD_DP_QSERDES_COM_VCO_TUNE_CTRL);
+	writel(0x1f, edp->pll + NORD_DP_QSERDES_COM_BIAS_EN_CLKBUFLR_EN);
+	writel(0x0f, edp->pll + NORD_DP_QSERDES_COM_CORE_CLK_EN);
+	writel(0xa0, edp->pll + NORD_DP_QSERDES_COM_VCO_TUNE1_MODE0);
+	writel(0x01, edp->pll + NORD_DP_QSERDES_COM_VCO_TUNE2_MODE0);
+	writel(code1_mode0, edp->pll + NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
+	writel(code2_mode0, edp->pll + NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
+
+	return 0;
+}
+
+static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
+	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
+};
+
+static const u8 edp_phy_vco_div_cfg_nord[4] = {
+	0x00, 0x00, 0x02, 0x01,
+};
+
+static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+
+	writel(0xd0, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? 0xd0 : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+	writel(0x03, edp->edp + DP_PHY_LDO_CFG_NORD);
+
+	return 0;
+}
+
+static int qcom_edp_tx_res_config_nord(const struct qcom_edp *edp)
+{
+	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x06, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+	writel(0x06, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+	writel(0x05, edp->tx0 + TXn_TX_BAND_NORD);
+	writel(0x05, edp->tx1 + TXn_TX_BAND_NORD);
+	writel(0x12, edp->edp + DP_PHY_TX_LN0_DRV_LVL_NORD);
+	writel(0x12, edp->edp + DP_PHY_TX_LN1_DRV_LVL_NORD);
+
+	return 0;
+}
+
+static int qcom_edp_phy_power_on_nord(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+	writel(0xfc, edp->edp + DP_PHY_MODE);
+
+	return readl_poll_timeout(edp->pll + NORD_DP_QSERDES_COM_CMN_STATUS,
+				  val, val & BIT(7), 5, 200);
+}
+
+static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(0x20, edp->pll + NORD_DP_QSERDES_COM_RESETSM_CNTRL);
+
+	return readl_poll_timeout(edp->pll + NORD_DP_QSERDES_COM_C_READY_STATUS,
+				  val, val & BIT(0), 500, 10000);
+}
+
+static int qcom_edp_set_voltages_nord(struct qcom_edp *edp, u8 swing, u8 emph)
+{
+	writel(swing, edp->edp + DP_PHY_TX_LN0_DRV_LVL_NORD);
+	writel(emph, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+
+	writel(swing, edp->edp + DP_PHY_TX_LN1_DRV_LVL_NORD);
+	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+static const struct phy_ver_ops qcom_edp_phy_ops_nord = {
+	.com_power_on		= qcom_edp_phy_power_on_nord,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_nord,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v8,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
+	.com_configure_pll	= qcom_edp_com_configure_pll_nord,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_nord,
+	.com_ldo_config		= qcom_edp_ldo_config_nord,
+	.tx_res_config		= qcom_edp_tx_res_config_nord,
+	.set_voltages		= qcom_edp_set_voltages_nord,
+};
+
+static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
+	.is_edp			= false,
+	.aux_cfg		= edp_phy_aux_cfg_nord,
+	.vco_div_cfg		= edp_phy_vco_div_cfg_nord,
+	.dp_swing_pre_emph_cfg	= &nord_dp_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg	= &edp_phy_swing_pre_emph_cfg,
+	.ver_ops		= &qcom_edp_phy_ops_nord,
+	.phy_status_reg		= DP_PHY_STATUS_NORD,
+	.bias1_en_2lane		= 0x03,
+	.tx2_tx3_lane_ctl	= DP_PHY_TX2_TX3_LANE_CTL_NORD,
+};
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
@@ -1522,6 +1779,7 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
 	{ .compatible = "qcom,x1e80100-dp-phy", .data = &x1e80100_phy_cfg, },
+	{ .compatible = "qcom,nord-dp-phy", .data = &nord_edp_phy_cfg, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);

-- 
2.34.1

