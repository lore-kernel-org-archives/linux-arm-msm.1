Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1D3F6613
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737959; cv=none; b=sRQCTFwxTzyHE81zcJLBEQBeYw01fHuPr038+jeO1l3HbvbKbXIrln9uvYJR8dedHKV5hQPDjxFYiRz9ENbuj1EBT9KWZU8oZV+LmmXS2ulmIXqscgJdjcr0YzM0ueYSMF4oxrUQNbuUew37Kee/6VbH+ToyNVdmW9ClQbjqMtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737959; c=relaxed/simple;
	bh=iVu+NF1da8ge5STKrzpoaGm8xww07KnRYKGppRIoKzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pffYgC3ybdrlNKeeDQ273ITxwJo6PNXJ6DS8RLZQ9JW1Us7mMMzHtgXRrvYw+9qAhnuefRMuVteQZBNYEgtYR4fU3P8/K3svwqTgk3Dly6P0tyJ/6g0H4P6gy9OaB3SOH1J6W3QZOrCCKimccTtHnUDzTfvU6dDrAWA01l6DzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYUlwb6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crz4wH4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYUlwb6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crz4wH4s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CrXE828694
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qE2REapfAYD
	Zy9NT8nsdiXs7OXYUT8M5lf3ietPwzVk=; b=TYUlwb6tjNLYP6lMRNJ3kb2PGKm
	dddyqF2Yn5P0d2f9rB/56OuWaYvmMfn9OEWeNdErL3LNEu350rNEFAl/UgM1JCu2
	HtiDnLwhScRcijjiMCwudKzRbK8lRcbEy9/YA2c+4+RXkOzm6IzYYRFB/KDpns2T
	gBoTKeXp6w+csLw9g38kEa6LLE1J3ZhMTgSclAZ4adYmhqkfPLzWaNPvnSWHsu7b
	4L5wNkyhh4kZy7xLum7DLKtMvJSHzxhwc5i2s0lBijZ8YuR7Ww+SX5Em1pnhJa4O
	4NwycL4qanu4yuNVTwi060+NRRjDgU54LueFA7WLyz7SmC0bYXy+oExgGlg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghfgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1318429a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737956; x=1788342756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qE2REapfAYDZy9NT8nsdiXs7OXYUT8M5lf3ietPwzVk=;
        b=Crz4wH4s4WQYVUuPPDYIAC15wj5IO0QhnCYJLBQF4RznQFaVrGhod3WmGI4CDesIuR
         gKhthYDf+XtTRlP0ZinU90CsrZC9rc6zX1t2JoSh3eiPxrsWLe995zqNJBnhXpz0apU1
         wPHeA8ZFvfbnibuMdqk2M6ivToiwgQHBEVQnWXcIvkL/ztxRPBIgKSKIFBnHYxLkMDxC
         BEzl56P4gu7RDiexJGm85eIgT11mmL7amVJ2nJQfcf0SJ9q7eUBFqORyFDQmT1Lrty5I
         qrU6jtoPxNluGvMGbGKpL36eAzfuylOKheo5N7C5cmnXiLM/mrC3Z0XXFnmCQJmzVChs
         dWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737956; x=1788342756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qE2REapfAYDZy9NT8nsdiXs7OXYUT8M5lf3ietPwzVk=;
        b=SgKgkV0IQshs8tsJ3P7IUcfzyj4PyOobobQgjoydF9JoY0J+/LFyE4PaoyPe3Li4BL
         0nR8swyta1GJ8LSsTywMcRVL09oZW6gwaUrAWy1DFI3NLMfg2CoATxi+ktJmVQ7rhruG
         Z9h2JkggoiUCVK3ZBxaFDOmbvSgcfDXRvNwx1VdkPla4KkAjTiU8iCyHIncxq4IiBYxX
         gcWlrC02Ky1TdP544FOeGtXfHfnLNasUkcqDs4BPr7o7d52wiaxHkLIV1CYIccxjIytD
         ruBNiGTD1dvxenWucqid0JVJNbYJLaZQpiCozhQeaCVf+wdn6h757IOAcwAnxU+PLZyr
         Nq0g==
X-Forwarded-Encrypted: i=1; AHgh+RoxGB7E6lib2Gv4X4PEYlzq7LLWPZ6MtkPdVMiNwfyhsoE+u/jeLDjkg8vw0tMeRAKoDtyRCgfqB/SSLoKJ@vger.kernel.org
X-Gm-Message-State: AFuF++kJVR0l3AVDKbxpRMLd0L74T5JWcBgOZ4s1VgLIiDh81JEkI3VX
	HKWPK373a/eyI5FsKkh+kWA3ukiPKeBZM/I1u5V5FpRepUJjiJBPv22cq00v4Hy9HjU0NqCQ6XX
	VbikBiVsmGD2egNVn86AxKvOnxGERlv43PrZPZVwmcHzOjpTP6sjBtfOHExGkoMjc2eM6
X-Gm-Gg: AR+sD13DeZtUkwrGj5KfeTZgK552YBM7rzJ8FBeAFaOBZWAb9Y2QacOgvrYmWYVrNOF
	YHm0yLITv0O/Q7HROEnT1vQrq0gLYu2Ykr25/B6nVuiqLCizhGx+tECVo2xBroqGVclAqmzFZKm
	POnszIovKiv6zRpElp0EZhi7AwNgrry812X48h8q0lVLDjSy6fQ1Sc2h0HzCjybt2ahGMpH/xxG
	hX2h2ypm/FjWhNrt2G+B8voQCKvT7/4le6V6axErhTo3q97KWUgUatt1tyVI3+JO8788vDnqbrD
	oSY9NRIjnwtGAB2NcuentEP6lCew5Bi/lMmKkEXXvsWKbAKhgJ02g2hzgbV1Iq54J68fLm7Nt/l
	E0gHKCP+W874dVGN598yQEAkBUzOd8G8=
X-Received: by 2002:a17:90b:5543:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-3966d5d9ad8mr12387186a91.9.1787737955653;
        Wed, 26 Aug 2026 02:52:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-3966d5d9ad8mr12387127a91.9.1787737955244;
        Wed, 26 Aug 2026 02:52:35 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm12587158c88.3.2026.08.26.02.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:52:34 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v8 2/2] mmc: sdhci-msm: Use pm ops instead of macro to restore crypto keys
Date: Wed, 26 Aug 2026 15:22:17 +0530
Message-Id: <20260826095217.2885229-3-neeraj.soni@oss.qualcomm.com>
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
X-Proofpoint-GUID: AP-umZlE0eTfMtywqxGdaCv_a1FR-SR6
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eb764 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=c8uX7mJuq6A9Pmbnve8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX2CLFhjMVjo4t
 TIBCFayzp0WvSOeVI+/AtVS4dxu7sczlofh6EMXo7vIskiAmvvT333csTEVUF7Ltma/xPH9HkmO
 43MBj0V9z0ouwZnmQ1+CC9HNmnzGQK0=
X-Proofpoint-ORIG-GUID: AP-umZlE0eTfMtywqxGdaCv_a1FR-SR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX63gAUodVbDmQ
 F44/WcDmPLnBbBPIlpPHzmFnuwXkR1g9c8dhVznLZeLSmOjdr30ngtTOQ0YocQGdsyqdhphXSlP
 be3nJU2t4noqbLFtwCSkRtsSVKCbcbCDqsu8/xZiAzPql8NTxYPzBqke2SApVEGB/MSqgsc1OCY
 5c5ul3ixB0oBlXdpO1W7ztbmQ8+92FnUpYnAZXOph8vpWwuLnKpAyw+5DsvjQpHlRDkIp/2a7JE
 hJKV0x2rp/wcdJBmVrLeKMk/WBPU0eHNE6ILI3bfRWPp5LQSudnr3DIwsJZJ4krWen19/HJOxTm
 EniFDjlBTVaGu9V7vrEeRFgPVuOCynX9a96uvh9K2NOFE1iK54dhtskByNQuxnPH1wM6hIiL2Mw
 tgIRql/6D9PVHUQhteoyalScJ5kEgwb5PFb+BowHdw5rweU5mxNJl+pAlJzk3GLmGlrReQfzyu+
 lrlJ6LdBDqxhNV7d2Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260081

From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>

Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
needs to be restored when hibernation exits. ICE keys are re-programmed
during sdhci_msm_ice_init() but it may not cover cases where the
hibernation image is already restored.

Unwrap the pm ops and use directly in driver to add the call to restore
Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
same state as before hibernation. If hibernation image creation itself
fails then device boots through normal flow where there is no need to
reprogram the keys.

Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of ICE
keys is not needed during MMC runtime suspend/resume or suspend-to-RAM
since the rail powering the ICE will not be turned off.

During CQE recovery, key would be lost only when BCR reset is performed
which do not happen right now and will be taken up once it is fixed as part
of recovery flow.

Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4aff965f0e2e..460994164d2d 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1959,6 +1959,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
 	return 0;
 }
 
@@ -2055,6 +2056,12 @@ static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static void sdhci_msm_ice_restore(struct sdhci_host *host)
+{
+	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
+}
+
 static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -2149,6 +2156,10 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 {
 	return 0;
 }
+
+static inline void sdhci_msm_ice_restore(struct sdhci_host *host)
+{
+}
 #endif /* !CONFIG_MMC_CRYPTO */
 
 /*****************************************************************************\
@@ -2983,9 +2994,28 @@ static int sdhci_msm_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int sdhci_msm_restore(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	sdhci_msm_ice_restore(host);
+
+	return ret;
+}
+
 static const struct dev_pm_ops sdhci_msm_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(sdhci_msm_runtime_suspend, sdhci_msm_runtime_resume, NULL)
+	.suspend	= pm_sleep_ptr(pm_runtime_force_suspend),
+	.resume		= pm_sleep_ptr(pm_runtime_force_resume),
+	.freeze		= pm_sleep_ptr(pm_runtime_force_suspend),
+	.restore	= pm_sleep_ptr(sdhci_msm_restore),
+	.thaw		= pm_sleep_ptr(pm_runtime_force_resume),
+	.poweroff	= pm_sleep_ptr(pm_runtime_force_suspend),
 };
 
 static struct platform_driver sdhci_msm_driver = {
-- 
2.34.1

