Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD385519A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876129; cv=none; b=XTS3ggUtv59cbqRTSrB+OfNgD0we3XuIhQCSe98dRtCTjLNTuDmLN+aT7SN0KfLXGWmxPrRceACj18zC0AF/dPOeeDQZEj4muSUbx7D/pwqUWWJ24PYevcIjkUt2w06in9NHHO7B0HLvW97aoWAdMNuQEj+6OmbIdOxdv9Oq3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876129; c=relaxed/simple;
	bh=+W/VJmY/w0HJ6vMFhBO//YD0odQ6tMzQHwNFCFAKC3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMsYLYSJxaKXHtphtzZtnxbZpNpI3Ti01/K+TSWX4eJiHyywZvYMCdd1bE1///7xqNZP5GNgzIzEBoEb9uqI/k5dbVEedz0nwmUKJ3QRu87zP+xxuEhVKd+5tUZkpPnn3468sXiS9bPhqVWGoqf+rgMkemCLAUiS3topAM9bPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6skT7K5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+y7kzcq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6skT7K5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+y7kzcq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Cku7W3844333
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fA41h5uR4IMC3qdX7AxnasOu7m3aDGKFcMXfiNuqz0o=; b=W6skT7K5ap/sXw63
	QWCm5jD3bG2vYrta8fM3FdbsFZh9J1E6MjJwa5axSLZRFqlMv0e+8mjzZ7DwZnsa
	ZX8yzsN1sk2InPFn+Qb/SjC/oDX+YV9q4vKLW7tsYtCqbGPJyAXnW3FUzac7icjp
	uyBdXBxYll2difb4GCUhiL6ZsZPtlbo5TEHCGzkCSyEST+VNuHQdalfeC5r95KFe
	8wORlGXJJTYqinITBrmC6+HJQI1YL+IeXqXc81d0DKYOh1X+Q6cTU/MgjD+IZvP0
	TGRCZHqURIWtbdYNk5tXn5lOAqHmp8lqgyo+zTVAadXva1qGGGYzwdr4gUkofbGg
	NSFUug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrx34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:01:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso8942824a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876112; x=1789480912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fA41h5uR4IMC3qdX7AxnasOu7m3aDGKFcMXfiNuqz0o=;
        b=g+y7kzcqKER1rd/6+SdjlXJGyYaaeUXab/edF7rgsAORQfeLhspbC6/SN15FQDypi9
         Fh8O3rgc9a23CwWpgxhDHIjy0niZRmfSl5+k9YFBpNf209K1TW1kbNRj6z9W0P60N2Em
         /bnJ6fCCnevnEBp1xoF7Dr+WWJgOtwtp+YKoJuxh6W517dsClg3/i9u1bYdGSWGvmKsH
         WmJ8FIMdU6fEHyPheNiqrKaWcCn0k4ehXX8yYDBSrjDteSsepu4VTmorz/i7kY8G+pvP
         2pbnq3kMdEWOk7vKj2urtwGtp0YWMvCj/S6syDYS41v7+/kZBSMGCovLux5ld62CmhO+
         /Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876112; x=1789480912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fA41h5uR4IMC3qdX7AxnasOu7m3aDGKFcMXfiNuqz0o=;
        b=j3Z7T/7glMnlRe91ixyfpUybByjzy8gjzaZCIKkVprho0WFm1UWoE7DAmNUCBuiMFE
         R3t5YLS7FMzbWDYxsj9tQ5YPgajRR7MBZB1W/K954uKIwx7BgqIkZk47yE7kjOFoi3sh
         KTz6ontU3BYrfy0vBZQ0EZKoPCFhv4Ei36rJ7erAAOWw0kb9sUU6Wy0Owdf8gVp8wi+j
         buIc3j0ct04aaSb9enb1OMJl3OhLDmET6UyokzkwZWCdDQtVSinM5zAW0EHLeyHjswIS
         Md3z2iLgKCdPRUwbFnN9bZ/xPJqlTcFKOlEtepwDP0t8GqBUraQKd/dsYUw0rtdSzuQT
         wcwQ==
X-Gm-Message-State: AFuF++mph459Hd26q3Ge0hVcCzJmg/mSZlVdNgkSHBn/8hAQHGuAbbqG
	ovl5EvPjm2Km8HhnsguEZ7zg6Rfc7aVWKKtE++/XvXtOfn/O3NrZqqen9nidilsgKm0KbJVHO52
	AjQQl5gFqiLcx0UWhFPZsGaYIUJTuh1Rh6vqXi2bnEO0m65Z0hB4dWa0MzdUjntJAL4RM
X-Gm-Gg: AYBFou3zmcti6g40eWuzoNju8Yr6jtHpSBfcwB/XcShRrdNGSsej+PJZ8Fxo+JtXcP+
	Y12HGy8MA/7clUzo+XaMihp/q2JEyx9KDxhFn4dyjaLMTM66GxJe53DD0gJa9fOkFQByrEdMuSd
	BTHmdE6M0sj4OLOHNpSOPfSDAnU3bUYM8b+7TvxgpIya7FxhMwLyaNx5fI7MB4/nogl5Cip7tT/
	JwQd1ekfpAxS3ykx+/qUzgAJ+DDt6a3wYODzKwl/jDY3SI5T7IXpWCWnbhftNPT2l/VDUX0EOzo
	Fuc26f58eoNckSFLBesV+nnZTef3AHi6mMn1HpphIDijuG4Clcj2eOxM/Po4USAHH7kB/+VOc4d
	+dSH8hp3A0YWg1kANhs5i4hC1m1w=
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr49672969a91.5.1788876112095;
        Tue, 08 Sep 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr49672801a91.5.1788876111233;
        Tue, 08 Sep 2026 07:01:51 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:50 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:31:02 +0530
Subject: [PATCH v4 9/9] phy: qualcomm: qmp-combo: Fix error propagation in
 qmp_combo_dp_power_on()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-9-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=1577;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=+W/VJmY/w0HJ6vMFhBO//YD0odQ6tMzQHwNFCFAKC3w=;
 b=Qg5AE0TCNknurbJSvtaEURuTubSChdXOV0gEsrmJNfxzxW8mB+xtNlJApI8ubBM90QoeZ8dfr
 EZaWbAZaeWlALGKz4wIfLGGU35VJfwnqcyq/ZHf7Hjr2oQXjaM1pSUV
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa01550 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X8Wa9jmQWlBxTcu95m0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6AUEkEW6aH3srfHKhZ-PpRYUAezMXi2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX5EVPT3roYQpT
 5T63qDw19kuZHhNtRupEMkcgt3I/+m/zHMBFwMBkkwAJWnaNbJQS5yLfwA4gT8q1CNFiRy7fdfX
 FYSlp5BKQIcmIsXULVNv3IKfGBpIK+xT+x1vp7jE1qx3TV/zDGdp5+LzIiIpX5Qv1/Fuv9QwGPi
 /NaxLNhmWCqRhCdTkcbkL8UmmYpowAyxfdl2AT5hNr1l3zmE8PL4bLMJ2K5MZn9sMyyIXwFF4Zi
 +zo4fXHGC2R+QOCXkCz6+6fd+G8WT03/90OL5LDmmlwD/8nLYAcvVHJMmXkhqEF3qJizfBEP+hp
 pN4DTnOy51jYLuL2DNt7U4gLvGuNOqwyRKqovMy3pM0l5FP1Ro8lKsl8536UWYbPy8UAbvuHSxC
 TcZa/6dsdhlRqUq2meZQZ2WpwNwDVkylk9ZVddmn/fR3Z8q8/zCKjQGGJg8uoLFa/M/i/1wQW7f
 jVuUa/Gjs6a9mEjaT2w==
X-Proofpoint-GUID: 6AUEkEW6aH3srfHKhZ-PpRYUAezMXi2u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfXyeffjd8rygeV
 87Qezen7EbnmC3OI9RyytrnL9Y6D8evrbR8+BhswxIkJcaTcwn00c8fP0oSsSSIzQ4er0lX7Erm
 Z3cJ0r/+ul7QmC6R1kD6CQitMrtHviM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080151

The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
value and always returning 0.

Capture the return value, skip setting dp_powered_on on failure, and
propagate the error to the caller.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bb1c5df52d09..d77fe94b312c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4316,6 +4316,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *tx = qmp->dp_tx;
 	void __iomem *tx2 = qmp->dp_tx2;
+	int ret = 0;
 
 	mutex_lock(&qmp->phy_mutex);
 
@@ -4328,13 +4329,17 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	cfg->configure_dp_tx(qmp);
 
 	/* Configure link rate, swing, etc. */
-	cfg->configure_dp_phy(qmp);
+	ret = cfg->configure_dp_phy(qmp);
+	if (ret) {
+		dev_err(qmp->dev, "DP PHY configuration failed: %d\n", ret);
+		goto out_unlock;
+	}
 
 	qmp->dp_powered_on = true;
 
+out_unlock:
 	mutex_unlock(&qmp->phy_mutex);
-
-	return 0;
+	return ret;
 }
 
 static int qmp_combo_dp_power_off(struct phy *phy)

-- 
2.34.1

