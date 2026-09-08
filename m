Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9383E51FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856122; cv=none; b=SsI2rSQvHZhIkkZsT8Ss/YaQl4iZSsXK0WbMmYSGVHDlqfSfYq5j1q92Pljl47UHCR/u9nt+0YUtJNk/3J9r3H/iu4CO9pfvobk7Ve+9KwNS6b+dbNUiTlv0AAZfMbfAh2kZVO1Mf3AR4gDWJ/xqTlSQAPVVr04l4PRNixZBNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856122; c=relaxed/simple;
	bh=/c4NFy4mbqgcTubVGDjrm/L6/KR3/OhBlimCDlvlQro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoK7NeNxBjz+6zxy69tBAfyz0ndA+nXWcGLL/ErS0omHpz9rEnFQ3X1cn93ynsOg+5jOiQDfTyx3HFfmqCR5XSIsbFI4W2uoNRky1LCrYyrEP/L8gtcvpyZhgA8POJepg0dOCSjoin8k5iyXfW3xAt7DceS8Xuae8S1Q0e/LJUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er8OCECr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BID3uF9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er8OCECr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BID3uF9Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LmDQ2502326
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UTCiQoU464h
	tRcfb9JVhf0FdQsMAlBERFwecvyCAnaI=; b=Er8OCECrtI7kIrpa0dzH28R5A+y
	MeNFcIbAqY3h/yV8hdCACo/72q+jmpR1MU0snJ1/BcX1vDxUB/rmhHy0hOg9WjRb
	UUpQrhJH3pjL9JBMbhI7JCYxvgTnMFJruiYcep+wYeUlDLJZPM9QhNUyVRGdVXfM
	pgsGIlteR/0I9+23QUnBBgSJIWHTPbBkCARkMn24BjgfROVsJnFR7cGxiJWS+DK+
	C8uTGnsny3+m7YrUkUV54nOFi1snMvJNB5PziODKnaj+3oO/fHMoFy/CjX9GXzCA
	QZq4yw/TAjTQhOV59fBbKJHCsNioPd4Gd0yI33rI4xAZIH/El88LUr0rc8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7gjff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:28:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb2a46cb5so97795901cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856113; x=1789460913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTCiQoU464htRcfb9JVhf0FdQsMAlBERFwecvyCAnaI=;
        b=BID3uF9Z3DgDKmwlB0w3t6I74C5o1uRWR0FRx/QFFjzF4AyIeHRZOx7Hvf9o5ku2r+
         pMU6iiAPGiLxcJ24pZUc1U7lVxI6518os7kFlgYt4dcJca3vjOx6J8NpKh6DMJUPCbXJ
         Kx8CcqNmWq/96rn3eSTFmSxD3SLaR7nJ8WD+eLlHnfQ025JtGoRKZbYT3lW4zllcFUH2
         5+U4XcUM7+lnG/eZJ9oX686apeFADTxvQD7iEju7Lytv1TALAKmhW+3daZnZjLvcisxA
         wJFaHCwnGgd5Pn2co3YfSWn81Q06NcyXbk2T6r0NJx6tXgj2dWrDoNQdRxTQzjJUuxtJ
         yANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856113; x=1789460913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UTCiQoU464htRcfb9JVhf0FdQsMAlBERFwecvyCAnaI=;
        b=MG8kBmvub2C45sCzGc/txiGnHKV55a++3I6zkMaQYVctmiEoWQsKfsMxNeFAerfZbe
         Cs+hwt9K53VFsE/FvEDpH5ZJbPXb8tmG+LM8FnDdXQ3RyZ9KuwDC5juB+B53QUo2pybI
         eTo7APEkIb1So3LV7Cf1WNHdrnXHSaIVXB5ymo+OGiZTfrZ2Ub+vF6r5gifztl0CAwng
         iuOfDwXD+grGUXmpov/VsOSy9HpEPpkgAsF/m+DqWXpX/MOqaYVUXgLpw6fgQ6rT7o7G
         NVxRSGe9Zmq3C+eb+n4upP4wRkmKSZls4sKBeflf0yvpSBi5DXN5uc8NN+bNlGnapBmX
         a+Rw==
X-Forwarded-Encrypted: i=1; AKwUvBx4al7CeV+ewV4jbvow7Aft4MT4W7a4TMUrhJB+6YguAs6xlmrFcf6Ds/AqmeyuMo0qM/zvUMv6MZVwu8gn@vger.kernel.org
X-Gm-Message-State: AFuF++kp84ZEMSdowTBl4jc2LMpUY6DUEOS8s/+AdHFyepn4Uq8qRIpK
	wn9qWYArro8A1GduUB4/4712/uhfe6iiNJ1cfQa/yXKvlUX1bo4vzMhXmynmgtzBC0CC3mcpDRd
	hqtzJnY3bEQHvlUsPiTzzpGYxUKdlK9pYH08kZeL2Q3k78bHGztEBq69lGEMCRa0/CrcW
X-Gm-Gg: AYBFou056WKLPlVMCopTCmN6pEsefskuASgzUU/4yk47Y79Z1ySMRQD5lVWjfekknCE
	8qSCcoJxU0AqjItwoNlFdC/fzkKiDedIDbT16Mri8tgxfDmsJXmb+vtLyKeR+Lim3m2rsk0jM83
	kuBMORfCwfHBXESM5QcfD9f9JN3RwjnjOwWXt9QeNCEM3eYbGBgoHUMstxG/wkKD5zyPuHR+IUV
	DyXwP5cxy7Q6aai82GJhzsDXHPeRp7l5v3Nd4+7lFTgK/eAAkIsNk33j1x75HA6cWWoF82Uu9No
	ryartSAKvQ7jnYlD5VyjDbTVLpn9aKFElnXJh2OYjbX+rV+MDcw7WqAN6wW/939kM4YEx0VGz6f
	ZPWjHryw5NHm2HQ==
X-Received: by 2002:a05:622a:153:b0:527:7813:a439 with SMTP id d75a77b69052e-53054982b53mr329351611cf.27.1788856113586;
        Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
X-Received: by 2002:a05:622a:153:b0:527:7813:a439 with SMTP id d75a77b69052e-53054982b53mr329351381cf.27.1788856113183;
        Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/6] ASoC: codecs: lpass-{rx,wsa}-macro: sort reg_defaults before regmap init
Date: Tue,  8 Sep 2026 09:28:02 +0100
Message-ID: <20260908082806.648797-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fc737 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EQvkBjYcCjhqL2gfLRsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX58mzn/q1eQPT
 pYQQ3tSIQQ//vcw9PnZKj9cTgxqnxp1SKZPBdmPU8ClrjLCkXzKro0YVm85eKK+GZBNz/c5kezU
 10HI2VpErsp+DmHu26VxWM/EKU82Svg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXyTzWKs04KGNf
 /4lbroNpa5xIFeuTG8s2Jb5UaMoi30tdlUZAvAY1lBNrSSEDqGDaPJdwjJNGT93QUdJAJpzjKDH
 uX6f4wyN2jKi8C+t4MqujxelTQThzQLqgLDcZbvyECuSuRyM9S4eeY8BYw94k1Mj4lLrrDRQLn1
 4t8hdAY1UxJtEEqfbc/v99AFJMV2iz8+NkhmXpK4OpEmvPsvtjnAQiK0KMNWK4VfSMSxxYP46GX
 EYt8w7d5n4bcPPjl0HcyYWLxFAhg0Z8vFAGIott2AbPbAj3R+RstYzGwZu4bYWzKcwPwBd44J4W
 iNyqXA9c+W6qG8Y8ijdgKss0uc1fHpR418mM0JTC1foSVJvDAZKvmyLu6MREoBCqTkrHW9HiW8H
 ChnvgtSpnY3QKhX5bI/a5Y1d8+nr4ECCaIG1Nz8UI6+rMZAYRQ/iwsNSqlF6NkjGhghOidpkzlZ
 L9IyieoZLD7+yI5nbcg==
X-Proofpoint-ORIG-GUID: rKXjQwDeaos4fVAfWfE1xVwKHgY1P8AK
X-Proofpoint-GUID: rKXjQwDeaos4fVAfWfE1xVwKHgY1P8AK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

Both drivers build the reg_defaults array by concatenating a base
table with a codec-version-specific one; the resulting array is not in
register-address order because the version-specific ranges overlap the
base range.  Regmap detects this and prints

  wsa_macro 6c90000.codec: Driver needs fixing: Unsorted reg_defaults,
                           sorting the copy
  rx_macro 6a70000.codec:  Driver needs fixing: Unsorted reg_defaults,
                           sorting the copy

then sorts its own copy at runtime.  Call regcache_sort_defaults() on
the concatenated array before handing it to regmap so the warning goes
away and regmap does not have to sort a second time.  Keeping the
base/version-specific split is deliberate for readability, so a static
reorder is not appropriate here.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c  | 2 ++
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index cac0451f8139..4dac376927bb 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3855,6 +3855,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	regcache_sort_defaults(reg_defaults, def_count);
+
 	struct regmap_config *reg_config __free(kfree) = kmemdup(&rx_regmap_config,
 								 sizeof(*reg_config),
 								 GFP_KERNEL);
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7a2b0cf9398a..4d7e7e30f460 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2763,6 +2763,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	regcache_sort_defaults(reg_defaults, def_count);
+
 	struct regmap_config *reg_config __free(kfree) = kmemdup(&wsa_regmap_config,
 								 sizeof(*reg_config),
 								 GFP_KERNEL);
-- 
2.53.0

