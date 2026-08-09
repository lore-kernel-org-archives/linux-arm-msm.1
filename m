Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3183793A8
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310973; cv=none; b=MRSX7f6w0IcRjdwALe/zf41dhNOvCo+sHAWBUzp0xUrNW6DVhAfpDMroWlVGGizTpboS3cjsnOoqJm+0csg2rIgtc2l9IexzlaVLZPJlXKL6kfEdg78yTkEaxFzwTaWul1KIUShXZDAIUAqyGbqf9bpiRej0mqEzBhzjn5BRldg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310973; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mox4/4GnVZxoOzgdX7rYWcj77OVYEsKMDrRAe2Mqs/wV3HyGKiJ5o0x9zVpMQs+5oF8qyEGB6htHPavltslI124TmpeQJQjP1fMscj0yk+SjaXziealFf+yB3jn7LGO7Nd424+qhjDaWPmaIlxI8bcGPkn2IyCR/lev0p12HmV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMAmc97c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=at5xwJzz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMAmc97c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="at5xwJzz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L8DlZ3478057
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 21:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=iMAmc97c9zRHPQV1
	4jb6SBshXtg0eOnljbooWPXGxL5NfrB/EVfnNxhAbLif1zVefPkMDpI+1CZdb8/d
	ywg0RJqrP9XsBtrdwizllc2a05+xhuiXvEOHU1OYHxK6s9bv2i4IBWwrMLFZhUtR
	Xlmbdhqa6kEVkboObUJ1wUt/PMeBTMwtu7Afi4zqt9u2WyI0SlUDlUTdt5S41cJ8
	G8YfXhS/G2I5Q3rrGtWgUeUEHqYoX4XgTJM6WIsyhQfjs5j3V0Nk9c/jKKuEr7zX
	9saVMSnl5/vshuTt7SwrMwMGaZBI1wnsLtiAbm5pcrogeUeAlg3ebZl9Z3mujUE1
	6llCZA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cug8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 21:29:29 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81df8abfa7eso37345717b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786310968; x=1786915768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=at5xwJzzFYZekAYH8iYv8nmUA5xVl+OxNKRTGN0MassQvhyy+AHk4TckLTDHKwZqsF
         jIF440kb7MxVBYUb+jJ92rdRZYDS1gW9lZWRRJMss5WaS4wW3hZlyoSFcu6DMQN56KB6
         UeEwCX8caLz+akj0IEEDJkvK5/FJJAbzoEZuwAA3R9wM7kragKK5aaUZ6dF43Q5DkQo3
         Yh2zkxNFwXe4k3xHI9OWHFPj3P/v+btE4p/+3xVzW2rDF0ODNoWguSZBbVzjmvmVdV2s
         N3dnbDmnjH+UI/9AytC1yx6mQ/50weL63C3l/SAruyOZjYxt88vaqZMFDnFIyd6i0QZe
         P/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310968; x=1786915768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=rkhZsS0NkiwZ5BaCvnG0Pr6JZ/neZyi7CDq272qu3TBXp3nLQF5ww/0Ttjh2wV1GJO
         H7up80GOHQoayDVRcFsjtKLWatzPgYp5UnSiWuabsCugvRqYIr4wJOz4ep0kD7uT0loz
         ATscpaEcqR6vnKFUzoJ/Vbf0SJU98lh0RU1a+poelJen9AgeKKPov8nKtSgC/5yEv0SJ
         UjarUeo2IvGgZDV94gvViDVYTJbgmrYJqQcFVdlvNKtq6GcFw4/ESVP59WrMJfyWZE6N
         i+ltCHlXFCRY5dj/Kw2bztifeR+hd6vzLw8KeyD9EZV5AMvBJyXE+Im3X+RnNrBUcatG
         /Nmw==
X-Gm-Message-State: AOJu0Yw2++Eg1otR2YU8G4f2OqbpIiCTfVZ2ufCoAWVU6vtqkPeyvIfl
	YdmMxrP1CNZQBRayICQxED64eoNzeh9JHn0WRuXzL6/j9wienuPx69eXeU3mXXrb+9+UW9qRzL7
	uI5qGArvJITiqmL1LlGaFhKnkEyf2oCnhmIi4mGZI9SNNrd5hn9weXRovPeu5Ss1R6ZDMSHdcOA
	Hv
X-Gm-Gg: AR+sD13CjyonYLDwJSreHVTYXLj8ppHn6/0f6mYx0mrWrSIrRQK4QTAxR2rUTGfQEGp
	c/dkGVmyhUdBtFJRng82ChXkD+c0Ts81g3QhK+zjE5SO59jE1vwDLow79wkZRhWn3V34+Ord0PW
	SPR+VhZF8tGh1699QSSpT1xRKqsHjjsZDNF9+a8t7qsPHDmh3MpN0YI9gmK7olyB3vRSAOJaZ0Q
	iB9c3ugTVq3FigBxtW9ic7MFGaFR79D+3KsZVGmmwejPzp8fPkp9JsKk0FG90b+tVD3eHeqbsZd
	1p6fejOxNgfNRA/hKqGKwz5sMpK4HU/DuP33POOIVa7GxX1XuyrzHAnBVfO+EoC7Mfafm+91nP5
	iN7fo/MOz8QpUWM2FexnQMhn7MWMBuNF2FHGoxB35SpBHetyMkeGi0+cUhBv++OAieYX0MwcejD
	7Wkv1QDMjCcCAqH/cP3uW18YakF/XV4mJ5XM+yIm21cv6G
X-Received: by 2002:a05:690c:6a08:b0:81d:b439:64ab with SMTP id 00721157ae682-8201f0c17d4mr235738447b3.1.1786310968384;
        Sun, 09 Aug 2026 14:29:28 -0700 (PDT)
X-Received: by 2002:a05:690c:6a08:b0:81d:b439:64ab with SMTP id 00721157ae682-8201f0c17d4mr235738217b3.1.1786310967984;
        Sun, 09 Aug 2026 14:29:27 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:3150:772c:4c26:ea11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm45248167b3.47.2026.08.09.14.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:27 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 14:29:21 -0700
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-glymur-send-v3-1-2d1ed10e3a89@oss.qualcomm.com>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
In-Reply-To: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: pO5rebkwFxDx--jYVERJpJiPxMKeMRA4
X-Proofpoint-ORIG-GUID: pO5rebkwFxDx--jYVERJpJiPxMKeMRA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX81mA+f+hOTNA
 nMpZNzIPk8hLcIp17ShvwQnufCSUrBFTCp3GcDH0clAUeVLEzHG38OqdQG61BqvuwvROjNCLJtv
 ZcdEDVoUF9SuCy6xS7CZcMkeDPtWlMZ8ITxdtLXer6Dtr6BkD6H6SvJDSUeq2iY/tFJPG7ipPby
 3rwP/tuXPNRHoxleZsi8sOj9xcErM8BkgQENgD4RODYPPqZ/AOJgd+Ft0eRib+hLmbrHAOmn4tN
 alMUSSfHqCCk6Ckiq0UhdEvT2+976DgJQ3DbJh5NSTLDdaG9QTU8pcdCDhVkHh83w64EWu4oOx4
 5jgEzloWPRTi3YBnvzMOz5VwGcHCLa5Lt9vOOZTCOadipiyaI8nibOJz7JIWICeSRdQbSc/CLsJ
 zpqMG+f2Rc5bVUcgFsdGvGGl+D08EORq9UDQJdR5VFsJ1vZV9O4OTUZQeEr8H7OzmxFzR9HafcU
 iYtVmYaGHgG0Qt0rjdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX6hsIT8+pxQsZ
 mCSLcZMG3bQdQmE/aFMU1mzPE1LhBCePwRHzSeb4bg3j23GEOF7RVYJIh8iJSg2w3ZGDYv1sVoJ
 VKw22XC68QKeuRPPsVEdRdszRqHPoCE=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a78f139 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090195

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

