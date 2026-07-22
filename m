Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC446F492
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719646; cv=none; b=SvaYTZJkSzowuOoabr8GQhwgfiIC00vuGb8baGqGF6A4ZauVFU+iKnnL7sFwQkn91rZ91dh8e0bZxEShfat+PUSd9sYO0Nk892KKY30hpuU87PUnwFqOQScBWyvDr9qKxWOh6DKgG6CFkM+ZNKaREgDLGvn5Up/M7/5FPJtAQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719646; c=relaxed/simple;
	bh=kmkGsqLClKltGgmx2ZFGSlei16yqugauZtjl778tICE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W90zedzDBJGTVF7xQqGn8lmTT+COIeFo6iQ5IQjvlzUBAEj4myUAPc4V1Kph2jpDzq9XqKM4ERlIGV2M501Uj3iZg18jL1erPVi75D24vYHxgENIH47pYZdiGK4xSDK8k/SnMeaAvbzv2vQo4/qlyp2JypvOArrOeYhC7VOdLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtLGsSzB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GryaVWmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtLGsSzB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GryaVWmU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xACn401215
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5M1LRmAykOX0G96PBHdB913frohKOxohz72tFSL1lVU=; b=RtLGsSzBYtJlpR2C
	wNJFdYffjmolVgjmeWSiqF+rDJTYEqvKQtsDLArAMH/jsntJ+3z6NUgsu3/axWaA
	GHUj2vQTi/d71NsYpoDrb9vOejwkvwg8aDNZ0E8390tRVkbihbpHVf6N2xzwT42B
	P1I7VW2SgaCidc4aWr3m6KYJfNJ1jfpO/iFd7NF8Ep19qS01E2eVZSqi3sE7AOsy
	sk8ATHNAKgx7mtu8E2NmWKAKDfBAmGwaLf0DBUhDdUJjle+F3zxJYWUOIm0NrKEs
	p1eX06jH296WbM7/bTO9+uUGQDxICz6St+fD2YOdgmFpS9yvpMa6sBldjf/HooZF
	0NGLvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt798qtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:27:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so180622925ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784719640; x=1785324440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5M1LRmAykOX0G96PBHdB913frohKOxohz72tFSL1lVU=;
        b=GryaVWmUqIgOIPR1xYw6Cvp1vqNqSQpm6t7RWaGNZriFwm6RfPZvy3eTz3C81Vut0f
         4UF+2MhHhNkUa0khjBqDr5lCTI8KGRqLfLMrjME/WDOOe+g3lnYW6g9yieVgK9UFTbSt
         tLhCBS7sk7wtQDLPNGEGcXxG5G6aDHvQKQT4RMfnE/cVZ3o1vgwYZ45KFfC4XkJ7RhyR
         kyJCW5svQ7pI9sqMkJ7P3EL4EPQ57hRztpPuATcFjoDbBfa8Q1mEL1cBFR3dWqz7g33E
         dVV/45orfzb588WFasTjwHY+/9fm1ARMB8zzhzkJW3jDe/vRJaC14eFSlWwVMfN47RMS
         H50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719640; x=1785324440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5M1LRmAykOX0G96PBHdB913frohKOxohz72tFSL1lVU=;
        b=br9P/e6g1VPiVNiVd324BUJzVH6ZT6v3H/EDqlJbzCYkep3aGs4WwTSA6rWIQObtfw
         35w7zOZN+7oYa6N+Vq5Lkdw5q1mA9SUv5reIZqCjxNpH+ZQwBtV137gFPXD/5RBFETzN
         lSrwxtlRX/8aV7jzuO7pGDxvcgmoWqOziowouv9P372QwCtBz/bfz2FSV9uY2fiXM8tJ
         dmzq6LbuB4DZlbBdzBAHQCanw1dSNWDOca5QJdUnId+cn+GJ3qaYFMGpZPwPLSEhG26H
         btO9fxR6VvKOn2ap6BJpBgSqHE9K7wnebgUlUjuZv+hGyp0XN58tcqgjaNgDE8h/aXHy
         R3xQ==
X-Gm-Message-State: AOJu0Yx8WmiTDGcRZ/B8XtFhB4qLBoAnWNHKGlvtFR7LqYDLxVaUMkwx
	A96fQqke5/hZBH4QyTFh/b1lk7/gXMowfoKWTGFOQ5Izpokf4lWBGmaLSNnt9BS4XY+tVqt0X3J
	0CLF9JvHn/WDksx8PtSBpzM/5ojTURyiRWUnRXeTYCPnCg9KDQZ0MIu4jbcipEr3JSC6X
X-Gm-Gg: AR+sD1032MOEhZP+qpw3H2tAW8sp/HZqMze+xQ5uIx7VsY68NTh38gHXCGOcW+qvaNR
	hiSf4AKv7M5FT+6M79lfWFQPaq4nI7mrOTtggTIO2q/avqxBF80ZMjD32IgqB2p08RfQrVjqu9y
	nEGF2/ue6SVlQsbjObE0kSQjOb6pFOWBgCpxC0fnKr/ZhVgLXNGSETahe+Rc8hOpPN9fpLMERwj
	H3uQ0EtEJ4hbbv29jomOu3265Rq+igWkbHyQ972Vd8PDQcY5u/l5f6upXtlsg9cBlFvkc+if2QN
	UZMXAcLXYxnkCx+jZJxOqiGXZ1Q0Q9q+Q8+nwvra0jiRMy7tx4E+ovxGQjdocR/pqvdPv1uBc55
	RfL+d/9/P5qkpfHTpALk=
X-Received: by 2002:a17:903:1b6f:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2cf3481df5bmr259252685ad.9.1784719639907;
        Wed, 22 Jul 2026 04:27:19 -0700 (PDT)
X-Received: by 2002:a17:903:1b6f:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2cf3481df5bmr259252265ad.9.1784719639474;
        Wed, 22 Jul 2026 04:27:19 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e65f3sm13143995ad.45.2026.07.22.04.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:27:19 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:56:37 +0530
Subject: [PATCH v4 1/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-gen3_adc_tm-v4-1-011981f756c8@oss.qualcomm.com>
References: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
In-Reply-To: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Maxwell Doose <m32285159@gmail.com>,
        Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784719625; l=1235;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=kmkGsqLClKltGgmx2ZFGSlei16yqugauZtjl778tICE=;
 b=pUrAWjkvl6OeiuBC9hlzdFTTXKMvK7YjJQRMmcM/adHAc5PvrD+RWIO5SFKXzgV7XScvLjgk4
 LYh7y6QOF0eChmN8nEkRjkcfntzLNHrP6bz8kmzouKoQ+j9s/wuuALx
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60a918 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=kIsQgyr_JZXbD0ExW-kA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: L92w8_fbwZPp8I8rkLQZRCY3BIrQKV0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExMSBTYWx0ZWRfX+7RQ3NH6CZ99
 qCSyPKnU0BMxQs5Ij+9S1Gfoae/3CCs69h9/Fb1KBPRLovEkwzNxpThDYhydNWyfpetu78J2KoJ
 RDYCY3rUoQZFIJZ9gGRSnUF5T9R8UNPejlMQjoXcdR75pukv+5fylFwlvaAWR44nfOTMS7E0adx
 mlk8AkkAfS0cUDDRXS9USQJgPspz4mk9bNUFfuDfE+wJ6xuRi2gyJ69uvnxSB9FXKnZnRou6hFD
 sv8eAYA1Tbf3WSujLDHCd0XnfoPIAVXYdx8leoBrweKXnuoPQ8zFzml4s5EJcOULbxCYTgxQlnr
 cPHT4QgsvoBWb/6uQr7Q6VFdjqp+VzYCrHzA55RG3/eo86WTi2TRMjHEJizoIhIzB2pBpHxVQF5
 UhiMSNhVKmnzvQ1bNqsxPBSka6SCnq0Ggxqql4tiTMvHsLu63IShberobSesSqo24uThuJkGtwm
 f/GFg1IsRAFs/kxYmeA==
X-Proofpoint-GUID: L92w8_fbwZPp8I8rkLQZRCY3BIrQKV0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExMSBTYWx0ZWRfXxX80K9nKMi1u
 IarR/803FvKB5TlOo1772ETrz1XMtERbS/Y97I2OQg0Rizjz1Pnh4EUwmoadfMN2K00/2pAEkK2
 64HuFJgtQ11eyEt6Ik6Zsgxum2U/0OY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220111

devm_request_threaded_irq() internally prints an error message using
dev_err_probe() in case of any errors. Remove the error print in the
devm_request_threaded_irq() failure path as it is not needed.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Maxwell Doose <m32285159@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c56b650fd8c0..2eaebf6b34e8 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -821,9 +821,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 			       adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
 			       adc);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to request SDAM%d irq\n",
-				     ADC5_GEN3_VADC_SDAM);
+		return ret;
 
 	ret = adc5_get_fw_data(adc);
 	if (ret)

-- 
2.43.0

