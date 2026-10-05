Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72135B136
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182218; cv=none; b=bVMsa+gOrZvmGnX2w3IXHYB7UMx5seyrlCH1T/ehuBpzRvCNPDcRXUMLCnBhrUsMlvLfF27f9IFfPBZ/N6gomLvdRdADIkzxmXx51NkRYE4eD2HFrWj9yWhtZhHgPHhlEoKMKXcA6V/m/p2a0GZceKijMx0r1MrR1Pi86fsIyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182218; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZQO0SoRTs34kHp5D2zQ2ATl8Imx/CnIL4SpTJ4bf4Ene/QyRdfKupP0Jzv7GzhbRKYGGpXh3Q6UwqGl3AOUeDYAVqvdUMYzr76gCsQywm8H2fmcB6YkFfViWTBFWmQitDJdNk7ZLTwxjscHBxZAkMBJqgMnF0nEJK+UdTwnBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6+2YKub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2g8ahZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6+2YKub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2g8ahZu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103aD1464832
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=W6+2YKub+dtcgsKC
	60NutTAwRP/Nb+CSNv8ouCZN+D8Fn1acPogtffbmu/BelSgz4J1sktd2EVrpT7+3
	A1MnZNeF/6waJNF1fHEloBtS0MKPHk1JSTWbyxChd96V4s4ql5G586ufXf7UbWEJ
	1z9GRzJ0anWJMVrXLIGwLJB+HkfI5PMhUoDVlngvinDELctt1mCck186vDBpAo/Q
	jTCTQMNaOYimapBq1eyjAcN1NwtgJ0yUpRG1SnTbJrqlf91N+c5wScJLkixkZL5D
	+BV70zSB90LsjAf7S6meQHK0ffwn0AQbYdlbZBkIFpsoOBNm7lVVYVj0+jzvVMtR
	sNYEvQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssmpxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:36:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1493b09d6bbso847702c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182216; x=1791787016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=O2g8ahZuM2Vi1Qogy/J8kJqGFzaH3KBDeXqbtb8E7CfxdlAM+AcQ64sIKG4Bby30As
         RIYcUd6qhAQBPsLXxneanL0m/2TWfrEmKrcHxPLFsopzGlITDAbz5qAY95U1bXq7nV1v
         jVXOMY+qCRhIZVW4IRX1kneyxsfddAXFNR+IZf7ObKhVABPs5s0XAL8GkM87gzl6/pUt
         3NW4cJuUsllHKA2ZBrEBiS/tWei6+nG5HM8HyCu7hkJbkCt5gLw5+esCIIWIAeIBlGzL
         FLOUErC7Wj4lK72I11+vAPXrETuGqhmWgQ1VkjdqgFSfPYQCuOf6nr/UTKM+023aHjlB
         NE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182216; x=1791787016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=x4d81MnZGSPxocNmJDT6aCX5ObUO+Sa4nUtszC4pupNfaLhgEwm0cYeKgulXNfSRKj
         +WyJlMhh8HP2CMjVQ1goEBZRAKklrt6UHDpOwMxCmJZj7WT6N2ggZHsxVPey8uconXjn
         H8q7MGJCUkhAQS+eXwmcOyeq+N30oHFAJbMmvNALqbgJ8FtyJTpNX+EVb2PAVPHWTPWR
         T+mnjzeKaVCjlRDphmOKFjqeprFBItCQxC9FzCqQInzMmHFHL/boZ5+mwk1ebJzUwSxo
         1aQxak6p8/9ajqFbwFigro6y/slmfanWL5t+F3mQ6nNcVpMjwciAkIfRK9YDr4JlbgMn
         +jzw==
X-Gm-Message-State: AFuF++lbtaLuPl3oQJ/MDYpUDe08MIPgFEt6Kx9pjsz1vLUyxHJX3o9a
	wuEib5Nd/aGbw33nYMmo4crm3Ws1x/fY4zx4+SD54VZYbDuDTfNlccTKAwhkdeilLv6ROEZk2LB
	XQUDsLGw5uA0C8aLUWHU2onynLiIB3kdNGz8jAWfjGpu2Zw9eqHKJ1OP9Gwr3CR2YEvRy
X-Gm-Gg: AYBFou0raSSqzw2v8Db8VpCdKiHuza8lk5uHjhZcJWiBZO9ufY9ABzmR2MVueuY970k
	ou5o5/qfV7Cx++N3fUnim2Ftsnxcqjk5o0E9+uWDShjdaDkVdANsUjzFDGq2wyWNW74HVH/lptz
	OOvuZbpqjfEyVEESgvz+HZ+QhPSCesWRHJaGpuF2UB+bLSSdbiYVG84VWaCfimn3nkZYuIWXl7x
	H04Ol07oVRA3YfMRRXcEQZQxZ/VoP/igbghXlOe4rA/usfGxCeI+iOgTvfy/uBEAeGGp9O0qZhx
	fBTnlpSVEXAEx57UusrgrU1QUc3c3bFVoctVGbj5yCrEd0Ou2tihFwH/FsuljvABnOMY2mrmVGr
	q1SvNA5f0C//JGJvRbWCl7IQrif+9DR2aT9rQfYGVfsTe/KBTZewsA1iiemaRL8E3UoNrcBoSAt
	SqUHOOkQ4HuGc71H1D4c/XqV19rXuT
X-Received: by 2002:a05:7022:7e0c:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-14f5bff5f14mr13474736c88.29.1791182215625;
        Sun, 04 Oct 2026 23:36:55 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0c:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-14f5bff5f14mr13474707c88.29.1791182215094;
        Sun, 04 Oct 2026 23:36:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:36:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:26 +0530
Subject: [PATCH v4 1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-1-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX0Z/8sdx1Ds9A
 4l0T5JVp2AsTuV8L8bpYzLG8BUnLoRBkC4FwZi8MMdrQ0jHlKlhvYCF9JkVgGqCU+8sxuqeFtrV
 OAjeeOKVHAu8LYFDt1AYV5vSp7x/hro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX9uoBIoKv53mD
 4eDSN/it0V4zEmEYjxEaOkjZpkj6jW7A887lUSMGWuCoIi/XLX5vGKsV77sFsNd2yj1TCTbQPuX
 D6DX71KwV2WQmmP8XSt4WdFr0lqznDouOfHka2lFFuHo0wFLaCwzHBVDqFgDC+Kotpmfzng2cAj
 8WlonUaGx7Tm15HZG6eShJChlAXrDigyyjZwpl23umVtgrneoalQRU/WHK4zhJlIrNErIAdZBy7
 H2E2R+E7xHe6C/fEYj/rdbfeYGvlhn9/GdYe4deRKAdO/fIVIZU4SP5bE8fldesFwPF0E/gGH9U
 smx11hjuDnMwwQJXA7xVl8WRjNSDPlzf8tcnforM5iq+5mXiv0gS4/48eM/vPSbgDml151YmPln
 89xWdkK5hDaGs0RZA1Mg6sU/4RNBkInx3O8V1wAQRgqN78vgGK+9GXW92z+PbStZ45IEpPQa9Iy
 mfgHlwrJ0123sH2VnuA==
X-Proofpoint-GUID: 5l8g_ZeUccM1eJexZgj4I9K4NB1Slsy7
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac34588 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 5l8g_ZeUccM1eJexZgj4I9K4NB1Slsy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

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

