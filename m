Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357054;
	b=rub/9AkkLGJLxLwkwBwRmFz3YwsWQPIrqRRq2oR4GShAZCbrVDCW4M5+s44MDhzPsNf6
	 9zFDZDwKOkak0n5TN5Blqx9FHE18I4PZBsKzKM2/+LteV/xRbiWQFgWoDbM495nYZS1VX
	 RvPAdEoXa/5+z4/DgJt++m+vjdb7nKXbhvY+9SAKeJEOWKwH7JyHGmgfTcdllrFFnHtmM
	 ezFvjIWFhOAYWefcKoq6JUgKqD1oMZkwejOUcFhp8nqocykJSuEpcB73W4hjzUWbvSnAe
	 PrX7AVKKNMBTbWa6+pnR9A6F9/Iv3mdYfiyCVEC0EZVfM1PdvQJq+AY7cE9B6rMGlIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjACe6s+iQo=;
	b=usc78vS5ZfA2U9nYUxHP/99L9HLI8Y7Qa6LYLSVHU/kXbRyr3fQ5u7u0uRzvID9bANg2
	 lPVOlvHg7CJDgdR/GVctFrU0d+kA+a/vw3xfziwIOoGseZuZDWxNRJmi2/IAb7YCVpL1+
	 dAphqBQY//CoQW2wDDGqD79hrePyK3weDNtTJAUZdDZMwGIEEdHtT9mBTES/RnRhONCic
	 N7vUzyjOPa8uGbz3Af3PU+GneQkQaWYhZ+U+e7PLEj4iOXIivHljqqjqLvX8V4nwKofid
	 eVcpnp8eYwTbEnCzg6YPmo2ZInVOhGM9D1T8jAJj5ByBdFUhpTnJ4bdrGOSzq/84uBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEVaPfaq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRYmdM8y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4121606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4121606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEVaPfaq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRYmdM8y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FTQS1663393
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjA
	Ce6s+iQo=; b=mEVaPfaq0ZQ0PRhcz8til02k9WMOTx3PQoCpKYvXiJzV9mDAKdg
	9pizcuBqmyGdSjrtQySr2ay4r+RodCmsdD4JnSJ6+M7HI8AdsigtUF9HXuQx1exN
	n7J1obprpNHFRxdcBOspCog/JVnA/bWYz0hVvT1mXBfnoqwlDI3LOcMZ9QMGeNgL
	eg8yeXT80ebObsw80Nxp2DQJqQDlrRMOzQoTkkvMF3IhR9Hs9w7DQLeijdDW352N
	ABIFB8y4BUqGgqO93a7bDLy/PmBxKjqY6LVSFI/qkzIDvVJ3cSh9AegdvIyyP1ZJ
	430XgbDInJY/D8oIkOUhCK0cJXJtJUXAj5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p2kbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:44:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so851863eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357051; x=1793961851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjACe6s+iQo=;
        b=CRYmdM8yh+0QeMixcmSiYusRTf4pA7KMYqvaBdKNFI2bLUtRkmXoLBJIUDP0rsO7d+
         f++7fd/Oe/cGb8bQOiIB64MjRffA1ZVCbPfZ7XRLlkwLRvYzN+kPzxiWp6tGyQwMra03
         Uc+qrI21dDM+C7kmtnPEwgeOuEmiGgYMpgNjyHUA1WWRAmypsH8jYSjxS/ihR9Qjvt1C
         ig+8DS/At65MO/3UWq7cdDMSLCYiTd3275qIXT/aHpmXhSH2izds1/c9zlYsYdc6Gcbf
         UQb1kDWU5HCFpgnklKeUiV2tzZ9+1VsaLq1xtQuM3HgIkVXUciZ1NH1Hbjlppqz8WRLN
         phIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357051; x=1793961851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjACe6s+iQo=;
        b=cbnB+U03BznpuP9d4/3OQxy35hcHQBiLlh9+KwSvS1GdiHexPjNE91xlYnW18WBsav
         KAXSC/XqDKjX3/HJOvIQZ+73JiRwCZiuE/aKZOha+B6xEcHSh5sSio8rh1bIZE9xi7XV
         vwUUMKTwNQiQ/8CoV7sdDItC6bsIrgKh6q458Ky9qgY+hzfmSPOuCY0nSx7nCjv82cQL
         1B89gMnsGCQdU2fgiJQrRUB2IDmZGHxscdV3mIoZAqamudr0VuGzBKRiCdhBhpsEgXKM
         WUHWlPaw+g4/5cslNcm1WUgJvYSQyZC5xF46eZDnfqqzL6rA+BwyhEXifJ+EjhP0kL1/
         gRjA==
X-Gm-Message-State: AFq9FYJ1FHgJjla3YNXsuRJJZSl8idH0/f+vDZXC0pqymCBoXmtRkS09
	woU1yKUCm8jSNytbMvckzOBQxr27iO+3u4mJzK91ccoOqZefyTm48pJ5tEpr8oPpjw84qQ8i1rb
	+QJc/T17jAzxv5l+VFNDBrAY0Gx3ThR3vss3cMqeFj9ePSpGsXN3Od9HxIUbkehzR2Imf
X-Gm-Gg: AYBFou0F4cyQt7GxUsSSSTCK+9XTQPvVQymwOBsO7r/p5fVjr0FgDIMtBOva5Ief6Gb
	YE70IVpryTfxqYrEG4n9/9IUHu5w6neIyQhZ31fIiDD4Fo976KCFiIfurtnV9q8+cLOcWdsqeRS
	3QIqAmByS2ycfv78YebPyLYX2IXG0kQMz//BJ2YLFpydn/E2JDfoxeaZQcXtybsY7m1flp6cRZc
	njIJ0+14EkouKosifdxb5gcH1arjAVWNXN1H0WJbhJGdG6OoDA3rRUHccrxohzquCB3nrH1yB7u
	B93HUVHpmwForXmxkDzOn6T/EnDmznaOwhFCbFP2v5+ZQc/iETSzLWXorOyFE4WEdT7Gk5xsOpT
	oyRavpSUDWrP0YvPnuPCSDLNfPfdjqW8a5zq27BxN1LWXnwNwAAmSwlQxyjewBxb/sXJpOqOnL4
	MTaQ==
X-Received: by 2002:a05:7022:2606:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1ac5d0da4a1mr2844795c88.21.1793357050980;
        Fri, 30 Oct 2026 03:44:10 -0700 (PDT)
X-Received: by 2002:a05:7022:2606:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1ac5d0da4a1mr2844763c88.21.1793357050267;
        Fri, 30 Oct 2026 03:44:10 -0700 (PDT)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm6097035c88.14.2026.10.30.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:44:09 -0700 (PDT)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Tapas Rana <taparana@qti.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp-combo: update offsets table for x1e80100
Date: Fri, 30 Oct 2026 16:13:55 +0530
Message-ID: <20261030104404.1945160-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX87af+rcxcm/m
 mD4MFLPgCz3F8uvL/AwrA/AyVi2zbm6QrTxLCCB4wHy8xqKp+B1qYzaKxbCFGv2TAGRWhlGkRuY
 Hp1MNnAnrPnkFrX29lhRtxkJ6em7gdPvuGzIWiNMLLpMAfhZ2PeTlnj3vEXEtPPNvMhO/WpSiFI
 vonY7zYxb2ZmctZYiJxhMgu0ynWz7yPuB1b02M7C5HTvFXk0A8MUuq9GQbcIn7frVA7HgtLapBl
 ZWKYHf+QtfpZ0ZzzkNC/LWXKALDqDckAvLvj5XrxMIp2daauZTlsaIprVxFh6h2HWglnwbHTn2q
 KQrPhlGG+q0p28GWJC8YBjRNuunNyAiSUDHuzmRIyP1MPF9njzYhseMbAxj/H1dhnl8bLiNu9Bt
 naF8DFealDl9YDldMS9ga8UpT9cRI9o6JlkN56SKUWuv0AzkgWP7tkbnZwgFHMbt4bDPXO5JcR9
 G04qm/fEkXcKJgM1NXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX4RjOtDxTI+7L
 xjtE5p+16uL+VkbHoisGsRiCNVEy8EyNWIodpEKdoBY83S9Z8KqDSMABZ6L8JwqEtEETQfZZFcf
 dMzhMrcTA1YjQkDzBQE4sP7/cWXDcvA=
X-Proofpoint-ORIG-GUID: UOTHhsui5xVEall7hTzcOzJ-Zs_ZKVCF
X-Proofpoint-GUID: UOTHhsui5xVEall7hTzcOzJ-Zs_ZKVCF
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae474fc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WK3x7LZNRzmlshLj7x4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300042

x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
it uses qmp_combo_offsets_v5 currently, which does not define the
usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
autonomous mode falls back to pcs_misc for clamp control.

Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
through the correct PCS_AON register space.

Signed-off-by: Tapas Rana <taparana@qti.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..aa9dc9716574 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2762,6 +2762,21 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
 	.dp_dp_phy	= 0x3c00,
 };
 
+static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v6 = {
+	.com		= 0x0000,
+	.txa		= 0x0400,
+	.rxa		= 0x0600,
+	.txb		= 0x0a00,
+	.rxb		= 0x0c00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1200,
+	.usb3_pcs	= 0x1400,
+	.usb3_pcs_aon	= 0x0100,
+	.usb3_pcs_usb	= 0x1700,
+	.dp_serdes	= 0x2000,
+	.dp_dp_phy	= 0x2200,
+};
+
 static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 	.com		= 0x0000,
 	.usb3_pcs_aon	= 0x0100,
@@ -3003,7 +3018,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v5,
+	.offsets		= &qmp_combo_usb43dp_offsets_v6,
 
 	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),
-- 
2.43.0

