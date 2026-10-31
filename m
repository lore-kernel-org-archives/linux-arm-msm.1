Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463137;
	b=iK2rx0E+NYnDcd0toNsBNqTJ4UAMXcg2dBu3XMuBIjC2CPgL2DC71qVl64qMk5TMIEyd
	 9mWo76EUtVV+RxHlT3WC+MeP4+l9yaE6MlrC5IfAeA8JMPjNirUMVC+1NPbJwBsIs+mww
	 gqmNZTU29AbQQ9eGXenSPW6eFhhtftNBAzFI8culFp2thVFggW8YIn/uCp3ZUj6dw55ZW
	 WRC+O6fY8ItHAJAFW+yLkC3QOS+LxodgK8yZtI2GdeHq7wcvUf6I9yoqVlE8F9b8yw/wx
	 Koq3x11mc5cswplVy63A2/1iznAbbeIT+ayB2U35hcBb1hZvMQlN272qVgI2vADLp4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=;
	b=ympao5Ll7At2klUp5e8P8e4xjA4fZFW0QZdjceRLF9xpdjt0fdDXoRKoyo/1gbGUYUKB
	 qVso/Xh4gayeLEvha2Xfw2p+MS4w751mgJ3wGUZ5yWxuIDqyuv3TDPxcaXgscJUCo/TmV
	 JVOngBE3P59+qkY0C6FT9judNT/nMFg4ZI3ndW2ASslmiRPqI7qxjwWcUO5VQTvjMB0rh
	 0Z3XBVSYn3zjC7M2OMqelDOQ7dCpYvqXGEpV4+mx435w2Q+4M5mHVFDVQnRpsdLuei7Dd
	 fFAjPBwF+UH5UiSM+9bVWgbEGZuz1EheRdSP4QKWz+GoFmQ9sevXb9XcX6tkXvgn2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr35K+LE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEAmTvxK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F045E606A33F
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F045E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr35K+LE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEAmTvxK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD06Kb2788873
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=; b=Lr35K+LER+4iVlQo
	9PNjD//6jwTlV4c8LtjGdhf4fvJU1LGsq1qBBgR+Ro4LHsgmGVJ3xcp2PkbRKlvl
	bolSG/CSTCs8e/26iHcwjFJRwCXLsSStJKTQ942sJfetv4cZMQHf0iUH0rhULHz+
	N4IjKJy7Y/gp9xVVc0zy+UqYXoKQEAQGIyEHtJIdfarX3dMARgcoJj5FY8/1p+GX
	XvH9xJeX9zS3Cf7XidRiW64Lk0V7JfULZZO9rnSRJ+gu9xmQCSEBJxW7VExBTuT9
	XWXeNlntpRRh1QzHBV15S36Tc+5gcFfWgDV2qAZyuoM/i7SQqj1qMdsd4esGX25R
	jGXANQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxhhfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so197584485a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463135; x=1794067935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=;
        b=DEAmTvxKQMXv64VHT7UuLML6yC7chTtO9ZdJch66Ds1QvcCGdyQhTcFPyHBj0WYwVH
         ykEIlbQNQ3Fu29gQ5G6hIgPAC3dBQjMkg5ct+4LjX0aQs/7vevS5bv5EIP8ZpLuzby7l
         ZsoWX9rzTdOzCG+wsiybDEapy+Kd6ZOKJ76wuKhvV9N2INlRv6k5SpLtf0N2xiETtQP2
         dmUICUOmE+lgtslIyiHAOdb7IokTpwiRktBVydDEk2+KRFEg5hG1BIPh4dskqLLRNs1G
         SG6QqaZDrxE9Uvdj4bWZm16yBDccd+1PVPMdAg5kkZu4hw7mJORR4pndgpdDm/aoqn+t
         jztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463135; x=1794067935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=;
        b=X8RfJcLWQW37VuubAlXRUNmEbxhcvaNyiJG/7hIr38ySjSjOq2TzmYQESqLgSQEjoX
         6EBt47TPMH7JUg697bxuSGJQxHltzTKwg4jmLrPNT7YrXvGhsAQBYVoa33ln8xfvqUqo
         F3Tn7KCutz8iYRtQ/DhHQZGLTNAk81a1q2nO99wjIldS9e7Pz2h8FOi3IYBvmG/x0JCE
         /8KreEhb6gYhdxtkjYRlCcgjjKwrWXEFAyAIj7BtCa7d6N+2KmLgcSHjvMj0NF8xqh95
         6mqk0+IL3Btph4flCY1Evf+/gWgbmrPgswygNwPO1MmrIW6gC1SR5XVVz7hEXuLD0wFe
         Px7g==
X-Gm-Message-State: AFq9FYJ6VKDumOOwRU3kmSGo4eUZ3wsKMX1C906FCFxaIE32AM2eLFHO
	05d/DLa0P5vpZrAKmBXGJPyEpVjUTTPsEj+fQqqEbAimVR8wtJkoYjCCiO5RmPq8lJHbVf8WfD5
	4a+i2BfqUiAj+RbBkrIYHYplR0migGMJjbKHjkIJ44XU0FB7pvydeeZ77j37KZzcuCJYg
X-Gm-Gg: AYBFou29pVHhpScXiodDYFT9YfNq+mGJ1U25RVBN6kOp8Rb0lbd+YCfstF9pgYXTASq
	x4eayaLirhdlDYf4BcIzYtDtQqVfSoH0V/QKtxGr4LXnuTK5mWH/dxV9gvuiLfSg5ajas4eqwPj
	idwgm2YzsNukR3NqS21U4W6h6fgnqkdKzd87fTDUFgHdebBIY9oWfUtmZU2zIzCX83ds74nogMp
	re3Btgth6NfL4vooVjBEXYYV9ef0q/PDu42p18lI1fZUPCqUZ4MlwxGBOUPBAPL2+/cuT1wzLdA
	MpZNioz6LSeeInVkx7aqV+WTKAQFvMxW/ZEIihfRrZXg4OOV3yIJwNz3VeeTfJOD1ECN5WxVWcJ
	scdnCIg3hu7M90GabRNd+P1ESduIR795mBE9RpOOLijmviN/nrZy5j2N9M4FnGNLYUjgTC9AJCh
	eMr4DBPw8WWlxeTqesdmoBvye9QeHPRKaet2lEWXjOQ3irwBo+18X2Wk0ZlVdIiQ==
X-Received: by 2002:a05:620a:44d5:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-9442175e4bamr928062985a.59.1793463135085;
        Sat, 31 Oct 2026 09:12:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-9442175e4bamr928055985a.59.1793463134377;
        Sat, 31 Oct 2026 09:12:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:53 +0200
Subject: [PATCH v2 3/4] drm/msm/a5xx: keep the timestamp offset
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-b4-adreno-timestamp-v2-3-0836856b228f@oss.qualcomm.com>
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lYY/hrbAKLPfEA/li7VCmu5NLk90bGLkzx4vpVBQR7w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yz4aAClUs9BUlbdRZzb0vMYk65UTjd1mrmXbNd8dkzt
 F6GvFHpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEBK+y/+FhNkhtZvOz+H4y
 NUaVo/pXC9OaCp/kS3amD6ts5zsx1Ksp3Ps93+3LOsGp1+fZFlww5vZrnyPy38zO+FNozpaPxm1
 RZ4pMjD9vWDrPR7tL40dkcHRFaFZrwdGdsxwnMsY/yDjVcFRta/FyCWX9umQGoaWSD5vPfJKPbu
 E6LCG4sFchU2a2XpuleYPwYutJzXx9q+8+iGlqtV946l5GfaK2bsn0YiPrMuk5H544HVJqMuNzC
 FaXl8g7WV0s8Hy5jmGzxz1JMcUdT9sCGfmP8fwoPCmfKXuZ3dhutkx8t8bixGT+XeG7lrRnMJ9e
 92hlv26os1zS2wXrT3tf5xL0tFbrPvjbZ52dvtH1VQA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: M5ZYiSO9bBG4coNMjOxAfyEYd0j11L6d
X-Proofpoint-ORIG-GUID: M5ZYiSO9bBG4coNMjOxAfyEYd0j11L6d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX6I8cJKUMM1lx
 L55wdaaD330tdx5O02K13PfZ54WiRNAAIQNR1Ns1ycsUjfo7AZlh/yvKXWifw5Pu++Z74yuDut7
 Dpzy7K5fgsQWY7q+K4kSxjHPEt4MirE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfXzI60TFQc6J70
 vkLdTC1X9uxSIXHBOufF6pcUhHITswQRgw/sPynXOiOA9p3VjYyC4yNUhFrJNIGdfaZrSf12XUR
 zNJUTcGkvVpRdJLVPeWab1aUEXNK6r/8PBs9bnJjhBEESfTj3W+c3CD7Gb9aQ6v2r5vdbbNfhJ+
 0yt/uLRBHOyTThrfq4q4jVvMRsJkziO5kes/N4hyVYNPzAqa6XqPu2X98b6R0geYsp4pQh2eYwt
 Ppix7m3o83Bs/dRRZQA6V7OGc9l2wZUPuz7zRlCJR04SYcSXZ7hwIiHQqUk2qAhICnvSPTIkdHn
 xU50NY7wXtit+s2sdxNQkJuEF5F8VgduHnIXFZheWN9rQOP68W8DXtB3YSIigyss0qVgcn6AKCE
 KjFfPJDObtRCS49/fYE7Juu6CXCH61PEyZUR795Osy13uRplchnwSoojIYL/Lkvft019Si6jy4F
 SEBNXsZ9LbW54/CG+nA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae6135f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=G0ktpma277rnjfAblZIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

The always-on counter of a5xx is in the GPU power domain and restarts on
every runtime resume and on recovery.

Save the counter before the GPU powers down or is reset, and restore the
offset once it is back up, before it runs anything.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 16c7335c4b1f..fbb92cadf94f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1025,6 +1025,8 @@ static void a5xx_recover(struct msm_gpu *gpu)
 	if (hang_debug)
 		a5xx_dump(gpu);
 
+	adreno_timestamp_save(gpu);
+
 	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 1);
 	gpu_read(gpu, REG_A5XX_RBBM_SW_RESET_CMD);
 	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 0);
@@ -1374,6 +1376,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 		a5xx_set_hwcg(gpu, true);
 		/* Turn on sp_input_clk at HM level */
 		gpu_rmw(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0xff, 0);
+		adreno_timestamp_restore(gpu);
 		return 0;
 	}
 
@@ -1399,6 +1402,8 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		DRM_ERROR("%s: timeout waiting for SP GDSC enable\n",
 			gpu->name);
+	else
+		adreno_timestamp_restore(gpu);
 
 	return ret;
 }
@@ -1415,6 +1420,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
+	adreno_timestamp_save(gpu);
+
 	/* Clear the VBIF pipe before shutting down */
 	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, mask);
 	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) &
@@ -1432,8 +1439,10 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	}
 
 	ret = msm_gpu_pm_suspend(gpu);
-	if (ret)
+	if (ret) {
+		adreno_timestamp_restore(gpu);
 		return ret;
+	}
 
 	if (a5xx_gpu->has_whereami)
 		for (i = 0; i < gpu->nr_rings; i++)
@@ -1824,6 +1833,8 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	adreno_timestamp_init(gpu);
+
 	/* Set the speedbin value that is passed to userspace */
 	if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
 		speedbin = 0xffff;

-- 
2.47.3

