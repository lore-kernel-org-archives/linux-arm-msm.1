Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779865;
	b=hG/odzrix2B0laxn1H4/xNaJ+z9jMaDj/S42ElvKDHxLB3++0X0DzkfVv2XDWy7yi73S
	 7aURGUFZrchBA3eCn+W5XlxjeIWFZFrPbAtjzGVN2UyDXpEIrpTNndZ84JGLBIE5YfI4e
	 CuXtNZaIP1RK/6P4yI7LZK3vWR9tnO6BqhMr1VAPqbiU0g3FDauKwPQOG+5jzwxgC4rME
	 bLVKcUd8Tn7NioC4Cc78KU+NhMmXIE9yyM3fsn+IBXikj+DFF1A0tWSD5GFpuCxKx7Zxe
	 /TSt6KJj0aWeJ+nDGl4Ae6pi9bn9/8xCBgF8GPxx/HQnYtgIk9AbfHYo5xyzuAfjn+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
	b=mMwVPSe5Wl3ssx5ItQqQdpkW5NmZiwQEpPO/oqLSEAhdUtu22d0Fo9T6sNgEEvqSRT3O
	 L1eF/fMa7Yx1vZzdvT9PGv0cRJV4Wb98NUYeaitzwWqQIQv4AL3IT0SKeSuQJ2xqRzR/v
	 x02L+MGPkVpiyWyJXax7wzn6EVh/m7OG7g4WpCA4zcK689YyGF8izLQKuhDF47Vi8agoE
	 3XxKux6H5D+Jrh4Anp/Mx/YIav+q7Hpkio/64cIV1l+ygq8buBlI1Wv5/sGkSHbjW6+RX
	 IepcDr/J84CGHWFC6mJpzf+PlLklgG7QF3OYI6F8n2WxWQNWM31AZG0HJovEB6rdQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI6tTpRr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONbZeZ0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4E606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI6tTpRr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONbZeZ0H
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp7cD2268627
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=; b=FI6tTpRrl2APtsrf
	FWwkmMW5FBuOJ2srE0EuzaMzp1Hi+ZjfR5yNKUdUUmvriG/AC3BEuLbd4Irc6JvA
	ntJXUMxympMhGdUmCkxuSPtLb7duDa0+1ZhZqBoye1SIbrh4jqUwkboXutDoj0nR
	v7Lsgsu2Ep0C5zfxQvcaW80Ev66Hqyn9eo0JRDGMGvggKQzBZVR5SJzM9vd3nIyQ
	Phh48k5jSd5dNQWhmV5q5eCL7qg1Srv6NLo4aZXnM+Px5OoFtnZS9ErfxxYbBbLa
	GaYkjwhidqaLjBDhA7zsajZ7YEXDzwZzM0zTdaxoYEDIFGp/sMFGJlleBXjmbJgf
	UqSt/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhheb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so9215539a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779863; x=1796384663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=ONbZeZ0Hd57Wg2h3dlKF1qYNUpjpfvEigTgIhKNmCxt88+K67fNUApAyzoto4n7wqU
         cgxcPMu8qf7uSW3H9AIULjJQ3spM6y06MC7u9UZa2wQFXHzzUucDkmMtIYuFhv0zHFJO
         Qe1v8pSHXk8Dnp+xtN/43AGgLTz5uoCKcCZB/zNeVw6M7MwZJr43mSqfVRFGcC9DLARm
         djatmEF2p806rYvu6UvoqZSNAkrR2C58/WQXcWZIg8Ol5yA4by86waF0y5jrT9ecZ34S
         GPv0+WRdIa04m82WblVbjEuODCIrwXBLf3c+vfPzdWTZva9rLcplm8hNmlJCNWVjQXxT
         XRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779863; x=1796384663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=RzPok8r4hrGck+0ybq1HXZ7Omyg0lygdrmv7lmun+UQTJ57RTj+UzzXdRaeaml2iHd
         wKn5XRhFhTJl1x62tQbBNcHk5w2Oc9cfD7UIpwCz5ideMwXMkIzOtbsocch6zNF4Qgxm
         g9tOpujptcDvMG8Yg4ofgdx4c3Uw7Cio3AjUyVpIwVGR0vsAXp5DMZNxq4R6lPNK5A7S
         E+9xt1+Jo89WamEXVGOgF63GNmFx1BmDsfZfWeO/EBHrACOQ6OH/yS3BKIsnO7EyAJ82
         YS+tny/j2LvjjtMZs/Zgr6u/K5r/wgfgAc2wV6qzJwQeXgucsE2y7zs2VN6GNBCAr4JS
         YzdA==
X-Forwarded-Encrypted: i=1; AL+hErGVi0w5MM3vbj1jfXNkowjv0tgb7zUtNZD4pyqr4i4tlDd2pDLp5A5kr290+hYiymbF7tc2WidIuy2TBaj1@vger.kernel.org
X-Gm-Message-State: APuU4Z/BJ7HxHXFOD+NQhNigzqoIoEl6AZpF+1PSLa5PCnDP1CJNtNau
	asFS3f4t8gQybKiTiH6XidvzwY7q/ukyvCgi1HwDqQXBHfd9+i9q3uLjWc66/A9pxCX1z9gQFyX
	o3vSqr0H4xEuxSYBgdSuSQYGDrBY5cDJPr56ZaOZF3bIXRHaXifoWOjB7YP37apFO0fEQ
X-Gm-Gg: AZFdTZfoX7Yu9sjVrywGpEiZlS5SIm97k6ovSdG7zqbgcg++T5HGXXIvhgQ/rot8iV0
	G3RXYLqB6pTQoQOHCAnQlL/PQ8tkL77Oh4ChSQXb7eXSqiy6PFUb28DX/2nC3PbdWGy2ui9vEaw
	r/vJOlCtUA+SpnJxBi7xI6DIyeoTxB/5L/6wivgYfA5SOsevGNN3iKKFkw9uYcYtZ3M8hLm5Hcf
	bC46/JPWnWnbvs2QrbeokjTS+Ipk34/U3/EG7Wku2S6+cVTFdem+yWY1RgB5BMCe4DVt5e3oWrg
	ydLlp+6wBC7HLOLY0PKz/b7EjYu5WRYFmhuDaMrH4kGswo5HohH1h8r6YPrWTKF2+SXfR4/lr9j
	0fjINYv6CAXidhiDl/CBlYAZEf/LSyAoOd6AFU//KZvl0hjvGe78onMJbImpD2tc5e4u7T4hoGx
	7OywPO
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr23189356a91.63.1795779863065;
        Fri, 27 Nov 2026 03:44:23 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr23189329a91.63.1795779862628;
        Fri, 27 Nov 2026 03:44:22 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:22 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:14:02 +0530
Subject: [PATCH v6 2/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261127-hawi-maili-camss-v6-2-0f4844eb63b3@oss.qualcomm.com>
References: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
In-Reply-To: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=1527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VrCho42XU53GTqUrn16AUx0FovtMl7rE/ickbc+QQAU=;
 b=W5uq9E750RzUKhnaGzYYrCYRSi1zcSdV41r8VtcB9zOLrSDHmR229EBNX0VaZHK74x3ZUv/YG
 H/qLd+NcDIiByN4CvMriKujttm9KK3BN5LrjdhPHnwZU7c+Bx915XLv
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX2m3tg3DIMIve
 8Cmjn60WxFJBsRflXQ93VJuTW6wKfmQtw1+F0RAAibihKTVXtHW/mo7g6myRvqlWzkydr2SP1ea
 JhQ+82kbq55oarbl5PFeIh25FrrCRyY=
X-Proofpoint-ORIG-GUID: SMXDlhN9jA2Y5gHVkdopxBHuKCz4DAe7
X-Proofpoint-GUID: SMXDlhN9jA2Y5gHVkdopxBHuKCz4DAe7
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b096d17 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXwpcXDHYP8DbF
 an1PWlpgqpTcy4dPIRuKsPx1iOSTEqIB+ZiO7t/b+Q+EyBRE+XP0VENVEV9liPUWvz5FI9ja8D9
 7rE+K/qkrh5Umdop/Vk/pNbKWZFbjZdvA+G6PsMEXmB829xXhYVBEW6yyERBuut9JqMbAAxs7Ck
 gNVlGuwlfP00HVE97+dkwIcduyNioupjQzeXfoLqXgj+ozyiQ6CKqSBBjTQcr4HjcoWqHJO3tzQ
 4mZwyMhrYoFMuIQFmqsWWu4SCvcU3Edh/E3q0vF+QoDlqxZlUmo+o5BzHbmRlYFicC1eB5IroK7
 nBrPOIi1EQRBd+q1SvQkAax0Nlq+yDYYzsNlUh39n0YHJ5yeIetYKGrgJ9kRlIyHORm87b487IK
 UWDfgIrRZloEgyrbYjcpvtcJt1BXhTQimA/p+1mkNk4EkMbDyWRp1c40cRVoRnWac9Ei/4kP+8N
 sqZLmx3SfItO83TYpHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 0dc8b7859447f378282732813aa6886bdb1ea4b5..40e9a1725d57644e480c2d25a5f1c0ee7e1f5dd3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
@@ -25,6 +26,10 @@ properties:
               - qcom,glymur-csi2-phy
               - qcom,sm8450-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

