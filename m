Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928D367B74
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812069; cv=none; b=bEsDPi3ycn0C4M3NSPbGncUhJq5hgd5zJmcBu39DX5YnMmJyQ/mu/veEKu4ZgWzztE3usA5DLyohrkDWINvGDQSCKokfjkWfnGw7yh30RuEA9H2KdFI2rYbhi1T1UxE5zrsZb5oMalUKmeu6UwARp/h2sSWV6vZn9cl8BuHNlvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812069; c=relaxed/simple;
	bh=51isISCUxuzvmQ0f+k4lBc7lvYpGEQkGNTZsup7U6LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iu967zWnLWXS/E1g3LiHMu8v+4qoS/JwNIuvYyJQ7xjYnmuiu4lDDpoWlbsiKrNjrBw5z9N0lxOa6U+2ZYob7LYZ3C2i/t1MbKe4rnz7bDiOCP+WL3cVPjp42yEb54s5oqfqK3Y2XT0MBUyR3Qp9yO25Tmmcby8hJdzpeuy2s5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9AgZ7hV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEJ8loO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9AgZ7hV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEJ8loO+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07HX2786899
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWuxUBcrInqnBnXrIjvNWBh+kSHK0gado8CZLpJNc6o=; b=b9AgZ7hVkss9ozdw
	1dWWNsBJBCUFaQgtPt6SpfZGaHdDI0pJq7MEgHYBTA7/XV6DD+snyQtPpwwV0piQ
	wwl/jd8CJAvovvkRbDnbwtmxbPhsu4QCxkbqU3A/+1uO7wTO7lUcqosu8+vBhh06
	aul+Qg/fe4lnM6h7q1cizMJsLhrngVnUt5eKK4Zhf/C6dyhdNKMo1Xj7vXUDUeAZ
	xW2guuXU/AwN+1nEr4WOfj6NS8QYqtNXCu6uCbSb5MsQIv1TcXjXMrMiAM5iPQtz
	GiLescQqKGvX8cRF+g9WmrSlMRrLz6zBoXeKclzn5L1UyFLpGqILrasg1r8VMQIS
	4JQRZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffgwfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:34:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so5397318eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812066; x=1792416866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWuxUBcrInqnBnXrIjvNWBh+kSHK0gado8CZLpJNc6o=;
        b=jEJ8loO+po50cxbfZ56+W4P4QDltVHqdiWatWhYjAKToadVvwWdqt+Vn5iXARwJM0J
         v0XrK7hV5LxudliguyzcLLxUFzKA+079f4Ioiu9h8iEJogvpjYD904u6sx+OoX3RNrWE
         KY2/sVjbIhDMDOumTzHNo2geIkjuUeCaNa59O1hfOxRUSnMY2jvuVXEY0AGEcRZOWHrL
         FZm5XhrSlfPzOs53a+Dqgs2aGiMZC0uhsLLCYK9B4HJP+w62I3Lozz0zz4lHvA9/o/5x
         UoCKlezbtw9+48/W8LnALfr6szdkTiY1qwHTJFX1zHRDnduMbbVgcIQbUHBFpj7bJZBC
         OECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812066; x=1792416866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWuxUBcrInqnBnXrIjvNWBh+kSHK0gado8CZLpJNc6o=;
        b=fl3MkKXe95Jq/Wvc8So2ZZ5cdWifcMH8O+D0+Ljr5d5zfH/Rs66yD3PM0K1c+R7l8x
         5zSlJHigrEpz19sYHtwzY450TqHZ4ViYhqb5LZwjun898U6bTK4S6AyVpglG7elw6qP/
         kIAFluH1FLB13gGWm8D3++I9rhPAuf5+e7ChIH8YrYRSDlLIf2+yzvs6Wlqxx+5q3xaV
         UtGY6Vlw5Wb5IscNHwP9kfA8hTE3n5K5JvzJX1POjekvNmldWmSiEGpoiCXE8JD5jqU/
         NiEK6ZUu4eQ/6wS5Tw7KwW53thGosxXIysPaYRLUhzOjhS9Peoo3F/+o1QF2aJ2Ad+t4
         0PiQ==
X-Gm-Message-State: AFq9FYKoGTy7x/SqeixsfQVtPScX13+34YkdQE+thJDcTSSEOou8hppp
	8vrk6hBTHZ6EODd/Wly6SPDrTn/XclkB7PG0yW8VxURD5RDOcGdtQTiSkNfxfeOPVF+h8ey2aKh
	l6N0jWd5PIa5woEYz1HWqa9LMo1Jd+Z+9GmpvFo4N0OHTaMGPOgoRk0SzDV9HmNW5fw5J
X-Gm-Gg: AYBFou1DLqswGZT7i0rSeVm7hATkHmkaxOrs/oQXGVr7LC/T2T5jNFCXfAawY+mKE6X
	PQdkn8zSI23tBhemvleSjV0LYrzj3NISqS98iB+PAFgwHmlyvKCY71w9Vj/dxJbt/dq8D8wKsdE
	zo8R7rj7Wxqb1GL9dcvvSrzGksbRhMoYpiDOgYXxLODeF7S2rEZ+0EwbloYV0zVOi0MgzqsPSdw
	2EmxrhVzTLqKh6NKMbN3xJAodwFwBEcXe9nxtv2yf/NfR+83AAEZC069+L0BuIPE/CZPWe1G8H5
	YywE5StY2kRrFI4+E5HSa4r5rhN6klzUBwXwGEa0S8rUuPanj0e2c2kVamcUuc3t5V1ZdHyUISd
	b+b1Inc4H4KIBYATDPXCBvyF3dP8=
X-Received: by 2002:a05:7301:4707:b0:359:c5c1:1561 with SMTP id 5a478bee46e88-359c5c124afmr6226010eec.13.1791812065821;
        Mon, 12 Oct 2026 06:34:25 -0700 (PDT)
X-Received: by 2002:a05:7301:4707:b0:359:c5c1:1561 with SMTP id 5a478bee46e88-359c5c124afmr6225974eec.13.1791812065235;
        Mon, 12 Oct 2026 06:34:25 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:24 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:22 +0530
Subject: [PATCH v2 12/13] phy: qcom: edp: Add Nord PHY configuration data
 tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-12-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=2153;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=mc70GfhABlJEcIgszTS9OYEd+47rUg6PffkmKCnmkaA=;
 b=Rtaxo/Nh7eGn0ieiVqBP2KN9g33OKo536bTfySr6a9ADjYIHd80Dbex/t241gIRSnoVRjQRgj
 /oYuBiVbkZcC1tnPnA/IuOsx6QfOu0PrlLstteaT6LPSojTMVB9dae0
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXznuKlv44pWlB
 qz/S+/gdUZc9y2bT18SQatEJmjj2tvGQAdPHpfV1kn8UTJypjIwkJEAfLb/WEBd2pdgAKenVVBw
 HCz5kvDAqph1HViXSPUfXGnO8GWzEpZuc6Ql5+nkTd0bNqlG4ezS3X/9fwJZCkbEo1NUcV1h1iE
 48VqJpfg7Qf65rLMEv2mJLYIA9KMwVlLJ9dDOdCbh5mTOzK0woQp/W1sPX3+CJDH/m6inDbByKv
 DBtitYHHW+Vkm9jimKXHX615a9skbX9WnJL5Bp3KqBfONEVQtiY6uqToWZcUUOy9UvF61OqjuAO
 Hh0OW97xjfmL2lxREno/kvAkWvqnfrPrap4i5RyBs8LsSr59ZdHk0sE1rrcMFBTZuldHjua64xB
 l3X/q5c2j60/XnO6kKWUYAT33CJ1tfWyf1/blcjR2Ih0Fdg9hcfwznsM/BGaqtH5BHr8zTx8nEq
 IylguatojEuD5qipGxw==
X-Proofpoint-GUID: B9toffRygDcUTRga7PSQxIOF_44EQt2s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX9OoA2g59frNw
 HYIrjztkDTL+fXY+hcgWvoMYhbvSTBlmwRa4kfGfoznMa9agyNXjNdy8zuxTL/GMg7icUFvTH+C
 Z76CyCPVogmToZKFSm6ZezB50lCz6VU=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acce1e3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=44JGFhAfC3nl-4BMLwQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: B9toffRygDcUTRga7PSQxIOF_44EQt2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add Nord-specific AUX channel, VCO divider, LDO and TX resistor
calibration data: edp_phy_aux_cfg_nord[], edp_phy_vco_div_cfg_nord[],
qcom_edp_ldo_config_nord() and tx_res_cfg_nord[], sourced from HPG
Tables 2-1-a, 2-1-b and 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 3e857d105668..cb5f6e0ae607 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1741,6 +1741,39 @@ static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
 	return 0;
 }
 
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
+static const struct qcom_edp_tx_res_entry tx_res_cfg_nord[] = {
+	{ 0, TXn_RES_CODE_LANE_OFFSET_TX0, 0x06 },
+	{ 0, TXn_RES_CODE_LANE_OFFSET_TX1, 0x06 },
+	{ 1, TXn_RES_CODE_LANE_OFFSET_TX0, 0x06 },
+	{ 1, TXn_RES_CODE_LANE_OFFSET_TX1, 0x06 },
+	{ 0, TXn_TX_EMP_POST1_LVL,         0x06 },
+	{ 1, TXn_TX_EMP_POST1_LVL,         0x06 },
+	{ 0, TXn_TX_BAND_NORD,             0x05 },
+	{ 1, TXn_TX_BAND_NORD,             0x05 },
+	{ 2, DP_PHY_TX_LN0_DRV_LVL_NORD,  0x12 },
+	{ 2, DP_PHY_TX_LN1_DRV_LVL_NORD,  0x12 },
+	QCOM_EDP_TX_RES_ENTRY_END,
+};
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

