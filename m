Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232969;
	b=SYH5I7U5bmf5T3st6iceSHyB0v81427fqhuGr6GFaKlcFX8zyjIlucQ8eZtiajKKxR0M
	 xuSZHUpgGLYhyY0qaBOPMjcK/vUMMthBDAqVQpTVl+Y9q3xSJWvjzbBlA6t0/SXtSE4Z2
	 bmNG2siNtFXY2uh9lN2fjty9oaWZC2yU+nZH7uiK91PaDU9Y5BQk98s59lcyzblHzSAMm
	 aOk25s1GP92b+8pxmeiALezjwjqQRAVL5qL/hma3zmOUPD2yYnNMIVMYBagpSQ0ukOaoq
	 wrnEC+8Ym75v0CU8S6NR3RjKZtXLzn+22uaVM8bVhg2Xiq1Mh49X7IE/vsmKit8XfQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2D4y7zwYc=;
	b=z8Z1mikmNl4nU0HFIwt4HgrdGf9g0drNxQjn+FWEIBiprToo2sbufgVJiN+aQZaevnhJ
	 TPNONtfPok40cd7pZGtdyyhki/oDZW+Nj2gsXZP/SzkRg4EvHZFXNeSdOQ9I3xBWQCrpr
	 R6pIzqupHjWNvFpxulhL/bxV2WxZNnKoT5oe0XinT5XJoKKVang6i/gLNrPY82Tt5SaSJ
	 VBFT2cKe6bEjI9OGOBupCOVR34ExmAjgdIu8WqREXeI0PW+xJT+s3q7MxZHtnLebZB1KC
	 YN7Hh4jVseYAHdHKGp8pE45ki2W0+COFNuRWS9P4vBBGtI9QOfT1ZguuaA6ziMUhNfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V51woe7Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gn9PRVJq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF6606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64FF6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V51woe7Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gn9PRVJq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMAfwf2429256
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2
	D4y7zwYc=; b=V51woe7Yjxtg51tV2f7EwvVl8gQP9G92ub519Y9jQgk/3dtUUo3
	WaDTGRw4AmwJ4KQCq2p+7k+xEF99QAH1VDjpYIAW9tGRtZ/UIBsKKBI6Xv7qGO56
	xV+8y5Yr+6S1qOl/XXT+LWOkIMjkmK2FP03/QniLUtKBJYL3qoWKaBXWhGEbxgMf
	CZZVe0bsyiLIKdhHFejLKxJf0kOOHPn8voahVimlNEEqpJ0c0Mk7CETJd0FgFVhB
	5LANraUAHEaVRMmSxivwe9KReohpfk1m8UuGHel0PI4o7SK1M5cm393bT/wqzB8s
	fEae5zTQK1AkTqtZGHGXPgfQF+pWHbYLloA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwc39f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:16:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05b68f851so164246b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793232967; x=1793837767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2D4y7zwYc=;
        b=Gn9PRVJqmN9AS1B6gzb2zt0mD69RC4VGiDY6gpsHyMZP+eeEgWCGvkm/V8pACcLhge
         3hDsXXhv/Rl8AKCiySQHVAo6Qg2rFew+roBXzj2TJjga5UUkcYMn8gazrzJJkvBa8vnz
         gsJm6Nqgws8zupMlUTPpLEwKD+P561ojs+3SmoW5423L5h0OnBmYnH4Kl9FGMGLPIxIQ
         9zMahoYgp4iYgXkvoJbIcB1s5nfg9VFpzzyvyCjabynht5gp+NGtpx+NHKL6v1c+fTi4
         qoLzUmWsHwff09k/p34ZKODv4LlEnuLUNuTW6Zi9szQKezgzn9zmo5yZebYeT5zvGyRJ
         aBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232967; x=1793837767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2D4y7zwYc=;
        b=vpVyzmBMZ+8RT5DR5AAOh7fC2woR4OiK+PezoJrb2hM+0MGxQ6YwsNingRdpy+vODt
         MKOa+EkADoEnAwNBX9jAJU78TZQiV1GbRVUdfv2/a5WC2sfzBaijOAMyTfnWssoPSDX0
         LyT+56v7lz54528FZHh5kNNoWrD6q0GCKJHfYU/mSMaQ9N34sV9vjFQ/AOwnZrg1wh8z
         q5LFun2oQz0HgkqKVV9XHU6HWL5Zp4220ZO6zjywttfvZnrRhDt3T8/sM7g7V41m1LRZ
         KH8gXJynsW4/KJX1YMJcHAD8tOFXOjnSLB+WSFTdE67mcjFVskRTW2p7cPXRVA3r9MPi
         nBMQ==
X-Gm-Message-State: AFq9FYJkFUVrGhsB3F+D/znrIHzseQT1+3aZ871OKULhfCBJ2ysepWQI
	1PNXgjoqp2rkdPq3Zhmvxh3mALnXNHvYSzsqM3dyroQzngk+PXb4JhcYt6V/KRsMrs6Ezp7D+E9
	ATa26YeC+pDpX/eOgjG/ftvPWbMxiZroGPfgHrZTr5qna1Bd6B6umnDqAQqLMSYwdGQ6C
X-Gm-Gg: AYBFou1LsqBD+CxzRO8l11lrOc9wV5U6iTfDI684o9qvzmhF7UJ+rg3e/NxTzDXzBmb
	a1sr1tyxxcRte5CzCKxdFIDSj1u0me9R7hPareKB+XnWtb9RhnF68QofTr105EYMDFqTHTnZ9Ej
	z+U5IW0yDVuZX+sW/LGaPx9w83qpQpjT4nsLS9Xz4bGRZ557Gd70FRaKHAeL3OiHHMvNc4M9Gs+
	mK7PSiUDxbMUHLiMZIUepZ7WiJEf9Und/ZSqU/IGEpYiDjCFev+cxF396Q0olyQYPHzpS9DD8Ng
	I+AeRTovvb0zBlXACDzPSzjuIWSJ58hR6XUsJ1yx7LyoyQ1KCzxMIs3ji/KmUZEQGI5ZMuasgQ6
	AXt11pPzJDoRpy0bNDhBCHfflyY4dYeriOADMI7YJJvLA5Ab9SZByCMAYHLyPAfHHCDM8+yXrgW
	xsAghXk4bp/7aiScwFH4uD6ys=
X-Received: by 2002:a05:6a21:4383:b0:3e2:157f:681a with SMTP id adf61e73a8af0-3e913bc2b3cmr636168637.30.1793232966661;
        Wed, 28 Oct 2026 17:16:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:4383:b0:3e2:157f:681a with SMTP id adf61e73a8af0-3e913bc2b3cmr636154637.30.1793232966222;
        Wed, 28 Oct 2026 17:16:06 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm4508324a12.20.2026.10.28.17.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:16:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Soften no-firmware message
Date: Wed, 28 Oct 2026 17:16:00 -0700
Message-ID: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: B0DiorQBxy2J4grxgLlSNQ9FGZfgYsSV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwMCBTYWx0ZWRfX139uScff3Eq+
 PiXfHIQ20p2NtuKh35goA6k2WFGWUu8fU8KwfJY1Ydklm9a4jaNK0YzORwdgEIbm1ySKmfTS4EP
 pAEPcSChQxGnDcjB3MwzEq2vEcdjpKA=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae29047 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3K5eXpJ1Jj6lJJV-ZGAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: B0DiorQBxy2J4grxgLlSNQ9FGZfgYsSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwMCBTYWx0ZWRfX4JVo4LkWY2Ur
 cyCzcuQ1ZijiOyOX0Q56L1yJf6L0Dn9Mz4zVYdC4Rx6S26SZcu9FdVV3mTO65Ey9K9IfuP1FgZC
 uXZT0kMIXHyQumNgQb4k9xFjlnWbBJ/y66QcXvQ/7yi/H4lDTK5RwJSyLNAjdLzb9+JAMtoDePT
 sU1WJTWMI510rpYVFgXuXEwznXDn7UfuWc5XnfOZteZrXlK+hz4kJ2QnwkOwElJ51yn/OtQvS1G
 yYgMuhID2p3eT5sSCcoSz4+QITl3qUGsJz1vNVwkIzQLFn0WdLGwJr8cuJsdQttrC0d1HreEX4Y
 BNJgor/Gp47VliSg77S70s11edIpEGwSCNBcGpZcylCbHpGr98WA1YS6nu8GCriCFFrJ2pwRi77
 Jxs/3B+Po531SN3TQkjJ6Ye58k83srHKhvP3JW2xkZjOOfFEI/GTCwtbcJqM43xmGcWiue9zTJ7
 v+BwLEREjd28Gl3kB/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290000

It isn't _necessarily_ an error, the driver will try again each time the
device file is opened.  But if you don't have GPU fw in the initrd, you
end up seeing this error message at least once.  Which seems to confuse
users.  So try to re-word it slightly.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..6db6cb7eb287 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -558,7 +558,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 			adreno_gpu->fwloc = FW_LOCATION_NEW;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
+			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
 				newname, ret);
 			fw = ERR_PTR(ret);
 			goto out;
@@ -578,7 +578,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
+			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
 				fwname, ret);
 			fw = ERR_PTR(ret);
 			goto out;
@@ -599,14 +599,14 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 			adreno_gpu->fwloc = FW_LOCATION_HELPER;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
+			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
 				newname, ret);
 			fw = ERR_PTR(ret);
 			goto out;
 		}
 	}
 
-	DRM_DEV_ERROR(drm->dev, "failed to load %s\n", fwname);
+	DRM_DEV_INFO(drm->dev, "failed to load %s (will try again later)\n", fwname);
 	fw = ERR_PTR(-ENOENT);
 out:
 	kfree(newname);
-- 
2.56.0

