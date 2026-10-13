Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B06249503A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870126; cv=none; b=K8GsKnrKlMF2nw3rNrgI0bU34e700wJphFJ99Nej4GGwC1NdIgtLIq7dRojPE8D3IRaewa5cytpRWmxlVkNU35qEK2AhqJu9rwJRU+Q3eIVCNYOfAyECMzBsH6MxhY1uyBJaBiYs9JRAGUGFlpXIOAfdDdE6XpTLsFC3l33zRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870126; c=relaxed/simple;
	bh=7BF8ZScgsZHLtoDDQknMFHdNvkcDjl2HvDQGM+sKIhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KK/l9PFrAKGHT6Arb5ZnoS0xVGQKV7bl34MNyvW3uGB8tQvy2LpxiIyXjczPA31scuJrhJrEKIi58mEmF2vbju50d31RhGiii14QX1oLf9EmctsZRmJtFYeGoWv3onQElIdYtLinCx+RbHKXRpCZm7Szo9zI6brynUHNiRxmKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3wuXcy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuiBi5X6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3wuXcy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuiBi5X6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21h8F3753284
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=; b=h3wuXcy7W5oqq1HK
	w80XrogfnSKQCrpuWz6MsLhiOpOgyO2bIOc/hTPoDIUUFvRNI6mdZbMJdCPCVdbZ
	sU2AZ89qI9B6Apo0iQWVvcjvWr+2snoHoJ312AO0TWhzBHx0gQ1NAbNmzoe/rbBJ
	sEBS0r1zdQOiHCu0k4J+N7Tg2Io3URmVWy/Puhv08o0U4xI+g1NQ7hAyierFvZuT
	qHZ4K44mc1CVfjoJURUedT2QGkznFAuPeHwYJ0HfEzT2Cj/tZ3fh3HoxeMeZ0cho
	xIRR5jfkqU8ipuAyLdWL4o2+ZizeEiesheEU6eeS8x9QFHY1cQSLVa2xryyYNaTh
	dEFNdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w2dvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:42:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so3850125a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870123; x=1792474923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=;
        b=MuiBi5X6BoiTQ5SHl0+rqZ3Zx9EjS7t6sxPsYZZMI7OtqqUtP3H1y9a48lRVDXfo39
         gmC/ioseERb/Hd5Ff/bQgY4PONh6srfBb5hiOc2xrGWZZAuEezm1S/tgE2+DA3gJPkLe
         8869CFclT5kdW3DgDJMDG9NbA/7+JaVjtaIV8hxd02KcKniEFFDo+DKObgkYg6ElWo4g
         nHd8bYO/+UXSBdvdVp0U+UDmlwY54dYNSFbcbQt9YmjBxx+/vGbpRsIsGVgnu9k1dZXi
         e9HufNkNrOkhU3XSe1Ctn8j8vad9ShlqM6QEZV7PMNwn0WrohYgt+rpBidMU0a8knxbV
         19Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870123; x=1792474923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=;
        b=PCtUsMmLYh+2wFTgk+I5BF81JndhSnq0dfcx8NxeCg3vFFTeK+9hsCIph+MeUHk/3g
         nb5ssY4lenfdmjUF44Txp2gl+mN8wddPYjawDNINXq6F/oyOOgAo0sj6tzRy+mS7KXOa
         oi4YY7eRNZu5Tr8fFyYAmNG5z56INuGSW8CT95mL84QheUf4aZmH0tnHN6MyAko9WCsr
         9sOWBRmIzBa9LP5QKO92i3NfBSak76FQyPcN2RLUEeARg4p18TAYVZcjUxRSG6YqLrtD
         5TrZruY8rh74G405KBFIRFxYewG32M9knJZ1n0/Okfs531Q5t7+cWT3k+MxR79el5KMD
         EyXQ==
X-Gm-Message-State: AFq9FYIeXe8WspelHr+8HMvIIR9J7IIIqF2bt0YSdtUNbAW1cB0ux6x+
	DZVjXMhXIQN1vxXBPtoJuegnHzQzLE6ScnEakgQFPmoVh7bfvpuHAgiSpMPSPMf2jDIIHwGr0wI
	+RSkctPvYfDvMXSBrBNqtGh+YhiFqdvO9fFMhKGu26wJlm1Woe7lGBxfzaY/le+9nw8U=
X-Gm-Gg: AYBFou05e7WzlZ3cGWX9YibOeL3O7KnL0YfHS+1NZo5IQOBsE9G4+cg1ZntMcMh+ZNo
	Quf7UWWdTlYLULgc9S/numC1XH/TbVcDHzBwJ6N1TT2Zx67sKsFo0iZu5YAgDslzFPVGf4r0ewc
	82xx2zgmrVSJIdMALwSp1mF5GRbmFJ45EjGvbce+19LSFIxlV82ZjhFHvbCeX/uGYMiqkR39sUi
	ke3mlgsEP07161FdbnkhFjpFiU98vgxHfV8lqJYCNpZqYunlxQwPF5dLBq4c8B8g71LovlfdtVz
	AOhnWGh60W4ry4a3/ZmUxt42JsPJGrnHPZlVcMHKUXlpiNAUy2edqO2xQbd5VHsqk2ST3gbv4FP
	HdC4A/ok/ZWxHu+LC1v+2DM+Jmqx5BAGbE52+atqa7xuhmyqaQVtKk0w5UA==
X-Received: by 2002:a17:90b:224c:b0:3a4:9c30:425 with SMTP id 98e67ed59e1d1-3ab3ab20a11mr10348959a91.44.1791870123160;
        Mon, 12 Oct 2026 22:42:03 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a4:9c30:425 with SMTP id 98e67ed59e1d1-3ab3ab20a11mr10348924a91.44.1791870122630;
        Mon, 12 Oct 2026 22:42:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:42:00 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:34 -0700
Subject: [PATCH RFC v3 7/9] tee: optee: execute yielding RPMI calls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-7-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: 6Vcdj0slq0CTdjCRXVYzrNCaqFvA3kjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX1M4cGSQQnIHL
 +mHEO1/MBPMg1BD/1iZXtvg5or5fJ7al2V+5a32A4ssK1bCj+/2ytQQquiUBStvRDGJnDfgW7vb
 RWvDFtn3tJRyBI2nsa5iP1fV5umnxodlrv0C9jrwH7TFkCakpnSe8RwQBHObeA3Vkv8bO1+dhFz
 wkmFwSPzN13YehUcJ1Yq86Y+b9lRMQgRakYuWX2NU1S4bR/M1gnzRX4uG5AFECA7WkVGMJN++lX
 2KlYopcXMSCwmNUHfkkMURewryqXtmrsiYf/N3brvVMrb65cPhXMKGOOPjm2nlFn90mNZKVQhIT
 c7WbzhaKtQqJbGMxoTblrqJt8/Zr/oa18VE0Y14lLwS4tqvZXnX12al/rurrd2+jZVqjEixa8FI
 b2NsPkWL9qTu/+W3Vs8cMT8ccosRC3uX5wtIR82soLGq13mVR3eqoJFGxyvB5LtoIw5Zfq2qaLS
 9Dtxqt4iMFOAdIj80rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX5uszRHOd+yGq
 CsqUfcgFVgRkrYpjEycpVcv9Te0kVZOpzfl4QU1f81TfpGD7X48ZmNsApxFXhI/Xev9SxOGbxPK
 k/SdoDKXJAFhrlcShaKCawOMLZXl190=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdc4ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aLZfyF7oQ8oiUT2OKIMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6Vcdj0slq0CTdjCRXVYzrNCaqFvA3kjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

OP-TEE commands can span multiple exchanges with normal world. A call
may yield to request an RPC service or allow interrupt processing
before continuing execution in secure world.

Add the RPMI yielding-call path used by the common OP-TEE session
operations. Submit the command and RPC argument buffers as ranges
within a shared memory parcel.

Handle RPC requests while the call is suspended and resume execution
using the token returned by OP-TEE until the command completes.

Use the common OP-TEE call queue to wait when an initial request is
rejected with TEE_ERROR_BUSY, allowing another active call to complete
before retrying.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 122 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 8b90c3653e80..9a6439e15a33 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -8,6 +8,7 @@
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/overflow.h>
 #include <linux/rpmi_tee.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 #include "optee_private.h"
@@ -457,3 +458,124 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
 		optee_rpc_cmd(ctx, optee, arg);
 	}
 }
+
+/* Handle RPC command or interrupt returns from a yielding call. */
+static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee *optee,
+				  u32 result, struct optee_msg_arg *arg)
+{
+	switch (result) {
+	case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
+		optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
+		break;
+	case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
+		break;
+	default:
+		pr_warn("Unknown RPC func 0x%x\n", result);
+		break;
+	}
+}
+
+/**
+ * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
+ * @ctx: calling context
+ * @req: initial command request
+ * @rpc_arg: shared RPC argument buffer
+ * @system_thread: caller requests TEE system thread support
+ *
+ * Only TEE_ERROR_BUSY rejection of the initial command permits retry.
+ *
+ * Return: zero on completion, or a negative error.
+ */
+static int optee_rpmi_yielding_call(struct tee_context *ctx,
+				    const struct optee_rpmi_call_req *req,
+				    struct optee_msg_arg *rpc_arg,
+				    bool system_thread)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct optee_rpmi_resume_req resume = {
+		.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
+	};
+	struct optee_rpmi_call_resp resp;
+	struct optee_call_waiter waiter;
+	bool resuming = false;
+	u32 result, status;
+	int rc;
+
+	optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
+	while (true) {
+		if (resuming)
+			rc = optee_rpmi_call_with_status(optee, &resume,
+							 sizeof(resume),
+							 &resp, sizeof(resp),
+							 &status);
+		else
+			rc = optee_rpmi_call_with_status(optee, req,
+							 sizeof(*req),
+							 &resp, sizeof(resp),
+							 &status);
+		if (rc)
+			goto done;
+
+		switch (status) {
+		case TEEC_SUCCESS:
+			break;
+		case TEEC_ERROR_BUSY:
+			if (!resuming) {
+				optee_cq_wait_for_completion(&optee->call_queue,
+							     &waiter);
+				continue;
+			}
+
+			fallthrough;
+		default:
+			rc = -EIO;
+			goto done;
+		}
+
+		result = le32_to_cpu(resp.result);
+		if (result == OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
+			goto done;
+
+		cond_resched();
+		optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
+
+		resume.resume_token = resp.resume_token;
+		resuming = true;
+	}
+done:
+	optee_cq_wait_final(&optee->call_queue, &waiter);
+
+	return rc;
+}
+
+/* The caller supplies SHM with room for command and RPC args. */
+static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
+				       struct tee_shm *shm, u_int offs,
+				       bool system_thread)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct optee_msg_arg *arg, *rpc_arg;
+	struct optee_rpmi_call_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG),
+		.global_id = cpu_to_le64(shm->sec_world_id),
+	};
+	size_t arg_size, rpc_size, rpc_offset;
+
+	arg = tee_shm_get_va(shm, offs);
+	if (IS_ERR(arg))
+		return PTR_ERR(arg);
+
+	arg_size = OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
+	rpc_size = OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
+	rpc_offset = offs + arg_size;
+	rpc_arg = tee_shm_get_va(shm, rpc_offset);
+	if (IS_ERR(rpc_arg))
+		return PTR_ERR(rpc_arg);
+
+	req.arg_offset = cpu_to_le64((u64)shm->offset + offs);
+	req.rpc_offset = cpu_to_le64((u64)shm->offset + rpc_offset);
+	req.arg_size = cpu_to_le32(arg_size);
+	req.rpc_size = cpu_to_le32(rpc_size);
+
+	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
+}

-- 
2.34.1

