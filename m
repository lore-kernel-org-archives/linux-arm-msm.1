Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19653BED7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360115; cv=none; b=CEKJAwFZUtzz3aEdv521dfU/xuGs2LjDdgAti0f4Dt3DhB3epLzrzDXeHixmswYcyl/uKRG5mvO+/J+zFegW/mxypij6W9XZrMAK9Z4i8BHwb9IGMhecL9rFpHCU3IsoKE4b0dXGLgpYjF9Bcf6aWN/9n9NzZAuwZZteA7K6TNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360115; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsYswYS5VzZjTCY5jVZmQ+4bcdTsAjUY14hlS6w57khsrwLtc/bI8RcDchYon/G/fs7exIJvbQzu79xOLkqotiN6WVrRVzUZKSmY0yk+bwAgCWTk9k7a57uE1yMOEkCX0fNT+Tt5XbBimNXYeuG4k549KWV9uW64cFWHf9XuIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLHQD42I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaJAfy1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLHQD42I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaJAfy1d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SOIB1486549
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=SLHQD42IJjhJjrwrc1vUX/UrkAR
	PjP7jXeCU7Ov40Da2cHjhiWodrxWYXvX3EoNvqa62dIl0rh1gyCWzv5ttci462fU
	lmmAQQsiWKZNhv2+qvTMUZacgZRjJd/HAsjnJmuLgXa2NNtn/7xh8oeqN76zo90+
	fauXqL2mUuUMJxPB5MSky3wlFomO4k5XoFF+497WsYXSDwizoHSxQ2jMTvDACetA
	C+q2PLphQKhXECstujA9v4GeJQAbEGMi4lcjA5bd5Y6F5F6hI6AYqVlvHoAbmP14
	zOIQPy3V6sqNFoV310PnmoEeSFWvtWZcDlPCymsq9UF3FuVjS0ZkzPNu6jg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xt6tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:08:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1191923a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786360111; x=1786964911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=IaJAfy1dTIbFHauYZSJFzbmEeUWgDQj4CNNGAAShGm+j/6+DGgvfz0lpo4XNKb58WB
         ftfeSDEXD6b3QbA/ESMvtc8kr8SkzIacq+bYD+wOpasUp4VH9kV644O5PLEDJZoHSMz2
         /hMygV2ZIWdDCEHCfmru3r3MoMxB7cDrhG2KNZQCGmnQBXGG42Euj9yr4eS5lQ719Pu7
         ZyhjmJQPCERmbc4zLo+j6brEtd+JwAX+FsZKgH2dSjzcZbViu/zueyWhDnlr83Sbky5q
         R7thxPrQLEASMuoqvKhyjkiqIorNUehkIBr+ZNJAC+VILMWB45DTeGR7AstLpheYR3/B
         2byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360111; x=1786964911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=V40csNTP3r+iSxjPqrWbFrD6vhGBvCCWytry80HdNlX839HxnfxS/4FC2HE9a/O+z7
         VlSegfIsZU42kLgYZotm0QyloUGGya8N9F+ojPzEq71NPn3qWC1h5A/UwXPEBW8yFFfS
         r1QHaZdksR1bM9nRtP4rh1nrBf7ypmrlULpZEm4pGjMuZajCl5N26o45+ALxW4wdVEYf
         A0Yk9/Wv55P2Y5aaP0/QEAytTqawh9kPd8dVEHe2Lm5ugj9pf4xeHM9f5WGpGtKW0eZl
         i7HZzkF21897qMcFaCcd10nj2BobBNkSTc54T84YI4Cl6GKJbrhnk3zKerhf9OtL5+vN
         hqyw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd0zMNuBTW3EpcX72cgXAu4CYYdg6Wa8UF1oX4moQcLtMjc5q93dWqY+n4hD4604iyJYr2s6ZtnUQZ5Pxr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpenv92tTBRPDAbiVEV3UpMFHxei/3J/dnUtg4ZrNb2arNpjgA
	WGnhHUlUO65ID2sEmTVhuyWiXmYWolzKqF6Vq2rchQwbJjRUC7NOBwdhwIUFuJtHRgaS94PXCw1
	3cnlSdmMYUfKNW7lKrLwoHeb2S2S4SEsiizdL+UZXujyPYZO3Ln4Tl0A3IAZ4cX/N/jQd
X-Gm-Gg: AR+sD11nprmwxgnwcZg1qTrSMZjo1Ih9GezfXGVaL9o5of6UcoPrTDutVk7Ls1uIDQo
	Qdogq7tR3ut1hSACqLS5CBMBZ+qMeuEpgoxM+cPg5C3XNDLMWGXcw+D+ZQ7i3ZV4rrnuQUvZ0oq
	J7hF2iB/UyE2Te+T8B81cztomAmnnYYNV0il3bo3EKsWx594JhcpqtoUfFa3fWDT6OIaFhxNkqZ
	G2uM8Y+Khqduank/mnVcBxWgz78qSv8p9yy1hkAFuxYMVkVrbU73KqYXC1ihTFUN7itwjHuuUwY
	mKOe9egD7hxa+qSWCcSZY0srpKbWJ9O9+0ylv+O7ddXYRd7qDpqdkfqU4ovZImrAH/gnuEnsHs7
	YMUcwgWCj3oLl85HZAOKUo31vU9P9Z3wLUGUQXLNRNI8qVhNzORDNVAGs/0kd
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr21462740637.13.1786360111034;
        Mon, 10 Aug 2026 04:08:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr21462676637.13.1786360110565;
        Mon, 10 Aug 2026 04:08:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm46520198eec.23.2026.08.10.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:08:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Mon, 10 Aug 2026 19:07:24 +0800
Message-ID: <20260810110726.775084-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX5EQ07vioXnGK
 6yaROSHAyfW2RroEQ+GXk2J8NuDMqZriN6OiUwOJRxZtCOrEeUHKkDR5KcbBZHn9/NdGfh/SRcH
 +wy9G7Hnb1zxCdWxzRRBCxDcyvJfeFI=
X-Proofpoint-ORIG-GUID: oaLFHKV_trcuIkn0xXKbIp_0kBogT4xd
X-Proofpoint-GUID: oaLFHKV_trcuIkn0xXKbIp_0kBogT4xd
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79b130 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX3/2nBBNvRzuV
 ZZIfsh57WncgG1Zk+WEnJomnKik0HV6FbuIJ1JzRPcR5ZvUWUmnFsLpG9/sqRx5z2vYBdi9wLzK
 5d1ohqFfJl54nGvRMmDOofKHJ6r0we65COV7o39wdoeGnzAsxCqy6MK9I6bQU/0O63x1JOkSZoq
 /LTRyDpRLscbJBzUJQvpIqpKyrXCnViUPnPmrxTM9uBrGRSswP6EZtKaxx/YcAidYm1Q9NBLFlO
 yp6+/NL04EzUg40ESkH3KCqmLY4VySqKsrveTqlpcIJ9IRyKxj9EFNt6OIUQ7KmZXozkrxnmDsR
 GPuYvQqyWaA30agkaAsqNgU+y9pR4fA98PYVDlKZAD8BIXJ3audqwQAghRztyeSXOZcwUisRoEn
 qnr3bV5R5MXyoa/VMOmH3czw4br9yqEb0LxnpHWLQggrAwOtvESP4BpFOlLO3+Hs+vL6HxX+Rp9
 qkCZHiwpXs43GC3N+5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100097

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

