Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850953E0C4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277433; cv=none; b=Zsf4UXu8GW0CnNHmWqj/JVfTmkyG89igL7cmGa98kanMImkx21HWpImVPwnNw/F+LKdroUuE9OVLP58Z9tOhNYYut5EZxWt/BG7GbM26hv5Yv8rwidhHdccLzEO/7eAXZ1kbcBSIisbVgQBZnmm0MzwE+GtWs1q4mEG0zAEjtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277433; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWNAGKoOC5/Z2qQHORotW8KsJXNOejAYXaAjpiZl/K2w5qv9fAHrOKdave5uhwdCwAq9qwftTNgjh6QV/XRVFlb2u/FxmZG+vOuQVy7M1zIWbAGKrd+lMjK7C/HRGI9TGwByaJ3mBGzhSGMSvfUNSGSZcQQ2sJ1JlgOzh/YJ/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9JPLqxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6wZywP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9JPLqxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6wZywP+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQRt794281
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=O9JPLqxsZkCgr197
	M/tpqBmxSAADbhZYhHXVwD3wXMilrw3Fc3ZntwHY/F0coinkqs0D1n0Tu7zw01j/
	U/AGROZ3OBz+Q1x46l7zOboFq7A+e8u7mlxMi2KPpel/urKTPeLYDFb5pnHiOW2q
	ayQP1LY3oFawv/9rp7zBK51fkBLS91O/P325+7APznXmBbve7w41+29L5V9gQQeY
	gUtfBEvWjx64HJBl5x/PYBW8/4W/M9pJ3hjRoI9JMrj3/8EGT2OOZlATfxaOMTE1
	djsfnG0byTLCb6H3U6hfQ9HsT6bcZ0ulCzFV8fnojOHuooUGoyFlj0lM5IUooQ33
	vEK4CA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jve1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:37:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso155110131cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277430; x=1784882230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=c6wZywP+UUF4NoUVmzKC+O5fJ0O9ofKBqVzVQNKSz6FPBl2HyCHjxAoKst/dPo48ge
         JgBMnvF2xCCNPC3lgwKqWBLfTsDvAJMb+jmcDRvPzvdEjq7JJej9sR093OeTIPESRMY+
         BjUQVAn8QdDpP9aEfU92VLye18Iw+/uMDw27Tk0KqUnsBiYX6KGkjQM3tflpP18PeYfh
         iqJekypjd5PIYUtahCXKv3wbN2KcvyJosivY0nqZdGhQg6pfi6e0bNoLl65K4023p//b
         yF95AMoVROKZ+/P5HyvcKusVjF+28XDwj+gg+JhjiqjQsR5Uoi98br8y6qt9DId1ZNV6
         P4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277430; x=1784882230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=sjB16lNLdklivOor6aPjAElkzTBN6q1i95L1uCfXMv7/voOx+GFbhago8a0vXtmPQe
         0DFvGriz8o5MrU8ER00cqKjgeEMR2YKT/h/KvroHCRV/9Udaodfq2D0L8Mw0NbzAyKiB
         e8aLtMZn/fWEgJyAHVd+Dqav8CAZsYL7c6/lbTRk0QuwJNlUKzaYoueOnwO88GHyMe58
         O7L/9DAwATy5oMfzNH4RS97iGcpvjImG2y9lRSldwRFsi7dNioiS5PUv9N4vO5st5h35
         Iwk79WIOJDmG8Gn9NiY2S+UMiTSjLWAilVIaTk1gnHDv/6aUljCbIWO+wyCUAaffnY3g
         5x9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpE+ec8WKZfVaK7YLJeXOnuGu8Ig2vvSfEJ2n1kLrM/UBhbq+q13XASDVUkt+hd2DJ1JI7UPPILjo2zFeKV@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+3mVtXApkWgEuHcFd1Zw8BsYQ83gEOcwODZ9jutMsIDi13st
	UHlpUFU0BF6Zu2z60+v288gBlHsl9FHMjqfYH3pqjijGMBfbaWxXtr+ee7MGEAje8PU9E6M4Dng
	VHw5FICEhV/5WOF7m0XVm7UuZk/kMEAQw4/QInUCAZMFlaFEjaJXeKDtiS46vB2M/UJGa
X-Gm-Gg: AfdE7cmOffhVZMdkxZyBM3uf7J3B3HkQV+bTXWcsi/ybZz9QlMVLv2PDpv4oYmt+cHk
	QgYETFQKdz+0XWdQLDTB1p7nBvn6PA1phPd3DPRTwMrEZYR3zXtGBYdq79AJvWTZ19MVDTj2bMq
	w8s9UzZqn7AHXCaJHkhPmNfqpf5G6pDz6JGlTs7/QspNVfybkfC/xg3YMPrnJ8S3DaV9adqW4l+
	o6YVCxd3EuotcV1UWv5hQoIzfBhxsWbr2vv4LnJi8EaB4Tt4ELkpRaSp1cqFOtrveMSbImcVtQ1
	GVGuXvtK59KfqVVebHd13dvSR1IBSaFbBD4Uly4UaHB2xVKFV13Za1e97V3M0QxOhDf1BB1dpXs
	vMELGFp4jy09KOXU2kPaWP+94i8jzsQ==
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943361cf.46.1784277429600;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943321cf.46.1784277429116;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:34 +0200
Subject: [PATCH v22 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-8-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemd6cehoOTSgO5KMuQ6mnv8y35bchs1VbAIH
 /rdTqYrAteJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnQAKCRAFnS7L/zaE
 w7vND/9DxMXd0FXloN6YHYOW6Iw51rxkoLImPEgptMEsGc2uqcMLZrvk/mg7ZWygXJFnZjmEL44
 cceP2ouO6GzVURWecwAyquDtun93JntyCV4ZvcD737qZGhv36Xs4ZKolZbLpKOP8lXFxs69Lekg
 ud70LPwoYhBuOBA0wNw/wiaiIVyK9x8QwPvyGMwal27oisVsGw4tro9wneK75y5Wh2bBOsFsJoO
 Z3N78KsB0JCsMfKjTkq8cIdpOu3jgnZdxQdwMXQKk43sHATCzHWLfiFyhlmivLEaGdKg8w8p467
 PW/cjNI9/wxmjTVd/LxKLogNptkmTHi7lvV0oC7HkeZlkI6X7qKkBBMZK0IzRd3gEX5TPoZ8QAR
 TTlXbnVZ6WoEMmM2cpgbNWVL6igCGE6XlfsHJS4ySsyn5A7X4CcgrytCW3KMtUMpmaOLRAxplT4
 mvQ9h/eA7Z/OrhTuk97AQbrVX+j2vLp50BHgrvQYAREPx1UdO7JR/3k/IkX1fdbpTpUaMEtgFT/
 uxuYYlivYgZXGx1ElH9NtNtEH+zYx8CWaezhWCTXz1cxBjMAANRULiQCTmYIa1Csie9jjst9gkz
 zIrXJ5q8UU+cleRDwV6R17pW2YCdNIEIEAx+IAgr09iCmTwRZx6m3CnrWlgqfQcPcRzaYcAFhkk
 uqpAA5FXfTRmagw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0Y2pPTvC179UhF5kMBe7IuqacdEWF2Np
X-Proofpoint-ORIG-GUID: 0Y2pPTvC179UhF5kMBe7IuqacdEWF2Np
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX3yo/RvYekBbE
 c7zo0PvDh2568jrCrVDRls0L8BThztzfMb5L4upVAps4/vMJdRqtPjhLOsxsQ2kJv429kpLl29G
 s9g8rrUAlb2Fc3CEL2mYiY75tFUh3mY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX1HY3BC5q6bS2
 d9di1cODheVpmpYl0YrKxiD83eDt920Kl8pGuXKrE7C9uK3IZC6FXk1JlAli9G730VQtrBtlfDY
 qjiyIScvB3nWhAbukgbwX10Yi96i5iI572L0UQKHXA4CtFVo3brOhFwHx2zpsu0/1b25b7qFDD7
 G0RgI9fzkNP3+DlvhqBL5Ff9d08e8le1FWn7hs+gs6vXyKNQCdsmdGrpTSTxMsv2mLwhNOh+hJI
 r6DJgn6AObHqD1+MXE0X06Ls8O2g5zAZy6qHj57BCMr601qeHl0klMds1/i/dXuuWvRsXiL3x/r
 zfnYC4w8ct9AEFU6MFAVfWlIna/qObbL1idctY2sKzzDDhhK8pAWZuH/6WClgEmxPzzeiEvgk4o
 UfOWhMKBACWCpDaFh5kLPq7NbhFGLqW4DQr/G3NcgTQYh0UE//PmvoX6a6HT4cqPhD1Gt36L0bi
 XM5KFfOfMn9A7ErDYXA==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59e9b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b52a26ffff5ee733adcf4e8cf8bef75018dfa63e..dd860435d2c47a608c82cc2686583a44ff96c889 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3

