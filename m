Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C558501F54
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064408; cv=none; b=rMM47kfl34fdR+g5jGX9UQn4mVLyYyYRoaEwq6L7cvRq3nIQgmn5qr67wUjbPToLthvsrh5HppDZXOvFP8CFceSf6C7gy11r5oExTGbTJF8eKWg6IGlZ5Nx5swMC3Wc3sbI2S5a+qHJxbcFlDoYJ4JN2wgEdxsB4By9WcGJt5ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064408; c=relaxed/simple;
	bh=9uiJaJ4e2BvkUloOW2tLoZeTSbF9MZs2h7FS104pW7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7k1mY0/QZaU2exXfCXyFjIb2kdik1B+gqjN2D2SRmNzFJrleQdnJxXxyWb7voLalFFzUGln5pl6rEpOLkq+01raahamM9/zuGVjTLtG6Ub7WURSsSdEtpC81olGSm7UNUOgsC4/S+5hgUQJZ/APRAACICenU6HA6quj/fGCDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jvz45mmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INQoCzj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jvz45mmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INQoCzj6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jHXW4077449
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVvQmOi35PVuIVlVsInax0HmLCBph4ogykLGZROUzqw=; b=Jvz45mmC7KeRae1m
	LASzFUuUyxAoZAQV8Nn0pCNzRLDHCfj5PPAnm4ZSh+gIEfyknqYnlpKHpTVMu5mu
	t9dkkMqxU2TGeEoLqdiDxAGrzJuUQwmRYiABLKqGAZ49lUeHZYdnz7NKMDiiqCtc
	lQO+3ZzLEbojFq5T2m0NP9FVV5xD9Ns3pworJjoWr+8JqHfGG8nd9+H5TuvYJW/I
	QC8ZjfvWmUQa7/t4qiJx2wlTU07KD/VjVuVVC5zTSsFPyqwJxREYIV7xblJ48Jnl
	zAJfpZ2u6Aml1A3svS99+QtgebM8+60UPBWq273Cxp1ZbPGpypS9oNJcIUSCs67u
	2sLmkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0gfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:39:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso11077729eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064396; x=1792669196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVvQmOi35PVuIVlVsInax0HmLCBph4ogykLGZROUzqw=;
        b=INQoCzj6Ssxm1F4wP/CWnbBOp4n/HjBD6djaZQoE9pWZ4oN0DiKhHmVKCCNEtjp3kI
         8u6niCP5jIbdVYHKCT/zkEZcJg47Nk588DdwZpoXVwpxCb+L9zFW4k9gGxlCOLuhQsWt
         2Xzvp2UPDCsVIqXqkrVZ2ltjV20ZqLNN6wlQM2HzqPFnrODtOx7UuvPypn2zb2CAli5h
         4Fg3R21zsDQxdzI9sqih6SR+/UFaBOvSsu9BB0wJLBZBVyo1s9XKv53PSWD0rjnIZ27H
         Vj6I7xV6dDPPtDyxNDhudeUnb2Sm3Wj2wVqwHy9RHF4lHEcqIuyTv1Fxcjy/BXEirQpE
         /0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064396; x=1792669196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVvQmOi35PVuIVlVsInax0HmLCBph4ogykLGZROUzqw=;
        b=k666qU3oTISRbmwiBiCyjCKHNAwcwOYRf4W7GSfMmqhWygVJXmpyKS3TibfParfpCV
         hYdx4kbMsPdsLvOSj72APxcuI/WD8jPPls2ROmqqc41JeKY38GzOKi53I/gvjStr2Jb/
         LRtcnpIrpdhBXU84LLLkZLOJt28eV+wTE/P8HwEzeRK7wP60T1P5JOyjMJui9RQQhIlP
         tGUk8x8NyNprML1lxbXoLDji+G/uwGYQWG2YZhJ5C54cK3rnWSQJFA4wsxc2R4bEqyZ/
         B6pSNLD0lob/Bo8kCpzoIp9bHk+HHeMVl1tRCydtpatfJNyr/DMVAhQ5uzpawsaXDUfI
         9fMA==
X-Forwarded-Encrypted: i=1; AKwUvBxORbBXY7aRAufghZNwY0+FRYA7T5MMoZOXVmO40O0tFVhf14dgBwWpYFoonOdtcBf4N8jUqFh8X6MCH/6h@vger.kernel.org
X-Gm-Message-State: AFq9FYJJExug18F2RlBBKquq7+KCj12nU9y9vSPFEtd0XWLHWjGKTy+O
	78gogrYtihuWkOuXl2yDhMTmuILHhrTulApVdducemB4VYe3UxKj/SgwxTzAeB4aMQi4Zndhx8e
	05WbHSX44HvmEKclSJk3/e4jBN9cf2u1K5ZEsZMvS+Or8cMvQ5yXRGbpZOaua5Z8vkDrQ
X-Gm-Gg: AYBFou1Nxc6atzchcN0elLM0ZJo6kCHoOborCjhp7PbuQqUzr5MIEOAsQ3N9iCr5i6j
	Kogd9Q0d6c1lEdqpwzEYPvFyHf0lCqbpm9CM9gpx9lIrGLz1NPOpwzrHfdWlZ3/jicuVN169erH
	cctYAmX3xA5CMRDR3cTzJmLLKfgepwbHPWX2ZUHi5tfDspz4VFyaq4FF/xXplPbUHPM9ksPKX7Y
	x8eVwCv583DWyPNotZsa4oYfCeU7kVZSJlwfKRe8HibtU5/9EhWELq4toGXdNNet69o18hXrJKz
	c4tbArXhWUw+DQeBjFA7misFLGzzYU9AWt7upZhCAF6zw2/QIUQBtS+tWRtTo+4UVm9YuVQ5K6n
	e7cnlmRwSat8EoYws/DlervtSdg==
X-Received: by 2002:a05:693c:88d9:20b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-35ea11794a8mr4574850eec.17.1792064395623;
        Thu, 15 Oct 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:693c:88d9:20b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-35ea11794a8mr4574807eec.17.1792064395019;
        Thu, 15 Oct 2026 04:39:55 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:39:54 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:36 +0530
Subject: [PATCH v5 2/7] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=2705;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=9nwxakqFfP8UgReOaO2Eea23hTqKM9MMPIlUczN1Z6s=;
 b=UkRJN8bSt4b6EnQU3ubL1ILyxwuJS1HWSKjasS9fhq8FDLeNUuFaSzuD4TdzGcB3vXDyV6Xfx
 YOONo+3znsXCwiTMUI7yD+YULYAXW620IDo/7pWVgHu5Li05FEmc6wc
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0bb8c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX1ZezyhtKD1t3
 zqQYPpz96Wr7pbSCTphQG7QgmlEcsguBIcqWBMGj7hL7i3VSoNfEk5bYd0XaCeHOKeBIozn5WuM
 c2Kz3mEvu8QKSBJH+nyuKthv9BLIXnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX/ruKPZklIp4P
 azQNFTb5X4eqAvzsGrUI3qXtazMuXjzjWP6vaJblZuVisKKtOBClaW68QHD2y1n+HLi3rawdufZ
 FlxbTZZoSwNG/xZIHveTAqrkg88vRVd+iWff1zcJ5qnYaBfnsdzAyv5uTIqpi/qydzSCeVY94Eo
 YkGx0MAU56MwcW/EMCfZzC3mfSEFb2BzLDrkakPonl19SIuV7pu5mb2rXh3BUc0ZsJzWlApEv1d
 sk4oselJcJhSmDa02krgPMLcuDGqzKugdjF5VXbEBSIk1vIBKkfxQbJ4UaYfqPE2OPoeMxptd1a
 PrkAjY1/kzt8Nmz1XIreuFzjp1on23J+aknazBl9mBIz+Q/5vU8d36uEcmUpI2GJjUluJ+RYr40
 L3yORHHBPrU5YuHDzQe50CmN1ELcJi1ztjEq6itJwpGDK8V82eIudtvMrdN7QvjgCF/nkG04Rzc
 M5ySLvUiwBhMGF3kRjQ==
X-Proofpoint-ORIG-GUID: xcIbWr8LF91LxXeW6mLk27xHu7OjfPLr
X-Proofpoint-GUID: xcIbWr8LF91LxXeW6mLk27xHu7OjfPLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150046

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before forwarding the request by setting the origin
as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
privileged object-based calls from the kernel-space.

Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 12 ++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 30901390149c..a03a3d645dd1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
 }
 EXPORT_SYMBOL_GPL(tee_client_invoke_func);
 
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param)
+{
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
+							  TEE_OBJECT_INVOKE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
+
 int tee_client_cancel_req(struct tee_context *ctx,
 			  struct tee_ioctl_cancel_arg *arg)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index f3c5e106d853..369c87ad0205 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
 
+/**
+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
+ * @ctx:    TEE Context
+ * @arg:    Invoke arguments, see description of
+ *          struct tee_ioctl_object_invoke_arg
+ * @param:  Parameters for the object invocation
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
+
 /**
  * tee_client_cancel_req() - Request cancellation of the previous open-session
  * or invoke-command operations in a Trusted Application

-- 
2.34.1

