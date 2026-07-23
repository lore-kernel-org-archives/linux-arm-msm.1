Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698C47D466
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826626; cv=none; b=kSy80aUl7PYtzCm4LIrx4E2/84UAEkoFHBHwx4asO4PAia3qdECv4TH3VoWZ3fCoq37iNkG2++a/oP6en7pyFIPw+k58lL/fo9PK1lHFX00gcfArLOG1bZKdQdcYZn8wlQevgtmNIQzgd76WpUsfP4+LAyfRmJynEPHAVbtecuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826626; c=relaxed/simple;
	bh=vxwkMMjZRH7IpQoBQNb3jByeFTi7xo35vP8N7bDq7+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYrycr6GZ1ADXWTar1qilONkz34pksszGTCXZZux3or+un9TCrj/py4hZ/2adTApfq5V97cFvSww+0MyNNeobb+yyblvCjHyeHs7L6SypYNWwUIrvF5+KkSfHn1GYzx4AIGh2i3/O2mQhb6cxuT0NCGVWSTcF9NVDH7i/5uQOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPASLLBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j166AUmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPASLLBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j166AUmn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvlRu4173040
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=; b=lPASLLBdPZlmJqH6
	i+ILibay/+d8E5PtBnMpCCrg8msLQbU6FeJ8m9z1TMiwR7tpR4MPzS4ORFCq7fx4
	GzoSkp1WdoTqBTtRnfeCtbtJ+CMQrcvHnRRAseiFzyJpQWbPO3ceLdROdArcRzcC
	POUVDKGdCLMxUrMYBR+msWprOVdZAlD+f56TVMIga0JU2dJK37LSIy4nLW3Op8H7
	maxFUl15AW/1UhVy6dtFzgXm86AeUVmnCuh5M+heux08HO4jQTRKxJnoX4tLfwkB
	JyIzS6aR3MNGSaNVquFpVfJkPntXaMNuU51ShUShou8nl/8bEv/P/zAAuqEdhTS0
	NLz5Aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qjnft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so24088121cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826609; x=1785431409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=;
        b=j166AUmn6JtJ/oHGG3lQPbaQeTni72cKKlK4XJhWUnczbq9vtNrlgejrewKM8cL6li
         WrPudZTSEt+CngFxtxhB+Zr8LhMEbJxW+46Y7aN2KH6ebHDB+6bKXPZLmqK00oEKezaJ
         eBuRG8BMxXohc/EscciAhVexypAm8zr3alkKSdQHcH2qnWL7LiTYxszVGdqQBFB1aCTe
         vgqtn7+L5m8oz9abXJT8vfRbQzT18y32APGs/a6lpcH7LZ6hjV3oH59r/xoef2uKr0kG
         fqY0dz5/jK1E+62Ba27DxeTdj57M7kpt9RgiZCFOoRDggyVhkBTn6RfrzdOAkt5kC+yO
         7+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826609; x=1785431409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=;
        b=WEVebCMF5ItHlQKEM5Oq8dvcAh3f/3+GQbAzWU6QvFln9rxsd756mEPM+UyY+KF8Ew
         6pa7NEi8Q6fI3GQaMELcMJgsY1mujy1I85aCybBDUUGpDzrbVJay9+ZYegMDmlNjxZaH
         yvLGIF/vpzvFeNi6GKnuk/epnfvLr/4Zu60Oi40OJ3yjFE42BPY+apWHsBhbawiI8d9T
         0E/cwUCvGPG3joCdi7fLc1hVQvgzQs819bY5xf7Duh8NfXD0hwIGe1Qyk5Gc8aE4sQYW
         9GoS1Fk6gNYsx+Ktyt9X+23DwV8opwK0ECFwhd3lgD/AtalOBb5I5MwSFYiv0C0KAagm
         MMMw==
X-Forwarded-Encrypted: i=1; AHgh+RrVUgON8ukggT3iHTvWF5nCA2x3Iyt045Sh9NuciBfgk/GFja13iRX16W+dkcZS0ONdXY0TuRZ5cUGZoIdK@vger.kernel.org
X-Gm-Message-State: AOJu0YxyYXAOcRcChYs7wshFc+TB4hOXjS0n5f90xkb4BnN3wJbgUl73
	7dIYssd6FL4Mv6WqWm2dPWrJpABoHpVt3HsO+/W3nqAhqez90rl87arv77M33Yg15BmvHJGy3Hp
	YBPxJOP7kKQzGKz3sRejaKIKAgQ0iBUUb6SCRtn6LEQRD4ssUPCtBL6Wirpbz/VTZzP5g
X-Gm-Gg: AR+sD13jp1MdVnBC9B4nhpwBFe7/l5cWU5MYKQNmcG7/ulvEWz7b6ZHC0OMr3iCoOLH
	VwIicShc1MWSm5L/ROzi0SlX6AxZrtbVWGqFy/K+Tzn6nhTCa47fFQcSej2/XB9TWB+KPrnOQgB
	6yo0XjwMey3mSYQP3vkt4HomvLk63FYbqnz3K6nKnyAHvmrixYg39C+0gxzoSVpN2/GvgzyRQBU
	XPEzqnRvpNEpFmXE4+F/wGFM41IrQEiDOUprHoCHnh4eIZ2N+GVoRHsPu2vjRt3IM7JkwxwuwCf
	8H7tL8w5FuDHwUzR7DH3yNdnVW69pSWOP/q/78X+SJ5QqzydKzgGxCFPrIu1GhdaiEu3ps70HUI
	waz0Nm2FOwAIPJyxIZcDpuncv6xeg
X-Received: by 2002:ac8:7c52:0:b0:517:96f0:5658 with SMTP id d75a77b69052e-5283ddd2adbmr37412911cf.14.1784826609371;
        Thu, 23 Jul 2026 10:10:09 -0700 (PDT)
X-Received: by 2002:ac8:7c52:0:b0:517:96f0:5658 with SMTP id d75a77b69052e-5283ddd2adbmr37412331cf.14.1784826608840;
        Thu, 23 Jul 2026 10:10:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:19 +0200
Subject: [PATCH v24 13/14] crypto: qce - Add BAM DMA support for crypto
 register I/O
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-13-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11853;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TZfKk+MyyTslO7iExD/EK4Vnr88LW7a2C5QGmGC1RAs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrKmtJHhwQNBkHj1FDmOuNyz7WabMtuJ1uzw
 2lLCgm+OeeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKygAKCRAFnS7L/zaE
 w0xBEACRu7hxP1niJglw2Ecf6rwFI+pRR3k8UgRAeTJTQCtwUpF8q3i21kEw2qExMr37V529y59
 I0QrTLy6ShNFIeqrDYBmWOPhNRShuGRIGiDaqWVV70i8a6uCzwJJdDkq7K5OssXXAn6a+f0s1IF
 gwjA1p2Q5ndb16Yt98T2H6XnWSKZKlsv2KL/Ya3ollNfYxDawIkSUh77tFHrAF9ioEnz8SkOzlM
 y+Yt7I3vc4j96KwY9yYPTCtV8HTo3U00hK5lK3uH+DDADb0qZHSs/FKs3Jhq9kiJI1LHo55Hf2g
 M2TRHhNUxmmo5CSCkItxdysqCUvblrGOE9baAE3xozsSi28hWTMC4pnd3Vlq0FzIDcNgQ6mme9J
 i1TfIGjo5AN6MQwgXTPHppIy1lL2TsG1xYcnjHOlosi/xIRxtPcMFLaEpJq0GG5sP1EA8IjHvS+
 O/Uv1qFa24GHfN8WdC2NEqPvIpdEB0wy8rjqrmK/82e/gbA/5F1gBjzuTPtjDmUv+dRAMxCDzze
 3s0+eIR/fGVozJr4YRt1WVicu7AbQDYYE7m1Nyvv4y+fLFTlupivqN5+DSexvU1XKRSRwaYVdRe
 ZUjD0Iy/Ixbtcd1B7Fnyfdmq9Kj3yavQfzw4sDkDn6T+hdfRWyVInvcWnfkQlD9MSOJEfMqy7ZX
 GpuT72k8LD7Kslw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX0OUidz3KGOxd
 /+5A90toD3XqQqFS0aynwekNlIRQqkHNbo5NY655e+NMwva+WnWoGaAIbV3eBA8Ep9yVdxvXvc+
 ujpI0oGhN/YG9d0oKhSYyhzIidw+d5A=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a624af2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ExZEzFaq8QRYdZmHolMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xS4eG0kJvAT3s5WIGGVKZTUXEalpQZav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX5BhhfXzaa19s
 r0QjnF2IEHen6BPiDNwA4bnbDJSWy10MqBQGVzNLdrpCxRt5OtqIuKS+xPieaby3AeUBYAQqo8W
 VSuCpWZzO3W6YFQIhGluQyr6Cft8/n/TE3RKW/4FXUKpgoV/lrbGbfPcY6oN3qbF+Qx6ftYsv+y
 bw0f00UuTVce9q+Ef0gZXB2oxjPfIgoy496OSe5ItSmG55+RxweNDhHrp7Ck+CXONLJ1rSNfp/4
 Ev3TGwK9HcINwBnqt9BfgahNWDqQJ8d9CmYKsb4ZZRWXksyxikmq370N0DwC41dTvMwqlXKNss+
 uoUj47XwHbjfGfMhjttxufF/wKZiJ0cuvwb5669MING4SvLRh02HdwlxQB1fXO227SD1PM3BOtJ
 laYSmuHWVfMz0VUD1KRvECB9f8OCrEMDHnGjiajw1QKr/ZsNQDXRKgLjdgoyev+MM6Kwezk784b
 /V4nSIT7odg34xM4zBQ==
X-Proofpoint-ORIG-GUID: xS4eG0kJvAT3s5WIGGVKZTUXEalpQZav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to using BAM DMA for register I/O in addition to passing data. To
that end: provide the necessary infrastructure in the driver, modify the
ordering of operations as required and replace all direct register writes
with wrappers queueing DMA command descriptors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |  10 ++--
 drivers/crypto/qce/common.c   |  20 ++++---
 drivers/crypto/qce/dma.c      | 122 ++++++++++++++++++++++++++++++++++++++++--
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |  10 ++--
 drivers/crypto/qce/skcipher.c |  10 ++--
 6 files changed, 146 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 1461a08e6c58b00e60aa35515f3392c096726f6a..544a3cf8709248a5f3eb2b669e30b09183d3a69d 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -463,17 +463,17 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 			src_nents = dst_nents - 1;
 	}
 
-	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
-			       qce_aead_done, async_req);
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
+			       qce_aead_done, async_req);
 	if (ret)
 		goto error_terminate;
 
+	qce_dma_issue_pending(&qce->dma);
+
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 54a78a57f63028f01870a3edeb8e390f523bb190..37bb6f03244d317a887aeb0aa10cefe327b4ce05 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -25,7 +25,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
 
 static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
 {
-	writel(val, qce->base + offset);
+	qce_write_dma(qce, offset, val);
 }
 
 static inline void qce_write_array(struct qce_device *qce, u32 offset,
@@ -82,6 +82,8 @@ static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
 
+	qce_clear_bam_transaction(qce);
+
 	/* get big endianness */
 	config = qce_config_reg(qce, 0);
 
@@ -90,12 +92,14 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
+static inline int qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
 	if (result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
 	else
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
+
+	return qce_submit_cmd_desc(qce);
 }
 
 #if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
@@ -223,9 +227,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -386,9 +388,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -535,9 +535,7 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	qce_write(qce, REG_CONFIG, config);
 
 	/* Start the process */
-	qce_crypto_go(qce, !IS_CCM(flags));
-
-	return 0;
+	return qce_crypto_go(qce, !IS_CCM(flags));
 }
 #endif
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 26347e9fc078adede712722107e74958538accdf..88d253d9147cfc9ed275653f7fd248538378194a 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, mapped, DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		ret = -ENOMEM;
+		goto err_unmap_sg;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		goto err_free_desc;
+
+	return 0;
+
+err_free_desc:
+	dmaengine_desc_free(dma_desc);
+err_unmap_sg:
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	return ret;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 static void qce_dma_terminate(void *data)
 {
@@ -39,6 +133,16 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
 	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
@@ -98,28 +202,36 @@ int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *rx_sg,
 {
 	struct dma_chan *rxchan = dma->rxchan;
 	struct dma_chan *txchan = dma->txchan;
-	unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	unsigned long txflags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	unsigned long rxflags = txflags | DMA_PREP_FENCE;
 	int ret;
 
-	ret = qce_dma_prep_sg(rxchan, rx_sg, rx_nents, flags, DMA_MEM_TO_DEV,
+	ret = qce_dma_prep_sg(rxchan, rx_sg, rx_nents, rxflags, DMA_MEM_TO_DEV,
 			     NULL, NULL);
 	if (ret)
 		return ret;
 
-	return qce_dma_prep_sg(txchan, tx_sg, tx_nents, flags, DMA_DEV_TO_MEM,
+	return qce_dma_prep_sg(txchan, tx_sg, tx_nents, txflags, DMA_DEV_TO_MEM,
 			       cb, cb_param);
 }
 
 void qce_dma_issue_pending(struct qce_dma_data *dma)
 {
-	dma_async_issue_pending(dma->rxchan);
 	dma_async_issue_pending(dma->txchan);
+	dma_async_issue_pending(dma->rxchan);
 }
 
 int qce_dma_terminate_all(struct qce_dma_data *dma)
 {
+	struct qce_device *qce = container_of(dma, struct qce_device, dma);
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
 	int ret;
 
 	ret = dmaengine_terminate_all(dma->rxchan);
-	return ret ?: dmaengine_terminate_all(dma->txchan);
+	if (ret)
+		return ret;
+
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+
+	return dmaengine_terminate_all(dma->txchan);
 }
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 5476d4d30fae7eb72bbcbcdd7d8be7a76f6732c2..5cfd769a59a791a79da42e2a5b0554ad974f7631 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -109,17 +109,17 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		goto error_unmap_src;
 	}
 
-	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
-			       &rctx->result_sg, 1, qce_ahash_done, async_req);
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_unmap_dst;
 
-	qce_dma_issue_pending(&qce->dma);
-
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
+			       &rctx->result_sg, 1, qce_ahash_done, async_req);
 	if (ret)
 		goto error_terminate;
 
+	qce_dma_issue_pending(&qce->dma);
+
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index a9b59e68df4b6837805d45391f5a5fe43fd47709..b4ef3748fbb4dde542b0307f32d4c871b7c33ac2 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -142,18 +142,18 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 		src_nents = dst_nents - 1;
 	}
 
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	if (ret)
+		goto error_unmap_src;
+
 	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents,
 			       rctx->dst_sg, dst_nents,
 			       qce_skcipher_done, async_req);
 	if (ret)
-		goto error_unmap_src;
+		goto error_terminate;
 
 	qce_dma_issue_pending(&qce->dma);
 
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
-	if (ret)
-		goto error_terminate;
-
 	return 0;
 
 error_terminate:

-- 
2.47.3

