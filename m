Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478577;
	b=XeZwOPLfTIbhgG5hhJir9nDBfiDJoUpMqn2aet0Bat6m16kThcQbBmePfSCre41Bz2tL
	 r3J8rTbRu5A8cBL7lr+L5DduRaVQXDg1vrbHUJ5Jdk+UorSecqsdoIQPbwT/YYi3v6V47
	 Ykv7PmZ48TFMI6tR6oy4YAOgA4Gy3UwddXe8Ck4JjMMF73bmjpD06zQOhiU8pvWU24BK4
	 29ks2LvXEC1yPODMTtyhrfyYcpWHyrhWhm3Mij78IG4RpfkrVgGR+yuUcbL9Qaat/91ip
	 a0S12HVfQYTWSGTySsloxo5Uowhc/bfAOMzpR9BkKDP7qjzEJT5Q3SGSh9Ypf8quKuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=;
	b=rPACl7TcsGeBG0lmT/ONT0qyhVgWJdf2oqfUNVY2+Yvi4ULcDjRqvpZCNZtsI7+LjcHM
	 cJXeJb70JqW3L1yk3zVB+bK/94UsShxsJrd+bc+Yihc7qDwmWzAHxQAvIxAXSgPbgnR4b
	 SY5l9VoJ5L17rHiQeOhjuim73RywGhROgNYfTxD6CwruRg0A881cgrrrSecfk4W7B1gaM
	 dSDxbCQj2ocqckOQcSO0TE+N86QUxfsZhEl4cF2i4mAHmIht3Jz0+D7/qlzXnhfVgAxjw
	 wnEK2zen5wOabNQWKBgbFw+b6hbs9s4SqCQ7Kke1MM2CfakLdsTIJ5RpvP9eMjLBfRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oOemx5/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScYSGYib;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB291606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB291606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oOemx5/p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScYSGYib
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5490m3477469
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=; b=oOemx5/pJjYUay72
	hfj7X6LkHgDIpnme5CV2dWK5/KtlAV3k1n5LiAt+VRBv66jaCqlEyXxHzAYMFUoM
	a5b7oHzzTZyEwWsubbsrWf/fTSlIT7SdWqC/zi9QLF8d1vV6STFWVcIeAcZdxcSx
	/5ZGTbreUIS24EAtPxJkwjJf2JaQSf03WvR79k6DgN3+VpFPIBhP8WHo5dHcx+hf
	8MoCYl2Wgt+sMVScwiWXwi2w3k7PH4wydI/0Did5L7s0Iz4ZhmCG45N9iUGdTi0c
	i7B02f2Zy9D8nuDJzVSKpgh1G/75+mvBuPt79nxifJ1z9yB9S6/iZYuIlpaLinYC
	8haHQw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuh2r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so4943324b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478575; x=1795083375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=;
        b=ScYSGYibeswa36F4FJajGvzmZZixTPC0INQux4zieTdEu4PZHGam3hxsoSjJ9w/ybW
         vR4RzfDk9LiHchBHRXhL90mz8qehmgd1mHT5sxakXcOy8Bg4F3bBQBkpTHUZPxHPgmay
         myNSth14+Fov0C8qNJnL0H+GTbIENAmEocZ+/O8RkZG26spHy8fyx7SLdg2MBKZZLRyx
         g8I7KJCnhCRKBddTmEP1/FP61K7LZwcy4SObPHtKg2B6uq7jIMI5oCsV9XhNp85NLXx6
         ZvPBjietASCcPZhvCrUnkRve/ppjSRr+JSF5Nd7e9pJwG8ZnWVu/VPTzLtrQ4H0mgZ//
         TEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478575; x=1795083375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=;
        b=gZJRmLX/UnktcqqI093xOkh9dnObBVBO21Yro8ZKamE/RVXEpGsUytl/SXD9o/Xghp
         gvyVaPUnVBZOT7gKXXwxnWw9JSwLJ4CG9WC6dhuPxF6lOjwSXHvPKM1A9Bqa4ZDmWWXU
         w2gMz2pb5oGeafCAHRYKiPP+e6etfMUGJXVkEjjPPK1LGK+APbXFj/SSq/fjhu/6xttb
         /Kr45cfbkTeP4DUfePs3AxUNoMZdjpoW+Aa1lOJr1WoLzXl3twa5fHDcOUtR7sDZdv3o
         gfOMFJUCu8c547wnMhe0g6TDeNHNw+bYfeHwvJWjMzLdROqTwiXi8twHLa5mtPdU+Hfs
         kYBQ==
X-Forwarded-Encrypted: i=1; AL+hErFYvFooW0GgKRyqv3x19nAIy0pPyDT6PjhRAL5GcdGladT5FrYRqKz3QHkG0nGK4xTOjGvRFSlqKhmVH861@vger.kernel.org
X-Gm-Message-State: APuU4Z/EygaNmgMNOUvAKc8MgR6CPMFwPpNsQS8pvkh4SNN4iuJCpkYo
	A2W3KHJbdIRfKMtCrNOYa3TRnR1WFw4vPLNzQ7lolBBIykNsVRjTKk4ZgNv9pp/Qdb1rhc7OxkO
	22YiaT67jRdEFbbLG4NZp4+pC3kKVnGLpgmimC+DhUm1nRGtukQ7iHnI0+dhoTIWjttp2
X-Gm-Gg: AYBFou3FNyJ10GQZy2dC3+gGOGt42kpdnZ2w2AzZoDHgISFsxv8CyLdiZ+DixsT1gKd
	flpOkUwyvR+NzeeRj5ib9500hNgjObB7hawjQNR8Wq3pr9CllyEBWx0vGCSfnPmlzV/fLaqJgBm
	FVSDbu1/LK3EaSmeqQbclFq4hLh29dDnlYc4VwNlNVxuP2sraYc1Wn6hMnCPHWzTmUau9E5xRog
	EWihrc6wh2F4KzvxgkikRIsdEAqIdXlBSAFvadev+Brkx+YIXU2BR5dMHVdzSKeDnPmPcvqSP1F
	eLhSiSm93cjNyoTfmWw4lKCgDc8Wyod1CV6AwmuKLdaZMx2TYxymQ+y79+ug3pjMMcOmI1KtraX
	CLGRleljKMvXL9fz4NYVSNTjBBSNq1ENcUnwbkxwjctXSmFEHRSsQJIyQQaN7R94khQmgX7fp/C
	A+
X-Received: by 2002:a05:6a00:1817:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8bc1d81d5e4mr5126522b3a.55.1794478575372;
        Thu, 12 Nov 2026 02:16:15 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8bc1d81d5e4mr5126492b3a.55.1794478574878;
        Thu, 12 Nov 2026 02:16:14 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:14 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:37 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur-crd: Enable HDMI output via
 PS195
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
Message-Id: <20261112-mahua-hdmi-v1-4-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=5057;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=9Z++agaaiuF5ovhrauBFDrmdWH3F4YobMbzvMcWaug8=;
 b=of6Rs2zo5YZBrdpywh4p1Gqo5OfdMOsX1fpxY3NSkVR+MhVD9+c6ZT4F9UV/Ct7SxJ3m2crTl
 MbptMIaVM+qAAvUmJv4CSsd5v9Udqrmi8U+h2JFq/HU645MVqicBy0C
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: LGPldCB19q4sxtwQ21qPt2j6lFa_VLcH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXxjIw7/lb9d2T
 4WHFPAG8Yb9L00KqJjTWswVOt6mnOYfq4Raw6zZ6/m7QO2u2wb9Zvj2+Vn7GNYWBiK/aqBDG3Bl
 w+fGZ4VU6oXUbyi8OiybGkNgPbNdprU=
X-Proofpoint-ORIG-GUID: LGPldCB19q4sxtwQ21qPt2j6lFa_VLcH
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af591f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hoTDXIFaVgMer3lSMjIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX99qDHZCkG9K3
 u39xPasF0uzH52Yfi4Ga0Ea7NpWr2lZCsyFLPRFiw4pHOx3VK6Lgbj42dRRo7Rn68gFguumAfCU
 U1i6JoTP8HKBV8u11rtzfMiUQlk79MJUrWiGGGPAELqcmuVlLKjiFHhav0k+HZuoPTiyYDXn4Wm
 qEn36gEeEBRMEYd8F1ACYvUCHNaubvFsx3QwDT3lqy9kc39vqh0eUR7OQed47dTFggWVqydbWSt
 nADo47YsUFbJtIBA43iLpJhx64KCRD17opHhuUIecfc3CwNiGbHfDKYIamg73WHyAY+Yot7TdhL
 RDTfK0uh84/wID0dvuvYbOjfGUDkYPYd4w480vA9B5aKkAeFwiaRztz2KB/OUfYcNF0uVO7NaoQ
 yQ8HFeLcdZpcIHnF6b3BKTpKA+D7GixTCG89YXPvq007mUCY8iXl754xzzQlEfRx9qD49tP1oE2
 OVWoTm3FXqG1TrBTshA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 HDMI path on Glymur CoB/SiP, Mahua and Kalambo CRDs
through their shared glymur-crd.dtsi.

Describe the bridge, connector, supplies and four-lane DP2 connection
through the USB2 QMP combo PHY. Add the GPIO126 HPD state to glymur.dtsi.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 142 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     |   6 ++
 2 files changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2ec62423ad79..87adeccaffc6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -20,6 +20,35 @@ aliases {
 		spi0 = &spi18;
 	};
 
+	hdmi-bridge {
+		compatible = "parade,ps195";
+
+		vdd09-supply = <&vreg_hdmi_0p95>;
+		vdd12-supply = <&vreg_hdmi_1p2>;
+		vdd33-supply = <&vreg_hdmi_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -63,6 +92,17 @@ switch-lid {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,glymur-pmic-glink",
 			     "qcom,pmic-glink";
@@ -142,6 +182,53 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_hdmi_0p95: regulator-hdmi-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		gpio = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <1000>;
+
+		pinctrl-0 = <&hdmi_0p95_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_1p2: regulator-hdmi-1p2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_1P2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		vin-supply = <&vreg_l18b0>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_1p2_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_3p3: regulator-hdmi-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 170 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_3p3_reg_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -545,6 +632,17 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	pinctrl-0 = <&usb2_dp_hot_plug_detect>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -826,6 +924,27 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_0p95_reg_en: hdmi-0p95-reg-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_1p2_reg_en: hdmi-1p2-reg-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_3p3_reg_en: hdmi-3p3-reg-en-state {
+		pins = "gpio170";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1035,6 +1154,29 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+		};
+	};
+};
+
 &usb_hs {
 	dr_mode = "host";
 
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..2d3f8fe2cf5d 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6793,6 +6793,12 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
+				pins = "gpio126";
+				function = "usb2_dp";
+				bias-disable;
+			};
 		};
 
 		ctcu@10001000 {

-- 
2.34.1

