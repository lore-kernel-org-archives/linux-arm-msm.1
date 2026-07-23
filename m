Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC234734FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826592; cv=none; b=iZfzc+UBZovzL/l6NkU7JpVBoNP1HNZeEKEbpFuDMpe6RYrBxtzSxfuNF04LKy85SODv4TB36PrTZNizaWTvaDtSCYMT14Q2C7vtT8jdYuFz1L4DUIgW6B6W8afo5nrnh5Q6VuwQqOpt067hqUbealEqq9ixnnKn1RPZjsgv3SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826592; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwUVjHtZ8sB8XH44jlwDL5IVnn6a5MLmKZmJhDBaOevDhBWPaobWwIQLVyJxrDmiufC4rzsSkyCjHwvlKNRsslHbVy7XJjHttEkKNfkLRN1XFJaWQB0TGFuXk3b4ydAmc0kfe/bjOpH8mTwB5WP/GnEnpaxv+wM+B7qm0z1U3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRIiYJkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hU94pUNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRIiYJkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hU94pUNv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NG594Y482788
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=BRIiYJkTaFfnRKez
	9LFca34yN9Nfj3m5sF2P56gkbbN9oknSm/E0BbCk9VnxVaFm+K3wQnLChMUqlpBa
	Ow/htXbwIqbth/AzJJJhRtn3x/oQg1pJKGPHhP+JWtmsc4mT2XpO66TLkKhI1MOr
	3g/SfVK8Eals9YmUrtalyfaDqBh17pxmMi4o5QeBT1Hi6+t4L/2XR+LSRFT08ZUc
	yOOaNJBxDcKBxhgJTsVuDeHXkDoIp+i9GVceMifFMS2/rsIeCFwzB5pPluWRr1Dv
	1H50PyMV5PD+1DAhJr6lf4K2342VuUWQoAii7Q8fLCy8QSQXA8avikpjL2U43+F7
	4ojt5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vg9th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:09:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso10200401cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826579; x=1785431379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=hU94pUNvxt9W3+xpacarcmrSaMfK0jEa0AOjy8FmvLqiK5U/bzvw+jpVhTrEqZlupJ
         IGmTJ7U8FiO0CBkiLWE6+dWB7YeV7IgTCaigDfPUp3cUiqKh4IN0JrUFY/vzj6E0Wseg
         LQKE7ZvplIB+nry3VCwubC44SoSv3jOwZ+8XbRjZ26kJ01UeLLHWnsWPewRKHBOmgE/f
         FO4q3zJoHWMsmHbIiiPV/d8qeLmn5XCSb1IC4zhM9IafIEwbMmoJ20Cx/wFIBJprDK+C
         lZ+48Co+h53hkabm7p/hU5DaFkHGeegBXAOR3TS6za812x+C0wYgnnSyE8aYLErK0GrK
         i3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826579; x=1785431379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=K3FapFFIaznctdBHgW4cj+BGzrrvSzr6vomv1X0La1aw7RMftXOvv+OOh4X3rBvt1q
         ABqpotSDW8MZwx0FEedkG/gs1MS9xxDNuzQfsx8Hv9WA++caq/igzhm+JnYYn+TpnrlV
         eHHZqfnz0WOMDQRFPkYTt8h4cYXiDiwpfNPMR+zXnsEpQ9u3S8augA0EyiDTwq98nNVe
         r2esT84yOpAJx/qnks0gnBs7nUnj9zPRpjiSALhJ7G7wOjFCIobNfXah3Sgawn/q7eED
         Np0KP1NaDztrdznjsuBImnkqsOJvzPP47l4pZ0lQcGenLltxLIsjp+K0JSGOCCZDgY0d
         K1hg==
X-Forwarded-Encrypted: i=1; AHgh+Roli0pAnWZ4RtAhPmQgrc0MvIWG4ZI1q4mkXXMHphvKFFpliBkvVbrIvI7g6lHI6Ry7yxG2yqlj9fgKnadS@vger.kernel.org
X-Gm-Message-State: AOJu0YwHu2AR91setqsN1WsYRlMKjZTJi/jIMCS5WDUd0qI6FwVHOdRu
	4Dnh2yFaqPvTESy8l+X2GJPdeFHxsqrGLIgNPRvKZaXVPZ/b0yATM7/sE5lGWvejsO1IIwQ+t3z
	L/wDi4mLcZKE7pJZEZvv0Nv6Gb6IIGNFZxBvg3cym2vSeeWg0POkIGsSEcWkPeqZIac+s
X-Gm-Gg: AR+sD11O1wE49ydx5AZEcU7nEqFEopTbOFL0sFdSIcl+XHnYaLY+N2Z6M1X1JvFpebg
	lu0MTKiiOpHpwG4WvQdpHS+nhIeAfHNidxYLmuzek46WsOgxOs1aKq9tn+E/9b0BUjUaFJw7jaE
	QqMYppmeRSIQMjcBdwYrl/YjlDZjTyWBpovDoMJo+Gpu+HGsRtg5JwfqhbxmHZMjWYZzoDqdwjd
	qYkpqrPzeEISbznX8UqbPPz2PdIyo4QChk0yLEaivTDv9se+MHvub5L3Qy7UrvAcwUgAr/jkO1U
	S+QQ6fmaloi4XrYHiw0VnBXvd96X2un6Bt4+OurqjGjo0bgdAWrz4mov+vYuxFjUEQv3c9r8DtT
	068wjg55bzi5So2Grn03JjLxP2hCL
X-Received: by 2002:a05:622a:2307:b0:517:146d:2cb5 with SMTP id d75a77b69052e-5283edcea45mr34172201cf.20.1784826578424;
        Thu, 23 Jul 2026 10:09:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:517:146d:2cb5 with SMTP id d75a77b69052e-5283edcea45mr34171681cf.20.1784826577854;
        Thu, 23 Jul 2026 10:09:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:07 +0200
Subject: [PATCH v24 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkq+c6LBTlXt4m7neMwOdfL7vsgLIh7+nkKfc
 DNZ04kVDdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKvgAKCRAFnS7L/zaE
 w76vD/4mgzkaYL3ZdWpQAtPUlCh/fnXkz4jgHg7jckJ1RsVEWNsBm23V5l3kePvG4QcjSJBhzXi
 GXtJIILk97K5O2f4GQLSAm4UFpNqY7TsCxsx9W7RSb+DeuzrKtmV9me1dezD879KziHuazLJJrQ
 FNm5zBJ8CRuHQKgiXgtciq0FnbV6vTsOqZtStN3VFaTkZNFQOjHecJxdl5ZpaDFNyaff3+juM2g
 QCvAIjcFhtGBqQb7YAion5P0AUKVs3r0/NX0J7XiPjH3tNKY56z+q3zT3shmLrbfyOPLhyKeGS/
 Ecpr9wENWIYKvJK2DRDtFE3MCLV8FuZYUqvDvxIpNvOTpMbzYdmBtYhoVFSPQQBPo2OvJ5dyOIS
 K5GmTrghS0ayU3SxKmWAe23fHFpoEUrJ/8N2dSFAfA9tHGC/B/MUv7qdhcQ7EK2Gxpuumfy3Xgi
 dJ5nka/napQyt//M+9enVm4uPqgrgHpcpt4A6r0Asa0XRybzgGowPMKkgDZzKgHMKKg4TgIzKs7
 p4lt18eMBbr6BrsirF8z4vO763JZUynWVZEvfh6eMwUp4smDmZj5p4EQuQBFFntRvEkRMFtbkDM
 wYWSCTH9IW8ws3sAAL6Dd0JVz+eEdwolFK2LOktJjfWgqX2XAICL86pWHXLBIl0xtK0AZw5i41V
 5EcSVG74U6om5iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX3JjtraeNLpwm
 DNrmi9PKmGr9bo2tBJI2ktutjFLE1T6IeEAZYWQVp0ZeXrbFGr/Ex2GhVG+Txe6mEnZZqVTL9CC
 FxuiNJRV9AYTsP+Q90l+vw95TXp3HZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX5Ggvcb1zKMPv
 lev966+U0IQDyg754fX8k53V3nzVYL71Y5fJ4mEpFApgsnJdidxD37Kj2vp1hOBdnj+AQLpGA6j
 /aT8r9l3eTwPqjH84ZK3dy6TqUkCcNM1FBKxtJMr04cd1NGkyUPIjtYRvn19BsG34sBE0vl9+Nc
 FWlQrkYG8Y7mRMe4R07OIufBY+4exaZhqG6zwKlhdSqDEWANotTJGtqhFWDKwKK6s2wLjXp6t21
 APHMbEAznlamPm8prcfRss3MB4LLCSxcEjWnct5iYPxoIkumpTZSFsHCm0RNnhJy+o/V5MWdFE+
 ePDLyEyQj9F/u3zmmjB4Yid/WlcCCH141ukT2tK6kBmRmfNGj3qfonaBmrEwvB7HKLtvEeAp/QV
 UfCSJBXl/2x4uVUJcrCIOc+TQEXIntGizgO6Lzyb+KFxHStTKicUa9w/pjtgHin1I0rmWDF8fNQ
 Hch7pmyXRKTwu2XiNNw==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a624ad3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 88bs6yUz5xIssVCawatq3Nt87WFJ8Y6H
X-Proofpoint-ORIG-GUID: 88bs6yUz5xIssVCawatq3Nt87WFJ8Y6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

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

