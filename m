Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF948F842
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045306; cv=none; b=MRspPtkejogfb5zmW7ow39Xr34p8hvRp6yQvN+0d/xP5cWCV/u0lYwRKdXmiXt1sIwrgosFXkobUID2D88XMDsmym9IbyOozX29727sE2j/JJS8lpOf+dlxHYtJW4sjIfkGFgiaGN9pcx/o2/NTiEici75y9FBSyrTRuq1CHnME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045306; c=relaxed/simple;
	bh=BresRinsDjLU7I8KbFnNfeg2un9NXgFjbMY4oSk9178=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etfZ2peTPfzFqjJ9YSR2zOkQiV6h0foYcZuEbqoB8fv6I6YfzZz++NZC3ardIosfXj48C7nMQOS2xIy1fF3OtrnYCudut4SV4tfYLtT6Q+PWYwsKftJ7f92HPp7AMnfO0UeaoNyMGfvqdxbBsvv2o9TktBipxs4PaBgr9XiQ3rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V97PFYxE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMmHnRxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V97PFYxE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMmHnRxA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7pZo869189
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaTek2Onfxdx39SUxr29UbGVlfItIqvvpD+sFEVufXI=; b=V97PFYxEKxj6ZhxF
	TBiIuFDJZl7WlCReqGQXXYA4oUoOLZnYRg7zejNzW/+sUD/Cvr0enXMqWo1WXe3p
	r63elQSI+NOympo564Om9QI5QyBFMz+w+jYsW7/FQmmtbQjH3GmKBhS6WIQ/LX9T
	05/g/g62Xupzc4VkRKw4E9VUlaK+sbC0AP4d9sehl/tNmnK7V+VOAlrejqcXLLGN
	VkQv0FrxUou9e1mmzlHREYaV+j6uSXRkxatiKNMN7HlR7wN5jjZ2RN3GxPd5CgtJ
	AatbE12bm1FG0JHsdmeI/2cYFUwC75caNK0gAYW/jvZCltqqPpFlJeKUNXNZ+OYf
	8HOUoA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd3vne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79013d05471so363233137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045300; x=1789650100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaTek2Onfxdx39SUxr29UbGVlfItIqvvpD+sFEVufXI=;
        b=fMmHnRxATM3yvsh1XOPIT/q/FFZXya/n+UpSlM9IHWWXEFDKdlzMhXDdlPxB1k6g82
         po3kwmcOmkzWM44wOGkfKmrerFqGulHbBaD9pKjUxb41xmbay+l4cDNxiJpG27hoDorm
         WJwbm7uoJCIM2xSGAL8XnuiYw9TsX0uL9iLiLQqDBwbtGPzWGIUfCVEKwdFEE6YtGlKP
         sGskP6d6iO+Hi5mh0JC008ynX8ilGDrKIAqncVnKjFgsZ/u/Ob9nR2JSkgM6/xjX/ik1
         7iO1ar4LXPmAigB9itqQ0y9UI/svUkzMQJP6SrEpis5ZzA7Gi3aOlqzHo7x9A68I3h6Q
         MfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045300; x=1789650100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaTek2Onfxdx39SUxr29UbGVlfItIqvvpD+sFEVufXI=;
        b=B5YCvLfjm02g+qZ6fVDO1bk7YROFP4VRNvvqV3BjwFXxt2ACJXw5QFDNNvw1wXF2zF
         2JWdZXqpeP2J0perLY7OJ0lXBOxJzqWYbaAZQC6QBSH0CgVWUMaDh7+hT9NSQrKIAaWO
         crBhDoxC40Ad2q5+AFiwzD8c5ZueOdzLB1EDByX3wrS//hchlSTA8/pE+6UPrnyOfxNj
         Hf1jXPIe+KUiWn9chP6v9+s0wRujjJKJ6S4DQ+rAbZLUH7dpi2e6lXGA5I9Eqw+i+ruf
         sfdywm5ofX3kjG4abekP8UW+a9cj0GW+bkwp/N/4TTg/ajsRuGcXqy1sGRp3C9nOsTXo
         m5gQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+OSebQ8LFIAhhuU7dEgSeEAwqhMSlojzex/H7tFb3ofe/OlXLUtcfw2YMKWlBYxdoO4Pd5cT5mv1M6xCY@vger.kernel.org
X-Gm-Message-State: AFuF++mfQlS6CrzE8NkgDgKr055/x5GCvu33DKi9VZdkLiMDN0cGrhER
	bVBlGR5iUICG9zgfIyliEqfc7GAcJlU/uSZvfSP8Fpe+SwDZ/LmEl+HXFdLdJ/deeBt+PUvn3Fk
	yG+881pJBEwyR9/6YsQkcFHO2suFUaDZVEMjj8rWmg3kp8/FDQC3WxSRmlGYNDTCWyTUVtdfZ5q
	sB
X-Gm-Gg: AYBFou1/RUarvyESJdNz4yCZ9YS6g7hv/Sgf0HmqYFnT8fZftbu42TYx5GwuiYCl9oO
	Bm3r90CtHwVluceVlhO/eaIDoYNofZuDLSKBohUD8VAdV79yqdWdhFfu022uIwkREix6NzAUml/
	lA/C6EHXb5BmZwO+4kDRc8+8r2zIWYpT6wwfsRFUyANCS9z9nJhMxwJ40Fm/bIg8pNJRiNFjwd3
	tkYYLGzoASbKwkHsnRCpmKa9j+M4QesbwsgVlJlH5M4yzlVf8CmS6XCxZDcs+9NDoTdxWSUU1BI
	rCBwJ6e/p6w/caJ4bOF9QWIxLFWplZVyCXbjtULhZLiaUnRJ3OHwkTlNbAiDwvnPqFoLGtqnzBl
	Kl76pvNgipbX9D7/xa9LFK7jSen32
X-Received: by 2002:a05:6102:e08:b0:789:100e:3d1b with SMTP id ada2fe7eead31-78f70e265acmr4187995137.0.1789045300362;
        Thu, 10 Sep 2026 06:01:40 -0700 (PDT)
X-Received: by 2002:a05:6102:e08:b0:789:100e:3d1b with SMTP id ada2fe7eead31-78f70e265acmr4187645137.0.1789045295027;
        Thu, 10 Sep 2026 06:01:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:50 +0200
Subject: [PATCH v7 09/12] crypto: qce - remove the BROKEN label
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-9-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BresRinsDjLU7I8KbFnNfeg2un9NXgFjbMY4oSk9178=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoSw1zAVU0Ymhsj/oLmPX2Tqm9nj03vEbH+x
 E0E+2e+i1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqEgAKCRAFnS7L/zaE
 w5QUD/4nPFFJn8rB+N4iV2FEfnliZc9W5qwW0KgaNwSEMeAmJnO4aUdqU42tR3YLXFrE7N3yWvi
 MfVZWprgceNoYtNxA/fSStmocMDGmD8SvhBgbw94ag5uhcAmu/IAg5ev6VTLyiGzN/Fks3Q8cYc
 jJwYX7tDOrBFYsIi0RlXHZfAQvkIgCCMnfKdWmHaJ0F5J8em6x+DMp2Dis8pqpjUCNCCrS563sz
 PaIOMO/NX10m2VOw/biB7uEPSSf4NIrA5r2smwm7g9xoiU6zCXtIqgT1rc8bj7lJLPDiTdZCgm0
 RKbSB9mFEP/K67rU9NwTLLdUPAYUYfhSxVxs++Ss6Vs49KHoeScZZse2fjq9ZDXL8irvwXU+EAu
 BFUb+s0akyKaJ/GVkGO2TJc2OoH3Rfmi8tY++3FmEbK73QyQNVSG7+GgQRLCiIPLf+B/Hp2jhbf
 0/G3gI1M2DV2amI3DcdFo/PP1bYYMIdVzngGE6+zGr/fpJayrfz6Q8jDf9tpOfES3hRcbTNFr05
 Fmb+CsgD13D67I8XZO8zMJ5gsvNgGt0Rs+Pki+VB5lvmmr0bwzXW64eSjIW9O/7UbejhJf2Lgm2
 IItUmBbEH5UT2HhXyabC8Nho18PJIUXU/Sxi2QYhspU4Sgh4o5xld9mszudQcwu1AiW6fL4kyVT
 1Ct+ijsjfIEcrDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: yBbm6TCrx5RwxrG_QlpuVq9FizHPsKfI
X-Proofpoint-ORIG-GUID: yBbm6TCrx5RwxrG_QlpuVq9FizHPsKfI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX1AmCNIZQEV+q
 kJv0qn2Vm3/eU4A5XtuA5g85zIbJpEMfWfyqlJv/Ro2kYa5O8YOiUtL3IynEwP1jNOoMjz1lSxV
 B2yBt6Cv63sVt8O4mlL7RtP6ceThzLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX0dBJFSgHpxJu
 zy6uh3LG7erAv7L8MZCogr8G1QHwnz41MDDoZ2JonzqJ1Xgu+TLSH3KJAcrTmQ1qJzkVr2bmJIK
 evsWWpwrkIk6Co/shUeu4Y5vjG+ZYvrmdrNCK6AQDPE+u1Zi5jYkN/rrmbHmhyJA00mLXTxvy1M
 0urV1a7bOj4/hFndWpfbj4nwCWohkailJRF/qICK/UI/XQCj8sORVNUJd2Z/2H9CByFSBq2ka1L
 A99T8zF7iZJ41yH9zGPbdKznoebfmM3mhPDlVQgzR4+Fq2JIk3Dyp28aooteS43vpzHiawfIq3t
 WZfIgMGdul72oCoAN4EeJzbRzhyvrBJXe2JvR2cVIGxITjSCUe03FlLJ1/hoX5SVoQPlB4MeITy
 Z+tsBz8sCo5ofyuEqGMDC7Zqt7o26g==
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2aa35 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0MPpsrD0zQiP_6dgn8YA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100156

All self-tests now pass. Remove the BROKEN label from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..9f6aa82301a5101d57b3651c9b2ba33213e41d3c 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -528,7 +528,7 @@ source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This driver supports Qualcomm crypto engine accelerator

-- 
2.47.3

