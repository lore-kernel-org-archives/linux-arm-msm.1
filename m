Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36B3E95AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583502; cv=none; b=JZpul9zfK/aZVrINBk/Ig2clNtTxSqkqeUWGQ2y7b3ahd2HGHevxXFdBRd6UfEN+8CGsvCTT/5CjcrWjpf0gKoje7TfZYBNeJhVZGY2SyHZR+NgOIjAbaDzdTZWZH5sirsVtNCaAB/gBsnJGNVBv0Y809nrQSmJWHIc5zTY24YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583502; c=relaxed/simple;
	bh=jWHYzbhxv048EpoHMPucxf3ZgNESqyJpXsdJoCbLYbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn90FyTDad7knK2ZxU7EIR07AlQVC0FCQW56okY8d0Wl5iH1HikY44za+3E87pWLDbaCQE/mMhPFQoPRTNDJxnWYXs8WOn601jGgjAYrY2xzXBc6GeFy9WEuoSzFCts/qTvIObAWtvTN1QtiQbSa6VniLqMJv1T1uBTUwbgkcBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRF0H3hJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgRfSM5Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRF0H3hJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgRfSM5Q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeFnV2470128
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 18:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jIxQ5Y/e4moaQ2XFAjQT+FXkhb//3C4hiLXRFU2mKM=; b=eRF0H3hJ/BmErKd+
	aP8uQWcUBUFFdkGGyXjFU88qd+VYUtHUl/zR/Qi21+Tr/5/hibz9tW71UkLVpsta
	xMHPTxMiEyCtJxV7DbzC3TtVWOseitZS24MqG00azDvslhFKUa90hJZnsOZ7QXEP
	kurnJnfQ3VBfOagR0SYmaSXcNA3Cwp2TnRWb6gxW2nsZKdXjGLzMGYIu3ULjKTco
	U0zEF0UduOLaLzYTz+2cpPhqeptoiJi/qJemCskJviWhrR/QmVHO2jxquvSUFXcJ
	qpMKRUGvuJ6JkepdMLdwXEd7k1dfpEGS7tOsfbJqbCMc1UA2NKyRW6cyEiqRIYcf
	Ic4nKg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn51sf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 18:31:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c964739454so5880661e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583475; x=1790188275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jIxQ5Y/e4moaQ2XFAjQT+FXkhb//3C4hiLXRFU2mKM=;
        b=MgRfSM5Q9GZnwuQ5acF1Y0tQSlTzSylbsZDQjcUii6Fod7Snf/XmXz7WMbEKHH97SS
         AQhKBJsUROANLC3p5FhCIhvtL22+KLIqkigToyKHRdTPAUn05tD69VGfBQwlcFbEeuIS
         wQ7fALZIcLNMqG5cKn5Xz8RqMeqEW8XXGmgqhMxyyfGUV2KvEJmzFrx6CbC1pCBI4HF0
         9QODawzl8i6JN8hr0mfvc9UpyVy74RaPkZTJ+eXeIuIy3p3msSDjyZqhJHACZXAaxAcg
         f9U0X76U8NZyg8cJhPEHbAVBV3LYLrWaVTcZUG11rSVB36TrWKvW6H1bUhTOxzhQkuj/
         Md7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583475; x=1790188275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jIxQ5Y/e4moaQ2XFAjQT+FXkhb//3C4hiLXRFU2mKM=;
        b=HzmIx3/9JlcLX55/Foqvpx3O23kdMBbCZP1PvdcM7V2v6VXZ7q3aAZm8fVL9jZ1tEF
         9YZA5+rb6rk1YPxAwT0UbAxIsqhZPXj/6N17jIbb/C27ItdYviRHdxlPBw3FdgfDeG99
         r/FIJZIcYRj5LB0pJgePSNX9Ko4w+eSzXI6zFgg82sCksJ4DGklcTUov+ew8QgC1u9e0
         j1cU/KdLzTphJefuMs/zoUGhQHN7imDEY5BMOMU9qWOEUQptxElnR5E4TYumJKcnPdUW
         0ODmDYa3w62/oDxbSvFqVQu8GL+CEPxCoiaylmyKIcEoyaluSAXPsg2CyulWof7nAxke
         /sQw==
X-Gm-Message-State: AFuF++mzqAv+BRtI2M0d3aWkUiNRnyGh/SDBniAmIv9Fjh5KUJINh96G
	rSBLNFYZZc4TmwGC0fHjxrcqlqstoSJaBsGQ0RGJ2jj/+2QmbTOP4MPtFczdMl3oANYfb0v23yP
	sx9BsvzcMYHDZLyehYBuqdffdPNF1rlLPSlMeRMY/bMk9T90dC9sFWtgoxg2ShxggmERX
X-Gm-Gg: AYBFou3YbVOsBJcWmWlTYWvpu3+whP0tvvkga2tk71re9BUMeC3uOS/P5ElrmmRo/sP
	bkZoYDjyCp0XQc+cHNz4OfBsEru4TKDV4MPkYi1+8OYXsAupM9prKMwOwCefd30JjVTwsWYG7n5
	antva1meNYJjgU+QmtLoXMU64+HHoUfCu4+IhKZox5OxMgsvGjHspaVoZWd8U7Wlvd85WhgKPXy
	6IJHXHMpkSanqbZbXYuS1KRhI3vPMpC6ajxNIz2FWxB3tX8eE+Z3FsmB+JXlGvpxU0Z6O39L2wl
	sQw5StxYhQsa4KhT4j3m/O4y6VFVedX2BC2DBWZu6Lty+KVz37s21g2R8oV33s1shtac0y+2NGK
	wRHaM/kpjVkuL/0UYSHBWtMruW3g=
X-Received: by 2002:a05:6122:3a07:b0:5c9:a60c:2731 with SMTP id 71dfb90a1353d-5c9a62dd8ddmr101513e0c.9.1789583475268;
        Wed, 16 Sep 2026 11:31:15 -0700 (PDT)
X-Received: by 2002:a05:6122:3a07:b0:5c9:a60c:2731 with SMTP id 71dfb90a1353d-5c9a62dd8ddmr101491e0c.9.1789583474885;
        Wed, 16 Sep 2026 11:31:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:52 +0200
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document the Nord QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-usb-phy-v2-2-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
In-Reply-To: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jWHYzbhxv048EpoHMPucxf3ZgNESqyJpXsdJoCbLYbs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBo01l5GfD/Oay4Acvv0FePBQFWTeqkshVdO
 f8JWoh6ZQOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgaAAKCRAFnS7L/zaE
 wyjvD/9meUVZs+mBOnOuTKeJ9ibjUoKZDiaud7ut02pAzWq2Dyw8fhEqPHM9fhJK8Ksb4+SH7WU
 1DqFEXV0QHZ13t1373nM+xw1RN68gynWRR9CkEMbBJQinc2fSxeeuIVG8tWQtuGwpZTE8KlMlNl
 +pA606HTkBY5qM+MKe48ysMJwTHQIKsYgsj9D57UpSM4t9XDrvt23DMbZ+ok3buSoQTxYfHFtzr
 w0PivZrWREkglzOpfetCw7jXGeo1YdNWXmwgXSiRu+JPFMyBD7yUHNf1xc5g5nXc6dg1vNmFG+L
 lAhiOSyHraIr4cZI4sgesM8FBgt5UTbLtUnZQhT+9BHqu1ag/gLoayg46jo1eYC1Ag/iHmEBWKO
 7ZlGjJ8RUPnhPv33VUbTWObXlOeR086wTokVFoF3K53ndFGeSUc9znGpt73CcvbLkJzkPjsMsMO
 Hu12NaAIuXnjWX8m4GGAwce2EF4Cderf3O19I3+w1XSghCs1HcAOZRRonalwFhxyNg9KpW+RyZO
 RkOAQwC9nbFRxfavGZZmD/xeleLkP3H584iPS+C2ljwpLW72g+WmJvtbAwDUE24JoKOtPYWxpEr
 EFAk5tsl4KsE8ovdbpfX0chwrTS7BoShw+xrqYyn5LiXSDa9lOr9B3DL0zWeh6VTvC4sQMkT7bv
 6gcvsXnCMXBU3vQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX61sjzj/WD2Hn
 7jhZtu9o7dujbSfU5FJSlYkDTd2xmb3lgBODQoZgcNTO6Tvh9swKBJbFgzwLEadKbYmA+8QMP0c
 9qWClPnPnieZN1i5dEVC1JXm3EN0FIsxj407Qr9dkj5z1TTeN38Ax7fsu3m6Ykk3Xlivg38y4YJ
 +/7b5cURdlgOtFyHOaNuRP3XeN+v146Jm6Y7GHlPYYoaM2QmN5uBEYOXuUQdR9+wzegBa8DsDml
 NRR7p05Ybo63VoS/YwE0X+bE6doJIUmaQgTStzcqVg6mPWtCmy/kgmUpHs4uAZZQtrYXMPvOH+5
 5dALNfumwvkUB7FaGZfTg5h9R3sdPrkia07IzILaf4Lxqj8OH09nqQgahfNR2dCCdd1nkmL6HSl
 3MS+4cmoPO/vYoU6T8E82yN2AzOmFJO4WJEa3LzNbVzugE3PeQb/a9oxvJpDC95diO/ZnDOYDt2
 7Fik6sYm2zOzf89X29w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX8O5bRNSGkvFa
 s3YJ+zbopx366wdS87nAmRSB+Ij1Fn+x9PD78Y8DAe9S44BBaZMf0Vuf4MPV/ILyzRnHst7q43s
 W3R0W/KQ7Uj1/xs0p4YqqNZHypj56p8=
X-Proofpoint-ORIG-GUID: ZI6jNBX3noC9diJwP50S8zveCCkNJD0j
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaae073 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ukKPufHZZ26NhZEM1hcA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: ZI6jNBX3noC9diJwP50S8zveCCkNJD0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

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
index 43e90995709f97c6c0af093e6b76367f419d41b9..13e64fe510b8f4218bc11e1c92e87ab3b02d5ba8 100644
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

