Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637884FB9AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648000; cv=none; b=CT1aNuh6LG0jA1ACCxL0k2cJbFD/i+GI+t51EbZOwMQATRpuYLNc8RO8X834NnwYid+vFsSyal0QOtfHOeNzn9w288t0DoDPWsY48PRvyqFZhHx0L8K6U0Ul2nKp+f2hnpRGMrTtWt+hsoeM+t82OuUNN06mK6USOGNCKyCT3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648000; c=relaxed/simple;
	bh=BDfZNWn21RsaR8CLDHvy+s8rrq8AnPzstz77U1DTezI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMuRF9vXULxxlbYGM/8IX8V7ZxPinb+MR5Er2C2bwGFuHYKwlnfw12BgX6/xYelS0ttkelNfw6Nsjny1ZeQcQB6j4Ptehe3tE5pL9hZuUl6VBl9dGIbWqDMhrX2qNbEhtp6nhrg8mHIRHm60vfWbhRlPeNb0F6Ua68R58PFZJ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/b1vnFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P33tmDuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/b1vnFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P33tmDuw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZqvJ1863438
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxCO8smCol/Q0Jb/EO23Uo1rQMuZvg6TPjflB7c7cxs=; b=j/b1vnFltO3ecGk6
	8eaKhJBIBUD9AP6Zvcaw1oJKwO4MPutuO8ALp4fO0tcQZymumwFmF2nOPImXo1ZO
	VIizA3z3ckaI1ec7AZFPSBlrciYgTRwR/+czK+osu+wfOT93Wj1tEWErPkR+dOYd
	d+Mc6OyASHOqarhfGI41a1IBIelvxu2IzEpvFqYguhKAgJqDTVWWYdQXM8vkoc9O
	CF5yZ1Pa59ckFCeHQ22rEv9DL7iG+rTOlRVfQ0hW7NLML1ocY4MzH7sexVkzRjvo
	pzErhpYFq/DJ111FcAyNBPt4IpNgI8II0bxYqdTmWfvJm2dgW4WJvUndFCJj/WD8
	yf6R/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av68v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1073747a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647979; x=1790252779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxCO8smCol/Q0Jb/EO23Uo1rQMuZvg6TPjflB7c7cxs=;
        b=P33tmDuwcng0qocL0UOIHJcP5KlSinQzMDZOtpjvI2M2eJkJ21kc7ePIXsamWj7R75
         Qi6ftqduG4SE/2kzEgH2+rfYuBTD4bg3aumsELJomY7j+fjAuglRQTigs4KqOA3rzh1o
         rSXfS4hzuG7tfhWnhHVfCI1FwYVKpdS8LQyXqSfotFOU4i3utG3eX2IN/ORrnlYoFHoq
         Z5PMoB6S5x3QSuLrw6poZv6E3xdNoDqrvy8ux9GDXexqHWbXQVGIpccWrgPpHrNSLT8E
         0SV2WGx/nFtPd7YLpkkZaxDw+B7hUKb7IViYuTZw33jRmQ40AVrxmbpV+2JF9ebeta0W
         u2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647979; x=1790252779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxCO8smCol/Q0Jb/EO23Uo1rQMuZvg6TPjflB7c7cxs=;
        b=gRClIZlzke6vPQ3M24QUzwiuhsgQfyM4xO6iBA6wdMoQIoGMO329AqKHoQvP911lXe
         NlIUU/AhleaGP0Fo7zKcfkSfpKDPHBwYdyIM4LRSWAQGRjo/hiC9fMfTUJFrlMUMAr7p
         JvUu6auJ2V6QN+ZblsG0lV3H4NGQk1843CcN+/1wQXCIJkAUFVR5rcJZgaCTXPU/qdnx
         FdZlp7SR4atYX10f9a62/qYZGwNU4BkH3NV4MjoXFsuinTbsAOJ7O+tsdI2U5xXwrVwk
         rXfRytKtBTMFCYc2X90Lg+PkiA7w0M9V9rzQHUy1hmGaCjqWxfKeUR3V9HVXofgQeRSC
         mRHw==
X-Gm-Message-State: AFuF++nbvvQREidAYFtR2rBN3s65utxSjR/fwn61zZ47VB9uCcdfE4X5
	YrblXiXqo2bT9kIfgvU3Gr1lvGmZABRLC4hrEOmzGB5LRJNqJCJ8n7Bjj348xC9VSEhHWyl8+60
	j7BqR5TeSLij+yE9p0zdS0Wwhy4Wpw9JmfrbGEgOMrlk7Yz2wHmJOeZ9m0pfrRTOLkYaS
X-Gm-Gg: AYBFou2+FK/LZLi6Ud9bJixYXuzLMjs9NwuVxRw+hZ9VM4ZBD9DDt44Bqz7T2r1lPbY
	UxM778kPQgLGo7KsvATgQNpY0dQdaVrFohh/6QLnHTlSBLz1LtNIWDrltxhp1GerP5YHQjaDm7Z
	idW4K2FlgXUcIe1QdVDMcg6QCHaH84M6HhrLTTtsHbqSERqGuhQo+qTcm0kkffrTe6Xyks8EAIp
	D9y8K3/t9cZVn7Hka3gzZIbWuBWT5y1m9vqfbcU/ng5tzFZAKwv/BQbR26uAtpyzmrewTzvN80o
	Ffgf2FMI4jlCeYPz5kKQKItdGV5tJAwbeLVRcaLq5ZGOiCq7ZWRxdpH5GtWwr2y2IvJHKUa7aWm
	j2N7sG5DocxnCtmIfyaIzSMmngonAyyefzvc=
X-Received: by 2002:a17:90b:35c6:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e4c7f91a4mr170299a91.28.1789647979147;
        Thu, 17 Sep 2026 05:26:19 -0700 (PDT)
X-Received: by 2002:a17:90b:35c6:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e4c7f91a4mr170211a91.28.1789647978271;
        Thu, 17 Sep 2026 05:26:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:26 +0530
Subject: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=6310;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=BDfZNWn21RsaR8CLDHvy+s8rrq8AnPzstz77U1DTezI=;
 b=kB+HuqMtlUL9rD2XasWA7woTz2j9mmHFE5SHdlm7nCY3OZSN5drKrPAgWb/bpOtGbAuH2UxlI
 537PFWhdYJDDJg57pohwAZCK+AQQvpM0eG8yI4XRGgyNB+coyLF7gb9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: igpPyUx2z9cVeSf03ZyLUbHj4sp-Dfda
X-Proofpoint-ORIG-GUID: igpPyUx2z9cVeSf03ZyLUbHj4sp-Dfda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX/110Yefx6Vem
 l7HDpSQgL6NYIdFWpZax88p2v/0wjPdD48spHwoz2lP0xhQNJaQmulCipbEKchUZmy6yWKLNgqA
 5J+Mx8suoZswiwS7KvGlFhVRvvu4Qs4kjlkLILq7525GMOHIL8uJZ35OL+rw6NswQYQUT2v8nrh
 ohNVdjodZTf6s/OfWfS5YEKffgxw8uQllxY9HPDg+HUIH+AE3oAewWsyu42DG9Q+Gbf4Ma8yp24
 Hgh1XMHpmS0f1r579O8ypd1SRo7ODxVUPtKh2SRO0cMPZR1zKtZlYkFek2FPYm9tdH6XGiDJ7Cy
 wnuGDDMuwWdOa14Jl5NNLIsxUqTgNu+n/ih+FP00ralrwxrGlo27gvtYG3yuOc7djxUUWPXZCnh
 jZj4hBXtfQcrDEwlACYTOGpbm2Y64aGnlqdoOLQsi/+g8hyIiWOUit+vJrg5B6BDCTgXEOPIlR6
 c+5sbhQ5J+k+UzwGetg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX1bi+G8WDaJp3
 7xyDBEPT8yko7gJ1aA9WjKZ+hrrhDzKc+OUq0pjzhbZHajlnBs2Wpk6yKIrei/V9BmE1IqJn5mA
 UFJAIQOJIcb64e6zm8dO4ry7bHczOA8=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabdc6c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=i5f7Ji4RTl7zrp8u-5cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and pcie1_port0, allowing board-level
overrides. Move perst-gpios/wake-gpios from the controller overrides
to the respective port nodes in the board files, renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 11 +++++------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
 5 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 668c183bc177..022facada1b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,9 +1074,6 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1084,6 +1081,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1108,9 +1108,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1118,6 +1115,8 @@ &pcie1 {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
 	usb-controller@0 {
 		compatible = "pci1912,0014";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index b73ad7861eb4..172f5edab30f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,9 +1027,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1037,6 +1034,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1061,9 +1061,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1078,6 +1075,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 1332c864801f..f3ed42f81b0b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,9 +642,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -658,10 +655,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -676,6 +675,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 2e874f046a0e..c1971638561b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,9 +1021,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1031,6 +1028,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..39ecf4686c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3700,9 +3700,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
@@ -3769,6 +3766,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3893,9 +3892,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			dma-coherent;
 
 			#address-cells = <3>;
@@ -3978,6 +3974,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

