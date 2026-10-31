Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452274;
	b=1rtbY1iR0xraqGI7cWGS+j6J7BTiIF8DkNdeLWhRL+cCHx7dnhzxB9/CadAhAytMnFle
	 iSF5BFk37+CmxQ8BTb9fZzVC+2kTl/MU2FqGGVBOyseNHlzvCU7lJVKjiMrKuuuQDEyZj
	 2PhD44jcQ9cI3nf+KINUQTsV8XeOT89yQPcnSrf2DKWtGfYy6N/jdLZb53feRitYgIPkn
	 mOc6BbzOm9/uDvAWLUgW/jKAwfHvYpYaTcuLduvqw6o7Gx/73ejYOROz8zR71VC2lMIV7
	 wzU0yiqNjf9KP/W0zyrOmpdiKnNdBqnNFa6vtLb3Erryw/ZeA+NOfSttij1zIqi2xnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
	b=Ak4AkxZln5Tr71XTJ24/Rq2QvGyWClwjg4ZrhpSY7cWZ2T0Hh7cbRy1CR6Ya2FKBvrms
	 leg9OBZCwuyu1K9+c5INnSWMjz94G2OvR6gbtp5BsV/bdE87ub8wUElDGUl/CA0tNgvfu
	 rZU5bDlqgjEpIqcD6xPTI8SzGCJzQrW3PAbJ5tEWIyJyuB7O2vGrf0wcnbe3oBjr0LBif
	 gMTQKhfjm8Fdy7cz8opL5Y6kVzjoOqCqTHZt65e2otd3+6Zz1mWqyBbC6vWjIU3hL6vJr
	 kl+wbdvZ+KVo/7nwZfbrz7DiKWNAxU3WP9EpOEpqXo920+9xtyf70iF6KlaozMo9FKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2IlnkNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkyLmp68;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041060A2617
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6041060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2IlnkNz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkyLmp68
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0nx61129166
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZjowRiis49W
	C5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=; b=Z2IlnkNz5nTuRqCewm1uBBSYzmE
	ly1nW0Hc9e4X7U+W/Gk7hKrvV0m2Tb1Rpbuhzvjw2GJdUHGteLuODn34YWjJdyF1
	sWeaMfFonqa6yC2smjJxH3C80oQSak9Jl3eRSG3J9dl31KRZUAx4lCJZ1wed5tiJ
	bUJrfw9dOnb1Eiv5v8l/6dLY+sLG5TkRh1b7xpQc57GQYlN3RZoUsD2ASGu1agAc
	91jAv6sNlFIFOOMm1UaWXxsXG+S7MMFurv3lQ/hwSBh32/t1EnMqN/fFAUkCWkaZ
	h9XHB6EllVixualzlxDQKs5e2yd/Hh2p4Fbs0TSmXesTVFjnaK+tsUNa/mA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7s3wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so1881655c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452272; x=1794057072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
        b=XkyLmp68UErskm9MQXgNBZWctPGstP9uaTKwwfl1qac0Mp9Pn4jYhfGu98Oox5s0jG
         AhMd+1eT+YRrKPhA0q9soXa0CuSSowT2ryGmYqOx7vzP0yn1+wug+EVIjxiV7qWoN2i1
         eUk0dFha7DBU5hq96DItbz2+hOK4DN/2gNfYJIHj9tnaE6BSMvccj6z8fYiFDlIDq6MR
         YNpDkaD1/jN7i1F8fwXiFdF8AyCpkIIyZw2R2TWOMCHZ2odJuCEu4TdZygR6NKj8n19+
         KJKmkyx+95ZAYBp9B6D01wv0ce3oCJsSeHbV5w9k8cnwiLJRMHgSB4P0eDh28MEAoHZE
         nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452272; x=1794057072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
        b=tSI0a3CLsFjWNtuYHuiRlsvSz2EpLF54L8KghMimqcU5mCYCZiNOl7e1FKjsdtdOV0
         wID3qBSN+GampCA7X5e2b0vzp/MmY/u3TisziVri7j3U07OI+3KeZI7SbeZOiwo1m+qT
         RFK6hz+RgUx2P/lTd10PttR99Zf5+Wy2aHYVD97ATrx/HJWnvnuOPbtVJbircdf8ywHK
         NwyK67MWjHDAfPosLOGPXJL2dU6PDSxjjPskD8G0XPjx/dTO80nrbi+PoeMjl9+HLRbn
         uYpSkxdGQ9QvkgtwNiyD5yZHrMgnn1z5TtK6JoymMqDkgtC4eYVv29VS5gYQ6lVXDj76
         vCTw==
X-Forwarded-Encrypted: i=1; AKwUvBxqxpwvkGv48Xg1coWAFxOI97zeOWA3dLdftXXYjg62lvsN97/f8hV0Iw64sukbsYa3o9Xr4b0A4XQtyF1u@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0BU91venTTgWduXJXn8s4gYMw05/+KhcK9ogz/uAHnf6k5Z5a
	V5c7xLnfHcOvWrxX6xerRjrdJq3/papn9UxNzZTJ8kXwfz5BA5C74FD9jZt+6zbDykLgLfdr0Q9
	x+E4M1lTEb0qplLoRmp3LywW4/t+nL1R0TNbsQrgITpYs1IFmLfBg5GsjqUp1hgTVPFJa
X-Gm-Gg: AYBFou1Rff6oCpnhWfoo/ArbyliUIG3sHEummVW4F8GrQiXfVh45aNIoJZsmcR8ClbF
	XmTdy5UWoq7MyWKTwfpZJr7fgnHwXRPZs3VhmxsX2RIKfWz1If07ASiknHLitiDlmA/DhmQFEfv
	6WNmwXnaZB2tL8Rh33go5jiJgmMAZQHwjDfC9rITIqIeQqCb9kw9e/PqAG6GqqD10dId3olNMjm
	PCbQZ12I7aRbbwWQcyLJBbqB4t+SyVCM1FaO7lQQfWZdfSv88E8D3zhN4PxhWjGtRMPiRwgNPgX
	unwJMx/RMhiSJ6zgDakcPU7uvHj3YyFPUe2XcNNAx/QTK28vmvQJI+tPQfwH2mUpmvxcHCv29tX
	SK7WAC9PZp6h0pXgGPaRYUjqkTskp14Fb109bgc9stCcgC6gxiN0qjroV1ug937vE029Tjd3IE3
	f7GIjkTtBgOaYvHr3jvA6fxBzdVKUiSxil
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr6938517c88.30.1793452272417;
        Sat, 31 Oct 2026 06:11:12 -0700 (PDT)
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr6938476c88.30.1793452271906;
        Sat, 31 Oct 2026 06:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:11:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Sat, 31 Oct 2026 21:10:41 +0800
Message-ID: <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: t5xiVSmKseTtRShPk9jXcXbkL_Jw1Zg3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfXz730q7HhdHte
 d6EvWMvqrk+mpYnXND7wBrd5lqmmAcMKHacKfmkcqTFsl59rHVYV5a4J2E5Dtb9LqGLgv6LVNVV
 uY78hY9ON3TgDLXZZti/ZmoL+YQ6Z0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX2CLSpY7VEgN4
 WIa9V3Ia80TFiJCHUnFMN1d2yXQCoIXv+BETq18eFshWeUxzKAGxyTJ3zzgbtGwwweXO4GpV8PI
 MqRCXlmVUwkRNU3wssdVpsXQf+0Th61YnZI9QurGi0SKg6/rKRaBsaKMdFIKVkbrSjvm1EXjswQ
 tbZs3laFwnNmrZ/X8Qg8ZMGiHRioBYPyHY5T/ioHedt7x6UjVsW0kXIEJHEN9mHy70utyT0AW0j
 uAzTOhM95CnkYdWzHQd2NWusfvbssbIdM7FIXl/fiHujMk9x8aepUwNKJ4F/xzncJfHOe2tr8rw
 +vaNX2oqyLMdSMF8Q3WLKQH6wG44njMUzzJGE3T+hZ4rZDuDBOWu4FImMfLCGRg/tLQn1wVoSQc
 TbkaG8yZ1CStudO7zvpY9he2n4OSQxU73Nd7/Dl01jgoKdNskoqYvXET51HMbt0SgQ9Z9r1eq4i
 VsYiNc7jAGt38Kol2Xg==
X-Proofpoint-GUID: t5xiVSmKseTtRShPk9jXcXbkL_Jw1Zg3
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae5e8f1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=vr4QvYf-bLy2KjpDp97w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..415567b085db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -490,6 +490,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

