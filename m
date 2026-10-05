Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA794BFE85
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214202; cv=none; b=eSXF5bUlJwSSCiz9VYrxjvxDquhPuvAWExcOctJbfMGMR7XL3OzF6wF3uQCRVXQ5iQ/TFWUUyfXNV0AmszOQ2D/r6i4JwGsFBgpvDgnKT9he3FxBPjCbj1qN8Su2hRoLWBcn9SAVE1x0wWE2+isPwSmA0z3VGUydVYQPl4+gW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214202; c=relaxed/simple;
	bh=BwUtXltowY4TnBr1GJcGDAHCU9wz3VnoxRYwPd5575k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDtjBandEFB4BTFMZIid6oTqqO8L5hwhQGzY8HNv8gjO/GxaL/AVA+qWHnAYmYQ9DewyCInCjQ1ehMmUJ//LJ0aiTr7dyEQbX3hop7hUsIQfaPbNFfYHDAariRpf/ZgeatziiW9+NKROyPE+xKPsi0tUpNFyTwGJXwkK5pjLzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH51bmpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfhQA6aG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH51bmpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfhQA6aG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP8p83141524
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 15:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=; b=dH51bmpxdQowCa6a
	xq0HA1fLvbghJjXHjsLb+F0PUUM1Gde0wYCl1sz9E6SWbzVFkXjgPaDOHoY9hpDG
	lCLmyxDQ+brTadj/B0e78SAym/Vr85dIcEpQHLZUrPlQ3uTzWfAeKIr3iFOpzUIQ
	K3VQrbHjmHxLrneHbcPMdd3UmaZOLxCbZfHEz/7pmTs8T+x7mQ372yTttJDmco4k
	WP9FYbbKuDxcG4EdHGUE1wXR/tVoNawx+uYChb3w7aooBasanUsJq6U05DkuKx/5
	ChJ1h3KsARHcjpxa+uSR7Dpv9q7Tz5pcbR3iNeN8cqhCfMCRVc7PCqIxCHBI6SyB
	sqzOiQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u4165t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 15:29:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a46301ec5so2450803b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214199; x=1791818999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=;
        b=KfhQA6aGbUnYalfYwkvbShyeMNcKBexvFDglEaEo8HzsMT1ny3LDFosymaHgF9INzo
         lHD1eoOGpGtL4xZ3ISjFYX9+VkGjjSYdB3QbqeUhEEfPEC0bzLBbbtFu1aSYuTIqiQ2w
         JZiISso0NaDXWVTvuXZWfDa1PjmaCxTjAboqve1rPakPnltLTT0OVQsZBe3PKL8h0RgT
         uWxXL65Dx73SeVVWyewqpxO3c/gjSGnyp6Oix/4rfGtg1FulKU67JRVS8Mv+ZVOG6zkC
         VEmmXzrw5RTXbBqPyqCyHYXLf6gkzPxhBLFD9lyFzX9AXTMMUfFM46C/iyaajfhpzt07
         4NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214199; x=1791818999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=;
        b=0MoCp4JjwuBmBBMtnG3H0G37TF1TKeLTMD9C2ZewYc88D3D8PQ4SIQVXvv3lA/2aTr
         XXN85oLXyIH+q0xPv0YW/bS5s17+wF/Nw5fl8jjy+sUYqvI4Uj3IUJTVgWKsAy5L0pQ7
         vl21swHPKlQii0QthCT4adyI7CxH1qQBcAMnp579nIe03YlV8uYYsntHoShW4QTlCcRR
         WJxp+FljYX01r+m2/pDKPzn825yw0qije3t9itVcnHul1VRrZVpkHlKORgonar/HnNeg
         RRHBnO3hqqe9MRlSpW83nhnOybnVHuEH8pOVlpxDQqstnn89ISPPtVzcezf+oMWiRBfQ
         5JaA==
X-Forwarded-Encrypted: i=1; AKwUvBzvsX2sGCt4+r1/pcXzG36ZCxzJsnI5QQS/KPqldXyyFBxSljBXO/d4TPC6r+HcsKIbuMLegDBWssFh5R/P@vger.kernel.org
X-Gm-Message-State: AFuF++l1Hf1M1Dl0Py93K/PKdy/yT1gvnT9k9UlPkOYeHeC2/Mf8YTsx
	NH/VzmQ2tl1DhRDlmUFDLyfS6RSkPJfZzCq5/Fhk5hrItfsrTP3frRspLXy/ZwD+BaIE/0sh4xY
	eiaOZAGKYlMMfU11p9bkV1A/hrkmCbV1t+/9uFze1CctJhqtsZaJ8nbFgJTgle7anyHK1
X-Gm-Gg: AYBFou2A8CFYCQbnBx0xKz/xsDdxgc0BqVJYMQPdjMttSZHdtRKSKfgj96P5wMI1KdP
	gzVLtjC40JkLc96Rot6GkAaUoiyppl2HxoKjIhG0YEJqhpEcKxSYiAZiVtWSScHC7+lIpyz0j19
	IjKSSMJd0hOIsp1SAKEfEhkR0r3tvHgixklweBak7elcGZSnHRfAedFRE7g/ksUUmhJQ8V0qSuP
	SqiukSzCMb405iS1o8zRLNEoJJIBzlfJHAOkNZJYSWyD2W56sxImUyJXSxXAtYvB+mWl9vdo2MF
	BcHAH78c/HKzPNQ8YvVheozGGHVQHsksJVFDth0v+GcXxsX0PTJUWFGdeWxXJ9Aax1Zcz2/4nwS
	H99kjwEVgWmwdRoYpevGdlx2kc2zk
X-Received: by 2002:a05:6a00:238b:b0:889:c4e5:687e with SMTP id d2e1a72fcca58-88af3cc9286mr10276675b3a.8.1791214199117;
        Mon, 05 Oct 2026 08:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:238b:b0:889:c4e5:687e with SMTP id d2e1a72fcca58-88af3cc9286mr10276657b3a.8.1791214198669;
        Mon, 05 Oct 2026 08:29:58 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:58 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 20:59:42 +0530
Subject: [PATCH 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-s2idle_state-v1-1-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=1581;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=BwUtXltowY4TnBr1GJcGDAHCU9wz3VnoxRYwPd5575k=;
 b=T256eb3yOc43IOM2WW9e4sYZwSd1iCVH6K4pVsVCqIOMCxxivcG67YBymLdUfsNQvKcZD4OKS
 Cw7wIfJPAr5A8JORGIcWWQRa92/RdtZP5PDmjPbTCq4baSUMp5F45zX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: UhkKRJekmCAivhIIz68A-DFMmyoIYJba
X-Proofpoint-GUID: UhkKRJekmCAivhIIz68A-DFMmyoIYJba
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX8VA0LZ4rJX5D
 94vEdLjdfPy3YW2ZQpuq70PeQZheIWx7DTa2vbcqWxjmZ6YMr4uJX0j9AqtFs1zibqyUvuBboAp
 vO4Fs3Gborf6KcoeE6iA2gZ4NzOHxTI=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac3c277 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Yot2Wvv7GsybDEU2oFAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfXzSpz7nPPnf4V
 AM0+MrCYWTDb5nOyoAFNR83/0grO2qACdohFoz8dIEXhkhw67FyjJkkjTrQr7wuomddWUb77Jk7
 v0h6zeQz7s3/vXOyAEjQJWrLBU6HzaEfl/ibrC5CSJnP+rQALI/Mt13OsdgPtzq+/WBOWcF4Y7s
 /dkJ7W7SCkPZubmQo3VqMHVZifEXSTklbnMiMftxt7+H0BPUD++xsdlSrcIul0oWl47mT5rjy6y
 R6ZDlTfJMZ2F6i8KO4w7rzrDlPTmnrMG4dzU485mZcOyt+WkBDp3uVlT9VJeMYGSWXDKvIm2dz8
 IveDjdTLQP82Gd61GFAy7C6of2VHCdxGr2vSYScoWicAPk0Wsms6646Z64wxSlnUlJDbCHRkWyf
 rCfW+Zr1k7fHMD+heeRQzczRsyh1Ny4BPaJpEvxJiYP2Hky3S+PQqvr8tuACZ1qBIVaoAPzeJ4p
 yKJbYNdlDYPyv8dlGkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running.

Add a boolean system-state property to describe these states.

Assisted-by: Codex:GPT-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4dd4f59bbbec..35dab3cd6aed 100644
--- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
+++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
@@ -45,6 +45,12 @@ patternProperties:
           state will yield power benefits, after overcoming the overhead while
           entering the idle state.
 
+      system-state:
+        description:
+          When present, this state requires system-wide coordination and is
+          not applicable while the platform is up and running.
+        type: boolean
+
       arm,psci-suspend-param:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: |
@@ -77,5 +83,13 @@ examples:
         exit-latency-us = <40>;
         min-residency-us = <80>;
       };
+
+      domain_power_off: domain-power-off {
+        compatible = "domain-idle-state";
+        entry-latency-us = <100>;
+        exit-latency-us = <200>;
+        min-residency-us = <1000>;
+        system-state;
+      };
     };
 ...

-- 
2.43.0

