Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330C54DAC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081895; cv=none; b=Fye8I8kXPHjrurVSp2OvwmFyI6TSdoT3Iu+U4g+6OcIdP92NT2U6p8RHfSKZCwZ3srI06BKJUHtbbPuBLQTuIby1fFTEQ7bVtguEY7x0gQEDZwSRvvnMSHGzw96+en+UtRfxFqaqBmSSMZOyHM5tW5grbvCU+lrIvkqpTayrOT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081895; c=relaxed/simple;
	bh=fY87isequqGi2vPc14TLa0uhOXluPBKFeKDCz57mcWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BTSu1lNRrKmhKOQ07edwp5OZctpOyn9R2Hc17TwepPQtXTad/s7WEIvRK0jhReo/zLe4yDDgEXZrqXQ7SPZTa7+4tKH7F7pWNY/V2TnygBk965+304pMeiRm8baad4dVk5+n6Oz7tz7d+2iMk1sOf88oiujr7cMkOxtZHeN2ZWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jnu3QQB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJXrNkDJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jnu3QQB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJXrNkDJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPgh63487744
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=; b=Jnu3QQB8IPRGxFfM
	tJ6Av1ELS5xfKXzgEbIwMvlCSIb3Bq4dNkpx6iqYSP/A873wCvHRBezKTF94026H
	JfMpeak+lgmxYru92EmceSA4IR1Ooa1BA02TqTmEo4m+M1D6xAb7W5vH2VpOMMf4
	Ir608TsKahqUo7Y8FRc9mLey1UFdYgjKcMEz8gpIECkT+o/qDqz4/rGyNEdx5d4C
	XKf4rDiYca9KlMZeaG2AALrvHGeqgMxg3X9M7M40BMrfYqM40u2ESN1reL35el8u
	h9Odhe4BhtIiz+T00LS0MMfwBN+i/73HKnzWhU1a74RvzmVdWOpu0R/cJLDE3Js7
	+Q1eSw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jygk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:58:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82c79466cso5233382e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081890; x=1790686690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=;
        b=bJXrNkDJzSbOWrG/WCBV5+Oa1RB8ZU92RfUrwYknG2jCfv1J7upyfC8X9ULqS/nhNQ
         5MUlW6oSy5a7LwrKaiUpznyeoqnfqWdOchjfQ3QA+zX48wedB3uHx4dKhFOfZW313pnv
         cPNBdwRffGOhEYEbp41TzWjc6TChOCOdtvJporFE1iwTgcrougZ1mA7Ghb/7PXIr6Zfg
         NQbWcqofzJdkiBO4Q1HbOko6wzYoSefUrP2qykEJFQvQLY39Kq+UpJ/nBrLWhRk3Fr/R
         lBxYBEUTn99NA+/DSZioCYWjxR824Tpd8GBqEh77CiIGDfRtk6hj/AOxksUN9fFd/2p1
         JykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081890; x=1790686690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=;
        b=MwZUtyuY+UqSk+8ozOZElXp0EQbsic5GZULaAkxKFaxQVU0npEBX5azhDv2sKFfnWf
         1pJLSD76PH6HCo1BcfAYjewBV6PapN66wtP02AicEoA69Tp+slyzr7uLVCPO7X6WAh9z
         ZALoySVcalDB/haCbxR9Y8rT2ZqO2Gi4jS+vKesZ1zczzLeKUp9b17dK5n2QUc3TSbl8
         wPd9VWBNS/2fW6zPVtHL2b7PGQLje4S1bsKkXjWKiJpniIf8tNMA9P+2025gKQBxdT+C
         ibrtvMsWNlKahToW4tiNdmn1MbYWAAURZOgvm7BKZA0Hxcb2Ryg5cQyifz89mW5CVmU5
         jorw==
X-Forwarded-Encrypted: i=1; AKwUvByHZ5wETuMkxDr8/Kq99EU9U84oTsGHB0Z/pag/+FCRJLGxOopuk9o2k4sdHiJcM0RJstiD5S/JOUZmFnLt@vger.kernel.org
X-Gm-Message-State: AFuF++lrVYAm3BkagJVhK1l1jELRqCOsCP+S4ohqLAY2a0uo/eSf8IeH
	e6716fwSvMW0/S5Dk9uo7EI6z7Ki0vP2rsSxvxakRWSkY3RoYShMKgxBikcFK2H9sa5JUbRajLx
	mencp3Utg0eip8lVFb1V2xWyxQIa7xV8VD//XfyLy/6lB6os0Pe16k8cS/g/nx2x9p17L
X-Gm-Gg: AYBFou1w89hOutSFZtD692ueclweKKC5HeMpAUkwi8Wg58kUHoyKGI4wNqO4xajtz33
	gdzDLxT1VevX3wZP6QrQ2nugJz+YhTksAXjfLebwxhgpNno25DvKIbEMYQA6AdOs4irfbsA65fS
	Kzc5zaoujAj+SN6MZOpQYHVYlphT1G1a+lFk8jK/Zwpnwx/wkBH5Rnx3c+cxUBPltIVnJ9NG4pW
	yF5xbrAGYq/zpbVMqmKupOiT8C+aAq/2xl0cDqesJ5fuEiUlYOVCpdQT9PUTFkfP5KlAKVUuQtS
	9uX3gJ6xSoInD9du59ihNdBTK+8FdEPgK90pLfraoDhu8KQgTPh/5S4EbIQwzj3/cwPKk3Jz2dT
	qJtpdE4Zdqxb9G6/Eo7mgzLdjE84=
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr8394466e0c.6.1790081890363;
        Tue, 22 Sep 2026 05:58:10 -0700 (PDT)
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr8394408e0c.6.1790081889914;
        Tue, 22 Sep 2026 05:58:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:25 +0200
Subject: [PATCH v9 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-10-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fY87isequqGi2vPc14TLa0uhOXluPBKFeKDCz57mcWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns/UZaT9h/s9Gz6OgARZ9rzxMS3ZQgZpCzKJ
 nnFi47SzJCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PwAKCRAFnS7L/zaE
 w7j8EAC8IgQUzRusHQCor89biXLZV6riqEpya1oT3nHoywVTkIzWNMVa2TgdT3hX1JjSlLR4MbI
 YVQNujKDgZV2UoAkZzeQpm9dh0row0mW5SQuUZkaG5N54xR41VB969wvJaF1G2cfXAVCUa99UAc
 uhJJ1l6epPuUUAXQMylCIA30yqhBFWYre3FYHj+YURx0Gbf9x9yEnm+1tuwStNkc6piZEmLHogw
 VvnqttPj+07kyCTzTNA2+YSyOsLX5IqOxyk24BdLHXCwEBCrNDySCunebNQHRIMVs2fXe2vpZla
 Z04tjzFEyI34eopJ387OJhAMAFi5ATjiaEwSHIlX5Z+JUO7U7uQdcAtc0Eoe3ZaYPLtZUFX5CAv
 RbRcTqU1VHH05QX2XUq0ZHH1zcpGu6m5ILm2eNiK8rG7uqvPcR3M+kLdasd1mk/+dK4wKit70jx
 cFUjTh0TsuLoMmCQfL4FawROIHMxwh4DXLx3Hfvp4M/r6Xoyo+kDoT0ejcujTMk153FAg4adgKC
 lN44tH60s5gx9JoAxBM2C8Ux6IzAd5dp4WvS78w4ZaQZu2qEXnkB9bpC8ZedIHuDSZnXh6i43xZ
 0psjvcj48SOQT20dvEV3YFhSNKmeLh5/FVCMLzFoOnV7w8V7rYkKrlhGa9cTuc1gXQkXoml+HCc
 7nnehYVdqWTXyEw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TAXDZPu8qURwB2sJvvmR_Ju0SwmkN8Rt
X-Proofpoint-GUID: TAXDZPu8qURwB2sJvvmR_Ju0SwmkN8Rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX0PcBvd88/wMV
 dlZSf2WA1c7mtfU/FdDP/YQcYP9kMA67Dz8FdVVqFEA4PWHzLY7gMO4/XFfPag+xh0jJTJTLDjm
 DIHhJoknnXlcwdQ4Va/BhY+JaGHJd17KbJrq5cOaxvQZF10RUhUnn3l+YhPurcHAhawsFgMqnQp
 EKsEiWTMzeCwbaaC+cA6sIc63o4IjPkNnANoOgY+Bt4ak1OMPLnmet8FiczHUpJhKNXq6bxGFvE
 1sGojbpEb79ZM2JScdpYPSiEgOY7mzkd97LJy5WHL6ql1Nwdnc2aW/6swaAKb82CI4xSGXQ0LCf
 qHnzjL6n2bfOzButlma+TWsvXFmwWnlcqO9fTJ+emQ3UcQnn4mSLNZfbD7MDtkLdFy5ETpUzDMN
 yihTL9ftGWAOERAwSFjHJ9Jw2KiKaWpRhGd38Algr68YYhbokZvHJ/tl7uKuac4in+U2rNqETKY
 nUVVNmaVCWxHMhEaCXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX8CP0lYpDiM89
 nB+bGtmSw6dyhbPRRnOUWbm1Q74HTA99oByAhzbOSISmowyB78L6ie90ElJkSbwJ8UFhtSOLDK+
 mGtH2wgqGPnJRXOzry+l4PMNrGMMpIk=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab27b63 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3

