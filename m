Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635812;
	b=wc1x6+UanvDAl77JfUr1CGm1ov/7NHmyrq/Qi/yDGzAtf69ocNwG2bAOwA6Bt8wAFl1Q
	 31UtGEfvGzSmSGNPvnxnX6g0dI4FYIKq5COWdfvAR7oJkuHLiwiuKdSowQ46b5bH9Zr8T
	 oW/RPujNiRRugNcWB52JwUwTqn4Vf2t5/k5ZQTgaJ/iHgIur7gzgvjDFinXta9KqXWC73
	 FEnpg4AwcGKfquuhkl+ng+kpOK3O2TFiYEuvoWNXEOLi5UuQbpwWIuePPTZ7usY6aseRx
	 GYjZOmEuICwncNomc3l5ETctleaKvC6P20b1adS+544D9flcsz88mFOSfzbv3HcV32A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K1G25hLX5Ki186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=;
	b=OrhofEnsXRpIySK1vxd2nnzynLkWUa4LxYSB7rCiWQijRY2faV81XrQV8K5/JX+uULy/
	 S4yCeKVxLtIdL92ORrjby0O2VgEGTPwEkf6PdRGPX1Of0bh7n8Fqxvd40dfsbAWAmDxFq
	 D1/J5qeH7myvSsBsBmI40dOC+otdtaXR06kitIiyj3b4bLX4eghsKdY3DX709xNdIy6GT
	 rDmN33LFwv+v0B5qpTnIrj/cdAHkdc5MyDipiZKEdCckV0oKQkrms+DSKT/HBTXbiAn+P
	 CUPe3A4vL94oqdqQ88JxqHUebhCZb9btXeWaiVZDL0Cp+RYesW+WElqdKbtdbCaf66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nZ/6DMHv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ppff7d5N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F160805A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 16:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759F160805A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ/6DMHv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ppff7d5N
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpMUP3102689
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 16:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K1G25hLX5Ki
	186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=; b=nZ/6DMHvFOP6HTIDfQjspkEVds1
	69STLXYocEUwu8Pn+QVDmBkvH8Z0bQJsV6nRgmmc0lYllnlyCR+4eQ5Uz9u6VHzC
	fSKOMvGiCXb/B0iyuxgnxWTbQASTuP4Gm2IiKGKqfW5/+CGYerefgsrsfs8HtBKZ
	oKqVg9si36x9J8TOSw64hyXhcEQSksWW+z0o41e7ds9zIsmNkPpD65Fo+NPinisV
	rDGLmHe1RSKmEkscUE+9xd76obBTe7vKYXktvOLh/chxncvmdwG1rxtF76sTvi7K
	FnKV3W4rRgG5WnHCmh0nHhxqnLKMiuc+647hv9V4zXvbCgGqpcWRmHwLE0Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjt9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:10:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so3819208b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635811; x=1794240611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1G25hLX5Ki186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=;
        b=Ppff7d5Ni9FpYVTU68JaX1rQ/KZFliTRS2VCAlmEfLLqxz50OvY/dSgeXZx10Jyk1C
         zADS4lGdfO5hTRmc/bdw6+M8GBp68iPPk2irHEq7rmK4xXC6KvBR/9o38I5lFX9qJkU7
         /pTVVXFyVy/qEj4CWHBIxM22ntpuvIIzIJiiDAPrfTqc0b9xobqaKpWt9JWDELZbpvZE
         2APNOEaF4Ba1zpzyM6Uy1uE3uvqnwINAJc5xra4/1LrHHu37e6ENDOkfYAdCXKYlMEEW
         o4GUjaweA6a2M/ETPMxX8IXhttuGeDBkokERAOFZQQ2Ac5QctTvqNddPgBGdI43i6x7f
         uu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635811; x=1794240611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K1G25hLX5Ki186k1LXjEcMy3Ym6j6ix6RM1pmAIlnWU=;
        b=v7AB7peqj2wu9j2S7Ke7BLDmF/UKYICDmAcLoLNqguVfOBfGuV8Ow+tyx24ueCzSOj
         LzJhujo2IWv7jtCdJslu635k0O0MOOP+8TkdGw05lbmwYsezDO/moLcx1qXOB0+PykZ9
         HwlNxn2HYoGq6Sf8BTM+aBWM8mzlo1054i7DVTFX7OK5OHzfPV4/8l066c9/piPGr5aK
         9Z1BUNZHwTWoro4kh2gRw86AI7WbNGreETrVMBrU7q1tkv/3pUdItgM1geaCRhetoMuK
         vGGsBsvbsc8vrYnTZFGynzXBNCkQRLlKJ0gni8myAjxF2IIrGgk7rYOzGWSP7Vsrw3y3
         Jk4g==
X-Gm-Message-State: AFq9FYKHEAjCH8vB8s1YbhQTF4IJDrVjtMPFXbDWDIzJrypoxcFq6eJr
	G14YkauGeRH5oKZEkZs3rQZ/zk2fie+QyMYIGrBPoAPYG2/ZQGyrj1s+3oOnYbz989VC5z82OjH
	3VOnkptkxrV6HPPzwCkn31ZrlSFwzAztEhWI9yc3r0aNqsUKisPA17xtQba96cBmce/yY
X-Gm-Gg: AYBFou0tZUsDvGUTHrQnYhO4b2UHsixPNWTVlY/Kc0+F0uID/gH2UQI8JADsD7fRB7a
	8rlBm+68OuuiWy7mRriWcZAKJHPflQuLg7RTYss2m6q6iPVnssdTY2sJudhbCXyplPCrSt75Rz1
	xw7EiJv0VHnz/hJ1PlBKRHpstiVA8mMpVAluZiDp5D7JeGHAdlDFNCeQxo8jzgfKktaGainIpZG
	DhIpjDeJUd1y3UG7VLPS6Tsw1XOPRuNNJghThNkFeasCQJE0YomLF1Ng8R/lWM3mXo80zlN4Y4S
	TVdhOctBLBu+vi0GP5Co6giKNQWBcUVyNoUpkFBpQ/TNFM8Evnwpyfra0GXxEUlFUZxp3ib0N16
	blJK+RRwsla/S6W5tSqOAL2RIW2qAqDfYyAqZxZTBs0E0MXQvPg0mqFxnyBKLszTVlrFna8gp3V
	U1bl+9JXQKPxkNXcVUK7AueAA=
X-Received: by 2002:a05:6a20:7351:b0:3e2:28f0:b360 with SMTP id adf61e73a8af0-3e913590580mr9379215637.0.1793635811224;
        Mon, 02 Nov 2026 08:10:11 -0800 (PST)
X-Received: by 2002:a05:6a20:7351:b0:3e2:28f0:b360 with SMTP id adf61e73a8af0-3e913590580mr9379200637.0.1793635810795;
        Mon, 02 Nov 2026 08:10:10 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364902dasm57218a12.20.2026.11.02.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:10 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/gem: Decrement loop idx if handle lookup fails
Date: Mon,  2 Nov 2026 08:10:01 -0800
Message-ID: <20261102161002.497152-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
References: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tFhyFcVzjQ9whR09NMGK7GjpR4azCj5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX8ZiEd5KLr+q4
 rKVKZyLEImS9MmUpCx0ucRmDmZy2zjjI6X9zW1y8mL6ElnhmYvV0tqiRwTXH1Fewl0xs508JlyG
 wyRDwYBFiEIGmiBX+pu6NCvypDOI5m57EG9gIJgAdD1NobXPe4gUGjwS5K3fKONcvRfDD06SwU4
 rWoOF89N/Oev4v/vII43QNNxA7Cq6lM7TlcraxYgHwrAAS1TlwmfNA21n/FxTMVHpjgjM78X++w
 gbW+hU/KwENre03//o3GFrL/dPN+7dD6riQ4KxEOfU2jWaEBCxHWcTKXq4W6ynrRAp6qeeqfogs
 MehbpZBJI/wSBsGfOzWUX+kQ0sV7MAA8ERRX5ccTvlJl9ORW2Y2/blZ0Iu+GOh9bhVsRK1NhBd5
 HB/sdJ8mvvRWnj8Lgl+Tc1FM4zny6Cj3YoTMpRJxsJgtblNN4JmWZHXXCuXRYLsy+dn+cFaYz0A
 6vFminoq2mDdDSMUJhw==
X-Proofpoint-GUID: tFhyFcVzjQ9whR09NMGK7GjpR4azCj5n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX28tb8hFsIs0K
 kRTAOMJ73U6wQVYcNX9XN5N5WFz3u+LwEyGSiJF2aRgeBeZ03HYFzi966lcMHErL4lW9o6/sYgA
 2dj9jELuLsuXQON2fxuc2FxGRE/Kmcs=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8b5e3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

In the out_unlock unlock loop, we should skip the op which still has the
gem handle instead of gem obj ptr.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 922285537dee..4413db0644a2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1110,6 +1110,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
 			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
+			i--;
 			goto out_unlock;
 		}
 
-- 
2.56.0

