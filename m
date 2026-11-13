Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559468;
	b=IToJS78F2zk5un2yLyjMeQLBLCjseERmbScT8aLFJffRrSQS4OkRQ1H+3lPeTVO+LQJB
	 3aVB3IvEEOvlbmCzbH3UBW3RiUtSxlLZmkvnWiccf4nDwre5peggEPbhVfKBLHPxMecl5
	 IXggfwFu63QiqU5+U0jLnGg1bq4tZo2w042MzWTQJEOCBACqbF3PX9ow9I/Dx04j9GUXC
	 o33E8i/r7JDjwNqhZzzROJ5ZRpvcoPGhYPbrbHE6ECqLXoSbEd6rQTR0siC3piWZIZuIJ
	 ao+Bs7pPKPgYpjntcBS0mHQszSZ7KlVpcaVGoCjDUDVlDcGludwgdiUd6nWxiZHM22Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559468;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
	b=F52MY71FPtzjAbpUIau5OjN/jRFYnLCOBODdqZGyG0SUgtXCt76AYaAr7S005GTG2R87
	 WK1k/qDea3M7OUKAPcG6ESZC9v26ee5WBE5YdahGavlKOaNcW5fA/+i7rqfO80VqK0b6L
	 AOTzg+X5jdLYULeK0GLDYQmOAV1qY/mpzsgwWcZwk+7zGnNTACUxpa0UKqJuisYS7VPlg
	 7foweIO4YtCVGXVhwn0aplCIEgcrnnyk9Z2Hqtg0Rin1YbKfV/UhST2kIWs4v/rOyr9Hh
	 SGJQh5834wI4i1VkiMYPPPy2cKj/X6BHOYUSAh1sZBH5C5N2RbBaKdMf3xa8W64x4iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu2EkAfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrYyLwyz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C68606A88C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C68606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu2EkAfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrYyLwyz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V6xQ619081
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=; b=lu2EkAfOaTXC691p
	FGXwc07l9Q1Qpjm8XPZMLS5T15O3ogvsIM7DOdKXgir7eos/GS5KjncUeRIlZaO1
	FzFglnAYiWuEy9jAb8keYyZQLg1PLjDeNKzuzF6Akk+Wvmv+tOhNdJ9KUCRzLEyb
	fOdIw0AKNVZfDdyw9TRg6/EIXnFskSMNJKvjWvh9L9LxrEn/6CP092AGpVYvPYAV
	6SeSckd47ccAQcEP/jv8E6B66ZOmC5uc/wwMFcYcsXoeqbys1gLIKqhr7KnYvTFM
	TDOMroimQfSBfsqY7lWyxmPpiBvpJ6kqqQI4SqcxX/9g58Oek9mCYItQeh+aXrkG
	wwK/og==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs048ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:44:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so907155eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559466; x=1795164266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
        b=HrYyLwyzt9cJ8/UCXL2Tb9U702SH71NY1LZv2TV7H2K/TN5y95RF3MfflcPj4jYMpe
         qHZv1fkNsbLlWTQLM9t99dlvTlFxoTHR9fZ/3IOa5xs6dK4rItVmYiGsyv7GcscNEfJz
         6NAfdOxVSfyLsKk1+zivvdCCGa3tIw9V3Zv483OckjlZ89fqC6WsF9gpnlgxUlo08ld5
         P4ErBwhbOzNsP3VkLKciFPv6gj8VQQfN2vFGz0DnwywABhEtEFNrbNaixdhX05KExGpk
         looVsIRwzLyKXVVsp7hhwGfPuQ05pmzL71fTHF/YL+MSIP9zbY6+1JdsbM0gCuFxHfnx
         nN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559466; x=1795164266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
        b=XoLmF4fJ4ErEmjFQLpS+dPrRIP8Z1oBI8iCdguMC2r72pHr32crm7lNBtYA+kPN3DW
         d/Y6W9j7NB+DQ2Ckc9b9mogUSN1dclxX7YGfuwjnvgUmLtvWNoWx0Zd5+/7KmzOujzzH
         F6kwiaQehtU6r9JMFSUV22fU0hhXe86xMSRG//8+tE5iHK5NQ1P6MnWYMDPSDRKMtgGt
         k6ewDi2vjLT3DG/hakyKNd7XpUkIVYoyXiUE2bH3y5Vikuc30lhIQmYJud9SRq6BktOC
         rwrvumEjktr2Fm/yqEIe3ZpY1+oiNGgOzrz91t/sSDQ/0VKDk047zOf6kjlqJTgTTHHq
         428A==
X-Forwarded-Encrypted: i=1; AL+hErFYhdvDmUX3LWHWKccwuLxvprP9cTPrQbDFEh3bEnnfRQTiOZkFUogHqVSnQ3rppQr6HGH2Y3KOlP/FLsXK@vger.kernel.org
X-Gm-Message-State: APuU4Z+k9xuXcxmblZW0cc5PpSXtH7LDFLSl/z6lxZIxl6wclxvHWu2F
	ZareLgec/QjGWCGQyCfMjc2q1oyNtrUqhOGKwN2DFJLojMj0IvTtjAdwBmoIPtEwyg8KK/ftLGl
	FP+uEhMFvnnpwafe5nvz7WpcB5PhqkWPEMZdEY8n6+sfi9GIS4qum5sHuQA4q8Q3HABIAMeHsjE
	n1
X-Gm-Gg: AYBFou2LcNRRJctFsUpJB5phVq4e8owlgoeTOTkZt8gwIglfLlwmv/SdhLEVQPvuYMP
	Lmoi10hBCfFvj+sHo5DTK2obI5n82pi7F7o0IERfXk04j0ws1clVWbZeieskomJUk/BkwuyyWDJ
	qNPrMP4pSajNJduGs8YZUZ78mB8SrDsfgomzCZ8y/HtsJH9KdZ5MDBlbHmSi+vioHV5qZyXKxlo
	7+W4BeTgad4YwQfaBEz4qrIruLmOJiapmbrVP2aYV6jgjaavkXdlnKPgM4+C7/LuDg55L0ZsB6s
	B8NcqxuZc3DHfpsUQcAnDwHkhW5Vz9d3OYvjbzmx6cXE9m6GbsLKAXOed00EsXdAnCwKLdTGMCN
	DuCR2UF9I1/uP88gxzHGggnn8antsEaxGrjC4y0nDKOLya7ymDIqHhqlASp1vFEM43QrcYp+JwA
	stSmk=
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr1500742eec.10.1794559464961;
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr1500719eec.10.1794559464398;
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:44 +0530
Subject: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
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
Message-Id: <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=4816;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lX4dJOooS+S1R79QALYmm0VfcAfISX3ohk8vnGBZQ64=;
 b=4LlJ6prFqGAHDuJ2zWVdrAwMBPgyUzaVitP1CjHO+p4Fr2qDwS3C3u3UrbgErcUcPI6AppLzI
 z7BdLbUpck1CrwnNWJVG1gPsrFRYgJ1WXcpvc+pD/SDjW7+eTm0YvSs
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX5o9WuYX+GvUn
 kefo7DEFp8vYaoIMzHupw8H4vtOBx35dEHrCMXlG2J2z/in37A1sixg7lyaP478KLxGscW3zauG
 izcVDcAYGq9PTaidTMcRwKOBNsYdw2RF8HPYnFWIxVgzhiVgHckO8wEMNd6g7baHalPeEbZyWtU
 Kv1i7hTx8ueSGxVKOGmjvECYOOjXbOvTmwWktxisqlpgZ/NMm9/RU+FHgR248TqI6wQKXNKcACE
 jSNCt6p1X1FqvOwxb+mZD+qN6h4YlhtClZTJyI+pwAkkpWGXG6/byPJcbnbaxO7ePN/JSof1G+U
 5pO6E75a53berobcyohXlt7RNr9hTt70e5jVJPpe2MhjBgIC9eFOUTDZt4nxQ3pEydFh4WbJNHq
 ccikYOZBwq3vNWWg5k47bTGWJDO9dv2xj/6Aac6JlJh5RY/+F7WKhadOGOos6lSlLi/T+D8jYzg
 70GsatjJ8hW7T+JegEg==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6cdea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j3Ouay22MIlEJhTpI7oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX5l2Zql+bbHFa
 otuZWDlX6Yp7dgMHT9jEm8YJ9B7hGOLXbwNZd4o1BRGHmYNM0xWD3VRwt5G5HncHuKGoL78xixj
 xvNowMhlV9D9WrZSreB0VNzBpEzY1UY=
X-Proofpoint-GUID: NCeznVtFPthxm65JRkh4G7B955C2Cl8d
X-Proofpoint-ORIG-GUID: NCeznVtFPthxm65JRkh4G7B955C2Cl8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

Differences in SoC packaging can be used to provide multiple SoC SKUs at
different thermal and performance characteristics. The underlying SoC
remains the same except for how much heat the packaging can dissipate,
thereby influencing the critical trip point at which an SoC SKU needs to
be throttled. This SKU-specific data is typically burned into fuses
during manufacturing and can be read back at runtime.

Add two optional trip-point properties to describe this:

  - 'temperature-bin': an array of per-bin trip temperatures, used
    instead of 'temperature' when the trip depends on the hardware
    revision encoded in fuses.

  - 'thermal-hw-bin': one or more bitmask groups describing the hardware
    revisions for which a trip point is valid, modeled on the
    'opp-supported-hw' property of the OPP framework.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..cb9a8c96d053 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -152,6 +152,58 @@ patternProperties:
                 situation where the trip gets constantly triggered soon after
                 cooling action is removed.
 
+            temperature-bin:
+              $ref: /schemas/types.yaml#/definitions/int32-array
+              items:
+                minimum: -273000
+                maximum: 200000
+              description: |
+                An array of integers expressing trip temperatures in
+                millicelsius, one entry per hardware bin sub-group defined
+                in the thermal-hw-bin property.  Each value is the trip
+                temperature for the corresponding hardware bin.
+
+                Use this property instead of 'temperature' when the trip
+                temperature depends on the SoC hardware revision as encoded
+                in fuse values.  The platform driver reads the fuse and
+                registers the hardware-version bitfields with the thermal
+                zone; the framework then selects the matching entry.
+
+                Exactly one of 'temperature' or 'temperature-bin' must be
+                present in each trip node.
+
+            thermal-hw-bin:
+              $ref: /schemas/types.yaml#/definitions/uint32-matrix
+              minItems: 1
+              maxItems: 32
+              description: |
+                Optional bitmask(s) describing the hardware revisions for
+                which this trip point is valid.
+
+                Uses the same format and semantics as the opp-supported-hw
+                property in the OPP framework.  The platform thermal driver
+                provides N 32-bit values describing the hardware it is
+                running on, in a platform-specific format.
+                Each trip node may provide one or more groups of N 32-bit
+                mask values.
+
+                The total number of 32-bit cells must be a multiple of N.
+                Each contiguous group of N cells forms a sub-group.  A
+                sub-group matches if, for all i in [0 .. N-1], the bitwise
+                AND of the i-th mask and the i-th platform hardware value
+                is non-zero.  The trip point is enabled if any sub-group
+                matches.  If multiple sub-groups match, the first matching
+                sub-group selects the corresponding temperature-bin entry.
+
+                When used together with 'temperature-bin', the number of
+                sub-groups must equal the number of entries in
+                'temperature-bin'.
+
+                If absent, the trip point is valid for all hardware.
+              items:
+                minItems: 1
+                maxItems: 4
+
             type:
               $ref: /schemas/types.yaml#/definitions/string
               enum:
@@ -179,8 +231,14 @@ patternProperties:
                 The active trip type can be used to control other HW to
                 help in cooling e.g. fans can be sped up or slowed down
 
+          oneOf:
+            - required:
+                - temperature
+            - required:
+                - temperature-bin
+          dependentRequired:
+            temperature-bin: [thermal-hw-bin]
           required:
-            - temperature
             - hysteresis
             - type
 

-- 
2.34.1

