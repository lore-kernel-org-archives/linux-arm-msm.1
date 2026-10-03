Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D73016F5
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987252; cv=none; b=u3LV1gvc8EmhxTIgwFxko+WIIUI/y3cJOq621fSpMIqTSiyKlfaaKCjt/cq1wwR+iEvcRwMQ+T3haL62n4s4YcjgEmfBoHmR+6PjnQQQPBBVL8YEw5R/3Bi71vROD+crWcxOCNhW8lhbz5ERJ0e63clj6Qt/WY/yacwnc05rukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987252; c=relaxed/simple;
	bh=bbO86FGXsDHqLs/ciqm/qxFg1OxXE+ZgD1o0bUcmsp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hojYUPAw4aJqXgbTuXekxHWDRGFPAbd/+Bzn3bt8crU443UcEG5QtWGpfzH2EN3AnMBJJxjAWg/zsA3Fehik2/9DS5H6uyR8n1dT5tQN5DrrUBbJKNTxA7YCi698cFjVb+J7g8iWZbZQncQmMQTd7guHvbzAnokTeR0hrk4X+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx7y3EAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANzNV3bi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx7y3EAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANzNV3bi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne2sc1503811
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCKckv3D3qYeE7jBJ3PaA+r53Z6LWd0Zt+icCTw5pD8=; b=Tx7y3EASDrt3gPCc
	GHH9TuXktZyBjtPgE6mMKExFR+ZJRIlXuYwUe/3E5NbBZjV+eBJrfiLgkcLomloE
	JiN83vQkGuUXmqn1QaJSF2d29ilkZOzJfPIR+OTsMqVghmFaUfc6E7jPD8mBz/BU
	R/k4sW3vb0wCdpwWAWnNx66gYKAKPE98VDqUJBIzbtzT67kkR0CMMi7zIBtB5o9P
	ywaYekL4I32IEMFUI4KGOM8tyxFf+Ej9sdeuJVPxEgdQT8Vddk4nk1z7JL+X/VZC
	3pSdm4M12iCctvdq2mrWOwWA5S3WOKGoRKwMsdPY3E9zqUKtomMv43R4yLqm8naL
	apuYyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rrcsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:27:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso488736185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987249; x=1791592049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCKckv3D3qYeE7jBJ3PaA+r53Z6LWd0Zt+icCTw5pD8=;
        b=ANzNV3bi1YVA46m8LHbPFzmCG4jHNY0WYXs4ukZs+ITndCh4wqezPZY2hxR8jAnUmQ
         giVZxgKO+mQCTtfatYcJHFqbc4mLY3Nb5R5SxXw8k36cDWZ6FW9HE0fOp1Go+XI9rXbS
         FxD3oLxkNwJnN49cgEnKM4PssKJEFPqWiXdXvEeZrGdpdo6bpQ54P54PizSkSB9mUBgJ
         96ymkLw1C5sTIy8MT8VrLva2oLJDxM8RlIqP9Uvz3rnR3eXUSF+SvfHfkHouNrTDtsIn
         5+cfxNBNi0dvJQipWs4v+bWJbqqX68G8X4Yfrkd3AYRVA0FOnGcECZxl1JIPzBnlWAhZ
         ia4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987249; x=1791592049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCKckv3D3qYeE7jBJ3PaA+r53Z6LWd0Zt+icCTw5pD8=;
        b=e9dJsusU+AGp07EsklVqqUEVErCBZo0ZRfiEA/MqkIaaiLBP3Zk+i4EETrf9dhG3Nw
         4ZFvTh2/i83z5VrnFDnbZmB4Srfcgu+qlQWFUkIZN9/AyxRxQUAGanCDGU9ydU4Q2AG3
         5u72gisdVhjvoJNBYRMn7GKA/EsPFhYPUPmU4Tw3Uk+32cS2C1gEGCyESWFFMMWyTXvH
         M3aawV3AtqbmWyVWVVNRcrXF+6wlo7eYMD3AMSMQPv4f56qcDNBqoGLAhjcTiGupsRsa
         TR7E5NZ1AVkmAXDUlNCCYy9hrALxUFleYZoOdmW0YD2zUFHArhi/oIf4wJEUlFTofD34
         oyrA==
X-Gm-Message-State: AFuF++nAc6fm9MwQqf0dPs/CLzSY42CZt1dJYVQy0REginimSyzbGtiY
	e6tlSEb0VkkvH6JsBc2ngSQB9b6iVJHDk2JC8qY1So1P8grZVWqZBIfAr9lGvW+YddPNaLVk+pd
	RKe9CZ5gHIZzkX2Vs12X23kPU0sc6bNIac+7zoAr2IvUBlJXontdzNnWNgcRqhycGPNQZ
X-Gm-Gg: AYBFou0VfrHY2hyqO0is694kAd6zYE6LTd+qj1vjTfMKg79Q8I/zgMgNBZ7C2UwHec+
	3OZfcVkzIURxz4LA4vtauYlC/eSeeuZP64dK45BGOMS75LXOQXsyCqicySs0tMtRZcBeN0Ed+ro
	C0v/2ZyGhuplYk7bVnN8Dn9AF/PxX5cN5m97PincmXMHSESQH8kzJjenD6zeODNzHzxtZtLYEUb
	Ta/rXlVWDNZUAVBlCY62pVRS6wtCfnjk7R4Jxrij0dWXfTuMZvH9wz4BAGm5YqICgfCNUgqVAIo
	SRCHQpSwTT1gbCBchDGeP665G1F6Cg252Kz7veTt6GVoGOQXTWJ3vWlhK/w9PS/MawFBJKrg09O
	U5W1Dsx+ubXfBRp9WJwszRxU+Wrow2sjLojlSSNktGtQIa0MOQp3goalo56x6tlWD/MmZ/NiJz4
	GYBpqV/m3TEZgx
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr1457657185a.17.1790987248906;
        Fri, 02 Oct 2026 17:27:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr1457654585a.17.1790987248462;
        Fri, 02 Oct 2026 17:27:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:17 +0300
Subject: [PATCH 09/11] drm/msm/dpu: unwind a failed dpu_kms_hw_init() step
 by step
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-9-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3257;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bbO86FGXsDHqLs/ciqm/qxFg1OxXE+ZgD1o0bUcmsp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvgKrR9+ITvbSenZojV9Y0W/JUgHEO8dm35v
 tsisGwUT2aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4AAKCRCLPIo+Aiko
 1dYiCACQzypfKlxO7NdRdL0NU6LsQHTUPR6nVg8j1QYpG2UVdXxIxKS1flR7TbVBPzpwtCcVjGb
 hmdeTxNZm9vMWZLYwRTjxR8wjEl3Ugh4d73pT2tH2pfMOdW2rb4b5Lltvms1eEIO2kTY/MDymxW
 pMB86GNshS3qYTd9PSJaVPrODsx+OwVXomk6qjCKDFZGmhCrAMdu40qUefY5DGab36xPa7HAPuf
 QmH6xG+FzruAn0eNqPz02rRrxcRHuJuFqI6pXg0qE1lF8MB+lGQm8c1Cd/+vAo7lV1C3bVSSQ7f
 Q+NGZR4Wzz+Uq9CNJ1O4r3Ln879P0Qpm2BiP5YPo/eWbHSHy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac04bf1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=1OQLaJ8wmIwZLDPTffUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OR7ajouj2GVzloi4DQ14P_UnOYoOdjqI
X-Proofpoint-GUID: OR7ajouj2GVzloi4DQ14P_UnOYoOdjqI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXxCsPwICxfLmG
 h4DuvXUJe1KvSIf4kKMiyxeLr2E1zPMqOWOnmwHBCm3jXF32AofvqTrOZpyZOufjI0/vriI5TxT
 oVOGO2AcieaqfoCcrwagOknZcYcO6/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX9QhJrBCYNKOL
 0PvU+tJJdw7YeuqGdzyyvSyUm+68z14s/wJz5XYhhOITwO+II0AxsECT5+y5wcGGSfiXGfNGwyq
 8WcuBNowgKQRVD9w7yTu28FUFPj8Dw7QVm7fers2Bl/LPvGwdJaa9xSYoPzmLIOCC3gSTT6kD+m
 7LwYsskF6iQYt/j5Jh5G2peojcOmmfhUMwx7PjvI7AL+Cqv+igLTAFvTIe06zdtyN2/ngtXk+mN
 +1B2oTZZoBDJU45Lzu3tRRKYHzTcUulnMYmzQ68npO+1dxO9LOwM2ILxRL127zMUHMNFfLf3nXe
 8KO3b8ZzilmffAyTu+WvTsVRVcfRCTYNhADjwznPmjpXw7+2YTvkaaI1I5vwssr6Kpc39N42LAu
 9x100OITraSAzv34GtE/zaVjfmcyPOUNkw1yeRvvCW7FVBkYJAfF2heMvZbnBj/tYdkogbAZZ62
 FXF1nYICd5g+UhegvgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030001

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
of a fully initialised KMS, whatever step it failed at.

Undo only the steps which have completed, in the reverse order, as the
kernel convention wants.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 65ba8fa697e9..2de4d881d13d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1150,7 +1150,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
-		goto error;
+		goto err_global_obj_fini;
 
 	core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
 
@@ -1177,19 +1177,19 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
 		DPU_ERROR("failed to get UBWC config data: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	if (!dpu_kms->mdss) {
 		rc = -EINVAL;
 		DPU_ERROR("NULL MDSS data\n");
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	rc = dpu_rm_init(dev, &dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
@@ -1200,7 +1200,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	struct dpu_hw_vbif *hw;
@@ -1210,7 +1210,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_vbif = hw;
@@ -1225,7 +1225,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	/*
@@ -1243,7 +1243,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1263,7 +1263,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1272,10 +1272,12 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	return 0;
 
+err_mmu_destroy:
+	_dpu_kms_mmu_destroy(dpu_kms);
 err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-error:
-	_dpu_kms_hw_destroy(dpu_kms);
+err_global_obj_fini:
+	dpu_kms_global_obj_fini(dpu_kms);
 
 	return rc;
 }

-- 
2.47.3

