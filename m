Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40DA43801B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418182; cv=none; b=pUSUNiUW9YPvTgMQCrYHufLP73TrLuJwCJA1bfYv3KOJLvwPBeYR4ki0vuXzZI0CxuSFqR/W2/WeVe0YDiJIjL9hguYJfeKp1AaTZNox8VBr722SW//6EzX3GIB/2Bo1yIXuqNLxVw1TVquQxqUVkjv/Efa+0B+vy7n5n5bmb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418182; c=relaxed/simple;
	bh=HDvKxpINpBdyUinpnTD4Zel+FLNhUAi/UNzRGhoHMSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtX03YJKJmhYH8Ri4xRB72ZCYXhHzANLxr7FnI2FDzZVBcerDEnyxutZqmv97yWg+CuGJ5zXBtlJ8jn+cbUPP2cdBbfvvgVU+zC1ReQSmYaJwtpksNpGIURXPp4mzcZ+3s2K122tZZGm4kk4S4eHLAbJ1TA2xIrmVTsOl6IBz1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4XhQVO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJe+Sz4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4XhQVO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJe+Sz4C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDQU01373220
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=; b=I4XhQVO/0yt5Fapx
	y6FEqK1dFBP3zbhxBiDkxGJ+C86CPlnylu5yZpbMk09f/jeabXeWZnzgB6oxSduH
	QIvOMw5QSaEsjyKRdn3wVA2y9EwGV8/kZ3gSaoSKcBGwsMsVB7iaOICypJisskg+
	6bqFzp6RodZFV6mi5oB6yyZ7SYGZEaW252Lq+EgDITMdvY8fyDgBZot20bvwYimW
	HsFzkYEyqqgywiO3Wrw3JYm+NFAxUP5T3pdMTBe7ZoHXub2loyr1piOunOkfO1fA
	ynFnggbqS6rc6c7UF0HuUANmhUCqXMLdv4qrFUMv0j1tSWYV6W3kfpx4bWH5pR3K
	cNLtRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr70bg5ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso22865651cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418177; x=1786022977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=;
        b=SJe+Sz4Ci/gxa6CcynScU8Li4KjVBj7VTlQuycAjvBh4pS4SdUCjwVS0bKSFCeEFZH
         dJszlSV4OuIFfIDmlMenxKpyf3anpYcbF+gbb7BoDOXexghXX18TjxhM/pVCvBRSR36C
         5nWFf5JN8iNYLmveVdAfFESMihUT5TFKon1TgdLJF2qs5s3BEfT8IpRzXF4wIOTpb+o3
         qtZ0eQohNL5CAJCl6SFDr2xOtXAU3WZal5NqCerHUu3KbpdR9ifFvLryYOT5kclpDZ/p
         unRZ1OYXSKAi19mZEKUFisVWyxqFZZXc1P+GcqAFFvznYbWxqecA5K4+xR1H1fAdL69V
         md3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418177; x=1786022977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyQnsFr+AkCF9FJZQJYLZH0Aizak4PdcRcM5bMpVZbc=;
        b=oSEtwo+4HILO/nU5PTsDwqD7ZEFSTIh/m9GUOHTQSLU2uKtLJcaMQkWERiMK94g0jo
         A9I+oA3jnIWVVSgWaOkHNT8Mm09CJ7mOascad+2y5MaoIgKkq7LmsJ2YJXhjKFHleKjo
         4Ku8onk24JBYBnjwtl3YJ0p3fXZSfqRUICb3MhMhYQgKtfz40ASgoGTJ2xReF8F9ZkPa
         ufhlTNZ2UiwpkmOmGDTKqHRw7ctxV6PfUIbxsQ05flJdgcIWzszqt3QevcSRM/z/WXOi
         bCGlFm6My7UejVe6p8GLMRhHypwzXNNMHWVltI5keEHvZBc0turFt4N9cFrc9ZkirrhQ
         hDIw==
X-Gm-Message-State: AOJu0Yyf0AbAjLyHKg4z/6RMVCXh/GZxxbVhCq8wv+g5boJvENQwx8kO
	VRt5YXqij3W20BAGqF1mCeQEO5nlIP6PZM7+hYLnC+J0cNahXOvrtm0NtDnx7Bt5jbzO42yImTl
	89uEKMomjO7qnN8hPdbGZuqOvnZkvSUmR34Q/cBT0sT8ZrHLdKS33Ft7ZtZY2tBA/jlh5Ukk5IA
	3Xmqc=
X-Gm-Gg: AR+sD110PrOwWy6lcM10GoyUckLeJSNC1L8Rqiso81veqiARUCGW236al5TqQmm1XfE
	QKKgLT7vlLA2170feIhXd42Q0XTHYrj1WtN14fBSpouregFn5x/1BqYIawYTrFbYagF0CqFCGJi
	YQT54x8cT6BEQryq6qhS8KwHN+8kQ4d/nXyaV9Amq95VmQ2l7Lb+QOV+OJ5Oia8HNrLCmp/9g+W
	Bp1Uatmgt6kQGgp8TCnPChtbXLleGWx5OTO/rUlBWWxBCH3R911a7MBejv+0U+g5y1sv2ZofGPA
	ZSnAKpYKwEtVW8z5tioMkBIr20xu8XgnMHxtgUjr7VjIziLb19Z+5MULvmij1J7UqmvSIh9f0Rq
	99L+FZwssQ0zwoTQdICfWIcYVFJgiJCjmi+EDdg+Gtp+IJhMNetJf550AvGdHYl4HIpkfXlfIN0
	cJdefL863XtBjY5A==
X-Received: by 2002:ac8:598e:0:b0:528:3ae6:14a0 with SMTP id d75a77b69052e-52b42c461ccmr2050621cf.46.1785418176576;
        Thu, 30 Jul 2026 06:29:36 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:528:3ae6:14a0 with SMTP id d75a77b69052e-52b42c461ccmr2050201cf.46.1785418176070;
        Thu, 30 Jul 2026 06:29:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acaa009sm2976631fa.34.2026.07.30.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:29:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:29:31 +0300
Subject: [PATCH 1/3] iommu/msm: track a context master per device and IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4681;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HDvKxpINpBdyUinpnTD4Zel+FLNhUAi/UNzRGhoHMSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa1G8k9/g5eNcbQTp950ENXclQTiusv0LgYSR2
 XAet/hi4xKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtRvAAKCRCLPIo+Aiko
 1VpfB/9FYILN4yvdF3Vwn4jVt5QhJoVPIwN0sjpqfAnTByi95EeWKKE5S87ktT0abAPbZ2UOVT/
 Z2k/Ru/yCM7HCPUm42G7XLGJIRiJ+TGSojMsfCIu4vAVXgWqO5jyv62CSaMCw8zNuuJz10C6wuK
 OVh7YrahohCLi3+ZsXvJELj0N092LIAY5idouHvL0w9oX3x279RmxMw2C2MB7OuOzowOu1ZGydf
 ZYTyz45hsbQf9YS8JQq8u8gpJJPEltmaIL+9mTTsqPdRhRw4uUqApovyaLGZxXxYnw4iKFVsZFl
 vjxJXlzNI9fWzWdu6RJh4IxnKnbjlisUbM4Iky6LJp3ctWbl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX//6ADfJ4YmYW
 lSUTu5PUrVwsNcTpkw5DScykjo4mGUydkSZxWg18PJE3jUXasUXKS4RtGNEibA8qWMa+mihRZet
 Dw4N1DMrqfSSPycy+A462ztrES8YIFnU0lR8HOtFjtQtGP4Ibe0rVLxVWtIvzwIWTxvPj4cQ5XJ
 aqvPpvv+teRpPtWeuQbYOWKcAxUx8YY8l8K7v0uXl/zgvP+dE7wxi1LYJVW7xvlB3qqi3hduA//
 IEC2oQstPdImgk7jku9z2zdiWCXz8TZjkuMGraNJjsYaEr4HyFEMU3bFmDVfaqu/81Nt635Rmwq
 soFsg842M6kjteGlcZcAlKbErGWojYV8st21AE8O0tuYG/sF8IJ7AuACunOzZq81KP7U0wzj+Is
 Du7YBCf1vj0Y58PZKpL2NjSybBDLs0nHyOFw18bHdENf9oBu+HMx4KlanMNOQpRSGTmh3zrKX57
 8ZttlcSylM/hRdWneSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfXz0qH+ZR+7sjG
 MYtCIagaRja6OpC9xGRDdE1OA1buCLQUL7q9NKdnSV/8MwJNvPeyit9VfV8fAPn9dXaXHSg27XN
 KYFy3biP0n+hBL1u/EKpSE2QEPgiiso=
X-Proofpoint-GUID: L_R-V4uTJoU3MsE9nPN6G2RAaQ_dW2q0
X-Proofpoint-ORIG-GUID: L_R-V4uTJoU3MsE9nPN6G2RAaQ_dW2q0
X-Authority-Analysis: v=2.4 cv=P58KQCAu c=1 sm=1 tr=0 ts=6a6b51c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wn2kx61HezQC-XnySuMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300102

insert_iommu_master() decided whether to allocate a struct
msm_iommu_ctx_dev by testing whether the IOMMU's ctx_list was empty,
caching the result in dev_iommu_priv, then unconditionally dereferenced
the master:

	master = dev_iommu_priv_get(dev);
	if (list_empty(&(*iommu)->ctx_list)) {
		master = kzalloc_obj(...);
		...
	}
	for (sid = 0; sid < master->num_mids; sid++)

Neither key is right. A master describes one device on one IOMMU
instance: the attach and lookup paths find a device on an IOMMU by
walking that IOMMU's ctx_list for a master whose of_node matches. The
ctx_list emptiness test is per-IOMMU, and the dev_iommu_priv cache is
per-device, so the two disagree as soon as one device spans several
IOMMUs. On apq8064 the GPU uses &gfx3d and &gfx3d1 and the display
controller uses &mdp_port0 and &mdp_port1, each instance carrying the
same stream IDs.

The per-device cache also turns into a NULL dereference. When the first
of a device's IOMMUs registers, iommu_device_register() walks the bus and
drives ->of_xlate(), which links a master onto that IOMMU's ctx_list. The
device cannot finish probing because its second IOMMU is not registered
yet (-EPROBE_DEFER); that tears down dev->iommu and drops the cached
master, but the master stays linked on the first IOMMU's ctx_list. Once
the second IOMMU registers, its bus walk replays of_iommu_configure() for
all of the device's entries, so ->of_xlate() runs again for the first
IOMMU: dev_iommu_priv is NULL while ctx_list is not empty, allocation is
skipped and master->num_mids dereferences NULL:

  qcom_iommu_of_xlate from of_iommu_xlate
  of_iommu_xlate from of_iommu_configure
  of_iommu_configure from platform_dma_configure
  platform_dma_configure from __iommu_probe_device
  __iommu_probe_device from probe_iommu_group
  probe_iommu_group from bus_for_each_dev
  bus_for_each_dev from iommu_device_register
  iommu_device_register from msm_iommu_probe

The faulty guard has been there since the driver gained generic master
bindings, but it stayed dormant for years because a device's ->of_xlate()
only ran once all of its IOMMUs were present. It became reachable when
iommu_fwspec_init() started deferring per instance on the ->ready flag,
which is what lets a master be stranded on the first IOMMU and then have
->of_xlate() replayed with dev_iommu_priv already reset. Hence the two
Fixes below: the first introduced the guard, the second made it fatal.

Look the master up in the target IOMMU's ctx_list instead, allocating one
only when that IOMMU has none for the device yet. Each instance now keeps
its own master and gets programmed with the full set of stream IDs. A
stream ID seen twice is an expected consequence of the replay described
above and is already ignored, so demote that message to dev_dbg().

Fixes: f78ebca8ff3d ("iommu/msm: Add support for generic master bindings")
Fixes: da33e87bd2bf ("iommu: Handle yet another race around registration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/iommu/msm_iommu.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 0ad5ff431d5b..3847f5f0059f 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -601,24 +601,27 @@ static int insert_iommu_master(struct device *dev,
 				struct msm_iommu_dev **iommu,
 				const struct of_phandle_args *spec)
 {
-	struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
+	struct msm_iommu_ctx_dev *master;
 	int sid;
 
-	if (list_empty(&(*iommu)->ctx_list)) {
-		master = kzalloc_obj(*master, GFP_ATOMIC);
-		if (!master) {
-			dev_err(dev, "Failed to allocate iommu_master\n");
-			return -ENOMEM;
-		}
-		master->of_node = dev->of_node;
-		list_add(&master->list, &(*iommu)->ctx_list);
-		dev_iommu_priv_set(dev, master);
+	/* A master describes one device on one IOMMU instance. */
+	list_for_each_entry(master, &(*iommu)->ctx_list, list)
+		if (master->of_node == dev->of_node)
+			goto add_sid;
+
+	master = kzalloc_obj(*master, GFP_ATOMIC);
+	if (!master) {
+		dev_err(dev, "Failed to allocate iommu_master\n");
+		return -ENOMEM;
 	}
+	master->of_node = dev->of_node;
+	list_add(&master->list, &(*iommu)->ctx_list);
 
+add_sid:
 	for (sid = 0; sid < master->num_mids; sid++)
 		if (master->mids[sid] == spec->args[0]) {
-			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
-				 sid);
+			dev_dbg(dev, "Stream ID 0x%x repeated; ignoring\n",
+				sid);
 			return 0;
 		}
 

-- 
2.47.3

