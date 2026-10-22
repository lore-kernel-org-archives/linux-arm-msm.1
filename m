Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662611;
	b=m2oIqyat8kCzSSvTnpIBy6Rp3PCnYUT8s5jYFtGdqs2zSX/j3yJtx94drIzHScjk3Gtx
	 XPxN1a+n+7ZcS0+XYXrMa2wzGEK5sELaH69gCaIXKnLoDVkYf9iP5DqsJdZQttOVUA3Ud
	 dkDzI4x48kNYUx2MUGr7vRyBf2L+VRzrMqywzvoNuNsV7BK51hD7xDL597pYthwe9FRMp
	 FKn49eIuXzlp1N1d6oq2V78mFDT2xLtFDttmoAdjWTIa99BP3JSBjWIyI4RAznDVF6KT4
	 ENtXrbEhnBUOZg3iqYmNRzRDNA5VNrJoLV6QJOBOorG6OYDEydiQzy35Hbl7MvydTCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
	b=KzYwqvD+IKXZD/R/rMG/VIkgVCuupdokTUPXWp5UOi7RYFHSFJJsXL9wuVPPZy0Bhj1q
	 C5cWEiz5bmaYb1DlnNrhuTFFMPD69SLdGnFLhU5bBp0GixBpYOF03acODxA1PruI3M3GA
	 RCN+d+i4XSylxY54DP0OGIIcUXWkRM98yJlaB8+NQtFWzfEc57DuHzL45OqZeEoEBn2xL
	 uLl2ACeeDH6Taik8CqTJ+8CbKUAfkf5kNzH8SMBvAIZxGNaEjF1K+x/+9x9JN9LWnXuwi
	 csuHCy0dBS84eLMZqMvutmh+4SS2loK+DGkH46OHMOBtcNsZCYPhNIiRa7Q+pSc8GPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbXPla0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3e0OREI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6EE606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB6EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbXPla0A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3e0OREI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702j43076364
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=; b=AbXPla0AkEHYbGxb
	OtMj/fQ/ZX2XeVwGNsyn4zdC1u5ODfSLmejfHwDj24HV1jeRxjB49jrugb4ckTCl
	rHRtmK3VYImSrD2oN1zxhiZsd9/s6SCvxvtAUh4NU3jvfc29dm5WOql1NSuVj60Q
	VLGdxU6vMwpifPZPK2HCsoTfbB4Z862NrISLeKW+BPRhN3qPkUcIEqot7KT1QMAD
	GGu3GHT9z0c6+3Hi2jX+Tcj9F0jqeXwGminVTrlH+S6aAutNxeUyXg5HMVh8csTo
	/c48n5M9bA833A/8fieLN3X35L0jJl0Bge/X+xpPaxiGonFUNKjn40SfOqJaQMuI
	NfWIpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1s53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso4774401eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662609; x=1793267409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
        b=a3e0OREIBav/Y1QQFbwW6QYVP2N9sssukwfiNr6xG3E3p+7WGz/IpgLNIMDUYp0YSh
         D0eWsDsBtR+5clau2tFDtmyI9xf90JPGEQ+F2KRbe0KFu26BxIrDU6FKJ78CT8FBMHIj
         OHbMZv9Z/aTHYS4bX4hbCUTvx76kQizxh9G6ZL0Yus2n7hoHqrcvoTqKOXQGKXFXI/F0
         bovoZ9JrE6RvyGwL6zgaURbTDGG20PKMJXydyIbrIKfDYs4iiWd8l7kiUef32TXwY71T
         sBt3CDiHm7eM06YmtodDwsfMRjPGl7yNU7UDkVyYdhSRKNDz9u/aF6cJHav7SCqxgf0d
         2AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662609; x=1793267409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
        b=er+MiBfYkAP9RI+rpsinEb/7N22aUKd7qmyTCVW2wDCf9FXur1XsCv9ELp0fROVKLZ
         tsuJFftmOKm6YW/E7RMhksQWpj7NY3T8ioKibAhA5aYtk/nbD8vA9pI2TA8grD3bvXkV
         l6UcdXoQ9J5/jRypCtvN5k0AG9c9Dvf9A1Kx23TOPEWsWroIhVp0qeQt5yhO1fuBr2Aw
         eMxxW5OdNU7L5S6n5ITfTxcGjzZW2HFwpR7qkbncK/+2izb6e5XS8yd849H4LpeG1p8M
         y95W+uUkeMGAkdAfGtdz8x29VjjyPvi0V9jnKQhCFATJ0yrae2HqhQW4XcTFbOXq9L7A
         mheQ==
X-Gm-Message-State: AFq9FYJSstc1RuIuueppZIiutMKwJF5lcAK2gxdXevjqD6Wx2/sYmpOD
	8w6geZF4FhDPtJ1ORyjbQni2iA3y1s1duYlh15gk59AC6bmPThQc+MDUVbpM2u/WYW7HuGKz97X
	4NSEGI4AS5mg+mWiNaH8t1baATrOFMq+FCb+ECHD6byTAJGLu6KL0n4OqSOu+2fWQ0ja5
X-Gm-Gg: AYBFou3lWuUKLmpkiQX3dxnSpQvBPdVK0kuqQS9KbXUaOn2YCoIKfljU2pFfhRPcLbK
	8a14v6IqU74YS6MWmrRkrdE4jp2Bk3GtOXw8RnflNGJlo3/DnVDs5u8+7D8VT1T1MfYif+6dw5e
	kiWqEgDZxGjlNkJTN3OPjWHOtcqDttvBJnPJc3lIwTKVqs/xf29vj8XSkXrZ6oHpkqReFCNWUaL
	ib08O/AMkacx7/V5lMQhZIkQtDdOUI9P8pCA0CxlXk5GOZ1hvnNq3SLHnWW15tPruANrjpFVYYv
	EUmKx29wYOq88cbJKZoIe9kuP6XISD7JjRPIxzT7UJvDNjhWqHh4Vy0Ru+TjEynq6ovmo+7e3rT
	4FTx17xraRD7TAj8SCjOgA3yvs8MUfKqFzKA=
X-Received: by 2002:a05:693c:414b:10b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3674ff008ffmr6968384eec.32.1792662609482;
        Thu, 22 Oct 2026 02:50:09 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:10b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3674ff008ffmr6968325eec.32.1792662608877;
        Thu, 22 Oct 2026 02:50:08 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:08 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:42 +0530
Subject: [PATCH v3 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
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
Message-Id: <20261022-kaanapali_dp-v3-1-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=1990;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=gFpmXsiRDLU1j4jPsZHAla7qt4QGjHqNVO9ALlnOzsc=;
 b=97hfX5kyCQXb5TRjlzEy6alGk4pMuHZazh7cCYnWQ/zPZQo/65Uck0Tbax8iowk6/bE5tISAl
 rH73MZ9wRI8AWLCySmVAhq8+krivvAC8Zo6YS/NcF9mJmASkt1UH34D
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfXyabrQoZeNeww
 ykN7U80RRD1b/MkmPCdeg5eyKoRWc/3XOWYLDJD5On1Ln+SZSimwVMhQr1pR3zy/EGseLG8z0D4
 YXtc3OVE5KLXIeujDuGVX6Jv5KmYAi6l36SP4IgKlwKN36qljff+XgNLHTovjPQUDNeBSd/5PzW
 t1Wlri9gnYa/XbYSAAF+tmAdNUCUN57fSiZkWC1s2eWtEpNEX3w+QPcN+xAwY3qkoFjvieHFbGt
 x8cgvEl536S+730y4j+HnFlrpIvSiRXdoXV4spDZ+zFo4YeR1fDrUgwELvPfGMcvmUsAMC++h/P
 QE+JUSQI8hjskafgjPI77Xs3XKXUm4Ja0AgBwk0fZdopfkK0g74HSH00whYUAvVIVG/DUhyviDP
 qI+wRtMrWmVLP8CPwoKlFb8xKgzJaY65+NrXHv2UyPFpuVO/M+1mzJzy+tDEt3onoo5lxn/CbtU
 t1TjzrnwQ1Ir+dZvNHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfXywSHn8eSN4GW
 myI1HByTrqQthMNa8qI7gJX+ZkrnmOCidos10AcMAog6YCydOUn2GkhtgkLr6oY6IF+qBKPYDND
 qUtWg1d7F4NoAgQXklDSbx64TgKAlXg=
X-Proofpoint-GUID: MDPC_9eH2BH0M5xSOTNUJCnZx8BOsiy0
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9dc52 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vzAMpc0yBbT7bysrcb0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: MDPC_9eH2BH0M5xSOTNUJCnZx8BOsiy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Document the DisplayPort controller on Qualcomm Kaanapali.

Kaanapali uses its own DP compatible string and has a resource
layout with five register ranges and six clocks. Add SoC-specific
constraints for those resource counts.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 2 ++
 .../devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml       | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..63e1b515a355 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,kaanapali-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -275,6 +276,7 @@ allOf:
           contains:
             # 2 streams MST
             enum:
+              - qcom,kaanapali-dp
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
               - qcom,sm8350-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..b4851d1d48ea 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,13 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1

