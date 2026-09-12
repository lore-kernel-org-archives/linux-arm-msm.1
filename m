Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638938C415
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225769; cv=none; b=sDTaOppiLZ0Ih/NBCV2wjOiICDQguMC06w42Xsd8AOrcwPyQRs4VVDKA1Lzpdrio+6cZ/+tNdaFG5tcbTN81jGCJ93JZhLj3Zs2dilJZHexWaZQ3ukbRx8WRq8MLQNuRMQHcMXIRd5b0X1MvhBh86kN4unxXmE6oYeZTjn1bSqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225769; c=relaxed/simple;
	bh=E+pgQfat9DwTCUXUsfDAxoX0Sb4N2yvLcFrtGR2PfNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDrFlEQSdgjsYsJXbRyWcvL1Q+L5EpllhatEVT1+Jke5eLyEVS+c4K3AHRE6UZuj9JfS1B1DTSzWoTtL0KcuUyjtpMhykwsPXCVNJfhFmumvA5E54bLyKI1ULmK5FS7wuTDiGt4YLhvJDiPV7xie50nURah061TdykhjWXgBPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT0/FNeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0FAgUA+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT0/FNeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0FAgUA+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe6Hx2607812
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y86yJvxE2YzZDSDBzkxgu7LIWB5oUTdTWrV
	QFoYNlZk=; b=TT0/FNeN1dsS79JksacI3EvHp0CovXEJEt6QGB7lEjvOWzxQqpl
	Gl/8W1SzHH18cQ4ymfen7V/dJUesODf0zWAlg4elwA4xH6ZkijtfNeQ/eTQ3MRXD
	soJNgh4mTEVbzY2WvZOLnAQmh02srKNypq9b7Hhdr6CWdPTc/jDO+2qV2Au0QINt
	hXLlcH2/i6BozM/eFtfNkk7p3tu3NhMbxzt4BgMoGYvvbAknCgBIQ+6myYRP/Z1O
	LjodWYLxbSpgr41gBaEFsYNfYAAdwofSWkkkZGReAzjHqCB8bwL6pBS078hAaXCh
	BaRh1ASLbHaHaeZYZUGk5F1PC4kn03pwuCw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c972v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:09:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1498752a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789225761; x=1789830561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y86yJvxE2YzZDSDBzkxgu7LIWB5oUTdTWrVQFoYNlZk=;
        b=H0FAgUA+NMaXKbsgIqDVdCnDU/EdBXyM7jeUfd1lNb55WAvISNLfCAM0a1TRsTK3Oz
         6XRjhM+rwy7a59bAYXVemTJqwgIilLZxa8iDSVtuGBoV0ZgsNcnGG4pggy3V5SDqkoI6
         3DDMq+1+kP8szItN9nKpDG6FiOQbICY+W/nsOE7oifw/ny7g3+nmduavChlG0Z58OSIf
         VXu0dJERzwyFNWQru4zrsRpXv1myMVe+gPmJSfewi/Ps9CVWT5SibOtYfSuPJKPYDmIO
         lb8lkueZc3HwpORilQuCm1IMBzM8vdiS8o0Z+b6TCY7RyVkeH6oRnTzXgT/huPT9LcWt
         sK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225761; x=1789830561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y86yJvxE2YzZDSDBzkxgu7LIWB5oUTdTWrVQFoYNlZk=;
        b=VjGR4FGntgq1XC/DLHslbhIt3zF5qgVPMaN/25ZEOfbJaaYu6/fpuAh9KJw8Dl4K0D
         vyinGgVqVWOrJlerqKPnqDujJwEmro4GGMRSR7IuNr9zRDkB8qaN3trhWAiUe8MDT74+
         16hi6yk2X8IhpKpmt7J7ATfXvfNcVBEI6Sv13e0BS566QSZ44Vg8mZ7fK9jxhJa6l2uw
         dL01vWyBWFqd3EvhgpDocwi6aq4GY33BfyI88ew1iATQJEEbFojJmZ+Dwb9uHp0ELzv1
         NPIOiYdloVRND8bKQ/taDjQwkH3QL+rCJa2olYYVlrdhleq4FKzNXTK7+Pc4pJ17VMrj
         1KNw==
X-Forwarded-Encrypted: i=1; AKwUvBwPlniyl+Ov0COzbc9LsEPgTBUIetBgRGf/Au/rCtmBMMLbC4MLQaSTwhdG3pF4CSWNZI7ENiCC2YqJriD4@vger.kernel.org
X-Gm-Message-State: AFuF++nojLmaIp2CVDHataNqSeWKYWI3iS1JNpU1sFs+82cpgQMSNfSJ
	eNFWCOmY1+jKkcYJdM7hisW8Bg2Wd4150LpXfaNJFcAQlGlE6PqNqePSSr7rXZwWdSMjy5ojnXR
	X2nCkUAg5+eXF8BKgRgqsKi+6BIGEiysBEOc/GYIo3oBD81nj0eL2t7MP8vm5lKuQt+1M
X-Gm-Gg: AYBFou1+chQcCaQU3v5gVIesgw7L57mYhDN0brrw7gUogF05GL+k7So3E75mz0ChwlC
	NtdrFLOR3UfDH3rRRmNDwHaSfdCIJ8xZZbz2ULCwtnTTEGWH3m2UPcyQJNEo59UXBPavXRSYIqH
	L82LPZ/D3ZBXwmmesK46Jv8PiBjSFsqkZWY37rG1fKbmwUPaaCFJu3nrwkrnorBzDxFQyUmv3aR
	q/IQOuVidXIDqTHQUkqk0LUzZ29+ZzMnXeUCipEl+WPXBSyAglGz5UkPOOkB5zuczRwGsi4LpvR
	zCBkKv9VnNvj1B4Y18pXoisXXfVuu1Z2dFa2yIY5fsy8faMiz+5/DYSAsliU9FN/5IIkTU/1zlh
	pHkPRhk/+nMxkevQ/eXCAK/ALwIlUVGwFPuFxxq9glCZfP8I=
X-Received: by 2002:a05:6a21:6016:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3daecb013demr18650584637.0.1789225760844;
        Sat, 12 Sep 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6016:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3daecb013demr18650511637.0.1789225760410;
        Sat, 12 Sep 2026 08:09:20 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6549d95sm2564095a12.12.2026.09.12.08.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:09:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Greg Ociepka <greg@ferrisoft.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Increase GMU FW init timeout
Date: Sat, 12 Sep 2026 08:09:14 -0700
Message-ID: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eMLkEK1Yf8-Cr0Yr012dunJYwjN33jOS
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa56b21 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8lTVeMJbxB4f0FvlbnAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMCBTYWx0ZWRfXxb4urj0Mqle/
 YXtWfnn5fNv24oaQ04GYBZFFXNwT2MCsGLKPyhoYkUcBHPhn5J9OCuMLbWyvVBUqFjkPNT2wyv5
 I4Ge1c4OkqzAKGhTnoHHQEpNi3DrAMo=
X-Proofpoint-ORIG-GUID: eMLkEK1Yf8-Cr0Yr012dunJYwjN33jOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMCBTYWx0ZWRfXyIOKbRDhFrK9
 6tIZ0P9i3UcTqDXjdoPYC1D9y2QMEwzSjpXdRTT1jLqky48Rjf08OkUQ6R7SgQmHra5kZGFZ555
 aYU/Gd8rDbds4kEhT5h1vOx8JJYBhhnU3CyttHknHSpDkJUhuC+nvhzGNV3VM3xFRWg6k5Wy3k3
 SmGRQ1+c7WOKLTy5Vn7QuYgQDdq5rN6uoHJDzyO7giuTJtslP3fCmujn3CAo0We5KEYAjgcTNn9
 WOs9F7XRs1mOQMlvFOdywZCjj9Zh8oRNebIdHt7nXLM96W+yD5kTkrfXu35Y2QfnnEnuDn3MFpV
 o+bJLO9AtMPo0lOSMkSJpAO9FHdhk+Js2mRcqGcgf5Q1pQ2nVM9gV0NsQ6dWOuzh1lDkl7WOd5f
 tNIbEm0t4+184Et/bgFSY67mwzySWz9ajMR7i/79mInw2KhmqKy62HHo/B69XWrU8dFRLw9nTgs
 FGKvkGLjs1NVs46uNTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120220

We were using 10ms, kgsl uses 100ms.  In practice it is usually takes
less than 10ms, but very occasionally goes a bit above 10ms, leading to
a "GMU firmware inialization timed out", from which point things go
south.

There are probably some things that could be done to speed up init, like
increasing GMU freq.  But to be safe, increase the timeout to match
kgsl.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2170bf7bb045..9290010c8cdd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -320,7 +320,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
-		(val & mask) == reset_val, 100, 10000);
+		(val & mask) == reset_val, 100, 100000);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
-- 
2.55.0

