Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F1346E5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321361; cv=none; b=o2jkfTpK4D5lRWvkwDUd502Ii43w5azmLBNwEZkNRRGKn9VaSL1sLVxwEFu9gBVi0dnY3/wQX39H/ZEPBQ/z1xZWWNqTCjVRmEHexZcwD9EYX488IlOmiFno5+KPL7E/ebyUaKfpBNDZmEN/+awi3k7E7ShR+SiPSuh3d9JQ/yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321361; c=relaxed/simple;
	bh=103H7sjaSqTLQYEjwkqUKVVhu8LNhT7rrbQpAMFnKcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgYY5TpV+SSkeeT0kEWI/KIPRTluVblL8+1Ypa65VGa5AlCA7rHgjv6R/IsjzABYN2U6dIwfJva5sZR9dMgopCBq8fVdGrTGke/fuLihV4qHpukeeWtvUioW3CGEZhcEP7BwK8gAfv8vmjDdWyFN+01w7gzESd793cJMnsOCyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXFU0Md6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USGDIX/U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXFU0Md6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USGDIX/U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtYlA2906427
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DA8G+ZNQJ0z
	SGZowFGnb3Omh257suiDVTqWi0Dh6qc0=; b=iXFU0Md6AWKczwyfoJ68sdt19ip
	tD9k8pVmC86cWT1lbsw5xmX+LvyUPHYbmFO9LGx4NsqEtvkFuHWoGaY8lblbBxQn
	AJlJck5MWs3FuenDV10Rjp14Z0mEUUuymcQCxuUnowcHeUTbzcDtRW2Ujyf98WxL
	wryhSSbGJ/gkq8A61Vp3gEWyiTgtsIeh3i1ZOj4s/70/M+auSrk9Vc5ZJkXsYEtk
	PVDGInK3cF8dx4/QNfMYS6Tt65uvUc4Mh9GVSz6mVLtrK6nh8cmu2bCybFBo+imP
	j00i+tvWx9HxLAeRIJlYUzH4PF/m1smTuTumTapsVEyNZJn0fqII59+2mFg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq8rew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso19353123a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321348; x=1784926148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DA8G+ZNQJ0zSGZowFGnb3Omh257suiDVTqWi0Dh6qc0=;
        b=USGDIX/UFggrWthZdw1TciPR6+o0xn7xEbg6qFURsW3JppHA+AL2tTHXEWQ0O8reLw
         QRnTlLrR1Kn83zkB22FuLpc9FbBg1wu4HjY7RYRqWs2KbU7wZjqLMAPkUj7/m+yYnCpc
         HhyC+G6D60wBp9QcPc0EWWUlXCxcp3y6k8V++lcfP1fqPM6OtgTBfmNp5tko+6pmjAz7
         D8r9c2VxEb4F37islMiJTIoVb0S1F6POkOm5dyrJ3vaTQYxvFJT/N8TPf6v8hsQSuTzH
         EoF1UPePZWHBIYpZ0p6k73ZIywUa5zwR0ZayvXNWt/XdKIT3gcFaHeGs4C4tW8z9Tdnx
         JjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321348; x=1784926148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DA8G+ZNQJ0zSGZowFGnb3Omh257suiDVTqWi0Dh6qc0=;
        b=FT+xnL+peA90FsdPdkx/mU0P5aiwN8b5k94+i+sm9cVwP8LhmfybU14QI82/TpOPFl
         28Ka7iIC4e75PLd4CXmhl5GSwbzGSDb9qDlqtwjzIvQshjjw7cIoydpsawJGNAU19GLy
         tclI7OKUYi9TNEs8sfKDjVo/vNvrxmga5Cg4nDdtpO89qOfHC3mykwTknOMZLoNnKZ2a
         yfDJfJUaDQtWs2tiayahhv7WYz2FApeCeGygiKjO5TnFBYZfPl6aacYvV4oNwgoliC6n
         Wpnt8/Dcm2CUwVTYlToYtjiGVGfMrOIib+7pGIdwUXuuh8ppp9oUZqLBqAX8zGpTXdf1
         bo+w==
X-Gm-Message-State: AOJu0Yxic/hLK158pcU2KesR4eS6JVfKLY1minqU1H8Rpr6y84mBmcY2
	2HN9l6YVTkU9YrrGOffQdQ3raFkq1C0LHXkJD4cnV++TrZqG2hEES0CknDvf6iggyKnyZk3WBmP
	H/y5HgANP+ROE2XwhUaMPKzbszHBq034scsu7FkvwIWzmvxTf7cuUC2iccEDKJY78dnsr
X-Gm-Gg: AfdE7ck9zEH1xQPIn9BIKa5WrsWgI0mciHMZfSXwHR/m8/31da3UJbVKNkBECvGgjGn
	z03QMMJN6YbS1mDEzo2d0oRjMonBypuqrI0vj/NCvxPI7pkux/Xm+ZINR7jBBQDcAlmazqy08KB
	lGioKst/Vaii6cdHqnQI5QmRzSNbTuk9FbUeZlMI9pn/TbcBvvYCCU4vHL8PGBe/CAXAFWcniy0
	GcJjT36RSnapkE2bJ96fuIxngaqi3Xc9qTAuJNafNUfPiOw4iwJJZyuaVHt/zwI2trFaCCZi4on
	LCWIYjgpqtC5/rsx8TgQzPHEtBLAJeUets2gUCWPcyom96bA4Vgektn+ty/Mtj43X09kWCDzQsd
	qtt95tP2jl0PJEHubTeRkUMxUjUByf2eEuM98+xzQamlApJI=
X-Received: by 2002:a05:6a20:258d:b0:3c0:9c19:65bd with SMTP id adf61e73a8af0-3c3adab057cmr4905226637.69.1784321348244;
        Fri, 17 Jul 2026 13:49:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:258d:b0:3c0:9c19:65bd with SMTP id adf61e73a8af0-3c3adab057cmr4905196637.69.1784321347805;
        Fri, 17 Jul 2026 13:49:07 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb51a2c2a13sm1338524a12.31.2026.07.17.13.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:07 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 12/16] drm/msm/gem: Validate lazy VM in GEM_NEW
Date: Fri, 17 Jul 2026 13:48:28 -0700
Message-ID: <20260717204841.26120-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX4f3Cfy9JseBn
 aRsLT+6CcCL54PMp9mBTg4i8/QXMq699vcNP4BKTLCFvTEBteMkFTQe0FnaeUVMRl2nyPOpF0va
 cgj9CPGJCDnrHvxMm2sTBOoVGxTaoGA=
X-Proofpoint-ORIG-GUID: SbBeI92mNwDvii3POgd77khcNXmW6XiK
X-Proofpoint-GUID: SbBeI92mNwDvii3POgd77khcNXmW6XiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX9qJAEgyqOHuH
 fdStBwW6kSjqiRxSJCuPcititqdvIx+uTBU5lLNNsvp4YM3vjvQBIZAbDWAix8K+4/v4S8/tcoY
 692z4BRqw5z+T7YU2ODOmN/FYJsv8W57xzyWh+1/jWnx0S9NLOwwZltyFgK0zxch6Fe8nltUAzH
 XEpnpu7yMeSeMaT3gu6h49h6F7PgckYJhh/3s44MM2hPL1OScL7TtPWl1Cm0LXgRjHum4/T1yJ4
 kZCpBJn0OrLJVEHKNSYajSKLvhXBF93DQe97tsPYonu3Tn3Qk7PsKKYPTUYVGHAy6xkDEq5K2a/
 Mi/utRfLM7SFnfPdb5CuQs7WCOaSc81AFr+woEhDpOlfF1lRGWb3dGZZAeAH91DAqjit/NLFhGM
 Pz08DLHq5LxIYmOTcv5deAnkkCyWP7MeXNPzP6tg/mFQsP6KyA23P33y212zUHJi5H83XLvEr+b
 WYcobH5FJJVHMNZhlKg==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a9545 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VGCgC6sU4evaG-_1UnEA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cb00bdf21ef6..153a4e4a916c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1138,9 +1138,13 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	int ret;
 
 	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_drm_private *priv = dev->dev_private;
 		struct msm_context *ctx = file->driver_priv;
 		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 
+		if (!priv->gpu || !vm)
+			return UERR(EINVAL, dev, "not supported with shared VM");
+
 		r_obj = drm_gpuvm_resv_obj(vm);
 	}
 
-- 
2.55.0

