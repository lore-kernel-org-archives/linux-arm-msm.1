Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731668;
	b=OwjSuR1mnLdmqOdy2JElj6JYEF8/L4bn5/c1cr9zQcG48roB30AVXMJeIPCqtowP3QRk
	 waRPM94iiWCSlIG48OlphJUsEI8AijJPnKIafUETEK8ACRl+FFG6yD7rbBhhqAytOtst+
	 GKvMeivHCnJAxpe8hMwa0pxI8sxhnrp+nh32R1WdiL5scildFmM0Av/3aNW3mfnrtgzOw
	 ZTsa3hC2LoEema4QlfTZRC+csrUp1a7tuH13WqRNkfr1fWxvlFwhCMqYkPTWVXwui3R2Q
	 WWZ2z5YuKzgJq/MNRfiBuSChhw78ioOJ3rbxG+DvcT/FDqsZxe81odXjhnT5Amts3VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ETmQNPch7+VQUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=;
	b=2YrgR1QOZ4Pk4OvoR4YQBrI0BALAYiwWqs9qY2S2Xcd5gWEfg51rKnzBQbqT5bLbnKo2
	 eCW9kvmY7ZVZ3fkmvcjuZlZPxAfTF5/cnrHXfnoFf4eAoxgn6Gmbv9T4OLD/OY060nsdz
	 j7ZrWtYCu675ylH/d09zVGRTf0bAljINZDMNim6f01IXDPbeiU/q8Yma/NSidYPC9FkOL
	 6X68n5soCBg+mX0fpD+u+nSv5W3hy/gZK5l9YxTty1dgAf560w7sn9/3ETyqRY0bGAPRH
	 2DPzVQo1+2OmAPCl1NHE0eRp26cWrM4Pn8vX2kyNnSpSkE5h9+vpDYYVwQjNLCQMHhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YympX1Jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrIl1uom;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B361606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B361606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YympX1Jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrIl1uom
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ0Z73675764
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 18:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ETmQNPch7+V
	QUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=; b=YympX1JtIHjTisLKAIaPwt3NtsD
	GZkWySP6Wo8WdY9HBznBmtgThLM8nlXh2JOtGyqvs00xHe43WXj6W63h/i++BRU7
	G0emyhDbQBI4nGcEHlUa+8LPa99MkKxDJWCgZCkNywbmx8MJTDIZUbNjj5KeaI73
	rWdwy/2e5gar1ph3t87b9E4qhlffyklB6YGJFIzcEP1PafGEk9MDQ607W7NnUieV
	xmjFH5xbe2uVKdpY/FJZuCtDFvaKacs4e3WMaOOvBQB7kOt8hTY73x5coOEnDGED
	VB9B1NQnnKipgswVjjHLqnfRJ2dVvXcIJ0rmQyLeztn2uGGiV6d/hs63MIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyph4nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 18:47:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso44967365ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731665; x=1794336465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETmQNPch7+VQUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=;
        b=TrIl1uomY2cLyYulq6LK59u5nY2DXKj4Afg++IALpQ8TBvBDZv+bm1xoxeyloe36yW
         vXxPxk0ReF3+0fyal2X+qwmHdxutvDO+vlISJ10luyZ5I9oWKGxMeAGytH+0u/QrDigR
         R2goBWHcirlDa+zcx6cH4oIsEzf8XLsqg+EC6lag0uyYmVYc/iQRfJSPTHcqvbbIOrsk
         E12/AhBruWRP1UqOaZWGTqxpuW3hfMNJCBuzY22fYPrAYG2qxakcyN5jNgpB/gPwgXfx
         dReyHNu+zseK49ngytUrp8lHtVUyjJA0lLV4s3HN4IP/X9v312Ftaqie8s3YVpOJAUon
         Nt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731665; x=1794336465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETmQNPch7+VQUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=;
        b=Gg87/3LYPWFmxnWmffSgSY108bvSkckRo72H5tbm/vJ0L8F/B4EvDipUEnmA84qM5g
         hGQNWz+dd4NRymEARdPSBTw4deSTByY0sxH1YBdDEEBdEGQMotNe/eOgS5c3aJ5GoI+M
         g55HTc/9twpmh4WRExX0Y2AnPPpHneMOMptDQ6tZSH83FEmGEsotJVQi3OtgIqPIkTw8
         ExiBKW2IChodQgDtwPjlMDq+5ieFXv3NW2rQPRt/ChBaMUClZNrgsAfdAXiX1QjM5Sdv
         8jscwrhMVHUfTo92q1IFDTx2oLksN+Un32g61JhOW/rlsO9L2URvdNwENEOAmHGtApYZ
         K76A==
X-Gm-Message-State: APuU4Z/HLQgLGf7ePfQ8CrA0x/O/SorHGtc2gph7nNXRoOJIQPYbzQeh
	Mm3W9Yo00JbDyCy4yWT9xZtYwyLECnKT/kccuoIvoL+gB7JidtVGg78S48gB6de7E9+xPjYCr4C
	5DXA1O6hyYJcQ1W3tO1vaMiPne65W3xaJKPxSz+QtoHwO+n8CJi4u3phwn94aIvPWu7pj
X-Gm-Gg: AYBFou1efVeh7grr9r2/HBH8qfcAhSRhshke9wiEmmZGPv5nygRHMExQQtsWt9CGzKf
	jr9qICJ0rTyqBCLwygNwQaexnIgrGCcYGmBiWc+AVGnJRCMOzNPo95DlGhp35biBrhWZsI/PZWZ
	zQRWBUWgxQ0n9I2wjQyNEA8LMlHCKaihuniFZklF2hGQxGTfcy+AFBBbLCxbgUYqTSnccn7Yh5k
	WfoOfEm04AIOOc/sYACWQIAzH84mKoO9uWIH2BWD0/8Nesj+NoiGypPUc/UrzrCnp9isJ9qSLsp
	nUHfyK5ri1tcKnqNery6/eDh7FMThLl8I90Gp6tlRdE/BA4rxWVxN4mf/y6jK+EFLDaMzhr/nYy
	DO79EgnpUg9uTFrvk3soHnWjsNnb8vM9QDPVXK9H++rTTC/2T7Bqptjk6z92UFi1jI7kdf+pY3B
	HGt0o6D+bfKVi7A+d3LhZ31xbJa7vVmkCycgfq2+tdtbVJwhZjEzW0CddEPe4=
X-Received: by 2002:a17:902:ce8f:b0:2e9:3a86:b987 with SMTP id d9443c01a7336-2eb364e7ad5mr118513495ad.51.1793731664983;
        Tue, 03 Nov 2026 10:47:44 -0800 (PST)
X-Received: by 2002:a17:902:ce8f:b0:2e9:3a86:b987 with SMTP id d9443c01a7336-2eb364e7ad5mr118513285ad.51.1793731664539;
        Tue, 03 Nov 2026 10:47:44 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392aa7bcsm44746595ad.67.2026.11.03.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:44 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/4] drm/msm: Inhibit IFPC for state snapshot
Date: Tue,  3 Nov 2026 10:47:10 -0800
Message-ID: <20261103184713.29664-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
References: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX1OsMJPJncq6k
 9VSk5ltxPRC6Ur1Roj8sgM7vseEzsZsQr607xKR2ZuWTUy87kzmBYo3FEj2RXvEGdlumQTxNI5G
 13iZvnnZxxD5O4bkVVjNiqWat4ququw=
X-Proofpoint-ORIG-GUID: hzWDoLxUhEywAAhwhWdj0pdTlxRN8t7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX8PnSbwCeQB2E
 MIfpUTYQnaOCOYgtBSsp9t+OMK7LPFWEbh2OYoBRXgSd/1U6kLMQ9aUVw9FQIsSeiSvtDsmOnqF
 LSIN0h2Gvc0XFvPev7fexXaDhTDpZbr0CZIkNzCZXHk0Kl8ozGc/JBToGRfR7DAhurBYcxkoHew
 KPhkfxPa/YfvR7MGwhGPLLi/rGPFSKAHkRqXXN+Niva8bVNdLZ8tGtE6eCHDkaSiEVvjLQhWIvK
 Tg/iXtGnvNH9K/wtzv+a62ICJ9tmyw22vhMElekRwR6tF0jYqvm5kh3L5ay2SUC8wYCfzqQ/Ihh
 EyCD0cFAJsfNhsla2XT6K1xRrZb0R5bR6ps6WaWDK3j4oug5euK4Pu3tAlVaR32J9Xg4mmVPMiq
 u8CQadWRg/bDhztvLGHrOCwsjbjqkybiTYQzVOoIq6N3OUTDIU9mnu4dkZU0l9vXfPLwc09JPk+
 4WjcdYczXXAMdxK/asQ==
X-Proofpoint-GUID: hzWDoLxUhEywAAhwhWdj0pdTlxRN8t7P
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea2c53 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=jgQnFmZX3A3noQDnNKkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030074

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index aa59b28a3392..29209c23fcfa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

