Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE054BEE39
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885510; cv=none; b=HUkMOEjUcrlHcUyutVHZ21OPGvRVh+zW1/8Kv7mn2Vl9DsZeVKBOBaWEX+98FholfeS5YzDBA2l0DKvX7iE2S/DsFta5jVJi75KaXMFU87Sv78bp+KjOjayG51K9jo0/Mq23MHNqtNIweQ9hjY0DpCv1ySLevGaoBdDDSUhVtFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885510; c=relaxed/simple;
	bh=2nd4EPjmP5Thck4Qs6pRTamguHQZC9cCn0nzKiIG47M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgE3scrybY0r/8qvOjmT+pSe0mQyxHS5wkLEtcGxH5pQ9JbLfVxd4pgfUWtHEQEepxzNtaKF+l0ie5BGGiqTWRDaT3addBntA3qluzgyHBeFDFKcHCP2okrQCJDPrdf4QSYCVqkrDL/yjKonvln2JzX+zmYPFjvB7ZTGuWE4iAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYMsEAHC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W44xzH6D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYMsEAHC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W44xzH6D"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YsEt3208375
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=; b=BYMsEAHCcWicA2IB
	hxBdA7dJpEQNC0n7xDLLbl7NE2S280nt1WJsVdjbjiBMwVcm7N7qSowOHArvHRNu
	0OCqHvZEoDnSz77pTtTqfNqiizOaPNLkYGlDBr37aZNCVj26mA/Eh3xIg0ouabPJ
	YQuAhFXk0mwvqD8Dc/q1kxtM2Zgjk5fllXr2cAqKCMSHhuGnZLLq+e9djw+1wKaE
	U5ekKzoSq/ccaYzTcs6t1u3s7GdPepkzrzDVty/1sbpXM0CKKWLMawO9ngcMRi/J
	1Fda+JH/qjVXg2k7I2K/LjYtZTxQD3pLDVhGOMiIfcCD7xwmC5KKsf8gWSDlkBMZ
	k0lQKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgtyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbacbb996so453911485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885507; x=1792490307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=;
        b=W44xzH6D5pEeOr+95nwXv8EgmMKZji1IPspifKiBbS3vgp0Ycdaj7r+w8p/lokZ0ag
         pJdcJbJcdw7B+b8JoRUXynMfexwZUKEaN8bVWBweIdg3jpv/oyUC994Wc3zhDTl7kDhK
         5KJj2dv0a7h1GcVadlHj3Rmt3c3nzZQp3ndGauwkfz5dGS/xFf4lXdF4uNMVBctqD0am
         cEHHME96f+V+rvJCj6k0sOtDbF0Qy9PNpZHdLolamWCFYpoCUJUoMJpRb+n9CXAi8D6v
         yIsuGl+HZjF7oWNwryyTjkK8RaDYlDpqNGh4WApgDk6id5EMQ+ccCGtSuT912iFrANt1
         KtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885507; x=1792490307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=;
        b=hQDENvikUoxenOjOB4PXe7d+eAzCppfHNvp1NZTlkhaHCXC0wEECIfPseUB1QmXCWe
         8Ex7W4cRhMnviUY3EWJyfwLzlD4Zbls+s28hL8+qkxJ7P/99v2ojrzEwLNlQOy/HKoGB
         njQHwDMruN8X3YSmGDyiQo2JtoRIAJCxJwg1IPCnzH9ICC1JGoJY6KJs3MGbRrdx/Htb
         A7Z0JvMW+mnWtxA30/0+xxJOOoPN8S0DQAySluKytxtIt5FYqTr2+Nf+XRhrpqAXnygo
         vUO8s89oppxTBRiPcPQeT7yRHtIWOdSt0KRnsGR9qozX7zdiSWfDNE/FqjrRLegInD3D
         oK7w==
X-Forwarded-Encrypted: i=1; AKwUvBzELNIJkFg3rMnH73/shkluQgeehvGANx1hnAsvR4fpXr1g50XJvu8UnJrIru0aTPuknD8XN6kjr6mPRSsI@vger.kernel.org
X-Gm-Message-State: AFq9FYKz5jSrXvsbcMKygBL7cwpe79saGYXhmKRXkI19e8n/vT6EtsKQ
	u1jMot6TPwBAIXO3glI9rzAVk7V5a6YVlgBnzY5APr0kkFpfEdx3+Z4qJqaKGijt5lnA/MD3oCQ
	FZwliZwquQMxrVs8IucUlSo6MiwHFPqkCWTUYwx817xamgTMKMPKsy7NlC7yVAANO+PwP
X-Gm-Gg: AYBFou0zrjd2TiPiPxIx0N1Eb9kXSLbG4Y8arTAEpxO+JLVa6Qe/m2IoKKJ99EhU4Bt
	XMSWlLNCVXXBop3W81ZfCkioWc4Pk0S74crSQSFOX9L2mH5v6+3MStWVusQRrSxjiw7moZ1vk+j
	eETNiH/T/3OrfuSGtpPamlie1UmGYLDoXFanc/Pf19B6zbQMOBfAkyVwSaUDb5bewhirqwV0e86
	zHhVmQZHtBFp6/i1vn2uao4RgLB+ePQYAu4D5vj8KRjADFjQ6wUl0NWJxrCo9xD8FcvzqajZsKS
	jeKefs5k/lk5qTRVnZ13QK+rBu78Y/zlMZHp/1iVPohP2fPHe7U8DYnWWMOh72CYRjcIz+zCFwV
	I3f8XuqRs+KpRooWbFVL/TjfyrqGm
X-Received: by 2002:a05:620a:44cb:b0:93e:e5f3:7b6e with SMTP id af79cd13be357-93ee5f38b69mr855791385a.79.1791885507516;
        Tue, 13 Oct 2026 02:58:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:93e:e5f3:7b6e with SMTP id af79cd13be357-93ee5f38b69mr855786685a.79.1791885506845;
        Tue, 13 Oct 2026 02:58:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:39 +0200
Subject: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2nd4EPjmP5Thck4Qs6pRTamguHQZC9cCn0nzKiIG47M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCjsgSGKAcbR2tqeAj2xTZFeJ9Fi13XldMI6
 dDL/XwiM2+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AowAKCRAFnS7L/zaE
 w8zND/0ayJnr63lmfmN8N4rxT3vmnYWCFPxjF78PqCiLvTCv9aOhtNqf5fvlibCZamfgGl2Wh2g
 TIpKMrt/OdA8QJUOTCZwbvNuz2ECEuGvfD1gtZ7F2hrXNDtf/Hqdd0tpziq+zCUfjQI9CChJcNe
 JcOUhnRLT+O0ugnuLmWeS7oH5xhFN8G8pKXBQx8oAKp/kmc8qPkj6VWFM/ehGOnIl+Vp2I6U3kj
 t9MN0TZiVRcy3qQB+CDhNXKrFvX7t6PHLrRRBq2qX0+x5cMvnwNEbvRQFY49+BicPh3BlvPRne1
 1Pl7ULDtSdmHkfckkXfz6wvEPM+OJ/Ku8RiPlnfBsgYK/wIlVtpUH+Lyi9gnJMYlIVN4jIw84tJ
 CTg8Tfuv5BRwfI1yGtttnIKj4F9WQVNQa7f2alvmhN+8cL5/Sl8TlID/lOfYcjeT4aYicE+QPZ+
 Hzch9+IxHSNM7bAH7Nw0HJe2JOdRsVaExgnJnQBjDlJqqtuPKZb5pJcw97rnUJ6US2rTsXK3lEB
 wf/2Mt2xb20pIoPHedW/K5bWW+l2TIRyJEHhqgUHw4EI1zhy/0+0wHbaimzuyaiWB3/1Z2QDwAc
 CoVI5t8mwhISEHfcl7j/JVygbCs+5B3R+p60Dogmrz65ItId18SC/skioXrwyG5+8n4A5wn46Du
 WSsOrK6TPEiSchg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: icwW5QFZ3rAvTkZhJ7gZoWXd4Dp6IWlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX7A1lKv19FpZz
 55PkTZ1ZN/IdNT0YR4HNeP6H1dDodqD9AKp3S23Ev7dV3dc1LRIRDGKFukP8jDk5Vv5V2lnGDb/
 pzfYKajPv8dcQBrE2NrJm1CAUM35Hvu7Asy26zlEcaiujzpvdjLql0X90nTYrU5rTRwIOxfkmvG
 FKzt5tXfu/th2V4qxLOajX73OzvIzTzowjbMhE/+xHIy/KRTmuaMUitBbQ90S14eA27qag2VWxF
 5m83LyZgJqGx2z8LpuBxz2q2N2tqYdSDSG5Wtcek4DYI3Z3NfyrHskIRNJCLeUrcgSKfteq9jRB
 Ov97R4DMycGfeQwotlkCKYggw9f++km2tzCum3J7HEul1SPhYodDRSMA7kjeOV86IlIdOLSuZIk
 1qjBSC6/anXCPSGj4S0pWEXElHDJNlquIqJRzId/hmyA9tFu3YrDfr2Xkl6nO4Q3Ooq8zWvUB7s
 2DzV36v94959TnLZiSA==
X-Proofpoint-ORIG-GUID: icwW5QFZ3rAvTkZhJ7gZoWXd4Dp6IWlW
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace00c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX9P8hbbkzXQct
 vWBMIFfB0LVm9UOHADj3e0Ifj8k2opLDXNT62zzy4dDUkFqHBPp0Y4PxFUnHsLQaTk+gKCdAH0f
 H3szw7yOXHLJg5Ld7H2w+Hy3pMYskCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
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

