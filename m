Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340119;
	b=oD6zNatfLAb2dpN65sca0gj580Lm8m6XTesJkwGL9GUeRQroUVr/s25vM6VjGWjEuuVY
	 onkE2DkpF2dtSgTdUc45vAZcHop7NwNISzOLaT2jmtdb160R/HvSrteM02SwU575x/en8
	 /y/cAEyYsJwNAthMN49le6BDmLDVy3I6PBPv+o7sqS+e+flJzXQyO1YFvHLG90dMCVRsM
	 /SaiIt6nOgQXrw3Dzo78aiCnBmFq26bV7cy2FDE0yISy5ezvr4ZNn/FE5DktP7PR4PgSr
	 zhUVdij4MInc2hU2GnRAAbWjV8KoDnHDqdw6mN59yPiwdyA8Mkp5FZrEybk94Vs/GSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
	b=I87skDPg+IswoyelRWvrgkwH7LLzYpkbP3dQ0w/E4HaypGnC6cbd+Lw2mP7LzCtXT4PH
	 MbTkoAoxj0tcs2qrgwF0+FC+xdn3AcIXjAm9EGaClvrPSkU1tUbM1XGwyrY1EcNpTnEob
	 uEXOwhQ2OXsjkP5NEI4yMIgkVn3LrzuLj+36K23AyqPsl+c1MQcOZ0KvN/BgLIQMGOT7Q
	 3WUpNwHxUs1qPYeVmnih2MhblHhoDp7NQ/7k5JHLUvlZMSkxep/GDuZcLsBU1hb8iNLdq
	 BySsA4emFLtOBRQJUB1UkaS17mezv+2E8Nv+fWvvlpZWpnlm5tQa5rYt+62MTFQMvpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inIFOQIK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B857606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B857606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inIFOQIK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FASL2871211
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=; b=N61c8DdXQWkt3ddf
	K7S+aCwGr7sMjMhFo3BRucsbhHwMRtHxx6r3YWa/PcUz860PivJt3066PqsqxjEt
	33B+BkvalMjKcH4QaR+Ov3XXPXV9zLrDWzrNqI6vE7Uk5JOb+GCMyHfpnpz6xdnc
	fUEOjxQtue81uZFHjxq4TdGDQkPpUlxIoaRnELZfK2qkc35eETusJ3HPInuQ6SEc
	AmLB3XhLA0cuLis25+6Q6Y4dVGtYiN6LvdSKO/CZFCxUXNynL3jn78CV01et/Utk
	YyK9XU9T6qbNaEMxrMEwTamDrF107If26e0TTD6bHNvlx5i/GStoqhHxpp5Zq4td
	X9+8qg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhfq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:01:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so161267a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340115; x=1793944915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=inIFOQIKUo6ZxM1oatGyt/u1DLEopH/45jSsQkXLD7nlAhyGBFzRDb+NZXmg6xRUu2
         X+wyQutsJ1BDbj6sXNVSHxVi9ZxWa8Rw7m5MTlzTI9G4l0AwvbENr+TFyIFVp4mmkQTI
         v/VB3e2pyY/IWvIgdpI2KzpDzbo2lCGQQMR0VmN3OYtgXfxYGgIofPhbT6CSdWVbUdcr
         9PfThTmCBdrrZjhHd9jK28Fu1D3ORdJlTI0dLaX3QalSJq3OiaQMnaCvLq02QQ9PSzMa
         VhrNuxYNjvuYt5YwvLiJsM0jQqJemSllPYIK58kpAUU/BmpLSdp2Ie1TgZ2fpIpMN3JB
         xdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340115; x=1793944915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=tqivT9TYPyKvy9FqS8g6Tzyq8q0belOrTKqqqV3cv+oD6J9dw3dEwKXUhXOitwCDIM
         Jy/GP1jVVIF77ELaVoWOS9YOeN7gV4Hhzd2bZ/jHdUNGpdHZ+DhWTf8g4JtkFevo5OB2
         oD9cc+QvBBogPI7JjP8VyElO0Df0AU0ATF1tgaoKfUT92uj121+D0XXgxNXjNOASlgbX
         BT6vCJjiread2GvRADa1hD29CiKbho6V5PfI8tAYxHijrGfMmGgQ1V3Yrvh+j+Rguv07
         MKwdt63KeGDsEjZkKwqtVcywkGiSs13jGRwyghiHsxlGXku+LYGBotwAHb2k6/CTsN53
         cHcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnNF4hNAM5VX3GZKjV/KbNaI8YkUVQ89tjcv+eieSB4QP2XEDIWmQ/qnGYUbyvIBgx8dHg1VxGkUxMWTa3@vger.kernel.org
X-Gm-Message-State: AFq9FYK6ZbhbJCYA33BZUhDyWm2uF9Uv8hcP2nOiK/b8r5MRzdvTpZgZ
	RtV38z+twRieq0h41oUihGM2nfbKZlVFLhwFwW6Vdy2jbLAYNggh9dpsX6Apl54UsdfFd/QE3id
	WsF4da/uB4ptOsFSfnQ2IDQEnqP766NvSu55i5WPPp924ytb+lcej9Rzu/0s0kNUF52VL
X-Gm-Gg: AYBFou0ih9U2aQWAlt6qi0/vMVqYQE4tgMKHNKSvkXYarY4aaTPocmgZDS5JYwsjq0d
	mTamhq6qlA9qYZaKaw9ScoAJHuLeEbSLQMiwWM3/NrxzRVPLN//9eSqZ2yUoRiUpecQcg/HaXh2
	wxRBMKsWhzP/288ZyVBZb3QGU1QCnR+nMUGO6XM3n4dB2X5dtmLwquCHx8mGZjxzVq6vcedL4Af
	dMReTGJHlH5mB8fhLKV+ROHbAaOZuE6tdER6RNlYgv4ysGduMXNf2Aq9Km0skuuz5EjJzHlbbrA
	Q/4wGIli5XT80DPgyjvLlWneNAbn8Go/ME/1Ojd/rNIBwgh6G16Lb8o1aaDwNsaEoebhJPphMh4
	Y9wYOeOvDqemz1hpGMtkyKR18cv7iTar6mfMXClSWUoNyMAo41+Gvfv7wdQzqZPzg1Bt4VGoJQX
	x4Xg8N1A02Ytu9xDgcjjLFcjQiFKy/ur0AjSYn
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1101080637.14.1793340114236;
        Thu, 29 Oct 2026 23:01:54 -0700 (PDT)
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1100988637.14.1793340112695;
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:29 +0800
Subject: [PATCH v20 5/7] dt-bindings: arm: add an interrupt property for
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-5-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340077; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VZwTP8q3VzOtW+jql1QO52SoMySYQJECUrbQXJatheo=;
 b=EEud5RknIhi9nBBQ9Ap+ON8z3v4WfMbmbWr2mlSA1hC2GfyWzIXCRFPxIGb24or5dmZbA2wdI
 LYWNA/Ywb2oAd6HA4/BPuj+3dioxkUBoi5/fux4bsfxpjTmDA2n+a9O
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXwu6q0mf3KQ03
 9zA+BHa9BpbcH1Qf5eoha8LxaHTF0C+64jBXrhI2Bbc92yyRQJK4/cB62o5VANqKGUjj3GAUOk+
 Xxmpmo0kC0ePqU5EYhu21wKwlcRe+aPOVS6QbDXz7ddLSGgzdewBZUHGInjbqOIPsihZpSqXqka
 LYEuNdIHmJnRVHlUaxjuYDLqIWi5JI4gotT0lUHdOyj9FJpZy25VFaUoIw1p5vajcc2LWFYIbnY
 8JzyU4H6/35ArV/Ze/wqhWuYsR+ZHTotz85/L0bhjXqM1VSqGfetg9fdwJyjvK2OsIbOxPurNj4
 0V461tg3b8DqYQ0QBSMsLdkWEFwE72FSeOwH2oyQNoyBOmlFGUMvr3VklnkYDsm/z6iWGtqH6xP
 4NnVVEeQYc8rMt0+2W0sxk3cAIjRvszfCpwwsrHCqNpNXoc95v9Q6e2OhWYyyqIfRx4lXu/04KW
 +k8W3LdFur/N/F0tICg==
X-Proofpoint-ORIG-GUID: x8HyxZsgHKJoVogoHDrpNlLBFGpPzsmD
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae432d4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX+ActCI69Mg9L
 s+TRm0RT2zQIE4pcN4dg9AybeeIxSVwRBQCHHP/vfu91xzCgCxsD/uCsaOx8fc0hn7HvGZIE+2b
 s94ha2okMl3goV1mZISDcMjK9Miknfo=
X-Proofpoint-GUID: x8HyxZsgHKJoVogoHDrpNlLBFGpPzsmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
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

