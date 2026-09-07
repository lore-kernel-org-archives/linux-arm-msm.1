Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E645FFD6
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775702; cv=none; b=B6g4TbIfnY+zYOcZtoV6qPm9b6Czd7JCX/Nc/HJNMM7VUkPSKIAWe3v89bHy9H9CJKigQpLWT74DzNjdXwRWqKjc582clC+xxFHQnt41PqByofHw7pL1Tken5UUHEBQACoZ8UNRA7gEVQVUckO6NPJxbdLj1j9f6zLe0TnhTybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775702; c=relaxed/simple;
	bh=s1k+cVzV/j5wJ5Wmv4Oqij6z6aC6GduAUS9wamxgIFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJZGE+1aEBbdHrk7sHpnjUVkMKiDZq5aM144avRj11+IJ3eu76ZoIQnSlGEd0hadYUZHfuWgTQoTGa3w/5R8MrD4Ylo05/blUItJVGMAqXd5hpnK8PvEajOlmJt0pgGiznFTHF4DziGUp05JeUkMRRZQe1UvJaJCFcBGaIQsYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxssk8rp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeIsPoEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxssk8rp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeIsPoEQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879baNM319043
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=; b=mxssk8rpUCgMX0TQ
	XrwcUAwJJ+JNo1gHySj4JphyZAUO+ZjZTjyUlwpm0cg59bLCCHQs5uS1VI5RbJOR
	LUbO6zMSgSGuDp9SNUPLJtjhYom3nrrLYJh/rjgMLP9CT1nJNbZ2Hgd1My0B/5hB
	/x9FQSJMI5V9iTdjp7J51HpR7GOE4uKx0vDEwgMkjOJUulKMNHnuc14EPvdfeRP8
	VbgMuoGab5vH0lN8j6F4S8XB9bOUPxMw0D3nwGLSekhQa5p4GW/lDw9bvmD5Vayo
	yibHIz5mn3S6QJgpx+ddiYP2ZpCQVoVaqtsgNznZtI+Pf7MTl9LWM3Dyj4OyrIrM
	YRnqTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjj64p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:08:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so5408049a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775699; x=1789380499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=;
        b=VeIsPoEQjNkHDOWb1YGLUukhQvWCb6UARpeEbNjFy+Q78NQU821uHsw2TnkqtVVtZA
         62HNLhhhGZo55ykT09NkS9ysGdJ4J2iX9XCDxcGqvO0xyP92pDMqlYppdDN6H3XWT7q/
         EC/mZTwaqHnkR/K45rHS7JO3Y2RtE/r7PwglwECI8WEWM5KbSoYTRfXVbwI4c//+zdPl
         G8NN0HcUZT+7tVYEluE0ofwI9fQxJWGlCSC93NNrOnT77RCEXcQIgn60/rPWJs6ptOIq
         VGDUx/wG+qMf+fiDxqknx5C0MCifHKJdsDSckM+GrMsGw1vsf8SKY70DcynZqfMHFSsO
         uQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775699; x=1789380499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=;
        b=EHBdimRkHop3ks3HhhMPPSSbh/9bzMcMnOO5QbFyLLBZWuBUXgOSECsEv5ASUoCByZ
         o8PikbXVsFEH0GvF30Ml+Z7Izg4jD2y8qOO6A2ZAB4VRcP/Ht7UmObGxJP/+CyZQnkUF
         lQ3xpnrOdi38V/lEI1Co3r23V48ToPOAVqzPII1/CNRsUdxcwANWT3ZiK/MQJ7UOuiBY
         ypDh7QjeAo9lgtlB3VePMqsz8cVO8J5B7HCpchrVRCaBLe+9HsbRF4VtWR+8nuXn2iUB
         0iyaR5FxiGbgl7s0QOEg+F+aqbh/zFqECnkuycOHI4n5gM0nDiROUpIKyOSmNaTSJbYH
         qPtw==
X-Gm-Message-State: AFuF++mGiUbmz2yGE2GeZqNtfpeedM8uEa9mR2XioNvWHo8FPDu/lHe+
	zkXZDGtAF9di/W4ljhnQEha1/CRRYGlXXAHLcGIvAsGUPbx45qOs7Xtc1BP0Wh4tfyzBNrf51pF
	swu+Ldl12LoDk3bxHZrt2eOx1kXOIx4RD09wAY3q/gvmiT4V6+bFOjaXQlUItTmeyab+P
X-Gm-Gg: AYBFou11B3PRmrRBZrwFwCAnN70LOU8FJlmkUyaaZMy6cUQlr9j4i9ttgY0Yxck/TqZ
	99lK4FMhFaFQYD8snSHZII0XCqR7tqSa0DD9bQ3XsKrQxBDiBsmAqAKIkSJIUjzh6y3kwnobx7B
	T9zd91kEZFGfheAksC68OF7MKqOCkZtNPxlrTethBDOtOGtzw33XhHXIYKey4aGM1VTyI1cCr3g
	qJXiTNA+vuXD4fxcpjLyvz1G5HwBjVD6DuC9YSrh2N7wqK0+S+QVXwftZMpvYtylkZWi7tAobD6
	dnIHAYXSgoqS3lp0KQPRFy8/RGzEKQKiWcuUtBQ3XqGcMJF1A+H1nWJLhP6XMeqmY2DI6GqzwdL
	wxic7afLYExMK+fsI/7cdYyUrYUPED0o=
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr32826935a91.1.1788775698783;
        Mon, 07 Sep 2026 03:08:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr32826881a91.1.1788775698277;
        Mon, 07 Sep 2026 03:08:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:48 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor
 on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2342;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=s1k+cVzV/j5wJ5Wmv4Oqij6z6aC6GduAUS9wamxgIFc=;
 b=fLYaMBI5F8WLbKPlcwg0ELZOzXImpcc6S3hdsB4QofUNRF1ZjdlBZzFzF/Jq/WKlaSL+HBrUf
 gedWTwHWkezCHGr/VdZcbm/eyPrXjajXT4y7h8M8aN8UKQAYUEbJ0Yq
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX8N5w3ybPsCxe
 W3CFCLBtps82kWt/M3pT5tDZF/1D/53gJtiwMmFkm5D5FiBV0tQ8xpisodYgj9lrGvJR+d1yObk
 1xCdw1OWwkuZws902/aRzxiyoP1Fqs4=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e8d13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: LLC4vS15Ur3uIsuRRsW9GsqkdhiucohU
X-Proofpoint-ORIG-GUID: LLC4vS15Ur3uIsuRRsW9GsqkdhiucohU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX/+kElgHZTw8l
 1XMMTndkIQZ+2l8GYAw89L2GIspqVVNHmZyiyFmrhQin8CptRM50fLlLZrjeH1SKOdVmr71/7/g
 +r7H5tj6TiPjJ780HU8ukpWSI6otgWtr9cTVpwA2SDairQiSTHOd7BbZk2e1KIRJ6a2ke+nzFZL
 JY7HThnd2yljxdrkY855WlCPwFNn9EzEL08olsH6ZmAJOmJODIEam/xCzUlk0neef/V6VOKRfSB
 t9QefdfTCU48AcyRUHkDTgKpkAR9M5eV8LoXuUmNLZrgXf4B8lrQrYDrXrQjc+t5gwPhuUVp9DF
 tz1sIqtXIwZpE1LU4Fcan9lSI0LgOFgdlBNCRh44GyHTat+2ZLXnqVrhPLBUrI2CFy6XpLgygzv
 vlzztNiOgiurRqqvRrh60/LGSM7OeXP1Z8UlxmU0x/xYrntlr5tYpRdiRkkGZuVxoZ8yVwOF0XF
 w8TS7HGYfgrJSaQ39PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
CSIPHY4 in four-lane mode.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 68a191890b7d875564080d9fccf85ae9451cf0d0..af65d739676743742c36ed07fc554cf34f34a36e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -11,6 +11,7 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
@@ -589,6 +590,62 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_inep {
+	data-lanes = <1 2 3 4>;
+};
+
+&cci1 {
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 239 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk4_default &cam_reset4_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		avdd-supply = <&vreg_l7p>;
+		dovdd-supply = <&vreg_l4p>;
+		dvdd-supply = <&vreg_l4p>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&csiphy4_in_ep {
+	bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+	clock-lanes = <0>;
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&ov08x40_out_ep>;
+};
+
 &i2c9 {
 	clock-frequency = <400000>;
 
@@ -1200,6 +1257,13 @@ wwan_reg_en: wwan-reg-en-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	cam_reset4_default: cam-reset4-default-state {
+		pins = "gpio239";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &uart14 {

-- 
2.34.1

