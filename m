Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A053AFD04
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315349; cv=none; b=S0oDgi19X6DaIT5A/h+IQThmaOfgM3CqrnqrU7osjGuUIGhpcDXwGcm3KoK1njcggLwef1TvpzB7MSjoQbEgeX99/HqyzStv4MPxMQWrWJnc66173ID5y6aTx0WQ8uqrHei37jq36B7CHQznLLQ9uzcFgeL5CVnufbUZNs17LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315349; c=relaxed/simple;
	bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZmE1yn8P11pY2hhGElLGzYfG3JZrujKrzCQguMATVOhR7pL64wj6NZ10Zs3udnsLUh0nBB8qX0xRCPWf1AC0jB9TJc5xFhIiTVuXUduTqQGE9bnD/ybMx9TClfuCzZUSLTePjbK8GeXCWXY4z+AQlqjCEZaS9gUz9p8sjDHq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXwCeuCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ju/ur+32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXwCeuCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ju/ur+32"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z4ve4103238
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=; b=eXwCeuClcwVrUfdF
	S0nc5Skriu2MiiHEAwlysFZLXobiLR3CEGgvCuhzexgGzgUT3wR+hOwFzOupyspl
	h5z+yyOsWmsZaJgWVT+8KbkF2m+IwEk6NPBJS6UOXDqJIJbqIEiszlMZ4ObmcDPa
	ztBnzc3SMhhci2C7hn3fMeWzu/P4dpoNbCRFspLTNNogo0ysHuwP1CXnJohCCRr+
	UUu4s3kTe8BcJoktM8HQdyCV33do1f9o7hK7TakaD2/JLlt7OdszjCS9ZwuuS1D3
	XGvkMKi5r1ezt1OkhCnsuzvwi2nPOTbkr+Q8Rz7qGj2p2KSq6N4MnGzHkXLBaf3T
	4+kqsA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8u1d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so316548eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 22:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315346; x=1790920146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=Ju/ur+32MXHFUCIXWou6WyzwtdwzTfk85oaIAj7WtibZjuv3BmecMuyh7uLzHWfHge
         AThq1bC53ZPw4zJkTOmfMj8V4jE8ClEtAQD9JkdMsuXm2sS6SdKfVu0+bfpoza9JS5h4
         x+S9COg7j5qFd5mfpSNb0O9Xp5vh74oqRzL2O956wWUiQRmWIHNXOm9XQ4t6Itd0AG1Z
         DXdPHTqfRNRWtRnJSSwT4GTpZgZwlgLc+RaG/gLED3TIyD/RA/6jSIakvX+VxCSStM4I
         dlxc1M8xZNDnRte6YQMsREqspJWQbEyMNaCdOSMQzaSLLpdkd4o2n0jSJNBgkcbMs0bG
         L5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315346; x=1790920146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=r3aqKXCMWoz0l+uSmX9hscQScCXCjQbD+v/wF46lMRENKRWkVixGXMey7pWZ9Nf1hQ
         MJH+oIanulveZZaaJea1v0itEr1RvVSxcasSL08YBv5iPrD2Zuv4LADB5qCEX0WhJB9c
         XBKugGyydrc0qeVGiKtKxQSSTaV/GuDyWkdMPx7DNXPqRRou6h/y0dHhlcYfnTB/qLnJ
         8gojPdyNBrSXejZnMNwnonTrIZnMcRxYaYNqbvP0OudGR7zgxWMKszOQfH0UVdEROtPQ
         1cP/6F0gn2YRjLJRXTSjvz5TWbXUfDDbdBNvTJ/FBvy21cRXSOkMHoEGGL0qinOuivWx
         WE1w==
X-Gm-Message-State: AFuF++nKxw2aTHUshhgycfrwfB57XvpoXeOAjCp6jMXwnstXuEBtYNUM
	hHWdr1BjSfDuoa+J31OIFwi8gMwOno50z0zaVE00f8kNyu0IWJRKs1NCvSpL4l9bqx8VFXvswJU
	gKd922VaXk8LFYdZvaxPYoxu3Y+xpyKAzsWa5UerBu0PV4LcPrY2zm7XdJ4NcfzoHc0Bs
X-Gm-Gg: AYBFou0vlbesAnWxywYdCVq51eqo39DH21ak3QOC6zX5Wv6axAEbrp+zKAMoDQi92KA
	0dnWJvaKELbcCRNBSaVuZwXU1KLKuCJ12qwE854IoMgeq/46KVNnedkjrIguqmGvQkehVbf2WMW
	lsyHPNDL+nXO64nIMkxEl/hy6Pn7b98z57a+rLvE5MbMgpOa8eC7nF3fek2TbC0V86WBwxnWLON
	os7V1azHZSFGKg1mkXSbXRBqemmoVsjrvyVXuWgt6xKLVgZNH6PPX8ai1QuxJ5N3qLNXPEBLsLh
	IpzpFWwYjv3iLQeTFmIUF+1ybgL8015tLBz4rFYFoXeEIcRy5eD284cTC+ty4ToIVH3FoR1C6Nt
	79QXQtJ09tc9ivs9Z2C0/p19yYMjCG6Y=
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375311eec.21.1790315345814;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375266eec.21.1790315345128;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:45 +0530
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1088;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
 b=A5DUX7u+2gUNyMDWLrtc3eW8cxxncvqp/ZA2Ckcf7cb75bVTMAhx22/8ERa731bcbDqVnUqxF
 Y943m3d4OA8AzY5sZylsjF7ITkYLMRmu1NaHifyQ/JQISuSXYIFmgej
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX13Wv6hXKpj+k
 67lVoi2c/GEE5xFuVp0fpSyUcSxJ8VLeGUdmFK5qe2EllRoippAzWTYcDFHyCojzBZ90DOYFxKD
 toaRjs2pvbNIjW3Tx3Rzc6f3DdOGLHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfXywzSGgMFHUe1
 DOJ4k9u1mU3YnP6KiAiD673/fGU7Chur7fet8LfUFcKveUa1va//llDtmcA7n7E4NS3QLjv8a1D
 VF5GenK+GTLtCbeb2jd47l5JuYfUzweNC+tdFYSYWxJHwBGYYu6236qYWrumcVG2UCHHAj1o1ym
 fGB2br3qNhyfRR3+M60uSRvxSj5W8r0yMY3xApXbe99nr70w7PViwSa34yW7tX5C9uw51JE8vge
 yvWRKndWArlYvYnWsSD+7NgQyckK2wQUqnNU8o8x4WClPnLeLfb4SZRJ8/mM93g1axWprHHLIsV
 4f8+8QojUcwh0HlWLmsg7biGD7jqznKCmcdecXnFVgFjZ3R6x+pBdqoZYvTl4/lU4zIDRmkUYmF
 sc6yJpUVtPsqZUgCvHO6b3qATd7KVbHuzSEQsgbZhOWQeozskW2Q1wcjTnRZ41fEyxPJ7LDXtCM
 lNRFU/ziw4KdemZfS/g==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab60b53 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GarM_vGPpaxcprxHJuEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: mj3Zn9URLkbNqEi8zcfugveeVeXc6pCI
X-Proofpoint-ORIG-GUID: mj3Zn9URLkbNqEi8zcfugveeVeXc6pCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250023

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

