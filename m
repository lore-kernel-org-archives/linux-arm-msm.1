Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96563537F9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242682; cv=none; b=FNE+f2PIRbkNd2RR6e5kUrttvyNpon3itLJZtBjwvqTwhqCBKRAupcsbvOMCk2cPZclA4s1aGZPCF98adMYpWPNaJZiUiIIPVq+80xPNHZ6PcCI60JPGzRVlFn1S4VmQ/EfRyc5FwFeqR3DO6WOrFwTey3xYbozBy0wxpkGgIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242682; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGAXLdzc1gFe0Myc25RsG8BvHQw4SDFdjVbIIGcHf+guFHCyMSOBMrkX/AEUy5mGxISfEsWsRqRVibaC+zozezY0zKIkXRqtoUEUhcZ9TAN3p66z0ZYMMl4NLFhPNsv3Zmf8qvnqqe0PGu4qiGrihdWUEvfo/i4aQ6IZ0+UIU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJR4n87e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyR/J0Lt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJR4n87e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyR/J0Lt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811pumO585038
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 06:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=fJR4n87eqUAAMu0w
	dHoJjhk1y7QoSxuuUPx57GfNNBVTIg+MAa8WtGYdWIXTFMsVJI2+ZIiO+fHkJY2Z
	3lzMfu4ao33mXvpJ5GWwfn9aFGGXkKqB2C/ZQ7eTBTPK3tY8NSgBCrJ9mx9uy4qP
	qjqFtltOjR8CRWVuCWI7S1RAoyAA6YB7JBN7RCZiEra8uPGUpyos8dzC9nHTDSa4
	/76eAMAgbi9X4d7iM4vkyGGRW/7q9xAtVOWRPfP3wFqnGH0YYzua+kFgGzEVSO6j
	5sIlHZytlREX70dOOLe9tcKdhSkWJe5Y4MNRdad6mdFT0t2EotiaX8/Ja7kO+FT+
	vI0VzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx8um7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:04:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so6946085ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242679; x=1788847479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=hyR/J0LtTiisVEjKv9IE/q0fELBWk79FruPwPEfTdaXEhlGnsv/pkLlQjsqXrf17lL
         /iecLa5gMQ1rFA2CXA2JGOwCCg+FRMkW+OBYA9BBmpVDf7uReOnGHAjfV3d62F0KxPQQ
         Ya+dQJ9PKlmYoSgXxtvBTSx8i93dgs+LtyRUjQgVKrESjk6Qfm2LLG04y4Ld53Ic12ER
         +cbJEwYhrbBfyM+13sYiqA0q/kxrkz14TC8KYwNGnzdtwws3sHKrXo/Vk4E3Kv/aISsy
         sGlqxRKfrb3xvMUi8lZqDqnkQcWbwHyAI/t/z1n6pFFsiqanOR+zy++9DJj1x+/MLblI
         Icpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242679; x=1788847479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=mb3/VTro6puE2qRCx87ZLzFML+PWJKTdS0nSJHa1PDBuXMdPYDPMsg3SDnNGn8qWY4
         qpUFA0Akp9vJW0oqggiCfvCWVxNPQXxtemgF+7kcxy30l9Fin4pja0vgjWg2+56rBF6Z
         l9koLC+S6jcSDXGI3ZAqReaT7fQz9MiKj40mFBjfBbEAsdJ5x+B5vbi9KZ2kVLqwnea8
         izPZEV715qH8KUUKYrdoQ15V9/oWByNI33WPx1zbyba3TZrLOG1cNiN3lk8pVHxjfJa/
         NLRuJS9PUfVWb15PDbfbYwakDJIg1427J/DoAod+uQnUFxTCazSpqGZtT9bAsS594K1f
         0ugQ==
X-Gm-Message-State: AFuF++l0WYQCSk3NW+SMbgaG3r+Xi08R3XKh7d701Q7GaAaOxaVoPDNd
	UKnBDV3epSdIJIwJsAUc2+7795bE7xUgdMDMCPDues2LxtbgJXW+Pr4meAsspFWNIc9Jzu/IIsD
	RgaJRmcNYF5eAHE5WocZ8P2PZkfbYcPKnYbxJaY+dpL+uxgWiIF9WOyRXJws3BI5bMF5f
X-Gm-Gg: AYBFou1rDvmMBBewFgpxHly9IIi8zswHjillvkRUA6NsdUE+eCsG+TrYWjn+5BXaoTE
	iYU5eH8SHynQu0zmJhvM+NQvb9S+lLhgCxpi9TPlRy5+UWoTUFyyUwodDpUSbUbP38Hj45HiyUY
	1gEGAj3h9zP0YGSkafiGAFSwaXQexlbItKef8kupC3EzUHs85CWZx9QpxsRMTIKYWb4CkLk4TRR
	G2DRwUClv+yej0uUHrpdBghV3ginhrBRhrfoOFPcEeROc6jAkHlJIARSts7AAncxbf8z42f0cVq
	6ef1CfzBi/L4Y9OEJdwfZcEwGadu+4x0Y0Q/aR6DPgSLtmEMulWI2D8dV9EIoqO7MqIaaFuUZmT
	6RmjH3qz3twKvSFXMuVyx1rUDNO10MOvByFB+CWNbFuHzMwPjB7SO58sMDikvF18qnuLypcHxzU
	m/PX2HJvN1lk1TmcjFzX0InMxewf5rRA==
X-Received: by 2002:a17:903:98b:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2d95295bcb7mr34998735ad.20.1788242678547;
        Mon, 31 Aug 2026 23:04:38 -0700 (PDT)
X-Received: by 2002:a17:903:98b:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2d95295bcb7mr34998545ad.20.1788242678142;
        Mon, 31 Aug 2026 23:04:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:37 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:34:19 +0530
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-phy-v2-1-cc93d2f3b1bf@oss.qualcomm.com>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
In-Reply-To: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Gg68UL25d8Ad4s41Xi9gBW3BD-RIH1gu
X-Proofpoint-ORIG-GUID: Gg68UL25d8Ad4s41Xi9gBW3BD-RIH1gu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX6TKp9tgdSPWU
 Lkiy35MQ82M1DW8Mzj/1+gDcl/6aComCfgmEhX5hp45coZXMlBoZA1EmkahymcrhxLuxMkqzsGw
 QvqSPoikVEij1LQ3fSZa2pQSA28nPs8=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a966af7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX0Q5KELBYTIBY
 QzL7ZhfmX6xOWzv4taaHK6H0Xw2FMzUzH1bxeHbDJn8FMNLLocP5vBrXl0EKl7VdRxwp1iv7bZx
 PT4HIRo9MQQY1hqOyr+SMPezgNZApVPZe4ttBdpAA2vsVIYGJF+ZnVNQgCYddVz/5x5FinV6+w5
 LKIIG4XsOD66buVMU4PYAHaS2axE/PvUl9gLlp2Zc0srEskNfZpFwGUyvzfi5ukpAv7eQJA51YY
 9PUiCGeSLtx46845+LhX30D1U6OtQrJtvvcBh2p+I8whv6YXV4tEP2Y1sV0FtHTimpTAarDn7wJ
 NgAGsrn2J7yvJuVwLJk9wKrppoV76pOzLRmvtvcouCiSlBvAuEKOKafPRYO8fkwtQIk1j46nbn7
 zY+7A8mbuWuzyhUnPWX2m+rj59NjTxTlpN1puh3VWg82OxRNSa8dl4zZytcQteuLTJ37DDMwhPz
 T/ftpgqQO/AYFa386aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010052

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

