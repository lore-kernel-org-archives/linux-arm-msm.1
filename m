Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197BC4DB568
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338670; cv=none; b=LC7Dj1iLKVK3F6NgmzWRVMU+C+nGlt5yq+eD8fz5jkURAsz8LCcnXrxB6ef+SDpKTRmPby3lK3w7C6PdAko8MylTaMY8rzImeRMGYfD/Js7Cj9S1vgU4g4PFkqj6CPiprgqk5cW8h8DAckqN33FT9zAxcC2CjStwr3va0YmhpsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338670; c=relaxed/simple;
	bh=6y11BTORF5a5B8XEX+nCUcIHAu2HCGWP0l45g5yBfLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6Q9rCbKR1Y3+qERXpAvshEAx/MznLroCRLkezlw2SxprXOLXrBNdJNkKNqLG+1GN8V1pO9vcBno48XjBhF/twfiA9SAm3KUxBjoEfKO2W7RXOf7ha0kTct43E7pr5MMKv6M0Rezop3EKLnV00l51LYj+tVBiCwJrS12OzcFyYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8dvHU7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEGsDnzq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8dvHU7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEGsDnzq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2nf82410673
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6OdGfuZ95J5zSzuGomqbiR/H94kXzWZ589aWq8ar3o=; b=W8dvHU7U5gyQObnd
	Npk0Q2vBJXiXxWUUfpjBRhQP2pPN4hGS/9w65z8/x/y7bZuow0c0aUk24IYWDkAh
	8RcDrUxWKWhny5Vm5IyVUK6giK8T2pnHmx2yfMlSowjJVwarWn7NekqIh1yATrML
	CxKkLmU2cgFQxbdrUqrcdS03M5QPuVyxPrGI8taxv1iI8a6BPkjNHpa2FBMka8Rq
	NY80J7OI7YJh/Xcyz+IMeKS+eMWt5ss+qkfroa1PjobXdvDY7y2VnFmxs7aN4oj2
	s3RPElrr6qLo+sAEVKiVVDMjGDggUGLxn6rpuw979GTK0BSTE5Ax76q55hQfo/l0
	Bgb/2A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gh0jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:26 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eedabbefcso36681217b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338666; x=1785943466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6OdGfuZ95J5zSzuGomqbiR/H94kXzWZ589aWq8ar3o=;
        b=HEGsDnzqLHvfKr+zWSrR17IE3JhTBMHSgChLmJLPuNy8f7rvMQwbAbxuMhVJTEets/
         jhdl/3Zf2up7XK2jawySU7wFlpG3lLW1YyquUMPGTG5xskVCtzf9cJ5srVncYzcdHLD4
         1SIgdWzZUBJblse1eybdkbhYG2ZdT5y9n9zQvIdPkSeTKGADyOq+6Oljxo4tpHbqO0IF
         v5inaMKsGF4+jxjLGEunlGCsqUDXGRM9sHLgisuUNUXDENY4I9YhnRAx98XjRcmNMRhc
         xpQWSd2iPDDvX9ueJBkd90kW3s0VBxKmb3Xa4+ryVMrEsyEBDwebF3CKHiKWKeSkw0kl
         TLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338666; x=1785943466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6OdGfuZ95J5zSzuGomqbiR/H94kXzWZ589aWq8ar3o=;
        b=NYWvepVGn/Ucc418nlNGdVVpdLisbl1TAp4NYjI+W+8uSKjsdA5/jXak/qbHLBVRe2
         1mHyp5drsjKk7Fl20WuTQAaaU58b9vJJDAdpm+6B1Qo9AI1bEpMWKu+KzE5eSRJJERD4
         ucw1lWBXKf8JlN5i2x3AO5zrdU38hp2eJTqTTqsdkMJPZjOLSqbjIjXcp3a2MQFugCIA
         ZjCPdOXOOo9MXRQ9YYc0xGtOgJMY7OrGf39VBq+inbfTsjSnyCgllX7inQreciuYMRh8
         CnvFHzF800IuJZQYZbvA0uGYIyPxRZePon6cBCJk2Rbqm5pDKKrJXVMLMo8+6VqTTwz3
         j9eg==
X-Gm-Message-State: AOJu0YxnFnbNl+Z51hFjgvEez9Kpe4uQwPcos3mhWA0CRiGG60TJZpfT
	myR1zCoxldfLXNMe7yHqbdz11VU0cVpTkH1nK0YeEzCgztDyO7B9O1PUn/vuf0lIOPZ8v+gBJqt
	NUnuK4IdQu97k7m8nF1NO1bvK4b86PhJklZYgStvHuNKHh84yG53FF3FKvsNllklkQa1v
X-Gm-Gg: AR+sD12nS/maqxp9hdUpdCOpQqpxP7azBwVYJQft/2Mhw36r2ygfx7NBDGY0tbz3LwU
	WhrEYWpZAJbTbzobNrdtDPqPy8+NtqZVFW+AhvG8yBKY66UXkuKg9u6kORu/mqmqw8iRACF8BZt
	sTU+zeXat7xpXG8d+l3wVgGV8CtQkvSoLBZFgfZy6F6i9XBTqtROBdAOsfNYCPRJr9X02nNgEHW
	Z/voMe+834x74WkipBfTttJp4x8FzXEG8Igs/V4dABJ7lKe+/XdgNYhU6mDndmWIQTZw00cX3Pw
	e5VvWt2NVBg5o0pMCimclv6ByhZr9Rn4Cw+MMHMkUyJWwGavWwlJWIVgy5KKBKTMk7sZfBZIyRI
	fHz+HaIqD4ctVKPAKTaTeCxL9vGwOgyVyf/4buhwx88p4mFcKZklXD3S+dbUJdPzCh7rQPA==
X-Received: by 2002:a53:900b:0:b0:660:877f:a5bb with SMTP id 956f58d0204a3-66905818347mr2416983d50.51.1785338666216;
        Wed, 29 Jul 2026 08:24:26 -0700 (PDT)
X-Received: by 2002:a53:900b:0:b0:660:877f:a5bb with SMTP id 956f58d0204a3-66905818347mr2416955d50.51.1785338665531;
        Wed, 29 Jul 2026 08:24:25 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669125fbbecsm2050937d50.12.2026.07.29.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:24:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 20:54:05 +0530
Subject: [PATCH v6 2/2] arm64: dts: qcom: Enable USB controllers on Shikra
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-shikra-usb-v6-dt-v6-2-72ffb4796a08@oss.qualcomm.com>
References: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
In-Reply-To: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785338652; l=3411;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=6y11BTORF5a5B8XEX+nCUcIHAu2HCGWP0l45g5yBfLI=;
 b=xth1vr8iqgdIQQyjNXI8mFjIFzAFZax4+QCwuFkm+6oM9Ty7sXV3DdbT5PZPK+DMWTeLOasUr
 TnkDTlBkmYfAsASUNDvX+SH0Pn5BfMrvZvN+SY2qLfjAgqDObrOY9Gm
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfXzoOXKPPM5PuD
 TBNFEibRaBrN/ORqUJ1N043SKUKJ7vHOb1tpktt63KznFSDD2GJZhg6MTfvDwJLVLY3Rabclk/s
 S7Ly/OEI+OktEiqgMIfjPLWGFX79KPzSIo6RNLrd4OYy8zNhNAvPjD+QGeXc+ynrKwZTm6E6LFf
 VSHqb/+o7mYg2D3aPtI+Vt38zWG0ywgGBtw5vd+l/p/Xq/aILd15W9c2nbokG6M9e6GkwtBuKWU
 mtjWrNsBXvxwS37KXBWS4EO3DVNcT+jBNLHoP+joLIkw9hVV90rNJ+sBg925vdv1ZQuB7hOu2/p
 0v8X4963c5G+sMBhuzKVMfuWzswUIlSUbQTrLoi2KBA2Izc3vI3AozXrOUajqs4TFuVZBrPQzi2
 n79soKbqHTUF69uNLp6iAFdPp/p/aXvR0UE+ZzN3oXl5HcWyRs9HKHiRsi/q9X9PhGAEboLB9OA
 G1/49cRmKQ96y/fB6vA==
X-Proofpoint-ORIG-GUID: nTQMb8WaVWf1LYp9VBOAYp1OAmdHzMXT
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a6a1b2a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FkkohYrtMfa57bRYlNMA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: nTQMb8WaVWf1LYp9VBOAYp1OAmdHzMXT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX4cyyHyTBIGCq
 fOwPOxfmJrV1H/UJkrWlD0W5nQqwtM56kAmbtPovmepkaLZrOvWAHq7X7TX66U1QoSgg7i8R96d
 tjTJm4MobQV6f4fY8whx6YoHxsrqTIA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124

On Shikra CQS/CQM  platforms, usb-role-switch is handled by PM4125 on
primary Type-C port and Cypress PD controller CYPD6129 on second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress PD
controller CYPD6129 on both Type-C ports.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 23 +++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..225f36005794 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e4908d6516ab 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..8ad0819c9520 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -12,3 +12,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..631827af0f2a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

