Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835133;
	b=gicf5isebLkZt8a2TkKFzU51MwehdDh7oGjiJWEAlVz+5oL0nUJtCHeVnXEnweSX08dI
	 rKWPdU4z4V9Ncqks97+FPZB/5ibKv4tyRUkbBEYHhFPhKYyU+TlwxNx+qnnPGleJjyRDU
	 ZTPDJGXT5QalZVTf185wDS+ddlJRIW/Lc/IfPhV9wbh5DsxHoZeAjpIwfSEpx5Zh7J9S9
	 VWFCyWHEM0gXP5W31F9Qk2HMX0ftZiOUrNMQctssp6yIOw8VfRa+A9WHXLyTt38SffDEr
	 4eobgI62Cabq6ybjl+2oM4d0nRc87qztzbNXkeaY/9GSd6//JpOFJW0dLkH19pBGw6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=;
	b=0WLjaOyrE4hW0VgyssXzlBZPXZ4xyXTD3txDmaZ8oILrC7fLwxFH7lgusQnV1LWZT8Je
	 9CQGyKxbHJzRUtMYwpC3ogmN4fr6vIwdjSndBEYVEsnH3/Py9FwzZnDUBg4TEXoyTr60a
	 vWvL63OPHTCv26TwKptGeL+MAxfxJ0oMqPCjsTG9wpdkultY0sKlbpAXA2XYRbKqbCJsu
	 inC2EZ6I2id6cEnDMWFCz7JhJc0QM5z0ZrymktBK/nXKGaUqL3Sr7OF6fYXLm00xz7tPt
	 VF1ShjuOI5vnt7mAK8a9BxOdeVMmMCy4fefOjsrMJ/2ZZHguFPhlMhaxRlnI+Rq+qsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTpXaik5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XvGQGKr7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F2606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 497F2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTpXaik5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XvGQGKr7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1Y903117460
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=; b=pTpXaik5UaLuMpZ5
	gwosfZrHEBd5EvS0s48O2QogFIbv/SkJAFJuMsrQ+MA7DUj1gMPnu2uLfdqkcTmM
	dm1ugjQ4tPXb1NUGppLUq13ywjeRpSwlPrP4YPboXmfypO2bf0rEiO/MX3UFwIKx
	uB2TxD9Ey+nIUdydtSXJUb2dI7W4WotY+/PcP7v54lwDG1NfItVK9tmtVQcMYxUO
	pWibRKdiinOGy5nAflbUBMkcVjgUcEaqmanVclQ3NMUtEUUooQ8W+eCOGuw2EMzE
	9i6MZlOlNYMdGxKoFvUwhFpavOIxjagz2wiFGTsFnV4r1phh/3tqoPlkSgWAhp/t
	oAVBhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8085u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f0f4c70cdso40990936d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835131; x=1795439931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=;
        b=XvGQGKr7QjwGTrIDsRl77GmBh77Zlrpu5MdTjouLTaEFzQvdBLT4F5xJeBJq0lbdGp
         Q0EeXuAbuDSKxJBZ4AWRXK2exD36xy7hgKcXtA4LwQ6DYI5wbStjtZMgfVKJFTL3i0Iz
         FSyX+piM8cjDTo1Tm8mT5IZ4+dhRf+hbU2K5xL1fwwWF3lnBEEeJ0pJQKtfxbp+dOJSy
         2Dc02UU3AUPqKLbsRNCchB9zhYwQUJeWttOZdxIGGHo2I2IDCapdopnzxsnk0HXh3bgf
         Cj4YpFx8Nm2kxgwhlCEcVMxBadG0RTDpM7o3YjNZ+6jJk+A5phiye7vVeJydnZFE9DEm
         xC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835131; x=1795439931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=;
        b=y/LS4v9MwyGu6WQNZjEZpIrf2LK0y7P7pQEbL4dtWzm1QuhvT5GOVOJHmjVg9IpUu+
         FV+V7ph9wKB4GFENg+HGekwIpkrmkrrSI+rW5hE6mAoSY0bNoTjLpJKkR9mguhTQ2hGs
         cBBWAVdvXRCpnln9CnZW7Jks3bfQmxMSXwPt7e3OEEr4VvyDv+q3finUlrBNUoNdq422
         1ado+wz7qHkkVtV6atR07AmT5cMcB55bKBvjKnNaVaEoYK+7oef6hiftDhD8Xklwnt4Z
         9UxR+UqzE1g3qG1e7MkvJi/ijIES+dqhH/t+qXMF0L1ZuSPY3b6lgjo0FsdTBZ5hHwrM
         ydFQ==
X-Forwarded-Encrypted: i=1; AL+hErGEkVMzsUZB8GKaBDOFBGjXKimZArE5T19poTpIEi1wX3PeKI7WJ8b26jmlX1SLz15L6NzzvpRUdAPTwnu5@vger.kernel.org
X-Gm-Message-State: APuU4Z8VR5JtmArJHXk4E0iS/ekK4MXjvoaNtXeAQCi9Sa1BK2LTtdZc
	hAYdkTl8MOF5xrg4n9w6Tj73eMriT2/KHisEm8FaVo7Mswr5dccU/jvR85INaA8Y20ImQEjk7yU
	OgdOo4YrCkBrSsEKXbu6dcOVtet8TfHZbhKFMiaSihF8L+O8oVU3qJKT2HVSShn7j0k/4
X-Gm-Gg: AYBFou39d7iHsKnDULvbcB6A6S42Kl1rpLBJ/rVdfnmmkDGF8CFQ5ApgtYkeswVMaHs
	8P3JZZHCMLs7fuszFi4rqG/6PXgQU7z2pnNIUIHtpA+fsF8aWwftsrBgIQ+0lnkj/8Lp4Me9fkp
	LcR6yBf43242E2D0YBHl27Rln3WKYNe7E26rry4v7aIjQtiZo8Bd0NoIA/od8rqLPDkyQbhPzpI
	VxBi5pU3OuA5cbKuLeDL4aYno9C2zUdQ09mbEFWFRRqd1jQuDfCnom/mUcOolBVpVpc8v5Y2W86
	Q7aW9wTsSNF2CvpiNjcysyHw+NQMrYpac1Yf38XYSeKyV3sFs8e4CkTJbDcVeT2edqcmWN0Rl3K
	kluyr4BWeHAp5cSNjzbUOooc3VpbLc/HrHiQxNZXoGZpHwIPWA7DAwkt28KQfj+HUP7sYV6YY0K
	7A
X-Received: by 2002:a05:620a:84c9:b0:93c:6507:a6e2 with SMTP id af79cd13be357-9494bbdbaccmr1577627985a.65.1794835130346;
        Mon, 16 Nov 2026 05:18:50 -0800 (PST)
X-Received: by 2002:a05:620a:84c9:b0:93c:6507:a6e2 with SMTP id af79cd13be357-9494bbdbaccmr1577622185a.65.1794835129672;
        Mon, 16 Nov 2026 05:18:49 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:49 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:49 +0530
Subject: [PATCH v3 10/11] phy: qcom: edp: Add Nord-specific QSERDES COM
 register header
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
Message-Id: <20261116-nord-drv-dt-v3-10-e3d3bf0e2c49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=3377;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=uzH13SMkMubkKgwh4agZIOrQBBl5vNpCxmjdcZREAHk=;
 b=2jcTPord6CLMISExCWLoyHcqTIsMG4HEHO7kN0UTK6uiwaaMI6hNbcfoM3VzAX006i/Bc0BEB
 cBWkkijyMlNAVEhWe9jT4eodcbWIAjoO+vvpSe0yHdF62jnup/6CuZm
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfXyOOaFvrz8al6
 tfBc4k6d1GbNbhXoL9kFl66+8Ql7YOBhQ3GQ9cmGFu3o6GPC96gLGRz2DFLd1lYZiqYYB5CWUQR
 jC18HcioZUJc3mnZ8Loje8r79+Z5wcq9ZyFWYEQqir9Hk9eFRBuPsJQL68q2fGE+IJ0bLw8G3fv
 Hoq7m9Vt0nHTDupJKTvi5px92ItUovwjAY55UHHDFn0Bow5I1KT5+zsDu12kJjXgtJkp8f0ObfI
 aoOAXuV6zr3tX2yz/mURA6FSKb1ajJvl8tVEaSBZAsLXul+SUi8s7GbQr11SDdmn/aAexQCu6WA
 mC2dqEpQxoVOXEFkXHVnS61cE8bpedz9ihxZEvkQIbB1EI4SYinYhQGqAlX5bChDQ3IttvIrtp6
 u9z0nk18to4hF1bH6a8bc0uaDhLHlr7GPSGAcSAd2CmbClk4NpM78bUa8k8uuQeKObuoMaJ8UPe
 hUgErwqP+kZTbXhcvVQ==
X-Proofpoint-GUID: DxgPEAalMqLz8i5h7BFzbT8DksQ6v-e5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX96dT+RZ593sA
 gbRAErbWRfZjjuR/5frbgjJEPKjRr4uRQvMG2tLGmLGrcF2qYOPAKa92dpyV7Nf0qrO0U+bXV1i
 6NThQZlDudW/M+yq0QbYwpE+fYhlWTg=
X-Proofpoint-ORIG-GUID: DxgPEAalMqLz8i5h7BFzbT8DksQ6v-e5
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb02bb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PUeSZSab_OCI25pZbQQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord relocates several QSERDES v8 COM registers relative to existing
SoCs.  Rather than adding _NORD-suffixed defines to the shared v8
header (which would leave it ambiguous whether non-suffixed registers
are valid for Nord), introduce a dedicated header
phy-qcom-qmp-qserdes-dp-com-v8-nord.h that lists all QSERDES COM
offsets Nord uses under the NORD_DP_QSERDES_COM_* namespace.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h
new file mode 100644
index 000000000000..f38b48dae39e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_DP_COM_V8_NORD_H_
+#define QCOM_PHY_QMP_QSERDES_DP_COM_V8_NORD_H_
+
+/* Nord DP QMP PHY - QSERDES COM registers (relocated from v8 base offsets) */
+#define NORD_DP_QSERDES_COM_HSCLK_SEL_1			0x03c
+#define NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
+#define NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
+#define NORD_DP_QSERDES_COM_SSC_STEP_SIZE1_MODE0	0x060
+#define NORD_DP_QSERDES_COM_SSC_STEP_SIZE2_MODE0	0x064
+#define NORD_DP_QSERDES_COM_CP_CTRL_MODE0		0x070
+#define NORD_DP_QSERDES_COM_PLL_RCTRL_MODE0		0x074
+#define NORD_DP_QSERDES_COM_PLL_CCTRL_MODE0		0x078
+#define NORD_DP_QSERDES_COM_CORECLK_DIV_MODE0		0x07c
+#define NORD_DP_QSERDES_COM_LOCK_CMP1_MODE0		0x080
+#define NORD_DP_QSERDES_COM_LOCK_CMP2_MODE0		0x084
+#define NORD_DP_QSERDES_COM_DEC_START_MODE0		0x088
+#define NORD_DP_QSERDES_COM_DIV_FRAC_START1_MODE0	0x090
+#define NORD_DP_QSERDES_COM_DIV_FRAC_START2_MODE0	0x094
+#define NORD_DP_QSERDES_COM_DIV_FRAC_START3_MODE0	0x098
+#define NORD_DP_QSERDES_COM_INTEGLOOP_GAIN0_MODE0	0x0a0
+#define NORD_DP_QSERDES_COM_INTEGLOOP_GAIN1_MODE0	0x0a4
+#define NORD_DP_QSERDES_COM_VCO_TUNE1_MODE0		0x0a8
+#define NORD_DP_QSERDES_COM_VCO_TUNE2_MODE0		0x0ac
+#define NORD_DP_QSERDES_COM_BG_TIMER			0x0bc
+#define NORD_DP_QSERDES_COM_SSC_EN_CENTER		0x0c0
+#define NORD_DP_QSERDES_COM_SSC_ADJ_PER1		0x0c4
+#define NORD_DP_QSERDES_COM_SSC_PER1			0x0cc
+#define NORD_DP_QSERDES_COM_SSC_PER2			0x0d0
+#define NORD_DP_QSERDES_COM_BIAS_EN_CLKBUFLR_EN	0x0dc
+#define NORD_DP_QSERDES_COM_CLK_ENABLE1			0x0e0
+#define NORD_DP_QSERDES_COM_SYS_CLK_CTRL		0x0e4
+#define NORD_DP_QSERDES_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define NORD_DP_QSERDES_COM_PLL_IVCO			0x0f4
+#define NORD_DP_QSERDES_COM_SYSCLK_EN_SEL		0x110
+#define NORD_DP_QSERDES_COM_RESETSM_CNTRL		0x118
+#define NORD_DP_QSERDES_COM_LOCK_CMP_EN			0x120
+#define NORD_DP_QSERDES_COM_VCO_TUNE_CTRL		0x13c
+#define NORD_DP_QSERDES_COM_VCO_TUNE_MAP		0x140
+#define NORD_DP_QSERDES_COM_CLK_SELECT			0x164
+#define NORD_DP_QSERDES_COM_CORE_CLK_EN			0x170
+#define NORD_DP_QSERDES_COM_CMN_CONFIG_1		0x174
+#define NORD_DP_QSERDES_COM_SVS_MODE_CLK_SEL		0x17c
+#define NORD_DP_QSERDES_COM_CMN_STATUS			0x1d0
+#define NORD_DP_QSERDES_COM_C_READY_STATUS		0x1f8
+
+#endif

-- 
2.34.1

