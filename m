Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504673822A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 05:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264574; cv=none; b=AUYXWgeNcAV4zGJsVFxs0Wr9tpKgx0RzblYjyBktCUg1ozRLO3AnMXFtMp+O2jbMaOtKElOaArrfMCVrPicf0ynNrN38o6c9/jeNGz56OYnWMoJzXHorzG1IXWnUz4aei2H0XXuq0xwyg5nxIwfyEWZdpxb2tV/v2r1FaTkGC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264574; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VphkwoCJOLuq0GwimqXa8B3eHn6OiQEkdv7OM3duJr8hyV+QA00CW+yVJ/wOjSCufH5ZrchHrI5wMO/Kij3he1qlgXxVGqLuTG1x5WMgNt9FRMBtP4WzKyk3LgSDbnSvPPaD+IKglS6jy20PMe0NgLMZt4C/h1R4JV7hB/TIq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWV/zIxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WI9t+G5g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWV/zIxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WI9t+G5g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963ACeT2818577
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 05:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=QWV/zIxpCFh3Diwj
	Tfy9Ifet9hgHGVFEFRIhILAzfCmqR60oX65JKp1ifM04x5K4LYJu9bXxe9m0PvWX
	AQl5JCJDCbG/OZGKqqwJtW81ENuxrtB/zns0AMNMGHqOS3xjBvFIUVMazQ4ecDS3
	IABwSC2b5BAThXFDglrCvmhNFkF937wtjxIhatn3P73F0W+2fS/Qh9IXnYT9OLa0
	bDDlDNRcOON0EaI6LelGy8cwMUXHqTtG2H+dugDsQUffVAgsDTgMJX4itrB4kT1B
	8uHA+caXf8FY1Ved6YA/lIHpvuciHCStWQ4F1O1ZUTu8Nrx0DsOoOBKUxmVQxGJv
	Bt0fzg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkujd6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 05:29:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso1640227eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 22:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264571; x=1791869371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=WI9t+G5gTL9I6lgeatAXkCtUiV8watTQY2ssYijQK8HA+P2z7yCfu2+VwFqPOnjWPo
         Yuj3R4WtZ5V0iZ+JJEuUb8dwM/pJBPp1LVKWSbwjstw75a7YjroKryZcKXwR272cAgXR
         yrzbwUDbiYBM53rl/TUUpp2X+OQoKtqIW813lOQGtkn5BGyPneQ1fF0LXep2qyeTwHoy
         ezeVW+yJ+cWHIhsWjC5bCwHEAHqQpHQqA6EVrbERqeGAMMpQiNatlzLcZhRz4uLWhv+V
         MAEDtZ6bk0eoLZWIFzr//Tljth1hEAVtRqTi5UjEqfG8ZCpPtcGbGnsXN6VXc6RNvkg+
         /Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264571; x=1791869371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=y9iXADlZD1Pj+lQHxT3no6Fz9SlsMoDDwo53xHPT4x8R3WX4fuihJH9DwgdymC50d8
         o2i3kb5+b8/l3LzdI1bXFXOBCtSbiFbQ/NbRKO0w+ZrYIRQGPsi32nRtaF34Bet/mTyy
         iZ8PlhBPHEmTY1GFSrh0MC8NxXD3zNNGwcS4emMp13wKfQ2zSnu5qaboFJ0bVC9Z+gKi
         TW6fRI1V0u2AlbRA6nt0sLl/jXhD9r/8MwFVCXh02WURVny37jD5rWh5LJhhNQxLFhrV
         kckAPvSDfHomKm/+OGaoYOD2xq6gVCzLOh3VTtRJcUrsvlG9y12JmLkuebd1WcWEkkRz
         EGZQ==
X-Gm-Message-State: AFuF++kfVToaxCQ20GTm4HbA6BUPwrgBO0+8eTbn6wv8dcmwiuGCpOD1
	h5yYxnBSgKTD3+6Qyg9E2xV06KRy9D7w5pLC0X5Ghtx5iRCgCCzqJLL1uh61EwWgOyLDHLTMVWp
	tvxqMKAOi17hXEoExN0MahhHBjYn44vOrZGU5CD+WvnKbVwjEP0MpES1lijTBCscF1yq9SrBKtG
	RE
X-Gm-Gg: AYBFou1hXdfmW4tONr+MAk+xwYSP+VOFQns+rBNWaLJV110LbWk7nTRWJplM659Ecn7
	lDu87L3eWWXXEkaxzbezWx7bd6lojm6oEMpFgC2fH2clrkoAKqIe4fe5hi/P74UIBhSbfrpYCYC
	wGfuC9r/OAa1Y4AFNURBMigueVaXteJtfGJGVPYLijNe9nh89JP3W9Y7gNcudC1vxS//xAD6mQm
	zYyJF7c/w4cOJd7tPLQSw4oStGK3HRsa7iC00zOdiCANq44RwiK5mywGRrmmU/EhBUbCv3oVc+9
	3JUap9D3HH4WJ6Qx5IBd9zki0q6y5x4mvKclKBxCS1svvx9N37e/dwzrodCtq8lEmzAqh7SLuyW
	TB09GgA2bb82wM8Ci+2a6IWLxfdKzXqI1fXL9W/YQBQc7635PagdrSSQrQ9slsvlUXE7XZ5b79T
	jbMuS5sbY/JLZg3xYGpexSYQ6G875p
X-Received: by 2002:a05:7023:a83:b0:151:2e62:fe5b with SMTP id a92af1059eb24-15eca7372f4mr662336c88.22.1791264571137;
        Mon, 05 Oct 2026 22:29:31 -0700 (PDT)
X-Received: by 2002:a05:7023:a83:b0:151:2e62:fe5b with SMTP id a92af1059eb24-15eca7372f4mr662306c88.22.1791264570619;
        Mon, 05 Oct 2026 22:29:30 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:30 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:15 +0530
Subject: [PATCH v5 1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-1-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4873c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1d8q50pzhPUkK1Ps7c2J0dtz2CyXktq7
X-Proofpoint-ORIG-GUID: 1d8q50pzhPUkK1Ps7c2J0dtz2CyXktq7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX4rCg3nUFeY0b
 SWPJ6oYFY8zbESBRZzEIuMPb/XejIwQ0ttIhMNx2/TPoK85u3PQl9aqS9v8Ti/Ch0qY7G5JUbez
 vbaI4ggVjhDkt4vWEWaav3R0WpkpDaU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX23zoOjshjV4U
 evdzorre6S0mW2ToC6EK2P+s6cILIE66o7fwxDg1ElY8ZYG8g3FmmrbbLOkqzU+c2c8+auhp9gi
 qxbx4mvWCTbk1Hrz3XAIzz5uYy3o8YOQpBwy+fAaVEuLC/CEQ51xkoaZ46nxc+SsUV5wH7ov4hs
 O4Mpv2elHnbFOJjSttUXmMaVqMR9Ai8KDJ06ifUaXJphDiNiNIo3d4fa+9/e2pY5Nb3lERH8BrZ
 AutioLf74PgrjdgNcheWJBTp6lnmugKV0mdBbs8uWA2CJchm4OIjtKeKLycx/euEDoJ4ise5EPL
 WhdqTYth22OCXPIiJd2NiKYsnwtaLa4OB+tCVF6aXxG4gL8GsJP7Cax92lKMISuh2mubvrRIhBJ
 H46h6a4DCFFIYZbcJwe/uscjCdAm4B9/2AyQnyOWfwA3iUCyWtQfaOywx99qF3m1hs8oyxy7fAj
 WX1KW5nZa2Te1kT/9TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

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

