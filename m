Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9314EE84E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647972; cv=none; b=ZhnPvxgtq032oDpSUBZPG36Ym17yt7jaSsAYgGFguJFp4Tn5bE0Z3/G2z7du/LNXtzTWM1xuPBXxp/LA8lKN4xYNmQ0QAZaYE0xlZG2Wo9aa/U2QcsQgXs8UX+7ylgf7f4F+YuDnoE5hkO3JEtLFKNsyOvxQUXDvfDo/FixEJp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647972; c=relaxed/simple;
	bh=wcVvLfMlz5riSmWs553D19WWY81mEZP/GQQgeVrM1KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8ragM2PdYGK2X6TKspmYUScniawPKpbrjw6Ysserc5bUEnFloMi+ATeuYbZVXTqUjvtEbq9KNI5y7N2HxhnLUVTBkeEU4/Aj8QRmHjoTUZFXS5rmF7Kh62A0o96rCbJf6C3DtqHBBVc7pj0NT8LYzJ0bqJ4zuVUAvdCX4bonrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZImrOUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyb+/6Zm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZImrOUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lyb+/6Zm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZnHT2210949
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=; b=MZImrOUpmrVaf8nI
	kON8lorztGUMYsU8BfiKwFVWq9w8XHga8shDOGL3Eop4Ui5ViShPFooBHV6x4x6L
	jJrsE3l6uMvvxBKjXERfyHH+tcAhDa7GTm9nN60/71ZOqnRzI3lg4LsedChQF1Xl
	3OrXw8BbeaGG/JPvuCuHT1uOloMSN+2IYhlFc0vg28Ox1A7rWXcTjdyStdHsTX/F
	W/k8m+E6Ic5ZNGnuyF+aOjmy/GduM/Jr0XubwlOPBlCY/tCB1KK/JovJipuODsFE
	CChDmPWlBSJ1mqd7ewNxUGOdUCSmrEK9t+x2pTFKl5IFP9NfpS0AjnV5fpRmfdnm
	uiszcg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m28h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so1059191a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647957; x=1790252757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=;
        b=Lyb+/6ZmX9AdFDaUWbcCL4YtYLfAP5bx3fllOq9Q2rkBVJYtHQz5fPQ50gC88q/v9k
         cwoZ8nCHb3slVMFpTM/qtNEJr2O3m/1KCWQqNZ+VzIXcSjzK1KZMkRxpKLJY1pxseDZw
         OCt0xdV4hzDPs3JAKXhs1GyiLF/k7gaw5EBcmxsY6E2+VbGspFPJ1vw2jWr57UGCTFIy
         0HCP15nsGu1U6UEbZywVV5a2m5l1Ld5ibr8UMeAeBfrGE/WK67/49eZaWlumVyy6mrAf
         /TcKPOjPNrRmeekl/36d5rCvHs7JnRbi7blj8xSDdR393qe9fIBetkvPyT+lRkHFCIJh
         N/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647957; x=1790252757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=;
        b=XVnoWJC33D5FXBKtIM0vBIqxejDcB7YZA9sOV1Vd6YWYwheAN7jWNOZL4bS2uANjBt
         2YYJprdW815FPcnopXkkVmzTGYOoWmKj63J0qxZ2MaUPpDgZjZ2qRV2wHrPpBiuGImDv
         6RGjdk8CO3VHy7yTRu982WYMnyxdTfC/MyA8UqUjMr5hX9bBQCfrWG8na8pMaAEicC0M
         36QBye7ksnLwTj6v38Sn8vjSBtSxzmbjce2pbf5/qDRxzqpZwdFqOjREfjCN3WhFBZQJ
         5mDAVUxS52O4OHdwv+NQ0qjhxKHOOsV0sL/HMSMH1yyxWXdjAJyVI2yIvNM+Sfm+Obr0
         jDQQ==
X-Gm-Message-State: AFuF++kTjcadOJn5Xn5bhc4KS9VFK0rjPAprd3UlJMgR4a/10purkfBZ
	RKfydoc8N2MWNTWaXxKs4js4xQFj9JctjLnRJx84eEb1oi2nJWNAQpkla4ABUEqgp9CUEM88/HY
	bpCo20Kgo9seLhcj6lEgwtB1j0hznGLuDYxC2G4cy3746wQKMb4HkY+/7NQ8E6z4D6iSN
X-Gm-Gg: AYBFou3tTA59vnjg0nQWYYxKXAdoVsjLPZDKxxSrfC2IFcK//XGUFYqGw7iph7NPdwx
	Qvx3+0MsXVan95k3EXnaZp6MbwirAvNULqcfw3jXMW7Qvfv6KZV3iTZ1z5sT8fSueCEpRPjdYW7
	eWwl1Iyi5THrIJv2oJ2MXR0u1ONuawA4ScsT1WLyrI+awdsxkoFjS9C7kBM8RByAIG13fKbFrNe
	S5UvLiuk0uY69Y3wxnkxFljlLbvaONjnyp/YQ6CPOBQvNOw9njnbSbPdQfSu/dYAUI1B/fU6ClV
	pju534+39y1m7vaxQb7btCL/kod781dZ6cJx+NVomkK+CCT+bC4EFgS7DkCh+F2fDoMETyGVLBy
	05ewIPT+N6be0HPoiPpcOMF42BH86Vv1yVZM=
X-Received: by 2002:a05:6a20:6f04:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3dd5f724a7dmr17382250637.19.1789647957176;
        Thu, 17 Sep 2026 05:25:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3dd5f724a7dmr17382184637.19.1789647956559;
        Thu, 17 Sep 2026 05:25:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:20 +0530
Subject: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=3803;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wcVvLfMlz5riSmWs553D19WWY81mEZP/GQQgeVrM1KA=;
 b=86ZF4Ea/kEzihKao6RkKVEaYTkBEE7X5iDg1hFnl33qhmEgr1e8rdX7XWvF5+QyOQurq0Qh4g
 LSeH3WHYCRNA0g9StLHaABVdzAyrls6nDHtPLTQyEby9kg1W/DJCZHm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabdc55 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 312a5ZPOjxgSAMxDaVSOYadmjrT4rxAB
X-Proofpoint-ORIG-GUID: 312a5ZPOjxgSAMxDaVSOYadmjrT4rxAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX/Y2bRhD7OWh0
 J3YqeI/escoRdkCeS7W/LLUfIUmziE4Z+2G43D46AUqaEmIbVEPoxxpV2xeHZm2rxc0gFnP+5+g
 RfWGJ6avmnkdQwd8laqYNL8h3xYOBdhCqXZ5Q9rputPjSXqjV7SCFYoRRLZ4nLYKnyWIPJ03jZU
 xh4rGGQSpn4r7ehn5HR0lKxneJGNV61ifk0R5qG2qDiCzx+7EqCq3iE+rk2bXVnyk1aw2Njr/0I
 bsi0SjSGtdpY67UhU2Tb4OfexEqQQe/bgr3gEtZs0kXJNamKLj/W73TVTkEXT7ndYuw8oDF7u/B
 3rTgTJeBUBrpfyjFcoKjEHskuuKvAghJWNhHPOcusb6crHU6BZIDyT5m9QPDXiG2uoJ1xH/usnG
 Mdy4NMMA4MWxp/XrLtdpH5goewHEAPtCbjdFw7K3VeIXdiFUs5tjeVJxPiAAvG802GUsWsgfVvZ
 WSdfwGKbADsBQXC5QVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX7p0lygvWj9Jk
 wUU8PHS1GlXgevNqlVqJJrOL3c1MG9RP/DKLl4ltyqGDzzI+9ZjqEyBScAgOFwMTIAXZfLvHC/L
 HI9Wicj7HTiiDRHADrBgPfS/8AnWHQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170174

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
index 3e636926231d..02cb29afb246 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,9 +618,6 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
@@ -634,9 +631,13 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
@@ -649,6 +650,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pm8998_gpios {
 	gpio-line-names =
 		"NC",
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c66df45eee64..88aa0b7de5fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -508,8 +508,6 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -523,9 +521,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -539,6 +539,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pm8998_adc {
 	channel@4c {
 		reg = <ADC5_XO_THERM_100K_PU>;
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

