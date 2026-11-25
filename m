Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577144;
	b=CD2QGijCBobwxUvGwodsB1IJPCQ2++h0iC6i5/gLg91Hen4MFJOB0CGUM5O0lhM11i3q
	 9F5b8x+B1OPPRFVydtqXXbvJjHDTMo0o+hwOh+t4hXRW0kH2g3wrTCVuW0yBTU1gUQOkm
	 nLPQv0Tgp6qMODTutmujGlKBkO+UzGG29ibqDcpJQsS2YgwdQFGwSzZ4Dhmbanl9zOdDE
	 cXMUc/E1NvO8/rWNSCIdabj8wq7kQHEkPuiMI7nOOiqS9YdDhbnbbsc39bnoql19UjX6B
	 F8ax7tRmaLazigDk+dVj3+R7CE9p59u2D0N7tfAqiEE29DQw2xIQJYQt8PA5/z0EYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
	b=l6c9XuuWQFIHRfNTvzePG5sY6P4JjvWhKLfEr1IdHMaWXmkqFQ8kUDlctCNOXZn8M8LV
	 xhdzOrxb4ocN2eKlhDobI+k+NSKNMjp5U6HQtqwNALxqkEAvQb+ezp6SLMyIbo+LStKM9
	 4wT6apsw6MNMI9z3zV/Gut+QXCYvsuQCmHsvfj+ah8tY9PZpp50f4OSsCaYc7yHQbzkWi
	 l2Fl2eICo2JWaRs0q0Y95CUcdMaE6YumIP+ybNYmNFlEQJ5trrCdUfulZnVeIdZm+DwLb
	 lIgE5IYjYPh7c+cRwizB/hkuJvbzK/jmCEADK7znXQ7xfQuysF8dcKmY1RoGmWzDlIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8le7JiH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epJPL5gj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEDD606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAEDD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8le7JiH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epJPL5gj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B61c2625895
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=; b=W8le7JiHltt8AMUK
	JegkdsWsJOUp9KWHiz9j87oiyV1gLWetiEM//EXrpQAfJdZ7MO6du4MlnaPkZDu6
	DKw7M8LmhW0ekovdNyHyBYx6IBojggPx9QF1msyC6ncFcA21evjwg/kNAz+2zdBD
	aevGyBvH5rIMuCU7WXwY63b9Gckxc0+JP3ugNmwP8oVswY+m/oc/rmb+WvmjKuFz
	gn8OhSt98H5u3hvzadFtvjK7zM09vHK96qu77JYQ2xhQVf8wegumXydWtGM2CIrp
	9ieo2IXPYeJtPn9JzHKdqpwDcyVUtXrjK/uuLG27ECbb40S4h3rzrc2PpYoPhwDj
	gcnsxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc28nvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so4754539b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577142; x=1796181942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
        b=epJPL5gjM+Pe8hbvqMcNiqgU71he4oqeMgGYImraCdxmt2SUtSB330MZQ9bKY6P6Qo
         uRV7OpZAyXguLTfk6uZ6hRhg1p58N3UsadxCxPRnBNRu5d+39S+LdLbaJ0tIyXN42PCF
         AYSpeS+pQhTEjNE/UfmbXVC5+QtGZAS7jzmet59TKw3RjyqZ+m36lYnSPD+t78asEPDI
         9HwQ+lInTERqNTh/hUutwnXvbV01HMznGrH1qvZUH6qtoCxiouQusyQj8UKV9B11MSji
         Eu8u3OawwwHt2GdjsvG4yyJCQet9mcj4Vx9DxdM0sHI0dzgclz2304UWCCYFXncN1+AR
         Qcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577142; x=1796181942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
        b=BTDlU3HJA4ZqmjdSrcVwFT1BM8DdW4oUy6u4N+Qo7vEzI5S0OH8Mp+JnGGuY33IU7H
         BR02uBRBIN1SL1HSZ5XOL3LPfMVi3qn4amnrd5pG+VfL1wHt7Dmpb3nyxIyQuh006ecU
         PD75tkfQ+aj0I7KEw35XGZXslGZW1IvkVNPEhVu0zpKniothrr/I4Ae74mbOU3PX1jHy
         ied6TM+UOHXVfyb6kLqBIE2gbQaKrfekOOBnirTE4byzSH+1RpcdJ/B9frO5S7ePRzZo
         Lug3YTjAcPJZd0LDl3FFKempqMAktcAfs1Yqcg/Wiq50ikyZtiWOFYpbp/cERpTyM5IM
         kFvA==
X-Forwarded-Encrypted: i=1; AL+hErGx7Lm4mVi5O1audvihGgPyKiswmJCmKuvLpihO8wYdJQtcEpY32ljaacVaK9bfYoFPycrBF8ZXjesrLogQ@vger.kernel.org
X-Gm-Message-State: APuU4Z96ASS4RM/Ao86Au5iqFxa+mKCSrlY3KgvfKjLz6gtkW9E7A5Gu
	kXB9TkwfqzLjzWyIZmuTSASNuGhpjq2qP+Bo5EDo/muxh+pmlAcOZvUIOq9Fz71WTpd6lMAwRmS
	B68cCw7OXJQRe2mLdeJocryNU0gqDoRcnu6sJyKaRHC5O6xhyWAmH0rs0WV8K/xTrBpNk1JsI08
	St
X-Gm-Gg: AZFdTZdVQm18yOSdSOi+h2wHupZKkiuNAX96fMWmXmPqwCeeL3hIDLsdZtcBNUdTbXb
	D1cweQ2IzJwI/tSO0+NgfRrAJlqrD8V/F344RFgSUyc6eBQBlLW1RxawXySC5zFdrEeHrQ2aIUu
	ujUh6stkWVPkRSwZZpNnSD+IUuKlkqwg+lVBeCYa0a3qxhulln5eRIRDwky5ntL7HHJMkljDsJ5
	G07I0vWqMYNNmi6htfXud5QVLhv0yJoPkylAWLpz3yxXpeXIDqEPTNN7EQwVNv0VFYafRDPzsvd
	d1pZ6uxlB8yX6wPWQRupPgZ37McuZ9kitJqfldBnz505pk4wYsRR6jDBNLGZPQYzVr/yHIaUTLl
	GxbyxZMOzUoA3j94hfJQVbrX5PAkWU8TEOrhKY8a0xQ+yX2NYtrO0UpmAdQHIqI+qSdiU3IrTrd
	27Hk0Xkjk=
X-Received: by 2002:a05:6a00:1748:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8c87b4efacdmr16716542b3a.10.1795577141861;
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1748:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8c87b4efacdmr16716518b3a.10.1795577141435;
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:15 +0530
Subject: [PATCH v12 8/9] arm64: dts: qcom: glymur: Add iris video node
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
Message-Id: <20261125-glymur-v12-8-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=4448;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=MebE4ri6RP0U9cmAhNt6gjsjcHyTYxkK1wQgrGzXkyU=;
 b=+7RFuJjpDffUB0PDvKDLPhKmonL0WHF1M0PNM6U6o2hyKv2laLXgH+EvdNfGBxdBc17n1Ukp4
 hvRhIxxpD5HDvv2Zj7Yip30TnCAAb4JNlmbgMCnXeFAyX3HUfYCslnT
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b065536 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XTetivXjGLQkQF9siiMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ChMA8R6OeAggHkv16gh7X1lCVju_pwmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX2YOoFExBnRyR
 edukopAp6EtBmULCUsvU6DdIWBUEqf9F8iPF9+VrRNNMGgImVeSuAdggnFBUdFoIarJU5V6T5Cr
 /2Q8ZleOjoCt2RXmhEvulWD99iWRB7DEjrHbk+ZCDhdHRaOgWhlZ3Oq2a+PL8QKz+ZkZ/M9yXs1
 fc8eWTKRazM0YzOe3weO55R+7MJkhhvTD8BeoLNhaJPAjp+BF/ckpwoNCC5VNESu5467FomS5c5
 cECAzsO63yKB1SvmhGOmhezAhBWLRgZT76AqWbM7TmfxrQAXNOkl+hod9Pgw8+FsVWWHfsxcc/Q
 Iph9NcekqVNIG2+ogldNANtY5fEbf0iwt2gkvxX/NdDFpdTl2mA9MbeyY/WmHuUGigOQZrUPvfp
 rWIPPVX3kzUXKd57n8fYDCj1QLNFkTBD9pqlrr1mkjLljxwPh1csrt8w6xM5kIYnEDT+rFHfHpQ
 yw+Rn67ETvolD2KNJxQ==
X-Proofpoint-ORIG-GUID: ChMA8R6OeAggHkv16gh7X1lCVju_pwmw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX6O0sx5qO9k5t
 q3rC0dt7l5UOhX0aPI24gx3MSvQv1JBZy0JQdSp3fBE91czhmDO98moWqRpHSLv1UClcAC/9B8H
 k/Uz0FNEZEcev/RYuX/rlQC/VjRsPBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250013

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..ab2b499c1049 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5926,6 +5926,126 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				iommu-ranges = <0x25800000 0xda600000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

