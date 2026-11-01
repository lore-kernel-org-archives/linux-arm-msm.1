Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502559;
	b=M9sWHTzadO7wMPKFHnWlQcq10Q7A6sczWA4Yk6FpqEjWYmdTxulti02Zb/S0BbYToMne
	 kWdFK/zbuoeYEJF7fT5PWKxCasdyqgAqd/8PUVxSjmbxDPz2JeXC5zYeXnT+npvRsVF4g
	 RdTZw9oodbXPIfzg3XGyEk8rr99QWxeaHm7qIC3TzJVNEP1oqmDCoWAElrMbEaGGRV4+Y
	 Vl9cXZycvRICmjk5nZCrq6Cbu1u9r7mEzascUj7x/n25WKi6msVw0CDP2fV+pu0yqsGHb
	 2+w5FF11Xuh+4SIBpjvLGq/TrL3iR4CgZfv52jt1MKwlymzZFkh+JQqK2FhrWLwKABg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEqd/JdTqoo=;
	b=aO/JYEbEOS2oAjW+UfCLeGtfOz/9V4Ng1IwYXVsXJZQvWuGinX/OL66Sr+uWZn6Yx5VS
	 HYcVev0eZ62bRjNm6HyokjoSZzHMT2D0hVOFV47TOOkF+Aj+rw1LVWJWXf83omiQLWfCw
	 mJSAD0+uHTpH/8ZNxSFGYCmE7YZDOkjLzV5A+whJD8b9hnBpZ27uiQT2sXzEudIfOvjO8
	 reDsW+i6CuwEzrQWJzwV7ARA+PupTw2TRDbn4otcNyUz4kqNY0aPxY3M8elJbNRSJFjq1
	 BiTyzAf3rNdUY7I10M/JxIPU39WKNH5oVK2/3mpfDhk2YkSYnUBr4EVj4Cr58KZdrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMJ+yuQZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHyN7F7Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6781606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 03:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6781606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMJ+yuQZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHyN7F7Y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A120W9V3211743
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 03:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEq
	d/JdTqoo=; b=bMJ+yuQZI5dzc6xhVfHgqnI14aoiI6XgEhbaq+L8j2t4GdDRL+B
	ML6Xn/sBpBUTrzvgdxpGAyNRTVebyIR3DqnUo/lAXqxAdy9HWnjgvN36BeLXMixf
	S7JaMSkK2pSuw1vtR/hx6vUq5n3F+Q58NSGUcJkKyPWht04GmDxc6k/1UUromGq6
	+FuRTLnPq3M9vlpZF0UMU0u2YkVuMmid95yfTDOwe3P8phjESIjOj62h1i8GaODS
	42Kn3mLOKe1yMS00SZTtptSoWl1PaZxANCOs1R8Pg+OFhPM5fBOI3xq+egRTY9rK
	Tvy3RA8lM5mw54fbCUkKe9NKRa4axxjbNFg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ejdjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 03:09:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so3378726c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793502557; x=1794107357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEqd/JdTqoo=;
        b=eHyN7F7YKbQjVlgXeV88ThJT9gM3h6I8CIjDWvkBQsC6zCszOaw1FPi77L136beH8C
         X+kNPsXmLDNoo0gEeK2ZanxJoRWXu7R9h3JlOpt4gWHAW7LKnH2hW/OY+s2m1QUHTTfT
         9pmBOrp4r6veyAJn6WUGqi3sLJkK/ejd8UifHBIkS0a6rVJGI7nLno44V7qFLM1LXbqF
         z62qtKzag21KkPi84BLiiY77hmUfp5i5pjLpqKYw3o6h4dnWNQXfrotdtEHbuBvsHP/m
         mymrmhdEi8tHJZlqx1YyiJRXHNDlJK9s3qXOVsTnJrmcF1oIiK5NaI9JsWWphM0nLO5D
         FaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793502557; x=1794107357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEqd/JdTqoo=;
        b=BsUxnoX3BRZfc5mnvyXAO34/QvWEg1KpIhf1A8N5Ol8NpOMbFxeetcuc7o/L1tp37b
         wdNkvgNQ9lMZxzznCtLvcpdczJ6yUIvqszzsqZgV/SeVuN9MHQVpZKnIn2HdJ6xdTNJ/
         cbgQO5Hst+MQ5i0RX0ye+Grp1L/Opq9QV5NKrrQQdMYmJz+KPgH1yNylo6qhm7XCwm1x
         CZK6/qErfy7D1GgUUKbVIjeE3YJ9K85skE98qs9k9y454Ns/xBcgZv30Xpg0R0I+q7YO
         DDuiW8zU54ul/TU4uv4TqATDIj81odcOjfkFmYBIs9jCs8H2zF2n6DM45zcWox5rJF4C
         Wb2Q==
X-Forwarded-Encrypted: i=1; AKwUvByQfdmY0/04CWKxhZ9vMVwr1Ixh8piSN+JxmyeHRiBbli6+79Qkn2FaBr0Ddl9NyPHhGl/Y7WvGSf1q2gvT@vger.kernel.org
X-Gm-Message-State: AFq9FYL++3WfoD7KL2Bct9iLCeYh8e3PMyHODgvjzjOBxsvbASyV+xey
	oGi4p4sP5Kqz3xnMBd4UbJZ+nSKoVp1+hpv4cwb0lb14tHNxJ57r0yMAuTBdBOlvFBIeU1/CGJq
	7dfcaHXkuAnrnw7DvWuyv9dZ+3D/H7KqSMw4bYBe38NFMGYsrG7tfjTpkC7Uq0uIyyJvt
X-Gm-Gg: AYBFou24XK1CsQKSFcvfJouTpd9dxbFedGaZX8x62eNxJOFssNm3hcbUZQHEBPCugXm
	3QMYSXqnkmY7KnTgshI/sTCf95xnC1Ao5k9HZTvB5kev4s/1zKtE5SW1JqdI46AO9N6uZ8Zm0ej
	zt2DdlF0VLuSaD7Qb/6iUiZXU2NHwoAC7uQJqJyb0iOCXRnA6fhdPXv3rhdxoJY+AanMvk18QXx
	mwEsmhVgwSAcBITDwVLaEYN16LHkjkYUfqufzWKDUfBhk0gJ6YF5381oTBDG4sv+ZBufNYXzyHg
	60XgcDRmoq+5bqeSeDfbsNtqDYrtO43ldOz4CFUSUe4/Y4js4RPkxu8RMqdScr7dh5l1cZm/HCp
	riQveuE+2YkxcHyis+kUs2QMQbv0oXnEAfUpjMAobwapSa7K6RoClGA26C2/1ssKUKzHI7KPAhY
	vqKKAdc+ats6NZN9orebIOirBJn5b1GOq2
X-Received: by 2002:a05:701b:2702:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1ac55777071mr9201346c88.5.1793502556981;
        Sat, 31 Oct 2026 20:09:16 -0700 (PDT)
X-Received: by 2002:a05:701b:2702:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1ac55777071mr9201318c88.5.1793502556399;
        Sat, 31 Oct 2026 20:09:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm19577174c88.19.2026.10.31.20.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 20:09:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for ADC_TM aux device
Date: Sun,  1 Nov 2026 11:09:02 +0800
Message-ID: <20261101030902.1387122-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfX/tydwAxg3Y2P
 t497QR7OSmTwDCuMVBeuOuIyYKWWqTFSIc3Kx34Oavg6sJPUtKePeyjhsDRnV2ygiBhppSeUM3e
 AoXLypd487HviVyZSXb+dTUcIkKdn9ZdHYJw5dhNBIf+GJc14svYqdY1D2YyLAko212z1q2TqDh
 wGAu+QpqErYil9ji3L07LxWMsVF2AR/ma3JuZ5ADt/Usci42LnwTGHeQsq61il+k5rD6d6ff7iA
 s5duGMi0rQ5JfNwqq6DU3WHIXbPq6eoGMhLUjV9FZR1ZOPSQ4R3brah0p3OW11vyrhYucalEX+o
 HBCIsqUCVfYZ+IszBhYoEucKDcZSbZ1ZcSiOlou6uvfV+WXe5+uKGeE6CgtOqrqRDFaOWTAUhRg
 zAV75pc/5E9eTohiu3T+HpYbIWemo6M7ZMjcQfp+11ow+Y05saqBw4c3QpACKt/7vQVomcMBgAn
 e+JwlRfbAiYxJ5AnHHQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae6ad5d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RKMC9uL6Q2GlzZAgUaEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: h-v98E8IanWMZhOI881xw257mwcXkltk
X-Proofpoint-GUID: h-v98E8IanWMZhOI881xw257mwcXkltk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfX8Ocr+IgEWMEY
 6wzfY+jatqo0/46HAJCcK0lAluLsZt6E3KVSP+xlhILDF6M2SDlbX2N76wn+glZXObBqxVbepFw
 xMxe+6aI5IAs+lboKld1Zb9A4l8E6d4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010012

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
to register the same device name. With ADC_TM channels on more than
one PMIC, the second instance to probe fails:

  sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
  ...
  auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
  qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device

The ADC probe then fails as a whole, so that PMIC loses both its IIO
channels and its thermal zones. This shows up on Nord, which has
thermistor channels on two PMAU0102 PMICs.

Each ADC instance already has a unique IIO device ID. Use it as the
auxiliary device id instead of allocating one from a separate driver-wide
IDA, which removes the custom ID allocation and release handling. The
ADC_TM driver matches on the device name only, so the instance number
does not affect binding.

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
This is the squashed version as requsted by Jonathan at:
https://lore.kernel.org/all/20261101020047.66034613@jic23-hlaptop/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..a23eb5c9096d 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -610,7 +610,7 @@ static void adc5_gen3_delete_aux(void *data)
 
 static void adc5_gen3_aux_device_release(struct device *dev) {}
 
-static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
+static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc, int id)
 {
 	struct tm5_aux_dev_wrapper *aux_device;
 	int i, ret, i_tm = 0;
@@ -620,6 +620,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 		return -ENOMEM;
 
 	aux_device->aux_dev.name = "adc5_tm_gen3";
+	aux_device->aux_dev.id = id;
 	aux_device->aux_dev.dev.parent = adc->dev;
 	aux_device->aux_dev.dev.release = adc5_gen3_aux_device_release;
 
@@ -799,7 +800,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 		return ret;
 
 	if (adc->n_tm_channels > 0) {
-		ret = adc5_gen3_add_aux_tm_device(adc);
+		ret = adc5_gen3_add_aux_tm_device(adc, iio_device_id(indio_dev));
 		if (ret)
 			dev_err_probe(dev, ret,
 				      "Failed to add auxiliary TM device\n");
-- 
2.43.0

