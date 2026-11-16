Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819646;
	b=jyK5iegF2OSF8Hg9I0w59/1zlquVPwGf7FfSrHUZtW43jtoc6fPhiL1xhdXIFa1CDUDC
	 DbEGiRnzO8Gaz51rdE0iTwZCBHWV3b5AUuCwHA7qt8cekUkXWJOMOlM8VUiUZmEs72QA8
	 u5F0jIiswnJ1XK2V3tqn+0SmUqesoGbSJzZfv33ZKYR3IOFu0rXyu2Foi1la/9ZTpqCKP
	 35kiZht7RA9U5fN9hnGYb/X0Fr7M57BBka6X8wTUp26OZTLV4wzpEGBuqylO2KNnSeuG9
	 xRD3A/shuqL4Rn/6GbdzUX0ixJmlfjOdVIYhuxpbK5pdHEIfYyLRPFOc9MsYY66MpxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
	b=N4vASvXfh/QV5U+uepmIwcrRpG6+r9SunDEPAsoMjHU39bqxlWm8biq6YdMpynhlO1nl
	 Wna1nyhRajc9mVKLnW6UZ12p6sXBPKsJqYNmGGAraqi1/OPkwy6nUSbarZjSrmjxCjiej
	 H1slY6LX+GGKAg2xjzl5nYrcxIsTKkjev8BU/j02Tkde0fbeWlDWorA2nb2IBaSUTHzI8
	 /wOb7/HkhfJfubQsqpF21AsP3JJB0ljbkADOZZy71T/0pAKup6uI/X1SeoHAf+k19UWKs
	 GJBCX117oTNaHf/H/YpE2jkGUvu0ihU/eq3uPAXDc2JZ5Cd9bhvquDnk3I+qbhteBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS+2W1yH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Syy5B9tl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F05606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS+2W1yH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Syy5B9tl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fA7x3192649
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=; b=iS+2W1yHU1a3LWo8
	j1Pzbonj3Gfof/aae8Ul9LPmYnCD4xJEJjKCwdfUNa4sMkQGKVqrmiHaN8kO81Sc
	7Xk4BIl+1B2zXj2nwaCngF1fzmiX3y32HhVH1mt1t8rxqPiGYZvl5EVBHTCHOdyW
	YfCtty0PhYPgkoTyQXpmOayOhyX7TXi9ifw9yqtkPTqOnX1D9A+zkXXHFGUqyYE2
	FcoGWwTBuiGDbAX0AWTxe0RUlh4Bd6qlBOGcPEN7BunJuz1aLRx4S4jtvl3EutrG
	Ymu59zxfyRpjhb6er82c/OshxYNRtolocF+8mdSs6k1neZYONmEq0qhmlSoc/1zO
	FoN5wg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj45q0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde02b50dd6so354335a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 01:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819641; x=1795424441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=Syy5B9tllTn/0o1LAH09AYvSk2lXAu/DRCBfdZYDegWSI1V1UemfhIXxl+nIJ4sGgX
         encTz0JiHHX/q58ryBrLdG+S/boxYlXUBGmFfAzb5HJL7WoRx7bTs2zYMrjD+Oh5vEKs
         dKuQlwXMQOiC382f7DsfsJchRgJ54NORvJ4W8GcswEEK4X6Ny7OLbJr1RJdvgM+9FatP
         hg4RPmwOy3iEB3Cx8G8af6LlDBD5g9L0crRLuusIkOrDia8EBYTdRt7OvzZWXyX2oCH/
         E7u1tCDB3qYgFQ6XZyZeh632l/BgPqYUfXxA4+A3TRgpVzFd3CaClHAHcRf8fPP8kRXF
         NtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819641; x=1795424441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=FaCQmFCGNw8Rkl93CZHk4WUmqqwdY45N1dry2Xz812ERJV07hL+HwzsFuCsmIrwtX2
         li6DtgVlDA/pHT38NpngT9I59e+9HeFI2Q7K9itfbQ4wYWaXn6Lw2osaGC2QVB/sqa+8
         TRn0TKcunRCNst4me/jYePEL7gW1X8Oc1t6QqPxJ/LIKPXWsfZxSphJ4iLd46Zqs7Gxq
         rcsmQl9oZHS2W3+MwarzHE6rZlMP3uhuvSMk+ahs6PdX6A2YKXQAOIzcRWltaK31NTSi
         d1rPQNWR70nGBHN0WuqFIO7ad+stHazNBGz85b6YdJE97fKgvs/xt/RNMEyqjbQKTBzA
         +ZNw==
X-Forwarded-Encrypted: i=1; AL+hErFFyDKY5Rp3ueI/ZpWNt5vikgzsCWubHGJYnJw6VWTJAD39eucpGKmgYc5yC5M6cSnwUkjBZ7ObJUjB9qL2@vger.kernel.org
X-Gm-Message-State: APuU4Z+kFrVDP+SV6+UGLS6oO/enU7K1KD34ZLmZ1ios7L5yfGHI4v3G
	+ydNrh+cjFf6masDg03eLWFSZkkidDcbYorXY/PL5nEEOkXwDDxdRvFHWQTHAvNHhIwQyFgc+BD
	w7At2+WFSjv9XuMzjpfh8W5iXe28p6wExccomJ4eVBqOgsONdM1TMFs/+qc2VtuRFw4UA
X-Gm-Gg: AZFdTZcL+hj80XkkuxPbRBWlbjEQmGYqlCRuylPjJp6ARmp6CINU9oqFDM6+SjCw6sr
	30NZSgKm5zpplbiytk0054DcTiDoePfQlPorTdyWd9LuqzJWLNdjCEyKRmdKQJ56mQZK0Kfs5/g
	qC+hdY+IrW8ItyAniU+yjIwGA2d2cT1c0EVgnfgc6IhsKn4RqvhbhNo93KO7AFl5qdRJ1q0yan0
	RLPYQy/gBeH/uqU3bgC3DGkdxNLcIrf5LaxxXitIncpQ0qAgXDvrqn8XGrphq+ZJScHpIPP5SiW
	dmdkmFoJydDeCpGDMVItyJqZQgKDX7ILN/fL4ZDPbsQsIcYFHFWjFF129kzvT8nIdomc9Hw4OzZ
	WTFjZXQ9QkwY8S9E9nuD+46FxM1mA8wFm2XbGX0hcWYrKB6QHuEdPAzRp5FTi9INBUD4AyrW1QL
	JYe//Sodc=
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6453721a91.43.1794819640770;
        Mon, 16 Nov 2026 01:00:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6453665a91.43.1794819640060;
        Mon, 16 Nov 2026 01:00:40 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:39 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:29:45 +0530
Subject: [PATCH v3 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261116-shikra_qce_fix-v3-1-9ae31470ef48@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX7xiCR6wwKwsk
 Ay1qW3aZvR/zeUQNQoN+A/7N82bK8p7AqLE2nMROLn2btK53oc54kBvQ6kjahvt1YOUyHIy4L/R
 AIx0DKNRuTMcusshOZ87qvy3HltLvEpUHeALHzkGk2cx0ZTipO9sK8yvJO2d7IPovfPIMGT+JPp
 xj5/EqxwXrnTYOlvShGKmhXtqoP880+TrCbCg+GLniiRoAh/uDnNCPyEc0XmlXZlR6wGe7YuJrH
 7SkiHFJD1hQErQIVcKLqMQDr8xAjZ8fAnfN6XWp43BlttL/HAGESPyiQjpoPCyHX17r+I9fw6AS
 C+Jj0BqYjGQ9yuw2SYlpGpEJDCYSxD4VA9DIl7wQwnQFh5piXVFYJcTA1qs2sYmEiCze8PFTb+G
 /8cehagFqzJkMh4cNYsf8OIdZ27r38iuT6J4bn0anMAm7jrA0h7CR46i352McGnCfNq9902d4Dm
 R4UW2QwPyo0alNRG4NQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afac63c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: GIzkJswLEw0xTQzfaODUGkNpcKEp2ECF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX2jFJKG6K6uUk
 PR4v2aETkYMcLLghrhTg98r+cNawsvfANwzyNa5PwN/jTyB7t9+Rtu6/Xor7FMysNJNaHkYuZXD
 uiINQvTgnEiQ2m/F4u/CHbV7dO6E8kM=
X-Proofpoint-ORIG-GUID: GIzkJswLEw0xTQzfaODUGkNpcKEp2ECF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160035

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

