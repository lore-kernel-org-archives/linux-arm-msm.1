Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995947;
	b=YmbVQxOsRXDyssD/S15B6nO2/kD8s+pZx4DShTVSbQKigzVbL8mwmY4e9xiHqCATJDAA
	 m+tjyunvcc8vblyIC0V4jwaerP02rCpoACXnScPCdtSD1UwXJRgF7R7h2q/1AFC0JOeSt
	 lDUUqtM00L8YiQI4c/hGsr+OGP/R9hsLXxlgK6IIQj1hVQeVWmjwDH6SGdGtEQaU4esFw
	 oxuaLZ1W9DAUQ6PSN6TXKFMg7OdZfbSc6mI7KX/KXyX6K+HFYOS84GdakIjd6YgE9D6j1
	 cL5GoogcMNl6fIE6lvAyOE4Ghdjvlx5a7w7gGdZESmZAIcRhrN0pFUfRzcxUNYk5Cdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
	b=DqBgMwh8sZ9auKVvVV4CuQ+2Lhdu5jwFXyRwgblAmSp2/A3qH5oYCG33v0+Hgdbic1Ad
	 aHHWTpW0l44u6+meQZ8aRJuRv+WulM/BJ0+Cp7yJUo7KR3opdPeZOLKaAiqCPGFxxJk7o
	 TIol3CtWuiHoPiCfluf1/u035sLMJKZ67qalNR0vy4xxWn8f3Ckf2jS9sN2LxkRGPyPqW
	 kunHXV2dTio0TdS8Sbl6zCzLDVFcNtR1qLMLDFYPeKJjhwWbzFd1FFTUe2Koq85fNpkHP
	 zNLh52/kmNmrlIRb6Mg3M2sabStZyPyArEV1DbGPuBLOMX4rNi4JzqgvT1QqvDG63Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AF2QO09t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QODEv9JY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA98606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA98606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AF2QO09t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QODEv9JY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aS4A1708628
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=; b=AF2QO09tuvUM3jqZ
	pSCUqmKrO4lnRGeBAuqNE4HoMghuuf9ANxMv2q8JOwcryBTLC9Rdf8xBqaJnQuD2
	GxzGJdBANbr4UO/monIXFFvfVL5AHC24jI1aFWk3VW46rDw58JNfR0rcj+EPlXRN
	eX+D/VAva651BTctxF+S3TAoiKqqevZaHryYBOLUUf2PMNqNVG2/MT9wGVifnsu5
	bAsE/AWM9z4BFjOP+UMzwbjTUK1qAIsVCcAkxym3FK2GwsDnT9h5QPpfgYR9vkK4
	YTl0r4uPspz5zb/WFIrbwBjxUNx2BBnbNRoQv9anEe7IewLpX16fg4kor6aj+mVp
	VEMIMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd94gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93e2f72bfso43371385ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995946; x=1793600746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
        b=QODEv9JY4TwGQsU1lqAN+2oer1EuPUiLIimkGBCdF9aK5BQhhR1QPkrCIejNemF80I
         RrVHu+7VAfI6DPHccIkc9gyQ8ED0qkophI5Z+r5bKfXvCzH4bJsfqm2TyamxLJ91Az8t
         hGcjT40Eth2R2InuRIgobIFOqri/Z93GrXva4VVqSKZuY1xEDWduRjlJIv+GXCKvRwXb
         VSHZV43olkf3+hnHk7VWE7xNRFiVxStdLkfoblkbGuCdqq4waJiJcLo9cHktifQHTsm1
         oekKZUL11mc8+WQslavq1vEiExAPdEhVpL0FD4/Ee4KNYNPLlOlaawo3bxi6XbYF9Ow5
         2M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995946; x=1793600746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
        b=SXTwPMRCe1mqa8m+7tJ0KY48RaDLOhxUpEPM9mMNFnCn9m86UM5llmSKK13+wJ4CKc
         0+hkuMXPiiD0PtHXqkHi+fLCnP2ZcE5O10gMVq0csKwQp0hJpCOp6EWELtLlhLUNdbz1
         oTyzuYI1+A2dUGC/kLSmntoeVo+92UKtFoWjWIgwKbxzkyQx56yWg73CcYsIJsD5n/LK
         ImQE3rf3pJgLuD7Id7ijaERioybWx6L2L6Pq+TTurKndejN7dZ7j/lSbLxCx6CyQnUeY
         fQj46e6fLXYUGjllerzYWtB9OCwEa/hAdCJGjDX+Fv6Bsq8m8QKmLg54rvrJ5koFB1Mh
         JmgA==
X-Forwarded-Encrypted: i=1; AKwUvBwlVgy/y/Ch7IsOMDO4q5s8hFKMUwQRtsb/7QTszmTr+IILW8BTXWjr0nZWhHhF0v/5180vzUr2d6SmNYU6@vger.kernel.org
X-Gm-Message-State: AFq9FYK2QAw0Ovb6UJxjDYfqbN9qy91+BRV4F5t3/d7/9FoCM6eI3qtF
	LUMezRH3vUlP5chGQtBWryLeXj8zDRATHoxLZQcTBCEmXiNbGPs7R1ohfUP0Q5kGGkZlVfIjt48
	dwF7AMXI1TJUyM7r1BnKQVONhnxcK/ufCMS6H9f9akfQD6l5d2BmYqc7HKXIqhOG2vdno
X-Gm-Gg: AYBFou1V9POpnC27VBkpijnwjAlsnlIN4ZbrfYcB9/NtUsPghiqvS2wFwAbZxTcNBuE
	XIWHfEbIf3XzBoOrpF6Je3QZWwyrbxKAMdlfkUR3d55BT9vQTJB6WrtIv5iuCNVbAbQHPtlslMs
	cBUQNbVaAecArxwLPfT1JdO+iqJdtGWH17+1C/G/HDJ6EAmMp83tuQ3Jqq0ul0/5VQ2pQztMrBy
	t4Tuml7JkdJwRobsUSyg7zhV0G0AISLIeYWT6PG3nwCbTiFh1tNCAf0FBIWwqR21QEa4kSvSUpU
	sqwPrh6cqR5s/cmzNhdtIeGwkNfFgC+1781gJqvd+zl/qorVyx2Gzrz36YtWh8SVsOEeVA5B0eL
	SuyXqMBbBhcH/CsTYXEQMbalSeF4EVTlMVg==
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr48839055ad.17.1792995945651;
        Sun, 25 Oct 2026 23:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr48838845ad.17.1792995945230;
        Sun, 25 Oct 2026 23:25:45 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:44 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:33 +0530
Subject: [PATCH v2 23/23] arm64: dts: qcom: hawi: Add DCP support
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=5616;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=JWax6SHxXqnSdz0sR52ZG2fr/5xHogt+xoHHZShHbR4=;
 b=3phvyPAWLpPk42PFcsZstSJQNZG3MKuNnHg2gCbX6SuTSkcshSlrsuGkDS29WnsFK2MrUgree
 GAjJ2fJdmXzC8b2UQG8TZFR1oKZzbT3VTflheMwfWxfPdFCg0+kVtOU
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: 7ulHBho-q386HfJHcGOzlqPCUDyMJMLb
X-Proofpoint-GUID: 7ulHBho-q386HfJHcGOzlqPCUDyMJMLb
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adef26a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cp69EZODLtjo7xmYzNYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7R0dhgWMoJG+
 1NDfE0wbKaIQOBEYZWccJVqHYcqu7dEGXFtloXJ2aVovZb6cHTFr3ElPllIQCEy1qNZu76fDHAD
 pEw64Lv9QOvWU+0bRtuslOg4jILP6Y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXzGeU9/STNZwg
 hsAa6l4h+/LdLyKdvvzO56gHJEnP2LUAQycbhe09KlChsPNbmcQmOy8xDBQR/ybSFv+kk8/7DOV
 62+2FICHoJcbbMfGYMiScpm5x0AGwU3YauquGj6QsCzSLlsZIn0qpjgzYryJw1BZbXAygTAVRNr
 W6zGGBId9MpYAuonLNCF+NyAepUlzbEmYVc/Hxq1Rq5fzJzkpHc38ow75yIxfqV37tqRCYFO06H
 H0zwSNsb2cvj5/IreuWKipqeQcHhYN8p7ZB+E80dOTjXQdcjc+VEeAebfcuBFil90oA4N5XEqBE
 6Pk8iUpGKbbaM+5/za6tZYVZlu+59kEYp90aFXyJFla0eTWevwhUR28SKEUbHKkuNo1AJE4hRX+
 KJ4jTLeRkC3a+OK0Oa4CXp9ciz6Hl82QYtaoNQiLHfWjxg0sqjcx5Z5/Kohof4n7xg0GP38s8BA
 dtWFWgCbRj4vNpl4pOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Hawi display hardware is owned by DCP firmware, so the platform device tree
must describe the Qualcomm transport wrapper, firmware display subsystem,
power-notify channel, IOMMU contexts, and display graph used by the MSM DRM
driver.

Describe the Qualcomm DCP transport and its VirtIO-MMIO child,
the IPCC power-notify channel, IOMMU assignments, firmware-visible IOVA
range, and DSI display endpoints on Hawi. Enable the DCP display device on
the Hawi MTP platform.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 129 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hawi.dtsi    |  40 +++++++++++
 2 files changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2c..a27003f69d02 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -34,6 +34,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	display_panel_vdd: regulator-display-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "display-panel-vdd";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		pinctrl-0 = <&sde_disp0_vdd_active>;
+		pinctrl-names = "default";
+	};
+
 	clocks {
 		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			compatible = "fixed-factor-clock";
@@ -142,6 +154,7 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
 };
 
 &apps_rsc {
@@ -995,3 +1008,119 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&display_panel_vdd>;
+
+		reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_dcp_in: endpoint {
+				remote-endpoint = <&dcp_intf0_out>;
+			};
+		};
+	};
+};
+
+&dcp_intf0_out {
+	remote-endpoint = <&panel_dcp_in>;
+};
+
+&pmd8028_e1_gpios {
+	sde_disp0_vdd_active: sde_disp0_vdd_active {
+		pins = "gpio2";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pmh0110_d_e0_gpios {
+	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&pmh0110_f_e0_gpios {
+	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&tlmm {
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio211";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio211";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..836970cdef71 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -6841,4 +6841,44 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc 13 5>;
+		mbox-names = "dcp-power-tx";
+
+		dcp-subsystem {
+			compatible = "virtio,device34";
+
+			iommus = <&apps_smmu 0x400 0x2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dcp_intf0_out: endpoint {
+
+					};
+				};
+
+			};
+
+			dcp_dsi0: dsi@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
 };

-- 
2.43.0

