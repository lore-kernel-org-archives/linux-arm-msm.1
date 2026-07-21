Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2173B7B8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600481; cv=none; b=Kwb2hWmhWpap+pSs6KXqCb080nQvcOMf1MHQYfuE59O13TcMn/UqNiGtHXR4ldNstbuQq+bnzyh6bqj1LTs+OHA/0hSZNK0I4TziNq8+N1801X8Qd5yiMkZnQaJ3Nnx+UdvnIFdUoxYL8TG9iX/VGnqHJmLgLxOQ5yiwzcNWJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600481; c=relaxed/simple;
	bh=s5Zfbo4qdUGGjFW88zzbmy0I4llofaubC03Ctjj+LGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eifo6xP/p54EJUDN4UlM7J+mlN8XnpimpJUfYPfyZrE8mc7BXZRrUT5nxJ/wuzVkY6Js9fHqSwEGcpXze8tZXawOnVSjmjT5ctU2xb8CbCvdKeyAIOM9bIvLmGuck1xMDfHciTBWxb90DPfg1D2FR8gRagoTQKuDJCiPkzA53HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bsdtinxd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QebLMhjM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bsdtinxd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QebLMhjM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCQWP3768596
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kQHGoKLNl2Tfoue/4AF0aGGxJB+gMtGPQ3VGJW3XtEc=; b=BsdtinxdpLRzxTNJ
	qRps8AH4tD9Dyl8iiTgkwA9oogXGGthwcZzZx/6LytNIbDi7dOr4EfNbmF2tqZF5
	3fmUhjdsMo1RmIbtA6k7gD4cPELVzoCc4pXlQEpFVjibpoIp494Vje1xp+Bimh7I
	I8MDZFPipNfSn2rDWKHyA+e5DVNIUbjxIHMKY3ftrsY/EgbndrsQIyTAXvmYKp1Y
	OqPpwkW8xY/IGKZQNFP3OGEk721BMqmDlljBy2q21FBmPr826CltYS6KTO2fyu/A
	prihCgpVvySWrtbvHqC8/SvwHcWD+lE9zhPAkUte+yH8OcaL29E6Zxjc2Yi9l80X
	pckuCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y3uts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso12822331a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600478; x=1785205278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQHGoKLNl2Tfoue/4AF0aGGxJB+gMtGPQ3VGJW3XtEc=;
        b=QebLMhjMSiM7xkK4xcsBDfpLKgraHglUylXQHz2qx/fEvUOG1CLoC0pXsvf/fgnnny
         I5fa+DktTF8fabsN6OE6DCrjHuE5y6JWZnsLCUU1Gq5KKRqM9O5DU8o9SbYk77jP2elJ
         54H9zKUKSL/VQU13lijX1Sk56xdmjvl/1Jb19vOqbuWLxLPzbScvABesVet1IbcmCWvo
         QjnonVlLsEZpqqY7KmqdH84TFVv7PjNNuzgWBli66WHzD7cGXqhY1/h9sCPu+KgSMxL9
         UBq/kYvT2xl+dIAVdHYdzAr/NZtefIG5CB4+UVutn5k+WwZuYHAnmcKs8RNomw7dFCbY
         7HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600478; x=1785205278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQHGoKLNl2Tfoue/4AF0aGGxJB+gMtGPQ3VGJW3XtEc=;
        b=I5ASwaSc0FsQIEexTiV/H8HHKT4daedmCwN4sjtNDKh8YEDdiWl+gsYHTEA2bdzAvv
         w/k8eMo0Qo0p2b7iNsffUHWUbtDUUA26dsMhQbmzxTFfohpTUVpuJNmd6UMCzd3QdHJJ
         4uPxWL3wMMUw6uxC+fKXMVdRzB9SxciNi/iZxtp9KxpSFcLNexZ+twY3qHuufp1+Nv90
         WDbJ16uW624/mvLQIRqvjGi1oDAFa3tr8lnXQNkur6jsY47k5oOQttTpzTy1vp6dX/ao
         lZgezk6g+WSMj2AXchgAjcmrS4Q56crSclPORiBMEJLBVKpyBzoPV60IjLVYi6QsUsFd
         UEVw==
X-Forwarded-Encrypted: i=1; AHgh+RoZPMzcEVRTZ102Q5UdMmccQuXUVqg0Xjh99IiVB3XRTKBweOo6th5lvc6Uv7I5SA7+l3UfLBcSfz0a1Iqa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ptzeRuBvRUFxXzZW4QEhadx/IuyirC7pEyR77bINSCQoRe+3
	Q0UBfR2VhcAqvYTtcWWXFU1ZeqkMlKHKlL1uNN2qkVPAMahUqR1NuHNkKnKjNeG35uWYOGhU/Gi
	y0vwmE8dd1+GOPLv9jUamTseKrTiun1GUGoqZ/D8f2Cx+CfhhDE57GG44zxmvahxptCK2
X-Gm-Gg: AfdE7cl6sZHKjw/bzY6iASZqtpA+mjz28IJf3dh9e9h00a/QHf326dqNf2pZtTUfmTi
	lQqhVoCi78QYTAGfBAMHhjFgvpUq6geMEskniL/9FZKhuLd2R2vJlLd2Z3vQOL/nkg0sWR+wlCX
	7govxwU64SP1n2Ex9Zwa8Nu24JVMacQ1QCCmahxaJtQm/GARIGpOqp3/7ZjvwK7/99GH/c5jARH
	iOsDriI4fYO7CUX87pgtvuY2gdCL+Urcrgb7ySWPIN01GBQYJNuF34ZP2eZbe1Bw5Z3ZGKGN3zP
	XujNXCU1AlGxbIryQXYda3Q9hSpq4S4cWZX9vx/kd2XVzN0J8ToTNpiizactWhMMh0yyANIIUp2
	VIGhmqsZeJBZmAZh19s5VR+auj6ywXfzhIw==
X-Received: by 2002:a05:6a21:48f:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c3ad9afdb9mr16777518637.54.1784600478562;
        Mon, 20 Jul 2026 19:21:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:48f:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c3ad9afdb9mr16777489637.54.1784600478113;
        Mon, 20 Jul 2026 19:21:18 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:17 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:40 +0530
Subject: [PATCH v4 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-7-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=5062;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=NJCVkXVG4kHkHSdORHSkz4ElWt4c51OBpIRD85ii4Us=;
 b=Ou4Wi3K0YRzMkPAqq777DeNC8zL567ygQ1sli4VuJ5MS82UPzCFKTDNiXAjOPGEIGqe7LntmM
 ZvVsveVU6HwBUnt4m2t0Xyjvr9+qgtX2pnaiBYjfQ9b237BGcwZ5z4Y
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX2855QscJ+a6w
 qqCl1ZpWHn4duZ6AK3zyAt7fM+OwDgZ62lZFpO5s2WNmD7hgAWjg6oZVs87MzppmXSAW5lKWSfx
 4w1KHfTfwjr8B17mjNnPbcCAzxSnAfU=
X-Proofpoint-GUID: OiXcIlEobjc8sP8BQrI7aH9IkySuq_6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX36SrkeGt8d6t
 T4/lJ8bWAqS5eJ7LdUuS/uB79dpJeRA8Y6IpfnFOYBUUx/13H/sXI3tAimGOeqV9b9NgON2Q747
 urp94oD9FOHmXb3NBWaTkbVfNW871jk9tqJ5wFjqhKAEXHlNAYerQLx/CyAQsEU/dvIVMKw9wtw
 EnJJyFBKHZ3wTlPGMp4n2dM7eY8uXKEgl/jvcRudAX4t21hkFaljRLQAkzcgSLHRA/dZyvu1v62
 OCh2sj+Qf+VBlG0OZT412K8jxFZmutsmKOMuLF3LAEd7sgEj/yb1N+Or9P0Byvn6ARkbKPOOvP7
 SS1GoBG+20bG8vBBCQoyD9PX6rnfh+Q1yVF+Ojlddec1zjZ8xD5Im1iBxwkS5Ki0ikvliDmBJt0
 1TFJ7xvgiRKp+suKBaRmoLbvdiGWr9drfUEJkkusaPKUwn2d+ddBWkwkaJ6gyOdLedboiT1YFwZ
 9gK6HccYCaeJS8NAfGw==
X-Proofpoint-ORIG-GUID: OiXcIlEobjc8sP8BQrI7aH9IkySuq_6M
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5ed79f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CWBAsx5YQZKXPYp8bPkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index bd922a12045c..eb8de60c1177 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -648,7 +648,7 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
 
@@ -656,8 +656,6 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
-
-	return 0;
 }
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
@@ -666,7 +664,6 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
-	int ret;
 
 	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
@@ -681,9 +678,7 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 			if (!force && buf->attr & BUF_ATTR_QUEUED)
 				continue;
 
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
+			iris_destroy_internal_buffer(inst, buf);
 		}
 	}
 
@@ -693,11 +688,8 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		else
 			buffers = &inst->buffers[BUF_ARP];
 
-		list_for_each_entry_safe(buf, next, &buffers->list, list) {
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
-		}
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb76776182..ab8e5d953101 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -112,7 +112,7 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c4..1c02f2eebdf7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -442,7 +442,7 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
 	ret = iris_wait_for_session_response(inst, false);
 	if (!ret)
-		ret = iris_destroy_internal_buffer(inst, buf);
+		iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 25162ae71357..8c2644c7f6e8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -447,7 +447,9 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
 
-	return iris_destroy_internal_buffer(inst, buf);
+	iris_destroy_internal_buffer(inst, buf);
+
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1

