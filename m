Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE81E2D73B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457938; cv=none; b=eYpagRhSghjISNAvK7zhbwSthhvYJpb9EuPGHsYEQgGcOSdbYHJPkZEAs/+F1qrLmreaM16z5pd7KcvBNoJaEBh5OZpmKbwF0etqN1+3je3K3JRxLwd2ZV1yQjwhs/6MsH8KwssfSEc0ohmgQSKcuzF9Pov36H61L+6kCEF1aYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457938; c=relaxed/simple;
	bh=AtlBxAnhMsZ5O/g9dbEU81FBTz82waEQwGjM5JZ7NJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUTWsIvfrpXMUYcOt+o1S5iU17+E151C+lA5ufPFVLfFe/FqpY/SPcpJn9J4AawKrOWct/9fmGtqpAYIldHlyQ1g3YIejJrpaFEatwApr8a252lIdtSlzhyoOSOTeng1InWF/okJqEj/+agcCT7y8TPJ8IL3/f/XC0m/e8f6lYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpDTKrtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PE3whfVC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpDTKrtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PE3whfVC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V0Ink13564071
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7RLFBUQEX78LH/H+CTPwK5+ik3e+0QJasHFVlabl/k=; b=EpDTKrtxYhp22C4Y
	Lc9v7in4NGRF+4cuSgBOgqQuiPbmc45MgoAYqpufLxIls3eTotLuMGY2wSF/vqUE
	bNUxzmcwJ4QOTSOGMlQQ9V+Zum21zEkCCxhN2pmyT5C+lTunTqPDKOgINKcq/w0r
	k+nK8r8LUrsnCJG/Zp70l4pl9QOAkWAhManfzWcob5SfSQ5glR4t1Qgr+2UXCZon
	BmzXPzZAvMMCPJoszn+wTSwZs88M7gQp6xPYTyf17G2K8dsHzlZYCkd2mINVW6n4
	iG+VXvpXD3nyHXp18YBcbqpRKqKNMALPfKua4iavhsOplLQWE+SVfQUbjz/zGyDN
	YjtT4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frh29011n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:32:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so3987571cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457935; x=1786062735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7RLFBUQEX78LH/H+CTPwK5+ik3e+0QJasHFVlabl/k=;
        b=PE3whfVChfBywjfu26npO/MciLunHZA57H2zwD+nBBAxTImaXVlvQu7sfVXcDiEQEz
         Pmqmb3zHUqmPnhjdA9p9jgowcnH7fvveGxrxzFNFQBztoV3eQJV7LWrIGwrtO+xJEYiE
         01KK79whrwZipmx3izQaClPWV/XbuvEj2Zp3C5U+oSXLwgL+d/x7TsE5QaBfu7SHuVlr
         tvrbKgPfX88iVBVvdjdF7/zejVJS+0lAiLsf9cQNglSkzUTcvS6VpCQw3Gk9wtKmhqjl
         adi8IxOhHDgPZcNpub5tZqRTlr30czthRpMliW1XXrLJjIRrDMtcBSxtyQlHJn+wb17E
         ScEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457935; x=1786062735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7RLFBUQEX78LH/H+CTPwK5+ik3e+0QJasHFVlabl/k=;
        b=Wtc8qLSgbUZ/CmOQvnUhsRjLzjlTzMXAy70OTABwrYxXVJ7yM64EnIVJgN0DlQUNjP
         SYzx6mgU57Iy497SegN5m4QBZE9Cx8wr8u7c/sUSOVe5XtMueLhv1emLHa2O4sxKtSaW
         pLxTKGsXz+v0IxYgIn30t+ucGhB90yq6QhtRf/5FkkwePa7Auc+vCW8dyWatqDFXxCUl
         pzOI0l9BeIsMBaSp24qFtKUP6fMpXBTrxLdIKzwA2OAFgHysB3MCWgUx+hoDk1s5gCAT
         GDhgMdKBCNQGPT6tj+ANe6MwZIaC7eqP74gisvuwkxE3EJO924QHiBiyndAykpDHBPK0
         4tEg==
X-Forwarded-Encrypted: i=1; AHgh+RolEUdAwkR0Yy118RSZzF24flm10ynOUU0vQE3sEGfMGWQeEkMTJCdBLR2RxrommWo0bw1rlSj6lgGQN55z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Fthe6xNVO6zardsHH4TOzJQdxdGXfGSBdRHgfjpr9rqCFa9I
	gSw0C74PNgD5xFU031EdHIPg+NCl7WvJf4PNPlEYgg6drRV48mXlVgt435r0EjnrSEWP8fM5eh6
	9Jbf7ZHMZSGwRd+6t8mmumzXCmoXxid9oqhqMMhFKK6H7pHnZcGoK/1pOvwAAbISk3JUD
X-Gm-Gg: AR+sD11hUCjGWP64f/JdNyseBniybyJHhUdMA/jzmnX1MW69ra7oS7j4LJiWcogoc9s
	jx9AHfZeXXRjoqpwNh43bOE9N5uU4CUgWHLw2wsQpIxp+/IV12D3NdD40x4wm7bG9c7D7YLjN3A
	N+hUq3GARjYWpXqw7+fmvW7robxqbg7P5QRo6s8Kkdam2JCatQ7d6jWvn3mXanBk+7uo67U4C5E
	Qgv1GJDKrtTiIBivgv5aT165fxanyEtk3CudPHsl/0JLA3++xOFxWpWMZeWv1m9YA6iBs1y3pK6
	98RNntci3LD4hHejkHviU1L+97+QK+z2qY+B3uD4ScJ+DuZSJIMgOqswHXlXVje4MiLDN635IXe
	F7fNXcxzJywhfup64vvXjckesuqW+ikv7Jy8vPa9XSAa5ie4urQGsxbn9i/WUxtNka8zMXGjdta
	/+O1PHfOnfqQNyow==
X-Received: by 2002:a05:622a:138b:b0:529:a553:9d6a with SMTP id d75a77b69052e-52b4b1d6ee3mr621761cf.63.1785457934778;
        Thu, 30 Jul 2026 17:32:14 -0700 (PDT)
X-Received: by 2002:a05:622a:138b:b0:529:a553:9d6a with SMTP id d75a77b69052e-52b4b1d6ee3mr621491cf.63.1785457934325;
        Thu, 30 Jul 2026 17:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:44 +0300
Subject: [PATCH v2 5/5] media: iris: reference count video instances
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-5-94c002016a09@oss.qualcomm.com>
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6840;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AtlBxAnhMsZ5O/g9dbEU81FBTz82waEQwGjM5JZ7NJs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z8G+KJsJaJZA+Z/kLUlMNwZgz5wI+sRhn8q
 X92vfrDnvmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs/AAKCRCLPIo+Aiko
 1dlvB/4roW4ncetMvD7EQPWle46DiMNURUIjHRBA/RJKp25IGfZE7vktYJj3lil7KNctMGFgx+S
 M2M/P4Cn7GpG0NyPrSIsrpHXE1xZxGbkrh57LpxBA+9xHZfngAog2Lm6/rc+jk+kYPhaV4Iv1rC
 pfXxoV4wx0ntye0PUq2wyLhk+FqrAng7u97odCWOgFzGmnPTS5BO6lOrpqUPFMPWh7zV26GDrNj
 um0zysnmOCE44ZBnAxiXCEsF21p4OQpM/cefYSZSivx7aTjKuJrSF7IwZiEhGFFAr3mipJeXLZX
 b3l42eXFzvo26yFMs1+G/2JwiCy8hUb22ksDqJ3Muq/kyR81
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX36IamjyIR6eW
 u/8JR8NxJV2pZyRiXkG/tQM4YQkgXuyyNV0GjS6b5U5R1ABYdX6UuLCuPD5Wlv/GZ/BArBYTtwk
 oiZ13euDypgRlJ/xA5Pp4hldp8kIGsM=
X-Proofpoint-ORIG-GUID: nvOB1hTfDSABM502sLNzu4LsHocA2bnG
X-Proofpoint-GUID: nvOB1hTfDSABM502sLNzu4LsHocA2bnG
X-Authority-Analysis: v=2.4 cv=c8Sbhx9l c=1 sm=1 tr=0 ts=6a6bed0f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=D3wWFwynQU2KHtTvd0MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX2UkKxR+Wv9g2
 5D7dfhaC7Y18O6zfPLg6agHYlHbXSlsOcEd+HibssDNe6NAyn8D6vK7zxUNfJwtBWVesLbED8iy
 qdfi4/9/n9V/OtPg6ZCOndjkO5QYHe9hFJGpI5MXzMAd8hYNxINDI7uQ+sZgc2VTDBrVYRvfeCA
 LN/CZjKdnf8gIBDwH/zhwLicHSP2nQnetsaFoU2TK8i7uCeH1yr+uk9l5J3gY9a3ra85xul0soQ
 qcyRJ7aOdC+AB6NJp2UpQsw2GX/vOjyKG1rlU1IaqcNFR3bOOjKHo0uk0NQ+40+DmPoI+lcdWEN
 Sk2sd2gNnlBMYoagrWiin/w3PQf+mnL7CZpcUSiXg8O3/lpSL2+MqqwHH2pfi5RxYA9hu6IBVi6
 EoiNagkXzaHcDDt/5E2NDe9nVhSSRm+VEVsnF91qjFXT9UdRvv76c2si8OBjKSobEZk/1SyO3NQ
 JHV7NXGj6661mK0ztGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

iris_get_instance() looks up an instance on core->instances and returns
it after dropping core->lock, without taking any reference. The threaded
interrupt handler uses this to find the instance a firmware response
belongs to and then takes inst->lock. Meanwhile userspace may close the
same file descriptor: iris_close() removes the instance from the list,
destroys inst->lock and frees the instance. The interrupt handler then
operates on freed memory and a destroyed mutex, a use-after-free.

Add a kref to struct iris_inst. iris_get_instance() takes a reference
under core->lock, so an instance it returns cannot be freed until the
caller drops that reference with iris_inst_put(). The instance is
released (mutexes destroyed, memory freed) only when the last reference
goes away, whether that is held by the closing thread or the interrupt
handler.

Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 23 +++++++++++++++++-----
 6 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..e2b95c22f4d1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -632,6 +632,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			mutex_lock(&inst->lock);
 			iris_hfi_gen1_session_event_notify(inst, hdr);
 			mutex_unlock(&inst->lock);
+			iris_inst_put(inst);
 		} else {
 			iris_hfi_gen1_sys_event_notify(core, hdr);
 		}
@@ -667,6 +668,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			}
 		}
 		mutex_unlock(&inst->lock);
+		iris_inst_put(inst);
 
 		break;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e8..f0782c4b1e6e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -969,6 +969,7 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 		iris_hfi_gen2_handle_dequeue_buffers(inst);
 
 	mutex_unlock(&inst->lock);
+	iris_inst_put(inst);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..dde5d0b8a83b 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -6,6 +6,8 @@
 #ifndef __IRIS_INSTANCE_H__
 #define __IRIS_INSTANCE_H__
 
+#include <linux/kref.h>
+
 #include <media/v4l2-ctrls.h>
 
 #include "iris_buffer.h"
@@ -35,6 +37,7 @@ enum iris_fmt_type_cap {
  * struct iris_inst - holds per video instance parameters
  *
  * @list: used for attach an instance to the core
+ * @kref: reference count, keeps the instance alive while the IRQ thread uses it
  * @core: pointer to core structure
  * @session_id: id of current video session
  * @hfi_session_ops: iris HFI session ops
@@ -82,6 +85,7 @@ enum iris_fmt_type_cap {
 
 struct iris_inst {
 	struct list_head		list;
+	struct kref			kref;
 	struct iris_core		*core;
 	u32				session_id;
 	const struct iris_hfi_session_ops	*hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index ba5c8dc1280c..1096cc4b01c3 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -92,6 +92,12 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	mutex_lock(&core->lock);
 	list_for_each_entry(inst, &core->instances, list) {
 		if (inst->session_id == session_id) {
+			/*
+			 * Take a reference under core->lock, paired with
+			 * iris_inst_put() once the caller is done, so the
+			 * instance cannot be freed by a concurrent close().
+			 */
+			kref_get(&inst->kref);
 			mutex_unlock(&core->lock);
 			return inst;
 		}
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 228a5f963812..be23acc0e848 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -48,6 +48,7 @@ bool iris_split_mode_enabled(struct iris_inst *inst);
 bool iris_fmt_is_8bit(u32 pixelformat);
 bool iris_fmt_is_10bit(u32 pixelformat);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
+void iris_inst_put(struct iris_inst *inst);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 4ca9185b3d2b..56c6c1b0ac16 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -40,6 +40,22 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_exit(&inst->fh);
 }
 
+static void iris_inst_release(struct kref *kref)
+{
+	struct iris_inst *inst = container_of(kref, struct iris_inst, kref);
+
+	mutex_destroy(&inst->ctx_q_lock);
+	mutex_destroy(&inst->lock);
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
+	kfree(inst);
+}
+
+void iris_inst_put(struct iris_inst *inst)
+{
+	kref_put(&inst->kref, iris_inst_release);
+}
+
 static int iris_add_session(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
@@ -167,6 +183,7 @@ int iris_open(struct file *filp)
 	inst->domain = session_type;
 	inst->session_id = hash32_ptr(inst);
 	inst->state = IRIS_INST_DEINIT;
+	kref_init(&inst->kref);
 
 	mutex_init(&inst->lock);
 	mutex_init(&inst->ctx_q_lock);
@@ -308,11 +325,7 @@ int iris_close(struct file *filp)
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
-	mutex_destroy(&inst->lock);
-	kfree(inst->fmt_src);
-	kfree(inst->fmt_dst);
-	kfree(inst);
+	iris_inst_put(inst);
 
 	return 0;
 }

-- 
2.47.3

