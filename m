Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852E4F4CF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775419; cv=none; b=f/wfoTEBrLsJRMB3ygzZsu4KfB3XiMYuCyxObJ9TwFJvmEireUUsQkdicAE8Vdt6LrFBESipTydlZ/TkMvck5S/eWEEEIgNaPtoNGZHu/IUlKFpjOR+BBUpdCTueexFUfZRvYlOazV6zOVFFj6PCFG2kIC1lFqydxwtfUp1ey9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775419; c=relaxed/simple;
	bh=3dR/KfgUpEPFYcvKE82HaOvSnzW5RQTXUlnPfU4rkJI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PMiLkOLrC2pbkUqIMLT1c619vHhvaERXXxiYGzn209nDls1vRjzp5isxegN6FIIp8SUvbeZdq1zTIHKIWlOW3tL1iTsjUoGR9mmFjtKUNR63fio18N4VhHsgrRdUq6odhHttw/2g3099ELiPnDhhxZaTqcedrvtzZ0AjaT3x/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRaBZb7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu+xZkdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRaBZb7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu+xZkdg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7iJr2678455
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jCcy0+dmxhjISV1WNXx+vo
	E3LvhshC75PT+Ka3ytGgQ=; b=gRaBZb7cNO2Q8yMKeQOfdaLS2+UVK1A/5KLuyo
	uoN4mGRQoDo+3UhHjvdZmNHnkRzQGylX5Sf7eH5ktzxXXTRhJzznUf3pPjqOu1ZQ
	nlFf7MZIRR6gvyHKqCFUWuqXAHbOonJlX4qTvwDTHhVSsNR/hFJbyOsNsFpqxcnM
	M2w4hFwY4LFPjuV1vSm4210q93Ti1GPFOQjhIY32XfC///iY698eQTa7KeYDOGJG
	y7YQgonSqof4p+W25U0goJIzvnWUaKZBVn5wnWaTCxJXE13Q4sUv84VEV6RrnDUn
	x7jv+Ev9iqzzoZ1cpZIm+6QLl2wLBXV2yTYkS3LyCH5SSr5Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjjs6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:36:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5cfa3804d81so3699860e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775410; x=1791380210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCcy0+dmxhjISV1WNXx+voE3LvhshC75PT+Ka3ytGgQ=;
        b=Bu+xZkdgt52MpEzaGPz9c6gAuJ48Uh22+A/d+cbf64l7MhVcHAa88u6JCBhIja4qfG
         x0DTbUytvKdnKNESpM25A8ubDsClQhnfIxoVOe7Hda/rFemyiGn1x72Tj8lalHyko0sW
         3CL2Ktss9OZ+gv7DNbOLd6IbrY0LBDlq5S+kNykM3hB25t6T4+kdv1vlciXDUPhljULF
         yJybzKoR9vNySD3/qq9j1ECI4Fpq4bWeM0u56ZShyC+opQg039glZYIAViI64L1M5ttA
         bku7UPqh3WKiVHD8lpWCObMzK2lCFI/7fpAX7jCMTWYzb5Ac3NthLkF7jOxPhplvRxUm
         6Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775410; x=1791380210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCcy0+dmxhjISV1WNXx+voE3LvhshC75PT+Ka3ytGgQ=;
        b=oLRaNWLBxwtqM4gddDYfufbAIgx/7REk2G+n/IHoViNq9kTbD5luXrxqJjrtT0k06C
         UzaZ0q5hLKz73H6luRscfxfFYqlwJaKruWKUBnsvGbeolL3QI0uLVE1I3dy2pWpufjO2
         uP9aDvqU/QLccIy0Y2JqP5NTXHivkEi3aVHiX3y4szJj6ukH4VAtDBlU/mmiAy4bXLNe
         Y1SASUxrUcRfDZxh702KhZZaR/eF9c64QAFOyMew1srv8oQ6u3wlYyLKpYHQV7lwdG9H
         1CoHhMHnB2GJCp4dWygdT/gMf1baL2Fz9DbnATGARnCpesMCQIxJz0GyVFjd/YpAPWgb
         KHTg==
X-Gm-Message-State: AFq9FYIOOjoSHGW1DNle4Yl1m+0jrUu2S/bH6W2OeG6V6MfW8kJMUtNb
	SLj4PlqDcEDfftPZl7AAOr+ZITfVwjzfMu27wYIeDzAWKzGbtqXdmTZRuHYogiDX5SAXsdxe2SW
	2jotkEQGgqMTKvFaoPASyyIDlV2dI9JBEGwd1d02/Rvloh8/B6s5nABUy2AIJGv8lDkcYUHmsn5
	es
X-Gm-Gg: AYBFou2zaSnN6mQpI47/DQWZRkEJa+cxNbTzpsr5dx3RNAZzu3sMG5rN3e0jkDORsBG
	Vr/4e7qbIq1kXGWqWuHgTwPLbVp/6DMNc6W+sPXvuD1e7iTkqt+XAfCb6XBgP10H4AtTx+SB/SJ
	sE7ptu4qCI8GwTg+wbJ78YmkTnfTB3p8h9fNNBuijxwszkoPHT/ewhxAtgApmhVgD1BSOzjhIsr
	Rz3gGpuofaQkWG1GWCvsOhYQTVnQVQwc7IbMMhwEAvUAf8zIhGNBYFY3OqAK8zCxipsu2XJfm3N
	tzS9FCrus4QSqyvBWwi1GEcISLIt52dn4qBn5OR2bNCp8dOhIibLrktoZnjIQcUSjdO+4o5986p
	sQ7Lgib3mFq4xeYJOCx/WJpaqW0H5axZFi9LsogiOKgAgbsXHVSeJvJckWEkGRQ7iulexPwKO0Q
	==
X-Received: by 2002:a05:6102:3faa:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7be7359628amr353687137.16.1790775409764;
        Wed, 30 Sep 2026 06:36:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3faa:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7be7359628amr353675137.16.1790775409340;
        Wed, 30 Sep 2026 06:36:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/adreno: implement progress handlers for
 a2xx, a3xx and a5xx
Date: Wed, 30 Sep 2026 16:36:45 +0300
Message-Id: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0QvWoC/3WNyw6CMBREf4V0bUmphoIr/8Ow6OMCNULxXmg0h
 H+34NrNJCeZObMyAvRA7JqtDCF68mFMIE8Zs70eO+DeJWZSyFLUUnHtEMbAJwwdAhGvVFtLJ6r
 irEqWVhNC69+H8d78mBbzADvvmr3Re5oDfo7LWOy9//ZYcMFbYYxxpb5oq26BKH8t+mnDMOQpW
 LNt2xfkBoICxwAAAA==
X-Change-ID: 20260927-adreno-progress-87f92d081376
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3dR/KfgUpEPFYcvKE82HaOvSnzW5RQTXUlnPfU4rkJI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqvRBvLdp95flAy/wXj980CxWYHYmmHg8wg0DnC
 1qCILkwLlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCar0QbwAKCRCLPIo+Aiko
 1WjdB/9a9/EIt2tdonXcYgC5QsegQiRulxNTgr6GIb3sA+XqbPGE8Elag50kvkfFaY4y+C62pw0
 9jTOpV/RsnNMQgyW772EoOjsfgH06w3b7JNWNDkqvTqmM89+WaZAnQ+327HT+vZofHCz6WCKTj5
 XiFk5cDdo+oRshKKpOfcfYnb9ClUiQJEjG2PELGmkJ21sk+1ZanHaPK9NAXXlgc8oix7xe8cize
 D2CMK8Q7ISdJQJXojkUEJSnsTa/61WFKD9YA0U7vhhF6UDxqtHpq2OfVzJSoES4mpygsjCFvA3g
 U/9VKw/94Git12w8EQ7zt1lp7ausouZPBkjDgH0IwKz0WWiz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfXw492tQAVFQxy
 CYR6Gs9rjMNlsastl1eHETbCVC34CuIY/iBIcak4Bqc0j5EJxMu6gxrvVekMq8Vr5BMgQGXcgmj
 FvStkIiIhMgR2Vf1X76/WNaMwbcNB9Y=
X-Proofpoint-GUID: mLF7UaZFkPhcWpYcP9LUKCvBTPNVx-Ch
X-Proofpoint-ORIG-GUID: mLF7UaZFkPhcWpYcP9LUKCvBTPNVx-Ch
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd1073 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Kk7049moo6jdYbzpDncA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX2L492ncQiF5e
 634iR6rNm5N4ZC9f9CCnUxxL2YAR3xgK0iNl4/5Iouf2JTD6NiN0faWkK3dmObKbQ7O45+jqMFi
 S0WQzsR/qlfZc22fMVakj8Ww8za+h9dSmuj+Sh3IekYa7WDuH4WVhJN832cyuVNMXCg/LvxVFgn
 91XfXVg4Bguw/xCYbHG7vAMxcVmz8wGnzW0zzRu3CBJ0fiAP3HU30WBa5h4NdEbEA0yLNxwqr5X
 FhhMQ3GPSEdGTZ/IFCNy+dcV8wusGFv9wihwQGjg2lF0LlmT+GU+KEcZ+kF2YQ28i1Gmc1PxeXv
 SzAP92Pd/4vhx9butfNthlVYQwyD3QVNhZajRRDVKF14Nhka8siYJmkHPjtggaM+IQIg3jy8Spp
 D3vUGGLUPwxt30KBqWZpwVuRPWHiMSA9NWwWtz+f7BMgAVvIIM40Yhl9qq8NTg5S3XguJ6IMnPv
 AA0FBzhMSUU9j5FpwVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300054

Adreno A2xx, A3xx and A5xx don't have progress callbacks, so any submit
still running when the hangcheck timer expires is declared hung, and long
compute or drawing dispatches are reset while still making progress.

Implement a2xx_progress(), a3xx_progress() and a5xx_progress() callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added a matching progress callback for a2xx (new patch 1).
- Link to v1: https://patch.msgid.link/20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/a2xx: Add hangcheck progress detection
      drm/msm/a3xx: Add hangcheck progress detection
      drm/msm/a5xx: Add hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  2 ++
 4 files changed, 65 insertions(+)
---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260927-adreno-progress-87f92d081376

Best regards,
--  
With best wishes
Dmitry

