Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462363;
	b=sbEDfJCkb0A36+hSrbN9USyjQcISnmfw4rnjjUoFPBU0DEpPQeZHu++zUvJZPbY7Dd+S
	 1rSCFfw2jPtD+GwYN9zfimCops8jFZEW3+By02E5nDTb04e2epv4pjcpMV4eR+T809iPa
	 06n2jVzPV8Omr2YlDpM/M7D0jv1c7Bk/MrltbOAEmaCBQDYMUDBd6p2hyQjyIJkcBjnYL
	 7X8SUy/qcKiW6ljcWfw6TV08KJQYlT++dt9huQ36hMoEvKb7VVrO74BQzyB85Xt6dG0ZT
	 wuEnKViyWb6JJozuxqvL32otiMP7pl550c255IX5v/BWa+aNZKtkEiwxRJaLcflTlLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:X-Change-ID:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
	b=QdVVhMk4Nq1oAPfwOU9cNObNrdZerN8E9ROuLsTaInT6W4DRCLJ3qzV2EviG3+tNuGvU
	 mMxGkVDzwwPKodmeefQIrl8S4vbwFlfmEnfas15RO2x/WdRxnQazTU1wKEjH/tC0BJ20q
	 mbfGWUAhyLpiOcE5V/gXVtBQbdjz5+dFre1GFXH1rBgM+jx0doe9gFgvTEv0LZWblg4pO
	 VyQCXsY9qDu6ZLo7JQZXmFSUv1xm+WJb5Pz2db/1ZcdzsU9D/6WDH/0LizWBQukuj4ub8
	 SkBAKh33N2b7zZHBz8rDAmFEyDFo8W+/kV1x9DMNAxsqhttKdNO85rYS4677vVVVcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XcTKBA/l";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ptgz3xq8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4C606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C4C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XcTKBA/l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ptgz3xq8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zh5Q3813251
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ES4raCN3aLHhgz4UDLc5j7
	WzxJZvAOaMMdlxyP97cFM=; b=XcTKBA/l/X5PQWXChbcstZOeCJUc7dkXnpt/Pa
	b8IZWgh1jC6tRllbt7s9y7qz8HqIaCt3VD48x9x6Mh7atzaPSZPsRmLi/OgB/wEW
	/w5DNpTGqnVhw5vY827eHO7VWvsHiw3+TiYHAQY8bC23zUhkbu5csP3NZKzw2Eo1
	3rWUKz+xhRaNu+g1V9q7lZnBWRMHL/Ub8GIfgghU5DHSmHWkw/nTkJ6rAZQGUyvY
	h3n6wvAoFWdHhvQYoTSUxbMrz6u13V/xqs7HJtsavjlsx8DxU7Ppiq7IRSRnnqPN
	mPar68103OybumnYa+RtRX0PzvHBy/xoifn6vuQ1VJF3u7mQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jap4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:46:00 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4adae31e4b1so4795819fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 21:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794462360; x=1795067160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
        b=Ptgz3xq8scrmlOYtYbHRxEAULtvh7vbXwV6rShbbU9Iip0kXwqG73k+80cQPML4v/1
         XlYBz5fKpZdazzUXlLfRXb1Hnc9BOMpGxFaB7dv+4Mrf6LI21DMIrjQEjoqpiovxM5e3
         dn94PtFdN5cLRMiDVBIfFUzv7TSwSLJ3X+jHHzY3HDTFrWjtC3tg03VBNCnzzkcB/0mJ
         yTB7QLnjCc9n1+e6cstpVC8dCoCnopTm/ugWp2qWqH+qNmz27JM7Ckp9usAr7LHPzt8F
         KjR0h6WQ3mV9Et5LSweh1EA7HkyEdhCnBPqThAxdYcD4O8s6kc/owdG4GqzIBM+/am41
         n/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462360; x=1795067160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
        b=ZflnSq23vpDF0BYu3sidc9Y5cFX4xB4yjWeu5hWSjS5OLySTxVVLNn8XN5WSqyFGAV
         INWTCM+szAq1R9kQ2LllvKDwZgvj74AwXFLjyJOmtIMKDbMF+fXytzSYHZGTy1nUszjd
         xOG06+ahRoJ8fSprczOcvql9fbHsf7ajvS6P0pIwQwTex1AtvQKsLNV+hHDoEcglzXAU
         IFu3KRFvGnZCpf8oq6JzJiVTiBRTjyDiFco+tq6IvhvP95DqvjVCxd0oSA0x+em1etuS
         ycJTYvRUxenp8nRZS9lftl8O+sKc1DWkJqLMJzHf9nC/UF39yMaW/AYEPxN9nTjdOIq8
         +0DQ==
X-Gm-Message-State: APuU4Z9fBDprUibwWipVHtUI3OeANFKJXxLxi9WAtm6ILQj7P2G5v3Kd
	SCzmkOXNTVd8CgwlxIy2EPAtnhm6vUpqWaS83oo1NeC42oXnG63sU2iOvq6RUobMQzBlA6DDHes
	EU2RKEkc5b6UaHPL3TPwhgson5lafl21kyCplUe6P1x+zb/7ZJXSHgjNmHG27KmcSPPZv
X-Gm-Gg: AYBFou3WPKkjMfKDIfoZEehbu2HsK8KjOJSbhLq9Ef2rmiMhbF36EijHgsTX7ZcTBdC
	vEpmXGCLpiirB+vj3zVosX0iR+iR/GSU/gmst+GRKhW4zV22mrKHFxATNV5YKuOhjLXRiqzvYHD
	bZbKllrGtUEZefXcuxRjGyOYVDogbXkLNI9Bvs53Qjrd7146lqMAt1TFH4738T9rxo/chQyoCD3
	4j8aLVIf/wigFe8lUK0mH8NoictwqDI+TrPKCwS1zE89ahQYsfme7xruoI7Pg1s0Y7HYznjZTjN
	Qnq4lJRODgkVocivjXlY5vj9sTU8H/kFOeyKgL7Wlymry1VaBwmGrK0Jr+0Bs3psWaYaROKokj6
	9D+aavrdYMgBfgrnbyxf3MT3bczHXqAJwdcfIyl/MePRygrirW7Fb+Eg36M8avwmldJfKI5s8FY
	PWzFZjMSxgozxy5SOEMP3Y2OJd
X-Received: by 2002:a05:6870:bacd:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4ae46c24e4cmr3934198fac.59.1794462360063;
        Wed, 11 Nov 2026 21:46:00 -0800 (PST)
X-Received: by 2002:a05:6870:bacd:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4ae46c24e4cmr3934185fac.59.1794462359570;
        Wed, 11 Nov 2026 21:45:59 -0800 (PST)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4563844fac.6.2026.11.11.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:45:58 -0800 (PST)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa-advantech-som-db5830: Enable DisplayPort
Date: Thu, 12 Nov 2026 13:44:18 +0800
Message-ID: <20261112-hamoa_come_dp-v1-1-a77597e29e04@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Change-ID: 20261112-hamoa_come_dp-40a7a09236fa
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YDeLw9CSYtOCn5VyAEj0BNngip6yLqpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyMiBTYWx0ZWRfX3LOVef203S+X
 ONmQeaspwS1DxVEHVdyj9f44oWSE1EUl23wzIs4F+zkFE4hPhPRYT+8M8yUc1KPx/L9JAij+SHo
 t3xgfG67ULsFXtYsCtNOyw1U1piS/LovwKLlbunI76X7CvB5+ZffOuHRgB0gCdCuvJZPBXdEZ17
 iW7UQxwKI4Vezmcted16rq6/unlTA6EYFvsOuDwNv4XmuJVEO93WhvwbGPrj5aaauzzYwAa0uGj
 xNrmcvJ/Ja6pX0qfQCYhytyWXJc4b2eAGuvzMxDWxBr/5Qv97T1ZR8SZ5Lm/cpsZZAzVr+/Ou1C
 49wwP4jIToA8PxNAJ6RH4Vorlqtdbj0RtWSFn7g+g0gE2LxQOGDhfCgmwzfw2QrudmFPPM4f0yk
 bxKw/2tEpF1SHo/ExqczaQUsADxeYhiKoqPjlbYSd4lK1iKQ0v9H2a9uqe52N8EXndahuzXX/fy
 DDYkREZNURnRmYrNqiA==
X-Proofpoint-ORIG-GUID: YDeLw9CSYtOCn5VyAEj0BNngip6yLqpc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyMiBTYWx0ZWRfX70gns6Vo0/2q
 18f7DtmHsVIuAiylvFv35yYfX+ApX6mPw3ROojpdBCVjoe3yyqNLLnN+GS4Bkbw4d8zDze5qG/r
 l6ECIMwW0TV6QMs2PKHgZeGfwYOjLdk=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af55298 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VT6PoHGwS4LR_UsKkTUA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120022

The Advantech SOM-DB5830 exposes two full-size DisplayPort connectors.
Both of them are driven by the DP0 and DP1 controllers, with all four
lanes of the USB_1_SS0 and USB_1_SS1 QMP combo PHYs routed to the DP
connectors, so these ports are limited to USB 2.0.

Describe the DP connectors and connect them to the QMP PHY DP output
endpoints, enable the MDSS, DP0 and DP1 controllers, and configure the
DP hot plug detect pins. Drop the mode-switch and orientation-switch
properties from the QMP PHYs since there is no Type-C connector, and
switch the corresponding DWC3 controllers to USB 2.0 only.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../boot/dts/qcom/hamoa-advantech-som-db5830.dts   | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts b/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
index 9d87c98befc6..e2c2a162c999 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
@@ -24,6 +24,55 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dp-connector-0 {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		pinctrl-0 = <&usb0_dp_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&usb_1_ss0_qmpphy_out_dp>;
+			};
+		};
+	};
+
+	dp-connector-1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		pinctrl-0 = <&usb1_dp_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&usb_1_ss1_qmpphy_out_dp>;
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &pcie3_port0 {
@@ -112,8 +161,80 @@ trip-point0 {
 	};
 };
 
+&tlmm {
+	usb0_dp_hpd_default: usb0-dp-hpd-default-state {
+		pins = "gpio122";
+		function = "usb0_dp";
+		bias-disable;
+	};
+
+	usb1_dp_hpd_default: usb1-dp-hpd-default-state {
+		pins = "gpio124";
+		function = "usb1_dp";
+		bias-disable;
+	};
+};
+
 &uart21 {
 	compatible = "qcom,geni-debug-uart";
 
 	status = "okay";
 };
+
+&usb_1_ss0 {
+	phys = <&usb_1_ss0_hsphy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_ss0_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss0_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp0_connector_in>;
+			};
+		};
+	};
+};
+
+&usb_1_ss1 {
+	phys = <&usb_1_ss1_hsphy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_ss1_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss1_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp1_connector_in>;
+			};
+		};
+	};
+};

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-hamoa_come_dp-40a7a09236fa

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
