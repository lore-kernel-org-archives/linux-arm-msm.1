Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB013E44E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277418; cv=none; b=fM1eMzeisjGQ1YHC31x/I2PwXIwjWCfoyUwfrSu72gMuXS4BhfEItzBDxCg8JZj7Hps8e8jY1on9/FR6ukUFf6yNJ7xdY2/2rdZCo3q4uQAxfWH7CvTaZnoQcTbwlvpwLMisGW/o5k391+EDYzYRoNnJEhu8dwrJO1KigDrfK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277418; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhohAimc5BHFOo9lCvSQ16ss9vG0Twh+RrBAIrUAREVngrUKSAbw0V0i0EjHMEW/U4N303Yb9MhpdGCUGxjAnvqu5wBa5517GasY8OdOTuSkv8rjZKsuQ5m2xjYCDgI8tgPQYgjcLW9JTjuYIZdKxwMl68CMaSfBBYJOo2J5N/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjNCwr+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIlNdFTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjNCwr+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIlNdFTt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRu7794310
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=AjNCwr+sRv9g2AVU
	iB6pKffGqXeOIXQzg7vFLBhvIyfneNHz+YE9Y0Bes7ETVA184wtriOyFrGGKtFNB
	mEtSjM8z1AqK7d3g/siVC+5OqIh8PHEiBCuCJEstZjbWpYeX2VYC1V+eDsZtY9nL
	sDVh1hH+62WYoailE1GN0r1yIilONmSPw9yXz7rWe/QrlUiUw0wFMCmc65CVV3gO
	OUtfmUkcuWUcLlF7O0mpaoDhJZrSwlaNFUD3uUlEQlKPcBXYc3fbucI0Xido/R/0
	lcD83hg5A29jbFJ2XWS4UFjWlN617O4XAKURLLqb7aGZsLPhS4itq7NX4w83k9ip
	4laPOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jvcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:36:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so180450391cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277414; x=1784882214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=TIlNdFTtnsINtIvlljX44TFg2tOsEq909hhNfdoF69yFj/J/3Xc12lKA4+lZTMypby
         qTgsuvvl+38Zk5yugJV52KlW5r+DH373IauwufMBxHOkxtZbSqw396BcU5jfb4yaBBKl
         Gmhe47+pjBBWzoJq5qocMf8PeYvLG36zUbzaC2B0Jymk0USQmFm8une8xpB13wGCKwKh
         AaibWcmGlQv8aGGS/QgTiNtAi4cvSKnoQ8a+ILC9zlEcSrdr7EAx17ZAK3Vsqd+JoTjq
         xoLED4rXCulV4PSJTkh4zXo8bXgBocF/OoA4pZyTUjU/2dlECX7vmF9BriFQ0sH/a74V
         v+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277414; x=1784882214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=LGwpbRytoMTwykwk6STC7CiA3Y559oJMF4lf2Mtq0hqmCJT2BZNqW+NYEB/gnkUX8t
         LYLJbop6Mx+CHQ1xQKNgGV8BomP0KAJnh0PkOnqL5QFbgr4CndgK/spo+CPqOKyJ0XnM
         kyDmJhywcNfpSuNFvPcNKgfDDsfwSPCiz3rEEfCQmmws1zMa9RvtZX3aif7B2fc0wEs1
         2WnI22rK9Xfl6xAGjvsOT1WerRUJyCtvFYyk6NPUFvbSGjMabCLK7LyOL6qmswQvyGCt
         HE2XtXGG/3sal0iWiN6P9h/HpQWTLlXm5u4M/xzfq1o7t+agM+Vaisr9Wo0fIcyQAeYf
         A/Rg==
X-Forwarded-Encrypted: i=1; AHgh+RruHmoUsC19kJIc/+qtDqYYP2qLa8fpV0kTHuHS1r6Xa4SgmW4gzNo0vDJzHeJQSpxfPqYIGDeka8fJOKBY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CWOQM2eqkIWgrK2JagrHR5FdzfosRLHAYMJztl1rdqDuYcyq
	mu3gYz1Bd401XZdJGlF0Gv5xF14gl2oWc3hqVY8LcDeN7mTP26u3+OZ5MmW9Zq2XYSpSrh8JHTH
	xCLY06hD50yIPRtmbqfwPHidFV1r1Oaa9fStVUjIvXIxIzMvHpaO5hnOwONIlP8ksHNEr
X-Gm-Gg: AfdE7ckpWcAGkGKBm9E30lKMPYwhSx/PHG28opEDSYyRxBWFvigPTmd7SnVpF89a5ox
	1fcXT3jUP3be4/SLS7msT+Nk4AyvfH7khbHijJyMafvfNZfVlJqSMXBRoeLlgZhSX91w4d3B0rN
	N0ktFOgrmsognw6NHGDLby2XgPFMr4ymgnY7Zx8jdVjcQhp4ZX1Nq/+eL3C6Z6m1rYE9BfT5aAa
	x1ICeyYsx/WSgvvbh8X8l8Zq1yhGLuW5WRFBaYig5KLu1WYL0j+pUiRujbfyTfflSgHBhiliFMV
	oMJz5ceOInb2p8cQkgWlffc2S2iLXFh5m6c9qCu0LflXHij39tJ1+i2dDA2j3HxyTr4MtEyzD/l
	9yXBl7XwtB2QISjOhYRU9fdzx3Uj8Rg==
X-Received: by 2002:a05:622a:283:b0:51c:775:c175 with SMTP id d75a77b69052e-5213e77d807mr12257451cf.40.1784277414360;
        Fri, 17 Jul 2026 01:36:54 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:51c:775:c175 with SMTP id d75a77b69052e-5213e77d807mr12257271cf.40.1784277413969;
        Fri, 17 Jul 2026 01:36:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:27 +0200
Subject: [PATCH v22 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-1-ff0d18b27246@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemVQLvsoBlGUC8Id5HKABGvrQnHacgwbnQKb
 dV5Msto6GWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplQAKCRAFnS7L/zaE
 w7U9D/0Tcm22Q6sO5uCv62Ub4sZXCWkpD5YcJjqq79dBD4DQ05U8WmqZViexgaYwIr5Wi/Jzxbs
 H0IiNrfekHuE/z2T44i/LBZrpj+i1p4I/iJQIP+hNGS+clq0b77m/AXM6lGBBO9X0cGO2sfUmiG
 j0eR2WCLXsbjart0QQjpCeSxSq8/5g6V70MnqfI6Kw+UXariJasrZeVeCgfX46RpTVDUcbaSeEm
 cbgOypWN/0qb/c8EfgN9ixrqv2o4yV1RHx7L5BE5xA0elNQqbvPqNzpPeiQTDbfvN8iHBHnS5/g
 naD79zRUbLlyuSdb6ieV4PIM/UToBoh8eFyewP8aose2G/QigggMAtDjYWgGTI/ZMXC5yzd6Fl8
 Dq95srQg/noEMR5CLrjadrqMbsA/wvnFUwff/PVj+CgOWoXbdHSz5aYTrlEetqRpHQSfjRwS4ej
 kxDimCX4aDXgt3fZXejKKXyna56IIMwLvpquXbpxm3KZOEQMODV+Mu5ZcytQIW92ZMQQHgb23/y
 a5wcK4uAn7uKz/sxrmFof1bINsnOYR5BpxQ4yDcIwUFSLZzuAANfs1Nh3O1LR8Bu3iO2hqkUcJ6
 /cTHzelOUfANV3e9qB9nscOAS/tztq1GJ7/lEH1O2Tc7uljCQFSk2OTMyQlTQ/HddjnV/VtL1po
 TEFTVrPXPpnlEJA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: o3FVzcJA_hKKwy5hirKrhWaZhM4hab-x
X-Proofpoint-ORIG-GUID: o3FVzcJA_hKKwy5hirKrhWaZhM4hab-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXx744QpN+VP29
 stdNc47UsIJH+zTs8thMwEKqYVi413y4c/pZhRfBevxmYv46u53Cg4uCUekeE1N1OEfAhD4GOex
 RyalXaOq5yxTGnRYtPvK1/5LoaW9Iww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXxsQx2JNI3pRo
 vOi6FWzPeu7NP7c9vcbmYrcYY02XOv414TI3f7ozSSBnMdKskyC2B68hxa33MQGzM2nCrlcxYAA
 l/+xn5Avj73D3VJmsl/X+G4rHe/ROm5adVZdbVHd4qL9WRjglM64WobUV1dwLijhkmP8xqKzOU/
 +weK8YRWUjUD5pMJ1bTAnnt4VskmwEnfzAH7ox1GIu+90BIXLAv7JYa6reY4rl77JluHJgWG/Z5
 KRcVGtHgO05sTEcuhWVPl9/oPfxc+9qI2r38X8/f527XFAfriVsH+wCiw8BCrPw0kyY47KLKDma
 vXBa+bTiI7u2/UMRhOXAPgySXaNTbBIozYKqB7pEFYS7NDM62D9j8WEo9moMp4ylv60CiMH63H5
 X9bpxtrDnnYV7QCpCrAqnWn9jFEunTCpx5SVwSbrJTunjf42jN/k8DzagR6SR2lbuz++JVv/M52
 NvFyRASFSiic7ledZ1g==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59e9a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3

