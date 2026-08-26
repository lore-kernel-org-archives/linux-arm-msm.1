Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877123F54A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737953; cv=none; b=iozeis1qiq1mvxlnpmbj2/jqKTZyg57ufCjd7+RdSbMKfuUkuWZRmGQLF+2lrlxyNdmxMzLhBgnUiA2dENpMLWtdf9P5dNah1isEtIA/Hia1XRu9rk07qtBmOUEo1riq+ghMtdlmU8Ne/C1lpibKeIe2okgWFgio9ksXFxp6zTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737953; c=relaxed/simple;
	bh=adkMKR1iXVx+DwmZ3065YpyXhuugVWY0+cU+LJwva4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IqnDFZ+7a7pxyZJE4iSs0Bkn76k+FDCVqP30R4j4CMnfDm2lSPfywjdcvaMlF17OxEWoaaSJZMDY8Ff1Co2YY0OP8eBUMyQcLC8Oj0DOqOllCODIETwJkPlkFGbHphtPqLePpq6VpUtC0tcCtutNWvi7Yq4W0+8ZxePPdZS3pDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3cRx8Hn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWya9nvm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3cRx8Hn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWya9nvm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CWAG3502057
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rb0nIYYamBu
	gMkUBgoIqbypSuVTrhDhDqU1MT4y2vJo=; b=D3cRx8HniHZnBJj9V9jZT/zl9zl
	0tWvrA41ZOzraB1SrDgT0nPg87/3EUgP0vWISGbdJHIsndFqyyZUQRnhpCtChHaI
	8pwE5ZJdw4NtCvHDlUHixS33rz2wn+sh1Wyh2v+wW9Ik/dciTiC+iH4Z/RfBLJzY
	HN7qo0sa8BUDB0Fze8PhWsScMfQpH824LOho2/fYJeq4tHOWrVTeiClRFTnp5DSx
	29QG02pDi+SNvsLdr+WRQQZNFB72z8o6DOs+ZCwtt7Wfv96uhF450xf5jz8+YRie
	rvaBaJ8w5jwsHG3gafJZxmC+teBLNVrLz5NmG3gcXsniatEH5yejwCmUphg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrj0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1653602a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737950; x=1788342750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rb0nIYYamBugMkUBgoIqbypSuVTrhDhDqU1MT4y2vJo=;
        b=TWya9nvmJgB1G4G0T2fqMQOF5HqHPlbhegH0+4UHVdYGSnVM9nMlfcHgnr1KjUbSP7
         aSrNXhnBe4szKa2E14cdn5p1X7MSn0NcTqqsG7Md337Hh+GQxkiRrU99Pa2oPahbIOnJ
         vu+UmpbCzD6uEFL/qmMbfhYmooEaMyTDhbVrDYIXZ8Zz1CRKuHl3lHuDmyHgTlPWglu+
         maaEp2Pue3UX9nHFIwbFYy48VpSbJvz/pgOJOF7PK2cQ0bR+BWCFPoPOPiZA4GIsTTa4
         euFgYhPSsKh+sIkfbfJd9vwP9PfM5rCBhf9x8KRk7G03DPasPR71MFp8o6Y4c/aJxQbM
         wKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737950; x=1788342750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rb0nIYYamBugMkUBgoIqbypSuVTrhDhDqU1MT4y2vJo=;
        b=FzqGn0EVxvM9nO4hxPfXhA0ioG+LvK/g4MjOJ+Lc3s2FUb8LmQLrcsdnsoum4MmFIa
         dFo9lLrN4foL8YpYR57VovAd7Su6381K2fJiVEU/Iibf+D4oWHd9DLtqk3QlYkJK2Bfj
         mbo6yVnKjuQnz1NlUDXc6JfuuS6WHIPnwGMS4exLgruA/WpNVToeVXzNNzdLJHiaxCRO
         mEh8KUBF27mp05kYPuPVPkc3Cj8b+yCMQPoJ8y/VhnOMzBBL0GlYewZ3VWt34Gw1HSaU
         yjVqLzSL2MQEXt3kSkGCQ/KqFR3/Ll2teQlhwnzI2GGm29FOTCj+HZFIxy1I0FV6O7AJ
         X/9w==
X-Forwarded-Encrypted: i=1; AHgh+RqbfEcf0CUmStk/tC/01CE2Qspysi0iDiWVMMIx4yXq7oLL+KbIy4p3jboR1EiTY6h+ziLIRE58qbJ6Cg4/@vger.kernel.org
X-Gm-Message-State: AFuF++mHkhIAIFVQG65cMXvnjfak2XQVGETUIKP6ONqpfjW4Ra1fUejo
	obXCcQ2e237VwPwNV11y+smjf4edkgkJPJ0iPswc00xub33Q/+kf3Ny9GdO05coHlu9e6ziOC6f
	vhKJqahw31puaya4Mr54jOVMcMKjDX1xp6igsPz2pqbjYy3XA027MeV1MhEcOOP7tc18Z
X-Gm-Gg: AR+sD127bzn2EulBUze8ekS6ylEfaj4dyZKtwmMvCeX3MMldE7IRIp8kpeKN/Evhspu
	1vHRUfQ9OnbIP6QQCBUafHr6BfMq5MimH7RxwAgp2uXc9sqJVs1Gc/vb12GrT7l0iGDKRzGb16s
	VE81/UaDwbdd6wgpr6NLn/DR27KQI9LSodQH++9XJk7IEAAUlaNW4KiiXbIgXABVykwOqTx6H3M
	SF45GcgpIYity4ViGixy+Z+kKQv4XcV2J5TlWrU3P5nsze0FK19ffCuqQK8WckYpoGxafyNvLCu
	z08/tuG6Wi50mxv3fKTHMHNJYLTOnP6X0trm8pJ52V24KibcccbzPeYt0m/hLvHyS2qSI62zRii
	qkBAk8kMfmiy5LWPJinkPUN+kZK9Htng=
X-Received: by 2002:a17:90b:1809:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3966d199247mr11051975a91.5.1787737950465;
        Wed, 26 Aug 2026 02:52:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1809:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3966d199247mr11051885a91.5.1787737950031;
        Wed, 26 Aug 2026 02:52:30 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm12587158c88.3.2026.08.26.02.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:52:29 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v8 1/2] mmc: Allow host driver to control the re-programming of crypto keys
Date: Wed, 26 Aug 2026 15:22:16 +0530
Message-Id: <20260826095217.2885229-2-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
References: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8eb75f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gPkh30t4SdGlgi7DwewA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jDVza3LBwRBsvh81kSKxZHqouJjNP1wQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX+IDF7igO5OY2
 s+yGXcc0cAM+1DLFTaLzX0cSqVg+1bIh/9t1Q4GnNVbbt8Fiym4doEb2wAB8Ohg2/uhnnLBtaFt
 FB2S4KG/NjOn6xjsgTGGKa56b5z7OY1jH0YxKLAnjz8y5eIepKHeduBk1g9aF8SvwpKquYY8xW6
 NsUZN6VSN8pVPycvewDuBAk2qeR2OFAP9ZrcmqXbyEkRjIGnMsqOCFabPmhrhIlXwjQ5oNbOOpT
 WBx18eqVQH0wnzEkbgCN7f4151TuKRALR5EJ0TBuTXk8e00ysuRtxaCyG/ItfZkzJOd3najlwSc
 Vftt+gYVudXwEUMpsJwzFwDeiHFs5tzC1qzyPZXjOFlgyHx5QXdxtx4a8BaVAuLAcs8PvyBaEPC
 rHIha3MAVNxrfVNq3yjddDT0h9OSf+YFR/JWrh3kHqQKEP+ovtcAa3pvQIswAYiMvepkm67L8/t
 wZD4AjJc5rWQFb+adzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX732oKwI7+MEY
 4OF9E8A0JLsxhUa+ZoDLrz/+ibwXkcdpxIfBIj/xoQxn1RoS5R3nUii+pdPpTvmzz9Sjq8CTeiY
 8poRPmSTlKqEkz386LyywHolam9kxnY=
X-Proofpoint-GUID: jDVza3LBwRBsvh81kSKxZHqouJjNP1wQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

The register context for the crypto profile belongs to the
sdhci/cqhci host and not the mmc card, hence re-programming should be
managed by the host driver itself.

Add the flag MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control
reprogramming keys to crypto engine for SoCs which do not require this
feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/core/crypto.c | 2 +-
 include/linux/mmc/host.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..a5a90bfc634e 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ba84f02c2a10..3c3c45fdf39b 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -463,6 +463,7 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1

