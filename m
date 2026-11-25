Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600955;
	b=5pIp5Ze6PF58OBf6PsduKQsbxcxHIo/OJgn13/M6XYxtcW8QKzgxkDRdVmHia9IxRdXn
	 8UhayMJrYx4GrjksdVp2Qq4csy3Yqjun8cUoV2pbqPY6BFZOGUHsbT3Xe3X0BSR1UP822
	 ktlAlBUphyIxNo7r9FI5Xj/uK2KQIcbcvYNc+OpfVXkhdxRsETPW1pSbRDQRrA3YAtD49
	 bqiSNIKLWBohrFVtjA0PH3J8oK1F0+3Jnrhyvujx0jsUkMFGJUE+7dJ6dV+3FMW5OdLh2
	 ZAEs6PGOwKWQlZT6ogsuo1tcG7sYYljXAMQksep0zYQmJkObmfdaTRmUEsijSXc7oEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czAatKB9X0RezDJ4yO5OTtf41NYjRyHT5jyhPCkEpas=;
	b=Dk03d3Vzugv/21Ad1IigM+R+eEmxN6WZCZdYOZzDfjmJeBzdomuTCe0FKwcF/Etn9dYV
	 U/MLrcGktCktxPameXORSc6Yo93oS1ceFVo1kcsIrF36sXf9oaIWy1IfWxWxQaV0QP4uV
	 dZoeFWj94hDvCsIIc3oNM/rng4LHsbmU0Ki7Lf0BzBxHmIwNWQFKLkpHHL3sGG64YpiFR
	 LBmnS/FGwgvSVaW0o+iyMHj7wtytdCTEm+6EnsNfe8kG5btDtHEQOS0VY1nxxmp9bTwWq
	 blqUzIyvnK/XpdoqX8ACPGN6fQV5GNCoGNkDAScZfOhkXampHNMGTTIW+7kf8QEl22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Enm6k4Qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx+0qEQX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2889606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2889606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Enm6k4Qc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx+0qEQX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mRnS4131759
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czAatKB9X0RezDJ4yO5OTtf41NYjRyHT5jyhPCkEpas=; b=Enm6k4QcvhwG9UbA
	DvAA33tDF3GTWhLcuhcJ43Ash9U9AoE+aV8YiVHeWilbslESSXqkiaQ9eEOZQVAf
	uSBn5DcRz6c7M6u4N5e1DcXHFZ44ReUy7sahPrqBCPIrDwvtXMCXbYAz1GtEBVGU
	hCtEEEGqLEOBSSmLhfkG4yRh2APmggDhgHkyQGYui2Kmp7CtYZBMoGt/EZjcCZhj
	skwgf85pgWLI4j9g7kOhJ0HeH3B5iUiadBNRREpH8Hrb7rB42Xnl8xcC915WSmZb
	oxoIDrtdWQL7vW3HfKD7pE8OWxOzkki5yzsrXYbH4G2pdIfZ2ppuzAwfUErBaFrG
	vqhXHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhr8r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4162e1605so5395197a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600953; x=1796205753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czAatKB9X0RezDJ4yO5OTtf41NYjRyHT5jyhPCkEpas=;
        b=Lx+0qEQX3RF5qgFK9WPI9Bx9rf2ARh5apeWjReSg0Gn5a3gr0gYIEc5T1G37kwsw7M
         vobE2Az/13PGqVSl8Tx57AvS5pA5geus59G1wlAGb5xXAOXyHQzipHINHoIppp2NJnkJ
         EAzVNtrxMiWWlBwxjmdbE7Mk4f/b+tqkqiBpYu5XlDQLfwTPJBjl6Ud9YrbdcBzu7n1N
         Pp15okUth2GXpFAHELLXOyVfc3HOTI74XRVAW/l1b/2rCNtBKs8p+4rSdELTIcecexjV
         MISa1Ceuht8mOy17mEkonwa45vZXaO0kw3qzW2Y8YywGZh3VcfJqWqhAShh/m3qEg9QN
         FhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600953; x=1796205753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czAatKB9X0RezDJ4yO5OTtf41NYjRyHT5jyhPCkEpas=;
        b=HWnC9NEBjTCI+Ci/E/71pzgHFVUTdOMUrcu1VTBZVz9OIwihAFZ9vBD/k6D2bS08Tp
         eY6tc8NyBHoQOS1CoB/5vzlH7uJFtZFkTZyf7NUfepB2kuWRauEVV55u5ZVz/NLhtyhJ
         GHzEK/Hy+FRl2LcUoISb/0hn0aHe3dqcNgxd5o2MBWGssnr+Yz907soiF4vmDXNsZBdZ
         L+iefpAhyfUfFFG4V7PjU1OF9aQfwJdzka8s1suWykH2eixRtIOwgdWG3UuqY5G4AbQZ
         gUcc2dXQkyAZbSJ24RPO5jotIqjkgIzdd8jeaqwtyydCW+MMzYgFCa9hxD1cODpASK+U
         Zy7g==
X-Gm-Message-State: APuU4Z+uVfdPfyf5aidqFgzPTUGGjgD6yQoy9rIJMhZcm6Xy6R8SziSh
	3FhoFdsqelXWtWHocwZV0wTECiO1Fkd3zLWZFKe/tdPTgMJwvEKne+wcLwK6n24Kh6goKru8hu7
	ac9l+iwfuX6YkG9l1pBBjfH4kba5/jle0MmEWiUnRTChpmh9/ZyT4sEL7BkGpRJL/L2cU
X-Gm-Gg: AZFdTZf1QzROqh7hp3tju4RyeoFnLzEK34zqBW2xxeJ6VSBH/kaeiuypsB/EP5fgjNN
	CPQQ6ZTRpYdYUCskGJXhnzIOZmnHKl48I+0ouBgKAYfXh6Sv5tgYTov3WRkmcIYx8hyUsaObRyZ
	uadD/4dImMj5qm5DNMa0HEljM2huBnauy3+Fc5AYaPIrBcJ45L4xz/85QZe08PPMsPuIah/n86w
	q4IWlpVowty9is/D4Au5/QyOY793tPfnSTYXSZcXRuyMvQY5kqH3BMpy1+AcobVx3ta6LKy2sFb
	nKwKOohygxLV3nk1ZVIsu3wo707mToVfiMjG9qEhUKdj/l1WkydOXyjEdYqyB8lx41xt+oyxiSq
	Ma3LkJQF7TNAUYl/qC56HQyeEpkvXbuUTrvxQcsgu5tGBkDmh1eZPPF+Ti5MU229nkKDFUy03tp
	FpepjAX968Rzfg1RiRlmgSOHBYqTU=
X-Received: by 2002:a17:90b:3810:b0:3b3:be94:8ddc with SMTP id 98e67ed59e1d1-3b41c900b03mr16952786a91.12.1795600952559;
        Wed, 25 Nov 2026 02:02:32 -0800 (PST)
X-Received: by 2002:a17:90b:3810:b0:3b3:be94:8ddc with SMTP id 98e67ed59e1d1-3b41c900b03mr16952759a91.12.1795600952076;
        Wed, 25 Nov 2026 02:02:32 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm29610915a91.16.2026.11.25.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:02:31 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:02:10 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth
 support
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
Message-Id: <20261125-wlan-bt-v2-2-3ee862fec57a@oss.qualcomm.com>
References: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
In-Reply-To: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600942; l=2084;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=KG/kJrFUEe3bznT7CUZB4eq2bh58jVlCR3Y7RILJLA8=;
 b=spJprP/LwMPdrJPX91+bMIIIAzeSpRJfOo7637zsSfkb78j8peva8NtYD6FRl1CTcHiHUdBUp
 eHJKFAXgzydCMB4vKEGinqKUOmnsNXlPd25h/GYPzz9/+Nx+vmloP98
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b239 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=S9dNN8KtBPRcyAfRgskA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: i1oxnNoJcKh6jCywh74YywZPo_xWxKr4
X-Proofpoint-ORIG-GUID: i1oxnNoJcKh6jCywh74YywZPo_xWxKr4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXzZymbhQxM0aa
 gQti81LfuW5ls6IYzNM3U70o4aFmJsPPT84/YJHWCqI4vaFxFyhMrQvDuAHlAwX+ZJEY2arG8Nk
 5THTM0mQ2OEFpC2brRn2FZSAg3fxruM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX7SxSbzbIdXbY
 qpadikPcpZCTuzqjEQtfnOR8AoPSRaBv/0OfNdXpcNk/cOawiF683feTgz4u+zb9hUmN96mkqAz
 pj6iwT759tM3et1W930ZGJrpHNUE+R6jbS+yoENS7sqXy7TnwxQQEiAZE8GmSxJpxC/pGMdKxhf
 CTgFfDnySTKgl8IAtGwUZ6h6c8HGeyXFiJ0UNZ/oNGYEUuhdzu0hhtkIimYYNCh9AzblZf0OjzA
 7J2EIDhD2VDjWwwf7eM1u4jw4YvfnYUo5mdlMWltauu9k7LRWx9/YaNHheYA9IdrJ1DeyUahu6Z
 PbZD0lg+Gt9ra7uCZJODA+llCktM/2dC+XGfOFQiOvjFthm15vAw+4/FYjo/OEidhjTn+XL6u7E
 KGks5CBnJzSxoZvVmgLBEpYVXTNwCvJvX6nUvl6NFjyaQaw3xObc7OqeF1GlMiYn3gSxVelY9he
 d6JYlIO2bbWbsZTcbnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

Enable WCN785x Bluetooth on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 +++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 09d5ba419015..3beb1c7e9d50 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
-		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
 		pinctrl-names = "default";
 
+		bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_s1j_0p8>;
@@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
 				regulator-name = "vreg_pmu_wlmx_0p85";
 			};
 
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
 			vreg_pmu_rfa_0p8: ldo5 {
 				regulator-name = "vreg_pmu_rfa_0p8";
 			};
@@ -872,6 +877,16 @@ led-1 {
 };
 
 &pmh0104_c_e0_gpios {
+	bt_default: bt-default-state {
+		pins = "gpio6";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+
 	sd_card_eldo_en: sd-card-eldo-en-state {
 		pins = "gpio5";
 		function = "normal";
@@ -1000,6 +1015,24 @@ &uart7 {
 	status = "okay";
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 226 GPIO_ACTIVE_LOW>;
 

-- 
2.34.1

