Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768181;
	b=MyzG1lEGi9+YBHONO0bjX45rN2H6ioZpsDymmRIfhMziWCcQA9azPNEea+XK+R0O6cIH
	 jnXzABvalZ5lxpmri3mS34XG5I38QYI8NY5084YLK7nkh4ke0TqMeMiPZSZla9J0JEpA6
	 qxh4GMBaNEr92wVgY6Oizd4DHkmkni+3fC7Yg+xhfXAGY+XNpZHfZBiu337j51n0VcsLA
	 kkvDc05U7DIeMk6VzjmTI8LX5+qkt9V2e5jKQRNScq6VjYFtlEagzVSeeg3sj7XKgO4XJ
	 2qf6cnmveOqPvo4Hs9jD8+Uilyl/gaREqAlRF8dXvRpKGGwkoMSMy2BS0sneE46dNOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
	b=m7AD+BsQLyZEPT7JiCiOYZDykmpeAi8gcZbU4Eu5wRt7qErFtVuNoGlcPru1Ou2z5YrX
	 TMbFqt5yRXYaWiYYlmtv7wxWI/ZP770xwksubuHChugJOyuzrQ0lNCzsRunCngxfWAE6d
	 jv/W9TaBvxQsqK6ZtbvkQCTWu0jKjdN7AUrJx/waXcDiQmNaDXChvPC5u6yIzVwtImftR
	 GO/76EyXIQ+HFpRbKqRyDTVWmEu4Pm/5LSZ9Gh+2h0OY+t3x+0MQ2sTKDK+jqQrXnALH1
	 q9x6d8l/4jXNpAvcorogazaWnfifIgH/dggr70Ri6xVUC0Ml0SSd48Wg8KeTAoSDF7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbU691Rk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B6606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6B6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbU691Rk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DmM2462625
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=n7W5gKdsJEkKaidU
	m27qhM9bZMOjL2rv3vx+3p+Ap1EM//wf+CHUjzMKsTBeSTUsNv2+2P6Z7N25EM4Y
	2zI/aZ//IhxJokKwWv1QjCU/JKh0HbeKcETCWtCoGzqoeSe5ov2v8dXEUN0S/Kpz
	5302ifNKU4bVYdRK7URyFJX6pzxJ+B5T5vMfZJ7mquolTklbUSMWHIPqoLJtIfUs
	F4NVJjUFd7ZPKFZ+8ZsuknSKYk5yAujl/Ue/9FCWmtWPTITSZU9wo6PpLDbmuI3/
	lkYEo0QcIM2cvtp4K+oZWI+8QritfBG2dj4PxB4EGNsUT7THzlFMcud2YHo9owLD
	S/C6SQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtv9mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b206156cc6so884392137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768180; x=1793372980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=UbU691Rk3CW7S2US098bbPuGWPmJhAzo6WssylcBNjTwiU1VDUbLZPRPrLt1dos05z
         bEepuAm1d9CBGKe+iy55g11yiLxYPbOV8l7QiJvzJRrBY+8jdlAsG6rTgOA6Pvmb9LsF
         X9EUAXIg95+8atNPRSofbXVlfVs8k4UoU5vEasL3vrNYPKUuLd2RyP+0Z6tCMT8pHBMR
         HQj90owD6CPbxVFfDxg8bLpvL2fZ/JL9A8VcSJ1whBSK+iza0l6Y46y+wAuhIR7iD2yD
         RavT8x3YiCJShU1lDyxtUMoxKNbh3Ywvj3oCZGZ8aUrGjJLOXlIkTfxhWc5VZOy/JyP0
         ASRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768180; x=1793372980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=hAMQt6quPIybwwgPUhuO7SXtJwsTjVNurifoVfPbLcszAJPeILcQEVzPw3gSTooqCr
         uVs74vthoexZjDwJXol4Sqfcel37MzuzDqwtkwUnEQQ/AC4fHDLGAkLKPapmot/w0X1G
         7fM/NOsLDJ/F3gh/R/oSx3nT3eP7UuI/S36jm5Vt5mLP8Iv1lTDOHnKZXB2ki7US4gce
         MJD6ghaz4/NdRquAvEPZ4DNc6RZ852NwEujwm6cj4A5yqjSpt2yy5y+YdFiHhLYipccF
         wr5H8vbZ/2aGf22DgKae+ZNCkqFxFqMzi2VrHdjLS2BStzq3kXUhJqkmjV++ZPGMEXqO
         /lAg==
X-Forwarded-Encrypted: i=1; AKwUvBy2zK1wCXV3AClPUwhsqFUpM5PEIrv004+dvglIgWwQDsAOM45x8Vvk1yjHk0elrPqwFYtT8TSA0bVQnkWf@vger.kernel.org
X-Gm-Message-State: AFq9FYKvHnZei5UH3JDUTde6xUSg2RokmlhmjJesKzT0097oEADhc5g2
	qIkMVBPJzTDKHJY4OBWq5lTKxXvoBHO4oUp962gHyE3s5ULTid/YkSKd/XCjEvY7HGQrohOkWRG
	XhThzbYol5Nhv9MoWI7AVU0ztTn48VeTpGQz/UCCjYWdEsM68Tms4RBr2BFnIbsNubvBh
X-Gm-Gg: AYBFou1bBcHPNXqzgqiMK7kullCCxZSbIQb5J3DF/LGVNzro1PWNdU4rgt8gt54HF15
	/KklhXl25UzWvRme6tHwBxM1IrOo2KCuAoKJdeMZl4W+QwxmgfBEiK+1Ol2OAZiD/Wd3xnehHY9
	LgPpo3uYUffcnBZq2rWdMkghZb5tSuXOHtP30FK2oABdFLXVdnUAfKCEBgLjYAC3Zhom9VXqgWY
	EQhToYyHBhJFCvKE07Z0EqV/QvQqsMMbl52nl3OxyjYgCvYvGsxb22EXIyhmfrPrVidV+Z7n0J5
	zrpl3TGkJShUM/DdSSpRvfx04N9O9H+b7g1+A0neHMH3MO880q4qeZIGFAiH4PhrourP71bIOOE
	Xc8dGskeKr+m4nDd+tLL/M1IJpsthYSrBAFQZxHpXwWT8wHkAjgKvrT+S3vX+xtYLPWW4vu3Dri
	Kyo67021iWxzDUpHFGdlXjeM6G4yTfmVzl6S9qBnRiOXsbsn+wi7M=
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042192137.14.1792768179530;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042170137.14.1792768179077;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:14 +0200
Subject: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb78b4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: qS-T-zDb5cpYHr4M9FpziNJKBCAv56cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX6zq5Svu0DOlD
 tyN47ciuPVp2T6IVQpZdE3M8u1pzLv3xdNHfUKsEr04AobIHXniS1ldZRqk7Tza8OuIf2zl91MW
 pRuNwVvIhTrBvrUfc9hzmHWw8kT4qle3Tq1W9IRQfSn80tvl+c83LW1fd8dGnSj1o2+86h4ZXRf
 1/KtBM9urLGQYnCt0zzEau4vQkKRXZVh2U5DDviYTBwwtn3sUm3FJnAgaALSC4pjCRl+J5waV/C
 YkLNt4tXwM+r2vOEw9SY7U6Ryz9QJ08voSXI+t0zbatJlbdhXbj6fD/lC9z09JWaObRQMfsle56
 u8Bcl77ra5XjrY566UbHdE0yvwvjARhizsqu9q9MVK1ROln9y+rPqSe8wx1mJSkKwdKvJhRLnfB
 P2S5RAC4IrTjieBZ0LejSaphFZmQab2Y0TrsjC6CBpLRjJOp5zBY6OQm22Be2Lk0DszOaBr56py
 dek8bJ1Qk4Z8TlJJY1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX1hSWV/hpqKLY
 awivCrZjlNBB4DRwhJb+Nr/frEob2Aeysf9PpNwOLWjivXjO9JBdec3RN7QTV7qb/KprRMi0x5x
 weEwVH53oPMWVcBSW6kG6ViXXKNZtnk=
X-Proofpoint-ORIG-GUID: qS-T-zDb5cpYHr4M9FpziNJKBCAv56cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

