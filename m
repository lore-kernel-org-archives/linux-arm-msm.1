Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E23C0A08
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362167; cv=none; b=irzxrChyBYqoz40hVlhlYRfQKYLx1dAuKZv8ABJV6uaOBalDfOoRKuP85xYeLHY9X4OBb3m9387alxYi93peCp+pMFKfw+BxJMiMDBrKFL5tQhCDLZHoGE7yQ3n6c7rYViiToIhUcf2Vyuf0mUdPumHZMlQfaFwwyWdUwnjLYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362167; c=relaxed/simple;
	bh=ITMy3XXDdoRhBPGbOVQrXlucI2/W45zsUXuZZWnavdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCrJpkBU3RH2SZTbcgnW+1pkgTMn/1pmLN/U5SVAajmpNBYJPaw0y+brM3YRw9AsHCJ1X7jgdJTD0vFo5MQjtjpHcnVlJtQ89WkrdfHowQXlbnQsfdYyV1vjDTW++2JgJo/02B3i/VkvOrgmQbJnK9ZKkD0iBMGlDuH83/V1Pbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osfTvwyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOwVj44y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osfTvwyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOwVj44y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SDX71119428
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=; b=osfTvwyzBKQMAJZq
	2G6Uavflj0vVcaJppNiLaLPlmqLbJWPyBu1GITbU1//8ffyPy19exZWFJ+iKKfqj
	Z+dIqZsWeQTDU/Bde8nKs9gNowFTOLO2XwIzJSRiJDdbNMvMbiE2342P6LV2LwsS
	mWRMnQolW2wM/3mqNTYNbnzIKLkhbKplD8ZlVN4RpqpSiKov8oT1AjM2Yj4JNUzX
	f6FVIjmHk4Hkt6891SFqaAybrjoCXo3XRz3+uCiJPKPFsFY87KMcZVnGkdwBpKOt
	MGAfkvIfj393DhlDv0i0O6YjDRbImRCglh4vlQDCebUsSi4D0wrEfl1/5tSYhsFI
	inGl5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6sbqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930edb4362dso127326985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362162; x=1786966962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=;
        b=SOwVj44ynqc5FOVp0k4FGCvYER1X8JMj8Wrn5/fYBE3xcXa0Sj/64gbWThcYIsxcUx
         L1EFNHrBT9TOc+Kkyxlu8WXMgLYJJSxHChVse7LGdHLWgPKsPqt7BSdvlL+AADHOmMe4
         z7FNJVMKn+lTrNHW67xpH3XpKQ6YxzX5BeoIDBKUD4sQ5wY+0J9gpVJPcHjP8tcrv+0j
         9rhwV0sbifai4WQUfat28nluPsZRk0fpl3UwpF6lN+jH6a4ZPmdcytMdgwnqHD3BFUtf
         uSXEZ+Cpe3++oZgPhI7A5Qp5DCwagqMTGCCezgAd02eM+ET7rfV7i2Lo0hcwG0uL9RK+
         ojjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362162; x=1786966962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=;
        b=ibA9A3CLv3qIBhhI1yP/YDgKHVkXHq1m05uNddk4EXKlJwsnMPajelfLY1fqNyssk2
         hGnhv1g3fjb1jMcsmU/S98Lkx8GzIeCU3lGXAy9Jm9IZRfz9ENipUjiMinrlZmUWBgf/
         v7K6MHLgPInuny3byU+WLQ/Pz3NAnRQr7j9YJWHu2/J7Jm4OPemlLqCuliBnQg6eve+i
         Ge8OlKAB/OaX31JQCHJ7a0Xg2kxkRn7opmZWc4Uxdh8J2e/jCKYkwX/UdAgxzYF17J1x
         IvL2bvxRi+gqN6HBI6Qosevp8FKaKAbWacR7z3dcb9rlSBdGkdA17mEMzRriq68FMmV5
         wLgQ==
X-Gm-Message-State: AOJu0Yz4Y5k2fIJIGmRdOUKVQxBLTenomn4eqDGCYxOCuqMMRcG5McMK
	wkv4BlHhvWRTjgLC1EqvakP+cFQyasKGu3q15bLx5fjLThPgUsNzCvsj7sF7NkL0/130unVLSvx
	6wQImU/EWc/mhKQT3DiuB+9M57uZEVBQTnoUuAsqnLvtHfAcWN0nZbrGDX6t4iWkM7l1N
X-Gm-Gg: AR+sD11r8nIFqQztGuDzSOU0Fd6oMITJkgppjIv6LOBf3CS6jxPjwsWeUgQeXhHrnMH
	LZeAaYdpLXTVO9Tde0b4L71WUIaMgyrYGoSkCoEKXPbW0/c6Gkm0ygrDWFuMOCOgCGncoLTnkKW
	s4gert8KPJen1kuemDYSzY8VJBlc6sI6pq7vdxJ6j8Fok7SxXOkLqneZiIv1IXaQ5zJ07jgHpTL
	BSlw3UxfLmX7lJNL+7S9q0ox9FhSvm3kqiG8M6VbT60MUhxCqL5F6nsXx40bnvjz5lUel7Hohy1
	tLCt9fW/fXYj5Coh/j4/R6IeavK0vRobE3GjgeZma7PUUDCopld2Gbs3WwQ2gX7PkPGhs8LWSVr
	6jnC1RYfThTZZkGGAFS/fYlByoZXC+/lagtyzVl7eo40bBXHk7rMY5lrFikbLWccTIN07MlYz6R
	cb+SKDdwXvugczFQ==
X-Received: by 2002:a05:622a:53c5:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52d4be1a6fdmr9801051cf.7.1786362161958;
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:53c5:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52d4be1a6fdmr9800561cf.7.1786362161461;
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:33 +0300
Subject: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add
 MSM8974 SS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ITMy3XXDdoRhBPGbOVQrXlucI2/W45zsUXuZZWnavdw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkomTnjHcCd6nz3fUS6RNEbpdeJ0MAPF/iz0
 1xmLLF66LGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1YVBB/4sjxT6n2+RmwKxwbuq5vt2IrhORlwfQDmH6ba16857DNUAleyku2Hlaei/nxogyF8/S6C
 Tm1c+5JNCIEczvSmTzEgEBrkGDkZ4ThAP7bdKl7Um5zJRXivVsT2nlLEWeBA07S47nd0OmXMYnd
 /F6VnUiiwsd2OsIz8LnxNAzTVl2fHaQELdFykdueLilDczls+ROpmrUnfh3tUCIX/n+KRerK1Yc
 SppNhyOFPDOk88RdhraI5fFG+1NKXo1MHd6Xrw8mrQTXfLWFF6J5BrKjPFNZNtCtSreiqWr51vY
 EcqwjbADMNbEKmKeRENcfedQNz6ZnWbUgTW4sHIyGDXHyyv8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX95O9/iX9eaZX
 8iO2qznVhEB0NLmgZheywra1FYqwCSF7+AqTqOADOOy/Z4/ksrhwDe7yAc+xI4k7PDYpLFgpRrA
 3dxvgqG4gXFmdB0QTrI6mVtkCmf22A4=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79b932 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kaDxNF_GQ7L6msPqR2MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX4UzIEMxin12/
 vdFcMGkI7mx01Sfe0XOcqfMjVmarVO42X61TG70+nPxYkv0HxjQALuNP516WGWlYkjxkmgIm/P5
 QbWBdvJjdaQAf9A1T4rpI9e5jDkc57mBL/5ydj94ZRZWx9XuDVgSkPjVDZs4YVU5vXUV48yzV2r
 P2K49d1Chzs7ockY9clqLktfIyoSTJRx8hwHsav3qyNNBKzu6tPAZfbXcwY0oJwZPpaspxYD4o8
 uF0AY04LnSig5VoGGpoUvrlyHnv/kDkj/R+vS9hsNLmpgjkoF6tN/FW82YLe/Rt4ki1WIWKkkSP
 UfGc2VfdJByAY05JmkC02Xg5dDk0F1h153jEmcNdgduVr9wWNyR+yA6e/SNxnLKqhZeRVHs1ks8
 6F/4N6PO6ON/pZtEDsLQhphIrv3jE2KYkM/EfpHCKFh0jBuNgV3jpmc144bnGVFghDflcjg4HVS
 LfIegFxFdXNmcKESB/A==
X-Proofpoint-GUID: 3WbfYNE_TEDvuivmJFJfnXIRJiHwnspU
X-Proofpoint-ORIG-GUID: 3WbfYNE_TEDvuivmJFJfnXIRJiHwnspU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper contains the same QSCRATCH-controlled
SuperSpeed PHY as IPQ806x (SS_PHY_CTRL at qscratch + 0x30 with an
identical bit layout, CR protocol port for the lane registers). The
SoC-specific params differ from those specified for IPQ806x, so add new
compatible for the PHY on MSM8974.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
index 6cf5c6c06072..29cb43cf7348 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,ipq806x-usb-phy-ss
+    oneOf:
+      - const: qcom,ipq806x-usb-phy-ss
+      - const: qcom,msm8974-usb-phy-ss
 
   "#phy-cells":
     const: 0

-- 
2.47.3

