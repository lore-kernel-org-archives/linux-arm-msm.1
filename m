Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B0375AB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640853; cv=none; b=fsj47wXR5TP0YUwp3TpPt2V4NwQFtQrUtWPR6fc+G98kHtnFotlPyIlx7jSZLsUSOdSW70Ju84DqGOIVTQbDzfCzQXd9yjL8tqrvrrtqkKO1CDsELfXeFqHR6C/TKVzAJVbVWSfx+vmMW/ALRQRv0Tp6D2oK/UV7uonffMNNxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640853; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oP8N+A4CR7c7C38ZvO0qkm+g/iY8lo1aNS9aYIkdL2w3ssYoROy3aqH3XPGv/RwQCOsX1fnPcmEJquDdZxLuDKeibB/fv6+3Y8gc1QwwCQR9kgpLIUqr9MnsDQA+cAXUKKoD3+iBd5NIOnHQgUizcSrNhZwu1h1/TblLMq/QjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNrzb8VO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbZZOoMx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNrzb8VO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbZZOoMx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDLqIe2914483
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=bNrzb8VOaSdLwG18
	Uf7Lr3urSx+Hph/rhJmXjex0QXi6DfJaoGa5KQJh2A72Kij0zcjOBZIVtmWH6Z1p
	yoqulvx4wCdFe5IG0Y4uENqW0taTKw5YfFFXguylQCPHN708yKvU2QqXBY3c6f03
	CxwKkZ68NB4pEGbEz5M+kIApwc8c14aaNxkuSOH4zgEzfI9lU0InjaalPQGRxE5B
	qCkXtVD7mrO8nRz3oDd/zoHmZMBeWhPQtKfusH3vmKqEghJUwCCSf3y729ycWIwm
	w8wANwDCn4KcrFn4R32REJyugaV2i8Yi7y1fced8GSTkudt4589rmecoX2nQv0FW
	msl9HQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nss0e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:34:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so92826676d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640849; x=1785245649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=hbZZOoMx5AcIx17LVOyOw937YbOWpbFdSNZzTL68WxFGLJo8k7gbtT8iFCBZHxhBDz
         Y6J3jb+PDTZ/K9TYAxxbabF/kl0tyuQweEcT286Pr4wmPdKdVjL8pxw5qDYNRYT8Ckir
         /1RQApvCZNWkGUSv0uNdBy+iS3IHM9PCQoNGEpcniu9jrv6M15zwuIZcJ9fokINvDbOh
         34BeqqudR9g+S7odZ8PSiP1oHGu+uqmqg65mRs0ZgP9Y6mRvJ4oHzcKJtu7938jzhq7X
         /274nYq2+oDqrK9liiHy9xnomUwDfYbnAXLgXTDFxtMqVnCc784v/bkea5cA76OyO36V
         oQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640849; x=1785245649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=ULn3jWy3rjkGMPsNFakmyIfrSyFAlnzNZuhEUlSedY7qLuS1zUj9W7STt5iijjrJu8
         RwVPaOygz/vYG3pX4/JGZ6eHkx/2fMh9kgQTjQQxN5aamWBRXGvA1K6beQLkfmfP4hR2
         whLO40gYE9FeWNhDL9a++auwix92EPQu+JGbu+8rrXJmFPPYSg443yMEVqZBJqxtCAGV
         MyKq1Eqg1vEuaakzzItZCZ5esmsA4cevpdn9y8QmdKR5O0LG4y2LUJH+l5aG9laIawQm
         fU0UXDayihUXJk8OnXJAoWZ7U+nDfBiYWu0O10v9+XYeVyVt1QnUDxXajCTN/iypcLwl
         Mxkw==
X-Forwarded-Encrypted: i=1; AHgh+RrqUsuMcIFP+0vXw5P+MghAKtbL/DsdUC86iQelQqi3zFx04m+y0lOli7DleUUaoFqYFrhZ3AjkA4nv8V88@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTY2Al/DN3qVUSqWvpp0X8tS5g4MhYcszxy78mPqj5obOS3NQ
	J1M6nhXmi3E9v1I4ppC0uI3uC/Lm77pi88ScUj144Lz5lMqfGH3kLtTsElf86svA1ggg7L4CJZC
	e0CZIApT8DLvlMLEVE6WFScNsea4o5CisvZgaF2eub1ru8+n6rXqbAi8Ovw5XMVsYvZPb
X-Gm-Gg: AfdE7clPWjWGqSPp5+zcNBuoHvBplR7LwC7YQcE0lbA7TH5Pa4yIgwGil7/QiU/7rLy
	o0QmYywdI73mlQdiJLFQIoRWFkJRZ7YFkI2sJv5gD05RBDrEm53iv2DmprExvOXkRk4G86+43Za
	kHu8m/O02s6nS1f6FiYQV7jxi1xYgEX4hwzgefoKjaV6MCLW8dfqVYGIu683o8BPBzxewvKBIDc
	7qsJ4RwfyG6XqgODcCB3Nc2Qn8rEC6347OONb5sQcpbpX7ghIhE+49zRxCPUxFTzgheCQy+nsZt
	/LTJbUURC8d/m5eUcolv+JSrpdbXi5sWmzSRVwb2sYsmyfaczzQFHNJD2siLaVNGM7cBM9oguXt
	xAM5ItcPknnU47jYCQV3BnUCn7/I4MA==
X-Received: by 2002:a05:622a:180a:b0:517:9407:5c38 with SMTP id d75a77b69052e-51fc12933a8mr214248851cf.24.1784640848877;
        Tue, 21 Jul 2026 06:34:08 -0700 (PDT)
X-Received: by 2002:a05:622a:180a:b0:517:9407:5c38 with SMTP id d75a77b69052e-51fc12933a8mr214248451cf.24.1784640848419;
        Tue, 21 Jul 2026 06:34:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:16 +0200
Subject: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UnilkLGADgQanf5CoLM+EtXAFOMj6jWwzBH
 LQYyN3el+mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JwAKCRAFnS7L/zaE
 w67WD/9qMG27fKE1FBdPDfxrHY4ToxuSnX05+cNKbh2lS3GHPkXwmoXy7ylnG5HIMwEtB0/Gtqg
 NME69dDUowuLy5BEd1BbM74oJabRrIhpigkKamMwJC1qpHRaXPMPP54qpbbPNEgt5ZnvY8kG2OX
 MPakkw29VOOvG69FYZqXeHoVnFWoD4MXDCea5HybyWeIhaCQ/J4M4NdQ7Bhwu4kTxTEoLSer4/x
 jjH5mJSW0ESaWTLRFS5KWlnliH5ITFaMbzglzYVZqr6SFZfDawRH5gv5aya7Zu9LPbsm/X0EVWG
 c3Rd9sOkyWu0Wwgq/3IEZ+EVhHPfjPr+VLfrB537yTn6QmQC3z1R4E3q/lI/8iLEEjcFOynG4jF
 er+yArLEIc9JaoOaKYNF4h89OjDic6RX79e6Mp5IvM2wrrnPuCOFLTxEgsKeXo6aWALioo4liI6
 NxUBn7jB9D0/nOHtJluKrmf46rrlt+6d66aw3Tc5s3tsYQ8GLZ74boBGj5pOxPZC4GYydmPgcPr
 TH0w3QSVihaVR1fFs7pjsah4mUngg3sxe+DpafjeVRujWB+TNKTbOOETQwdOr5EYXE85mKgeFCo
 idTcZogpmlSa5p+f1ILe7Pgl1SVHCUpoJcGXuZ5tofk9xtX8Y7hpwCAnqE1YhWw2m33EtWYKP2w
 6QO9I3w5a95ZndQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: RpwrRLMbP-NOqGNrT_M5KA4jDIIlnFgk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXyCknaWmepnls
 aEmnFjeaK9v8kXdVE4JImAN5NyF9GGGtUdw+SeTBhD31li8R4dG7+3Q7nSpORKv6Pwg2aMDVEq2
 DXK/NhnHGR3aH1xcg/ZG7KuOFo/LJ8Y=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f7551 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RpwrRLMbP-NOqGNrT_M5KA4jDIIlnFgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX6/VX+J94JIvW
 vjEFlIyoqXEqcnLX+CDG5g7itDLOq80YIsbT4trujeiPsOGmyidpaAhnHxG8bvQpNQP5NsChrIa
 +GBrh2dZncoaFcEyt8IKsO2fSoUJlubuuGeAjsN4nJd59jn6TFkfVCAyiANrlkcH1mR/fxxtatO
 Nmifhgx7ZfDOsvFCEj4smaGYU/nfYNlnTAJd+qml1dt8ccQFQPwpLx97C2x9tXYwbzn4YZIvsy5
 jqnG9dNxPfyCqshDq2oENeUdOA0E23VGkTnjfvcP/qnwZNLz93wm+bLWQrvj+OfYJDabphM+7+H
 IqsupXIJharUDOmekJoTqUGNXJBZ4PT5IEHFsxgzgMsYX5nWY/NnRvypP3b1q00pFKB8YjPDiOh
 62f5Pspj0sWTNsOtb7HGU1mZ0bL5ZFkGrSR1/Cd9kvdZcOi351uRQ2p0Ssp1sq7lKGLp2vwgJ1Y
 YJ/sVZ2QsNCVkh4poIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3

