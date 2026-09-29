Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D55A4FD785
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675329; cv=none; b=uPQQAUXn77cWqenD/pekcX3tX076gvC5wHWOnCBK6HIkM6CUp1y9g/fZScT05+MMNX1/q0QBVnniFqMdhgbzwKt1z5NnL0Vm5bPiNqfLoCEb1hRYHn4bVFTYFXvW6ifpFRciPGTxn84Vv+8ce1pEZTdMAX82YHOxt77tJYsX50M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675329; c=relaxed/simple;
	bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+7f2rERb4myeNgANQ9rnDW1YvhfELebWSvfpVIN4fUl+8KYUy/VFpnx/S0mrYqs0CWyMAAt4iDclIpVa/afaK1yUaB0mpnutBgTpYqhpeuA5tYuzXtZaLGKACi/BdKZsTABGouxtxlT2sQpKh/n86tMpRoY06g1fADT8P9AF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koOhRLNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaUY4s/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koOhRLNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaUY4s/Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tpq13220622
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=; b=koOhRLNO5KQmXB+p
	wYSKWU0B/gIGJomYj76p2TtkZQ8slliYa4DcFyT+f0gLnU65SnPuNs09YipwysKa
	8dORQdwrhIwjTg4xCyr1feRjbgG5ofMdVpWPmISOXgiOHB/GjyF/faC5jMv8ayeN
	7qMDEQMw+qgrYEcLSyupEPeny7gzs40Zr9VN0VLUPxO7RSAMmvr0v3avs43y1eHt
	mL1kJ2r0xdEb+7sIoZ0yKblXM4PE+o6yAYHF9u7aFl+t+UWHrG7y+uOrIFenJp6L
	WvUuPZW2HYtDN86KaytSZr8GrM0FhVM6gjQ1udnYbyKIXvwNfLpepQcPLC8rIvL8
	g0Qd6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw23cnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:48:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33baaba6371so15145022eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675325; x=1791280125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=VaUY4s/Qgshqy2Jpc9sZ7kDXwHXGOX0eBykjbtViVLOV/ZRlxXXZvdF3C5dv4qdX/b
         QpHD6XQN5gH74grzHe0DIpkHxvWwVsub4xAgONa8cIFo/beYiygf5OkmB3Z1Mj9nlVXY
         rg7m3JwAAAwaLZmFWfv118oe406Dx0L7CENF4SjsliKCh1LP26fHAkt4Fn9sVBSOIY5z
         tVhTtTUpI4RGQTkicFcoBht4UQXJNJm3iP9m+RpAouev2ekCQPLlUKctqgWh5z0xwEad
         bYffJo9l/TCubUeiLUskaUwVhrUZFacxgzYUfATrBJfU84KPpyxDgY/s8j24oxJ3Fx3g
         fSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675325; x=1791280125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=VV8eS+IIj/h5sjRb3cpeqZb/RnrWBu6smJhcKgWKwQh3i0XvVW/8GJ2iGkox2nx3Pd
         awx6fyPz0+M276oKq0jYOaZobZyjxnA3/Drzn6zKwLbyPjNBViIyyurNpb4VxPC7UDZg
         xpAasEdwaeUKhpkQFYLO9Nt9U27hgbEDS+UUjhHShNcdFIgb8++XvvxxKs/ucdgZK1LE
         bxzNBqKNM0Ah8YC2U2S8p5PZl6RrF1Kh0zWRGy5JYSyi9p5aVdF9dIpWw56uND5u8LWp
         w2F0FLXjjOwCYVIrQn9WG8RuZmPB+cNCTkVr2AtY/lDbGogw2fd24SFMTIS951rcKVMp
         KCQA==
X-Forwarded-Encrypted: i=1; AKwUvBys1c45ytgjXKVdZQgVvGmdkfmEVjIRQR9+xNWO0Q7rfGUuLCtfIGDWffNNW+zJ/H6QeJdOWRWeAruZuHmP@vger.kernel.org
X-Gm-Message-State: AFuF++muoPaE7fNtQvrxIvCSyZJQuDTet6UZxXE8y9QDgN2SaPRqnRfW
	LK9XUP8byyT+FNngd8cjb26NNoz9ijfJa6mu1isWth6dWjrlcQNY5Vyf6pRP2xVmz4uF9mE9s03
	c8s6DMiodkjQ1DcDJBFPnZPhMaaOkA5ISYKaVSS59B3CDdiL+mlEIHuthp0/RObataLaL
X-Gm-Gg: AYBFou3G6we8+42+2RHLD+HmeO1BxHvXFgbNzAjJmTOb2/qlLWOddFGF+SWhYly3UOD
	m9/HIBtVCnWEjqY6tAy4StwMhVZPYYiIMrhXAth8bzrxjS3SXP03ZliyNNEzn1dDWDfBzm+KrhD
	dzzYf7AdP+CKlKLj7dSQR8P7iubwuI833Mc4HK5nrWjf0wIUmh1x8Z9alZMWf21/5uAXAd9WlkN
	kTsChJrQoriHQMgS/2qSTGoqyE9B6Bgc95Z3MeTuN5ksW+8vkD29rpeScIbhAIg0f2+3c1BpqaM
	6QqcKng9NQdvk9M7aORdH8vSPSbXjvcwVuZ5WYiVghNxue5HSqIMDB20l3SKU3AHNeNHxuEQ4e9
	Xt9ysdMfL9Z1iiWqTmOcdyf5ibPoOGztHx+Ta4j2BIV17asG6FDBizsp0TIxkh4fC5J9siUIcL/
	URs6b3FblkYTik8qrRTZQSQ7M=
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414857c88.17.1790675324949;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414819c88.17.1790675324308;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:18:06 +0530
Subject: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=1170;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
 b=BNaL8nY6BMt6oeiq+dbAuQA8H163cAxwKxfyPg+qkJml6TLk2y4CdmQebdyvtkeJfQfH2YXP5
 PSQFEfxd4xDCPWndJQ7CRB7xxA6Qmk3wQ9Wo9bcADe0CHtZunb2PwT0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb897d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p3y7badNstDnMIU1-wkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: mOnOIQRS9D4db8yU9CSnvSa6OQlh7WvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX1k3bjU/BRxaj
 EVYrPriBFVd2JIIWCZAsP46kVL4h1uh9pQ3KYwcNmA//hqu2ZA4HQcWOp0JI5Cco5+WrgX0sOyv
 j28RvK5rljaP7ewkGzNeNsntwtG1UC+wE7E0gOrj1Dnd64JVn3IjTQG3UGoI9C3hKTAuyrr6CXe
 1lvHGIqlmy36W7jUOUbkLXrnkRkoOYlABIm4EXhld7atUMr93bFRwbIPMcUVy3QG65YvdyrFNAb
 FCeSEd0JE/fa6D89i37S3YDX3Ay7Y3Y8MhCkD4dHfigJGLuX9vLKjTnmY7xv9RnMPocJ/ljbdal
 dO9VLPONifVvYedC5/TxHK4sdPORSHPmnGFt64oAbNtgep1cZN88/mhQ29jTleWiBMVTSDLx8Uc
 0ne1oZrh+iOs6+kneSXVnqZYCzyc5idUeUJkjoQEioJZ3fLq1Lw1pH+TgUMivXwvMvSMUSr94/y
 qaeD9laUjji52ft/PUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfXyVxlrPYwxL1q
 3R/3fhcTUVjHd7ukTb1ElyTt/27iK+M19/6hjhphcMK3ShTQa2aEGACBq+DhP4ciXP03Me2d20N
 80E7CaLabXs53dlkf3jgDBiZJRDiNQ4=
X-Proofpoint-GUID: mOnOIQRS9D4db8yU9CSnvSa6OQlh7WvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290038

The QUP wrapper maps its serial engines 1:1 into the parent bus. On
64-bit Qualcomm SoCs that bus uses two address and size cells, but on
32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
forces those SoCs to spell out an explicit ranges property instead of
the plain empty "ranges;" which dtc only accepts when the child and
parent cell counts match.

Allow either one or two cells so the wrapper can follow its parent bus.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 54cd585f19e3..c01ad421a122 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -36,10 +36,10 @@ properties:
     maxItems: 2
 
   "#address-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   ranges: true
 

-- 
2.43.0

