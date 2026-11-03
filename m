Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743836;
	b=Jf+4p6ezJlWpxXPq15Lb+msUAWGG6o68pTayqGuNnOss+XNAILKK1DaE3fUjTHLXrxFs
	 7ezMcIigM2pIFD9tdwa6LpDt8Jr+TfL5CwBygfTyhrXCQ6X/H5ARrHphXpA62R6QU/txj
	 DftoLRSuk2qt0Yyoamgyk4GpZ9lB/ozXWZmGRqNIYftjIelWd83mG6Otb7S4RsqTSGCrp
	 vwGlI6h+vAFsrC4iOjl6rgTaKWbsO5qXmjMytYAZeyPFqKVO1cf97t5v2CAQs45haIbHv
	 kjOsWXJFWxpX5vGzFqB63O/E287Mf2xm4IK7KfbbtVLTQVbHch2zlngnK/Odbhmm3MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
	b=yrQmO64uwR+ulHl4LAvXagqx6vjMU5UwkTgKNf5DU+t/Guk9dUFrJ9j7S7J1Dy9Twqrl
	 uxM+qBLQ/yZ4GQvD41iQYE7avbqi/0GNStCuHvhRXquIXTyoD8jYDgu0VpX5Hj1koxL2b
	 RG+9YOcRy2BRF7TZjR5N3iwNzcoN3G8YR8uA5GY5zJODwSnCWM5uBSGngOtDYJ7gzylwq
	 Pb6fy/UtYh/gik/7U4o7afSV4xWaITlsS008MzwdisukrvAGCeuz9aAeB32Fhmw1MELDg
	 ReqXB/1M2CUcLgKhGn69lPXPgaK9MHFqfUMGuOVBibJlfXPznV7BgquzaM9Gm6uL23A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FQaOW+56;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qcs7M+Zu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7ED606A331
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 22:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7ED606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FQaOW+56;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qcs7M+Zu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL3ha3678033
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 22:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bq9q8ndWYXW
	dbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=; b=FQaOW+563c4HsUkcfSoXlxl935i
	pmRLBcxWVsalSW7ggAyR//Xn1rfCBEs4bGK19uJzclpfjm3/FSmmTbN0Z9Oa8WHo
	IhZ7JcGjdKOhH1xjnmwofY65Yc8yE6bqM3sIpnS2YVa6ts9FGWLfZTEiOTED2/9Y
	27NEEWtKabSa2N6KcOS8s6YxjHsbpMVjeFoxfNmIBZAISpd2Fxskc1S2zQECUtO2
	3YQoMpTZkZMaYU14/ylp4Uu2wgtkr3kDppy7XfmiU2QMXLNQFqpCv4tJ8MMBqdYp
	3+VOaH0Z/5kPFw05UQL8qvLatsXe5Daj07zTQ2JAr7kJydKCFMI9RgTWgtg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bj19q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 22:10:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so381678c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743833; x=1794348633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
        b=Qcs7M+Zu/72tNDc8G4X6wTnmMVxleGFbW+v3LGeJhhFDtIi8Bz8OMlK5j0O1wG8P+Q
         pXQQrAD5g/6LqMFpHcEgZmqXDE/TxJsnfFYlEIlI6XuNNpDY0OGgAOh/vLQz+QGbsSXr
         RjKTgmlt02XoZetPolivlM/45DkgD+WSwxxW0F0cv4qivmVSob/toMR5gSzkRk81kjKj
         UVO84Tn9a2wKMzR1VYKhk31D9q/LGw3pLzs+YYrMEOJRBigdGCfJc0VKGG2cDNSDA6ZI
         v12R/v4lQBXOvh1jbfFPCrFL11WaxfEpjrxhX8+wyU2h6tGe3RgfZtEKNZBJmzVhbISn
         pSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743833; x=1794348633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
        b=WoOnJhBRBxf4L4Qm/eapw7vsKNLvkkftWJRpjkjZaAo+H8+7ORhWNMYvNgiXxU2cNo
         2kLDqAiBrZN7tsXBDVVM2BxBKPNmhXdB+Jrrc8yrsNHXeDRbCPeQACzUUHcNpMMhlypL
         jbF6By5Pw91G8fegW2WUKKxoRIBQOEfjtBkkPFx2ZMIiY9BL/zKlK3u5vDbE4AVsvqA4
         diWghOt8ZJ2Wem9fo5PI9veMGBKp8luxLwOpXPjaYdFtr7gfY//DJgmOMxvVlGjZmZ7R
         EKcjHFrKF8R7Aiy+KagIWeON46K6QJ8oW60HhtmHah0Wbh9aUIH9JDQ5X7SWQM2jQEMA
         Ds8w==
X-Forwarded-Encrypted: i=1; AKwUvByQelzT/1E6iYBEnyanPK8W+ZHBEz7kYTNvK3N5PtHQGZ1f28LJ89sRTsEI2K0wHYb2lj59IBKo+UEiEueK@vger.kernel.org
X-Gm-Message-State: APuU4Z/3gJnMp5HqIKnayllShCJBvTA1HIqH4Cpud4C/Bv/3hMHGoTHe
	FIj7FFlgzMkSg3dmG+QHMbXjnjjduBBSJuwRXrFgsIJb9N+2EUCRL3/45iD97XYEWPLogOqOsoh
	Rkl8eUjAodlJU5ARFgzH1nKJf2y52Cvrxq/i+3QPwqygQ5xFcX6y+wft3V9PXwDRgeJS0
X-Gm-Gg: AYBFou1nGlGHl/vpm+9hLp3fLM/gXgNjctcMPz+Y8lLinyS74T0skjDXrd8LsMEhq1w
	SFs1zBUvKsTwwkR+UqVzSiiXsuxFREUGsLN2N3PcplhI86s5rYzVHX8ZVWcE31RtKbgjv7MxO4v
	Vr8mNUKm06TybsjsI8BFSaYrfWoG9VL8Jv92bRo+cjheIaYcRX5R8wQaCUJXvj0JpHChskRQRHS
	Vo6jtdd4hPnuEb639nxp5caGRcd72zc1PJ22z38rJIiW6Vf9PCyJ9EOCa4eImd/8W+H0flyoxxk
	Nnk4rBFjzpC2Nor87SkkpRW3VOcOY4kwhGZnkUZMK6UhzN1qjjAV+iSzkm40+fCzr9ZwdPRDfBm
	5OkfekgPL/LORl+rUaoC6zH6wZz6vj5poXUwVz4BwEi0lm/QPkR7KRQuMz+sgLn8GdbjoXRM9jq
	JzS7ux1nfNXvwax5W4Pxufktlv1/KP
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr21042071c88.10.1793743833063;
        Tue, 03 Nov 2026 14:10:33 -0800 (PST)
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr21042036c88.10.1793743832370;
        Tue, 03 Nov 2026 14:10:32 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:26 -0800
Message-Id: <20261103221026.3662383-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfXwPINjMn4PMZy
 MAO7amDs6561ByYZVMl58wVgBIXaXNTfIAnVvKb5t0dRtkxNcP1cpyAPAgiSuTJE1mYWwJUdW/s
 x1jMPyReEIc+5UPg6GtrjA1Y7ItXhE4=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea5bda cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: yDEoiiD5rF79M0sRsLJCX4wAsb5WlRI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX4PEH4OAaFo8x
 w+hcXlCJQ16OMjHXJ2tekMtQvACLPI0uKv7/QKgxZY/sirGbqIJmsFAYec9Gl6CvmQMPySfkWe7
 c7Uc5I7aozJhI4e74a3cSSmH5Y6ZkkYoULVhmAOSyp1/R2l0QLUekXQoCtnDASLS/u2lhMDD2do
 RkpRMVBznfSY5H7oCs149bj0nDNqdd13yTMFAHLFK3o0/baQDb7wvmvTAPJ333UUDl9S9tOLR5Z
 j/zOyYsii1p5I+3v0DFpor206nGq/Qr8bTh6Fb/Na4rYtwK1K1G6M5NKrFgh8sVOWkVUmdjcxM+
 aFQ0wuG6nKt/JH4+ku8YET8sCXCEjZ2qiR/hzESGSmvX6gM1ZYdza+J9tdFwwF2X1GU1kxcT6Xb
 3I1TyHtcQzhgm66grfZ126e3fiEZ7tTyxd09VCo06W+XkJn6u9P8243YImqH7nj7BjjTZPHVn9E
 EUNpcNzV60CkLpYAY2g==
X-Proofpoint-GUID: yDEoiiD5rF79M0sRsLJCX4wAsb5WlRI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..3f3a41cfaa00 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,178 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace0000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ace2000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@ace4000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@ace6000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy4: phy@ace8000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace8000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

