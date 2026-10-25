Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898249;
	b=m6BDEWVwDlak94pqlHQ9dzl7WWv86uanaznzuwrC0i5TZLfmCUo1u/9T2BABnItJUurY
	 G/UKsRtiMRCUQVuxhY6IPLoNmpS+A0KYkZc4U6o5Mm3pzVaK1Ayf1NZewXukq9IFSq7F8
	 uOkuJYAClY7BiQ6DmSYPw5Cbpf49iaXj8eHVfgHc5D005wyx6BQmux3AXNJSnZdN2N/mp
	 bwMMjdabKRPtH81AeQ2TtkF/alJACtL+PpY2BMl3bxxV6+bcAp9XhomVzOA+lAenNodO9
	 wG9j8KVubXDXSC+AqUfSWx0qbXqXhrGUmPU2i0e7DRcFBJHFNbCz94P8+QlOq88i/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=X1w77vsDMc7cEAD2YZlVyPrheA5sdWB9zi4WHMl1bR9nsmn8tubBZ8OxsHlsm2KuioKr
	 YnkF+pnryXKfautG/7GpshYaytkcfYjk/LYiel7ez4++ToxzVgCUsAz+KrUaMthdJQzNg
	 sWCVBj7nh7nlW3VBGGV4jzUtxiQMJNPY6WB110EBDGn29WJalHdiM6bwUVVCTLB6RvVQ9
	 XFeJDAo4u1SEv06ZUlvTHfOG/WZgUmeZ5kYT9rdjgK4GpS+CCJygnci12Ty5EsWx25nDa
	 Ke4zNH9ws/IwtdpGZnKPszsXVoXMhzXelTZQPeqrfpQa8K2ECO1HNMROR1Wzk0uOZIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SCzBh80/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqnEsjiJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B96606A328
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B96606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCzBh80/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqnEsjiJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P165OM3094755
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=SCzBh80/mzYWZPwR
	yd9O6sltFqAZzsIQLIesE0CowOho+t5yQXE6m5mFKGspS8Fi2PZ7cm7zhyNR93br
	VVz6x5pz5LK20fiwBFKqPuyPjR9EwpBLbbng1bTWb4XFIuK1FgIoCpAjwXcksiGy
	Y4Q0gh5mcEQcYm3AmQDrlCk8zHDSrAnDQlIp60mHoX+1g6l4wwrkrqj3XtruHX+U
	sez03Wp8SqJOKLVKY5uDnZ5uTGlCHNYG10IP6hz2fDWvTDvABpKYxyToOCHDRpqq
	pH7asf69nlE9oX0TN0dBCsjGl+PUj3ZWXGcowljRlCChzU/WVGWBzlhmkMSvbY9u
	rXbO9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pansn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so10033202eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898246; x=1793503046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=hqnEsjiJb2eGk6oh+WKwPWAJ+ZsyhtPjioK0Brme648BNHumSFaAQbnu3YRNRCrBgQ
         gj3CfjrS2CAPnpSSiqJ4eWPfkiEGnTKFt3FWk0bFPV2mDRfkSAr+tVqVbGjfLX2g65ap
         nPysUk07KqG9k8pEVMBOGPPZfBHLEyns1Zu85/F2Z7uMpvDp9d3alfq5Nkl+m+IPoBwg
         AvplkniiVRbq7tu643oSpXH053Y24kWa9Fu4/BbKd7lNsKaC2A5D627qOiU7BVjNpCWM
         pQXCno5WHPIZWKhK5csAaGULbjZlVJ0nSEKxYkjc37znQbqa7DGOStQPk7BXdMmFhj3x
         ULbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898246; x=1793503046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=1jpuG8c4DLy3Z7d0FalrL2GbiQM9WmTEROd3XYQLNEJKjMdgrTuwrxVV9VmPCBT3V5
         Lw3LZg8h6v/m308cwfj7OTf28t8lJGrgzscfF2oAHOaGzFB78HhjtmJH0EJ10CmC9bGP
         DumGmxvbtsmJzfXCB4mh8qQzQ5krZZzxiAzNId5oUA2jPmz/qPJFqQzYg+5QPlJlcQCE
         Oo10/lzrICV55VWrtzgsoIUD7JZ502sDxZToca95RbTgyHZYadd0YMoZN6XS6YBBKtkR
         bt/lqhBgzGllmnySwrGlfIEJ5SSh/vb6b2Ze4W9ul916FPJtJfyKrtMskYxjx4MBjTHn
         yS9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkRVL/KqAXn6lo+tl3niXum5EVuEK5QFB04LoiKXvzYzG3dxi69WblFT0yrTHUK+raZqy+uUGEI+fnkE0M@vger.kernel.org
X-Gm-Message-State: AFq9FYJyfI+dLbfQTfZ2AJHgKRPrM4MjgehGEuwuYNU5QMl6+LEgLeMB
	megsRMccNIImW2E0iOyk9Ql+RIhEeb7cWzx3BCLY0c0Ehw3Hg3IEwZ+J+kpKPwGJCR4LMOVGksU
	mIw3oI9wg1mB6GfVqKYN7vTGfGu7lH8Q0yqu6CaF3+PezMwntYCyZ7qxdi0vhSblPdq0u
X-Gm-Gg: AYBFou2l2HY2Exzmnf4iF+jqkRyyZ5hv8O99BWhxzPj3pXXoH1l4PwvswEET5J6kkeW
	zfe1HAJVniM2unqbMvKkgRATF5wiGNHVtDDr/0Z9UH4t+M5hJ1VnaFpR/45EyLX117iiEMJsWZP
	aRa6eAGdGil6dud76E3Z6wX5F+MXiBkc8pueg+WVd/DYPP9oEveDO0tEUQ/qRlk9C27Qj5yeHcA
	OwkZfEYqfyz6vJlYUOEVSAszdKVh1Y1bCie9gMfr1hZ7KCL/abhPMojenowkRoCh/DVScJ1AkfZ
	y29HLCfZuXW0vP+oxcApso8qZVBPW52oky3zMy9Avndr1dS39rAWwXMp1fMm+c0h7y8K410rr2f
	N1F3rfjESCsWHIAlnGBv0+N16DS2Ix4wDNQ5VtOQIW69LioWeKmv8jy1B7UpU4nmRX+2A3rPguJ
	bqmA0Sfm/3QQ==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536802eec.6.1792898246497;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536761eec.6.1792898245931;
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:20 -0700
Subject: [PATCH v22 01/14] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261024-kaanapali-camss-v22-1-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX3W0TeldeYHf+
 1+PInnHzZDPEbCU4qsxwotYOyQrVVij8Nd4h5npqRHYO6T7Frw/8i3pkhUm7Uu/D0/TT6MhIYrc
 OETvQFlvcD3Oj2UH6+V3h+IApH2croE=
X-Proofpoint-GUID: DbTXrvp5chff1iKgIXcS-MdDmounPEji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX3zAXTBJQ/izN
 tAiBAHU56fi8vhJ1xWagmjxzKIr5q/Kb63TUoP59Z37izB3XoPldbxPLdh3egwq/mZGzEb+NMrv
 fLdj3XY/EUtZPi1MWZVBJ/j2qXQrUkcEhPB6GhagMi0dNUMIG+QL//yidU0+zQRy4GlkTNBW3lU
 td9ixOYLGlhJ9mCYiHUDO5O4W7JAx9U0f+Mpb1TkRvHwcknwjMs1QVbAa/+nG81Y21ztgOhXUsp
 l1lfs/e1vdktQIrOQaebq7XXHTYE7XygBcDZUdFCNUNawdZpOxc0rqpZgikERrMULZ1BhH0+mf+
 d2VZNjYfET9imi83ADAgYhaF8ofMqg5VyO60dbNCjLYhbtnsHL2EwDZpQKICSomavjAj3u4d7Ik
 9gZGQSiuA5TD9evnEQcYMeIFz36+UO9RhSj910z5FbAn206XfPxUOFKnn8rAG9wMD1iaRu4Cgzh
 o9MniINf2O0ovHJrJiw==
X-Proofpoint-ORIG-GUID: DbTXrvp5chff1iKgIXcS-MdDmounPEji
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add74c7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

