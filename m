Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BC14CDDE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847318; cv=none; b=fTr34kd9qx9HvWosoFVbXSWPzZDqHBMLbs0VaywWuaYdKcDen04CL7iXOZa+o9CfChUl/Opm8Xnr97iHDVvtNQZvy6e+x+h8TboFFJAmEbQKsfV7ta0EFjX5xr7K6PZZ/ie6GMqelchXYJm8nb+MT1t5wtOKBQsDL8haTmq5TyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847318; c=relaxed/simple;
	bh=kVkTrMoJrONGtWfuMCcKwExQHQpB8MQI/xufwSvk0d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bftzCixKm9DbkLCed8ZeWEy1CTjgqd6qKH4LftZQYGahZ+pfUy7l14CJMlcnJf/JOWsLJ8u0gBD87WHZb1tZSndlFVLGeXSYbJlZZZ4vdsGoxhC/2/yEcFKy9pysIpePHRhO2+9sjm/ef4tU8DZy3XMCvCPuZrh2duU7ju3aLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIO6Z0ds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZY6G95U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIO6Z0ds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZY6G95U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPd22806285
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 09:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xa8kcq9cupl84D9TjL7OsvWmSiA7DyflYqPRctbqDnE=; b=hIO6Z0dsUd2i88p2
	ul+ERcYlFDdMENSTjCRHKk3OKbxCpjpOG0u1PJTeHdaJvTmVZtwHQVgqankp1ekk
	a2psIP+vY6+HYzp+fHYTCVdql7qhLY71U6qidQ+cX3U2gqMJxiUoa76CXpmS0Klq
	8aZ0UWV3A3FpA0iqjJqFBGc3ueBNO/EhwyPDGO/OSA+X06BChnTnFiu/Zs4Vb9f4
	y/upd4b8k1iR22N2Wx2wey975/0XAWRVZUpAYpHHjK7wAzAWX5wdURMjpgTFoP+O
	h74YBv0sHGZPywC9A8al2FEQdwEJidvvsDQxbYRCAvoJprsRgoqsLg1CMoQvwRqB
	BGygDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkguu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:35:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088202so4460589a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847315; x=1791452115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa8kcq9cupl84D9TjL7OsvWmSiA7DyflYqPRctbqDnE=;
        b=HZY6G95U/tEkWTP/vimrw4d7q5vmzenOBTcyLMRvJXpZqfIT0RBAR5TeVcxUM7H2bJ
         Pvt7oWBaLxKCeeMPCsQCMOiGdigkglNB+wlOsDQyxMJHrGnX3yKCJcBZa03tJMC4z9A2
         xfs80meWH6VRyRc2A8i2Kvufq1fvKtWXQiys0999fulpxk9zS9vjrFjhMGqdUBiTltSf
         K7UbpBfPOZqwGFA/TOAV1wEggXnDMi+ChmKHFeemhKBbRvL0Qb4hDIO7cG83AcbWfm5A
         7z9cqPJ8EKaSsCQJiUimYn063g5zCaMOocvBAFT76MUfhVHSigofOhLCCxJEOaPPiGqf
         fhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847315; x=1791452115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xa8kcq9cupl84D9TjL7OsvWmSiA7DyflYqPRctbqDnE=;
        b=ml10OPrxp9MsYfdcxpTGBnBFR0HWiSL9Vydy+sm3vzbMz6iWimsx0ksPg8/maN2+Sy
         Q5jdS8OuZ+F4+tU3LFUquZQc1+mOZlk38LzLfXP1bZPeaAWrRMV6nufasxeZvEliyp4s
         El3Uj5z9cktZARLf7XYObcSkUcPWbzXBB1uv1JLm1e2VCno7YrD2r7KaFLbLPexr0hdk
         A/IMMOkSeo/ziK6RxverCqxHc33fVls8tYFEGKWLKz852lPDB953uZjP8gwxmUxlwASF
         WrbhXQZD5500KDbsKa84PZUlRHaVHgFKonbNUiE5uTiyOrw268ZH1z9UH4KSjkCIP6rO
         oFAQ==
X-Gm-Message-State: AFuF++l9LkbN1CdCyY3XmDGJ1Ka5OQiQha/XlMKR2zXyxIx7Q8s00N8q
	JoYbiX/y74KdAyErJcOerLrctGBiGea6/GbftGKBJDcKZaQjo0Tv/FScxVrhq7t/usXfH3WZROa
	pGpiAnxJyXbohYljhdVgKyNr5SpJHhNd16Qz9HdE1w0VeIcJS6GahEGE6XVkVgbxr9Xwr
X-Gm-Gg: AYBFou0JMzn8kg0ZLPWBTm09qYXpVamRbyXPmH2QsBXO+2lDeY1m6xKKqTSC7SO0+9E
	LW7Plv8wTwVrb0Xcm8F4dXr9B/6FvBTjVc0JSa3TEFWVpYP4TYAwDPFas1f1G9ztY+3NgisBOov
	/hq2SCf7WK6WkUcvUjuv262xXp9QxRclj+MDe8khbE1S9Nrds3NaouIDzU+N0bt9GVPu0dyd0iI
	GghqoSLhYYL1nr2QIT0fl5IMvl/FSbbMLAGZbXMzchLoHONVmMD8Q44AprjYOjT6TC5a3akqmXy
	y/YiqNNZ2+cUxgjYpXD+ffHFe7JBiyfcsmQ4Bw02DLoEWuOYJZNLuKXMMt0fNhZJFF5wSEr9JEZ
	LylVqFuW41hNPLVyqtiMhwToS9Bo=
X-Received: by 2002:a05:6a21:492:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3de9e131d4amr4539459637.1.1790847315299;
        Thu, 01 Oct 2026 02:35:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:492:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3de9e131d4amr4539425637.1.1790847314801;
        Thu, 01 Oct 2026 02:35:14 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:14 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:21 +0530
Subject: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=2328;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7m5evHAKSZMPuWBmI8pbjsbB9zXFJPn4mEjLL9zJ4Hw=;
 b=se4+x91fgpXd/HRkM0JOTgR6dY+nJfeYyyXwdbcZunzZ9shYZ1f9N7d3hhTra9VwXzwlB9jfn
 ra45k5QJCDeDTYC9iyfTrP/sSShxtzUIIaI5yIBIk5tvNqGjDSrJbXC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX+dqg9clNae4D
 oe0KG2wK8Ge6fFFYD2SZxV84NBb7jW1lKmQRa8iuq073SWTcB18ddtVi/BRCti6F0ZSxDpirIZA
 XO70NHD/fde6qfqGQ/gCn27LXGYWnDM=
X-Proofpoint-ORIG-GUID: dz1-yXnTnZernfn-v4VIdFWjNw3x89fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXyc8aGt5/eXKz
 sP7hMCgtEms1jmG3qht8zXGffk5cRxqIAK4CVlixcHN/ERIHj6PetbsXRMr5tLXOFWXZWemNmRu
 xybKxyUy3JXKhSGKb8O8qEO0qcwK+RqMfqf+ICIreR/TucItZEJaE+pSAvLWJfoxqqOukx7AB/W
 ZQ7VvsmfU+QA8/S4z2gWTGAWjjCvU4ACWLIfpj8DFTuBb/IAOPdc+cM6FxUKg1OZXuYTMZBcZNu
 HSmE6wHRvUSo1GNiUa5u80zBWej4oTndxjqX1Y9YA2dxRfFZ9jgfxSojHYYV2Y/FsizLJbIOpYb
 DtaVusKOSM686n0T8M0t2lqilBx5+oxhgaKxxVPNyd7pG0sFxz+S9XtXAgekQJILbeEScNEIA+v
 E2mrdf2Sws9xd5pu08QiQLou86qgx739uyDGQ7savsBDbO8Jg9rJVHeOljpDayWdJnEOKlqY0WB
 jCJ+7Kp8orazPlJ4NwA==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe2954 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=I9iHhWb_IStLGF-kurEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dz1-yXnTnZernfn-v4VIdFWjNw3x89fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Glymur platforms use a fixed DP lane mapping and do not support DP PHY
mode reversal based on Type-C orientation. Add a configuration flag to
ignore reverse orientation during DP mode setup and enable it for Glymur,
ensuring that QSERDES_DP_PHY_MODE is always programmed with the
fix mode value (0x5c).

Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b672adb33fc5..646e97a52886 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2551,6 +2551,9 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* Set if DP mode configuration should ignore TypeC orientation */
+	bool dp_mode_ignore_reverse;
+
 	/* USB4 specifics */
 	const struct qmp_phy_init_tbl *usb4_serdes_tbl;
 	int usb4_serdes_tbl_num;
@@ -3422,6 +3425,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
 
+	.dp_mode_ignore_reverse	= true,
+
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3570,6 +3575,7 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 {
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 val;
 
@@ -3583,7 +3589,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 
 	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
-	if (reverse)
+	if (reverse && !cfg->dp_mode_ignore_reverse)
 		writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 	else
 		writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);

-- 
2.34.1

