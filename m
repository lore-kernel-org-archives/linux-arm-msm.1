Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280975;
	b=CqZ0Ay7ZAj3hZkQkjCRFbBGMpf8n/g2V7s19F1jm3ooPe4WBtuqqw5RI9MpdM19dmRPZ
	 hnze2D1jlGYtl3zLu/P3IVgW9RpWTWkMI/E1L+stAu8QM+qySYOziNiA+r7BXL7oSDJgP
	 clTFx03AV6gXgEH4Rqo+AtAazjCq9LZYFGZHszTX/gZXmm06SCUctLZYgnKVkav2Y3Rme
	 ttaps584nkxa0MUg+V7/nTgpcxKDaliRgMPYa0cjd16hbFaw66fqMJMFPbR/jF+eCNY3S
	 6ywZT7QXasD1rxurnhRviiavPA4cB3Vfja9uLjEZ08fJYSyFzN8cCb5t3H4FHYIm4cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=e5Q5ju8MGAOxgsiOLjsw7UC/+UJ/nW6rEaV9/5NeX8yE17xjTzpoOv5IAFywW+ILXJNX
	 2Sgj1jpsMG5NHE/JtM3vEh9t6aTDKcd+h+xIMZviLPfJ+tNNqd+Elc1ryFYuhXaVEmv8v
	 ngKRmxEFF9NA9NI2L/0esVP/x1dfajEzfy+5GLKXwhoA4rcaQsslCTKmzI6OdlwHk3eAe
	 a4jGuZ+BB5+nSkYAXDHHI4ro5xkpS4GJ2tayEzK/biEfj6rCbjaJ4NqaxsUAF50LChrqy
	 fNhaUG3iQxVf9zLk90kyZTUfvmQNv5Bcq4URs5ysbUm3DkCwYPo5PeVsKe6qfNIX3Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5fJT1K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB560A2619
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FB560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5fJT1K
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j3su2481920
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=I+QEeTFkHUu2b3L/
	XqztB6ygtRDdY9jVOSV7rCmmyTOC4o3mcDxCBQ9kfoPSP1j4snMc4m6hxvtua+oq
	ClX0PiiHmBM+2ZieTtgrCFya124YJyi0mTbgc34JiEBXq2WBlGciSq2OBaFyLKpi
	Bms/WdsLQeAE2fzaLBQ7tyhGAr/qB3IqKNIO16WxLDPwH1SUHFjLVItLqs4O6N2u
	9Rp3KP7uZTkvORJgqvvtuP+JIZpWAMkMx8on5raH0kBdLVKULqsmqm7cj0M+w1lY
	k6tnEzpRf0fcnAXqkmBjbaYfSS12LcTXeQ1WobFueAaqnNq4hbNRJpi8DE1/cAIP
	zMERmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82p0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso913471a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 19:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280973; x=1794885773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=hP5fJT1K9FqxwIiIe0KYQhmPx4hSNqUif0zonkGrkyFXvKzKBKz078AV56rOCGkU8d
         Qp/Mo+rAi2WBCGcif3VDt6M28v6+o4IHiTP/QIEKdrcuWPPdz3a/K/GQk6zdP7iSB1/0
         GfoR9Jfn5Jh3MievM8Egnqum/fpT/yQSY10wROQiG4LyFNz+rQDYX5pTlGVDTtxgJbbm
         jmh654xX2nNJU19s4mmIDoZ8Yui+wNZ8fT5oKmDGlZkOEGiTrP0x9qMqNO8DHCNo+Ntu
         74xSfXMTRme7fYyjjq9K1LbhBYtUCTtr6ppxNbS4H+VJ73bAEwdH6RuQuPjlgErrT4bZ
         mGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280973; x=1794885773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=K9PINsz1LFNLfdbS39m54uYDY6sLffXI62mk2SoqLM+7uCpMlQsr9u1qjU4kw2+Eor
         eH1dysXB6Q/hr04ryBblFk6KyzVwlZAG68TbTRUYOiqTrgcXJtLv4ad6HQa0fUEsfT3d
         cFvZJhDpxnACbQqLNVXkwAXHTeXw/SAs4a/Sf8jgJ5aSd1GUKuGm6uqqwCJV0q2OUq1S
         r2bQqAhw5Mif4ncnwYQ+a0Wd5aZZdjp/DPGL3rCPUxkdnWe6p2bw0/3HU5prAk9+Lq1j
         dG0m6Zzqz7BkdOn4lbgNh9HrnPeK9vSRto0qG3zHZIn7BcD0AHUi1bHUupyb3FHVH2Vm
         zU7Q==
X-Forwarded-Encrypted: i=1; AL+hErE+QY8yrh7gjbwXv7AF+X/6dyejUyqclOdNP3VIXfPnnB4c52rwmHyItyWBXh7IuPySKwn9uxzcxHIEtoNE@vger.kernel.org
X-Gm-Message-State: APuU4Z9qmMCtQeMv5KjoQ6ijHCFnXRtQio9YEckbAczgpTL1CwUj3anz
	XmXWubDx7OXOi3pc7ge9W2t1SGCW4Jak0/PumEjme8cGiJsLz4+RIQZcihMcm9Czk0/O3gRjNL1
	cLwMhOOsUazMiEpOVrUgS9zHfa3jZ8agrRMAc2o1NIdGJLj24gd7OQhbqugL0TDMcpVJL
X-Gm-Gg: AYBFou0/ohEXZIwyVyMeN9eSEpBo8OzyVf2PydXe0lP5PRV1cryB25t59gNOaXT6eXb
	angiWgUGcGaOOWEl/yx7ETMS4VoudEWcSMXkH1ZY/dGSZjMGlQA6Ajx/7STYFTGHkWwPtKlCSHP
	gfkhkyMO2MP4OCUzK0gffo+FyHthBcHQkV+jM0p6wnN925tyMulF8fcFfeppj08mV71Mw7y4qek
	vBDPzsUTaGsmNuYzzuRq95AbpeeAInLwkGUPZdyM7jL7z5BuLt9Zp10jNUv891tf3Z0uXp3k2Wg
	IttyX79eCgQ9UFW+Vq+JTf/K0esUvfvV6EVdsjNlKIJk2Ow50NY0yU+yjh/duwyROapKaY0hlCM
	XAByhxRnyqh36h0Pl35SmEVP2Rx6R4qtE05zYcgPV3fuZGIrzjhBLqL7XC9FhATpEfIYkFn0v30
	6gDt+4bu2MYOQsP0JyWls7PJRsA4h9+oxvMUqI
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076861a91.37.1794280972873;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076826a91.37.1794280972176;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:51 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:28 +0800
Subject: [PATCH v22 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-6-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=6NrGk5dSyASv83dfsrXoNPAOKI1RAL53ItKIhUIrOtoC04rY/iqbY+indNvj+wTaEWXWZve9q
 sra5huRI48JBKgouEhBBxXTQQA9P31OmGFhsDfq5bXuM/0c3Xl3Hb8T
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af28e0d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: z7BuG1Yij6s_rph_wBHFsVTkSeYu3P_W
X-Proofpoint-ORIG-GUID: z7BuG1Yij6s_rph_wBHFsVTkSeYu3P_W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX6DBdo3tk5Cht
 xcdIwY+4rvqzH5BJALuA/6v+yXJGIdQXP/FYe9n8D9XRZYKA0CnOHDkcPyQjDqHRYHHQcMhtvO1
 BK6OGPyg8E/NtSQxb0TvJzg6Vm9mWfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX020MmI5aYXG1
 89FUwaxjPmU2H15d5PdTcpoAaReOkKYkq9g8dl9omgii/aqZZ3MKDceb3CJN71vmN9QCsCEfhTc
 BE0e81sW1CDdX6ppUmxemyCN+TUj8W5kBTqzAfM3k2YIKnRho9sL+EVp4KTDKkTRsFOAPYoSKIP
 8w2sY079MunEtQrpao0J5bHpLfD9kAcuyfHsdgibQSgyxj9j3JCAIdYemj9mAJXQt/gQTFt3WOL
 sF3nhfcfNlJfQyA1OPI1iSvY2oEtAaBEq8MN+fh/EGX9nIAOPFBNdXCNG3zZ9ZgRKGFSeXR2fnV
 hz3yzUYDtlCacqXpTWPGa1+cH3nQyJm0cniw1Apgc/SaUqukIp93qm7VmvAnWt70CkM+BBo6tB0
 6Aji7MK1qLonAb4lP9DwzF4/StNzTvjdkODQIacOs8M1KDXmZTbjCa0ny9zXE+b6YSvxawjgmYY
 4jlSKWBnGs5nMqQNZNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

