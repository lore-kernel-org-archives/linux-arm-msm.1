Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166437;
	b=U/tWODr2fTxw6jkkzfCwKPJ6zWDOzSVjvu29xJFiq+ZSoKtQ22CTHX/xb8FrJQj63QND
	 +ejp0Tb3dtHK320F0Peshf8NOd9ocm6M0rBrHVtblERr3NqkMscnOqo5GpQG4yD+ImC6J
	 WJfJ4GdcO5dJjK3m3l4/eKGnTVQr/3IN//SvY2/j0S/PylQvgrDECafRYfn9YpLsfJ9jV
	 KpV8daWu986POuafCH0Dh7m+OM8rLK56NZzPHDwZLh+72AHUk7b6DnURfWVSOcxIglBQ/
	 exMGebRx0OBd6/tA5woqo8u0kgAMkpV0XAekjD5z6F4KZbf/X56JoSsJfFMDTgj+wqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
	b=Urowd6g8XORwtpFFB/74XJ2hi4g3T7HL8kS/mHx1dPr8zrkNHkyygvOIGU1zURaAOhf5
	 cqhScz+56zODYjKzfF7lifMQVTYq8nD2yBiBaD2nX4SNCbEynTKqExQR1KwVlg7A4w0F3
	 AJCSUJtGJ6LbQSF8QnY4afgdQre6pHjGjHhfMiLQ85rVt92wWfGgeUPMB+CrE2WjaCAFV
	 HctgjQ1uZaR5GuUbGMku80BCsQ8Rf022Wb8cPWXfjImaFa5kUCcQLPXiH5MX7AO9C377n
	 Lc8Rzp1NqK3wdHHid+KyFPKj9c0P105aXprYX8SPyLiUYYsaXJGGI3JIcLukcVkF/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxzCL4+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDA4mbaA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D03606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D03606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxzCL4+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDA4mbaA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9Aiao849345
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=; b=WxzCL4+vHkMZN1nK
	IpHOYxmmWVnEJ1NemOahvFUnVyhLBkfZ7RWwbIyO+pif/cy8xVw/yRiwT7KRWJGs
	sbo9lkSjIeN7eEiypwN7f0wQHTjr4TIO0Ybv26FDvPaTx77f85m76x1L9o8eXD7n
	exX9RTZTTXxCyPpHhb0S6aftGtXK8uzJMUnICfvHJnjX4e97wREqI/0lWzFwTcZc
	kr7ZxE5R5dnlq8pOEkxUy87A29ueKsdFB4JufOunLfi1DUDWQpEe0KZMmKGbucDn
	Vj3ol8fV704BWLW9HW2fAH9pBFMaNA/rQujoiBbCQ6Qv1+PMa+fm9ifgztZ70s+7
	jobyFg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjwx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so738471b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166434; x=1795771234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
        b=NDA4mbaAHTplyBEbOeZF18QsQIGVplHyuDVN1ypPWi3+KJqJ6f+djltFAQwWy3DWoa
         bgVBubI/Uq8U6qzAntqDk1CyJRdAbKiYhnocpbl+Vws4Lm3WkaLvsqqJlMwuL6fC1YSX
         4qs2UqDT9Sr161RxQWnEWhpvGKWU0/hMLx2+BbyeKWBqkvqKa/W4YRv4L8KC9BN0s+qN
         nCI3iy4mQkKSDgqaxWvyC7N121RcWGdZp/7Ogt36LzSzAmdLamxpJt/O1MW4pvds/W0i
         gCZ/31i1rV5szC9ZZA8SuqaD7Y+UVOR2XWqxkmHW1ihobQU22i2CHXKkUishFSUuw/BD
         qfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166434; x=1795771234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
        b=ntlEd90B42nn/CvOl9DesMg/wTwoCuzDh30HjEVdJ+8V6iz2d2zGU518m2mI1kTv9U
         LG2braDianIwRclbj80DM2OOdHj9R+uaADBU0L1ChDl0q/kFQW8/kNL6hdSPLF8NMIjC
         vlhtLFKfVd2HlFUjZ7xbjygs4hOfSM74wXkxZ7PO3891dskOCrThIfUcSpE6qW7DhTSp
         BUv03JFJ+S9C1mxjbvfS3cdIx7hailMx2A7vdWsIzCyyidv0nx49xTJ9KPMUfwhgMSW8
         DTOvMqNLEj34yMSkfhLC1A9W8lVenCZ4bMMiIXYY0Bd9iRKPb2zOQJrj/cUmJBWO2c2/
         UgUA==
X-Forwarded-Encrypted: i=1; AL+hErF+PgQFFXGrOysj4yqcxVHZZaPKuNgnHApYDm+0qMJRzYRy1uUIprM9x59wk+4d8Vmc3aJMgBGKRE1jh8B0@vger.kernel.org
X-Gm-Message-State: APuU4Z9MDc7+97BEt5CELM2c9s7LAG8pgceZ4M6vpWRIsv/L3QbpJhhw
	24KPQ4+p+4PAb4w9rdKqWWIgVs33ihQZz15vQfxyae4DhQBRqucvgjvN6vR+vf/oA1zFw/SJc8n
	MKVS8a7S85nEkVNg9DVdlgKFNpTQGZXzwsdXh6QN+6HUm/wUyj8Ye32S5jYfmzs1r7y/w
X-Gm-Gg: AZFdTZdi3zI/SFGrFeHc1rntIe1yM8JpViNJcU58JPSRdn4YYbG/zxr+EpyyJFedexE
	5o3NhlUClS9JRKCpswQnwc/IBJHJbSgLb//QyIrkml5PtvPVr/eq33WR9g1YP0p9IAuwnuI3wXk
	h/SppHm/zOO/3qDuduEj8+oE5zUg1Qvo/UlXXYcE6tTJbKslgNAMnE8VrtzW9zxjAwcOwvgOqmD
	RVfRDHceYaaNKNLjLExl5WRTiyD9UhlW1RzFSMDsG4nCzFydSiOaMboMme0IOipbB/6wVzc+jMg
	sS2Y6TI7NTtYResfu20AqG2nmq7ILIyOjH2Xserrfbdm6xYcLgRNAp6AEk7DV5Ca2aBDBPrbOec
	CK78KC2+144I5QCVtXhwo9tKL7caPpWPr923JX7XvEew5pISA/AaNS9nAwm8y99qJeDZV
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr2207884b3a.31.1795166434543;
        Fri, 20 Nov 2026 01:20:34 -0800 (PST)
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr2207839b3a.31.1795166433996;
        Fri, 20 Nov 2026 01:20:33 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:33 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:42 +0530
Subject: [PATCH v2 2/7] iio: adc: qcom-adc5-gen3: Explicitly assign enum
 values used in hardware
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
Message-Id: <20261120-pmic5_gen4_adc-v2-2-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1103;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=OeUK1LlAVHR+3dWtPipLhOdiDli8ETGZqQ9NaC67ymE=;
 b=UOC7miGD6bJJXRuGg4fOcSL+CHhXt7dJhjl2cezWjwXwuEqSS6IRwc0GFCp1Tj67Te/sgWv6F
 tZucRdomXcAA4AttWYp1wBRsrfzAzd9bE0L0BwpFtDjewNuqKZ39Eqy
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfXwRVC0QNqFFYF
 ewhPAjHXDfRelayManpP6sbiU+TEmThPohkbQ4DhMAjrNlTzs+UOLosDmcdVm7LEwxdSizjwdDH
 jWU805DOf/dUEZO19ZmLSUlp6/9S87g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfXw41ChqYV74Us
 MQUdX1NjiStpjTL7DDheQ7OCcX1onU0UC9539gpNJm9/sBnqGjLqJb/utysqoQ3Ob+KP9YLMICY
 LUTg1jart6WXpbZyV37SwYVOFjCDpz7sNipPce1LYkqYw2KkNS7qa66OgtMk+Oe9pAxwWNXTt5j
 /oqTc2kB/YFHHjYMuWTKgg0DKnbQe7ehvPQeJOMKj0QMG2s0K51LMsXFLuplcnql1NsDgNftTf9
 aJiJAL+1fqsKdMVf0o/7dT78VUl6MuTPl2YLL4Q6qQWyMUPlvzixP8Y/btLGyS6qwKt3edDJ5Rs
 N1g2O4LXjQCy/yFhgT2nwNWF1L6n/k9q4LWHBW3QUSbdRlGIW8TSltgcrvfdsMrlYifshcdJrHQ
 1PM1VGKLOEQpFfNUNGPCTZ/p/SiYWs5VBLotPef3sr3QoCx6o9RPQaDRklgMaitQ1EF9ORAnFk9
 QplRkkd/CbiS0MpnIsQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0010e3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=se6siFrRNr6BEeX4t94A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Uzkne_j82ZxlSZqLMzV-aT68BFqg6LSt
X-Proofpoint-GUID: Uzkne_j82ZxlSZqLMzV-aT68BFqg6LSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

Give explicit assignments for enum values meant to be written into hardware
registers to avoid errors due to later additions in the middle of the
enums.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index b3e2c2f50e8f..ec7238e93396 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -104,16 +104,16 @@
 
 enum adc5_cal_method {
 	ADC5_NO_CAL = 0,
-	ADC5_RATIOMETRIC_CAL,
-	ADC5_ABSOLUTE_CAL,
+	ADC5_RATIOMETRIC_CAL = 1,
+	ADC5_ABSOLUTE_CAL = 2,
 };
 
 enum adc5_time_select {
 	MEAS_INT_DISABLE = 0,
-	MEAS_INT_IMMEDIATE,
-	MEAS_INT_50MS,
-	MEAS_INT_100MS,
-	MEAS_INT_1S,
+	MEAS_INT_IMMEDIATE = 1,
+	MEAS_INT_50MS = 2,
+	MEAS_INT_100MS = 3,
+	MEAS_INT_1S = 4,
 	MEAS_INT_NONE,
 };
 

-- 
2.43.0

