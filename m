Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305106;
	b=T1DSuzast0910wMd9TOCHASBZKLFr9pnaoDIBg5JBxP5wLQTeh6LVlxecvJS8D/ea+O8
	 jPEJdIFK3JNpgkR4B59G0dMccSWBT/59Xf2XvncMgNAjx1v0cW6ibQYkg+DYow3UiaGKu
	 nNnRzR4U/LIqJHIrCdSKZfQE2zFAHMq1/NXmCOSazrHDqOaWUY05Uou484ciRjlhQQ6pc
	 DitQl95tmq/eJOhQT1wapcqpnk0Mgpajq2L4T4456+Jx8cgPgb2I56nUGivItOaFXy2Ud
	 TnUAiunlpO1HwqbhlEBHSqXEh//clmoPY/IyazkHWtard6tMzDs3xPAcaMYTe8+yjcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QGEFaZFYDRaQbRQD6wVlp2pG82rEYBh4up00CriDTqI=;
	b=d6HMYfzgzkDT/Sq+NQKKVyjvcQc92RefLbRt2wMjSN7LaZSuhIid5cejSTqHlSAYlp/O
	 W/mAKMxdUN4SwYF/IcN+nGD1KafZoTylVBRgSYcaaabt7WkiG0VMviArQW4J8S0j9D7wl
	 s8vI4S1zcYvxsyMlpZBgXdWVEzcD9/4BWGCvQwbQNymF3dwPBBeQYtJI09+si9LLLNuaB
	 hsRl5X8z4Q6GUODPGrefTW333BWwt8QOZuBAWA4PTwXFtZR8vtsDyfMg5qGnN1sFgB67V
	 fTx+xFkE73dR9bzX5oyhstjIwIUrqyYBnXsdzzyvUqjUP6kRBZYEzhVfIP6bgHddK6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXYmwNRB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ell5bXDA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD5606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CD5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXYmwNRB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ell5bXDA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJkAMC775226
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QGEFaZFYDRa
	QbRQD6wVlp2pG82rEYBh4up00CriDTqI=; b=NXYmwNRBkc84Ed4AGATMd7TBtS1
	vxRu1m4eCeR3Eqbppb10/R90dXZ/pwlzl8QfgAp/vS8Xzq68VfFKTM90Qxjkjv3s
	cIYk3adlJ/aut9W5vkncufqs7jQXF9lv0Eg1Bm5gHGYAmIH3xD7tM3Y5buqDG05g
	E+1lEmAwj0OrFEm2p6GODHtOo11kAhnA2T1SmufoxfCw1i3QRHmouAOGyoNAONUP
	ITXMknc+MYm0KobEQ3uMnGiaAz/xDaiGswoD9xuVOrWHgj4TfFps1lQGvPKuEk+i
	zPjBzkmorz9P5Z0f//Yc8757o3SxzWweFFQdrE27xSyGtxEiCs6Qt5i6F6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmchhr48e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2521309a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305104; x=1793909904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGEFaZFYDRaQbRQD6wVlp2pG82rEYBh4up00CriDTqI=;
        b=ell5bXDAFqEt5L4Ga8fX9B+lw1+gqdcgHUoFKPiMkse0uZHUd7Sid9kKdReo/ODJYu
         /g/6XADtVfC9hi6LhuRQuwacym5bFHq2zLmQ5q+qKiDSZTmNJYMeOuH3mkvQr04i8RRn
         W3E14dygEPxmoOYK7fbuXpEQRo+qzK2GhueROO99hJjVVMrDfyoh1dCjfuuYd77AUu0+
         ALU9qnYAu1tqe6QDwn/tHK4lAeoD1h5Ndm2tgJGJzgbnYTPoTed15eUSdSBmryORqKOB
         emYzXquONZWs6FILxuDEpRYS8HykyobXpVlwuyGQpJvSUWS4rYQgcqN99pkRd1kYhKIu
         U+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305104; x=1793909904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGEFaZFYDRaQbRQD6wVlp2pG82rEYBh4up00CriDTqI=;
        b=jjh0GbUe6rqo+k5GvIidSD6RP5t+4ZPrPzKAc5ibsP9zKi5y2GWawXfJEJAuY/OLor
         kToF+wWjxE0mYLFubbcLaPqjTDs4Si1561E5honByQz0EnPzJOde6dF3XsxK/5bah1V0
         msVQ5adcsSvQV3e1GtI37lRAV0Nyt2GqhP8VM0o8f128NrlOOPQiHWK1T1tUUnXpogvD
         isAFCRJ/2G2KJz/0H1vSZovsPnF6wesVbt9DBOqiJr51Yjz/WusLlc/L+lmNJxmqHphr
         Fnt+T1hNHv+ody/+GH667xG1iVrUcCHLCd1XKwVntDdJy5VRcrFz54eBJChYFmZpE1+2
         F5WA==
X-Gm-Message-State: AFq9FYLoxIsv/T/dYmXxI+6GK3HPGjtXN/k2WYiqOIvudE4ajYe6kRW1
	VsAlmzoSDZBu9+KiqMRe89MujF665AUnT9YvyVh18O4lX0/zekj8jEbdcpw7ZcyXhCwPwnr9zji
	Sz0VACDsvGRa7R/GIHw7N3JjkmHmoF54YP2mqF62FUq6SRGgwpEnZ+9TJfQdm7hEuDisp
X-Gm-Gg: AYBFou1eYsXsHW8sPxP2rjSFe2AQKcL8KwiUcXrZiybJPNhTVLKgM/qbVOP5Y7mDshZ
	hI1fwcmikTRm/3CuJBUzmVpXxFQRZReerGdAvsoSL/SjVPSohDzrVe76hMG0u0459hX4ixcKVgf
	/UYmjtMu+CRuQWGTGF8yiiPOFHNA6MA60gjLfIKJb2h7UpOdn6wbQLTRWHu4Xz3tGc9RPo3EWUf
	fetiJJm1frJNIsEKNnj+EOZWCZoNqFP24nDr1nAuyA1TQumlGf4y40Gonv+mIP9Jb5TUFdgFYSf
	rQdJnBR+Iq93ZTrKIySA6lDvThDQlteCneAtc2iNZPHDysk818Kt4gqhcl88faDbIPZ66WpGeE6
	7F6DtXpMnR4tdQFw+tygLmSHOL6rY7/UmwD07TbPPv1JFkRCmerq3hfW//VKXycmlHr1pTiaG6B
	3SlBTsDaArgi8NQ+PQC/bOUQ==
X-Received: by 2002:a17:90b:28cb:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3ae89767d80mr73841a91.34.1793305103567;
        Thu, 29 Oct 2026 13:18:23 -0700 (PDT)
X-Received: by 2002:a17:90b:28cb:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3ae89767d80mr73815a91.34.1793305103000;
        Thu, 29 Oct 2026 13:18:23 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm5548239a91.7.2026.10.29.13.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 11/16] drm/msm: Inhibit IFPC for state snapshot
Date: Thu, 29 Oct 2026 13:16:21 -0700
Message-ID: <20261029201730.151754-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX7sfQ/enSUrFl
 P+JgkFht3joal1FcsUonFDfu4asnMfc+uoeYxm699LDc0TEHbUTRvHvzwPrbpAeCE7l2KylhhbO
 X9nJt2NHxkU8HwAvfTV2fGuRRalrwqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX2nu+KNwoXeTC
 /Y6q3QSaoD4+aUnBq8iNnMglklreZNf7Bzy5//nLSwtKjOk2bzLPS8F9Anku9/aZnkRR1Uz15NA
 DsQBy4iwUm8zzrb0jvaXUWyrNLs5JhBdkPb8/uhAjEcGXzy107B2cyM4Enpcx1CyVZRU1NWSL26
 pSuj9AEbZ1W99CR5U/dnVzEaM0rCiRDEw6DiK2vEAtdlHbqnNQu7zpuoVhJjQCbKNwoRp6vAsE0
 qr4Io9Eg5fWahFZaGvsef+yCndmM49NuaEym2tafM51y5s1e083NpwKYCTbnJRPCJoVBTAUx1SC
 78WGrgfC8SY0ihjJbytbHYN1AcuNPXwklrtsGAvYGj29GtqQADlFLhZNEQF2uLbq+mb3qV5gQXA
 lACDKMMBD5swPaxxmU4UM59dIrERWwejv+6lN+S3jP4KHrIrDtamUxMwJp2akLh5GeVzxao+itT
 LRboYFoJkP9ihq33VzQ==
X-Proofpoint-ORIG-GUID: -_cuBtK6wGOWcr1rQnpwBjTmtcSFEvKX
X-Authority-Analysis: v=2.4 cv=ffc4WEQF c=1 sm=1 tr=0 ts=6ae3aa10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -_cuBtK6wGOWcr1rQnpwBjTmtcSFEvKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

We need the GPU to stay awake for this.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..f068315541e8 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -86,7 +86,17 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 	msm_gpu_hw_init(gpu);
+
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	show_priv->state = gpu->funcs->gpu_state_get(gpu);
+
+	/* Re-enable IFPC: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, false);
+
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	mutex_unlock(&gpu->lock);
-- 
2.56.0

