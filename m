Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40273BB127
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623675; cv=none; b=fOhaq4CuTlhDXGsRI7LeZ6BNmX92vPF3Zo78eQwXwbEhBT+9gzuZvjEeqM8Pzdczcn1X6BK1mW5Dp094M2s3hWJAz/ZoAtZwmtz1cH3Q8N01LiQiwNPfNqvSTqfc+usT4zN+5tPXGg1N98abc3bTaQPoFxiQ/swT1mbTnxdcUfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623675; c=relaxed/simple;
	bh=NNCt0N0t41VRnKjEySgkYUHwdTuRokTpy+IVDUMSGUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlQWIV5ALOyvd6LmgfuM//LoMlyCeJrLj3DA+rHNOEiIG7FPjA2YcR/PJs8k1VFrGjuizwmdqK3nG7dpk49pe/bU22LdBZBGedIoiH1MYpw94tWxasW5K95Qa76Aamtri4rV4x/egQFkOPT6hb4FpzuBmzwAvxwq6QGdgeP3eyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzddKTau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+MJEPv7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzddKTau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+MJEPv7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6VU3D3884869
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX1
	6H7AKj3I=; b=HzddKTauOZTa1ofO2aUS+ejh+prI/PdxoaRz7djuydmYXHcCkSD
	3gL2XfKrDa5Ae3EmgBS1C1k0Ip37dTrXZURwC3owxTmUC4T4mUvnoALJK+ybaZBx
	1VYE/dEJdiq1IVBAX9/JF13lQPUg1RCkNwQ6bZ//7yiyJDES981CqgXtb1lamiRZ
	8+X2tI8wOZ5Jkn5xebnllyvG3SZqioKjJ/A2Y35VoX0wPOxpMnxVlX2/0dDiNQvk
	h/HbSpzH3BrtDYqBF4ffrCEJI9hT4T5unvJWvK/yn9PecXFSfn3AKzpfda8xtYb9
	RUBWGqxfY/WT8T1qp6ket+np0/xKWRaWWMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcbfa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:47:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so105867801cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784623672; x=1785228472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX16H7AKj3I=;
        b=P+MJEPv7qG+c3HDHhm/4BuKIAZDN4gqMNE2+j9jtB0WE+VHHHyPXr/HWUqTQarDm4S
         n5FtB3o210+yM8DuZGL2q+Ggw6xe6xCJiJfmtsUX/7IyiPyEJecaMY1wOd9GWr/dI56x
         4tbtMAJjlEIigIeowpvr++HPathr5u9EKPcEcBo81S/pkGXl2pg6FzG0o3qowIL4/cOy
         DTUG1O0WYJCG3HJnip0zkMFe+JT9BNmj+bRZkH47HW1AB8RtbKcO9JUbmYX4yllny1I3
         nu0VHKGkbvu3XaOdaqdfjJYyzZ/d/NFxkyibSJ9o+Fr4h5vZ9hTQAVQIPJjt/DBVhTOu
         zGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623672; x=1785228472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX16H7AKj3I=;
        b=Plykn1tST+qDHlvEK+hWBK98ndoMZRaIvN17Zm87ew0NVxD0/Ey9H7cp0JGLYuMgDw
         wpI4haeLJUGhXoPi0bDHoRXQo2GJncijlyFTMUG8c1sSEq1ywwbDF9wfDsuXZPS2mqp2
         1zGqfvj2rDc6J3HD179MryMzNI8kBfWFP5qT37triXFDKAlt7Qg4WP0wVewP8IsYltqr
         6tLk6wMe7y/di9QQ65yHOJ38fIG/mWrVdpQ6Dj7u4454wdh17giUJt4whO0qJgQDYTq0
         koAB6pG3oAux/KwNmsPJxBVu5qAutGa0Vv/+7bvRue6vUKN0/BEFTDEqGOfyOOI4k0bF
         QcaA==
X-Forwarded-Encrypted: i=1; AHgh+RpUt4EHkYyqMZOLuiMGxQc+qFD6NI5M8DLKjmDUEr6nUIHN9geDyFBUH0DS04YcyoRh5q+8o8kJ0lChFeZO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4z/apCL5ZLIbqIIYIVxeiV4t6eWf5Uq8xuKIaQH3mewj0yTQA
	BumJN0xG3hzK5fnmJIhq6r6Ps0T4qfqHZWa4q7d/XkO0gPLMII+wNk+O2sNmNFtVUVvWMoCUkxT
	mRyKgVXteHb+C3ZBYNQxSIwvt4ra1zm6xbAteojRXpogjQ5K5+HLJkflAkfUadzNva7AB
X-Gm-Gg: AfdE7cm1QXuvqtqFkdFE2ykB5/TS43yDj/euNfvjZ28k7UEHNIbDLrxD9BiMg3J+lwV
	kECIXmlEfM/7ObyYtWwMLiuO0IT9pG4qvckYO0egaNpz4os9gJ95BNjlWmX32f6a9NyRfii/c4U
	Nt8gG3ft7TaD3IzfU4+Viy8xdrqsmlmp8YcU+m/vS1qGqrTOpPzBG5r9hvyWmdYi8SZ+t39L2Fi
	HEl7oSwY1yIdiruOIjuEsnJUk/y+oGbAuWE3kBQvzqJ/EXA/VI3J3oGlAeiWaJ5Md9hoBfbl6/b
	ixDubk33ZINzunY4xa7mm84dM9IBv4LzBrvECXHmz+I7ArVPORcR4BfETxZAmRqEau9ePRJ+ibt
	sXc9Lr8o/b2AME6Lk
X-Received: by 2002:ac8:7dd4:0:b0:519:8998:661b with SMTP id d75a77b69052e-5213c7e6a17mr166080611cf.20.1784623671998;
        Tue, 21 Jul 2026 01:47:51 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:519:8998:661b with SMTP id d75a77b69052e-5213c7e6a17mr166080431cf.20.1784623671447;
        Tue, 21 Jul 2026 01:47:51 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm51140295e9.12.2026.07.21.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add power-domains constraints for Glymur and Kaanapali
Date: Tue, 21 Jul 2026 10:47:43 +0200
Message-ID: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NNCt0N0t41VRnKjEySgkYUHwdTuRokTpy+IVDUMSGUE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXzIuGunWDjbuXlSYES4/0RtV5uLuwxBypBZnG
 oyDfPrUvWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal8yLgAKCRDBN2bmhouD
 15TuD/4ozauPqc/fao0LAgR6c2nwoA2L9Ew9zzusxBcdeiHHquGhemKH7nxzpPZjM30Gx9X0qc8
 C+ZuoFkGv5X+PO50iJgXVjdK3fHXUegMYAb9iD9TOy/Ch6i+vjATwrOvRSPrPoDhuLfjZ6kvcl/
 Yh/ZdeI28AaAGw5ceclDIvYbgUJXCEtV+iQ3bm68qVkctv6QFm+YzCXGTf4QutGBqRbJRVi/two
 QRnsPbNpHDV3lVDh+m8dMRiGuBFPRlvy4eIAFWlwduTGp8P/uZScMMs8awoHzEnIDqQSDcEAXch
 24lgEyptMGylhQWVYBImoSt28ec6jEQkpYLUfOSt6RxaIXObV9lOTfPp+6AMaCczc6th6SFsrsn
 J3wZke78N/rnUSxO1irSfpZK0rhSziHfYMwuAHn4kkUOBBzkpIy3G0exL9LzHhij2XYnjIDfy2T
 asc/OQAPcNz2ip4V0qucH07ahRHxDfHiWdV90LUVqV+M95cDRNeB7OjgNSB5fHEHfSbAa0NfUnC
 /wHEOlzI3Qv84WlY7h4StL5QmeyDtdsIqHoHqfosVMQpxpbah6+srTePIebsAkQgBrMU8r3Diff
 7Vh3h2tiMsIAhPPJfglWkznA/Dc/sYQ+cjCkr3sAA7YZVr95NHCYBhn5l8vjimh4fPUIP+9WDfN cl5KS+Pk9at3rpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5MiBTYWx0ZWRfX4G2rL7KSjzQC
 BDf/pJShRVgC35XjgpBI9hY3i+jF1Xkzi1aCCmHaL+jD3ZqOjgv14ymEAGVwYHiw0tGS3EDhe1v
 vt51BmcivHj3j/Q5hsrt250TSH+6YTE=
X-Proofpoint-GUID: yHNPjSQYH7ba7yd4s5L02vci6vry_dmH
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f3238 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qxqRFaZUwwWtHnsma1AA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yHNPjSQYH7ba7yd4s5L02vci6vry_dmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5MiBTYWx0ZWRfX5BWEVG/Pezpn
 LSPPhKNWAddl+O+d1X+4qTS9n6ZUEMvWo9Q2y6YwsQFnW8/JWLApOvZTq0jM+pkDkqQY4qUQkfl
 damEtEjNDp5g/oGRLsqZKWPQW+QQXTRhW8cuCwOj0Cfvbl5mhtkMXBu1B40C/v2y4FClRoRl69b
 DrapGVkQtyic/34z5tnEe9ToS8Z7a95viyOf/2T6zGJvHwnW+JYPoEJ+1qa1RNpOlaKY4k3PPs2
 uJFMDTaJPNdWMjRHUaDSt1m6AO7ZW0bipQkv3rIsBkH6gJYErAE+H8DdlDAFOZx17Ae4HBieMgU
 q0xbl8FzAJfgWgKVCMd4Bxn/Fri7A+WojaIk65l+eO7SrMeEqiHaM4eU1neUYUxhFi5orZjrCxF
 ukiCRJ7+vvFYrNd3sTPb+ZOxWKSBsIhyKfEATXaiXrhgdjeGxXXqgvSifglDSo6gdlCLwtUJNQC
 xpMbsxePkWcVSvTrFRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210092

Add missing constraints in "if:then:" block for power-domains on ADSP
and CDSP of Glymur and Kaanapali Qualcomm SoCs (rest of flexible blocks
were constrained already).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2a4c527552e6..b6bd37e4b8c5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -232,6 +232,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,x1e80100-adsp-pas
@@ -269,6 +271,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cdsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.53.0

