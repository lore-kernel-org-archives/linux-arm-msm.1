Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376478;
	b=xpQorH/et+Q5UR50cHAdeGFUyhwttPxaOPiVR6+pY/8R+0DjZno0ZJP1zfDacL2rQ6H0
	 R4P3aXu1LJcfS6sIL42jK7O2WMtOSiCDrXwdsiI6FC9twLgTEkjz+u9nwAsQpUiemR3w/
	 pkihzx1kGXeQpY6uiMpXtsiRh5qNuXl77h28E/WspqIQp0s/+fJUISHKAb36YU800FibI
	 c61ajZKXpN+n9UltNhDsYWDGccLDKRXAB04168fGXFrQN90HpJQvsIpLIfB9qT6/MqmSZ
	 ZQTk6AVGyM4JMYFEDDZ2A0+AJmEuFrQqrtAjUaf3LTGzmz57pWICt+MLzTSbBF+aJaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
	b=Hd71xYHZJzrXW6E+CTllIYTAWm6sW3/q4NRtvEa9OJ8AvIcYUCX+wC1KbKRtIzHXWhjs
	 zxmTaVVc0zSraLViJQq1nQ9+OeiMjrlqwWyonkJT7wrjErMwOqT0pB4etoIAByWMuiKGG
	 LS1It+P+hyPMAyHLo78asgqKojINTqr8cjzNv+SAS5LH250oejN7VrnfuKFvJIuCxx1im
	 6/YeLMlHpEhjXnZsLclS4DfRglzivRLPrSSQlNWvR8b43jHwPzD011zGvTceot22wIkip
	 rzDwxDee3+L2WmjMnXTDojvIKGv+198kG4Cl3LgfzbgZdi2O+UpKmXarnGdkXMGPq5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC277606A327
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC277606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV6tF3986376
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=; b=lhofdDvJJsGoeE/J
	TNoqL0yLff60i3ImR2vC6qn+Vk0CXbSbp87MWwBCTjXwN3fM//v22JsqkRXn39u9
	sDhOOF9gryeqnuz3txpcRi65p0EU/shiJk6gyeS+yM4AxftcjdqeBVZZJ3JfBgBt
	UDwaukIufNFNAxtD5VfTZDKKMZOGUV7TJReDEmCRdd/HvsS8s1rb4CkzUPdm4vhf
	eiN1ZzX6jUfrYmoH/87khKhOAfPvgXUngzbiZfR1+L4s1vNszq4gEOOjSeJrwETJ
	PAy+nbigdhOwLAgm+9/Lugyk1KMcww7S3qfcNfrergap3vAVuncYNiA9uv8E1bR6
	RSDWTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu442k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so1207412eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376476; x=1795981276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=jx7tbmtfUL/t6r++4iVR3GBQeYdNEME2xZnMrbpqIR77GSzoDaE73Sh6xnCph4M2So
         rMl2L1EjbvvSd01WikD3jjPA4bT85Ma8bBEWUyx9Mw1GmzlyQXfJ5P6v8ZLALynsICfk
         Hs2nGoF4xAZrVLlbOJ3Ky/V06DJh4W6wi4/kW1YyewmYItmRw1QXt40KIhY/WaJNcXbw
         IBKqsahUtviemY3K5/okX9zE4ctuew6zfo0m8UYNEJ6m06yhS7Ng6inM2kyXUQL1EdEh
         2SZsVXjyVYQEuSbSLxypUWBQVLxZvXoJJwkZNcrV8rQ5TLZ+4kGiClGchpdYNgOWBU/G
         p83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376476; x=1795981276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=jaftOLV3fejK+KJTiwBqj7B0R6HZQy501LpTsxgv3FGBmtfJFeVa32bGhqkCUuqYaJ
         sAGlZSEMhie5a7ruhF5k3VixcKejasuHM450ogGOKH6mD7Ip+CjYMfKkwM0xOObU3ZVf
         uL8UFh29pe8+kGK01mPl4IiDp3tYi1wajZin+NZnIr5bNty5p43cFM38+xwF03u9tWCv
         Gr8Pco3s1+xxbw/hvPDOp0pXIE6xhLKeCYhaKOIWHa25Zgm/uVyPt6Gvw0oCqICUQTcz
         HGFx8hFub4o78P0mricBUEEs7lrASoW4v7bOiN4tZ3Bmhk90061AlNrFhcXoWlinQA5w
         wohg==
X-Forwarded-Encrypted: i=1; AL+hErFGjS4F4ofp0zz0AYcytj9rvGWAQUroJIN52MBferycuYZU0phdEdF3nosfMCXhXBUlt0tHqo19aPvuVFXq@vger.kernel.org
X-Gm-Message-State: APuU4Z/1L9BUJbbo5JA2ttYE5yptLOKGGReP7pLZdE5eMnr6kGUcuaIL
	I0jJ/LvuLsGFmGWUpjE6qFF+wtS+NcT7eCMgJUasLdt3qCiH+6TEDqIHdkyASyC7PF5mYfVj9Tl
	F3hnHMUwPaXQAV9F5BVJ7DxVzsy34qHdpfrWZFZNG2csCpxz03hFz/Q+6sgxIcFmMIoUu
X-Gm-Gg: AZFdTZfTZALPpPrc0pWIzlVYkWtB6ja6++cx9ZxH6ynT5scBy6AugiX1TiBP0zFdiRp
	E8JKePJJ8Lp9kTZoPFNpTsk1+6nhwj3wlUQ4397lJ4m3lWcA21n/l7xvyd7Sd/yZ8UQhaydnyPp
	j7WjW61XafwK3PteBR05opSNjl8Vt8eAZ5OXiWwLnMeChpS8MMeLiJmy1VntNgEkYagbYlPKmWJ
	cXMtLxz7FWwHn6TP7f1lyc4yIh3TXzxGLszsBo16Rr3UDvAGC34V6iXv4Hv5GOTGZ6b4WmWS2zp
	US9RTtE/7eqg+OW5t3CqQusNp3sAPNYCGVDHKs2B0FBu9AYdmikD59LLabKcGvX+ZmJTPQaYvia
	6v/aMArtCxK7tQOOXig5t+auvMLiwV+RdTp0HEb4j/QCJl+Sy1ZEXYvT8qJc2/ZbaHG/DuKbEUm
	EbjyRW9tgtDw==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134302eec.6.1795376476018;
        Sun, 22 Nov 2026 11:41:16 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134288eec.6.1795376475563;
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:46 +0530
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
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
Message-Id: <20261123-shikra-machine-v3-1-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1514;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KSrSXEahZQMd224943c8LnPie0khXp4nfj+R+BunIW0=;
 b=JZsIIoriXs60xtNNmWjttyoCFZAbwH7sBoOZDULZNYIdA6MaeevJPPUL5B4qrpXwlJRPDL/Ug
 DTJMVUA/DcYBDbGxTfLsSQYAKkWCKiXSlld/4wjVV+qzPElohfBNQS7
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: iz57jFYZmseuAQY28yLfQe8ajAkTNgnp
X-Proofpoint-ORIG-GUID: iz57jFYZmseuAQY28yLfQe8ajAkTNgnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX9nvgxJsOQDEl
 1qWkd0yc70un+1KrU4WyPl5ylNLoyltCpHjuz+eIMvKg/0QqOV5JdA1UxeQ3w4i+WNLEMdL+GVv
 Ed6vdTJHrY5Oq16i3QB8HW8QVfvs7/jB4JRgHZVdQqm33ctE9gbE39OxGyyCMPdmSm1y8JlAIrS
 rOOEJ8qQqkoHuINOjB6Bq1SaXEnMWpT/lH37KomVf+nzpCvFMMXN95A5bWBzuGq5FXxETPwyaC3
 EJ/r1Y1ooKThbNZEzQv6vNqR3V7IJXhTMro4JQTc7cpWgbg/LgmWay8YC88DaPC/9RhXehn4TI7
 FHwfhGBAPhqkD6tPRBf8iBs96MXZaMBXkzx1Pa6b0OUYXs9YI+3JobfWOF8LcJCVSuuOlvoR2Sc
 Z0XAEBvZBWGc7+nSYWURRpYnuJrfiK6dZ/geR3A3Mh1vGI/UiNbL1A9wAynlagT85ESsT2w9ciV
 p9SWWX6uWByBuuRAEoQ==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03455c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX0ebeEsvcvxva
 aR5U9Rb/bxVk4WhKYEitPUPS9kRgxfNzvkagUTzlOwXSVyzfgJC86zIwNtbPnNVwCR7d3Xf34Gv
 sSOpYXqYlYj5kjuJ+VuRyxr1u+jji0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a890fa288a76..1dc164e2c73c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -57,6 +57,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

