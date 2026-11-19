Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088653;
	b=x9pQSa3jRU/G+uRmNE1WDN1RHOb8xCTvbRCQHo+vstK5Zmq4FovslV1q5+4z3U8zZ+HT
	 BEXnmd0p6WljIy5HEKE9vYwE14NGDkHK0QJiQqZgaSuY0E/ZL52K8avEjR9rQtZbdWTqc
	 Lj1rLha1jY1i2CWo7SDf0V4l8LMBdT5c3PCvZqQ+fXF8TGYF2RwbiTR2g1pz0JPAuX673
	 K5S5qCAKIHpCDzUkptU35iQRSNbk4SwwmIplh+XrxjfvdtnCssaBIHhBtRIhAlp/HeIsW
	 S7qa3Zb2e4WLaT9dmZ2K6h2Fg+zYA8/xRdvjlN24K5yhuMhYLWYKNDqri/wer9XfTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
	b=1ilmbiouam/g2VCBG0BW8X+9VSQfVWne9mB9WH1dnjRu4Y+Lb8p8QuIF0t4SxoIakM8i
	 7rJp61mI8yLYgZcSadz2Qt6LAYxQLL0DCy3h1vnLydAYcp1CUTI2YSK9z72CQKdMd3bt+
	 pOATnjJjK7TLOqlrUQSVcKJWNsY0HF5I+jRJj4JxD95qsTGgQiEk+M64V0i3sali2AExk
	 t/f5yvSHx+TrM0DylH5EpfRQ2ao0qPkNfvFYRw9t8siWjrES8mM9FnmoJLeG3Q0+nEezS
	 9GWUImI8voiKeCbIbiNc0RO91TWL2wKCz6UYfO0YbHQyJ0YyaDU4BclIKW5sovi4lwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3008606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3008606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuhYk1546618
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=; b=WU26EFkemleH72Pp
	igpyMWtqi57bblLFZ72wUfDa3PdQMba/mixao4J8hdgOBGwZtfzuIYX/hOPkuCsi
	PI96vKLRXdCxoKYuukk2HdfAUdqliV+/JwZF2UJDrbwqkXPXql7FO+mlH+NXfYxW
	e+vvcCCPLIWXA4t3wbdtx/WrGT1acJOSQ1RKzXdgPTdCx6tIyCBSSes9pqVVfMMX
	fVZuuSYJe1dMCr24PDhfv6yuEh9Z8XJoqFDjXoZ09vcuxxGBTEw4A4GBfwtg8aem
	KSExzH+m1dlxk5fT/18smSZZs54rywbsWCzKrHnJRjZvpWgn/oQbMQPPTAmP5unb
	9n03yA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghg88t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so974344a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088651; x=1795693451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=WEP5syGtR5xCz4lSNAJqA9BS8aKZ4oVxRCzcyJVb3CEd4c+dEtw6tCBq8WFadRQFLU
         84ivkdZ3M+rho1EroHb8DyTE2nVfWtHWhVLzoKdbYQPXW5Ag5rIXJvlqx9hQQvx7owtl
         1GTp5SGxcukRVLnYJYjhP+w/GFDZX6tRvKFUCr7n4WkUunxo/NSomUiC9kRTR0O113bW
         rzUcEff4j/b/12ZXD/hFJxIH11DsYqnyoypX/aJD2YJo0KRQbCjRGa3ss4j4juJgVg/C
         /jt4AJa4aE3+NYMcLtPhCzNA8F+e4ZW7fjRxGCkB+1x+y4bbgJyl5nZyIanJKTCzzlPX
         0Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088651; x=1795693451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=jOLJ5ozXbK7RT3s1aZ2MzWpNSRF3qcDuZikLTt5CpocGlCxAeeSjOEIBDSJtGFbFgG
         KyaNLxu5Y/PwLZm0zOfDa1Hl4kuc01x2YBFyzuOY8zQR7+jFqykRE9g+o2aw77Fsp+Pe
         2nF5pNpZyUBYtUFsVIk+dNOTkX79SVqSb+tsXu9g2RFzzFD4FdzjwZuS0hZVfT4Fkhix
         W0TuNFrgrMxH2zqjsvSwCrYDuA4PdjHlDUEwvNsELriBgkMA/1cdpLmAx3hCjhvlwV4m
         bHZXuo5kVoVFngaBZ7kg3GRYFpPyNHz7SX059a3M1ZYsciPSE/SnAn50M6XpLPvlrEXU
         EtmQ==
X-Gm-Message-State: APuU4Z9c3NX+Yk5qZrN0hRx7/eSRkrQ1cDJ4GrWOs9kqpUPxY61o1uRA
	C5YDdr+zArNgGdq6dls0o5Kvom7o0xxeeKNfbKP9KwUa6I1kvDtnzHMo36awIUvNzvsmLpEcvyg
	0qu+U1jW0DvXWarsDlZmIrInzFWShjHJM0k5cDkpdLi/Qe5+GPfsSErjmCid/UCJ2JgfO
X-Gm-Gg: AZFdTZfwtZaV3tPwrrjs7ByShpBs/17j1YsBnTR4ucx0cWDQikqoTtrmZs+FComquFf
	/K7KHWkxlWFmhfriK3HgjulA+Ju+Rf5tAs12+nSI+jUnQDEtsXsurtx5NQNJpWRfYqVCISg5zN6
	HQYLP96uNsZ2YhmF61dLeQIQV6KP9hWAoXqifDGZHygc3QysV5xDDVWyFOB3rZ3mNb0I00z8Sop
	9lBPRQVFh0i1mbABLMfF4CPddWZPqz6q876BdqZzif1HZTXzms1AES8BxYdtRPqdqqsNGivyF6M
	Auslveo0mb7zrkAizFNtrKZic8mrNScRHg31fBGduMI48x3FXiykPp//DtxNJsnVG6/uxX6WXh+
	ttwq6Iui0Avfqv0R9YtrczvQkHxaYP/MSqTsgQQSVWbrGHqaAOmuJ1V29462SmGWl
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499416a91.1.1795088651374;
        Thu, 19 Nov 2026 03:44:11 -0800 (PST)
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499391a91.1.1795088650893;
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:46 +0530
Subject: [PATCH v6 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
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
Message-Id: <20261119-shikra-el2-v6-3-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1816;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=DfSqnikNSHzMY2hBFUqjQHSQRxokU/djZVzyyL26sSI=;
 b=pGu0zY1XyLxlrASpCoMqPSG83qmdxILDZDlB0yZoXwChYVIP96LNlsT+alnkitTg9GVioRKyA
 tdrnz9A8gORAgU8RX8G9//H1/y89nL0U2TqzFX/29VAaOjAk34JpA6X
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX7Mb5QB7huYgd
 6zOxJSFLGrAnDmT2jd1Iq47qX3+Iz18nGLhyocjm5MRCtj/s0VoW91uJgsgX+vRlkJvWtt8kLiH
 oPfzOG3vOTM6Ze6tOqXT467OT0VZoaS91wjB4BchCLlF2WHE2laKu38ra0B3VpmqtItoa0d3gJl
 hd58JZ4lApP0ZYH8RuomX7GdG5FKWAZ2VExViOnhvrHYmVtLlLeAaDW5z8ZijJfTTT0pNvNTH0V
 pSFSSuzEsZyHcEJRKzDWRR8W4ouIuZEJidGw67nv4AzhTMpdqZluvGrY4VdJUaNANaAXMYbjPB7
 b/MHVHdxm4YdW0Oga2UFt2qWT2YaPoD4JjC6fRxXOtRq5ADzT+2l2PmqX/XWacr8g1mXYVi+ssq
 TEWdZBHIq7F83nls8nRYJ+++mEovG2ei1rdFFgEQr31fzEXPPvfFWuzu5T+ts9NMPyG3HWcP7Dx
 /AH5xmTKoPqIh2H0QXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXx69Xr9Q6XNQF
 DENYCjdZeAVU1K7ko+th7s02HjRWb8K/NlSqKiWcXJJFxcN7+4cJxuGzwmdX5/w3bnltoF6zuRg
 +9c5gF9j32JS1hAwYW41Q6qR1C5jL+w=
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6afee10c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=heRerMffL7N6zYf9F1AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HEl3m6fL9Tkxp6GPLfrX_nIYV1IiHHXD
X-Proofpoint-ORIG-GUID: HEl3m6fL9Tkxp6GPLfrX_nIYV1IiHHXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

Remote processors behind an IOMMU may use multiple firmware streams. On
SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
currently allowed by the binding. CDSP uses a single stream, while MPSS
does not require any.

Allow up to six iommus entries in the binding. Require six entries for
qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
and retain the single-entry limit for the other compatibles.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a3131e6417f5..45cc50d9c1b7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -119,7 +119,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
 
 required:
   - compatible
@@ -323,6 +324,29 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 6
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-mpss-pas
+    then:
+      properties:
+        iommus: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

