Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003D5519A4
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876187; cv=none; b=l/KEFV9UQSzvSaymf7nBiqBIBnEKLRSL6p5RK0z8rTUFoshuQ6khfMtFYhgegWlx5PBLK97dQmmct9DIILhUmZ+JzxTCw8x0rzjyGxhABZbf/w+/Xg8KMyZTcuVsGGHheKlns2LLl/y0DoZqijp70Achmd+9Gcwj8677z9yBA4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876187; c=relaxed/simple;
	bh=mfVAIzI7dp/EsLEDP/z1FixnKf2aqujkq9lpYCiyTIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqgTmPjBLFa/pRRo9jNlURMIcZLKMdjk94l/fFbyQ6LeZOrQerlH30X/XvmpinJI12PrFoZI3mG7Gq4w7WCOpR+V3xQBplS+qMlHAGCtON5dq6aeUxANt7EL9//nRgeJLXzsMSIvp8O9YadOhAfqOVc3xJLmf9fuJpg8g8NTVMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9k6jSpH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+cHXn91; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9k6jSpH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+cHXn91"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckx0L3844427
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdbggFe7q8Lj6kqK3e4CFZXoyrPkPZ+UAv54p+w4GjQ=; b=H9k6jSpHaPW/1kui
	S0DmfVkFo3ezbjZ4bhH0lLJMx9zf2ATgBVta8JtSt4TA/Z5RMLtalfhVoH+Snoux
	r/L4Z/4Hq+pa14PbiKC5hTy2+Jn0a1VrBL2x8SEZHidsI4buUAIdz3Oa4Ol+CNxv
	zUKv5dvZUR1FJ1eGNYDcgkq+8KnyV8KDF7Taw0Un0huQSCSrajQsRhGClD8ODSyb
	fO0pEtVU4w2IBC8Rx0WyrVN1BXjmuNjW/xKOuiy2Aom1Q/qzt07Pbsjasuvg1V8R
	g84FOYuQ9cyGxeTMKaaoeafLOequzZ5Ud/qxZ+3FWXgD3lPOdB+4nsFfSCVE/gSP
	8GHWqg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrxaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:02:50 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1abf73d1fso2447432eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876169; x=1789480969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdbggFe7q8Lj6kqK3e4CFZXoyrPkPZ+UAv54p+w4GjQ=;
        b=j+cHXn91Yg7LEq+w+smpb+a1qi0R7Y9Wg1ZXOZt99uvYoRbWf85t0d5XAkVEpAWW/5
         tWd2j6zPwHyfOSueWNTtFaZr+I2xk00U7alS1Wj6Mfl1CTRY0GTnGH+jZXBbP72YWO4r
         PeqnqGHiM6KDU/jFFO77D9kXWK5l5FDjRjA0Xx0APVAhQLVHI5zFNjOG63vkL7mmHun4
         Olzv72z4x/1AmuZ7zoZwCXoNaS7bpCvv28eaIwl3nrmQPwC3EUvS+KPQ4DHLaFec/iH+
         gtMRMjEaKidtiB7Qu4WiC2pKyAsPnuODGlRkdewCuAbriPcBPDI6l+uiyHj+VbkJAVte
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876169; x=1789480969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdbggFe7q8Lj6kqK3e4CFZXoyrPkPZ+UAv54p+w4GjQ=;
        b=VAKaszEQFM5Y9nhYkS6O9HBZ7GyY6e1rTKxFRTg2tNnJ1a0CV7tHmq5kiO3u4juVZY
         +4/0MTcoaxXzLW3YOrAIpbLcBOxogJJ4+U6JTQnJKrXelbyAfeh/z6RU38ZkBhIm1tpN
         nbezY+p74uxwN5r8jLS+uP75kG2kHeZld6XI1ilRmQ1QCckdbv4q/ra5Pdqome5OLyyF
         /ui6c6Y28FIWiXeh7ouHxBmoucIfGsbUyseAk9JLcWRjx8MdhnbooVq4fwg3nr4RCKSE
         eLKVNUAF+HDHC61ioRdeUFpy7KnPXqC3ycRHhWJMvPSKAcBLmg5oF1qNCEaZ0n7lgzes
         bOlw==
X-Gm-Message-State: AFuF++lNcq1j+Pmr5IpT++Lsd5GUmdknn65eXiXqAL2KKSWd5tHb4NLv
	7FuZs2yT3X7uvG2NjYTCTRseGiAbpx11E6NRBjdEmRh+5oje+5NPaNhTccE9QWo56vM9V/qtr4U
	iy19tVq084U59BWpSMJBvo1eVxVWsP35LYuHAFyxFZ+N8GCWV27fFnuorxaU3f9hqMxgx
X-Gm-Gg: AYBFou0kRN5KPobDtHm64lGO7APOgfzpiOuILiM4cHxi+2YaV9d2BJbcniIPjVtEfeg
	qxL7bW4DPy4xdAPcSQS4+ZAsKR9u1wbncnGWy3zwySlth5JP2WHabhGyu9PxFzb6837iaUfAyhQ
	2UfLMaGwck5CN6O6JrGDe44bIRXS24EGt/PtQXI16yA3Uvm1By+8MPd3eHJgm5VPMVot6gQl1Mi
	RS0DlarwpU2P01R8EF+0vY5B8JSA2Lq/hdzsYAPcz6Nm3P2c5V/tL5qJrlCb0U00bJ8oVsJNKgz
	n6p/gTvJ/Zu+gEQyO6nX8Du+l23hw771sKnS5JDmLYnV4dYyX9UIF9+Sf3uGR1nGZ+O0CGoC+fY
	jpRTXOT8eQJf0FqAn50iWJKl8zKE=
X-Received: by 2002:a05:6820:1890:b0:6b1:464d:4d1d with SMTP id 006d021491bc7-6b6fb8d25aemr15843810eaf.11.1788876119700;
        Tue, 08 Sep 2026 07:01:59 -0700 (PDT)
X-Received: by 2002:a05:6820:1890:b0:6b1:464d:4d1d with SMTP id 006d021491bc7-6b6fb8d25aemr15841199eaf.11.1788876104004;
        Tue, 08 Sep 2026 07:01:44 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:43 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:31:00 +0530
Subject: [PATCH v4 7/9] phy: qualcomm: qmp-combo: Update
 qmp_v8_configure_dp_clocks() for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-7-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=4361;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6aummGG7uM3gBoUmHGxAZoDx1OzuEAw7M7EaVWO1zCU=;
 b=ftWM0vBvxlKMhxDLJzHKQPIU8XWe9hngAp9Yy50vSeOzT7iIM6l+cM/4KynOpT9tHi9Xeydni
 ltFoLCLrjRuCy+F7LB5nb4ph370lAHcz1ZagnKlNMiy77vds7lTxmuC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa0158a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tE633ojKFf1lYKHj1RUA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: kxb1WYCZra5BtfR4veT4wgJ3Pim--_y3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX9O9RhO1h3loR
 DHVf5B0NdB0pqxErpIoHth0BukRx7g77AL3ZoBoEvy+ZQGmkrMYDdWDL+wenJJ6LGwIQILPpTQe
 j+5eEbEdfStfM46Kno08+c7hHz2LrZEGJJ9zXFDQHkCU/HP/sv+4t/7ip9DXNwcRe0TC+9pfKU1
 UClvQI55f+mIHgKZboK8ZOpCdYQ3hDr3SNYDiS8mIdRGbgai8jxsGD25Ffzd5RZt1G6tr55CsZa
 oeWehax5PpxkE3/eDHnEz9Iat8EXiHloF4uHoypQ7Ac7A8cVNsMY20YCYQC6bycWaHAjSeXxYG3
 Tr+1LvX9ETbqZsQbgdoYnH2C/ZS8hzN+7Yh3du1ISsTJzuIO1QJlA8veu264tlhcnH0NnB5tUhR
 XyDkPpJhjm9jGXVfYZZDY2QMXnh4OA5S/nCfQ1zHteb1tuloHEGG5fhkPDypuo8F8i/4ahRhb6s
 essMQr5IX+v0LP5f85Q==
X-Proofpoint-GUID: kxb1WYCZra5BtfR4veT4wgJ3Pim--_y3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX2XDCfpMVW7Rh
 BvACoNCHdz46/oQbpYahxSSMrK25muiS1iECryj1zia45LeRMSHu9inJcaAmg94+fnCYrRimw+7
 F/WNSXp6qJcAsD91bg7BjosIIfkb/lc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Remove VCO_DIV programming from qmp_v8_configure_dp_clocks() as it is
not required for the v8 PHY.

Add per-link-rate auxless setup/silence cycle and LFPS period values
instead of using fixed constants:
  RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
  HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
  HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
  HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55

Add per-lane drive level lookup from the ln_drv_lvl tables based on
the maximum voltage swing and pre-emphasis levels across all active
lanes, replacing the hardcoded 0x1f value.

Remove the duplicate LFPS_PERIOD write that was present after the
AUXLESS_CFG1 programming.

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 45 ++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 79006469f3d4..a07ad858b0d3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3868,48 +3868,67 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 phy_vco_div;
-	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	unsigned long pixel_freq;
+	u32 auxless_setup, auxless_silence, lfps_period;
+	unsigned int v_level = 0, p_level = 0;
+	u8 ln_drv_lvl;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->link_rate <= 2700)
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr_rbr)[v_level][p_level];
+	else
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr3_hbr2)[v_level][p_level];
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		phy_vco_div = 0x4;
 		pixel_freq = 1620000000UL / 2;
+		auxless_setup = 0x03;
+		auxless_silence = 0x06;
+		lfps_period = 0x00;
 		break;
 	case 2700:
-		phy_vco_div = 0x2;
 		pixel_freq = 2700000000UL / 2;
+		auxless_setup = 0x04;
+		auxless_silence = 0x08;
+		lfps_period = 0x11;
 		break;
 	case 5400:
-		phy_vco_div = 0x4;
 		pixel_freq = 5400000000UL / 4;
+		auxless_setup = 0x09;
+		auxless_silence = 0x11;
+		lfps_period = 0x33;
 		break;
 	case 8100:
-		phy_vco_div = 0x3;
 		pixel_freq = 8100000000UL / 6;
+		auxless_setup = 0x0f;
+		auxless_silence = 0x1a;
+		lfps_period = 0x55;
 		break;
 	default:
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
-	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
+	writel(auxless_setup, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
+	writel(auxless_silence, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
 	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
+	writel(lfps_period, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
 
 	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);

-- 
2.34.1

