Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E629A31C
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987255; cv=none; b=lon1nvUeMFEx5x2bkxuj9vBDjRkX152EeWuhOZVUP/vHosDxLTMOBkrMBB8Ed7CpyPhHzSB9T4ZRYodYgbSwr2x9AFox8Vf+xWoGTfiMyZ2MietBsKR/DlVKMX1G9xIKRMVZpqlLGcs3sYeyE8ieayYQdWZru0zvtjRNWmmPdZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987255; c=relaxed/simple;
	bh=lrbGUFq5rE3s0mK6C/Uo88Hmym+VLyyN33zg+VL8wlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPNnN8NZTNmG5W6tQaaC9rvnfRTaxKz8ESHPBul9SegoqsoM+94eI7iFPhHQXFC+bpw+nCc5d7fa1Wj0mxS9B7TVayrCXnOAeAEfoZTB8OfWC0iZiyXRhrGxkWTKvNzB2tMz5aKesA2wOOIei+6vwMlN1IEfyD+hw/qtWZAeYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWZxoaVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvxvjeLk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWZxoaVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvxvjeLk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeJAZ2309786
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut7y+HUxqTEIDuhai56prmejHDpJMRa+tq3A8RiGqhY=; b=aWZxoaVHFjf2FsMK
	ZbkPi9jZiZW/8mihMdg53UmcWCysn/M0alswUCuCW6snS2tBKN9BQ5miSvsJV97m
	cw6pC1MaWrFkwxa9Fhy5WxL5lJmsGkkeV1Uq8Kk0/wFbaajZrwEAMIJlwVwMChOx
	ncyYzgwhvuKf8KLdwkHPWUt1Gf+76J/2EpZMiXGDA2HHkYUbQ5mnAAd5wIB56VRI
	hHnntnWPbJE8GnGXXoGOFludkXV2JawS3y8908LNoy8/k46jtofUCTtYbIQNpHCq
	kvAgkrqEie6nfeEzawe8PH+SuOiynYVdrejZH6pAupYREwE/w4m8u/9NL4xOFrT2
	S/GuUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da2ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:27:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so34342285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987252; x=1791592052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ut7y+HUxqTEIDuhai56prmejHDpJMRa+tq3A8RiGqhY=;
        b=IvxvjeLkiDWrGzyoGkB8pxvUbNQaRsVIpjwYEUtumyHjc2Q5fcLupnMph2AQlkUkoG
         whiEF7gzI+NHK99wZAMmXJHgAx4c2lusozjk8KtM9FbGKoygfRaTLqQgHnOnru5j9rdN
         4zwnSUXFCAa4t4YsJht4oy4113eaJSX8q2NBe+UhVeQTVMu2T/I6ZtqqEBIzs6lxtjAr
         uP2Mt2YjxbdrcEUxx47EDb1IzSJ909fD3UtrJvwwJBWVBKWVrwANu4AhDOva8p1XXOZA
         m+pdpTrebpThw6CsrxnUzhZDtHBcfwTJ8MJebxmTT3Fsc/sZQooKKbQTIghWgYc+1dsA
         0hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987252; x=1791592052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut7y+HUxqTEIDuhai56prmejHDpJMRa+tq3A8RiGqhY=;
        b=GYpSBo5JQHqmKRf91zK/8+9ct+sK2BQz9h584Quiih7hk0TxUVsyC1Fh9kZFdV6brV
         eKO+b5TMsrqZsXAvkU05fXy4OlY6VTJiA2t9ZFNrOTV2aMOl0/QajZy4sHiiLU5zsD67
         DbPsMza7iskNQQCCaRsyVEKjR0guwwcUDx5K73jOSh4h4xsXbTcTjB2+sQpWHh8n6NxQ
         GGublzPTYWAFwXzAN2VRGvVmHWz0Sw3iLkzChdo4SASjgfYc4ubVJciII8Lrry+bWvaS
         ocOi+oQhfbwMYRfkRASDw+s+1rwKmpCT5r5y9fRgDKRVQquN9FEDgC3r5YgaQwvWTgvW
         cgyg==
X-Gm-Message-State: AFuF++nH/XaqNA2a9S4hN9IPbudmZVdXZ73k6xgLjGPZv2wTlzoOl2+A
	Bo7jmhqNePbucSmNKzAtVvbtKN0rosfg/eXtxq18qjlZ2Rdtv5C6N7NFmj/MLFtXFTWDAJlzimQ
	KPF8T+HAwZ+piIVOO/UxsMeq57BpRCcj2XeCOXAghQ43/rJNKmMLFP3k9bJCgOl0AV/5q
X-Gm-Gg: AYBFou2kvkAb9/8HC94G7AqBS3ESBxTJD52rn1HksFyrFqfNHplDakdN0IlPJDoaT81
	nDQZ58mi+L4NwzLu4j+8GwDP5CaxGzfQmgo7W5LkqYyflyYvbzweSaYhbIypyFt31f4NdwGema0
	OuiQoNslCrkcCsgicJMnEbMsz/3pS0JjkoOmRwCFRt09i6x7OJWbUKetvcIXEiOZxO3j7W5e3x4
	eHolf/EJAhk+7LA2vnzxk61PusOp9DiJDW0v+HBix+FkcUAFo7Hsq7KPZS1zEMeMbn6kMijXf6D
	E0GwaofHr4GNx2mFxZewB7SCsNofm35WqyUK4yHLcitQebOYi32eqWSH/TI0BcztmDzGfzXIIub
	HcUk24B7p+QhQdo7rbVRFthacFp0sfCAbOpzwyTCrbR/ROeynQS/Z1iZpeVJx380dWbIz6gGnO2
	IdFkW1rGGP29Pn
X-Received: by 2002:a05:620a:4726:b0:93e:50ab:10df with SMTP id af79cd13be357-93e50ab118amr253162085a.5.1790987251689;
        Fri, 02 Oct 2026 17:27:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4726:b0:93e:50ab:10df with SMTP id af79cd13be357-93e50ab118amr253157485a.5.1790987251222;
        Fri, 02 Oct 2026 17:27:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:18 +0300
Subject: [PATCH 10/11] drm/msm/mdp4: disable the vdd regulator on teardown
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-10-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lrbGUFq5rE3s0mK6C/Uo88Hmym+VLyyN33zg+VL8wlg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvhZBgZsYnMv/q+O85BaenLBmoTKt3Jg2Tlv
 mXhqOhiHuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4QAKCRCLPIo+Aiko
 1YQFB/9y22H0Fd447dhKrunt4rK19joJt5jP5kS7BxDUhbmLS/klG4P2H5woAFgN+LUsIVClbSt
 0tzkRl9r8gB54vtT5p5Zpv22DYeNNVEMovdTczntOp+UkZZCuS2fXByXhsEgRnVEKRuN/uUPIdf
 4HbZsOQD52i5XZ3/kkAUN3xJqAXfeqehhs4Wg6fzlLUZMHnKQrmr0KtQhH6VJaJs7aZnrc6yIGd
 n/KMXfbhEOFuIzwwGj4KFbfwWjGnWFKPyxnmz1xh31nZYla+st5uKP4P4Wxr4+xtmKUHGyo8SMm
 SS/cGFG+oXcwETjCb74lHm0QcBZgInI4qPNuCXwMp8qVmHAd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8WlU_63WS2qpC92uO_hPkI_Rf2rItO7V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX7MdNSCaBaAeI
 bAUQv2UzY2iV0xg9zlTwfKn0xr/KffnmqAz8r9TYmrDkkJtMoWXj9xBNLmLCfybV8ytsRbB0S0r
 L+VvVb8Tby/zwIwCPrNDw8W/b6pTYr4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX/dqskoPcUg9X
 rn+I1vpnPgQv3Ypx97y2Kgy4gQ4y+uFS837Z7CIjGbqrfwtqHT+PL3bpfndKo+DDkbXzrXddAkH
 3e8552Ead/JhNnHhw9kE6yhIvy+XH+WaKOmVjfUHnhSU8WQeoswez1UI1sWhaYaOHFDibzr7ysE
 IHFNp1xzM9f2SSVJhp3tJlXDcGaEnxJyXriK/2ikkvSBAQn2beqe1VnTNrzEwIrX0de9ohnO7b9
 ERJq+cnd1mQ1DBASZ5EV3culBJKEhsD9fYrG+DwNrhFvxAy5V8qUBEOvcH3sRLjyfNHsEDxcjWc
 m7/a/Hg47gv6ozQWO4XZCpXuem+UMRyg17lv7LOY0xHLbdaphD8DUl2A69eh6pOgZ4v0EGO/tGj
 3t2LBnsNqnbK94jjaLlonIx69fApTyn83CZTmZc4J0pyVNmxlcP4FcwZNTgxufXfGHjeQhhrBXC
 26ZBQMkDXPzuheJHmzg==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac04bf4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=m8q_D-2G2n8EEWQKP4cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8WlU_63WS2qpC92uO_hPkI_Rf2rItO7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

mdp4_kms_init() enables the optional vdd regulator, but only its error
path disables it again: unbinding the display leaves it on, and the
regulator core warns when the devm-managed exclusive handle is released
while enabled.

Disable it again in mdp4_destroy().

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 62a79bdfca19..8529e7b2008d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -137,6 +137,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3

