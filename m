Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6517411FA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572503; cv=none; b=jqFA3z7LBZBBWujgdXfC7DLXvtUQYfqRZCxz4MpnSurhaEYvndRglgp7swtylWMiIoTyYJLPbI4QilARr1pVzHnNyybGy/Jdcmra62rbW9zKY5hvd/geFq/VQbSU+RkVfDoffMF1wJZpPx6dwaoZQKjv4Si7TqjIXNVAErBmWWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572503; c=relaxed/simple;
	bh=ILEyKxrSwZN1I2SJUcHf+gZ6fdeE01wivotuEyTrur8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sjw/N1aDBGVfamOcWIzWIRWXR5a2zhwcshgh1zb0yBa5yrzkH1Z0mMWE2QSCB+usdkqdzWquRp+PqYM9PkVEnxAavmmwPTjCIDluT1Ab4V/9mAij8VKa1gSbFaCxJK0zjLyPuXoV91cnv72dxUcuR1uNyPid5E2au2wyHGbrouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJiUxzyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEZQqqdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJiUxzyj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEZQqqdm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMmZo1673476
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k0JF61VynwiGhm6ZKGXkMg0etTJUCa3/RmwRnNWwAmg=; b=HJiUxzyjdvjmVciJ
	mHb6Lb15IL80tcAjngtjMFvo7+D2pchfH5fhxPtaJKt0g/85IQeq9Ml0TfeLWMKw
	lzkAsdFIc3w8cRHGWmSxe+WCCdQMiI4J9aF+JM5pkAyS/Grq35i49uVlGmmUPILb
	XYdK2x0DtUZEPsGMsfajBfFQOOuX6v0Ed8x2BRDXD6l5ncoGmnioM4qAEut6OQYF
	1CUGso1gegQ7N4c6O4Pc3p2SDneX5piD51j94j21v9n6PRq1MF1vy1FR/WjetQZI
	3r8Jyo3kDXn63GSS4K6XY6bGI6DGUP72m/ofBwm3Ou//qFO6TH4wksjSgnCq5DSM
	vCSkJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf114w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:54:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90410c668adso30509856d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572498; x=1788177298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0JF61VynwiGhm6ZKGXkMg0etTJUCa3/RmwRnNWwAmg=;
        b=FEZQqqdmnWPHzy0CxWs7b20YHxMX6qQfmHFcVntjF8RY8wwOOr/2twwsDGgGClN1Y3
         /BjwOzUZ+ihftnL9+XCDjTw/AoTz3475ST58DbabSJYmcNtu7U3IWeOvHTp6ixvi2Wi3
         sA8MoNlBbH8TT10WwbhjfTmxS/g9cQguTCjQPPmMU8/OGL+SXJioLRzpaefzDsNer387
         GWEuVZrxO7sISDkopD4oyNpvcPmIjJCFp3CL4BXqPg2wbKE75i7WU8pFh4KvKLZduVxS
         6GT6gTkkH2LPxDYu3rfI9bba/nSeaqPO6gNizlku2aL6m1Rlt9uuejzMFLPlkHi0NEaX
         YH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572498; x=1788177298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0JF61VynwiGhm6ZKGXkMg0etTJUCa3/RmwRnNWwAmg=;
        b=eD2t3pDwQRcj7E2M6D1HXQEbvlzgSHHHPfpTTvKV1CN+9tJBwQ9rkSJceQnxKk4FNh
         Y60OOia/Z10cHdCYfriiJ5LCWP024d+58C8qWtY/tj95ay6N/N5OpEsdOjAOQjamOjQH
         81C5De+TMq0Qcchn7EDeNzkxG3LqeyHNS7Qsf4H715VSzbL4Ap8gZUtIlATpCzi+ILn5
         8u9Y9fngGTxPkhQ1awSSKYzwhvkTUrAb5ZR3OuKkjU+6xOJyofk2kt9AZWQUt7nqDr/T
         MxMs+KJPD3rCP2o3cO7iK7IfOGTOsoEv73JSKsHtTzr2HXijCM4UxLKTi49tOpkovf54
         Ouzg==
X-Gm-Message-State: AFuF++kOzX3JNl7Qqq5PzeuS19ql0e1BEr2+KxuECotXi6uGnQPFHURC
	1HBKQpycXrExKaYvgLECDr9qhJl8MEzE7spxDIaHZSjfz8nUO3N2LpX/DBQSkhor5sDc+rjXrG0
	FEGv1+BUICFJaEqODk840R3daP90daR9EstVaTaeZ3Xx82SHzHQTsPl02LXDuL8KwFc5R
X-Gm-Gg: AR+sD12tLiUkjwGFEcnmtswmu5dQRQVp/BT1uompZQHFaPme0yjI9KfyanSvXngOzoG
	C0jkC1OZjeMpdIy0U79w3bv16APKd2Fwb9e1M2gFpi8nc0L+RJv1jsLsvxUoBTNRmf5MKEPj//y
	c5h3tK/AGcADxuI/HGHFh7sUy7sSqCMr4G6vc22UPNTZRsNloq64zjyFB35s5c0gW/96PrUTWAp
	7jlfeyeUNFpHOkGv6hhM33zfu5Qwm00IKBhA8mSpWTo5d43UBpMTwWOqsaBM7RzsNA91v1ROEXG
	OnBDWa3DT33bgw4ABsQMb1G6zqpHUPDcRTn3HpCJXOhs1Dzm1Beg8nGmeovZzgQgn/VJTlQUlJo
	HhSI/qIDo
X-Received: by 2002:a05:6214:528c:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-90c80e00b9fmr244490236d6.16.1787572498025;
        Mon, 24 Aug 2026 04:54:58 -0700 (PDT)
X-Received: by 2002:a05:6214:528c:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-90c80e00b9fmr244489946d6.16.1787572497497;
        Mon, 24 Aug 2026 04:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:51 +0300
Subject: [PATCH v3 04/47] dt-bindings: clock: qcom: gcc-sm8350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-4-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ILEyKxrSwZN1I2SJUcHf+gZ6fdeE01wivotuEyTrur8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDZxKkhP9yYqje/1vsUTgRDvYC0DIYRPJxo4
 DJ2v+SU74WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2QAKCRAbX0TJAJUV
 ViC9D/4kXPXnv6MpIFmnrM4ZkczZSgtdyCvb/Gd0i3CB/9zxz11OV/vq3p72a6LdLtiVIg58fh0
 RA6g4+cVp2XXbHibNT3w0r1tnafLCZlb1+PLxCrUUiRZ7+0IwtnekfXw3Ae90b8cxRvnLSheh93
 j4x/IR71c4SrOibOhS4lVQdhlBMT8HbradJ95EJxadhgfZ9QOzmbnSpahE8jnBA+K+nv3TYLsqf
 mjHsQsT9LKB1mXcffYHnIc4lustXh1LRoLU/YNgl71kTFtgkW6IxvpjmUt10j9P5iGYmnSPWedU
 qmnRRSveXCDaR4UaNY+glzDYUIi0mlKIvhuSMvlU5okFiPHWUu2Xd+eBPnM0W9JTqqQiJ/2JInx
 4x6ihmCf6wg/HPfl7POIY206L/OnoQpR0hzzLrxowTgYEVk1UI0mWDWtP9IdofK5NGCQdKQoeYH
 IVdKR6mQqJtCuTiEroRKcEVg3mQX74QQ5RVCtklWUDKEe6wZln3xD2KqwepSh6C2Ej0W3i1/Iu3
 WfC+75pY8Om/NDVBaU/I6sE9kn24XNIVIqnhHYoyKWe13U9JBO+J9Zm+pSPwVkl0NWcnhdMMrZ/
 2t+0Keth9N3QLujdFhncZSnXTHuo0Jrn1LQ00gdAs+edO3W/LJPDIQc018hYJuVoAHdtTPbEYNM
 d0kdjZVROdoED2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2wFDRgu2ypr8
 26dEs03+4VEZ9RhrliR+W/Y54x/Xr2RCSfc2HsQPBV5yf0rdoxCTlpqyKvb12BnmTy+omjYvIlF
 ZZMASxpae2P95aPrwx0066S2UQuwF4M=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3112 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tW1HlU1V-MCiTDxplKKamEpoatMPxxpy
X-Proofpoint-GUID: tW1HlU1V-MCiTDxplKKamEpoatMPxxpy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+9/pXqIjuB6G
 WgWKnhY4NCJ7mrER4cUHuwlZZ0sTof7xgot1wH9JRRLA0aMGFSiur1DQABZuciWZMaFNgYtvHNM
 DambqCNAyqYTqwS/Hw52O0R/C9VwP7Wyyy641EcZYG1UYAvMxuv/tCCUC9GzwgTv4RTYdRlLpnP
 L3zd1xln/2yj0ek/qnYkc3yzLRvvBdDsD5TPPO2SDFqCFH3JD6bZeB/QdvHkUcIBJGp1EtLz7Nk
 pWSYZY7NLJDSruoEI2BJOQBuEKkTpEPlbnTltEgGLtJBHuqNMxdI3eDU26NyFREpQdCr7blodaX
 NdMK9xA9TbvGKUD3Xg73MSCjG0LytCwyj4KyJHrUHAh+WI9DhE27/zHfpavtvN6zgWXkPoYpNGG
 MXgLwew7fbGf0xC0h0oS8PtgGzAY7hNwUl58mEkxKDCmQC7W7M+icMckA4PX9E5I9d0FX8VwubN
 WdZaVfK4GI8d2tKdA5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8350 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 97ffae3b5522..d249b1574e0f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -51,10 +51,16 @@ properties:
       - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -65,12 +71,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

