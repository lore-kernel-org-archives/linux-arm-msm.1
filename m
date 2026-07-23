Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE373476698
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826612; cv=none; b=X8Gk0sYNN1ccR5jUcyVc48swrDMa687EO8KV+D+cb83ADMPkuagiZLnxsHWlMgzNbSZYPeuevRpiQGzsTkdNdxG7QUVY8YPLNoU2Kr8zxpbNwJG8SRLM6fIsMyc5IU+5O/cvj+h64pJIIF2P3h5YPD0xHzawUDYQ6tbL/A7jnPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826612; c=relaxed/simple;
	bh=/3Q5BLE2qswUURgRMp8Md6+CmS+GMHS0PuiKEz36BBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryoHNOZ1XsCa0l3el4XM3JBOpQPqRu/9JvaD9/YUJr1jILGlc7nUemRfS6nD/8P0Jwnt6PJnGL/w7/VEQLWM9sLBl3jwZDgfQRC8z8Dm47oTBCsHpDgDnFdIZNM8Y7rmm+SYqjGp+ci5aSH6ztXP1U4RVxtzBAVbqwKfRGVh9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1SU1wG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJlQcRe8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1SU1wG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJlQcRe8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NG59EP482808
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=W1SU1wG1cOiAxKSD
	Gdcxxsx6tVxyntq52L3+AiSd4xlX1k+IUpucp/6Dc3aJJE/W5aTNvUDNKAZKaBdz
	jhpTvpRKi+x3Fn1VocP6NssLgV20ZuxZZL3xqh6scI6+btGUFddBHRJXsgbtJHWg
	VSkTRq4u5O/b8htAlXaboBjROtfoSuh6IOC91lqO5nkGDfC0xvOYQxVLic0eap+r
	dIJMJMI8gT4UvZ+DWRIokzQCA0pRjCbuHPbGOZkuXLO2lmutLdnA5ygkclMYret+
	gV2gIPnThW4qeCzwUHSOaM1xqGeBkoRmFcipTF5epI1Y0Qb/BQ0q+c/DH4trikRK
	ZnmS9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vg9vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so14423551cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826602; x=1785431402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=hJlQcRe8vcRFdM435fS/p8hdcUcNPPxN7efmSA9s+sNw8d1N+7bF9LF8zEjxXxG6ve
         wfcSB2dtlXL2m3rbWAf4imZ5pIjttNo7+zpsB7n+4kdLTpqMNAWyIXuTNiQmydIT2EqH
         9ZUtc/vzXllBQaCO9PBjIbvnfo37IybpOLiSI/CuHqHLjlrsTorx5xplauAEZM5Qc7G9
         o4d7t0qHAKhmTReD5aYEYJeDYBeiWqe3Ur0ZAAEFZcajcTNgkm1PDpe6Oq4Wk7eTp7kH
         tSYmwbIgaihAib5iMUahSGQ+RraRYBAhRmOPgTSYT9T1zfLIuQcPJjYKr2XPjJBL51tU
         3n0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826602; x=1785431402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=Tzk/EUIggobRDOpYAPPQN/yuV6kzqbOy/n/4ZvlyyihymLE6uFtG/hdQZRYURKK2ew
         LgsbV8Mrie+zHk0/uefhzRoE4B3qTsaeh3k5rK0Hbk4b+AFm8whf7YtLf65ReQYBCyNy
         ZjJTA4T92KbM8tVaRqS3+vmpk23y0NcvAlxvOpRW3qNB0vgxrUUa43pVIN4ECc2hzLK7
         J04obZ8b420MtIV5Qb55h12Ms8T806M51Vs56W17ZOrGBLNyCA2E5TLcA/jBgiDZUfYI
         LuXYtH8iKMWnqaquJ0D6mJBfokvSsiSctfExwpEz5+zEKG8FEEZL84vgs3FGnKC3U4Dy
         zHkA==
X-Forwarded-Encrypted: i=1; AHgh+Rp833enu8PJ4YEKHkNkraua+DsZbW0cMD0Ff2KPsh/wLwCQvzRImlbqbgwQv2eabqOE2EwNn5wf/1onJy4/@vger.kernel.org
X-Gm-Message-State: AOJu0YwnpmR4tZCPzr9VFZChxOw4fqwfWrap74QyGnCBBFzuwBPzOnYX
	7k7Oz5YdY0hdDI1g9aQ1qqwZfgeid1SVE/qmrOP0T2sqalBdYj5hM61HBbaTc3guncY73soucy4
	KZDHc+3VI39HPJqIq07v+34Fjo9PYmg9ZdBn5bXsvWy0IKQOp2f8UrLkWaRqTnqpU/Fyo
X-Gm-Gg: AR+sD10HzYrQwPRXJ7oxT2Y8LRf+CFf2Pw5mTF3R/HYpi2oLVS1zeR+sMFOCosZs+hw
	bCnki/qVhuLYSIjS3WiDtdkRFXlQB2FcVkqIjHGkbH9ES8iCd6odzKq0Lv8X4XHkqQw+X9We7xF
	sJLBjUsH2j2wxTwcUe261QL+xX0iYT0F4p59ESkw/vPiRbWg/tHPJgtgnrpB1S4+B8JD/6TZMjO
	HxAxhmSwfkbuZbBSkPmMD6tKj/L3VG8l81R6DISNX+dnI7/KXEr6NsXolb4ceXpwIDKvqRI9Swn
	1H+eednlNKocH5v66/EWNfzvWfiYJ55DTKsP0GItDB/dYgskHIIHtGY2AEyhgJ6pApn8l5n2TG8
	5kzohkfjvz0q0L0pFAHWCLyzqtR8s
X-Received: by 2002:ac8:5711:0:b0:51c:1291:911c with SMTP id d75a77b69052e-5283ddfb0edmr35646501cf.14.1784826601603;
        Thu, 23 Jul 2026 10:10:01 -0700 (PDT)
X-Received: by 2002:ac8:5711:0:b0:51c:1291:911c with SMTP id d75a77b69052e-5283ddfb0edmr35646141cf.14.1784826601146;
        Thu, 23 Jul 2026 10:10:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:16 +0200
Subject: [PATCH v24 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-10-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=34ButmP/zHfg7ujor83QeeFN6rzFB4sOTC9ae7ymGro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrITet9bWWLlF1QKOA3a8SVNipTK2mq9EKg6
 mnbit3+FIiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKyAAKCRAFnS7L/zaE
 wwGoEACZ+RmlquNZErTNw//QiZlhjQQf6QcXzkBFThMY6q8Zr2WHRA+PKl0pKeNy5bfcaUPaYLI
 aa3kTfzcoTGyW5IJZEJ/C/Xdv6Ao75I75LEIjIAKnNuAJxNp23Cuj8E/Xa3EOOk9HAmILlJPBKB
 n+ZD6GIVXWBve9KwXr6MqAouS27taz8n4kw+ptOmdngOaI7jxOJgHkB1v3FcuCk9PZpS+7y560v
 5CGYgGge7GF8zt4rJk6Nw9fc4wvBG5qz9DdbN4MdLVqNGISuP/CodKg32hvb+YsHQJdJpkEIchD
 imPpbHCPfeoXFdvhDjmRNVsqCq5KQnilNnHiWgdW6Eo+RJieeEN8wD+TuMhMo2sarSAGj9PluGe
 XQItDy4ymVBmCdVt7Vfwm6x6LhCW35mnnqZamOT+CNlZ9rXCIQBD9udrswfIhPN1CFABWmrpCfZ
 O8oh23hz1Z0XY9pCVgfi3Xw+JMQrCi1SVbD4CYEh95T91n3qdW6Lg/xv1I25j9nWY6TFX7WTJhk
 3gHZnD0M+gUD5JTFLYZbU6oBYmjBSJjP7Mvydb6xYEZyijORxd4MMKfGgeFCmdJZwfiivPxFiaU
 VV3maAF3APxQ6CQeMDLBVopbArKNWfACsvuLr9jaTwTdi/QZjRTWm9P56+mKm8jTfNTE8rj5cvK
 pWy+eAQez6U8Y7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX4vrFtvtEAgD2
 l9xYhu5IHL0jDWXgWZ+UcZpvIyTw3sfZK1eKSbTaP2/WhcMJqNfgGMFLxLuNAnhlZ9bcEn38HUh
 kbpUS0BLdXda2hOHkXvrBmLeRU6B05g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX6ROInkdzt0QN
 hpDksO1EM6D+I6gx2+m+uixADgPuHNCTWwvp6G3P1ZttBfndyqYV6bnxkkPp8046xCX4EHcjNvh
 TVtJPj/H6/eIPt6pAxD2qGYQa8FBPFQMOiBMHni03Gq9YPdRBw4wGNBg++KOPDHVJyiavkEXq2z
 nMAnCIL+dhiYDjgAxGa2Zl77SC2KJE2MkB/tQ5dCYVSACDcNYLFTE4cCTBFiSM9o22kk1g9fhoq
 0gNzIohlN/lhOl3A1P1Ob9J5GTtifo4umKchQjM98YpLuJ1L3CENrkP7RcXCLTUgyhlHvYvg/dV
 jQTZ++pXFiU7RRwAkBde2XIfYPqUPUrOodXDSmPCvkU9nV0HBCEe2ePbjFYVrTyrgD7YkKZhIwR
 +pXUeqNmkApxiuEX+RYUbrdeezxr89l2Ca3zbw0s+5tjqiJVlJ3pkJKbcv1jJnVCf72zzT6ALDv
 o6BQhlp5o7THhXnCxSA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a624aea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jmVmxpSK1-B2zIJC1DXN2KyTgYmPaj5W
X-Proofpoint-ORIG-GUID: jmVmxpSK1-B2zIJC1DXN2KyTgYmPaj5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index dd860435d2c47a608c82cc2686583a44ff96c889..aa4a0b17749081f1ad653424bc265ee81e348e15 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -237,7 +237,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3

