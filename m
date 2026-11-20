Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166457;
	b=eRsEbV3ERporEYBBGShygepkCezCNFKW1zvnILyVi42VP9mZlcvv7aneN+7HQ+9rheiI
	 8QXBUZKyU2IdPm6s+ino3e4ZlBJmnV9M7vTyu2GxWR5zQZlifv+InwvwRlErl8YCKYGA+
	 YtxLwq08dmsfRSoe50T2cwI701E+rogFk8KSiJlkaAqgDLUq9+eSOx2PF3pKw9PFl9kvn
	 VqEAFfxs6NjPomj247ymaxeqLJqnCHRxah9Rz0fVRM+E66CzisUvaODqrCxk5cSezh2kr
	 CI1m+xiNO0LOdtSarDMJBIIOEZ1b9TtyH2sApssWIQH0FM1KtYRjsNNxj9x2TdDWWhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
	b=4sMqNSlu2E8RM1IXCq9bQmei3LabQPWJYlPl7Sx9o8N9NqMPs2HSZOTvKJkPiV5raD8W
	 SoGWmgII1QGgQmGfw5NO+rEfQaCssSeNLuuyjqoqSfY4fOSx1LG7omtHQalMdO+44sxOh
	 OWXVkpU3+ybUD7PCklYzTnlRQkQEX7qZb2JNUSY7pFIqEc3Fa1AU6iiIh1AMVfxWYNqva
	 d0asNuH5DxmXRUlcrYvaxztbteGFgKZEVvWWFHuMkSJHVwasUhc+8OURA+ZGR9MFbr8TK
	 oe90uLtz3674xt+fwpDFIDYrh70Ia1aM55sQeooYBxpnsTsrnLm2J6wp776sP/mvrjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmstM3Lo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPBaPM7+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C864606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C864606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmstM3Lo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPBaPM7+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fNrN650478
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=; b=gmstM3LoZSHfV2dJ
	RxhiS3yH7+zvUjuisiI0wiiUUnhRzNorX7xavBW5WERpLyqXnEJDOW5/nB1gD020
	J1sSEF3PTENuZ3v0qr0yeekihpL2Ld9+leAuVYD1Uf68PzRfrG37HYp7iKnRtFoU
	m7rAaPKD1cknvkazujrQoIQWtc9Z9nZtA0z27cFIuOAP5z2Yfve/38J0b1615PiF
	MRc4RnLMQcWS7Vy4nJYdz3RC1aqkfZoLf2icfFPoDC7gxAt5jKiz+YydCf/q4AhN
	XL9xOytGNNe3jYrVX7VrguYQbgAVSzDXFqsv0lBYyd4tlgT9IxOI8ZS3o5zdZ3zH
	m//vOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjx09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so635109b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166455; x=1795771255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
        b=NPBaPM7+9qOBTiYCbdvXQ6+Id0ygje3QTGewasWOmqlWXxYrtUYINfpSHq0eQc4qEW
         QB8C6KXx5FdY+88TKvSLIwJYFIvcrYDsz7GK2Uaz9nUUjbydHFG/qh76Fj6r9cMCl03N
         /6PLzHeASx6UbDyskIkJz4SlDFFo4HuanFFjL8BDAHHMkpg27OMp3gxpwauFilc75ZiI
         ceOcHsvZqBfKHJmjigS1B11fcJr2cuL1l1Ks6K+3b7tO8vJFHx8IRKd9DEyBw9QDEzXd
         5+rKGibKHfUSS6hriTa4hENBw64edXeCzgC5H6DpmnD8uv+S+ADAGnfx6rs1VkIlkUWO
         BccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166455; x=1795771255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
        b=xj0PWR6z580V+eKvLE7yoIwEREfeBEON7m6+wNr1y2t8nwF/+uiPul1gF3j8T9fhIK
         r+9KkPubCWE9HwYm07Hu/jF2kW4RtCWIvAYVXu4lcPWZoPx9qPxhBzQn21iPiTHEVgE2
         UItx1DbCvMoeKoMB2T3ANh06fmG38IoV1XDQ1gVug+iiYAHp63TbcGgOCk2O9Vdb25BT
         wfxf/stzzhP3ONcPa94EhIpP5OM3/0fwvxU5SO1GfzTKn9edgNMtIbOZwjCWL4/VZCOc
         EGL5AUFsD148GbIJ2LFyXbgbBIbbrTBLdc9h+tMoI5ihaSK/n7UgUgrFc+PRilD6moXC
         4Xrw==
X-Forwarded-Encrypted: i=1; AL+hErFfIzG7DTslxeqhPubCsk0PwHtQHqqYAtXWHffPN1PkYiv+CyKSa1ul9yIiw+laTXkUzUypn0Oul0Sq1M8A@vger.kernel.org
X-Gm-Message-State: APuU4Z/TfgLbYHSuUZUrAhWLPqCYJItBvpKc8mCVrWgz6JaUOPTJn23l
	AgyyA3RzpmhMheqigAu4ijkuTb/XxMl038lUEv2Ao2i9yB/r4jDYka6WCOhKrhBCLriqANZCOnR
	fIuB5y3YmYXk2bQQOVWaJKZNSarUAl8q5yTpRiDziQ4vTwjQGJfMJEp/GfzNwcI6Be4NE
X-Gm-Gg: AZFdTZfSg8C8WQ+txlAqw7xtI9cNsbG+Kh2lw0XSD93l7a8kGAJ1enwD96WcgCzYwJF
	EGY4Rh0hp03gj/VDwoOteKFGE/4RfRi1cg+xNitLAkxJ2aA6wCZO6vcXDs3m5esjhSFZVJEwiG9
	ak80veAXl9sDinKLGCSgvpY9v/eq3zwN2SczaSixiqkaBv8BKb0lSCeRXcpJrGkPPgfdhJ3fAWe
	WdV4LOUyOdzeWwegQyerv+5wsIYtxXayQjZ7YXG24CxJfAZW52lqd4E+J+Dgouqe54h2LwpZIpa
	pqRdjeZEieVHq35Bh+cdZdRfG4uWEaZW5lRs+642L3VTkdPkML5a6Z711ygxNqe1mT7FmXdRSej
	BY3Ix1QdOTsjX2E0Xm0s0dhI2SKE9fIHO94GwlCJ7s9hfBaSrC+4VEjSSsrWVq08tWgfZ
X-Received: by 2002:a05:6a00:2888:b0:89e:89f5:18eb with SMTP id d2e1a72fcca58-8c87baca1a4mr2848593b3a.15.1795166455097;
        Fri, 20 Nov 2026 01:20:55 -0800 (PST)
X-Received: by 2002:a05:6a00:2888:b0:89e:89f5:18eb with SMTP id d2e1a72fcca58-8c87baca1a4mr2848552b3a.15.1795166454586;
        Fri, 20 Nov 2026 01:20:54 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:54 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:45 +0530
Subject: [PATCH v2 5/7] iio: adc: qcom-spmi-adc5-gen3: Remove Gen3 virtual
 channel macros
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
Message-Id: <20261120-pmic5_gen4_adc-v2-5-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1334;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=I4p2EJOwVOFdhLV3d8fOV8mI8YFEYd6rXRgzQ+V6ybU=;
 b=rGlc5oobOonUPzUINfe0xZ01U9TskVZZ8B1j4gHL5EkU9puFHuIEXfLWsU0dm8BuRzoxIBRiF
 kDWSaLgE01ADQwp9CouyV4yLzDPMdMKAzrdmEGMgwp/UkEDQnpMbyAh
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX+nv1AbaF9nA2
 GbGx72u5cs8F8nTv4zQ7+Ncen2IVL/6PqVVil5ItDgknvNIxQc1E+5Y11jW+DFUbVWHoAuw7It1
 +zNEGYHd/4IUE911bFEKIq+c84eYsfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfXx5nVE+yKv3wE
 l4DdbvVvXU/GxA8WDT6SQn4uTkH0zaRE/U01/2AQlTaluCFRpXmK76u1r46a2ry8edT9ivIVCiu
 o9sx/hQSnwHFoTE3qTRNsCCFpI/RUl7moXN0Rk1yD/re5/TZ2hHxj5I7eYAHZUKecwGvo2Gc0CX
 HFaKzxqNvRyOjtXmG0KucX4w3YnYLDJI5PFKodVlRnzeYVBIJ6MnQHvUWPj9Hb+ji+4WsaaFNjc
 iTffoveHMCnujjEtNY/NzCQg0HpYyZsURXaeYEN26dMEm6Y1dqBEvs/y9s8GkrYXrlYJwbB25Gk
 ysSxRILbgjZ4oj4zYxubVKCX4mYmwRDcaAMFzBgyJ8fdZ3fjrE9SJFD6pZXJQpZQaG9Qn2wJyyJ
 56Ly/gAuG7ewDL8vnsldt3gGIhdeI6h6cwdZQTRjHGgzNy624c2PdcGhpNYr0yxk5OIr8IBSmZn
 nm/wj8aS/mJXIypTs+g==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0010f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YNQv7Wq190UJ8kr6mkwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: i48xknXs7CRjatpQ50FQriTKeU7JZ8SK
X-Proofpoint-GUID: i48xknXs7CRjatpQ50FQriTKeU7JZ8SK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

Now that the Gen3 virtual channel macros have been replaced with Gen4
macros in both main IIO ADC driver and auxiliary ADC_TM driver, remove
the Gen3 macros as they are no longer used.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index fa7e08d67f26..105b0766a01f 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -40,7 +40,6 @@
 #define ADC5_GEN3_CONV_ERR_CLR_REQ		BIT(0)
 
 #define ADC5_GEN3_SID				0x4f
-#define ADC5_GEN3_SID_MASK			GENMASK(3, 0)
 #define ADC5_GEN4_SID_MASK			GENMASK(4, 0)
 #define ADC5_GEN4_BUS_INDEX_MASK		GENMASK(6, 5)
 
@@ -78,10 +77,6 @@
 #define ADC5_GEN3_CONV_REQ			0xe5
 #define ADC5_GEN3_CONV_REQ_REQ			BIT(0)
 
-#define ADC5_GEN3_VIRTUAL_SID_MASK		GENMASK(15, 8)
-#define ADC5_GEN3_CHANNEL_MASK			GENMASK(7, 0)
-#define ADC5_GEN3_V_CHAN(x)		\
-	(FIELD_PREP(ADC5_GEN3_VIRTUAL_SID_MASK, (x).sid) | (x).channel)
 #define ADC5_GEN4_V_CHAN_BUS_INDEX_MASK		GENMASK(14, 13)
 #define ADC5_GEN4_V_CHAN_SID_MASK		GENMASK(12, 8)
 #define ADC5_GEN4_V_CHAN_CHANNEL_MASK		GENMASK(7, 0)

-- 
2.43.0

