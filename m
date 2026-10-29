Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264526;
	b=KHRXaJhLoG2rehmcrul6QXO09bcSVPX/GUZ3OhqelgoL+t3MyP56sQIIrd0q56Nlm/VN
	 4Up38Sxc3Z4WN2rG3nT/PMSp+mf4Bc/datL2DGkIXhIsWWkn3rl+bMziI89QnrE/Lz5Ly
	 fBC09VF+N92LNX9kkNsY3oReKtjUb+XQLG3yt012IusHpk2Gy6KU3RynGgVb/0J2ry6ot
	 cE9+2LQnJ9CwoSj+Jvz7OCY8wDyrNnPBUqByFa8kx/KDokUlI1P5adkaTFn0Uiv+b8KqB
	 /O7Ooo8HPbOP/SlF6eIHFFJRGggjdGzbC8oBiSO2pVuNqqLjxuLl6I2QDEP0Ev7XhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
	b=UAASnaENwBPBHo5bQZOT2Epc6oeTdLWkreewLVrDMz5qIvjByc3WX3nUkOn1ZTGmWMTv
	 n6LaHBrtQleK5buNFa9Qmm0oYhtwPC6LO26o9RQa0jYZyOc3Mh+n0PdZYENVXtGOLED7W
	 yYDz+LeLWIX2oLhOJzbcNR4xiGVsFLow7O0CjpzkZnaiTBGsintDh81WgnIXz+PnLMtlg
	 t99ZnRvgqT1a7gMDnG9WOkz2ryzpyujgBV8rD/9Y/ZKI1B8QNUHr4Uuytdlq6JLjzTgKs
	 oVfTo7keQGvWnjhGfp1aMQTyLdAEkIbSk/QG56OTvOm3JHqaKAzTP+5EF0aiaIfDabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bguCb2Jj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021EA606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bguCb2Jj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vUS5179449
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=; b=WySbZcI+8afrzpQk
	ML1Y7Q7bN5nEfvXGA+Jj9n5kryGtvJzhklTEoJVHe9P3fQDJ7mfXqurHBecdUlbH
	D+k5LTwoBKvoxsmkU5GB46KyyPJJO/M3ojDgXutVYOZoB2YHNk+9nmGpRstkV1uK
	GMd2sS3+bz2POenyn4tgd0abhzKcwZYnRWcwL7iBToTEMF5ong3kIRi6GsjIq0Jy
	71lUD9JiNcV+Id8yAU4cwEcsdY33BV0ipLrjcJhVppUQrJLH7UEUzvdV06jvBwGT
	EG8i9WuymuT2CS5nUdSPVg9HrROSD/EItOcs9SLfpx8BrrIxGGoexZy8dEoWP8qX
	5KJf8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2rn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1454773a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264524; x=1793869324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=bguCb2Jj/UNkoJ9f1YU8i9K9reLVjv7Ali8ycVXUi28v9hobyZYcDdjZEjneYae7Q3
         ATOdo6yE91UPY6Nw8M2UaVXldcCifQ87COA0b+nKDVLIBHDO3f+CixgSmkc4w2IoXBn/
         xcp0dmuQIAvRIqpwQQ/H+UE6+KC0M1QONh2983pj1vBVzRQNp9uGEqhi9pqun+2drXNN
         OEn1M1RAsLW06qOrCuBAD9pVw6LtdLhegHUsD9XmNbdSzr2UljN0JLw9BEOnsfKCyL/e
         EDiO9W3yDX1uIka22FhkYSl7EuuTok+R/AGERNEBossh9iXiRCl3335vFmNtI9gawugR
         4+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264524; x=1793869324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=SQEbLBlDcd9wqUl6Lqtmfjd2pBXdbiIhjVfPl0tuC9t0mRyFbaRT2yf8kJbsxAV+KC
         Jyqcivih1f4YAw4ltIfvg3TQFRGpUZk/U9X1XseIzi1Ll07kz2RmVKXdMgfQ02Y3Qa6e
         lUxoGnzC2c6OFkg2p3bP9GeWEp0LsWFYOltCEsUkeBf54sUBlXmDULSrN61qB9h0DUKR
         HtkAZKWKevVQCwOfJ5m3KXPkAd60rwhCtsUN5djQKmN9w2oZSzMjYZmBHlBeGs9vq4CW
         py8of//YK4ylNCpo4JxwPM4ctcPr5L+1LHEhHr4AaAM/JexBtb5MQw00AexP5+APrSqq
         nOLg==
X-Forwarded-Encrypted: i=1; AKwUvBxGUnviU8mxeHdwXsJNsllj0+TFJ3cmGf1/ApgPRC2n5ydi12TmPQa+nk6X8XgvnZXwc+QunKl2JvKYmlEu@vger.kernel.org
X-Gm-Message-State: AFq9FYI6aqESw7ZnUagCwp8TVaEkulDz9217QStf8cnrAh7KIda7P0a+
	DD3DiZ73JR1X/WfL1GHLoXMVY2byyzY9LOPeoUNz2Vk5YSG1sFYPfxWr11nJxk0u7hB9TJFfZGJ
	uV/OIMz9hDIcXvfOJbztUIUVJh4aHU/J75rjaz1nlIrcOKIck68MTYC3m49fwzEIWow6o
X-Gm-Gg: AYBFou3nMxd7MbubfBKUDJ3XlvqmcXq2QtN8t5vscyhTlD+rQhVxE4vOCxkLnLHD5VY
	cojhmBHPMFbcOdkI8mKbqLtLALiJS8niJ+m6e4pG3gBCMFzbf8PBEcgJIdR3eUTTSa9gwZ6nW5d
	2EJLwGNEKb3KT1yc9+0GwkYoSA7ExQYD6uZgip8KmIyCuNgG4CmvHOYmJKtgL+niEwST33Odb9J
	/t6lcGjGT4yfB9jvnCbbf4BouWZIQf/9BVWL9x1tIxKVJkVW2lJlFtAew6x1n9owPdN/qqjxq3b
	oMyWpTrD/QAz7P9ynCKgCECf+8RVxyEU78vLS7dUjLoWrMq6d+o2xfwh1cUNMhupoUjAdpN00ud
	+kwJ1lkKkEBhezxbTf6hXhEKVOJKA+9PxOggUjhgE5n+Uq+MojyS0jBx/6BcwjQYF9hztQ8/H3r
	PCpjvxPvGV
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869183a91.46.1793264523908;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869128a91.46.1793264523384;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:59 +0530
Subject: [PATCH v27 05/10] dt-bindings: arm: Document reboot mode magic
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-5-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=3109;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Cocw8yqxYsC8f+LcKoCIzML/tmVX3vxCTN78aew4Vgg=;
 b=CndWAYSCONDUqL9nIiAiDUAvZM2ja3u7IKu76ZeNE5zbHXufpIJ6xe2m/zsaMxyDqVINOzfbE
 TQ6JqtfIfTAB32c1gOkFYjPzY3i2fxEW1DztsF9Q+t+7i/D9Ommnj0f
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30b8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZjyxHfqtAiH8XHGUigUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -cONrWAJlChoIccquO_lDKTSHMtfcd-V
X-Proofpoint-ORIG-GUID: -cONrWAJlChoIccquO_lDKTSHMtfcd-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX2Js3dOS7TFte
 cinRQyC7ilerOeoK5Wq5PMulQKSr5rDmUHwFkwiZx/1DlhNDrNgDkn7fal92gRVyFSzqbOhbQRm
 eGRCk9n7pm5l4AT7E4eQ+3r+O0WaUbN9KSYOdkf8F1yuRcJOUBche4eBYqCC31u7WIC/no5pfQD
 Swubb9i7MdjmZnRSL/e/Pwz1M15ak/AYiHSBHk0IiDQxcGdKsBwp5E8fK/p5HeFjXU+IzJGruN0
 c/LxTEDM8jQbQz1HOLo4x048sfUl2mW6NrQupw0cptPqi4HnisUMQShOrE6HT8h771Ec7s4Uq6s
 06jT7mZC9in/y6eGgr1Hlx1onbd47/OY1/L0VJ2KYl8QGpofi3MIRO27twK/77v/ougF4wJqboF
 0d97138K3E7aJVVp6l4M6qiECp8aeNN8UtKmJsseIyoUTVQmhveYgKgUSxpIUPU0HQ4hr+qej4H
 EC6MDpUXSO8NBZI+wrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXyFXmY+W7n4ns
 Zr40t6wPFDROOf1HY9vkBA2go/bEVPo4SoJ1/1sfebv137cAwnO+vMoBidZ8R9fgJEdYoyt/12n
 ERFUBBcuiSyFFk9/u9GJ6MsRT4Q5qnA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..82ae25e7a338 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +170,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +302,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

