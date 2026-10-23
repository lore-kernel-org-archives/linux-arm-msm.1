Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775877;
	b=kfVOmhvS+tDY7WJ9KYwBvlKV4drY+pdBrA6ptuHKh5qY31kXvFliSYzMkikXUD+AxSII
	 bfXJw/E5UF7fFG7/uwn7kqPMJ0txe2yeHOyFmFjRrLFbyUf1JypCLploECSnOeuDC72Gi
	 QhSTbo3VtmTEn+ymz2iUgcORQuBB/5bQomQ9DpSxsnFgIB0/dwdvNZQRsguLoo6GRhStw
	 Wf338ZdeGrYd6x7u0hdSHs527zT2ubghB6g4YiDDjjRB067APBgnPehrLeXHFGZbRvcwI
	 9i0KuYAO1T5bEYB1IhGXRe6cBLElV3F6UPVexIDj5i6jTYo26hDCI8uK83RcwF6ddog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
	b=nHCiwtKgbHJAY438ZBKHAw+MaVfK9GfS8AG8Vez96zlC8Tl930p+KICJU1eufJaVCyRh
	 5JgAfuuJ0tKB3/wzTafvgCqP4rnevuND82+Dx12h/rdF/2vFrHbSBIV5sXr/PZlCeb7vS
	 CKd9dUsNJGM6WffQz15gzSza7kXZVxWVN44N00Tc2x/YnNzpcHBpZxgky7I9UJl7e5cHC
	 CJU4bZw22ALKtYVKUTKoq5LhcL5OqM4HI02ZCfU5xrPxqzsVIQ/qnZfzSzgK0XUibqH3U
	 fUH2bAHLozSR4SRsje/7Pb+VtbKqYNPUg6EwkncM+zwdXFykSwPB6C+LXK8KMAmSRAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2U4hhB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A860A262E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5A860A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2U4hhB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE60ZF4063556
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k44WZ0y2BjN
	G6OHV5lN8787fSShc67v39pliE/OY8Zg=; b=i2U4hhB/VXBPwwFTdMKtAeyEP4b
	db0K+zAm99lAe4dN4O+Mho+bRynV30T0EeMxPx3IqpuWrfro5rKzgWAtHJ9j68ud
	P+H42h8cazW451uiTZTxB5tLz+kcEK8bUU0mKxkbTuK+uhhpBkBT7KPRNEHGDPTM
	CwBQSjbD+ZxOxeRm0FCwU8nn+/ehsiarOEs1kcHIsUOsFD2aOcOHTpsdf+7dtC9T
	p7nI1UjHH5XBzZoIZAaVtNhU8c3BUdnmfL54bHx3avq+w06LG3HkBoXhk3n9Xl6V
	jq8Ag2oD+hg/oykT5HBbGVsF6kWp568ObpOHXds7+9qATALopz8KvvMUhOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcrag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so203693785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775875; x=1793380675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=TeEMfGzcqO98vG0GPuPD55MCkwA7vIpcSwzQ11AQjDzbp08ypEDZ/dw+B11sqHjlvV
         uyYkd8qSZ4e9AMbxfO21MG9cqkhpuoWHlYVxgplnGsq9fFQlW0PjO4xDyUmB9bOMRZJF
         tbJjcY6lhiEx/u9IbAtUCknbKOWefxqoWTMwfrTuL+KzPS/KkkezCy/Nzx7sAievPrrO
         KzRq9puwIaLZ4ckaczrFXrhYPqEwl0sG52immISiTvvGaXWTEol9DkHu1DIlzQmALYI/
         UEuNYTEoOAN3p3YSZ5Jro1OKqanXNLlKpAeIE4Awf8j+O9DmxJRcBwf6kEBKkJcdDmUu
         BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775875; x=1793380675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=Bal+vaAhptMXqf6CNi7cwXWaTCI6Z8cgrzjcrmY/93rYciRpsn8h9yJvXAa02ESQh4
         YMPa5TaAsS6llE393WysODUvynZ3CTFd7W9M26VxQMgluzPWNI4HwpeentFt7jQHEBzL
         tfhcjmi6SKM5N+e1GC7A4oao0Ni56emOpAxmnqW7+Urpy8USjGkoP91ddCdFJGwzXof1
         7UzBJ1pB5GdeZVByhClSLQEkgQIi+IVy4GE1EWf25Jh3hNd+MwvkHxKRnk9hTHDKrhO9
         LASW4PQ466B6gnomP+VBOuBq/amY9ya3d/S84pQqh13/wgNRoiTfCfu+6ACfNg3GFJ0I
         Qldg==
X-Forwarded-Encrypted: i=1; AKwUvBx1b0uGzxM1eKZniVrR+D7YkJ66WKWUc5K4nzHYARJnqHulCzQLYhAZzrxcpam6KOedqrEOhanZ1j/MA3XF@vger.kernel.org
X-Gm-Message-State: AFq9FYIVa2VzGSwLfgTmAi9fNHeoeDl01HhP5P9Wh4Dl3OymaCOHAEy+
	8mYD9E6ffnbByzlMyRpqJB3cCWMCFDAeo7HF44slZDMsvhMj9T5uRpCppWG9W/+0EBwmDCNT5kV
	PgYRZgvCcwgIqpsfOo2gYGSMIZmGw3WVjFqsyhMMi1uv+aMcX95fRb4unmA6DzPWzOGKK
X-Gm-Gg: AYBFou2n1Lb5O8H/03kKnrqeFKPjlEjNcyHWuIcdSIIXhOHK0j16zt7y3mx4IxO/Gyr
	JS29m7mmMCVUAQ8cxMIWzbPSauqAiOhM/J6VUb6G6qX6Ri4NFFT7GP/eie8q5KpBXDQjoUZABvB
	j19KRdFCNkKkEK3pZMOgw5mjBz0XYOCJBFnxG0oZ6wCevGm4kEJew9YzH4A81iyQaz2CztXtlBU
	B9uTax7n6F8BmWUf248JRaWiQejO+rDRtnzloIBTfPJIt9qNIiDLT32LukAuM+W+u042j2Ow4CR
	zFjgI3LkDRUz6T3pdBqLHkfI/MXsP2e5wQvDZ1ub6HG62elAfH7LFFGOHDrje7bp8AvNb4S8qqr
	LYO36MB+qAAal
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960273485a.34.1792775875173;
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960268185a.34.1792775874548;
        Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 04/23] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Fri, 23 Oct 2026 18:14:14 +0100
Message-ID: <20261023171433.820092-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DaXqCsGnrgQGApgT3lIveL70tb5cFNiv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9CF37yjBn6xf
 5X3y4mNywJXP7vVXptTh5gfTa5rPP8eOBQNIhQizciBUa1drqyZN8o5eNfWMvyVpyeVQ/tIFRcr
 /VW6gLN789C+OoLeVid4Vq3geDVyZk0=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96c4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXznVJB841Mz0j
 3LXdobWMTC+YAiOYIesfyTqIPqF2rBk7tJiOa/AXlvdjW2/9cgQIL8lmBh83lJCcJ4BhtRy0eoX
 bsbL8iP1ay4iKA4rczPkABMOZvgYtI3gcRWOMPY1zNpCtY73rKnWMJSCDWGXO1QLrAuxtRdwBkn
 NG7IcISgCxURkXBzOgXJHf7ubdMsdMNj1f76vId82hgPVf1ICESbuAxWhcSX5Adh7+o1R+hhHsv
 fXff4r8WYk98REcWF511IYQf9YIA+7lypc0yKbPZlUIohdEqieF4Sh3UvFozEcMuNE0Ey3NwcBK
 fjfWT49WbkuM7cGmzBtyTLKC5NnerFD5uDVnESBsL/kv9l0hz17mSvlDggeKDdaIFFNuo5m48Tg
 fb96h4PMQrr02L5wmXFyb8NHoF3U7+ydffmvKEsa+zXSqJTdfcGgBwCcx68NbEUzYDvyyv3MSg4
 gLEYwBkgxOyDbgGhp0Q==
X-Proofpoint-ORIG-GUID: DaXqCsGnrgQGApgT3lIveL70tb5cFNiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.47.3

