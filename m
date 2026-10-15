Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2796543C058
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093677; cv=none; b=ahzrFaNBiD9GVHdFLQ7Z4KCIs+4jTvuj9JlJOrIMcwRXWPEjpV4O6RCB5U5/GT7XK0/55I1hx1W4DQkl6hdhoqNodrEJXjR8jVmAoxXhMLQc4vSAbeiKBoMEtEQT8I8O9JbqH7Hqf66FkJLdofxM7PqPCyJ0kqkJXVIkzPks8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093677; c=relaxed/simple;
	bh=qFFJoTb3nSIwO16p02ugqs110utzgGRrGhD6kFiWYAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDTpwWT0xpLQqxAjg8PCc4L9yiehi5sldx48szule32y1ELlt5H1LPR5/F0mSyFNN3pdpEWIgBsHTQ4a6ZmrJh8b/2cpMw80hk1dg67OGdxOrlfgzK5kF+apNJgZg/HbP3uRUOFAG8cHbIvLRVvcmYEZQUmmgO1IGXeMfw3atMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXGvTxvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0VdDo12; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXGvTxvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0VdDo12"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FI3xmV3902505
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tthqinjGo+c
	QYBpFVofOLlCbpS2sIE/5ejUO/Scun3A=; b=oXGvTxvZ/NXDFHECrfJAJcfJak1
	oPzRkHvsFkm7dNv6a8l22A30v8u4FABKZo6gbQZb3JslwRGMf13vkNPU1I/bh8wo
	4y+XDd1AxMc4J2+2lgvYCVUdPE4hGfnM9DDd1Lyy+Sn5c7oijsCzBhpVkd4t2PgS
	K9m5/45XuAUu7Mg0zEisuidxcQdIHgGyWNE1gkG7IX1kREfIwiZm0cO3C1KM+5ad
	2VzZtKJPTjHt8VN2jHIpamO2fgzry6MqHqVnhPFePJVdGKwM1p5oD1zLnhRR/LGm
	2SrxTrwaKyJcxRuRyryxDOFElTWLU+F25ewj7QXtbeTLdgleFU5TVNceIqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3serbk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso401930885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093674; x=1792698474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tthqinjGo+cQYBpFVofOLlCbpS2sIE/5ejUO/Scun3A=;
        b=Z0VdDo12tUsRThJ1eraqQOy7Of6zwTzNJGEJTmnFWA3l7y2kpqKj7Vf8M+1w3tYxtR
         Q09/52igjpqjRF3V8zKMMOddEpl+57evNrZvnvy+9ShA0QTJjqITy9CpATAWd7bOWXww
         JG6Rua1c4991ZlU2r99qSTbg16YMPXa6Q5K6wS0v6kbRA0vOKGyPw3OO3OZvVqiyGYwz
         7hxqMEFDT8nQfvGjbI2GytksghLcUH1U9U2eAGnksR1ZSstCIq2Czja7pShoCKKigS87
         rpFqowRbzyEJXg28aTD8iqDPeKo1fM7x4SZE38j8KbZtHxsYi0dtJOtyxcfyp9PEn/HA
         T92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093674; x=1792698474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tthqinjGo+cQYBpFVofOLlCbpS2sIE/5ejUO/Scun3A=;
        b=AUcYpbRZjEUZnLtiQuYDRi8YFUdFsaPLwcgl3AUvQjg9EOFf4Ai0onuxHXGAXnlUOc
         J1TEUZ92tZK0ReEdQVgtXpM9BRAkhn+thmIPMbvYnk5vg9ceVUe7+b5DCHtgFQ46/8AZ
         4ic8yQ92PhptKeW7nHzhOBERTbVriM5g3eTmSEAC+uL0eA0nuWMsfxS9BFGdGFKClybh
         BHcR/9J67zk5tfSc4P6IBZ97FcEmRrjspOZDp0MKvYqVb9ut/dihV2y/mni90idZtTz3
         3fjFvkBsvLEf5o5LlYtblRgpLewizA+2GGSZ4s4vKXtIBE5NPl4HJpC9FgVgXwkS0E+8
         GAdw==
X-Forwarded-Encrypted: i=1; AKwUvBysIQIXMEWdcJ8IlPs4KoXmdOj6ElW3FWzNPmPU7AMdN1ZHEcxBNKsWNVzox318E9y0gRc2hBBimOIAAuWW@vger.kernel.org
X-Gm-Message-State: AFq9FYL0EmB2n5Q1YZqIAAPXdxZ2jt9jLx3nOP/tAAay7mdA9dtjxQHj
	UwsdihfZRO+I4ztUgQQQoSR23/fsKYgR72yqX6lA7uuRjEXW+mUYaIgofoNpnQCfHrc720XkH4R
	aB5ZjZarjd73FCNtqc0I+vn0/aiYDZrWYfn4q9rH/59MfSXonXmxWeJsxBW/HaoCkoKpp
X-Gm-Gg: AYBFou2MLRwiHE9Etz288fwGKjjAuyIZMlh5R9vi5Kqy6UUNn0pZhzxpA1uakP7UqER
	IeG6fzosQmUX0r/2V4q1GU7LtL4ruNh4johpKDv4fnYRPzXkfFgZQZMHYpydU6zLDCV5nnFZFZ3
	f+1WqBx6Uf/4vUhOEfI1+thSCWMitkOuUOvUki5oE8BpnZfC0yPozoPKP3wXTLXHBjWs5AN/oz2
	EnyLPI2mVAVvCpSnMH+6eGAGh63NucZrzzVeDIt6Q08F0wXU756tKhufiDe6QeISvjcD1brkKdl
	XDOQFM9uzeYiwLEZ5lnNQdNLYjNp+/y35PYunmI6JkVa9LYmITETFhzoEC+QPcNjz175xWEhk2p
	xgbUan9coXdtv
X-Received: by 2002:a05:620a:2621:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93ebd22481emr3504841285a.27.1792093673979;
        Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93ebd22481emr3504837285a.27.1792093673548;
        Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Thu, 15 Oct 2026 20:47:28 +0100
Message-ID: <20261015194732.64428-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dD2p60B-I1u-f2sMzpaGBsGx3PVIZsTM
X-Proofpoint-GUID: dD2p60B-I1u-f2sMzpaGBsGx3PVIZsTM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXwgvKAhXaP2Jj
 OkblORDm0FHev0onAclTcnCJm9K8EVluRObuA9AGAB7nBtY4cbT38MsAJauBkp5GVZHqcVLCvyh
 WuKVsYZt32oZO2fs8QjOua0LzCz0Je4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX+XMAamJvH1DS
 Pzmp2SmunOE/6dK2uX8FzUbzuK8Upl2yltNu1KLkGkKg0uqgJexmCG99x2yK45qMHDtby6Ij4sl
 bmeVq4AqRCkWj9re0Iz/bkXs71TUP+g0NF7A+/d3EY6sODDPrlqZr9zpHEnIcwVw29Jf9ETb/yX
 UYU8ixV4EL/Fbx/UL3HPFGio+tKo4VOF9/UNv5yZNhbPub4SIFE4jhQTvTOuWaqb3siFbA/Mk7+
 f1iSESYIMpO8dQB+IChifCf5NYygx+dXjWGgbw/K3mmk2V4szlATnRVz+eL5b0ji4JscVddye+5
 RC9j46v7OULOokkWPTyc6bX5CvquGC3dIZKWsnZiXAHxcFOZjK2MpXsblX9illzakraUTGKjwbB
 acy0UOJpsjzFUVBuPBWcMiWtShL3czzCC3ytAs+izzimGt/InAZH4ucsz5rpcwK2cpSyh6qrD8D
 mwVSXUsy1uTI2L2wISw==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad12dea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nXq7z_EH6Q6EphABe4AA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 and reuses the same
programming model.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..db30dd3dfc9f 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,pmi8994-lpg
           - qcom,pmi8998-lpg
           - qcom,pmk8550-pwm
+          - qcom,pmk8850-pwm
       - items:
           - enum:
               - qcom,pm6150l-lpg
@@ -161,6 +162,7 @@ allOf:
               - qcom,pmi8994-lpg
               - qcom,pmi8998-lpg
               - qcom,pmk8550-pwm
+              - qcom,pmk8850-pwm
     then:
       properties:
         nvmem: false
-- 
2.53.0

