Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452999;
	b=LXWi7zexGOriJIzUWJJAyP2uGZd/wXLH9qT/wTCT40PToTTtifiQ6FBSHsW0+i/nqzAZ
	 3yrE/FF78UzPqSGwSkJHJ/BfxUP5zu2SBXhAY9fLW5d/66Wu35N0Mc2wUPQ6YnO4JLSt8
	 gMFrdM0tohX1hEKDej1lel4RcuJ6A7dCA3PxhLViCDfqPVWYHxxIE3TYwaLjH0p8K3cfp
	 YhWoko71oGIWBfgnyA9Gjvk9r7KrrSbEiykZATVjM7lwTpYv/Oi08ekpc28BtLG4fuC4h
	 1y3EPfU418TvJCELKzmQV75uMsokyKE0HsjyYRc4iSd7iMScBho50MVmscVw48fspZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=;
	b=twpWkySilXnxWe7NBjdAXbYOtG8KKroz/B69SKXVHUb9FXS9HpTMIfed7THntmgeN+Tn
	 SbtCpmovZcgEEg9rTlgGgNcYpTg8eSR3GhJJrw0EP8auDh6/ubBdiYMzq1VWhb2811jfh
	 E06DExo750K0MpDERoR5G2kffJGMVjUs4VBjJMdx0KKkGoNdTkWNoz0pSf6AAHUlj3iNv
	 SXc/x1MwJDG3y0+akEfWshUAFzFbg+y9jLObDgAXCJMgHnKPsbUtyu0VzYh2lwr01Ic1j
	 FLeBbixT9j/NEiri++RF1RyH1019T+xWjU8UFl8ppjagiFxpRGSpuZaWyB0P6FtAjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNweS2kL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUkem9Gc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B17606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B17606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNweS2kL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUkem9Gc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0VUG3209489
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=; b=RNweS2kLLiYzRuKf
	o8AOiskYhmIoQEQeuYb4UX8XSBHuSUYNtE79nqhtW/UhFiWP6H771xIXGjcKVhbm
	/Bg5CYXbaWctKdA/deZHUEjhxo/gojv/t7Ibnx2sMgg2nSfMZ/PdABFxywKWS2KY
	bs6kqCr6zMftzT4McsmDekOVb94eXOklpP7JL4Fl477Pf4LxH/3hsDUVsMgcgi5X
	rmcX43XxJC7gJXvPNRtrxF+oa30+h33WtvCcc1/gzHQu8m8DRikJe0/fOHRHxWGr
	EHhK+YsegoPVqVx8y0sI5brnC3vRU/8Hku1c798JMSwegLRnS5K50Wk9cXmXDRdm
	flHozQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rsap4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3045644eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452998; x=1794057798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=;
        b=KUkem9Gc+v02mhQuczLT4KZ6QWcf2dE48mARWuX/gWDWcl+Ku21ArvXecMouDzANHZ
         WJlngq3aji0ifUJs0MU8kuPTt3QbESI9ZWmGNbAbFm8ZSWTnRedqg4LbeqlqdTdn9skp
         WYh6uU8qCbdKvs20EDQVczfNzBPBboxgheUQKgmfmRBZocKSoJiJ+5GRBsL4ojzbSxXE
         F27MWSOEyRSwe3hh81vbL58utmEL0+sSdYntSBYx9p5MPw/IX1V1jt7kxpf804IhaP5J
         C7d7AvyPfpOpTetRnalUxtnUtr+wL6LwonVCQmIJYuzNHPILDHt57XurusPCIfglDtLL
         gEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452998; x=1794057798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=;
        b=Xs6lKLmL2vf43ssNga/p6XP//8cJ1Sj8TChGeqw4AZmLMkPuMKOEJHmoAu7aKZRciz
         gmpXsliJm2q1uGg32LKvZijxCqASWPtKqUIx9c6ikfsDodJ6+83lJYYv297ZK+mWkV8x
         81yLMivnZJj1xA/arL+Uc0CINuYv6kTzkq1dgdELl7Uycnsqi/6Z64yw3+6VetPgiyCK
         TZFMLwow2wUJpgIptChERTtyrFk3sTgzPVUb9fW6k6J0oumJt4JDU+aDUSRynmp6Yycg
         3MRxhOTkC1TqjjktWHEweRh48NvCMeguQeLo9vfk/4vJ5be7J4pnO/0em9KsY90pN2fz
         cWwQ==
X-Forwarded-Encrypted: i=1; AKwUvByx0RSVt+tOX9isIXYnfIq2MGchBVGAcOcUzpANWVN8na6HNp5jkX9qCMEHVs9VsJa5JBK/T300QuslqOjj@vger.kernel.org
X-Gm-Message-State: AFq9FYLv0BeO+zDYYdyZfebzNZEvw0pyF/+j58gFiJETPAHxqMK9jbPA
	vG+U4bwMw+0mMuzlch7TtqLcoLoUdC60IsdJA0pRaHERI1fscba4vpZYMVfCKVlQIfiBcZI6hFL
	NNRlhAopRSykbM124UZT0ozz/lLH1+QscoToxNkstKkbaY9VPJbhTgDHwKs4vO+zQMtSi
X-Gm-Gg: AYBFou12R9inJhxECjgG41hH99ppmSwXX15QrMjFUrsQGuzWX7SkJHrqGvreG2OiKqE
	GSfylKj9/qAjrK4HASo37fmYoRUHgG+PN4GBV8ozlQJ8TUKEK9VtScWeCmyPR4Xrq3+fF4jl07O
	TqsBaIM1aGfxLFOTH2TMATQ0z+olpY0rTLvkcS0I21uOlqnI7FSWSBtEINclZFw0T13vG3CrDXh
	V5SqKZCuuEQjuhDVM20Fn0PBN8AI6tsSJGIBlC6EsCMN0iw0uV+hJEks897LDjYgVPGrnQa7tB4
	pE4t7yYi3ddftgEN3DTwUUBv6T5ZNNcjaxjTs3ixHkxZAlohyJZ4KuxdBHBuMye7VZnE+KPeCZE
	d431enKocrfWwoANWeTLgb3MMDBn8kcnLQsQo79H5/3dZA0Q7/TgJIaRuaU8JMlksrpBshsFFFN
	jAefc=
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr6930074c88.18.1793452997928;
        Sat, 31 Oct 2026 06:23:17 -0700 (PDT)
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr6930039c88.18.1793452997369;
        Sat, 31 Oct 2026 06:23:17 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:17 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:47 +0530
Subject: [PATCH v2 1/6] dt-bindings: thermal: thermal-zones: add
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
Message-Id: <20261031-thermal_bin-v2-1-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=4695;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=ncFZPtnOUeeKhOPBeq8g6g1+nKJHU1t/0jL31m8J8Cc=;
 b=Tm+Ia+SgoeDa5fXtBbi5k9T80BKfPWtqz/KtX4cC0D1IO54QiUL7nDXJbvoVFK+i6miQ3IKAZ
 7TfNxEHrpxNDP2eKFgG7ZOW0akgtPOifXwZsuyY9l6FyKg9q021MnO8
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: elMGxKPxaB9oqyqNH7ttvjzvtHIo6oYb
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5ebc6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j3Ouay22MIlEJhTpI7oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX+TfAUMG5gYB6
 a4emZrnzfCvOuFq/o+ixIl7xlIJgV0MbCTSKexODb6KFwDv/0vWhsAqA4vBn1GbBDUrKl8zFA0l
 eEJmxaviIBLoHu0aO8HnEu4mag+6wB4=
X-Proofpoint-GUID: elMGxKPxaB9oqyqNH7ttvjzvtHIo6oYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX2rXoWXhjSUd+
 BDZaw+T+DapmzTqHSdOyDIqJ4cA+huTEh/BlqnJ5IvWwdSPJJMXAI4DVOt2TO4fukG4KhAJF+zK
 0N/eJuM9bjEoToJWcqvk5MLZuMN0j9B5+WwWMs64OC5JRGVMAuPMNjsizdHhBHUykJSjHevSHKV
 uL+Ej1SD4ToaYQYD/ZhwVAXGuMogr3zZWOJLEUvOfjS3jgn5S0jcO0ap137U6sg3u/o6rYLkAe9
 SvZWpIgSuEkIaSO4i/FAMm3AYmpaqHKcaB7pVPh1EOtn06PRU6r9Yb700wYrz9ouRfICE7CrEQO
 BhXjR8ecJHuMDltmS8pJE3DTBBpUEBsbEBFarqW476arrCs1qLJEhhzxQpNhf1Kw3J/1kKygY0w
 uO3zff1GHVf9gNgiqe1jzeTleU9T8kQp2Jv8weaWM9YrfQL1UaRnan66i45C+oQle3ZR85OVSfN
 r1ZoH8pqUoKPgygwiwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

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
 .../devicetree/bindings/thermal/thermal-zones.yaml | 57 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..62590dfc77bf 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -152,6 +152,55 @@ patternProperties:
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
+              description: |
+                Optional bitmask(s) describing the hardware revisions for
+                which this trip point is valid.
+
+                Uses the same format and semantics as the opp-supported-hw
+                property in the OPP framework.  The platform provides N
+                32-bit values describing the hardware it is running on.
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
@@ -179,8 +228,14 @@ patternProperties:
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

