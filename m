Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689737;
	b=tyUt9FEQY+sj85Pu94IGq9MiM+yahHfZtP8Wplb0DasS/nc2IrKQZRwtqYH1oHlZ+55H
	 juVslAMtC/Ev7HrkeT+dWpF6ltTeOs6FMm+jhFx3sZSuLaY/mYYiDrR8Bv2PeGgb/qcxR
	 URVM0NajwIq34OSUemdzgtr9nLkYezErLSrJ4tMx+U2etizCNmRY3xkbR3r/K6Sm/FoDE
	 GXobXqAB5KbF7w3czaoEytjNTUXnlXvKMaHfvUIVEH3Xb5/Mmi6fr8N/+9q/iJuVDr/zV
	 L9l8m9JfUee0cePg8e49eu+oaetGTLt+60pUNJwtbWKW+fSNBjHcuJmiHi8q77gIXBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
	b=H0jB7YE5EQrdf1r9p0Xa2fOBTXlpf9VwDKcHrKksGEd64MKDXzQkBt2gvr4Ma/F5llDT
	 /qV8L3sflPzwlSu4swnL0Z10RCTA5iqhnrE0z5PfsubuhO1m3jrufT5Z/lSBEWLrhGu6a
	 BUJilEbOZCpFQ9yXWDQmbnmyY3+KdgjpbWwGoNVF/Ecft4xHyZ5r4+BKlTRnzmPXOVwJh
	 x3vsXee9XQUJrPJQ5k3YBAF4OGtQYe02m5cnSHGh80exj8LS3Cwoag3psmZFv61ZegMM9
	 5mLbmkSobDwQSAw8IMgsKJgFcpcxg3nJuLvwnbDkFkJ5xqodWaaUFbKenej8DA/amXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7feRKvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaSOd5Fb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB8606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFB8606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7feRKvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaSOd5Fb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXR1T4001423
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rK88ANQnkQ8
	rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=; b=p7feRKvBULmbWWS9MQfITOY6d7f
	cDVD9DqDNyULB/L9w3ks2SNFR3nk+bnQQYOxrVzpO7FCg5ALpFpwMMMqJz152L5y
	ek5R2H/nkv+o0YPlBpMVeF7qoUd6ZUc0UUuuflzz0RGp80YNZKmgdPERzeSMiyq0
	+wIxDJsk9DGwD4Gk9HhRZHOpfkN3FqVa5/e3s5/6dvL0pPqbArZfJNjph18frC9B
	hJl9UwYhqbMp9FLJr3L2NvJCthDzmwv9UC38oiADkbA5IG7xtsPbKuB7mTPrYfhn
	5CAIbivibOb4y1p8bH8+9k17kn78mlvo/Qmfp0ltYeBGoBjl/z6SaSf4BXg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaujep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so6993015eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689736; x=1796294536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
        b=BaSOd5Fbw1JUgao7ky99iHh6j6oCzwk6pMDkVJz4RRStwGuJKDFnKdEC5WzFhO5jts
         Xb9iaunt7slkqllCC6rx5XcxsxGWfrUFLA57VgM8aO2ZWOfhEOSfSBIlEwmd3YCMSS21
         utOGdbk+ep3ZoS9PL8XA/+L3fXgF0CaXYfRghhjqJ+WH2rRiUM8lfNawNxQa4TUKdPmA
         YmEXApx6CH1DdNc1rtdUh/TAc8+jAYH14edxrf4lB9J5tSFIxM1xSeLsNqom62TLEFpS
         HuArsOLnNCAXPMFn3HnBmMjP4xNRNIOZ7gg9BdhSvdc8zEz89flBGdUx8ASxy7fZGSzA
         4pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689736; x=1796294536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
        b=TD4Nd91svLfO+b/YGiaTTe3/rjJan8Iid3khC1a84PL1Gf5p3p7vne00oF7SqXfLLj
         1ylU2y2VOPlVjUK0RRg82PuwDSn/wT1IVQXttelZqaINQ4ezrlqA77AQbHG4uHcTq/5F
         +LISVVteJzXrfzi4c+FjPEEsVGfAZ4oOLxsdOfW/DNkpUzgNC+JSTGKKgj1Xi7n1oVD1
         5y5UPVBXU6+sGk97LgVC1NYEkCqeF8gNK7DMOibesJ8729vhcUi80+P9g++KZ9G7rn9w
         6fJ3GCCS7PTsWcqgvSApgFCJt+sS/wctwCuAiNwltVaiiZ9UI0SKIfiTSPYb6DCWCRUc
         8l6Q==
X-Forwarded-Encrypted: i=1; AL+hErF1dMG9vqR68gPTEqXzdc/rWIEXKeaxOfOp1JlHoCnJvjFe2bDqkmDzHezU60CUv3RO8aAJiBqVpkxoyHmJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9K9EovlKVKM2aRUYYX6zSLNDOP2bWRqIAq0GfHtcpDtRuu6wos
	HmEvA0fu6nsO9ySJT4rRxM+BVSKgrVEfCrT0csMapcFyxbJ0zlVWXbqSDpNaHVkPxd1kOyjPAQY
	DgShMjgfyKh25IQtNnJLsBp+TOsBfIAJ0lwr40Sd6raWl1UMCc21aF1Trno7tijZ80boE
X-Gm-Gg: AZFdTZffnFt3I/feF3SFywx1AvIA0txuXmM3kzEPHvsBw4trJKz6V1HVw73d6hRtkXU
	JlGKe1hO0pUL4fVtiHr1CjF/LUnLRwG1HrrzmHV5Y5fsSLerQ2L2N5qRDn9pCH7EI4Vwyp43TOT
	g0BzghMnAgAON/WzRxg9rMcSBB2RYbLRjufQJijsv0dz26QtmEuvDQi+KC1XtV+2Lv0YQnwDpdz
	SCg2xewQFn0rwTe7T7Z7yJI6FlobjmxgwoGg60AjlGypSsMpsoAdfYmtYjj82+6jvk/8eeFfjuk
	JFhITzBNr+9Uk9Id7nMs5EqHCGesHDwRuG7fRUc9BCtP/jkfByA4sr2J479dEQ1b0BwiEeQDO1V
	+W+yHqR/XXEc3Bz/NwLjxB1TDk5FnvCvkkSzngDVGPUdY7K+5V7/HyYkXQiNkYWVla9sf0Dt2ir
	pmyA==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr21103082eec.1.1795689735732;
        Thu, 26 Nov 2026 02:42:15 -0800 (PST)
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr21103057eec.1.1795689735187;
        Thu, 26 Nov 2026 02:42:15 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:14 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: shikra-iqs-evk: Add CC orientation-gpios for usb1 port
Date: Thu, 26 Nov 2026 16:12:01 +0530
Message-ID: <20261126104201.1613183-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
References: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX5bddsltVjA8u
 W6GYiiwmGYdBSmivEtC/VFd7skwU3pDGcbHkCdhHBrQ00isvJm0WkUh7DtKe8C5WC7cSphZcSRp
 RMz8BrE5P9ocqnAfua5+DcDyR+hEm1c=
X-Proofpoint-ORIG-GUID: xKuvGXffj2acTP0ysJEpE9YZUZr9FDxb
X-Proofpoint-GUID: xKuvGXffj2acTP0ysJEpE9YZUZr9FDxb
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080d08 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KsdAzPQAT_6ys4-rp0cA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXyqDFyiBC1Efr
 bKZxMnrRtugl6RU4esPFnm6HwdByDcW/SMgez0qFqaJz6afsTGoFNteX5f8kt0tBPT3BkETJJpS
 Ue7AnMFhIpM8WW9kZdDrfVxEx/yXUXjUB8ITL8pCU5iK5UKUbH62Wwd5A9HF88a1fQNg14+YV7a
 JcGUXVyrvO/UYAHrxggH7BAdajWF7kkUNJdeJNQ6/KgWtFIMXzdh8Nv3oV/ep0UG6HYQ0sX83lI
 tTnZrI0W06PVeYEQaSeixlf9tD9JgTAWr5wwibAyOwkH8nkxq/A8JZiqiV0yFwFffK01beR1oFp
 xx1xFprizOM5FZsxtb2sDMlsgiA0OqXCRUo1LFVyQx7O36zm5NyAc6FZPR9KXjC5lS39OrMZ8Y1
 +RzOafXvNhynt0jcxkkDeQ2CnHY1Qgb2c8EMIUwggMV+k6823CogLXKvUs0iXBlFHUjjhD3v1ML
 aRE551GZBLnyJm17G4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The CYPD6229 PD controller has no HPI register exposing CC polarity,
so the usb1 (usb_1/QMP-SS-connected) Type-C port on IQS has no way to
report orientation through typec_set_orientation() from UCSI status
alone. Since this is the SuperSpeed-capable port, correct orientation
reporting matters for lane polarity, so IQS wires a board-level
CC-sense line for it to TLMM GPIO90.

CQM and CQS get CC orientation from their TPMS instead, so they don't
need this property.

Add orientation-gpios to the typec@40 node, using the ucsi_ccg
CC-orientation-sensing support added by:
https://lore.kernel.org/all/20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com/

typec@40 has two connectors on IQS; the orientation-gpios list is
ordered by connector reg, so the entry for connector@0 (usb0,
HS-only) is left as <0> since that port has no sense line wired.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 0e770dafa9d9..fc0bdb20c7a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -46,6 +46,7 @@ typec@40 {
 		pinctrl-0 = <&usb0_intr_state>;
 		pinctrl-names = "default";
 		wakeup-source;
+		orientation-gpios = <0>, <&tlmm 90 GPIO_ACTIVE_HIGH>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.43.0

