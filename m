Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545746;
	b=cHr0ibdzPBiQPlxIFJvWprFhgxeKJAXFv/L5PRMYt6/xQpELL7r4NkyCo5uWC+FnEKxz
	 8MV6Jcsc+feZamPlUhcocVr83e/rp0N3vibIjEu1NZBFeT6yJqO98rCxEYdlDHWu9+5Xu
	 lQNz0BfolOT2cqBASZun5M3r/eJonthLHew0YZfmN5LVxEKaREpO55OB8/+URAme63As5
	 dweYvNO8aJ5Uzp4RyC5eJp3OcNHM4p6wAtN8cwt2rL8TYZ8XOtDcTcqkYUQbGBE++DCdt
	 4752jX81ZWfu/o9on9/71/AX3SV6eMe2i2Ow0qNp5AxjhayRVhZLlQU6y/iwn2Ordug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
	b=rCmb5P4jrk5fWA+hLnqSn3n48yL3Ti2YK8GFdN5Xhp8it9Hx/gYWQD71cUTKAfS3UmLU
	 /SGhGzeiBeGYPCxy/3BhKGzyfaLDcn3A7PQ+a1Vdk4l3IVJFyLBM2it8l2Mfho0+jqvqT
	 89HbMBjIXIVwXdZakr8MMT3N3gEOtePlcDNPiwXbVcx8VVL4kXe4WZfS3b+Gf7Ln9Erui
	 vWFvw9hM+JfhreXAF8IvfkKpQdYMdTeW7ohcFjNpwk2XXfSC7uv838b35FXj8+SVoucgy
	 Fjpv+VBm1xvkKbpngo5hw//waBQ2nLmLO6575k0PPMxm8/9oZY4YyxcRKf9uw0JOHIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBWHKYjR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESXWgKiX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6192E606A889
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6192E606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBWHKYjR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESXWgKiX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K7so3179331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=; b=IBWHKYjR26/n0iWp
	tUtKanhNaxhdmiSuxM1CmeOgi8Jl0GWfQ2YsQm+/cThGLSJnrU1jm0MZSwVh3Qz6
	ReL4E+lqlQXpt+109sqtSKKRJQfC2QRwlqk2kTSOsfcA73gAVVONHQyzyfGmu45N
	W1KpNILC3s/+8+0iTfOqxHdWoGWKQK/R6c/7l7WqSmzIHCYHLRKy5MNhjjdymodx
	ZoBIiU5kSX1PjQm2MOpAC1TvSMzEz3CEPX0jTuuD3M0FTda8rUI7N29XZhw6JcRI
	HVWnEwZVthcBxy2flsuliM+O8gdedgRpw6qPsgItANPv3jKalNgnJSDGJu2k1pBf
	NSSXLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aj5hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so371014a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545744; x=1795150544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
        b=ESXWgKiXZ3kImN35leqHplE5cVOanwt18FYUQ3LcGpIYE3y4xEvRrtiMsisuFdOvc5
         gmkN8GeYKjhQKdD6ni8I7nq7DAlaG0d7ddLxVD3jbWRqboUMHSEsgInWf3M4+TxwXUH8
         FWXqTyIUerNWmkL//zLWKfVCf5F5SdSnZGUUyRAg0bA2CmjOoHWOz7wkIAn51aWEc8gs
         m2U1qFamHDVFqGUTmEomsXj35BnK4kFtZzqShA6UlL6Dgz01YfDgwqG/UNkc+D5ANeqz
         J229P/52P4a2WzIo7k0xGCoIUSOM8OrXNhGDAgt9xr+8p1shrnD2AmzrW84KVcbmgfBw
         v56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545744; x=1795150544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
        b=sODE3gIRJqvuhUNhlqsyJWN0fQXYcwDpPJKR3Vo8ddCX2fHlvW265472D9HtfEsjwX
         S8aac7nSUOAN8PjdRHJlnf2sCs2jqpmaEJQ/9T2NYsQWz8qsy0QdSgBxEg0HfNoMuzZT
         ypcPZTu9nYeTA5XdLRsFsGYfyuAYOjw4o7BmRaffGX779gHyjTJyURY2Us2D9aPNKKx0
         5ZMv5GgsyMqrWMjdQkRXkqHPJ7ak8MrMBPRIJolNsqg5FT/1AoGXawFS2KMcpWbnbOfP
         asGtRa2R3ZHutenwpmLuAB/RXW+J6MmH8IwKmvhhvTFVA1irKU7l3WVlgDH1BYXXOHNE
         4PfA==
X-Forwarded-Encrypted: i=1; AL+hErGtX6MuBdyQ++8EHSSXzdcMaC7TyCYmWT0ZSffUszc10W9Q4G6E7F+CVNObE4iiTtfTajY/gGXjSKHfktl8@vger.kernel.org
X-Gm-Message-State: APuU4Z/LMO5lvtgYUvQqwJoLYMpeVlfkysjENqUClSyV7lOu2b92PZo8
	FxjdKwiGHFJZx11Uv5c0VLW9g9nNqk2SikngyNWw6LxxmGfJajsI1fix3b7ouzOBJRqG+tUSWcR
	bCSljIfnMY3omBxjGjP5BncXWoCWKoHpfbCTIAVPDoQiCRMFpM2LkOg4iZhj6m8f7bMHK
X-Gm-Gg: AYBFou31FHAjGvzKZnPxSaMSgD2eJFalt4Y7Y87pdIdMQqRiDSdNbvDT8AqjsU0rj6a
	rvnkWoQbk7IL9jVS533jbx9ouCh2Ba7WsM6Ucqhk21dmFUIwwHkobICX/fZdqbu+CGFA7jJS8lQ
	JDuwoCAwXCK6ES9wo8jp2iQ98dRktPcYxe+9twj3vRjDxgw16jGyCWl3QkShJsdiUQ0WHkgpql9
	iFprKVWwzccuO/Qi+Kcj8ni1zOJ35Y0EyNCYdRbtsKZywjj/zRuJsX4EY6jjiramT5nSTdmU5Aa
	VGeRm+7WcdCvyqCldlMqtw0fdaoqaiPJcOCcCdYAI88fcvn7U3ZQKbeRN3SbKy6VIrGeYBenHZa
	sgbGAPN9p4fcijUdIvsPHptpZiVy0c01WKNtvKomMU6jz1DEg+JRBH1hpmepmFYWRj+h5z1Aowj
	U/
X-Received: by 2002:a17:90b:528c:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b1b0a5030emr956411a91.40.1794545744302;
        Thu, 12 Nov 2026 20:55:44 -0800 (PST)
X-Received: by 2002:a17:90b:528c:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b1b0a5030emr956389a91.40.1794545743834;
        Thu, 12 Nov 2026 20:55:43 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:43 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:25 +0530
Subject: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
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
Message-Id: <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=1611;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=wdxVHUH6U/hkNef6ynp8u9yaYLzY92vvK6sKGzYVMG0=;
 b=odxJJpkblgPN0yYCR12PMj2iwhNkYi37D9oCcYCwazdfDbcoy1eTNIooJOFotBYEF2GlzuR55
 5iWFxUUu3+TDIuQpo7JlBqKpQ4LHHcXj4XfRvdf7HLdU0NS1MIZnilp
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX5Aik59J3QcjC
 BJFnHyCRVSLnuPVQ4gOUHldwqI9DFFSh4QgKVI4OtStIseWM2Tttmlmm6COVgIs+c4EOQleIedJ
 rRYMf2F+JDSH2oRg1mwsSvQYwjxdmBM=
X-Proofpoint-GUID: 847_U-NRrZzo6Vrpf86OQgQrRZP17iRY
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af69851 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=Qyttz2GgRPmjqTwtHG8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXzM216J7XP8hb
 Nf98x2BerVNbnLtpPmYgVGPCTU4LNFPNciJgMQ/5j9MG04+mQQFcSKczFDzYmKU7mmxfl/fGI8P
 MvrYZAOIckY3OyNknh1KQveHljLeu0WD9zsn0Y71/XeOw/9mGoSEEua5n4ZrOzE1dSulSXG5tDI
 EttrKEC5m0VRJ+phuo5J5f2ss633nBUzhQfTWlZIhFeWESiYTspfciUbII5am92ONKy+EMLwfb+
 7/bagReC8dwowogfdoVuHEjRfo+a3yvcr8rLlnEaN9Uac8GnIDVLiDB7c9nsS6a0bWn7sAI6Zvp
 Rjfvrlmtg+RqYN3t0qUH546YWg7bRGAL99thuFWPLDL4NykxaU7Sld+/Vv/M22OnbPwzWOR+ixD
 p/wR8aR8JVOaFnteEyPu/6XNc3uGXaspt1oNm2KpphU6dBp9kjx7LPGPQJTEMtFV7MOSGmL/YeP
 ewBAi513+Nl/4BvBv6w==
X-Proofpoint-ORIG-GUID: 847_U-NRrZzo6Vrpf86OQgQrRZP17iRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running.

Add a boolean system-state property to describe these states.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4dd4f59bbbec..b19952f6225d 100644
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
+        entry-latency-us = <706562>;
+        exit-latency-us = <706562>;
+        min-residency-us = <1414124>;
+        system-state;
+      };
     };
 ...

-- 
2.43.0

