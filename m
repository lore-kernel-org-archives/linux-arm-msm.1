Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889DE440A2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420535; cv=none; b=AGAxO8ldLPxUoQBiuK7jjnAYDdHNuXMEXLx05FBS+v6qW9PqZMU5DSYPsADO1IUknW+MHKS6XUnOYDXsH3JoHOrDnwAzLYjcO2QmaeK64J+pb3dKN13veTWbDMmJHj/Sq1SRI1+mwfBH0pTnLpFU9Tzipva5m38/0ZRvQcUCvAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420535; c=relaxed/simple;
	bh=gX7L121EHCJ2xpO6FumAoCTBKS83D7x8y5FA1Luaqig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tQYrnzJgP3hLXIN/+5DmPiWnvfNCjX9AduVvXoJIsuo3kX2lySu/S8F8pMAzPZRxJyObG1aGok7qyYb0KIdESmlS3AoyC0ZEbl18OIe/bImflPfZW99s6IpW5dbCpv5P2lxDqvMNCldH5oUm1Hd0+hRxbRYY+PAtwJ3VBvqV0Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW8Or5vB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7iY83W5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW8Or5vB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7iY83W5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE2BV72203596
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiKwp4iFQl4
	+TVSFMRodDlpTE6zm5cCQ0F24fi991wY=; b=EW8Or5vBOly80LSkYQbKWiEADPc
	VTMg7ufx733Kwz8VjDhVJSlThYWXfR2aznp0O8a0nPn4O0CpalZiY1g1vL6hmgnA
	Q5nIgv9e6orqJiJIh02zyJahSIr393dwwO7K1nhn0eSwTAEJ/DE3OZGZyU1OfFFT
	MKB49jt5qAYzVWU4zHuyAAP9xD7/ynWU8dJTfyfut522ikHVgQeMsG62ZcCu11mK
	jo0NR5dmGWB/kHW1145jAhzzLVv5kSsClRWgEvH9jrH+AnO3+R7QjUE6UEIGwV/T
	mm+8ZybfMnIkKYQ1oPsEYDcCAMvFzNfDK7BbfSbKlVeg5tKBCfB0qMfqACA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr816819u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0f45415cfso25315136d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420530; x=1786025330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiKwp4iFQl4+TVSFMRodDlpTE6zm5cCQ0F24fi991wY=;
        b=M7iY83W5VoI7+IpHkBXlSaCvlDzyEJRBiXrqwEDH1xmYm9P0Gify+ydaIdjll1Y5Yt
         kRsXT+bp2J4NQ4BLd+wt2dAOCyodEn2EhRI1pWBhUPAK6RKUoODQfhngvRhsUBMunZQF
         I9myHa4bodCSpLxBcuNk1WSS/bO1znbej8Pp5whW+v4xARNuAqFkVUmhWTJcVw36bFtf
         lijtDQ7QsQVZGyewc0+n4O3+aCiVpheposdI8TbiUeMDg2lmJUJI6wGl0sg1mvD3I1Gr
         gy3eGfHEUwybhnYtqw6PmDb/Hw5wBUFrwrRar/sryQxG+f2hT4+AR5Dt8/J4cz6NmxMs
         OiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420530; x=1786025330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiKwp4iFQl4+TVSFMRodDlpTE6zm5cCQ0F24fi991wY=;
        b=n4pi3YveOBFqoGOi6DHCubOevjsZZTOKeF6GlHwerDKxQLLfEKJ4rTN33STWiAuuDs
         w2oDcZDzU0xi0xA+BrvMmcDW/0HNouuIqQiy6z11KFK05BoPgiI/O0tTnhFz4/P4Hflx
         uu8mSPCNxmFWedRYwNQWl0T9Tcs99bfFiNTM2c1+Jp/JdAAOfeCAjl3zY3+y9VB5l61J
         fVY0KEiXU/sfE+xuquIThnjjq43O9ZkB4M3UeHZxCatUU27ceZknAKUqAj4C25doXKGQ
         pXis0qPinFGQXJS1oXGK1kb4R0xUkCyofMnqF+srUZEpHdD9WoPP0PaT/wI1hdtkEOUV
         pO2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7QwoOVI3KZkvbPKBhFu3w0cVV5DitnRnhuYfmQxWo3lQrrHmnuaOE3aqS2b8cJsFmcdSWfjV7+XmY6QoA@vger.kernel.org
X-Gm-Message-State: AOJu0YxmD0mhg8HzWgutsCYG8PQoA7nhfs36VXD1TQA53bpYdqPDzgQ9
	9TouxYYh2zr/USi3J+m0Z8LIioP8PhohYcpKUiQOLHjwlxFAtF+ywap9iSyHRBL/AoqygZg7HIb
	/eixMfu812+EyZxia/vqLq7v+fQcmWw0MXtU2UeqFpiWqp6nhTnOAdmtmlhZX9yZurFF+5mAG30
	nt
X-Gm-Gg: AR+sD10WO6XoPX/9NsxHeVugK4jTaTJ6hyz6ggfnyxXX3A74GIE7eRZah9tPcXV5yat
	pwR/Eq3+WVIauNrtTOJuKzqLJud+e+CRzymUwkDvo1MNt/IqDU1mg4S9zqPic/mWF2yguN63flZ
	498j7PIoiFx/v8RQjoxfPt345Lz+WROjZmAR5ZCHhAnsvI1jaEFzbhpjRJkCxwidww5ei9nl/LO
	JDfe/vmW1MqULwy+I57Kok9hgc19ofzr/ZKtfaa2IetXMjEvZTRhheWAbgiKRlOlQZg8UKjM/L4
	QdowAQhf6n+gxpr5R/GC7IKjrewRvVS2FVdJkZJ1VFPg+6krst2gIffwETJComqqpFDtysPannu
	qrAMH3kMGJDVWBTHh01GVcXXYgC8Sg5U=
X-Received: by 2002:a05:6214:5786:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-908346f63a6mr27425326d6.29.1785420529763;
        Thu, 30 Jul 2026 07:08:49 -0700 (PDT)
X-Received: by 2002:a05:6214:5786:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-908346f63a6mr27423376d6.29.1785420528110;
        Thu, 30 Jul 2026 07:08:48 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm18465826d6.43.2026.07.30.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:08:47 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v5 3/4] mmc: sdhci-msm: Use pm ops instead of macro to restore crypto keys
Date: Thu, 30 Jul 2026 19:38:21 +0530
Message-Id: <20260730140822.1976635-4-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX0G1CMHa0/f8B
 o4X1zZvKNISBUmjGxAZvtQqpehjle7lR0MXHlInjE1eOjZk02xk0HSEFSG2K3YQh3IZtxCsj0mA
 7qjhm6jUWbaqSCZ4MmtexjfOpFCRZ5gcvKlj+H2QJISNVF4LIgaW6flo+uTB8o1KDYTj1chq4Vn
 Zsy8f1Ka1F3/VEafGoAQAqb+NDsSZwa7juDDOXpAzq9hfrg4zRRgzAAqioC6dGo26K9FSEAxmBK
 nH5qbcVIxunhd0E/czNhZLzjCDlU3Tp8qAL/hWc2v1gzhw9XjKWeUMooQAECTlzC8INGODWjdvr
 8sRjZ+7j+H5DvKjkAG8CZniufkUoTxGOzJZxzLPk1X0hqFWcSRAgI1UPUEqiRnI6xAzCgzSqsUF
 dREl3mjH9aRxGK2XeSXM+/An8JIoqShtCR9scD8itmMK7qrAw8/WiZ954eb4gVH8WfwmjuUPDd1
 a9RVmRx7CpTdzYxDQkg==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b5af3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KcI988Z2Yvo0hyr3f6MA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: p9ma2ghgcUzVN3BsZNePp-zAra3Jf8vr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfXwaM6cjQpoOuj
 fYJChSBqsn51g0UDizFW6YqCU3PA7Gjv/kvJ+9aFbHgoqD7TFQFYG7GbHlDTiO5M4Bd7epBhIpc
 xkJAJ29bXaOpFi6e3aeXaazk39wpfcg=
X-Proofpoint-GUID: p9ma2ghgcUzVN3BsZNePp-zAra3Jf8vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300107

From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>

Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
needs to be restored when hibernation exits. ICE keys are re-programmed
during sdhci_msm_ice_init() but it may not cover cases where the
hibernation image is already restored.

Unwrap the pm ops and use directly in driver to add the call to restore
Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
same state as before hibernation.

Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 7d71dc6f388d..a4998e74a2bd 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2986,9 +2986,26 @@ static int sdhci_msm_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int sdhci_msm_restore(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+
+#ifdef CONFIG_MMC_CRYPTO
+	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
+#endif
+
+	return pm_runtime_force_resume(dev);
+}
+
 static const struct dev_pm_ops sdhci_msm_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(sdhci_msm_runtime_suspend, sdhci_msm_runtime_resume, NULL)
+	.suspend	= pm_runtime_force_suspend,
+	.resume		= pm_runtime_force_resume,
+	.freeze		= pm_runtime_force_suspend,
+	.restore	= sdhci_msm_restore,
+	.thaw		= pm_runtime_force_resume,
+	.poweroff	= pm_runtime_force_suspend,
 };
 
 static struct platform_driver sdhci_msm_driver = {
-- 
2.34.1

