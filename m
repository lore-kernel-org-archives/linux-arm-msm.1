Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5151355A
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677900; cv=none; b=B918Y75NEtxwT7u5WD72G4ULwK4ub+BMeItJeo3tn62cgSS2shu0APkZ0H8HLS09dyE6N7l4tIqNubk6Tg6PIQXJlSn5L0VR4eYXTh11TiXEfJvKOmVdex+rw0JpcFeanWGgL+14rHHI5ovHb4Hv4MgWfbO5FEOQjX1sjiyx0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677900; c=relaxed/simple;
	bh=BrnO3ltS6NV4yLZtRHYLLWfpk7ArO8G+eEJqckc1+jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSFoh4385lFh2BGcYruRI/Z8L6tyslOsbpEB1TSpTGKWSpJVX7kPnMcuR547ftJdo6Jq5ILMfgfF535FrrSL8CQRUDjFwNBHxEBFs9b28HNYiEg1Jbg8+2CCPuw07tEXWdjRnSgKQ7ickPTzdUz2F6F3HOkzrnVoSMNNisbkMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3i2SMJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJo+zuVD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3i2SMJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJo+zuVD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T9lcut3437100
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=; b=U3i2SMJsAl7uJ+W+
	pt7ZhXzXjgbPcQSMJqBB1E9OZWeoQj91SLYBR915h50+cG8yzg9oXdE37OBdZmjS
	r/saB70hsbGJBO8Ad9+8m3tiVAlZpz6ELXQNzWVxkq0VMGtNu252Wz5CKpMqS15G
	uY0LTFe5v0zU2Hm08ifhKjbhrMvwACaJVnXz2ux48t0dG+Btdn/E8ytRO8l0/2+6
	Q5xy+LQuW1flJ6Nag3V/3zvADn0zwWEL47BintFK6FW4C5uwXTNLlyIwtlttJChU
	M5whmfI83Ogvfmn7nK2UQzjzv3G2iGxu4e96BiUYJuUfXuD2cVONb4pojrhThs69
	KFF5cQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v85qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso3706029a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677893; x=1791282693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=;
        b=BJo+zuVD6frneqN98in1ktjZzyt5Px/yng+gdPx6s5d3fF6fa9LC4XETdgozf2mM0B
         qhEIa7sfswCLzIF2/rtfSpnWtJumYOt3AWBXwgUVHuMRnMi0TcDpdhGAP5Y3IuQE7ai+
         mhfPG5h4XeCM+DVbBl9OqIZdahpht9bqoViPMP/cbYuw2qj3EMmr4jnxJYhC0UzYSDTs
         7JVAizMIJo9soLvg01+G8xZNFqRD+9fEvZlx6yaGjoy+RnGIcFISB1sP+eyLYhuIqMtf
         iHmZH1akclxUzsPOGkV3zjv9wgWO1dtbcJ/oSQoCf7bQONAO3XA9fE3l4tuFQaaXLLFC
         OkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677893; x=1791282693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=;
        b=SreBnJI8mGgnOu/wZe+Z4sM9/j81UFl8T3z+dXL9T7wOiWdZJhu4dylxphJ6LHgU8+
         ueoqSFcYZnXDKnxRobfvgq+Qupv1H/EiSh7cmBcZMn9UnlyaslqsjV352c9QAdwm4DhU
         Pc+GEyEBAr4CtMV4l+jg1eqx4RP/j1p3Dy9TIejc2MdXXHUkPnl6LJ3bUyWhuoM0FqQ1
         O+u7k1+1tzATPrwqZ+oJJkXSaEFdDvnO/8G1A63XuT1H3YR/jRLSHDJkVOHz6c2Vnvqn
         EdtcB4sB80aFS5aeFmpy68voKspBAboyiI3N2N05fSt+BFSbOkd4XFTKbomc7rVw5nZY
         Yr8A==
X-Gm-Message-State: AFq9FYKWu6+DMsLucDGJPCxUpxhY6yqJTmsLH4rYuN5dov4O0DD/fHr4
	AVb3L3ODsdPuM/rnyD3HAvCnfRmAxzR8IXiBhIe9IHbRT4Wek8uDvRieq4N7yxeszVQeKT3pkGq
	LkOjWcq7/0tHzkOWPBrnCh479+rK53pN/RT5AGEBJdOCJptQyf0CP+IopGzmCrXtjTQw8UDToE7
	3P
X-Gm-Gg: AYBFou0B1uefpoYysaBTqR+GSxTeDR/qpgbxpY4MR4nS2aCxAUcx5eGh0XAGtSDV72k
	rB2RNUCLZjdC0/7g+RTCEjsbDxysN8JAlsAzRMmMTchYjhPBEOVcwRO0ywc0BePEtGSD5/5YGc1
	G8zo+IW9S8KtrY1mbBOhMLVwoViaTgdyRhNIG1estLel6rxqqkpECjL25pH2Wp5OgxFJFCRHPwM
	6pg1axaWDbu0YG6spFT7o1WUm8VTa9gj+J48DkXkMFFn96LhX6YuuUirfQoLd1XtajKF4viNSeJ
	Qek+zPlYPxESbappqjUhIrBc/lzVgTkyrp2heUtIoQtStk18huG1V47+bSbgEa12OR3Mft+742q
	b9N0YJroFemQ1Pg==
X-Received: by 2002:a17:90b:55cb:b0:3a2:a185:aad6 with SMTP id 98e67ed59e1d1-3a2a185b31bmr5704066a91.23.1790677892906;
        Tue, 29 Sep 2026 03:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:55cb:b0:3a2:a185:aad6 with SMTP id 98e67ed59e1d1-3a2a185b31bmr5704022a91.23.1790677892407;
        Tue, 29 Sep 2026 03:31:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:01:21 +0530
Subject: [PATCH 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-sm8750-watchdog-v1-1-ea06d5dc7e54@oss.qualcomm.com>
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=838;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BrnO3ltS6NV4yLZtRHYLLWfpk7ArO8G+eEJqckc1+jo=;
 b=QPEuGA8zylMoc499k6xXt9YD+6EwzvyphC/Sf5Zqh+M+hgR/vVrhTgYHlFi7Tkq+nUdFnFBAx
 TlhsUca1snSA1XIAusr3vWNDMV+hZHkGBaISw8m+Jo1Ic6EFN7PIaaF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: 97eVPM_1Ju2GSyr1DwIwlCk2VnkXa7wE
X-Proofpoint-GUID: 97eVPM_1Ju2GSyr1DwIwlCk2VnkXa7wE
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abb9385 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-pL1Pet8fDdhfHljwFMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX5YdVEAPGsEsB
 GtRPh09+vCsrPmIGDJwYy39aGaYHQ2QHiUedEpK9x9LWnWG0gEN/slaUIBiu3pn18ykIRKn1wSJ
 +/31CClLIzvv5K58H1gszGsHH7TmQksYqYAvO404M/ErMV5CUQUrONtRb1z5wMkK8JwKq21aU2o
 MwgnUQIPur/3iywifm3z9vEnhHwqljyVC3dKgu/zmUuhTevXLKRTKT43zv9jPwz34bRGJ7HPXlS
 ehJE9EN2jbiS887WD5XgcwKN6hwbOlCsxHzPGil5yongHVw/dWK/7IwMuAGw+SlKPX3ss0r3j10
 YH9kbV/XsDAcaCfkwbOzSzwiUKgd3FJR1M0iD4b07VupArDiHrzhRkyA+oR7DNmKinfYbaQAINC
 E7y7ZaZ0E6QCg4HX7Be3gfts1inVGheXQOYvM8W3IfjIUE/F5ZuOBNmzskQDyKzRzgBSv2cSLAD
 tsIhZswbRNLLfFyKwzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX+t5IgJ+6Baf8
 Pj8w3LooPLCFskB8deI90yTTB+xsDL8mzyVArjXFYo9ZjWZs+uUL8zA/ZLmqa6GmPc0x0bzU6B4
 snFYsmk75NQCbVRBT308tPl+Lz5aAJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

Add the SM8750 compatible string to Qualcomm watchdog binding.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 4ff61102e407..8cd8331608ba 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-sm8750
               - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt

-- 
2.34.1

