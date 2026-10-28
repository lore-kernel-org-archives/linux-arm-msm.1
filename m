Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183956;
	b=sBs5tDuvK+N1vxey/sYhVIxpVAVd5zk3soYdCIkWwkTcg2h01QAHkkyRVeF0A54d+xo7
	 +ly4+7vazfuam4DBxtiAwO+66konBUk9jdCh5jKJeKCdk6l8ssSmrj+QA68xtaSTm3ROQ
	 voeI/2CsUOSjDivsKM0xP/b5H7txmDBN38XBo5v+Q3XV/k/1E5pVXK6I/R3LGF35AqAXG
	 4hoQaYwZuDG1LfVKRyY9ACfvPdBDOv0POzbsnUpU486BAqIlQulVl6oG5eJSs7K9u3K9z
	 iT/tJIBAHjTCcMDU70yZDXLB4GNGtYGpsopk8S4jdV1NWQpxA1es8aLhRxHE5v/7+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=;
	b=13sPTjejnkUTnmSr8n/a0ZQbmHo1zDua3vehVLXlwllqzeEVNk3eQfy/Rs1oPZd2IxqH
	 bEKGrBwbH9fuQTAfK2tl/ELL6LxDPM0xEnMuTPrptWgNunQd3M0WjnavKGmZ19LIrzuJ9
	 SVO/AJ7c7RTGl1i0mtel3TiXB96QwjLnQaL9fQdHQs37lA/efzKbGfBUBt63K6TFl3QMx
	 tppcscufzBE91VQzCo8Rrc1FupU0edzaakASp4eSyQWZqWIGGyFapbtbS2w2asm6qY8S3
	 fn8tmAjUjOp6TY3GK+M1lhuzCrVidG9lQZ1QZUrNXAT531nAJ39mPjcrEvHyNysYCnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ss0pvhSg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="P5dGDw/e";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5021606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5021606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ss0pvhSg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P5dGDw/e
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8hJ5R3768373
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=; b=Ss0pvhSgecEXLu1v
	Cs0hyMGOf/utTX+HF5iH2Jip0Qt1zH9F+cOgLbxlpykKqD/CHFF4jKDneGU/QD6v
	P8A0A+Vkun5uSLl28p9qgTidjLZA3Tc92lpZ2MQ/0HpqXmfJ267OlZOytxgEBisL
	gczbCrAXoq5WgU0NuPAb0FnfptHn+SDSd9LbX21df/TBFzVCQfti6hALdNfRjhbJ
	pdy3A+BLueTRtbF81zJ1eZJLYv5z0Yamwr3FqmDvoDfJfdDvFQMDUfi7NR0/2Vhs
	81RQ7sRhbH4iPB4HRqwTY9tQHb/1mdY4ztJ5LQnkZhxUZPyjJrJ7u9Bnn5vGCrpt
	+/qTFw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0dgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so1064903c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183954; x=1793788754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=;
        b=P5dGDw/eKVB6uz3dCAMb6igAnj4tdtQBCBpCwEt6YI6GggJ4gC8dIuS4s9v61QnfD6
         yBTMpcJv0337HuLnS5Cfs/W15lrjojZy2gjz4i2BjeBqX0yFrFM+/1taXfQ18iPIL0CR
         0HVi6Dr429ef7xc8RmmAIWSJz8CmL4fuhuOVVyBvS+2ttNvl/FXa6l8yrlzswvjQVT3h
         NRoo8D8nf0QYmb145O2CWiUcrE9gaMwpnqrCHjoHTfAazOT4jbO8QuG+eWdXRYgy9kMA
         NBOVqWH6R+bTTlNLV3NDQn9RTpkeJcLiq24OZsoP1DWCOFiy+RM6XtpnSU+AAe/lRugI
         j1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183954; x=1793788754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=;
        b=2UaW96k77uIVaJ3j1NyJDhXNMrQiUECrZ+PGB6iK5x7sypXb0fr60StymE1aUYDAAe
         pgvoblX7Xu06QKkoOSDLE1i5OT7NanMFrsUGvpG7aBYedKFzT4Ng0jBCkbBrX/DFEFx1
         gyMnHj06mIWJUdnX5fGLGVja5CaZ6bVfiGmPNDGo+xHg1UkqPfFCo+jLGeTK9mVndAlX
         Iv5AxYTXbKaZrcO64QM/BvGoVsvYfiFk4chRUQdWv260u+7GtEZGbbijqFo31MLzRYHN
         H5CIydoqDB3yU4QiDoQK1MHMZXgv1WvKLW7UojE+1cwRKtiJ1NUl5Ds+8L+3LUHsbbgG
         c3Hw==
X-Gm-Message-State: AFq9FYLyM0oCMae/Ga9s1myX4gB8c/tZ/p0y9hpMeUeVBkntKK7qDQZP
	ZEiX+FIZgr+RhYQDiFQpXcMlWdpCYvN8i4mqVu0QTDCssgzLuRqH9Uyr9/0IfiiLi3FoCDNj9hP
	otR61fdu0hrGHXStOo8dRXGLAu4oyYVGKUpAy481JEae6nxP6IK6tECnRSv0JxscCgMou
X-Gm-Gg: AYBFou3hmPM6MbKS617ukjAPcHxPHW6HZQutJxnBwR7Jm67sJO1xha9Fn53FP1QhDmL
	ORRNif+smPL88HS89rUHyLF6mm5Pne8rA2NXufgzXftJJnnTd4cAmqeJoTOi1x3nOyw2Umc8u47
	wW17BFPtRIm/D+YM76M2ZUWrREYXN2O/GxsHYcMcM7e4hdIl+hd959zqovjqrqDj1wN081pc/1n
	GNGvbmWIHNj0aSyHGEvV2hUCUWpnCsELV0ZuD1Vx+8OEFdXuN7WoFGOY2JyEuybEMvxhQ5w9s+h
	EV/hBqOy1fBfJe9oMpQawZ3f/wDCr7xqphYW3oIyMut1HZbPLc2KUNvoGxDJEpBpwSfplPMLbgj
	FiGoDSybQ7B6j9pSaKhmiq2aDgkJjcG0DF8HsBbf8lCPb+qnwYs6fH61yBTQtGl7B3kedH7fM6z
	4=
X-Received: by 2002:a05:701b:281b:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1a6ced8ff93mr2501426c88.12.1793183953622;
        Wed, 28 Oct 2026 03:39:13 -0700 (PDT)
X-Received: by 2002:a05:701b:281b:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1a6ced8ff93mr2501389c88.12.1793183953086;
        Wed, 28 Oct 2026 03:39:13 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:12 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:04 +0530
Subject: [PATCH v6 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
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
Message-Id: <20261028-glymur-phy-v3-v6-8-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=1790;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Q/gqQqFFXIemqSvwDZ0I5cKPziAiAQ8r3AkT9pgNa3Y=;
 b=AzC7qd7YSqM74rPddg0ipPk778IkLrfnxikkG9XEw+/L0uEJ4ZAKerTdE37hMHnsHUO81GcDo
 0UEodpB0TolCzcd87VUjKukrx3dsYTo6OC/41WpDx8T/vwOTfD23PNv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: DiXvAlmqj9rCtU2LmOqRv6AlikKJwhPS
X-Proofpoint-ORIG-GUID: DiXvAlmqj9rCtU2LmOqRv6AlikKJwhPS
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1d0d2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=VniZYPIeq2n4UU9-3AgA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX7OPLJPxJXTF3
 hTlzS/jZbhZQoiGPiwPl6vBY+unU4rWl81yzSn6r8eJfQiTBLdcCSz2uqCCTBNxOl/q50QO7o1x
 AxMKeYRcqEiuo5DgCcw8nG5xRKg9kn5ej5/DTiOAU2vYsciRIGTgyR1gZVGCfQtXIWjdUEJ+s9s
 OSvOrl8wq6YfCRxRe5y1AAhab9X8y4pTqohrfprrLhVdon7aKvv0Ia6y36r02lXyr1tYtN12DAs
 CM3zx7O/zy4h+TFF7UsUNmiOLY8RZmhVb+LlzZGQYQG+WqvsHK0/Y3Y4Po77PFP+pxOD+8fW/9Q
 0dBiocHYDb/VYQn1YXqlI/0c519w+TLAaQtpAaNO61PuH88bsTtcWzhw8aDolBHIUFIKJgRCBsL
 a8pl2r340XAD+fnyUwFIqsz523uBhz39ZypRtUCXmmiKfIGuSxPhd56cwHBYTpYuU42/ZECR5ND
 te6IPkkg+BUBX+IncvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX36r1obsUM3aa
 OIVGtwpCMo9S8TQoTauRn2A+48nbGvQ57bBtR4sdhExhkZybyfgcjQJMntHDBJW+HBwOQ2FkbkN
 uE9oC73GvgQVAreod2KKDBfls0n+BR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

QPHY_DP_PHY_VCO_DIV register does not participate in the
divider of vco_divided_clk, it can be left as it is- No impact

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index ff7f0293638d..51d7102aefc3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3945,32 +3945,26 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 phy_vco_div;
 	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		phy_vco_div = 0x4;
 		pixel_freq = 1620000000UL / 2;
 		break;
 	case 2700:
-		phy_vco_div = 0x2;
 		pixel_freq = 2700000000UL / 2;
 		break;
 	case 5400:
-		phy_vco_div = 0x4;
 		pixel_freq = 5400000000UL / 4;
 		break;
 	case 8100:
-		phy_vco_div = 0x3;
 		pixel_freq = 8100000000UL / 6;
 		break;
 	default:
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);

-- 
2.34.1

