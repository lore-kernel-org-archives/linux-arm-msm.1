Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD93D3CF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326578; cv=none; b=QfciVAUCsKOF/Uw308uKjmt0anvz35xPZLzw1frbXnkuClzteKTU1SnhQ3Lal6hQd8lpmU+W3xyD+bU5jilZzG0tzns6xVd1xzdVZJuY/x37+dekLK+lfL/YemyBY4rY4sIywlulM/zLlXV/EBJ/62EbRkPyyOwnnSfOyHGJ9v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326578; c=relaxed/simple;
	bh=IaV+7Nqe72WztSaW3MG9b28k36h8V9JiDqMww/MfWcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VpoQkbmgbrAtV5Cwnjtsz64oi9QD8SQrp6dXFEG9lGd8CsKmiHYmEUk+ROlbtUIAcY4hDppVxwuTtZB2AjLbfOEsuA6dF/6fkn02CX6ZQZr86vTiAszXGtR9cNI0Io1TaQjvNI6qDmWV0RvDbm+Cbnz1s9fd1Ild/lNQIuYhi0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ZamGyq reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ZamGyq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeH7c1029163
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MAZtRLhJFy1
	2wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=; b=G3ZamGyqebVX5YIEpmKYT7Imklm
	DZChHQ+Qsqbscd3JLJsjn50TwHAs3LhSaKQ6OkLPrTLu1u2sNU8/0KHRtjeucXby
	Ujxm9V4xkJEQab8S5zNV7gwm3iMPNI5TJUVwAjHyxCN9nVraqosddwC0/l7YXi3w
	DeGitE+NM9qkZG7lScH4KE+psRpyNquHEoZpZlX9THTxss5YYfi690FjLg5Dn3eo
	tgJPeJCVsUbdqFMQU9nxdq3XkcSONOlm1cFCyfIoIuDC+DpSm2kkbPli+S1jyK19
	GmTQT0ObwIdFnoF/ITubbeKPTkDpDI/NpKEVtm8a81hHW2rJJqCWYXU7gwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104eedb5b0so100924416d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326513; x=1791931313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAZtRLhJFy12wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=;
        b=yu9qwt/bSPC/+/YPOzg5Ej3Vwh5xe872l4oCVGvS1Hppv6ZnVcdiC/cqJIVcSBHeyS
         USfDyGiXl5zw/u7rWJe12EgHR8EXNaGdf7xhZyI3MqgwTq5K26Wg9yV68jvydHpnBPl6
         aYvjaxRQdxwfJ4i7wstceyFQqzAEJInpwOUkkJlxcbeejUWr9V8RZAAbWqB6ldB3SQ3J
         Nn0KzGWnvfFThFs4L4PzV5byVTpXVJ/k8Mg3UfrKi7jGVHKsP3uf/vT540eulTUCz3wh
         PmaTcHuIxWL0kVM+EfuWABvTWIMcQVR7vnVJXuMkWvhfx6KV88Ad9pmHEmaMvxOAmPko
         TRaA==
X-Forwarded-Encrypted: i=1; AKwUvBxTvVHJJCVQYY1jAJzSIrl7t3cQ/869tY5vQIL0P3x8lGeI+6Bu6Git8vikeOo1+c5m5gwecXHkHVKvoCH7@vger.kernel.org
X-Gm-Message-State: AFuF++nnpKKz6yiA7e/GEiovD5dAXA5i9hnSbZN4FeqVGp3cwlsD+1T8
	dbt9V+6p4lS1QM3YjB2DwkHviB7V1z0edx8tH5qCCZRqCfblsTkkzn8INnYpsPjHxQvycgZ2qwo
	rPVfIhT5SqaTVeYh/fFWtKQ70n2Idt7szh6BVCKchv7AkGusu+hvs5/31XtY+hdOlkbo1
X-Gm-Gg: AYBFou1eHdUxnuIomTvpK7ZDNKBB+1Pp9yRQ/XQwIXPabGS/V6TYJOFncNUqNtsvPhC
	12jK9fl99A7q66wkv2bKJbSnq/RO3va0zaLmZX5kdj5VJtH5YgjjHOg9cKt2FqoUR33z9PISLY5
	Coxgt/5fArUeOjImNWRzneUzszzxZJoK0vdOYiYT9SHrZsbaGs9BdT+x+j92bkrsvouIoicpuYF
	XWHS+W69/VXAbKxbCEG8CMF2BYyjJUIKjjaTI28blr0Nx+1BjhfUDjYaVdYkDbQ+imnZVbha5nJ
	F6IQmiW7MHKy4En+hPSPFbz8dPsM2FMil4Sk6brPuiR98gquyEyd4MLAK7g=
X-Received: by 2002:a05:620a:4011:b0:93e:980a:88c4 with SMTP id af79cd13be357-93e9b8d9b1bmr73208485a.83.1791326513488;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4011:b0:93e:980a:88c4 with SMTP id af79cd13be357-93e9b8d9b1bmr73203685a.83.1791326513025;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:52 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 43/45] media: qcom: camss: ife: queue params buffers in FIFO order
Date: Wed,  7 Oct 2026 01:39:51 +0300
Message-Id: <20261006223953.3382273-44-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YQFxdPxBlztRyJCE_lvUdJT-UbOImao8
X-Proofpoint-GUID: YQFxdPxBlztRyJCE_lvUdJT-UbOImao8
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac57932 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=Esc8-VpS8LW7SIx68BoA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXxsdQMaKqSVyw
 QCEJg0uTtzOmRKkt8ylDmG3xGNsN5Z9Y6Yp90euJL6LeTuuHO2exLwPjN7JJVEINdeTGd93PnpB
 G4Go9i1DncVUdjm6heS2PFwnDczp3ifIZ0FujzaKvKkQxPwBw1zPdkXzyzQu+3rKIJlxQK/Frdu
 YQc6ejiySSy78buyPWo4cqG+CuSNBwFpub+5QZD2sg+7H3RDOdQJ98t7XEVRKk4ZEZdP+08Auct
 Uv3uS5c6deQgPk6Oa7tpHMfMYA7cHNVFTACvbkOsmSgN9eVmPArsAKLo0TktPB1gXbCZCyYKjkU
 IqDNAWovHLKuTobPlEr3tLkAPFIUukGlA6ONDPjPrmBatZ8/SEZdRXvVwCqdIss4Rnz9G8mRBpg
 USiuMjmGa5sxf119QV7g2ApLozMSh38URXLTFesGyWWv/+hSiawdFg/c4ZWsVB4Ww/IlZEvmAfD
 GzCkK/2ecSpGe+K2uAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6AQKK+fKb29A
 9fgHE71A+2UIZYqeCbSkFsTzYd+u4KLXJil7Rzhsb7k1b39jfv+MGqYZRGXRUdrDyQ53w7uNlRg
 EVTbYkGi4ez5g3QVljpi0SBwa92Yjbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

ife->pending_params was a single-slot pointer: queuing a second PARAMS
buffer before the next PP epoch0 IRQ consumed it would silently
displace the first one, completing it with VB2_BUF_STATE_ERROR. This
means a userspace client that queues several params buffers ahead of
time (mirroring how image buffers are queued) loses all but the most
recently queued one instead of having them applied one per frame in
order.

Turn pending_params into a struct list_head FIFO, following the same
pending_bufs/bufs_lock pattern already used for image buffers. Buffers
are now enqueued at the tail in camss_ife_queue_buffer() and dequeued
from the head once per PP epoch0 IRQ, applying at most one params
buffer per frame without dropping queued-ahead buffers. Flushing on
stream-off now completes every buffer left in the list rather than
just one.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 25 +++++++++----------
 drivers/media/platform/qcom/camss/camss-ife.h |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index ab6102fd1126..57fab10a87f5 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -293,8 +293,10 @@ static void ife_hw_isr_pp_epoch0(struct ife_device *ife)
 
 	spin_lock_irqsave(&ife->bufs_lock, flags);
 
-	params_buf = ife->pending_params;
-	ife->pending_params = NULL;
+	params_buf = list_first_entry_or_null(&ife->pending_params,
+					      struct camss_buffer, queue);
+	if (params_buf)
+		list_del(&params_buf->queue);
 
 	for (i = 0; i < ife->npads; i++) {
 		struct ife_video_pad *vid_pad = ife->pads[i].vid_pad;
@@ -1360,17 +1362,13 @@ static int ife_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 	struct ife_device *ife = vid_pad->ife;
 
 	if (is_ife_video_params(vid)) {
-		struct camss_buffer *old_buf;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		old_buf = ife->pending_params;
-		ife->pending_params = buf;
+		INIT_LIST_HEAD(&buf->queue);
+		list_add_tail(&buf->queue, &ife->pending_params);
 		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
-		if (old_buf)
-			vb2_buffer_done(&old_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-
 		return 0;
 	}
 
@@ -1387,15 +1385,15 @@ static int ife_flush_buffers(struct camss_video *vid, enum vb2_buffer_state stat
 	if (is_ife_video_params(vid)) {
 		struct ife_device *ife = vid_pad->ife;
 		struct camss_buffer *buf;
+		struct camss_buffer *tmp;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		buf = ife->pending_params;
-		ife->pending_params = NULL;
-		spin_unlock_irqrestore(&ife->bufs_lock, flags);
-
-		if (buf)
+		list_for_each_entry_safe(buf, tmp, &ife->pending_params, queue) {
+			list_del(&buf->queue);
 			vb2_buffer_done(&buf->vb.vb2_buf, state);
+		}
+		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
 		return 0;
 	}
@@ -1499,6 +1497,7 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 	init_completion(&ife->reset_complete);
 	mutex_init(&ife->state_mutex);
 	spin_lock_init(&ife->bufs_lock);
+	INIT_LIST_HEAD(&ife->pending_params);
 
 	/* Memory */
 	base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c38b96076a1f..9656d29717d1 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -367,7 +367,7 @@ struct ife_device {
 
 	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
 
-	struct camss_buffer *pending_params;
+	struct list_head pending_params;
 
 	struct v4l2_subdev sd;
 	struct device *genpd;
-- 
2.34.1

