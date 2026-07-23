Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03D4734EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826613; cv=none; b=Y00R8RN9E9BAG+uSM7v4VPhBCiqqVGmgNJ+VmSiJRPbyemko+Jg4jxbKhiAkD7fKYhetiNe+Ta/iWacace+0bqQdreNRi/GDhryozduBVl8iNdzSdEnjshKQFc7MunIEpwi5ziK8b5A7UNqCRtTF/7mEryLtIyVUdm/1O72dMkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826613; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uztqs1aXw3LaAbbhSfFOKa18BQzFRh2eOXj13UpAvGwA4TEOgmnSA+USghLl18Mt8JsUUJhIWjnHMSNFI08z69iTN8tfp4qmLh3+32IqGdxT86Z9UrSEIc1pF9fvqam6Sk9icLDwrzPPdT5CynfKlWIXjeMrnFiztNmU5bYD7XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7Lxjbnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTpoZalI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7Lxjbnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTpoZalI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF9h8L163324
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=B7LxjbnmkxUZXHF0
	L0C07w/pnWCQsRcnPxj9APVQJ+cvacENCp3pCXw7Dt7Ux0JhwCOHFJzkHK3r92rp
	PcycRnBC77OII2w4x+ZZ0Li6A4CKu4fxNbfu+u5pOvCXuj5DQTyJGpYekhqi5H+t
	9bcYyDHzP46wL66IegPdjou2M0wnDb9t/OnEp1mu+3uKUix5D6uWsVCmQDA/ES4R
	5b+/2+DPxTPdrUCwUPT8UE/ZfEScuAOH0djAar9BqaDLfenfTkgT4JJl8Dpx5BDk
	2puWi0UbS3j1tc0qBhrI5rtDjBiW560Q5Pl2EYuIOpUgJoYG12VCa8Z3Se7evwJ2
	yd8xFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmgnbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:09:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so22572321cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826597; x=1785431397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=PTpoZalIDNKn7dCVB9MjSfLKy9iHf8JVMVi6c4EMhrrPuXYY+W4WSSJYPr0HDNcYfT
         diRfbjE1mcGSlXig4SjM3DIPQQ1JTBGDGLMshYsnLkC1rcasoNBprwSidQdX9omMjB0N
         G4jsTHnee+4gMAKoowT+OdpdS611rF0HmQgPJB2K+9F93U610AY17uMGZK0o/52E4nlC
         USTfeDgEwCLGKnYMI1MrR26VPFT2MFdJW/+a0xoZSHyIfeUGbtwqSU755e1rFrifkWqb
         YcMTfjxfC/G5xAFODdlXsyK23Kt2ZTP13E31LV7GF0IfUO74qVrkm1NCTlRsQ4lNz7kZ
         fH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826597; x=1785431397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=BBpw4mrYLfvBBTPzzE1U0GclUMTeW/n9qR0bQ3/25FADm/7q8ROcYs2Lrl9HA/nYuz
         TquKR6/gUHJvyzWVVbSls4CMzaPA2RKw909DAPatJTFZd1XksPLr2+pLalTIYAkEwzil
         JBf/LzVjxjMmR4uBSgukgkT5jaKc7Ein4JwuDTlifGsyc70bdY97tNaHLKLnYblHL+c/
         IbHh82lnIJIdOMsBVz7rLBS+cAVHpN2A3Y3bwi/9uFo15r3AltJkYUIAOJmjXgNYZy13
         YMdfHBwO0CpFDm292hRm6DqGsoGgzUCZGuifmz3ieeOqveHfdfpuoPICRcuSsdrSfHDz
         4Yjw==
X-Forwarded-Encrypted: i=1; AHgh+Rpss8iBD+YPYetbtMFldDCuGFMTtFkR8FqeyWewaF8tw9WRIFnRBdKZKAL1JqthcCXwxsiWpVR2jy4CvoA0@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKAO3011PmYmoK0EKlcYzfuF91jL8qm/EPZpkWs2ybg46KlZr
	ItOPFUmm2tVtcTJkTRGHJbzIu+K7Z8AE5iFjjpddATmK8RsjhNgQzVKVcNYW2m/V8k08qs9+OJ7
	1AOEq1g6PFoi7X/9Jp1xvr8Wb+EzrHkpNFID1t8a1odyE6BuBW1sVeFEdmGjt9Pd/Tksj
X-Gm-Gg: AR+sD10yDz+dU+0NplrkuX1ynr7MbmduX+ooxlVe7W3S40qGJTqmbu1nE+nM8ia7d3y
	brCFsgxWjdzQijmzliIm8zN9OQu7wWZgoJgod7kiPHdEX8ay2u1xZ0OBKsAHM2Lk/7uCW9gLMBm
	zxU2s7FNSAjcYd4BAbQTj7TD0+Slosqo9iMZKAueREtZTSr3Hm5G/jioRqR4O8CVFTz6ghGxRyL
	SCPGiDX2c8ybjbp+ZVg+gBXnHmmQcKJmFzZk1v0qJYZ9CZ031OJC4eZgs55s2QU4ZPeCH9/5L0G
	CrffMAOiGnfEtcDRR4Sckj6wmY1UBkE+6SnaxU92yzKShWAg0my/JJBDwElHK2jSXB3ShHr1RSH
	ym6z56NAEg1DtrewqopBnKUmfpQKZ
X-Received: by 2002:a05:622a:386:b0:51c:f3:34df with SMTP id d75a77b69052e-5283ddf7e49mr38796641cf.30.1784826596638;
        Thu, 23 Jul 2026 10:09:56 -0700 (PDT)
X-Received: by 2002:a05:622a:386:b0:51c:f3:34df with SMTP id d75a77b69052e-5283ddf7e49mr38796041cf.30.1784826596112;
        Thu, 23 Jul 2026 10:09:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:14 +0200
Subject: [PATCH v24 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-8-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrG0VLs+VISSBWfLayx/0GnGbzVv/3UnOYeu
 At3Nys1tmOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKxgAKCRAFnS7L/zaE
 w1E5D/wOKIYx6yDd8LZ32i8TxjBbQHNdN9m1zJ8Yao3Roa38cxzQJEB1eI2zUMduHnYBaeu9tg4
 VKbKKPrK7byHWwNRhin/x8eYccQvhXXEijM7yWACZ1pJw9V4QRz+c9nM/Y2NgXXP3J0peax7wk1
 VEy3rcgfFR6ObVQI+AZR4A92sndpV3IaqIWjsFRTqjYJ6hnbhBm4cVgof6xHq4yY8+FkQcFS+0V
 Sb1Qv5ill/33pVV6WXzYfbv63h84gFSFbqm9Sx9za6+DWJLWJ1+PAtl0BU02+lG5mRFMhHi4UcY
 gMXVkAVFRQBE3BQlb4+8EZZUqT9tluw1upXIeH94iEYDCRitcD6A8+UlNVpzTrKjWs8h8VCqHQT
 fqiQrLQNSmyeEWL3ZtDSF4jXh1pwwpEXiRkYVqskDZ9ZaDIgp/PKyP1txTzjjsSsImUsXXGzygz
 evA9OqUVc8f68cdl+fMl+XtT0Kdn65NPeZE2FVIDo8KffMNHjIOJzKKFAO5HsVk8fZAhRzkFDtC
 mKH+OWiB7CINj3E6/YWyZ6igQ4Lssq6xUe0pl357qphKcYM3rJzOXeo3LxDF9EMPaIKCbjzjLrX
 vMU9OL9rpqPg41NJRPD1OvQ9e7aBowndyXwNGgE7ANqSOfrn1xGEZC3ZBPF1PLRQwDDgia66UFo
 SH+lyo5j032fUZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a624ae5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8pY9u7dzFVpO9qM7y5y6ye-bn_-hyF8G
X-Proofpoint-GUID: 8pY9u7dzFVpO9qM7y5y6ye-bn_-hyF8G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX6oYPdf0FQAam
 hY43ofmoh/H2KyGXwE0DtDeMZgpwtAk+W+OtjEQpFTKJA6E9mCEs0bT+JkSgR0xZFqRCmPgpCmb
 vcjqQbfggoxDAPEjPmrrNd6+GmQdCh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX2Dq1NPJ/PYkt
 tnr09dkPTcjTshFUga25yljsnyR7JaQamfVAIPy1IYdkiFfqRwRQoiwaAbDqJ8dIw7COvgdrA14
 iIuLPcgWnGf+xxR5DonZTtmFHetYSQ9FQ70TxAS4Wm7CWAgiPbCIe/Y6tptCaRvf36UnA+5LO28
 Gu7IgmmVHMGv2K4dhnXnsATKJX+yceD6zJRYhE2B1eL+vhJWJjJcdU3CaJ57bs519KLDZuOEXGv
 hlw/ewzjjCvQz3+Tq6XFFmFQ8DKMSJNea7h5Whi1Nz12NIkpY6COBjW6v6+n0eXBR+Neb0P65jp
 1xBokeZ6W5es2B9k4VgVJsutwKuvWg7+cMlOUj43ZsawG1Wdk+N1QDsJfELoqbHsTejY/P3itfg
 hTQo6OoWXPhyNOKhdKeZI9sL9N6Xa3fV17JNZQYHvu97haaFZFakRZdLzXY1uwjBx0WOAa7prDv
 hRM0n2UkWjWaV61W80A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

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

