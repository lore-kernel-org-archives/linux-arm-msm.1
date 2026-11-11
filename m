Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416620;
	b=q7Zpq8Eiwi5kREzuM8l7I+g38ryz07eV9U2fXOSiz5KV1BWvC+xZ3oFW48kMHDo0frB4
	 jXlPd95Qp4UQy6tYFhuHM1I5oee4IJF963M76zYw1JXZNBUPVuSWzWrEGhBjMS3yBaVwH
	 pjef77lc8Q09TNMTP+V7nu6FSxyw4Pwqny5Yofvb978mBtWFDo6VXxUlqWQghaDw2oDuD
	 LyoVHFk4YxuHVZwzgOaWtIVhGx+iwpt7Y3KqAed30yLrb7xBwKHipUZ2HBc65KPnthDNu
	 xyQEhqGcb4NeLLmdocuCRU/zF94pdqFXrWFoLtpi7W/HS9BWlv48AIl7AuoxpSAkFNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=mFFyARxBL1rj9asGYR7UAhVsU+h4rPcAet5qMxsIbHXgPqrxNdi+KV7q3Q30nDlBWz/b
	 h165zeCpYrOB/TkX/6uWyBTUxcl1V38jCOwqBp5ulBhj27GcYfgRN8AIOwx+0kHU13J68
	 Y6gt31tvYU3UasCFolrnKiV7S8f3KdD2kd/eddGpRuECSxlmzbD3OQZvfx79xQy685PUw
	 cehvTezbyLRQA60ISUUrCeuLuipjzlT6rJyV60cfe9c6hrBPHeBZ4MqvZIkeLE5hj4gdt
	 FBSwu5dFijp1JuU30aauouFL82nqlNzWjj96YLd2ii6rl64OceSdjXXe42Vnr1rcxsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAggYHDf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD2606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBD2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAggYHDf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0ANX618000
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=J6G2X9uxxQ1DN+YE
	OCV6FF2EsTQYYEwUQIFFUouS3KYf5NxFRUlyY5SVEuNbgAEXqEchIe73k+JCtjYg
	RY/lhweH8o3igtbK73GmSMPTeMG1td7+gABGjFeOMFk7vBRnRZ+jv3Sp/x+MrTuT
	VGf+OMaQ07gKRnEIv8XhxnbyLMY241lY+TUubxtFv5RkkhoXadolNsnVo6IfjC6w
	fyNK1SwO4MlkteT18dpGUn0Pxgiv7BlX2W7sx1ovRWJBOLl3nAjpfHjzUjhOLqBZ
	gJekKLEIs7qSWg/JfGEhqhZ5ZHftUjfk/7wtRChFj+n3EkE2rvLT2l1LvvBs18j+
	oDw5Tw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjsqad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09a466295so2824900a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416617; x=1795021417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=CAggYHDfNeDfD5VRPZRPtFPCaPl8+a1noOZ/ICT+sj1hTJR8slOywALNIYF208IGZA
         9fUEyEnuXu5d//oIdH2IEz2ZLWpUTJuZJ/CqXKCm6Xt3Ha0rJq/+Nqd26F+aqfSQJf7L
         SLVfxS/Gvov3DvNhcQC2IFwVhtRyNXacetNA3azBJEdaT4JhbpIdofHYqNBvklmpVAYy
         IW+Ha4vDromkyPU+5Oi8qHuTyC/ZWWzCMRaO7VrQ7/ChmVM+fgxbwRQ+qqx8sI4HsvSU
         yBJT/FaClFmI3qwV1hpTJacn6g3owMCGTtenfAfgZECI8/Ij8563hQkDOMKwsuLdzM0X
         NYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416617; x=1795021417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=x9DyZOBIpRlP0BSzGaskfxUJaI5+G+ZtU8BbKDpjO3tCcgo3shyR3pJjKGFsclCv7s
         00aICnY4a96TAPo11AmdgkbvV4trFhLFfspqZ9jK0Lc1DEQrmP0MsYEisbtTpSPiuKCy
         Bs28C0/GBTbH8RgTCnwdzlakvSV4/eO6SHvNmMJMSIEhM6e3McrkeOT4idF6TXpNbDPi
         qz6kXxhI1PmSFbQySGpix9AqRzwGaKaDMT1Dd+oZbc35yG0mSb2k+QM+tGlW3mSRH4u7
         taxnONEzKPZN+MUIjBpRdY1gtWw+fPzpOqP+T38c9KdV0YioJXN0Gj1Ugvhh2wsruwx2
         Aagw==
X-Gm-Message-State: APuU4Z/NXvDoqgAoP85yH8yuFxJGO04o+LEEcidJ4bqzYZOlmocEUr9b
	s+Msr+3labOXfUCZcZGfvy3Fg8M/ZOZRgJooRZ18l+Krwjx4DH2Dc9jPCB5IViC/NL13Aqiy3vj
	Y1ksi6XAz+vVqr4PaCvQugGMx0qRqJm76HpqsHpWD9X6bYAlUbeiLqT6BJbA7ABnOQY4P
X-Gm-Gg: AYBFou1AN1+vpJ2sT7JFLpHrQCSR0lyUNUFvUP9wW8B6fRAR6njmR6tgk48+HCrik2f
	hpOY/69WmcyF5hR8ARryaaNDa13V6ESm59o/x28ONHC/UH2dQTJFskR+cesJeiUj6FI0LXHqWLE
	ZhBlqNhvkbWTq6Uy5n+siqZkIvlNAI+nIOpNBhTvlfoc8dsXPA3rbXUDi4CDk8nc5yy2iQSns9K
	s3/e/B1w50YFQewJqF8X51GGtAl3eG/Rwkdm+9R1f7oZoGJH8kB0Lbp0DufosnA4xvWcYcm5Vgg
	zQE3OKaK0M+yT/xWfS0IBHKgIM4mdTzsi6quHSAYjTFrkFsSBLGdz7TpJ6rhoPlWOX46kSfcm6g
	WMadWwLwF8CBt684jaH01qJ5JAH573RmLp2QHNEOuxSPKTTs/MzYvy4733yuulUgqdFs=
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2802009a91.14.1794416617403;
        Wed, 11 Nov 2026 09:03:37 -0800 (PST)
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2801955a91.14.1794416616847;
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:50 +0530
Subject: [PATCH v4 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261111-pm8010_i2c_support-v4-1-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=GJMpxKOfgFElqWzV39z9l90CfE2fgS1uPuTsu08Ouz0/kKKFZ0SnNfwqRAepdTnxxOTzUgNhl
 Z7C8R8Gy0LnCYcd/H7yQfZFQdQldQigDjm5WQr1ZU25GqXRG/PlQ1S6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX/qYHiEay1j6b
 IPpd1b3fcOAUAU5DtoCnKRSMplT2JDPPMDSIYqcGIzHLxdQ4toeB040IBpDcrcnst2NuDc3uYkj
 7OvCMoaeHj2LZUP9U4uUQ/1DrDbjzdHHbrSICl4n9bf18AghvZYWekGyXC+nXFtCnujpzd6DI6G
 blXtUN3YJlSF9Y+wvJG/6KiK3XY8K/aeU1HzshS+dQhkv3MWcRAC2ls3b9CKaPn748HRcARufVK
 DnyYpUuuQEv69C/+S1mU1jX3Y3GC5SeyFOyd9jm0jQdMFdSjoARBOabxEgrid6gwNEApGBUHab+
 kmh5Mpu7aNcH9G10Zrkxupo0YpOzyOf8wA7Napzc8eAoUc8A/c5Lgl8j3Kg9sitSAr/0yvzH/7h
 L6CXI2jWfYYSQVGRN1mYppaIL5GEQoGSWw7ewd49Y2Wq1Ce1+F+a2yH4DDftqQo2b4IYHK46KLN
 cjPv+WwdSD9aPWKuhKw==
X-Proofpoint-ORIG-GUID: VYfPC_RkPleDy6zeVWTV5q50T54Fp56H
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af49fea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VYfPC_RkPleDy6zeVWTV5q50T54Fp56H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXxb5cR1LnnNbK
 4H3Rdrmli17wlmdEaEgVZ5NY+b74gLSZYQGui28bwi/HU5/rCsJKyBAwihf0C4iNIu/iz/RPqm9
 F6OD0P1zKtHyt/aITspsoqyfTTGT65s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

