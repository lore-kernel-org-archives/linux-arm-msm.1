Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B34A4849
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047060; cv=none; b=Z2KVefwE3BhmdaBmDgP1BncDGw3SigARJTl0AijMlyTX3VNWPYaNPNgHOwRGIc7MIJXZBR8Il/LxHcQMVInSRNZ/6LnR+Ag0wJP5lwV8y9bDnF+F/gdWvaF0LJX1oXjZtDjlq1Lfvy5zv1IdEYmWN+7Nji9fQvMbhEfVwK+Fshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047060; c=relaxed/simple;
	bh=XqISqFfLEc1XPNkt+ZZkl93gzud5eHypdyciEc4v9mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpKT47lkDhV+SKfl1lyo41nA1VjHpaarY+OB1Sq8RII3P7wq9PpmaJqHw55JvX3Jz6rQYnd7yWt0A9YMKJB8mK7pvw+BwamMmnGg8tLKp544nc8PAdmbQUyEgVrwXlQ6j1tqfykkJHRsnEN1ZUKa/ww11aEtVBGz5udvg3IS5Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/6Ss/Hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlYsa4BO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/6Ss/Hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlYsa4BO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7acM2029183
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=; b=T/6Ss/HbYECNWo7Z
	StqgYvdfqkeT9Hf8nfZNVA7I7TMYMCzl4fTIx4Zwk8lRpe/R8Ld+6Vkb+hs+3udD
	OMDlAhBZOz5glqut5DIsd/ouP7eTj1rl6fC8SG6BUkjCiDuMBFMf870mjiCcobYb
	OtNiDgJIjvW3goowo/5hBblLHYzLrCLWZPKEuS4BmcCyn/A6an1kehhMpUWP4GKZ
	66U0fcaMgrGTGqCfcXi3r/y7NODzLYzmJ50ajA+0RwruoRpNcfUyhhDyoCnlUw78
	KxyNgwXAVPyr6gKb/qcQ/8idMmRhJwqAWMeEY6L/HkpUs/r9NwAFL+DXHkp1bl/d
	Od5gIA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc09v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:56 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c07dcbe60eso35888eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047056; x=1789651856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=;
        b=OlYsa4BOdYY9lve68hPSgxy0vsc7NttGjqNGaTV9dcJFG4q9/JB7KH7QvyE29gpdCy
         s8m9FaGRrLojNwbEG2QqsgIVozdVp8YdSFvJ11AEW70Apm1W/TT2AmHoxY/o7zak9sx5
         PdobQWjpPfIUfJBjno29EtYuAzEWywvH2m0pAMepqAEm6j72RWKYfYBQ1qeTNOjEqBn2
         6OB7RiMWKK5an0iA6PA2TgyYCKtAiNnI7DNKokuptD7bUcQuWR8F1AV8wtRDjEs7pJ/W
         PxCan81ktjD0KU5ikw0ati6ccKYr5gS9m4wEQImPrD2IMhis+CHTVMkKTWHhvrFvOvff
         SY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047056; x=1789651856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=;
        b=cf4svwpdYF/tZbtxJ0j6LodzEdwQyk9RdKJCIGItNfC3iAdeFlRn2g49GYoRdE48IQ
         OPJAz1s1FciabBD8aoE/L7BnRlabxqucSvU+XS2hZwRm0x0yDDNK6pdHlp2z7gOuGbHC
         7uOzc5r31UyGmU2hNG9w83iayu8r8ycz6Tv07FWkHWGmtkFnQsh/mCMZ1H/Kdyl3Dwsu
         8W7vsmOVaiHdBpkCILKT2qR+rMCiErGz6oTbhm9K4+DtAY5hhWUDjHSuGzVGZCoB7xcc
         ST7J2ftliBiPWZ5OFpv0EpObFvjsuSAvPri07veeoIZkLsuSPhmuq5Luu2TsW6mW+4ZQ
         +PYA==
X-Forwarded-Encrypted: i=1; AKwUvByCzw3RedNb/OCLOkThqui55++VndFeSOOSIYC+Gm1InHTGyYPD96Pv1Xl1lE7xi/4K1VynfvdQY79IX6gT@vger.kernel.org
X-Gm-Message-State: AFuF++lHHEn31PCTSUVso5UdIdawB3w+E+/c7wovzzgrWL7GZsGX0LV+
	4i/LJe+0xAcZLMM6Nf5IQmaxklcgQMMqUdI9O7bFRutPjO2JqAqTxfTqBNrDup/UclDEJvOOe6P
	YQlOZ13LtJPaciBc6+BgtsIS9FpdTrkOov0i5DCuZfJ5mBdJvgnEXpBSzVrrQbaWN19KQ
X-Gm-Gg: AYBFou13jYFZIZz0QltLEpnmLLLgwcX4+k8u4Ubj+ALvosDJmc8wVtiNbxXg40VxLGK
	R/nL6bwDud7Q8gLWXP5NK/r6AjEF9OnQmWDNdzdRn4XAh4q6Fcu997RZWlK+kWyhd1LCoR/m+rT
	kpy5ogSAwhwsBH4WuZvmJENkfpdk9SFjPmE3wfaryZ+ts7vB5Kqek48Do52TaMNPtBqK+qsCjOo
	vv49hp2y2tK496aeosiAtH8Pvxcy0/98RgBJbSFCvjzqpZfExKgmQ4oj99sSbJ8hpkN8KF/Ky+L
	aZgsEMRF+EKka82rtP8fnhnGoS3NY7TVcbM9TR5kukdfKmgItHEo/mCeabZ4MV7kzCWvJV/FojP
	bXV3EhioCWTzbslvoFK//hQlfWPtRFHtLNDs=
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr20460912eaf.41.1789047055650;
        Thu, 10 Sep 2026 06:30:55 -0700 (PDT)
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr20460880eaf.41.1789047055187;
        Thu, 10 Sep 2026 06:30:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:14 +0530
Subject: [PATCH 25/34] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=3776;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XqISqFfLEc1XPNkt+ZZkl93gzud5eHypdyciEc4v9mw=;
 b=FQfFgZNU6HPEO//qk2F1KQYb+FNX2WZ02MsC9oIFwanstgnRhY7nTmOQc1p4Ka/gADMkliht9
 hRSfRAerlOlByxBl6AfGKaZpJq/MNbOhA8VTZhHbGIT5RQbOoRvLULi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyaa1MeK2qvH8
 cJDk6fik0vROVIROv0/g5apOGmVyEz1YKWOX/naa7ihEmrfzoAhYtSOqPAw2YPSRLWkp0fxAWKr
 JZASiSD7X6Du+qq//QJBLnC+QR6Y3YlQvWqeitK16gl0kHAnDmh7TmBo3TjJTd7x38aFZuMtY2i
 LUjoW/GZI00clZRuMazBXX72RsSUeOkZ0MYnLkR3O/lqLuiQkgpPQtFonfDpf+kXHZiTa9KuXNk
 XWmDSKLNXBQHfKTWZrgiWVM6/wWBYUMEkyahVvu4EbAcwwqAUvfB7cBKTYASl8+LeZUXN/+68d4
 w81kHcLZh4NgSZkKu6h0uyEnHHS5C6LV6Nd5NXKGLNI2+41UTitMoP09mR28q1CkwCbVUyBIgdu
 e8kUmBAzU43qK7ytpIOyoLa7xU5r2GCCcg/hTHr7ZM+wq5syAh1xwPMKn4PMl9oJx9VMzKMD+hC
 iXHy36xtau9Uqw399DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3T32xu9ook1N
 E/5aca6Kqpq7ory+dRhY1BJXRZ6alQoK6xINnTISqKiLBNCTqtgVA1YDWpV9w11PmWZa8OnIVwh
 my+q6Vr0baFmSdujhINB+hikTkCzC34=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b110 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: SCFrDr7bc089L_Y2zvBTOm5h9z4fneE6
X-Proofpoint-GUID: SCFrDr7bc089L_Y2zvBTOm5h9z4fneE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e636926231d..27a0b90d2b7a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,15 +618,17 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	status = "okay";
 
@@ -636,12 +638,15 @@ &pcie0_phy {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c66df45eee64..0080000a1839 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -508,14 +508,16 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
@@ -524,14 +526,16 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..cb7f93b02b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2395,16 +2395,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2525,16 +2524,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

