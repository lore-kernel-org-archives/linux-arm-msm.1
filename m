Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160569;
	b=0jUgMLGXgO6bJIPLIVNXmkQ62tckdqUMuYfeQYsL0V0lB3iy2k/QYbS7VOpcXBKOtl6l
	 muQG91zkUUr31FT7ZT4ZVex6OYolc4YgC07Kdpk7kN068CDhLWanHnMIDrhUjMlEpflO7
	 9e//uLut7fLuS/ohcV5vlznYxd4WZAWPf2+xbhdszkLWl1ZzuOIaEjAeAp4FfzFD5bydF
	 brw+zf1zHDP8sWF+vn9QTqrnIDcSppLh9m5TjriInD93wC35R0BF1CYi9ZnsPAK65shxd
	 21CCpQ+5YgWei7qHqXMSwsabWhgPc++ZM16i0WAqay6S1BrTsGL+cgGj/E5ikzEbFdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=;
	b=FnxqZrRM1c5Ms2Of+9mGGumfzRUqu0E/aT87UBrTpOjRRIpRYZesNqBcb1mRlT5bOMHy
	 qUfYreREF46YmLccrgmeqzRKjhJRyXTpR7cXAghArKTV5hur4qhJsjaZDPAlc5dcJiBhD
	 6ESxiUrKzvJdqfvNJeFoos30sPTkpUwegD0F0SB0ygbP6Pn0gLp7k6iF9PKl9P6GQaqit
	 kmUCmegCDaEJ/VGB4xrjSDWDspNUTz7TOVWfJltjAYr0aCycSdRxlqzF7QHR6ZeBarsm7
	 agHRsQH4LBxt4y1alxTOGhRGJUOV3d8NEGDjToSKiqGuhxzpC/CrsFJZXVkqxcXKvdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pEPfKawD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Zn/CSdY2";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905AE60A262B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905AE60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pEPfKawD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zn/CSdY2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7froc2695584
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=; b=pEPfKawDG7fq90N5
	w4DnlJwKZNzf1oYKZLvKfZ/69TrOVh6/aOzyDAjfQUEBzh8TVC5ZRWXArcQgeNWf
	ay1JAWa4NhxqcoVzbGCK4DauWnh5ELVyzCB894yA5hjX9OE0jZtllYTTTmlu9KkC
	cZ5hEtKbBPknbi+6NmybKtXtQiGm4w1fhYcYG+STBj/2OvmCx8QycmnLKB8ovWLt
	KEdozHda5nRFd43Z+U9ycfFAIUctnfS/JrfupL8J9vcGIbbhbBFfoqGJ0vsxnmec
	LoboY6I/HW3ZjFkTCnWE5y7A3Iqm9GTaBK38cvuj1ydFjwqPsfYAXxsiJXUY7aUR
	J2+slw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2h99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:42:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso636002a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160566; x=1795765366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=;
        b=Zn/CSdY2rRD33exT2i0GuJ9euLTlMZEheBzHzR2kK3wLzDcYYHc5i2my6fX5lnAINH
         o8Q+GztoHnTAFPBEkTp4Uyy5ySxf/dXLaraSefET1WHNw/XMUbQfB/118hUr+FJFeftj
         28hvJxwfp310QBVlWnsGFlUKOHaIegijB11RzhomayOl2ctAvzS91Yx+YKm3FkcKLZ+Z
         8FBISkCbrDMpfo6CbGxiNiqZx7BlkGZHvNKzJuzGr2Tz1PSCsUihVamycPNf0GqhgFn5
         qyTtrDWp6HfiUXhZQWUAdCLgemBFHGmO0dVxqL3Fq6IHgQMCSXfoPkIx4nfY6U3LrBlp
         6VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160566; x=1795765366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3P3TooIy4YwC/bRKTvp92lrYDHs8AxA9i4f4CNemL4U=;
        b=kCGzLQ/hz6gLLOImZe3NHQ8cViIIMhBXWOD+3cXiVry/Gl9gyxa7T8T/umpXFBU1q1
         61PnvoNzFbCgKnGnzajyTycV0Cw2vpiUd6axDzhOUfxEU8SMJahA17Xg5y5qrv9Ps21A
         w1SCupuN5dYJUqVpejSzPLJdbnE4+sdVMOPVti+8iWj6UWwmpUWFyHEAyaeRX0rWigGC
         o5zQz9aUhK+MOal0IgySZMTdFW6sfaVY0t6Ze6Jgas+SVdlFYg6dRDr7k7um29dTSz+5
         l348LnTT7J6oOMmXucpHdg9zaxdugQxbt2KLFP/b9g8KFdnOGkNP4o1+e1AYE9PWqNpz
         pupA==
X-Forwarded-Encrypted: i=1; AL+hErFPIE9ZJVgXNk0Yx0K/MZqoOhndUUp+ej89yyeUzCyS4vG0HbDfIbLQJqv1ym0D9jxYEby6IssW0gcIWoUI@vger.kernel.org
X-Gm-Message-State: APuU4Z+KucZGZTJx680LKeDUEuEz9hoRcbg1kbhE9hHqtMNvdNJ5uzC8
	lU58SacMjTDZgZNknpWr49w2LKNh6t6gf3jz8I27cSjNSxs9kWzvX6td8VGcStrqzhCOZXtM9V4
	+VRSHuE5Omxxj3TdIndXJe8oAffAkLeRXcCDgRdMvLn8MOf6HfslNOKMwIIAgVJYvDRUs
X-Gm-Gg: AZFdTZdnvTJ6Wfwqo0ZbP5AHycYgx/DwGmtRwiGzzEhvW/u+GNidlrXdwSfuz7SdsC5
	bJh54gZPl7FkE5E+/VMgD9xtFXkWdM1rKSv1jarwt2/SntqkmypfMTSocHcRGk4bj5N9ia1Xt+r
	sO6+mVF6zBCbqdQgTyFm4m0kvL5iqo6JZ63Ip2Nn1oW07Yc3WaK79kfTPNTC+Rls++2N2NV9Yjf
	ZDM/zQF61Twr4UZqKgTKc9oNovpPC1TO/KrRoe6gzajmDp8Qy1pv/eIWmq5prMF7hBM91SYGI83
	aLYLUO5zgFEjPea8DNTPisNOFG1Q/+dJEnaCGsg58dvpHNJZacxyuuQ4dvPC6m85V0DTv1pTzZa
	1FHpXpB7QCBGwgcno4COxo3D9i10kqmwhdWC0xaLCsfSwpuYkVmT2mrghL6jqoTAvqFOJgwhTBH
	j+nOH6TjY=
X-Received: by 2002:a17:90b:4a48:b0:3b3:c675:d923 with SMTP id 98e67ed59e1d1-3b41c908109mr1955440a91.28.1795160566240;
        Thu, 19 Nov 2026 23:42:46 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b3:c675:d923 with SMTP id 98e67ed59e1d1-3b41c908109mr1955410a91.28.1795160565766;
        Thu, 19 Nov 2026 23:42:45 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:45 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:12:06 +0530
Subject: [PATCH v3 3/3] media: qcom: iris: Skip register access in IRQ
 handler after power-off
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
Message-Id: <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=3824;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iXUOI58v6kMBfsFr8HiiRVJVTLJdxn/a84melQWTXhA=;
 b=HbLLiFbKrXMtrwVZkPPtoPJGi1LMi/4DLPd6HugzGcTU1AZORkd2TKLtQvMLMwjC4ObdWw4qU
 COXsa4UV4DbCZ7QTI/Q3LqUY5vFzGMdO2MBLa0j5zQI+pewmUnvLUyE
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX+ya8QcnR2ANK
 HfQNeWWZ6iMYXDa/1VaBv1inX8ehPIbWDvRNs8aVzxKNLkdkxVfStyWoc4pD72Bv9a/oi5cyUlS
 zDO1Ef1O1+IjSPbAS6UfcZqQCMrXRp5Fv3mCXNBEd6ULGCQd84BnlRGDdZCUyOvm9oTtah58JEX
 OXTJENoJEmUib4qJh6SSkmFnNO+42CT12fBTnxz4GZzTVGUI4U9/eWqZxAK0gecC8xKybrMVHQp
 kPM2CrjJbZJxH7JYBpRz9wrb17vtBzYs2hLaC1zMIorkSOX2FA16IHj8UcVA9iDEdUDleOi6pEe
 wz/GX8Q0SHbMqAQ0nfJCBFnrtpKw3qiLJpSzN79WROcy8WvGEsoacnCJ/V6jd6jd74Kos23/HCo
 8pmXWE/UoDIoosjvxjRe69Ibru/WvRbhfBO+3lg14xg6eZOKj9AgpIzpD5AKdmA96WSLR0r9PcN
 XJJ6G5UmoPJ5wojPWpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfXzEV7pd+3az33
 2xUP+1d5mRO7NnsQWQnzPwJLhcZ4jjNdDuf1yBucN+UIctdZyYid1BN3l5L0F1Wmz2ioWmKLEZB
 XBFB5Nsi4JVt9ZlIme89HsM0O+7Udas=
X-Proofpoint-ORIG-GUID: 5wBfYzx4SpkU3DM_gq2SguLcjg0iqPCm
X-Proofpoint-GUID: 5wBfYzx4SpkU3DM_gq2SguLcjg0iqPCm
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6afff9f7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=acxGgeGPnh0hIPSWkr0A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200030

The threaded IRQ handler reads and clears the interrupt registers
under core->lock. Power-off disables the IRQ without waiting for a
queued handler. If the handler is woken and queued around the same
time power-off is entered, it runs after the VPU is powered down and
accesses the registers of powered-off hardware.

disable_irq() cannot be used to wait for the handler. The caller of
power-off holds core->lock and blocks in disable_irq() waiting for the
handler, while the handler blocks waiting for core->lock.

Track the power state in core->powered, which power-on and power-off
change under core->lock. The handler checks it after taking the lock
and returns without touching the hardware when the VPU is off.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 468ccb551ec3..ca1a55bec334 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -70,6 +70,7 @@ struct qcom_ubwc_cfg_data;
  * @message_queue: shared interface queue to receive responses from firmware
  * @debug_queue: shared interface queue to receive debug info from firmware
  * @lock: a lock for this strucure
+ * @powered: VPU is powered on, protected by @lock
  * @wdt_irq_disabled: IRQ was disabled by the handler on a watchdog interrupt
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
@@ -117,6 +118,7 @@ struct iris_core {
 	struct iris_iface_q_info		message_queue;
 	struct iris_iface_q_info		debug_queue;
 	struct mutex				lock; /* lock for core related operations */
+	bool					powered;
 	bool					wdt_irq_disabled;
 	u8					*response_packet;
 	u32					header_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index a27c543e75bc..b7be3ccf499a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -98,6 +98,11 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 		return IRQ_NONE;
 
 	mutex_lock(&core->lock);
+	if (!core->powered) {
+		mutex_unlock(&core->lock);
+		goto exit;
+	}
+
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
 	if (iris_vpu_watchdog(core, core->intr_status)) {
@@ -109,6 +114,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	if (core->hfi_sys_ops)
 		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
+exit:
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 54ee7a671ef8..73ac63376b91 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -234,6 +234,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 
 void iris_vpu_power_off(struct iris_core *core)
 {
+	core->powered = false;
 	iris_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
@@ -520,6 +521,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
+	core->powered = true;
 	if (core->wdt_irq_disabled) {
 		core->wdt_irq_disabled = false;
 		enable_irq(core->irq);

-- 
2.34.1

