Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7E416102
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625812; cv=none; b=kw+tMeo3PipfKMllQdL5mQkFbe1JLa/y86VCJYVW2x6+AXM1SVpxAE0fxJjfd5TpsSi2SQKQTxuz0kH7vdRejhKj4yCfogBcnmBEjWEPlOwALvgma9iY6IMwEX7N5L7hq81wr4fw/hiyTrM7zhQAOMzr8sLKspWCywtoLZ13x/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625812; c=relaxed/simple;
	bh=mD9tId+Svje6Ru2zYNpqemnJExGKmm442e282hRmvzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ET9lxZfJebiIuneLhJopRNS6UxiAuDxdsTSvioESLzSfIlcdY2G/U4nH6LBZ4x8xWk8EXGf308BqA8NEHLUEAQ2StPpOUXobIC8eivf7U+D33VnGE5g0fmJCf9wa6aM1eXarW1k7t6Iiu9tZqMIZuARaQS3L0eMjGbyeoH1MRNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXUlgRwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kE/F+B4h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXUlgRwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE/F+B4h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8kgx2037530
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDrOV1sZZazMNc+kOgm5iVwMNrFnJkh1ANMkFcdLDJo=; b=iXUlgRwXcHcMLxg6
	lcy5ikpw1MDLvWOdhzjxQlOaHJwNGJ37M57SGza/JSMUcgaIeQvlDw2pGJSRNcp6
	vddTGU/YakUabjf4VrFM3wv5uBvWVs3NB5kEg4d6LnkGXhTt+mC0girtPWymRZgC
	jXxM33+wmtkAB4//8I5ajJd58CAPEd8hWQDWyRdlK22Pce/FXM2jstJL9fyIKlX5
	D6N0iy1rdv82J7ju/H6m9VoGYQhM+TW9GDN2XBeOiaP5QS9F2NYnamQs/E+RI6w1
	MZbh9wCYL6gZazw9PYlfia3xO601XwuTdrRC6S0nxPU/iV41GH5fv/BG88NYwnUY
	T5LKuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es1fwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so4545896a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784625810; x=1785230610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDrOV1sZZazMNc+kOgm5iVwMNrFnJkh1ANMkFcdLDJo=;
        b=kE/F+B4hsLQAi38/4Ij+uKcv+dzQ6GM+ESeEi02IpbSeO27wJWBuWAk7iBja5czYRK
         n/NGjVzvZaOQrispmeLtrsxyhHswn83ehMDjulngyfrRA09umevO7X6Zl1IvWAYZr2Uo
         NrwqJ70jy0p9WSERwC/WuZYeo2SDvj5GoqolM+psqAuCdzYJINaVum8E3N9Up05OBdR8
         +7pjdd4e+/Ok1D6/pFIaINttbFHgc9qX75ErzdSA0P2hxjfNIVwMKu+44nnClS4A1O7a
         vP6DP7evGLPwSzpnoithmP6PGvWB+79fFR5j+VKdXVL9OYVknx+0A4NYG34i9cwM5ZEg
         gC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625810; x=1785230610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDrOV1sZZazMNc+kOgm5iVwMNrFnJkh1ANMkFcdLDJo=;
        b=T6GsaPfIg3V9tBjnF+AwxOMLvT7qOE5xcy+Ruttnq+7dde3La8E7yIdp79IgAtf0go
         5L/0B/4p5GqpCFk5qLlFaDi29n0EzgYMwxGCOKAgqG4VL9REOG7NQO6Z32+VEqeWMaGP
         5GDHvuj5Z+uo4GkuFI+ngm/13JBCpI4YWqmHBdYrWwH+Z2o+SwbB6RqDd3bQiF20z8C2
         ing9og0VMBFGHNFY7ygfelHb0OUyb608hrvZk5bnrZ+wOscBCbvdN88YOeyYnM9SD7ex
         +wmtKZ4vbFAQt/EH5r2D2Qnhw3WNSiS0eFC0hopzKcMtqvil9TGqkpI6lJCagi4YAZfl
         hI0w==
X-Forwarded-Encrypted: i=1; AHgh+RoB1N6GmBSozoGxJcUsgLndqnFuiPCekJaWAokf4ObN5/inPXv/WGqAlicGhAduciQ+/GJugSb1B7fHMA4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6NTVTHkqqBbfP4Kho2JO3HRsGrxoDgO+7bICempY5k94mNe9
	TSnpFM6yjQ2Sh9u+wZnkEIpL+4Y7i/otqLCZxYfqgoQ1TxozBa0Q4pPbRWUnjNcCilfHhoUIlTJ
	gLqwVuX/rYbkxjBVBlYwcJMiC0UVwAJjbWw9zZNdac/j7UdGVluqp1pxGwAc5CF7aRUL4
X-Gm-Gg: AR+sD122PcXozVI1QhWkdVsRUw2fTtXZL1mWD80pFkd3L2YiTNAlcsc6XU4ikRrIRdw
	Nu2RYa3HA3FhMHQ1RudljMZDfewynRcb4jecyyT+VkSg6B8eVxSnr9evCJUW+udkercJ7R51wBl
	a1Cd5iyhtj6tGvrn14AeGO/zDDeHuk1Yx5uPMwE4WkKhGah76SbTkgjJb9lckWJuAr6Sw/DrkrN
	qIUcaOpQovJrxh0zyxAS0PFA7n42AZLvi24CTzpi66B1dQpft3CNavUQ2zOOXH2NIm+kWGQ7znD
	9H4/o43yhhxKPv9Ez3AQDMzolWny7QgpfN1mvxmK3wP/MX57Tqp7ANd2RlRt4QTlpRnhT9OHnAa
	N9CYDeWpTqCSA5fWLxpvZISjqm0yYVrlrmBK36cN21DqmLg+xkLHD9FkyDoML3zFNKLRZy0mAhw
	==
X-Received: by 2002:a17:90b:3841:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-38e4b53802emr15746109a91.6.1784625809866;
        Tue, 21 Jul 2026 02:23:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3841:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-38e4b53802emr15746079a91.6.1784625809427;
        Tue, 21 Jul 2026 02:23:29 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4801e0f3sm2308661a91.2.2026.07.21.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:23:28 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:22:33 +0800
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 x1e80100 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-devtool-v1-1-ade633accb41@oss.qualcomm.com>
References: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
In-Reply-To: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f3a92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0DGZwrxXYRw7ACnPEe0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: MpEZlu3ulth0hdEMMyzMsgiV1n-USNOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5OCBTYWx0ZWRfX9KsRXhTxeSPx
 sBXsInEYccsUMYL6Om46zXcjL35QqwCDrWBPmLVwLtnmXX2IJG3ulIe012kXyP6dlrYd/dJHZt0
 DIwuI4JV6Cl0hKYc4NXI6laiTvBrCyE8/Pn5TmXxxgs9fOnEwPIC9jhipKM4fgvB+FtDJpnZGho
 Xt8U5wN50/HHbeWSHA5hbkck3gUA+YlXHEqXzTiPqoOTbB+PvIlKiclFBy4HbI2aY55TbVR9Cwj
 wxJkTA+NxQmt2NXrd3/UX67HzCDVm9qqV/NrolMp+o60oitHRjNXQOEm1i26kJweTEt1R5qjD+c
 LI5Co7gsjgShmyFdgAHWoKfQxKIjj1rJaVYmtSDXY3ryXKNcMH+X40Zy+whTW6Nf2QTtGwbZw3j
 Dv8ETFH4HlKT2zAWd2WJLcLZTqi8Es0uq1oNka96d9xpJlRY3rAExB3IbIWBBEO7WE4Gg9xQvLy
 /ibFCzFrppn/oyYf5tA==
X-Proofpoint-ORIG-GUID: MpEZlu3ulth0hdEMMyzMsgiV1n-USNOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5OCBTYWx0ZWRfXxtbisy6AfZBD
 ISfOZazCBfN8lvJ96zI1THhVMVjqxWSdLsYa0IKB12omtYdbvhnp7ppM77s7fuQ2YR9OFELjh3a
 igNQLCcXpfXXmsVnCGrEZ5/DXAm0SFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210098

Add the compatible string for the Qualcomm X1E80100 SoC,
which is used on the Hamoa IoT EVK board.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 92c3ba6eae13dbd8a6a448057e942a08cc3a3ea7..07d6778a287631262282d75c0d233919f4241edd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:

-- 
2.43.0

