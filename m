Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769514;
	b=xeEDQ31tEM8TJI5luO56MmEnklJVqY8gWlIDwBWBZFUWm+JjG2GsU5MUQ5Z5gZCuGqCC
	 wc4yj3fXL9IySBZdeKmH6PtFuDCVi+KOPWFMNWP2RHuAcS674Jhd5JC6L7W0W7d3TXdiq
	 ZO2skEuurCXlnMKdx1C3xmD0yP+LlMp2xIpyeFWuwfcx/RDF4zfOPPZdnjDMI/89o/isv
	 vwo2DQ0SWlqEGgP6dc9M0/fpWjXRuPaDfFF20ZTsWGYMFLDtVkju4HED25qrhI9ALJxiS
	 7luLkeXzMEL4ETxDuPy1dgan8vt4hhnc2m5Dfp8qKpV/RnrUNuVuUc9t6QMT4B47z5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
	b=WvfCP+y96E273FXlWFpdFk8AkdU1/EZpqbbnhswQ3jnZeHD3+l3T/O3CP/ODazF5bM/t
	 PRy9DOgbYoNpfDXveK64kDbI4Ol/0VJDMjDaqBTPDBL1KJFolMcejumvCmUQ4iJLmxg3U
	 Ngpn7LTIJ5Vy6EMqhJuhYz/mHMUSAumEmRwIFOFmE97zmAFsH3fRRmkzGYKmah1Y9W5vu
	 fj6ixY3stoKn6X3KPdX0Ng2yAOx3BDTGxvAKZEFXlVy9l27E7TCPv3BgiC4xPXBvUqnEc
	 56nZ0Ydo0wF3JibO9ASSTR8E3ygnBcF/TjOFzNOBi5t79HoR6+YIpYDusX8l321u0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StF+YeLY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i9XrPH4N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7742606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7742606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StF+YeLY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i9XrPH4N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6D1s2462574
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=; b=StF+YeLYDSVzUNM1
	6mf5WseDRSzF98fvo2Y1dKrVmtTZY3CXZKzouVbKv/3q3HcYIUOr6OXHZ8+n1uV2
	0WPJP8YhxapmZcoOi7u8R5U4BwMeC8DK6+iIo/QMFKAAZFIwj6m/5GSvsa9dNrRC
	C7t43US/d8yOOMUMTDN9fvPF0fvi00buSZfGhoq97EwDTmpongSWPFRrcUNH5Zgv
	lfCioEFkFCHm/DEINYRGCd5nZme/UJbp1A0FFpmT3VyKITbWwBHLU3Mev7OP6hgN
	qK2Fxuy7s7Y194kPIntE9mzsv4aOqNUG07AVLKsK8Iqusgh2T8G9xuIbeWCQ3LPH
	MtMe3A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvc3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso280385137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769512; x=1793374312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=i9XrPH4NI7v8/jTMSRy38zJa0YgGnT+B+KvuHIdrgdvQns+uoIZLjMPQk/tDeJVFP9
         9BtqCEyXvXjNnvATWSEqbNalfWt/VpFTGShh2bifkJ8L5xUUu2MUGdsDGnDptxDL6Hoa
         4ZnYKbutcyaTuWB3O95i9RmEqJlHG9ow6az4BrEGd05ZNZw70LCIwDh6XMMqLRYLiSkS
         gQEFJvj6+0wvDWt/0ev4e0CEzbV9OX/NNoDJORAJJMEcPDAicHj368MvOey7RSWnq/ci
         eTySoe4wT8jTS7oDcRJK6pkIW7WJJ3fr/ZdU7c4wiG3BPdnmSW4yKfwE/S/mvGJMdtRv
         nyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769512; x=1793374312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=NLGpzszUtqwcpYJLY8Vn/C+aL1H4UplIq7K+vwKbWEqRUHLXMkImkPcbjaQKMNwhnJ
         nAEXdfaLRQXXYSAXpgii0s3txrpDeTHjQ4k3ncFYAonJk88iE/6jnzKZGsFD4AgwE/MR
         UESsYFAyjEvgH9Gkf2mTxwjoh+QDmjtcBmGECOuuoxw7PwHG7ym3S2tG/5KqMvBcqip3
         uVzvDmr/h/GK6JgTxOXTXdPKwSc2OYqbBD9asshZeCugvoWfswIgGQjzVHjLotC6Jxox
         6lYrxpydI5ww7lefiTqzEPJs/Z375bJT0hBNNxz+iEsRDklllKo8Pm3mjusmglS9AYWo
         ZMJQ==
X-Gm-Message-State: AFq9FYL3Y/2wpemSn2Kz928flZN29D+Vf4+MF5XM+EGTDAND4NWL8LDi
	Ryl2g9cxDgnwQQmC6go+woO085+s10bXqqeYWkYoeiXfQOHr24CQ1l0vALO/WGkuqCXgngfwmb+
	GmDqRUYY2MAxsSy1mVB2kHphS2a1LGwUlw1HvBeSclZVof6LxgrTbaXJuW3y55ew3gqaA
X-Gm-Gg: AYBFou00x9YujZUubLWHiZLIIAXf1zRFrHVDmcvV2faKbpVmbRZeKs3CAr+htXdNYK7
	QlGthdUUSBMHwxjgBRqacqrXdC0FpOEE7s01KlMqNvlifMlDf0QHXe+Y3NAAoPsavINFMDMf8dM
	kxO9AwQtOtP9WRwcVjiWGeOtszWXY0avf7/QxolUlzBTjwMLdrorYnglRrTkqt6Jxpzzy8AMahk
	nI3MJPgVn+WX8Knap79j9fx+Qmkz1V1Z+AVtS4M7o9wsoCtov3svSPyuceXPAudvupj8rRxND/L
	dYjJXx+/UwQGZtn2of7/YYnjw3B4ekdSF5zbtT+xijjs1QRD3CMIpVNhx2Xri+S05f1ius1GVnH
	gl85u3qsoEKMmYU3tlg57UkSpQ8BqgVBM/iZ7zuZE2WmZP5+2FqM7qIsa5ex6NCyYP9gSpMzwsW
	fUhx+3unLT3WUl
X-Received: by 2002:a05:6102:570d:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7ccc33a2d26mr929949137.21.1792769511855;
        Fri, 23 Oct 2026 08:31:51 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7ccc33a2d26mr929910137.21.1792769511350;
        Fri, 23 Oct 2026 08:31:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:19 +0300
Subject: [PATCH v2 04/14] drm/msm: order the display snapshot sources
 around its worker
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-msm-kms-destroy-fixes-v2-4-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3385;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iM9tCgrXdMoAc0lpkEnlYv/1Wi0+ANIcrUxdVoj0Zoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233SzdzYewQmxR1JfzkOVurhbQdQ7mJHjZpww
 nrzNLJwNgyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt90gAKCRCLPIo+Aiko
 1eq3B/9ijW/ZBpeGSKPZauP7o/sehHu3RRTyq3US6wN6m7TIKdx03UD/IYwH3+twG8XoqmXJ4xb
 y1FrxxyqFV5V0Uz7RRaCbcD2pzty4FSTdlpi3RIH7BYkq8RC9ypgFErF+M1JejTaM+JZb5O+B3o
 EnjHgOtlnGQbG8Mkaf1FbHBe7Qnl26PXvNQEqB3Qhrsqe2R3JiB0C7nxi0To54VzeDIy1l93N0F
 AER7EOscf4UbA5++R9qzMZWgsacmbELKuATXUs3yI8ZCoNeSWiSQZnGyLwPAUBX5q5NoPCCzyHK
 LgjbhCiAkA8DtdtSEqPj+qSiU3Jl8clSSliekw9wM8Bc+GUT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb7de9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RYZzOHaK-VtI4H7RTV8A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: PByH0ltbDhsnssLlUUqxhLWzNWjotXId
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXyLQRu8plqMl5
 LMt9oDrG5qN8Fuds+Yk1BPEo9ao9LFPAhf63zEqrwRH/ih5h742gOvt1CLa8f5EHUSdLs9gCmeS
 Mqcz/RkmG9Irblb5sJkEHbgTrG9Wj61AvvNdi/NUFjw1bWVp6d9AUPPvS4rpDg1omA8xqnq0lXJ
 v6FOeIi0n7WKqI2dBnsfqzkCAQ8qiWOLqZ0OqzHcNWOCTWBFi/N9K0DxH2C7vVNferlBiM1Wlzm
 OP3q7iLRTxno571GLImZyBTgkXOgZCUtW56tqX8dXRgephkRRXznKVs/BStE9uhYnDSTC3R3n7h
 LvqwzbH6icvqAukiRHxrLQ1xw4bIJl7R9rwPI+BZ/nQgeRcZZrCtAvpe9irzkw1fgqRnhNjT0lQ
 BsNjSoSP50eWYaOaZ2PSGUMoP4uH/mMh2PfOmFzSgUyfe/KnrTtq1pHKJLtL+IU2hgDBaRiqcUe
 QsHRqWnsqrp52sa8mrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX8dN16mOWX66h
 KNgrbzQf6WWIVuCxcC5QbXWIhE5HgpDSDatIxnC3yPk5zKPuGyKs4ldAl8IKKr1tg5mlhrq2WpX
 oAwDXOTOpMl+yE3WG2/vaiqsU65KIA4=
X-Proofpoint-ORIG-GUID: PByH0ltbDhsnssLlUUqxhLWzNWjotXId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The display snapshot work is queued on kms->dump_worker by the IOMMU
fault handler of the KMS and by the DPU interrupt handlers, but neither
of them follows the lifetime of the worker:

 - the fault handler is registered by msm_kms_init_vm() in the middle of
   kms_init() and is never unregistered, so a fault during kms_init(),
   or in the error path of msm_drm_kms_init(), dumps a KMS which is
   still being set up or already being torn down, and a fault after
   msm_drm_kms_uninit() queues the work on a destroyed worker;

 - msm_drm_kms_uninit() destroys the worker before it uninstalls the
   interrupt handlers, so an underrun or a timeout in between queues the
   work on a destroyed worker as well.

Start the sources only once the KMS is fully set up and stop them before
the worker goes away: register the fault handler as the last step of
msm_drm_kms_init(), unregister it first thing in msm_drm_kms_uninit(),
and destroy the worker after the interrupts have been uninstalled but
before the KMS itself, so that the dumps still pending run against an
intact KMS.

A fault during kms_init() therefore no longer produces a dump; the KMS
is not complete enough to describe one at that point. The handler is
cleared with the kms argument left in place, so that a fault handler
already running still gets a valid one.

Fixes: 2ec5b3dc18ba ("drm/msm: add disp snapshot points across dpu driver")
Fixes: eabba31a839a ("drm/msm: register a fault handler for display mmu faults")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3e39c3907a9..a94d2888a21e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -182,8 +182,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
 
 	/*
@@ -211,8 +209,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 		return vm;
 	}
 
-	msm_mmu_set_fault_handler(to_msm_vm(vm)->mmu, kms, msm_kms_fault_handler);
-
 	return vm;
 }
 
@@ -245,6 +241,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, NULL);
+
 	/* We must cancel and cleanup any pending vblank enable/disable
 	 * work before msm_irq_uninstall() to avoid work re-enabling an
 	 * irq after uninstall has disabled it.
@@ -256,12 +254,12 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	msm_disp_snapshot_destroy(ddev);
-
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
 
+	msm_disp_snapshot_destroy(ddev);
+
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
 }
@@ -339,6 +337,8 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 	drm_mode_config_reset(ddev);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, msm_kms_fault_handler);
+
 	return 0;
 
 err_destroy_event_threads:

-- 
2.47.3

