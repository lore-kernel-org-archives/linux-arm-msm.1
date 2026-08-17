Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB993F58F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961689; cv=none; b=SgN+8ru+w/c6H5MQws+raOjRNUTvE4UW2wfKb0GRoOTrgsqi4p9hjb/gTSDP353NqkuBEVF6Hs+LdFjsfQ+C+4rdRjPL7wNrLfqL9TAGS0O+uRoNmW+U17jJLyuIw4QQmSbm8dsbs/csox0dF9LEJbsL3SMUafIbXTtl0GePHrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961689; c=relaxed/simple;
	bh=ApMUAuZs3L2v5RzHWa7346il7lYG55ETS5DCt1UhV9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRSUFTQqdNxYB16fLVCwYFqtiYe5uEMkp0o7xoafL1Feb6y9k7Y3ulD6s4ebwjZFNztnu1WyO75j2a96pZL58AHIyh/KUrzbwdCYAPqLB74qFdMY+B7eJeyHpERoSR4/G1KjbCB2hXpYCpnHC1PbcgtnRs5B6OMrtmb5+i6KR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUoZz0O4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXHspIk6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUoZz0O4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXHspIk6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9depa1533514
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s08t3lOMFf+kNQ18LHM3sQsH9kbgW1CP2CV275SRJLM=; b=LUoZz0O43HuxfbdA
	5RdfhAqWVwvHtWOYuCn9rzCcJ8VxcH+Ilmp6GbqDHbEp3GgMl+RH/Vz4rCrWXD+b
	Q2Dp/ngTGUoUyB0ZIv1tHpDr5TjDcTYaCaIWlzQCaBumu7IAeIToSjeYJmsUsMW+
	htLySgYC7CeIZNF8s+bLn+Qs+qpR2Yu9/ENbiwZF6CgXMQOd/JeovkJsEN3XY9gV
	Ug5HXnVnUFztllhqRWtHmIaqxKx1RsPxbGpi+9UUkvxqQt9Pl/T71DvkyZx9Br4c
	CYoGs1C7kVDf4hO4Da4NN/hZRDgVsZYDWbMrgt0mk4HRnUzyp11xbxojmrh7psYn
	2qNFJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1ggxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:14:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so6319652a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961685; x=1787566485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s08t3lOMFf+kNQ18LHM3sQsH9kbgW1CP2CV275SRJLM=;
        b=HXHspIk6EhxfWLoU0NJAq8wrU6SovCeprIlyoGdSAynG2rmMn4mwNeJSRsX8V1LNOx
         XnABST+p+53oSnZgUDpK01V9EHiGJsei3xSbENBIWprOhZygBth5B+fQcqfMOJeE4T9m
         NqNsreBLVBa/9yDhcMyAUofQCAQOwEDFdqou52ykz8L/q8Wh1A1mIPX1kx6smCE8JQnN
         WTdu35/GyWE4njTBGDWPLv6Bppc+pdlsXm0HzasB5J5ltNBOyLTKxHnSMCiBQhr5iAxn
         W2vMZNLrJhGc1QTUJUaEgyNbKDIsgXeXfKS5KmZZLVi8kqXtrIvT0QdWYKoohdjQL9Ad
         LAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961685; x=1787566485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s08t3lOMFf+kNQ18LHM3sQsH9kbgW1CP2CV275SRJLM=;
        b=sYOZGhuB3e3L15R/1IY4TRCRMxZ/M9U4/fEyXHAxa56lmCTKmTI/gA4dpH8P7nK2Cd
         TrAjA8K4QZSr7FTC3dGepNiI3vvXRzRg8KXIER5H6mxt4sT2sFGWIKnqG7NWB7i7AXOK
         2SoB07rdIh/eFo3gq6UdyEuZiKeZkWZIHEkBYJGImWGDPysSC+P1MfJraadR3gW2ajs3
         r1C/Zytmv6aOJFmoI3dZIzcZDtCdJKDEvLKGvEFQnUTueV+K+3iLKTVZ359etK+cdvo+
         p8Hd4Yy6Tkqgijc6cWEOrZxccO+acMCNslC6bbSlOJkjHgc1iLbNgvUDocNBYXujtMd0
         bLmw==
X-Forwarded-Encrypted: i=1; AHgh+RpwhlfLnvbEx3ff7FAiEv2yfj/a1MeP7vDzEa0CZTe/Jzetl2ImTKFS9pgbt4IJOsm4XI/RcOTpIi/9+fvj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0tKrmM13hbiZGlaxULVqKxztP7C8RaYfwAMdiOeYehfeCvjwH
	akdYfunR6iubW2XCgWD5I0EK96Es0ZzrAVm7WG2+LZ8xPEyvZzPYqrtSaBx0j/xibqV/ZOii09I
	jBGhqxYP/y7q9dGCJBu28koV/1cDZbs2g6fLzKfB5z+LZE5GJ3J+GyriE2H/lG6lc5q+u
X-Gm-Gg: AR+sD11UWS5fNqgmpRJpt4N7KbrGngVkwaGF7E8kFwqhR2XwGfJbxmMzaiqp/7qm3wc
	KaTHqC11YD4+OP+s9B5+7y4kyTdwYQqpmcSyL+SfQIUsxWOr97qajWIlB9AzoMRDzFMg7mfUXRR
	vKTcySL+FAWolGo7TNLMTJ9JzqIAq1qNTA+UwjjQuL657AO6ewMT34nAu+JFiHLfck7pRg8ILgv
	IeOpxEqcdK8r9JqyxAXMfFJP657wiuVVbjykG7NP2vfIb1CRtPdwHTjfg/zgHecCmnQOJvdr4aJ
	DFDELNlz3MRO7ZqBHGVoMu0fOaIZ7lgdFRISnHBqgvrPNDbuG0bPtUM3Ho2E5IjKu+lfy5C39I4
	3uOvjdo8UOBshUbzXLzFMwbhmYg==
X-Received: by 2002:a17:90b:2f0d:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3933ed5e238mr26276647a91.20.1786961685353;
        Mon, 17 Aug 2026 03:14:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0d:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3933ed5e238mr26276588a91.20.1786961684805;
        Mon, 17 Aug 2026 03:14:44 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm1744315a91.17.2026.08.17.03.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:44 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:44:35 +0530
Subject: [PATCH v5 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-loopback_mhi-v5-2-50efc7360b7f@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
In-Reply-To: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786961675; l=4480;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=ApMUAuZs3L2v5RzHWa7346il7lYG55ETS5DCt1UhV9I=;
 b=t1VhTPN6kzGBpFfFaDq9P+GpbUSoTNNPt96OcLRkBbdB+qO5xEt10P9IafMXqPtGefWixkP2U
 GkiUlE3ZbEYCzWXObScFhi4FvoINKcxzpn+hXD89a5zbH4nYH3Bcre6
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82df16 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: baRKqZJlJ0E9WW-BiJlsUq4tWD58HT3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX0p02hLpM8GCG
 5LelzeFimN/XTdBXj/7m/diw7aq26ZAxqiBj/q8YPnBLUZvn9G5iFhlfMKQKAhZvjr+tI8flWZ8
 uESYk/kNUetL0oc25e6UjaHrmzDjPq8Rm5OZVi+s48mduKTknHyoQKIXer/CojqqKqyRAu2a0h6
 CD89loukp55IJDG1oMv5yFuvGiMlLQtgtPV62ItOoA4L0LqQenJSW3Nn/cfkbyCpRcNebID5F3k
 JYalFWYZFspyBlrz3GhylFhGuVmO/5z6T67ml635JAZetvNLKDf8dL6p9B7wT+9o7awMKScoY+n
 8nkCG86Bw4xxw0367PE6uugcwiCeagc8JzteOiZC9rAQTqI/VDXcV39AwRNbKPQovgiBBWRC5Pk
 q0q58nPGxIr1QVFwwFugKsZcDZfD1dhDEozaUbSxmEYcih/5w6J4JAsoPgwC0oRHv18cXYFsJ7R
 QmkgCoBh88koFxR2jEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX9G1LCxKwHj8d
 Kh9dMMcoHnQjRps9GLRk0Q+7Vijb9I+CS+AVMwyUNxID7a9TK2mz5aYq2MdjfhCNB9eAxS5Hldt
 L6eGsfXk8A0W243j7Qsew5oVyRNCLWo=
X-Proofpoint-ORIG-GUID: baRKqZJlJ0E9WW-BiJlsUq4tWD58HT3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
 include/linux/mhi_ep.h    | 16 ++++++++++++++++
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 038b47158f0e0c905194779e24da1ad851e76061..7be1d3bbf5339156fee85d6b47603a5c8d46a8d5 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -505,7 +505,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -533,22 +533,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
 	mhi_ep_ring_inc_index(ring);
 }
-
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
@@ -571,13 +571,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
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
@@ -616,8 +616,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
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

