Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05995237A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115116; cv=none; b=Qo6v0sdHx/yiYDWuOAgOa2KW2ag68O1JkdphPTZAMDDG6zENE6ljnDvdFe8oLOvWFMthHyTwhehrPmIyEAMDjV4yFJZ5uK6AK23hAjXet/F3evwYnBh0jw19B4H9MDztcPGkP01KTVRhMO9CFWW2K5r+rJQh3TZyIO/OkEVkghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115116; c=relaxed/simple;
	bh=OmXjFGhBNzHuev1ToYpS+/g6gbD2jZQAPZWQtH2A5SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uf2JVes7vt9bzfQyDu8Y4bYsDZdOsDCGc+3eBEQYnTjYZwniM8LNVTuvgVNNYDBlyvS4t2pxr8GklXGEAlA1qTH8FoFs3/v6TAc9GBCvhwjYfwTwa9wHf9HNDr+ziU8iInmPJNXip/2PI4Kp2zL+92Qns4eEDuNJJkurFiqL+O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL9ocmPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNttmTW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9ocmPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNttmTW5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJDXA01167885
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r+t6o+vTCc8
	nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=; b=XL9ocmPxDx2FBkKtzxKORMHiqhk
	APcdi7DENvLSHZkDrEG0l8rbJTWnL2a0oWDRFvTIbbAnNR8ZF1bAPD5aKuWgJIhJ
	8tlfTYRe3LjbnX2fdPjQBw9aMUxEQD2+7Qx1IxXWWVeTBIg+ROZ20hwLtwM8SVj/
	nYBSwikFKTjiiWppIzEInK02yWnclIcAM+zmwgHXBH46opw1kevrvp5Pp11jfCbE
	WkzYTQSJa6wRt3sKKxFS9cKhiRDoRUPFwYCKBBmyoYfA7kLhiQslAmfuHZlc+FQy
	TMA9b+UiCmwkmBoP26DDMsIpQPDd8KBl6WrjsgLu/8oCv5fD23VVJSwS57w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0u87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1bffc2eeso78899685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115108; x=1790719908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+t6o+vTCc8nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=;
        b=PNttmTW5tbcTQ4e5qq5S3Grm5oKcWuNYUWGqAeCWBHH+c3MeQqZ5CXa+iBKV7pS2QV
         C26W4R8rCc1c7lfPEqAMTU7R6zmq7CgbATf0BibU2n3WmzmbsppDa7RXi5lFYvIYHe9y
         A6skkLoKQ2BfLc7OnmfktSg0Yo+P3Dgf4YT1ngrWjQrB4IYNc6G6Bfeytazm0XD+9r/A
         lN7vq0hBYOFAe4ip50tgsn+pT6dxo+pyDhcKTNiylvesav1FIz8JfPx9TZw4t6w/6fw7
         PtADa3KqzkhX6ndv7Q1US24iLGwLYqxIJ83Gwr7JpuRDWAb7J9MHTcns8BMxBGIuSVLY
         WLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115108; x=1790719908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+t6o+vTCc8nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=;
        b=MKqItE4Sd17BihLeXtR0lAAjsPO4rbG3D80nBs7O5aTij+p/5NVzBfww/kJXE/zi1L
         SbfY/rY953fGXM8OoRyIISJ4HbM6gj3apZJKzJRHhM3JfU36iiBRMImGAKlgbtUdbHC7
         ZYYbV8pchmK4zRNM5X8LsdyFXtfOXswzBBuyVUYDjXoTCuhaY5Ht4ZXH2Okluk3Y0gbT
         miK2LHg3/9yGzkmNBBc0G5d1CWgSAOIzwymkFcjZstvwcQEgtmMngDz9+i8B3GJoc7cL
         ITG5kbGZwdUg/NcBZNwCIvzrTCXYWwLNT2QZTyIWAtTlLli7zSq+Z+MjlMscW48Z2Iec
         VQHw==
X-Forwarded-Encrypted: i=1; AKwUvBymTsyLbKa6HuUVueEf/bYDnH2gGiS2L+bZE8XmGBOlnv8yPdfb36QuelsEDe1I1Q3nYpJRmHkksaaCprYA@vger.kernel.org
X-Gm-Message-State: AFuF++lMf6k7944cAHDDUWt3tDKPVkD+qMtPnodQJ+8FhLh7Uy3pHHFp
	0+KMu6iKVDzvnVBZUK7sabnT5V/HX7cRD/jxT0vED1dX9I7gpEMye7PY8kwKuDDTs7G0zgvqzDo
	tYsp859jNHrnF7BM7PQbi50gyfc+YKgIjzLp7e1H+xLi2gLG3cpTLKrB3kJAuXy2gQC3K
X-Gm-Gg: AYBFou3mWSKSeyRP8Mx6xvVnRu8UY6TiyeD3d1vruKB2Kq0psflol//wSFfXbi4AVPe
	gg9f4yj3igiGSaHyUm3i3a3RvikMQSxQRfRYuZD2DQP7f5rqVQTRkGHbtkEHxm8cVr9ty+g8JGC
	84Z26mJYIDy6AXqeGqQDS+UYZHLicWDeMWIXOY4+jUi/1O58ld0KQq0xszO3WA/nsiZx9n/MpxD
	RhE6SK5sI75BToGy9WcMhxfMhZFPveMojTMjijrm+UwmixmMdyVO2R7uX/0kdrkL6BC5YGyi7dy
	gD7QzBpKiV0esO9mNtkIMzBnKmTzVk16bCzm6rchQJ/OxLA+UZDa7uGQD0j0X8ZqlLMyO8791Bd
	eDDTdub9dTK4v1Pm+liJUTAcBDX7n/4rVK/wSTs2Ebg0ChBJc/qHIETDv7td831WmxWmkTwUw+A
	4=
X-Received: by 2002:a05:620a:27cc:b0:93c:22c9:68b2 with SMTP id af79cd13be357-93c251d5db2mr129889885a.47.1790115108129;
        Tue, 22 Sep 2026 15:11:48 -0700 (PDT)
X-Received: by 2002:a05:620a:27cc:b0:93c:22c9:68b2 with SMTP id af79cd13be357-93c251d5db2mr129885785a.47.1790115107736;
        Tue, 22 Sep 2026 15:11:47 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
Date: Tue, 22 Sep 2026 23:11:24 +0100
Message-ID: <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXz58ZqkIv3Bv7
 74Qlk3UrYf4FoM1XP2lindOQMjJvkh0DpeXD1zAZyo+o2bvS2rY7XBfQthZfuMGIrhMCcaQJNsA
 wGdxvcdnG0gv6ziMiUqmyko2rreL7drO8RyYfaoa6VG42+h/+2Ka43g/5WD/DF9AJhOJnETHz8+
 CNjJiadWGJONPet6V6it71UWhJ+fksPn1CWW2vK5HWEW366ljP64uhHpHROCzDu7lSL2Sp5ADYk
 KJEVcK9BtTxkyKnGt9bb93sPqcQAxNIHqPWTZDw5FdyzZYuBWeG3X0vfC4zET/ZnxUATyWRAHDs
 mZQWg55RkYStNOUKcrP9ci7EUH8dpi31oBYIObZX7JhDZv618M39powtZeHaIpTbe1tSK1OppRU
 BXbXsTv+SW0lz3NRyR1CuzZwcwBB7Q3uSczdtwze4hHp2IHXNHsUjLSpDRfDjbIVQ9noGiHY9ZA
 U11jWzq76bSa54JVcjw==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab2fd25 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1S9TnuZ4X9D0nYt2MHYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vIirVoo1BHXfco50CpYrsr1Nze3dhXQ7
X-Proofpoint-ORIG-GUID: vIirVoo1BHXfco50CpYrsr1Nze3dhXQ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX2h2DbVE+UF7y
 J45FubUHG4HUkRtlcUCyqq25SUrayP9B9sw83DKDN7TH2jTlz8VQsDzMUJCxqadvqS4htviuTFB
 lz0gudb0Gnv1Vtcnq7c8SzyhlMXiKh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

From: Alexey Klimov <alexey.klimov@linaro.org>

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec support.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
[Srini: reworked the patch]
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..d750da31ae3f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,15 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,pm4125-codec
+            - qcom,pm8916-wcd-analog-codec
+
+    required:
+      - compatible
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0

