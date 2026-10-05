Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296346D09A
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196787; cv=none; b=N/oJGt39SkCurXt4kZCChJPAjo1WMrM5+LiXXGgLyR7AIAf63EYAtiRCgHVm5EMW0SOJQynOWWKzD5WSEW0qAYyyaDAcAYCrIY/kqf74G+cq6PxIn/qgotOupnpWwXn9fTHN5CGFEgxRMQWX7tITRnvdsh2PaZu7QGX5DJ3g5wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196787; c=relaxed/simple;
	bh=WQwZuEMFI0EGrTL8vHKAukXCmiRo/SaTCgvzlteroVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDCHm5PyKMIecatDNG1yP4YlryQoKF+TT6RsJRd35ArDmXGwiNeGBcvANHO3OgToVpxT5O3R/3SJGVZwyW0dGsMEkQ5A+SAekmsOpB6wIxo73Lu97PlFf4nOT/csn8ZEaTHh4wnitMs6SaWWf2Ixa7b8CG7s/9k5npojOCNZrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+8T1ekZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKDNI/ZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+8T1ekZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKDNI/ZL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xSjG872490
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 10:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9oUSEdsnHJrKTM7IFgvHlcAuPB6PaqD5TTrEShb2fU=; b=D+8T1ekZ4wcJqczj
	Qw0RNnawd6dNCHXGJTm1K42yqfGAcXnhx8XWlMbb2F42R0JSoNk69p7juaEfMgow
	vBLb2gxqouT1U/ZBjC2XMwBHpBzBiRSkyURNXkwChQej8upV/4H9cvdcx9XPEbxY
	K8fDRGpVX0kKQK+4SeBCZTNJI27joQ+9qhGxgmhNi9ML1gm1r3MxRAbJSOJUbdW3
	/AGuoTmb/SkxLsVi76KvqC3nJrc6sAdatLAok/0yyLBloOS7tfVYPbvdcTt849cm
	6QwdRlBrxF4MNCTqI0e3IgNjAEsup6qaNy4knmhlyFX473B85hWwIEuuzBbsq2oh
	peSkyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn9ek2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 10:39:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso654286a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791196784; x=1791801584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9oUSEdsnHJrKTM7IFgvHlcAuPB6PaqD5TTrEShb2fU=;
        b=ZKDNI/ZLZB3fYFgXLCWPAwxMaYZvTknHDEbX5kqflNnD2/cydXn5EnRw5z4phSgb5l
         ammPTrnaL++EvZpyeHiU8baZYKAbR3yFDWxpme4dihUCQGxLcbn9vIOeZ6+7P5h3Pvam
         HyKMtd3Kgwb/LQ/jFYzv2c1Gp79XpRnmITlC4/T/MJifMUVTBsWJQaPKB6SSls7FCikU
         CyveQsUn8PSAES0K1ThjsKHoD0EWKS3atEimCLPCRXTcfmpPEAOrIYhfSe8Gx9Enaa2U
         XrH+/vLYxt2W9F0Ylm35jaBJ0k0ONnMSJfFQMHrmCNbRg7qZR7MCUbvA3tW4DJq2ByAW
         NnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196784; x=1791801584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9oUSEdsnHJrKTM7IFgvHlcAuPB6PaqD5TTrEShb2fU=;
        b=K51kEkBgl45KXbMlAnrHuAJtGA3jnb5CcO5YD+dCK98UWBIGhQ4dh2GVvcaOMyq+5y
         Q0rhnkq+vZiVgM0JMphgOUpurUMuUBCWyoYszLhVjgTtycIX5SKnFd7bq84kUxg0jbHf
         OdN7ZRnwqDDxnzkxeL/bIjRDK60yxNTuDQouUNpydv2Z/RopPLdi5EQvWg09skvY1LPe
         VHgoAwDmsbyIhN33BSf+1gRwiyDmLB1IDWianoDDuJL4yzVWDZBE2+PV+2qFxu4oCT9M
         Mp8cEEEIQtKRXn8BnuA0jtArOW+Ev8VZlivf6PaVGjoVL6emeJQRfgVIQMCZYuLSjxw0
         LWnQ==
X-Forwarded-Encrypted: i=1; AKwUvByaxfJ8QQ9NIr+qwB1HpRoXI34hpPnmaJtVwtNC+dYnbqEmUPuS0P8g+fCl9cDL+0GNXWk9d1xu6GDHIv4Q@vger.kernel.org
X-Gm-Message-State: AFq9FYKRJQah+DlsLAm2dMtqKv6XkRCfaNX8ordbZgTnbREStZBtMZfn
	Tyz5T8uFECp5bvgkQ9F9k4HtIO1AU0NopwjoygsB4kKdrBtMBhLwHNq1+H1Gz318lFKGeElhdE4
	rnwWJmhpdzvOuaoP8f1ja4njJ6OMw/nmsfXZxXVJkEPjld5/tgy+k+Kd3LoEMo+VHmLTy
X-Gm-Gg: AYBFou38zxpa/f2yNzlXqObHSjMBJ+AKeQMpMLOKF9AaYNjg2DV2vhLkfkibjnosdA5
	dj40kkj+CrX9P7JJ2Pm2JrAtQm9WnpJi71/FDwXCYZu/eT2GWw4OaCED2anC0f8SZvArbGMSST6
	/S3e91040q/5uP8zZtsyFHviakWzQWXVSLX7c2AFDkU9U8n03xzGPbyDwy1qizuK+oAe/MF6Z5V
	wN6E0Jsz0aq7qLNPyYJ1u3YLde7jwl4ZxifIjOD2bgGdC/JT3fvE2QB0Pl1ev/wxTDfN0QfV+eo
	Vo3sp4d8jgAirzmir0BKDWJStuh8vDulfDNvgHVdOHTeWgQM/b75pS8TVfLUozFyKoNbgeqnAHj
	NSDLpNdJOforvaEQ8M0+qP7Tb
X-Received: by 2002:a17:90b:5285:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3a8211b748fmr1067267a91.67.1791196784319;
        Mon, 05 Oct 2026 03:39:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5285:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3a8211b748fmr1067246a91.67.1791196783719;
        Mon, 05 Oct 2026 03:39:43 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm11223918a91.17.2026.10.05.03.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:39:43 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:09:30 +0530
Subject: [PATCH v7 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-lb-v7-2-36a268b6386f@oss.qualcomm.com>
References: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
In-Reply-To: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196775; l=4444;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=WQwZuEMFI0EGrTL8vHKAukXCmiRo/SaTCgvzlteroVc=;
 b=SNdArPsDZmVUJXgAX0uLNZemyLJdkOcTqb1APkZzAcUJM1zNuHq5jQQn97aryKXTw7atAUPlB
 z/6VGSHgkzdDbZyi1Op9ynsW4nRP2JOPijYHdC4qYBr0iyLDjynnlDw
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: s_Mil8RaUsu11ToVaDdNlMd0TNgY3AT0
X-Proofpoint-GUID: s_Mil8RaUsu11ToVaDdNlMd0TNgY3AT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX9cATQdBq1u3D
 YimMbHMAZID7/1mfbcaXfZ3Ka7Bz50ag6N/YKenVCXxWFnjcr6wz6e1QMtr66bCgPmt/XtcGk/U
 GRyyh9G8B6N5KyvnYhZugwoGMX5dtQhqY2fkScMCTo/ybyTTqvg+eXGHqdJ7B0iiLjO5X7UigDZ
 f4qC9MlldSGKNDwYH4sySnRnZ3nZiWB8QapZ1rV7gsBvAHWwpVq5vyWzjEt5gZKAxIlarD5/8S/
 A4+xxKEAMlyU+Cc93JflZbMKTUm+2PGbHyuI9+5NYKMnc/Zre/2vnLTzwN5xpBMRyAKKnQH4z7K
 RrIre+ViPCa2sm3aorpx97wcpajkT0XHFtbw0j6L6hCP178BSeRYxsPcuLr7idJG/TA5iqDh6pJ
 8o76AoneoRdAFGdoatXwPZyLAMBkY0gVCokwq1teN9kwGzIWs4HWbzWwSidclJd8ayCmoAKFdZB
 ZQJsoW7AL5cBVOs496Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX23uCGkSAUlVK
 9B6wW3Di2nD9Hafa89ddYLZ+M3GAPJhyHqUh02ek5nZeqZ+4CV/UBM2YzTqOqOZdTmIRBSu9DYK
 VNKMdmGAHOtHhzHoqur/Bd8q9c2TL4Q=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac37e71 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 28 ++++++++++++++++++++--------
 include/linux/mhi_ep.h    | 16 ++++++++++++++++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eefa75995393f761ac3b66a6e37112d..b57dea00aaf52d16843ee72d98cf3e8afc08a10a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -504,7 +504,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -534,20 +534,21 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 }
 
 /* TODO: Handle partially formed TDs */
-int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
+			void *cb_buf)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
 	struct mhi_ring_element *el;
-	u32 buf_left, read_offset;
+	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
 	int ret;
 
-	buf_left = skb->len;
+	buf_left = len;
 	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 
 	mutex_lock(&mhi_chan->lock);
@@ -570,13 +571,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 		tre_len = MHI_TRE_DATA_GET_LEN(el);
 
 		tr_len = min(buf_left, tre_len);
-		read_offset = skb->len - buf_left;
+		read_offset = len - buf_left;
 
-		buf_info.dev_addr = skb->data + read_offset;
+		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
-		buf_info.cb = mhi_ep_skb_completion;
-		buf_info.cb_buf = skb;
+		buf_info.cb = mhi_ep_buf_completion;
+		buf_info.cb_buf = cb_buf;
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -615,8 +616,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
 	return ret;
 }
+
+int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+{
+	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
+}
 EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
 
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
+{
+	return mhi_ep_queue(mhi_dev, buf, len, buf);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index f6383a57a872bf3cdea236ae9fe65f4ec8747b3e..852f331f03fda5c0212585de7d6f4eb9f8270609 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -304,4 +304,20 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
+/**
+ * mhi_ep_queue_buf - Transfer buffer contents to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
+ *       the caller must not free @buf until the DL transfer callback fires
+ *       with result->buf_addr equal to @buf. On failure, the caller retains
+ *       ownership and must free @buf.
+ *       Note: if @len spans multiple host DL TREs, the DL transfer callback
+ *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @len: Size of the buffer
+ *
+ * Return: 0 if the buffer contents have been transferred successfully, a
+ * negative error code otherwise.
+ */
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
+
 #endif

-- 
2.34.1

