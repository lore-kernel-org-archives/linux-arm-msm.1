Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956888;
	b=4C4BzuL89kkm2QwryYjdxLIWIxYxhKl+HbYqwYPYqbO4+xeQsKMnrjuL4sadktwy4c65
	 +vbd5kXTTLsPDtJAsaITJktw29T7akDtEkUyC0i47zJ0FbzoWcouu3E33bX8TK4jJNdCH
	 vhXI+5BBLiRKFEzChf4UiwlJzFH9hULO0A1pxAhdLc7Geoftp+Tqr1gqHtkfakic3Xl3j
	 SQ7yxJivlEp99nYwBusscA518QkYVuQYOAalN5LrbR18snHKvvlDjV2RtnOZIqJoBwW1y
	 3zszVC8/mxIi3qgzsqCocT73QaYzsJNzMseqQ0PFziYXHlui+N1k8pXwVS5Q8/52jaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
	b=GeLawgwGSH4rFxmgF/iENJXnEXEEEaiRpSXv75inuGzA3qjYpaB0yGTexkPTsM2RJNmB
	 T/sV0TTACM9ZFFg8qqoOl34GbxkFdCyep4QdVP2Jx2brmKJytbw+W91DycLsgyxT062du
	 pvuTsH+iFPb7Umadr+vE0an37CxTdjtutPOutdg963Q0KB/VwmLL6lgxPQRKut/dH2hhU
	 vHVHNBVWWxcHp+SPgbYFi7v/v+iU9VrIJShQvz+Pvb63NJM9SO3/4vboh8X1xiPa0Z5wX
	 //ZA1Z763cYZSjWnrDvRx6nr2McjZz9o0EHXGsIIqTYmOVQ9CzqoclznVjfUJj5i9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+RKZriT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKoftLd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F5606D80F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D9F5606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+RKZriT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKoftLd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7iV3243911
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=; b=F+RKZriTo0yBRXtv
	zui1Q4ia0oPbOLU7Xy9JPdG/vHnJDXI33uS5+BINIMMu/P1W8+30K+R72SFbqn1X
	/USq5Vqc58wECksW0HjU9yXlRhGCCUQFmg07rNigKFR0aIYsozmPsa4WpOtNOOYY
	uwSo3ux4SyuUp6PTANbcbanKVQkgcutvrsY++a+5MM8jbKDICJ5bbAeR+SA8IJrh
	Q9JuAcv6cNIaWDm6SzKPxcqyLOXXct/xy3Ky3H07yVKeKyrnic9z8GZta8y3/TcH
	MVysGgrhS5ULUV8faO+lRxK+S9niGwsNqhB6i4YkuZ7ZEoXqo5EW8vu+Vv2O+cSL
	eUtUMg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso642847eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956886; x=1794561686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
        b=WRKoftLdUIgZ1nF41SSYJ7pFOsFqZVlvLJirVOWMKd1convu7aJotPlK736RqTKuYM
         gqIdLBxkyvgvG54Iz1h5Qux56pXDaEJpFCdfyWwE1ph97QSQXMXTc4xLM1qBscm+Ud7q
         06xSR70ttwQiuB6XcVuBymEpArkskEc2LfhRmrSbmXIbj5f0Ux749rxAN/nj51IbUQwL
         78Chg8xbjaEnQwzVC2tR50n/R4Du9enrHdPyQlt7Ul2sZ42NXYN3nb7ondVPU+9r/k6I
         JJx/nLMEMQVNWcbDNDNwWQ59+VVEVszpt+sXE45VCBn6sQ0W7WM1NKg5V9AQ59FNlW8b
         D7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956886; x=1794561686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
        b=n5nYbjdgnwD4AUNCmC+VRbxf19PUaaddOKn2dwO3wgILGJZ6wS5nSszGlvR/GYGwKd
         y9Z1/Cpy28lQkj9suJJFi/VXQPfmddZLjK5zItuYPx2HY4GHXw9x/MXqi/y0pzZ+dywh
         lk/jSwtj+w52VJjj67ezCfuQbgw9vFYvV9MdY7RJ2KCK9uGKwhiXmtJo/PWd+jUDnfF1
         OQ4NTKCG0BLBDAyFjJi4/6PIUAqrYKV9lX/lecKH7xOluBFUcZkl13/OTyNfPuoivHPg
         VsKAed5TITsRPWXTv4NQfvSvzI2XS8JoE8S9iFrp4tW3dJXnUUZRxAnH7Cgszy2yEkVx
         wVDQ==
X-Gm-Message-State: APuU4Z8Vp3fZA2CqgT74Y+UCz9It09k0kvpfy4h0fd+c+0HevHVAjn7v
	WRpu38kzum5Pm6K+CLwDS8shNKQ1vjQoO734eG7EDh5++I4JF3xS3wK3BMOuGTM9fpw4z54Gx/g
	Tt8jNahD8CNWo289nBNcmjekNZIBrGTNwfqkoqeet+jwAyA1oFcCiV8DEP3R3USdEDw4T8a9Ac9
	xH
X-Gm-Gg: AYBFou1gm3dd3u8TZqM02tiIsObig98SNmNfJe7ppDZsjk1A6hrPl5bOVfoLqBg2x9D
	O6fyREFI2aZBGiagXRdMxR+0wBz235tvuxXmE2yVtLYYVICJpVJgyusHoLj85z8cVLQY7Fm/eYJ
	0+sEJKbi6E165VUIgEtPGCgrqJabnXBRw6q+28Q0eN6lCYsUgCqG2OqQh51a9b5Omx85Q8QkW5/
	JEQren88x1OiC2Q/MDfGge1JcyvYwRXSeryaHeloXtZ6zyKYdYji/BUa2A1wHdqQXyX4nrgaPcO
	cKA7WqB+uItV84jGtfrQ8pz7ACZu66mAzdGvumJXjemayS6EI6UioF0pEtaycpbfoM/Vt5uQ5PH
	uDLN1TabRwd24fuLe36a9nQ7JnvUdTzi86pZ6suVpMI08oycAcmBs3XH5IsfL2cHP+O3o4y9DHK
	kCW9zuqKtS7Zj2jrHzCoCG3PnGZbVPE1jh5UzugKBabFZJhrSUOa0I0gd2S5/B+UUM1409Mor5v
	Z9LDQ==
X-Received: by 2002:a05:7301:160a:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36f772f59f5mr2121408eec.39.1793956886349;
        Fri, 06 Nov 2026 01:21:26 -0800 (PST)
X-Received: by 2002:a05:7301:160a:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36f772f59f5mr2121384eec.39.1793956885880;
        Fri, 06 Nov 2026 01:21:25 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:24 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:53 +0530
Subject: [PATCH v8 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
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
Message-Id: <20261106-08-dts-v8-4-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c17 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxrpySV1XEFaC
 Rp/iLtWEWOZ+fQI3/Hh8WnbKnASUpSoV4N05TN4FW3qMHDEscCtjNWAB5PBC6lFA+WDpUr/6Kcr
 g7gOiKTopauxQlf6qjQChxhvXlZ4xwU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX7PpO89Eiqnh4
 KcZdunkqt6mv2rSiw6EcZxxC43Ypg5PQVaF4+l7i97PPx+Ef7TOxlNGJDWx1YO7nD2fbGjVuFK8
 Q5KdPJ0xl3Bsabz5cq1Av/cpzsjpMeOj9wBGKderEZM68uQq9I24sUvh+GFCc7u+7XsZOnLTxPO
 aKXd3X9yVLoCLrYkfxbi7x3LjAifEsTRRpWfvXM0PzSyvWij+GwPKemVsD/TWdypYpkkai5F0QM
 PQntpzc4kA1Ip0KusZsCUTvDGJSshOVFZJtfSEPM30F5JtVzkr4VCGCLjUFx+JKpj0o5wdHIEvP
 PBBAfFqGZcmbyL1MwfkKwCn4EXnMXP6s3GKCuZqLI2DoXxeYIRyGwTDuxEIdxG4yKXWGnXLF1LK
 BQAww9uOB1vv/4ZJwC1yww+v4+ZTUsg7yOb4E/iVS0BIWjJP8siUkR7Z0KIhHhLlLR25DLm+yhA
 o4FHfArmGj5lwGqAMYA==
X-Proofpoint-GUID: fgh7TJL8EyF1e8rnR854KyuQN2fRJeZL
X-Proofpoint-ORIG-GUID: fgh7TJL8EyF1e8rnR854KyuQN2fRJeZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index cb0adca9a151..422e2766478a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -121,6 +135,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

