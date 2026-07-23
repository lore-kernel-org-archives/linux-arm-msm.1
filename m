Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3A4766B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826607; cv=none; b=SXGM/ntGkCzZYI7c7d3+FpCRwNuYJesuuBV7Lk/tcgKsx98iRQqVvtGgbm9aTRN3Ah8NILl51UjfsMvDN9vn7FJqLbTpqU3y3CiKuKc1DGpP8U3//yNtORuJoUsM7h28ePhc+PQbSTDchmREVHA36WnnEZzC7WeGA3c3rLdD+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826607; c=relaxed/simple;
	bh=vpDVf/b6zHPEUgtVCAl2sRJELM4MLJc6gtP24/up104=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4sZKGiXytj8IaIrofOG3s63h1DBGKwcs0TK+2cRPVAqstR71NYPSBYWnbfJZEXTLPb3BKlixqX/qvswOManL3+gtf7yboAcnAa50/XPcKU+ejJJ0CxFj9pUg9PT4Yf3h28SdyKb83uhllIOR6HmjCQqYaZdjQ3HcN93US+WX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGSaZwYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izFg3kvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGSaZwYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izFg3kvZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvgTo020908
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=LGSaZwYTvZGwccVl
	pA0EWYh/eZK/4U2qPMKc6ObiY15z7/WdN9Qa0Zt2fIihfTQGV+Sk+vXGXodVtOaW
	dH/4TX+mbplfE6yEwzc73/mGn9ljwcVfH9ri7IoFRETbBhEMQ5r/rwGv9GuftWMx
	PV/QXPbTfVgucEfJoXbLRWD2ptWm4MzL6MjJJ53msaQMhcW7F56RTFx9Z61hvGCY
	Pu5t3iZBUb+fAf2JC61QWLBtVs85ahXiA9BdpbId0zadKuIHJ67l6XZyouEe1V00
	fmKGyJ6MtE4kuOPqBe+rh47j9/uvFw2t+Uhur68zwKFa+FPl1d9XeDsM4RlWL8zy
	U2OsoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7mbex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:10:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso15158281cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826599; x=1785431399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=izFg3kvZlNj8mj0TgPaNJIIP44cWibX3S0fdi2pinps4HqgKhGzN2BNTeheSUMalVe
         tw3/B52qIZRMuCp2AhjekXpsak8XXJ0lKazyAN+WIkF3Uc/kLQM8lFTlYXE3GUH8RufR
         bxsoE+KMWs3baBmldd1tS8EaGrULQn01+Ez0hJS3/AeyFOscUyjOwr7Kiv0y8XVLup4E
         osjhOKTYLV3Zm5Qrjhb5O9KAqeYHCMjcHB90+uKI2E7PKbq8GFg49R07NbONY89PLlmL
         7uRehcwSPTekPnnHYy7HYQPPP54xLdWaaGJ4QF8emY8Vf8ifwW25XmvKP7ySHh6zTPZn
         r2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826599; x=1785431399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=YQ5nx8JlOQNHHjtlSh0QGf16iAH2mA2coBomGJlYlmm9NdLLicj7TWyTVSyi9K/Y0A
         eRyRw4r5dPOWJL5GYbE1vQ/ykRNrNJglndOXJgEcXKhFA2n1IQPYeJlBxHCyQpbzSSDa
         is4VthxhYnvF6hQGnK+6sGA3eKWx3Zo4QfcLYyw67J2QAG96fR3ehwpc8WAyxRbrTjde
         uN7OZ2ceDXLGmMmLAMXdYQpSwskcAcnL8FPeBYLz1jBLtJuyxyCQ0lPzbb0DZYFanDQf
         aHqfSdauhCxURqgH2jsxPyvy2wEQBnH1uFrNuALd3Cm1t1EpDJiiZDo/Cm9fYOo7q8nC
         HAgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfOKhFjCebaqYMtRV3oMGnd1semN8MlwsNkuS053yYMWoA17ITjPiMFJ+HG3mB0JeUlYkEcJnshv2G2i/B@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxT+fgo0/YhMfE4CIigv9k6dVEXkWkHTAD9x8hto5p09+/FrB
	A8r6cb9GVGNunNhcghtF/XJeorFX2c1GcfaQEgWKWxvECnz5UIKRyrJYCVFL7LyOFzmmdCj84HU
	dqJcMOLYpviskk8tnqLwhNwWsU6An3o7gqi9vAEQtaYzlfnR0zxHLU3h33xQkDdnzurO8
X-Gm-Gg: AR+sD12031Q7RyCFfJEVXxQ/0k4x3gyix0/3fLE60Qpscf1Mbv6q/01qaLg5cN3Lutn
	x+BwhbrP2t+s6LHaZr5aMHH0VGx7kuGNZIB1hk+hApUiwfr5pDaTCIvsqnMV9ExIe/XQeSjzX0n
	iNW1z5ZiYtF3xi9PIzNAK22PwpqW7sFbyY9FOAU7XsNfNfQ/hu92rqvFiBhGVhTvRtfJbPcDlT8
	tx8nye0bOLzSkbniJfkz64WaVUeGzUncnryTO3+JD/ng7NmiOLQRUISO7viiAnBoqcTpWI2ExsH
	IeMNyd0UObL7ZmGjuIRNlaLX7X9wNeOGYj2IDtKaV1MNB4w5ALrDuB3LKC1Vip2hu5kL6Bc4zRl
	P+CRwqQjBVpDNaEaaMER9bCbvAng2
X-Received: by 2002:a05:622a:4887:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5283dfd07a9mr37944341cf.68.1784826599238;
        Thu, 23 Jul 2026 10:09:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4887:b0:527:6d0b:b00c with SMTP id d75a77b69052e-5283dfd07a9mr37943611cf.68.1784826598688;
        Thu, 23 Jul 2026 10:09:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:15 +0200
Subject: [PATCH v24 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-9-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrHRC31uqWfuPCshkpr4F9yhF00Q8kTZX6rw
 dse+wx0PiSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKxwAKCRAFnS7L/zaE
 w/U3D/4l/JZB1CI1zLQeeEPcdQ6oFcKCNVWSMVFUFdkhJ9BkrcxnGZuhnMpJwO4vO+Oj6Yhmb/h
 ZoKCPuJ1X0o3xdGe6tpfEIzROywogHcp2+tQcqYhyCwTg7WZAcGzxoR0LftUJ9KvGYq9QdqctNc
 lSFZbf65kdE2Tc02wAU/H+pC7yUQU76utOnkqbgTIHQtBA26Tpy8SDY2jAHTcqM6RUDQS/QZOE2
 uYL6JpIio9+5No8/xj/sIFfBWrZTD9y1gSq027YSHsL78J4qPTu9UpiVhcgX5p4R0cIB7cukMoO
 6HTz2lNB8WtWCCmp8ZGwCW/17HnhWGzniHiXH6GyrVOQSsLNFV+Ska6P7uo4vilXjNcYfM70IyW
 0IcDc45D5hsjGPbcRaRykn6DYvvomb7lzqPYxxwwj/5LqQIkcVI9c8Tm/idGAf029Cwq2zKMd6X
 yGyPL++zMP7shdIb6qer47c817fmdblEWodhtGQl1taZMKPTYA0N9McR0wbJHiNif8QSwy/eauR
 GhIMYkKSCIAzCinSVVcK+VR/pQ/2hHQQADI5icvIrRVwJX/zBRs5UUwqphuPB26sxEpab+svSq6
 1tRdkQ+B0BpxsfWz1r7YLY5YrwBYQXmF47ceIy29rd+FOOQwPz8X+u+hiypJ2UTXH73pm19LuYl
 DDKG/6N7DZoUbYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: iEGSZeyFtgw1Gro6oVb6ezKsMnRtYZPL
X-Proofpoint-ORIG-GUID: iEGSZeyFtgw1Gro6oVb6ezKsMnRtYZPL
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a624ae8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX54QfHEeDrQ8y
 oOA0qlPbp1jrTg2ebSxs0CL4wC++Rwm7ytrLgiHuZYTSvisdyiNE4q2iAAB4csjOUuSREHrhjpd
 SdEFc1ih9AT0t3giOBtvvtGxfS0H5s4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX1DH6C0s50WqT
 mGl9YVhcUuehvjtQw538MkP06Xt61YcBLBoKRh/yjxOyN8Bn4I8VZ77ebnSifPTJzuGbYhZCeVY
 Ve4omAPlp6miNvqzIMihyae4k8EVEbzmaEPlQXKNxyq3XvvUjEmPZAhGz624c/owp1UDcQBnv7Y
 PAnm66NTANkzPo4uQ+3Ia65zkhya+Fb4Spv1WGwByPISn/KDwKbbcMhyDb0gXorjqRW9OKoVKDR
 3H5woVyIa4PlrU/1iv973UiojErbckYW/6/XmGCPUtUUNGhmTyi9e1sLog9bOw/DtZ6Gy6Tq5Gd
 bb1Z2K/dxsLkXlVnoyPRBQdR0ZApqnVKS94v/WK+zayB38v/Ez0KofUEMvUzDqSxKBbggOUdelq
 bUF2U61aXcAgxAMO6u5IXIXuDy60NYIVwqX6AMtNxVZFvN2z65adD2IrhFyqY2y6oyGsc41pUUq
 eEjbn7hW/wHrlMxtvzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3

