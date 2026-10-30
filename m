Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341305;
	b=Ia90ehej7YsCT+dsravvFCZVsZ5DNY5kqjXue77GZDX8RQyHJ7Of5zGCRyf23mk4puSd
	 iDhldLFQueANBaKksx7WKaHembCTz8DrKGYIwduVy3DUexUrL1cNO1V5JBahcSe5tHQP6
	 5YhR6raecd8mimbzc2LIAP9tCtsHG0JsWNvFVWqt/1MA8gBaA1psVYt0G/SBm3zmS1zq8
	 0hiXJFC2oBQo9MVLntFthTKAFfPAogCpVKdFwy3JeA/crhnTJC2Vdx9v/0KM+tGGWbU2X
	 WoJ0ReVQUSbLEcgV571JhwQxAOmH1s1Z85Q3KivycQu/5LPYbNUVWOfOaJZ1zH0OzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=1MtkvyZVK9M5+6fG4m/oiAJxMXxOdMNEkpFVzEBBCvktbYzNBkBJGCkJRKlwtiAQ1v+d
	 TOtbaVsTEVjAWDoZzoWRYzEikeUuCTW36Xk1djL4ZMiHFj7AFqpEuAKY6TNrg6oqddh4+
	 cprS86lmfMWIqbGsrpRf/nyJuUmdq6BLtOp6+vKjjpvGmIhjDyAJgHs7EzGV2QWFSvNHG
	 xi43eEJWAn4MKPInAMDVeLNDEspDwHzQZ1C+XPBvDVZPjXe1gCe8pzVo0ovIUu0YmUaWh
	 hN+M1PX+Hdq38P+EmLGxdqWXBwBvrI6Im0NURBo9sjcSOb5YaBsSrKwE7fPnsOQ/mxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huTKyoB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A96606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A96606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huTKyoB8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4dT2286998
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=kJx0+RIWGjQOEL03
	Toy7PVs0f6x1xYEJwZ0EOGsCH6CNwd/JJcloH5e4EymGLPNKGU74VQ66qQaBVOEA
	Kh7i51CHb5lHJJ2qJmnu452UFF4nWRcS97Yx0KaLus/PQJKuvd23lfU+B0NeDnhM
	U9mqUEFpPoVd3vFtHdaGMFM36EqFH+PGfRzFNRRVDO3hjf67HVz7vk31HEpxkg8U
	ajWEw9+rwevQvbbAOVeoAdR0/4HhRhFB55jGHFQVBkoV37vrMXDJm+CNdRk9Xx6H
	YKIgLbDwhpdigevG/ve9r5GKXj9XO0zfsgF1uwBzQ3T/3H61sfEW38PqAKFfX5TB
	CUsMdw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89ff475a0deso354306b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341300; x=1793946100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=huTKyoB8SVjD2mVruikgIcnUiWxLX1ANhwSsWsJHzxZxei/AnLTSlrGNHn2PrY439M
         taOzCFJVltVipile48n+44oWCnFAEJJEAF8jfMKpqr6jSh5W4lpN4cDe7klYpH/4IP9o
         snPK8aXAing/zQeTj197DQagKJksMACjfkg81kK0ViD9+3m7x0pCxZw4IJl8nL7lQCmM
         BoqfB2d0qVzjAKyUcg2bVu9xDWwb8ZlESPpzLWjIyvP1MAQYK8mzn1S3enzlksddV/lk
         AaK0v5xZnhwG58lwGrPcIbkptRtx2yyge4TvkbZKJTTkOdbHXzUzIPZ3b8N5GIRSDc8e
         /lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341300; x=1793946100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=ASvtk7LL5eR8epzkIKcHP8hJuZx6A0uK9sWeV5EbNxqOZgofr2WW9gpdMNThts5wvE
         qiG5ydl3OVOlEXH4IfRRK5TitQnzH7sjlPP/UlV6naoCZBOgw8G9AjmMzymGgJnafkC/
         Y9JwKP73RZV1lmW/8b2mP5n9T3vn9UwYNTQcoUvrSG5iSQMFhOMH0z8E/NGtrv39Di+9
         udSX2huitc9gvAt4eoAZleKSyEX4MgeLP6LYcTncmmEPJ10zY70MFAv7vjsVqI6DqZ+n
         bunLPndl2ZlHwMqINXo9Oh97zSnAsfYSfByqr5977F6FWtiSnUm71RHEtkh4HGWVCIR6
         br6A==
X-Gm-Message-State: AFq9FYK+ZX3k6g9PKhJln98KRGwiCL284YrKkbcAkx6kPXJ3Tcxss/eI
	HRX2/QPSsipgEef9tY77flfE4TeHIq5qAnVHZ+mTB2tDtf/0l/8JLGnMo3xNjUlkU7f4gyd9+M9
	CyHN5FW8S3m6gPv2MrsLlq6At36Qex3/sigEhFxLNlGMlXJK1auxaijIixOI1MQOpLrfr
X-Gm-Gg: AYBFou3QOP8Dh22sQuEStN+Lx/T6IVU9Rv/NXQobyXqDoYRN5fGvhu9TPN96uMQe6Pz
	k7sGlUeERKxRId4eA561kjwbOFdqkjV1pJj7+SXfD0sJmRGS4ykDw2Wo44gvn4ncVl+xFxStacB
	WnGb0zeMI7zL/sEf0svSK38ix44SR0aVE9Q/TBP5Tr1ucTCz2djQ7OQAgn6lSx8mrg4Bi4Fl99J
	2zEiu6js/Ts5feYR1c46xNnXUygJEyN0Oq6hcDN3NpJkhZMLDmYbQbu1oQ1qp30rz4BDE41dSGX
	L3eQkTLfsUdOWJr5fPuQOb2TsDScEYRIuHYVs/xFIboF5NhPOXnniRFi1hbmEjilTMmElUFvFni
	c92s8m4qGvmnXP0VUAEGxzx0rx6Hiu0nvyfyzu7T5w9qRjKPA3HeVJb4yHCtJfX2O1i0=
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209645b3a.18.1793341300155;
        Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209631b3a.18.1793341299712;
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:54 +0530
Subject: [PATCH v3 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261030-pm8010_i2c_support-v3-6-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=PZBL5PDBWrGF8v9vICz/rjOoHgZ6Sr5icUeqXHTWjYxJzByPsFzF6/rbxm9JMZk3v1bAT2wHn
 04OGor/UivlA3u5yQsBIIFIFv0xG6jW6KR8tYwNSq46Kl3TXiRZrUze
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: SzYIQTG8m71pMEpYHe-83YlvJOVYpZnk
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae43776 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX0rj7rMOoi49L
 1ycncEywZ2Q14hyd9mofaVzRjYjSQ4iZXPGGZ63xe7br2yjd3IgptviyvjjhwdiOSaLeseJjpNU
 SsngNS3MxZvGF7SnG7PUldCCV8cuxYvePxe+EHTvpXNnZoMwksbLXJXz+sed9I7HNmBPGj+0D/e
 eDguCvF18oAKWiXsU22p7PKA/o5lr05sE7AO0979BKSv1F7l3Mh3G4oL1w9BlXUUJHxfRhED72R
 T9RSJN9Xl09UHS/AumwGMSupMkJ983tCumiverxbl2uv/jDqkzm0Mh5HjAkWOwvO3pmAevZSqaj
 R24385vghHWdieOhTmuelkhYHL0Yt2dKFZMWBrJPd9rz4RFZflPch5lKDaoil2kQZFLcg0/Ah6A
 uHJyuyL/7Ow+PKQaaNvXpchT025tfCqO6zCdHqubTiAEidzRXXM6hbmePazwsffmdRFHbGUVWwP
 h64qOKtGTG3LgbCjipw==
X-Proofpoint-ORIG-GUID: SzYIQTG8m71pMEpYHe-83YlvJOVYpZnk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX6xAagZvShCHb
 AVDVkH+MUPtIuD4ujOkGwl/8lHL/w4JgvGdpfgx1WMMECVMQ4ivTkI//xD+eYDHvmfsCdBlQfQP
 c1CMzdOrTFdrpocdDXKl/8cndyolg+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

