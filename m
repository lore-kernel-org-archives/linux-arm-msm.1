Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA284331ED2
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461503; cv=none; b=ubz0Edz9YAoT23vlf+SZrcpmUrKLq+nOFpSbDRiJOKCsOGRJ4B4zxyh6XyHh8QcjEqQl+QTp/7m/xVZk2OR0N5y7FHJ7Sg/XWdDcVWCDtblf3zmWRXoV+vp0ht8XWoPfAW7DMnedxoccBEzILaRBZhLWtkuCtGi9y1+M+OcvFjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461503; c=relaxed/simple;
	bh=NbgGl5cLf0ReGNO3COnwcEwBWeIot0njUhLwUl0O7Qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eWT293Xbo7qeciywQa2ZulQcw8wdT6h5L8xBJb0nw4rktHL8sFBjJLQfz9EkxhBFIttZTolPD30awmN/ZxHcAAYe2qlbbU3xfeoUMoE94zZXVfDZPUNnTifKHobCm9kzVGKXQqpu0Ju+h/vUWXCh375E405cX0QPEaQ2mPHVCjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrgZNspy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOdxc2VR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrgZNspy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOdxc2VR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWxQq767062
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vpBZTVyDsH5
	y2y67euiXcDCt+is3/E/IpXezT6gqsyk=; b=KrgZNspyNqmWDi1qBQlx+RNFWqT
	FYkY9pzNNRXBAxoYgPsestSgDu4SyNue3KrOS+KsTlQOT8ClvnPZqRvD0LeR20ky
	sP8UOsUIpnAndU6mSpjJCqyr3K6CsC48jmVZiLoVsvMhQNGmUYSWa5EGIrqO3/CN
	3mhkM3jMZm1EUuDyl4EwRp7HczhwWl0he6zzC4/pkL49ZlOBFTVLtEeNHiiInuWs
	WEf7dWPc6ymHxAX9FeTeyYBL6Ojsz3j+cgds4DIUteRLuYxiCra9JHQejIsZBVYg
	AnFpy5wnhPfesXCWO5OrIK9UgM2J6XY9YgEbjbGI/S4PgwQ7AgNimG8cvfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q116c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:18:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso4511699b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786461500; x=1787066300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpBZTVyDsH5y2y67euiXcDCt+is3/E/IpXezT6gqsyk=;
        b=TOdxc2VRKpmutDxvDSE/ZN0UDGg2QsNF72sfZXpXI904XgH0VlItEhDp6gDOE/RN2T
         XTHON6PcZ+s1zxcyuBzP/0cxu5Gu6Rk1/nVsAv8kdvmmf+oJSeVewcR96mzi+LAPBkPz
         l6QTndY5XWQvt842f1LKUA3TPTrtldzpCmoS5fhL8LRvIm1zS1WK5Qb39UBQi2E0PKud
         5YUJ1u3JQPSNfsSxEhVisqA4vLcnWVZWxpEhmbo7HS0dm5rUWMveFI7hRAL8t3xYpoyM
         mQtztXtH15tEgxYwRFl22hMdVMGRIehpWUWvPEzspKKVjXbvBkWFnBswI4ZPO8VurpAY
         l+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461500; x=1787066300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpBZTVyDsH5y2y67euiXcDCt+is3/E/IpXezT6gqsyk=;
        b=cS9cwwvzbbl0fkY1+GPNRSodKOx7+fr5Etes7zIk2yUxh/u7R+Z8UkWT/+2ngfMbUG
         YxsX4igQxbp1ZLIBz6oxpjxovj8BO93kqpLYrcKHq7NZds+ZH9TAnwcT8Fp6Dr4sgkPo
         IJiCwtg5URRGO9ty2OpnPwNoFsS1+iFZgdV/2TXG2jZ23lZMr3rY8jyLPOeM+JfUavbg
         /iDBfjDznwDmRirzmgYZYZr6rfxBiplYA/o+rC0eoqUs/zmkhodBlku6/UTSB2k1C9l+
         2OBwhIW4dCSCYI/VL88FedOFDiFLBBWce1b8iOMh26c5/Hd+SoVf6IovUl8xzUDJByV6
         KyAw==
X-Forwarded-Encrypted: i=1; AHgh+Rpbe0uq/TDR3MaFIkbQGiWKGOsQwcwHTwJTnkpih8mXKVbE+QMBWBEJ6SH4VZC8BFeayOpclKJgbT1sPKEB@vger.kernel.org
X-Gm-Message-State: AOJu0YzrnDrOzP+r3+eNGwkmhXoODXlqjdLLGdfneGjNMHHbuJmH49VK
	EGGi6jURJlxFKAZUghi01sZGNJIIRCuo6auOkF+KMybjrvieC0fy2Y3xMrnQ21r8Mlk1sggda+m
	BM06uywAp+CdcQN94JIr+JXVd7hbEHwUdPisEdqczyWsBfbAVP7I9Z0XODGHGXcFmEzCsX+Ls2t
	04
X-Gm-Gg: AR+sD13/s1/XM9wz2tH5AnYb71m1hQf6WjyYkuQEVzURlux9lMj87qG+J3f85/QXz1E
	1Db54k7Ezsyhk7O88Tc53n/WuQwnu/JfWuDlqUlkDTgQb15pIaE/S0LZYXu31ck2BMaFcBH3xW9
	ZNToPGfo6aVMXjQXREEa0txcKlPorIBvOVH8ol9VIpxtq8LlSa4kO825CXE2YsKjnmRXMEfoMeY
	mTT7PmF5isLZQJ/gIWDBzL9eZxTNVLnR9H7XBhDMwjlIhrBV14lJ4HCuc5lAD3ZpF5QlBntACkx
	rVlBktq7U6JD76LjAWj5AyzZII0PEVErRDI6LeJ8u3sq5hYf+skB3u59cH/rPaEh284ccq995Af
	7g/o8SPMn9cf5TEM6fxWpkYkoNGLAkpQ=
X-Received: by 2002:a05:6a00:3305:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84fa88435c5mr4657646b3a.32.1786461499451;
        Tue, 11 Aug 2026 08:18:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3305:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84fa88435c5mr4657544b3a.32.1786461498900;
        Tue, 11 Aug 2026 08:18:18 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa95261b0sm983727b3a.36.2026.08.11.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:18:17 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v7 2/2] mmc: sdhci-msm: Use pm ops instead of macro to restore crypto keys
Date: Tue, 11 Aug 2026 20:47:59 +0530
Message-Id: <20260811151759.1258525-3-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811151759.1258525-1-neeraj.soni@oss.qualcomm.com>
References: <20260811151759.1258525-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3K1b8KvjvVfyEB3fxrZDaxP37i1S2jQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfXxnBMJLUiZs8i
 HWrqwIzBJ2QjQT5eGQuRluEi8UGap2o10QJVGlfAYsRSo7UI1qCRPPNFvEg6kyVnYK21lmjZ7eC
 LbK0vIdhfpe89ojOZm1jxBof8k+hcqyOUUdlz8QNRNdV0J2pGQnnxToeeFQ84nSvoxjuBTMiCed
 E0ga95R5H3EztR119y7+JXLcmE1Tj+uz4+qhiLKaY6L9E8TL73J22yF2K4ff8hENQL7CdzdIA2C
 ubSXK6DrjDg7IaUvjLM4aX6zQwcAlDENGW3vtxksUk6geh0soLWsaFtayYL18hO/Rafhr4AsnWL
 ftMyBfLEpTBCbqK2ceMqks7T+5oT+4XdNZkgX61faL+55mNi/3QbBFxEQp4qkpetNX4ZnPwATN1
 IezWKAmu4GZJJy57HcY2DdFkpZEOO95lcmzBRguzUpZBnYSCJqeqTnt3zZ8kd+GOBgu6vdlx7cz
 UooI6rTne7LYSfov14g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfX/9lN7XMFSSVr
 JnLxtbCwIYfsqK4RJDUA4IvT/uvXeERy+vmuZtF8JWr2H5t833m5mP2Dt1eU/uR/7z6DxfFQDv5
 fbgFjn+lZwqXfJ+VU2Goy6kJ2aVaAjg=
X-Proofpoint-ORIG-GUID: 3K1b8KvjvVfyEB3fxrZDaxP37i1S2jQ5
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b3d3c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=y6BdAlClqxV26XkKDfUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110128

From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>

Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
needs to be restored when hibernation exits. ICE keys are re-programmed
during sdhci_msm_ice_init() but it may not cover cases where the
hibernation image is already restored.

Unwrap the pm ops and use directly in driver to add the call to restore
Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
same state as before hibernation.

Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of ICE
keys is not needed during MMC runtime suspend/resume.

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

