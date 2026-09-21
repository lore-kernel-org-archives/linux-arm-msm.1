Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AF494811
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991258; cv=none; b=qHHNCPjlXht5/2jg8HVEXSIgGzzdfDZTr06D/h426ytgxDnJK8SYBj3sd7wPx5m8p6YBElT3fSrg+eskjHfBE3SAwvleq5naHpS6BY/ocNqLLpfOxHPZUahGOVyAc0WqcXUYmZ0Vwgt7hF/S6pOG6C3pDTtq0jRNtdh5tXIWb4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991258; c=relaxed/simple;
	bh=+RxU989r9Dq8S90POIQ9gQkbD9kCETs1BvNYgmVIDyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEimkXaNJ4m4ympPAKQXtC3PL75wzkP/+QuvXAyQYwXyd3bVmRkCkrjSTg4ZP/gCyCOQCz7VuWHJF/Mqybk7Cf8v6fl+Hpqn8DFgN6LF9AHPtfApEFWi//+SiX0HjC+8wVnQrMNBJLDmE/bl51R2FGESfXIoAH1UwivTWTJ50g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajrgUT/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frAxrjn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajrgUT/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frAxrjn4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeDkR838010
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROMdPhV8eh7d+C9BoO4iWu0ECUiQI1dnpLtY/Sz9jRs=; b=ajrgUT/fyUixG+p8
	l9oahI/XFpSnmHG/vfZ3CCbD3yOZ/NL7u2WRXOObZGX48SCi1cB4dMcC/ID906SG
	IUvHA7QECeI+D+kgGq+PTCEsXJd636WiWcDDXGi/4SKMlNgQ19lI1BK40NnC53gJ
	E0aHRiPJe2yb0wmV1zHujYH74gFiuOmJd/eQ/uD0O37xntWm0dp7XZpnegxOIjVS
	ABvdBCqfriChS9+4C1bGS1mEShpJO8ObJ+/dLNoUP1DgbBkYT6zslkxedNu/Kyn+
	ecM4Q1Z8sJlLaAF6dkpvkrttBtpAewt+Rdv0mXWOe/4Kj6kDR+tyNj90h7dsiTAj
	jCigcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hn1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:47:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a6937513so449282085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991254; x=1790596054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROMdPhV8eh7d+C9BoO4iWu0ECUiQI1dnpLtY/Sz9jRs=;
        b=frAxrjn4ac/ScduZci/6bCcry/yEl9uDFNtLMu9/gSAGzzF6dPReL4kOxuqIm7O77V
         w4f0asRsLa4iC0vSLSok0GYrXXGn+tBSDw5qu220TzKBg5OEp6V7NHbRTcsvD1mL4TXd
         mHFQVkKY56RtkRK5O8dU3Y1MHf1x5lO8YcMACn8unHh+IllxrFJVHU53dSEkGaY6M1t0
         yrIbFrIWl9oWI4ZXLDJ4uXTAyfiFD45RjWGxIvPSi4T9Oa785xQE3UWoOn1oDoWeGvb5
         qx6iF8zMfVffjVoHQYdimF78KIavdy3+4zYCe/F52DQweqyJHEOKYtUqSqnjThM/xDTg
         x7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991254; x=1790596054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROMdPhV8eh7d+C9BoO4iWu0ECUiQI1dnpLtY/Sz9jRs=;
        b=MyK8wCzgkVN4ZrCBiuU2160OjPzw0d4PvOaJ7MBYuYgVXAbIvWPpnKiHpRDBgp82y1
         uc3NRViTrUfz3IBaT0dFTxyiEML1VzTOtJM7yUk3EH87Wnt+EdEB9ZORpF9jebwT+z59
         rdcmO9wy+GVfhQ3GHRtMFPw3wuNccAfJt8xbxO5WhA63l1qA7GfhB6coH1+op9SDbl5X
         KOf6rqMXmPlh+JeeWqXXwbtXFwnryWoJv0/2ZlBzC2ELiuEzwnQAob4QOaAZRlnaVgq0
         hCz936EH7NhDhoClbl8bDNwFQYHPkF1DyErSzIKgnIzDxNuq90muutiUx7LcsAiQY4YM
         48xg==
X-Gm-Message-State: AFuF++kJ9f8OVvj4Oyx99AZBnDVG8qVfFPq9u+EVPpW9Ev0f15pJRIYL
	RSmMWsCbeow1m2nZ05pPy906+4uHrUPZoI/LKd7ZcbGQXMVIx9E43cSpVFYdgXw9l2qgBkUh2hs
	AQs/8RfM3X6woI0rTQF0nAWGcvHC28peDr762eNjLV4C/BApI8dMmIqvr056EKSzEQSAJ
X-Gm-Gg: AYBFou215GF1s1wuiZuFvlRIalJeyhsuxED6/zRXwx8fQbQXPCJpDaOVJaCn5GOjAGN
	xn4s3QmrnJCVqzDp6+xayBgZoMmv/mtBSBTU1fNZQ43UPCUB/P8bYxdXxooYDXHqNXjT9bjPH2s
	4tSToiQIRD+WKzH06ncnI0TCNsJLfD3FRhdwph3HunpE3U41Lk5CNF42vjRcFPD3bc6CozbLhVj
	j3+oy61vPVGyknVMQNke6F1pea0tt7Aa7AchbL0YgMLO1F+iHQCGUuvDepP2hg/JglGjeqXAqHQ
	VeltFxMV6KTGpZyazcbDzp8AgMaiShMkJndm7dp09Oz/AZyeyukxZUnPL3SRIakDjj7/S2besdG
	IxhbWDGcBfeqrIxgwj1hkboNUOX4=
X-Received: by 2002:a05:620a:371d:b0:927:25f5:ee08 with SMTP id af79cd13be357-93c15ec5578mr15952385a.43.1789991253923;
        Mon, 21 Sep 2026 04:47:33 -0700 (PDT)
X-Received: by 2002:a05:620a:371d:b0:927:25f5:ee08 with SMTP id af79cd13be357-93c15ec5578mr15946285a.43.1789991253175;
        Mon, 21 Sep 2026 04:47:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm227980625e9.7.2026.09.21.04.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:47:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:47:06 +0200
Subject: [PATCH v3 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document the Nord QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-usb-phy-v3-2-68aa02b12b96@oss.qualcomm.com>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
In-Reply-To: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+RxU989r9Dq8S90POIQ9gQkbD9kCETs1BvNYgmVIDyM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsRlL1uYaQvA0U7uANR208QSEW96HJqpJ3eMx8
 BGkEPSHYxSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEZSwAKCRAFnS7L/zaE
 w6CVD/9sQ9yVu2iHNTeGaCaPVJDIYS+ReRapVbMtPCxddI2vlVwrtJuBV+eUmJOvdswWpYitmi1
 GKqBsldMRIyKO5JXogp6bvkjg2nUzujDmPMdNZSRsEx4kRAMa0FhSBuf0LwysFrdxqJyj3dLn21
 0EfLmxbNLwMeVXiSrbsS/xuI31eOWTAlNZbY1hzpR5tut5cKOtu1489TNt0tjZqK+2yHLbhrhig
 Il/XezioM/2w7IkSx/DYs0zBkRREq1J9un9fa75IrYdDvCrlQpGy6CoAb66T5HWhiNK5WsKtjwe
 5Ylu9gK0oOMkgmt36JNEOl3bdhBxkc+QjhUoHSBb78ikWn1ZGJ8CRrXqM8PBPy+oto7U4q0rIWQ
 fpLaC91D8y2dQKgn1pMY+OgBJv1xBciIhwT3uUwP/sJwCpIm7+Kxf8bCOJYmg5rtDkt/SuVuEOJ
 YVIkprxg5GB+VW5vEU6cfuhtPB+7DbItRlkPuY/vryvELQNAlSxQe3hxwtDEesXQ8xJ0/3Bb1AU
 DPyVOviySNiFeIHDDlHEFVDy4nc0xp22WxSmsRJHaRUOkwu1wTvgSRZbNT7E4ji0H847VJKsyj+
 W/8QZoLNnUaORm/I9TCOxQF6KfU85kcwyGr7ApmznJV9i40+y+udN8QCbWxfi6MA4rkZugATKo/
 DJMGvLEQnlQdu8A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab11956 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ukKPufHZZ26NhZEM1hcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: STezzvSgoRyFK9JGjzngpWxkgXR60t0M
X-Proofpoint-ORIG-GUID: STezzvSgoRyFK9JGjzngpWxkgXR60t0M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX4CjjK8dD3jgs
 iNzJUR0SmT6vOfXgzHy4hZUZnNQlNrUAKjE6Y+u7AHo671NrEEZWakacJnadFDenqaJiHeATI4P
 SvZZtBsGlXsxRTDBfJ86kGLxo0iuIA8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfXzMtC2EjXainI
 Wt//fgUoIAL+gMnfP6wUamvPdezK4/SeZE+ni46OSdXrSKlPCUhHShfYMR7yPA+yQXrY+zvuqkh
 OiYowWT6YivzFwo+pG8oX8yIeplf7MB0C6EHPTrmmCrKqCixyPeims4W/8COy7qRIEiPkOGZUdq
 6vq1TRaGGyCzFCuXAb7g5J8Av3B8DRxEbxHqXOPZBcauOdlPQvEnfHkWJBH+vIm8MO6d5p95Cly
 J1FkKGaFAPLDr/2BqX9WISCuVq1pjDnTuury6CBnmcLLILHNLfrxzgoXu6Ls57fePd6+aeMF8Cw
 aHtlf9kDUOsG3vf8Y1Fchndq5t7t6DrKSmHzP6qZuZiKTBI0JR6AfOWtxtv/PXiVr17YhjMsOGN
 y1IbgRqyo/HKy4YFhkrt4vsZnXEnpL2+xWjQO9cdQyo2f6kU4jfdTSU94ktXI+JS8icydj6ro0z
 npjJWLFhfoqFcUgUbcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210170

Add a compatible for the USB3+DP combo QMP PHY found on the Qualcomm Nord
SoC. The PHY sits behind a GDSC, so also allow (and require) power-domains
for it.

The block gets a standalone compatible rather than a fallback to an
existing one, because it is not register-compatible with any PHY already
described here. Its USB3 and DP initialisation sequences do match sm8550,
but Nord places the sub-blocks at different offsets within the PHY: it
exposes a dedicated USB3_PCS_AON region at 0x1e00, which sm8550 does not
have at all. Falling back to sm8550 - or to any other entry - would make
the driver program the wrong addresses.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 43e90995709f..13e64fe510b8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy
+          - qcom,nord-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -249,6 +250,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
               - qcom,hawi-qmp-usb3-dp-phy
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy

-- 
2.47.3

