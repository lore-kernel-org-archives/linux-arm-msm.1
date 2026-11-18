Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985239;
	b=c84AU+fQynlBYArHuGA8OrDYwE3vYu7KpOQ7aa9Xkbnx9c3v9RS4Fg4p1+H7PPm5Yv7U
	 UYDl2APF0+Hc30QonnlC/xpfj4jggu8Knr/9nOMF82w33Xf0D+l3QkJa0wl7KT5DgJRKy
	 QfMlQCEMvFyqMN6JEET3T2+9dggcOTV9GcnxoqiPzB2/djwmz4PEM7fXtNctQUOFuJFO9
	 V+C5PlCeRKba8O7bwtqBKvcXj4/PaIQjt2ED+xruowOylEdXl/IxKV20EWLLTi9xy87FL
	 WDaRGc6P2Uc7JH0igAoXTh1APhYBhA3dULxHlyPJfiiO9uMKYmcC4yQ29TOc53DPsQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
	b=FhYAOijJrpSnNUR/ThuG5hf/sRgmiqWO7RGjh7GcTxPYU9M0EzUlgk4TFD8u5agEnckc
	 FFVHFK5V5ZWhVG4C0m8emrV1JozbLSW6/86anDWlYlE0YxmRnWQAYFBD7RNeyKt/LpcLR
	 LE7UP+l0519W7KHv8aaDLZc+aEt9ggOWbdvevrFozfvinKnKkUNwJCX23SH4fuc0GQdYX
	 dXIL4PRidv8MSAbbsMPhg2YIGO07gT7WHEOwahgL7pkaixYO8K2aedhwb/LxW6OiMEZBO
	 +6qL+pmU0ZAnGZfi674Vi33io2Xznyf34SIO9n/1rs8Ci+iYknyQY35WVATahUrDosw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYsIDQUD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esdnwFZ4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A984606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A984606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYsIDQUD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esdnwFZ4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uw6B2602462
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=; b=XYsIDQUDcnIRxC4e
	rKcO48ZiJuWI7O2yuqilCetwKDSvWa4v7cH9BCD5Q5923xdsOa0GzcNrj8Wdda8R
	RnTNegNGDOrZyrUxyJtLBNZOVCBQfD+pkD4pL1Fi6hglTi6rrzWmQTdKyphS56RX
	CGXQBwxc6WOfL+k5yn/ozWXwBlDsp80SqK/+Q37PinhwxnBXnF9Q37weBIw43Aw6
	4dLL2sIycTnGppq1DfYssbusr69y+r6NR/fJeg6fyp71LnSgCG5YIUw31EbRn5oc
	Rlj+wg6PGM0HnkkH4foChujx07znzDIQWctWk/IWbQsHYh0mijyg7PlYHJb6fDxc
	YE82Lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71qgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:00:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so2443883a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985238; x=1795590038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=esdnwFZ4G3+kF2oRddDkUmzyKkFsob5QvhXLe+oVFY4GJu+pLzoXvckjhi6/jbxp2A
         CaldhaisVRArA2mcIW3qL5mtQ7eR8Tm2WcShnUTRLfahjBSH57WdoduvRKjkbNEFoCNQ
         mQw57VLLI+jF9DsvhSVd1gWjQ7H3nA5pycWL/hyMipBsXEhLa8WODj5i4KS+WfTk3Wih
         M5ABwaKUqQbe3MDIX7gJgf9lZFgC93pTcNROQPw+qJbW7Dl+m1GrOrI7uRwECqQ4KQ5Q
         FA6rZipwjavl4MEDs2NXKIic85hQhExAydB0yhjtJCEZUHrhdQDCm25PSxq/FG5n0i0M
         xmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985238; x=1795590038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=BI9t3Re8GjVbi9Nh4R1ocVZkXU7IIS6R501NaDIUkD4H01WmPBNO15QO0CJNImAdWO
         tfhKdhO/WFJnYmJh3tacGNPQFcyksP2AXtuefthMmJtUt9ZLdhQPPOdM7uHKGcl5W4lr
         8LeLJ++eDILBC5+U7MjZUiYGLrqLaGyV5yxePxdY78f40n+L/evg+2PPwMclC9LibjP/
         4QueXgaMn0WpeVG4BBtjzQJVseo2aKV+lU0ukg9BtfslKCmTK2d2OQxGsQBVQ+De6dj+
         zQAn941LtbthqsAEoKanUYXOLaUgk0nMzNwT/g4NHBNDzr5ih7itUARh0U0NCa+xcz57
         9qtQ==
X-Gm-Message-State: APuU4Z+Kh6HB6pk2niqQWPmuvSZlwhew4gQjW93d5OFteIRvWakOx5jd
	TddRC9XnuijCbNE/R0WL4UTjeGLuyAaD6oFsP/sxXllrxD6+7SCdjxfjkyE6c0IAydbo0GayUkj
	oD7CoF6CWQpkcZ1qRNBMVSE6Pwiu6Kc0A7gsEom+xItITNSHRUYsQao8YMCHkB7FTy6mK
X-Gm-Gg: AZFdTZeavrIndEtiRkfjukJB4aLalYMPvZaEkFrc5GLii6EGSm+k2Cds9Cooee1HAk6
	meNZ6q5+rnWVTh0CcNrI2accC5nUVMFbRwNIYA6YplhCFJ8A2TeWlFnIWM3KxGL/o+6Z+hY9Ee8
	v8lmF6hM3SrCs2pN/MQaYynW9MG11Cm6kM7S86nBTzegkaNXWSLhcz8RN04/tEnh8mus/XEcxA3
	53SWeDRcpTBu5RFjgD1mPC+XEIzMtfarZ0O4scjgNMMJGTEnEYovXid1kHTyiYADw7DxU4bP07J
	Tp1tej0D9jU/35DByZSTYoG88Lt6nJdGv5qsNGd8ywQ0twotzQuB8DjgKIlgTVyxOyKtyHlbNM/
	nw0kmoAjQpUmM50Nj6T9f9MpsC/+ApjuioVxImQzWQeQ02qDo7jOHWDmAEg4qS391Sd7XCDXQtQ
	fjB3Jrc43PlRUezFykxpPU+BkSUcjcpb++o6o1ekmeiwtDhQ==
X-Received: by 2002:a17:90a:d60f:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3d063d6d9mr1237228a91.3.1794985237793;
        Tue, 17 Nov 2026 23:00:37 -0800 (PST)
X-Received: by 2002:a17:90a:d60f:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3d063d6d9mr1237210a91.3.1794985237187;
        Tue, 17 Nov 2026 23:00:37 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm2743262a91.12.2026.11.17.23.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:36 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:00:06 +0800
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Glymur support
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
Message-Id: <20261118-glymur_ufs_ice-v1-1-2ffe4bb931a6@oss.qualcomm.com>
References: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985229; l=1009;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=d1zDDePFJIPVs+rwiQvZLUWqDZvC4Pb/+gxCqJ3DmHU=;
 b=95KjsX53H6q18VdjLq1oWVWsUncuKbVOF8jqFhBV7JY0+t3MyJhid+MeXsz/+TG9g7qrKaYTD
 g7tAVxNjs1ZB6WTLp7bFT6SZsHK02VOtB4y4w9HNI+yINUY6rhiAoCk
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Proofpoint-GUID: FtnYPF-3t_PPHykMwbyJapTxbSWiytHf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX3X+FsNhgHgS7
 9fvkZt7qP4Pq4ZWgwuvTabjP89MLolmz3x8/FmENrjZ20wPdScW5NqKrNWPsBab4XR+Kl2tCia3
 mZkQPSrMRsvcIyWPIAUm5G3TVyouwIoChPYMJJT7JmY7OJve2Lox+wGvGnOTa6veN4dYKk+c9I5
 L0aSptHz+DnN8qtJUo0RQzzWpgv8RBKwFhoxoaduPWAHSH3zeLU4/UOC1ka4YTa40RktaxZz5+l
 mG9ATm/QuwYZPebBBxwYuOrdcJObxj5wbYTcqDdsfdTHj8mFE/tkMKnxwHE9GEkcp1o1ZuztLjz
 GOWhQxhOyBMCyC/pjcykHRboAL5pGZrNK4AApvlPpBNBRXxf+SIxMDRZt9wtqh51n/NbvdynZnV
 Yl1TiKBGOgQiTlud9xJY7EKuPFDLaMttfv5MLs9+iDwaZZ1VO9SJtjo5uFIHFs9b9IVAo7miU5B
 2aHOQHckWkUMrdN3+7Q==
X-Proofpoint-ORIG-GUID: FtnYPF-3t_PPHykMwbyJapTxbSWiytHf
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd4d16 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=B4SCuiGsYTXXqFn_0MoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXxIqxzPDhgsKa
 5IS4vpCxOI+NL2hfjnSqxxxpedzysNG1ifcjTlz4bWXI33t/YKI+RBdzO2gcCj36NXznZRrtK2B
 C1Lu1h0b+vupTYKkuS97cVy4QZNv2j4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

Document the compatible string for the Inline Crypto Engine (ICE)
found on the Qualcomm Glymur SoC.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index b98c4c6b77f05a4295b7225007187a7b05387338..01a1a36652d759610e36d5ac3ad56f4b2d45b96b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,glymur-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,ipq5210-inline-crypto-engine
           - qcom,ipq5424-inline-crypto-engine

-- 
2.43.0

