Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521976;
	b=FiQs5m68i7i17EtEqJoKSzF0oQ5BglS+mHLp20V1P9q4s6qhAEnVYc5jGEBrBa0UYlgq
	 ra//xqNxZZngyB+9Nofv8FhduAQ3Nk7EXsAxZXOp0ZUBrTUpYxTx9HhlxxN+LClx9vpLJ
	 MmzAmAHuWWfBFzHwu7eeKr8rgZe5N5yRNXtKysX3WTxQ+8JUgwtk3NfZ7eiaEKiB6ADp9
	 i2+aSVP5QGkq2/ruVEXqb69mi7n9O4MI2ODfM13RH6DrpN2AB9pvZT5Ws7/Y6iihgndUu
	 XTMwvaUV42e5kH7AjXddQfUcnnDzzLziK0IVPgNn5EjK+oTA6Z7NQQfC5DuYSZVz5LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=56h/egVfcl+cbXmvG3NjDJ9z3RzJgimP+ytjMSOP2PM=;
	b=Wj+PYz27wyjWU4mFh9HGt/7DY8CXHZieSJq9yLEzUh8bfJZbqJJpFW9dk3ja4r4iqpD5
	 2a57Q9Ed+9dIoxml1MkFbM+0BGtnAzeYujERuaIlGAmtx6ELPFW5p8+cfTzvyZaoX9bJJ
	 RzItXHl2g4CJlq4ZQ0WuyqTFkG/Ekv+cXKpsmOHPIuakLhhP+4pCZZELKRuQZl1WutmzL
	 ud3NObHzs3RlBg+yuR6mgVhv1J9dkCUC+8XScWJ1X4NuGvEFHfhz96oNMgxXz7iFtI6LR
	 NH7pWDZHVp+Md/5WoEKjjLc7rsxB47Zks1Od7Imoo4M7uY47TxjkhIXUOQ1GjB6esgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNMNiiHl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkSX6mel;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3FF606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3FF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNMNiiHl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkSX6mel
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubBM1025296
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=56h/egVfcl+cbXmvG3NjDJ9z3RzJgimP+yt
	jMSOP2PM=; b=XNMNiiHlMTXeslx/kRuMtNkrIHTgCc03XcAwd2MSCOmybDiKhXs
	piLIJJdjfbuq0klZr/VXs7N8BIfRXGhkryz4iUHAX1izE4Fu76G/9FK1ErN524Tj
	aSGeSSLHlm2Nd1Q7Wl9upyp0JMo1rtbHewE0C2bjyaBQX2ldVWu4ro1mNlIR47Ma
	1OfRtHLF1uN138yCDxvIOFcJpMTUCpY9hjxzpQelVwx1qg/tzIDBjpz3GuXLm/A+
	UKCSlRLCDuIs9U59Lby2JN1pCW8ekvIwJAlOFgviDTQi/ikTRDp0Nh/8/6XgPwrh
	a6CIKtUBnBNpeVSZkOy3GdiilMEQtDYFj0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2kfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:06:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3790062a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795521974; x=1796126774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=56h/egVfcl+cbXmvG3NjDJ9z3RzJgimP+ytjMSOP2PM=;
        b=YkSX6melncjeSur68WgjvWjwM3y7RZKQirSIHzUO6ufAl/ztejyHgJzw+v6uGxyHPC
         ZM00cetwhG6OlGOK9C3o25QP8ZsVFjeJLBDLG+ZScnOxydX2145zR55OpVk13ufkCl2Z
         oFL1Fpj6FkTv+Wkc3XYC/93dwJ9GmG+R2yoEgOmB6KjJkhNm/oaYMBR5KthgQQkw4ov+
         DDhljEoYFuagVn7Y7BupwrRFUKFlOmcpzdMDAANByizzPOVfHY4K6qNl4zrL8WM1PASQ
         Vkim0XczKqMIaW/j1Ejta4rQTtVsjr9HxJ9DskUDEol0JinjxtbC0RuDpt8a0Ag9P3SF
         fjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521974; x=1796126774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56h/egVfcl+cbXmvG3NjDJ9z3RzJgimP+ytjMSOP2PM=;
        b=edGZ0bmHuReJ1zv+zJig98uOqG9DwwBkc407yEgpi48o0xvuxSPLxWKusy+qBkffuK
         70RXXPN2LLh9NTdTiP3p/75Mo8QO1p+SOUsjnEjXQQdPS6lzHTSAZgYunwE8tYwd78FC
         qcrhtzPpwEhukIGJr1WqXTIIPgpAcQ1GMYDfQKONK5PCqrKJf7Z1nXT8G4fabWUQrIe6
         zaTR5g1z0X+Um/2chNFHLIC0jg6msUy0QNeYAj1dM/7n0cHtiVSaEqatYXas2PmaZ9mn
         HdQhT9TsbeN2yVPgtbGdUmcaSXB4nGqJ3ycESN2L3C7groToSg0qVm6OjjYrkhKiCPx7
         lNfw==
X-Forwarded-Encrypted: i=1; AL+hErFVly+j+WzBOGNvdHe2MJcTjJ0iezejZREGJyfyqgn+NobGmcG0Q49JY2G0dSW9yj0Yp92USBnq4V4fdAEU@vger.kernel.org
X-Gm-Message-State: APuU4Z+c1a8J/eMwrfp5ISy8KHfKb25rbHfe6ElF25DuwIKcrANN9s2K
	xzEUhEUgTZ7HKtXusTx/1dZgjYFWxQS3epC06vnrkcKLWZwVSn1h9fc4ew8lxOZCG7BaD5J08D/
	eoYHbhR/uWHzVsBUhAl/26A/wAQzomMJPqVwTQOOeV35o2/EfMPziugArdJTRkNiZJlm5
X-Gm-Gg: AZFdTZedCLHp3REEsxxc6GhRj1WokNsG0GjpW+OTmV2+GNL3WAj6kn1BIcdI3WzERVK
	tkuzRY/U3Y6C6fXMHzsd7KxuyeipMgneSfxg6V9IiRMPusgYvhjE6RYNepWRqXA7irq3c7bckr8
	1zB467r7lMTwxpfaLQjT2CHV9zWT6LJbsvk1GhRewylBs/7SMiKHB4nhAmSgBU1ZSS6g9PyWc7b
	mktX+5RiCTWj+uKriw3DWWq/hiONgwWjPCU39a2qSkpV7FeJYkmqPE+hdcjXdsXX/NEofJ8NCgX
	lZDFKTtT0GBPturTx0qvi4qL9SPc371FE8dKMzRZ9dJkCcv6ELlkEh19NtDxl+v2VNTo4MB4kX5
	qn22CTrMxeV3bNdjhG2nLG720nBGIf8BRocZDUalS/DeJEoS8ZD/vzC8QZ1J+MZS3Tl+SechBiT
	OYRldSEO5a
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr12375876a91.40.1795521973802;
        Tue, 24 Nov 2026 04:06:13 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr12375844a91.40.1795521973248;
        Tue, 24 Nov 2026 04:06:13 -0800 (PST)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm22324533a91.3.2026.11.24.04.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:12 -0800 (PST)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Subject: [PATCH v3] misc: fastrpc: Add cache maintenance for non-coherent platforms
Date: Tue, 24 Nov 2026 17:36:04 +0530
Message-Id: <20261124120604.2640046-1-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX7ynaDl7UUAst
 H4YXFY17WG6rE1TWrruSg/3vm1Hqm0syF+HvTLlLTfm+8tjShti7vSsURXDHiP9EeEtW/JAFLwQ
 S5IrZd+maSi/ry7PF7sE9Lwew3g+90o=
X-Proofpoint-GUID: rmKc5MhgSeutY_Je8V6zeI_9nYCdhR_Y
X-Proofpoint-ORIG-GUID: rmKc5MhgSeutY_Je8V6zeI_9nYCdhR_Y
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b057db6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3CrWDfm47Yt55cqVd9cA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXwyp5Fom978Nc
 UyTUSdslex6L9mr6v7SV6lVSBYMFfOLtljSy6vdjm2AA9Q48yg1tTGo1cfd8QsEeMkbrI3TLWKY
 duhwIQLOUMExFcCa2TkK8nU5+4weO05PktK2ugrpQ2qyj+OMhPpr6AjcqSXdHT3iGdUZhZnc31A
 XzCNmG5P0Lu4GVhSZACJImxGn+CGstDSvRxm4DM7E8VN1Q85RRFT3X88UzV/FUKz8+tm8GjNIoi
 M8vUNTq6UiT6/tjSJ1dbxSLY5nDpe5v67ufNXx9J1C35OH298sx/O92hYkq5QeVAJ6/N3J0e0Ic
 AIYCH3fAjlOVjaAvZvWDmFOhbVoVjFfiBcMpYdgrsyNeL/2BPRWqvx4zimLpROfk2m07DUNMJkw
 HELxMPn5RSGPZFy59ZGp2DFww8wi7DXRyq8ZfvqTmG6rGMS4S+GC3Q8dZTxwrs8lRqzTcAOU9rx
 L2WDSKFIDOMEBWrigEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

Some platforms using fastrpc do not support DMA coherency on
HLOS. On such systems, explicit cache maintenance is
required to ensure data consistency for RPC argument buffers.

Add cache maintenance for argument buffers when operating on
non-coherent platforms:
- Flush input buffers before invoking RPC to ensure CPU writes are
  visible to the DSP
- Invalidate output buffers after RPC completion to ensure DSP
  writes are visible to the CPU

Introduce helper functions fastrpc_flush_args() and
fastrpc_inv_args() to perform the required dma-buf cache
operations. These are invoked only when the device is not marked
as DMA coherent.

The coherency capability is determined using the "dma-coherent"
device tree property and stored per session context.

This ensures correct data synchronization on platforms lacking
DMA coherency, while avoiding unnecessary overhead on coherent
systems.

Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---

 Patch [v2]: https://lore.kernel.org/all/20260916185850.3686010-1-abhinav.parihar@oss.qualcomm.com/

  Changes in v3:
  - Fix missing max_raix update causes incorrect do_cmo evaluation.
  - Use of_dma_is_coherent() to determine device coherency.
  - Simplify input/output buffer classification and overlap checks for cache maintenance.

  Changes in v2:
  - Fix buffer overlap handling to ensure cache maintenance is performed
    when input and output buffers overlap and the overlap calculation
    suppresses the buffer's mstart/mend range.
  - Add a do_cmo flag to track buffers that require cache maintenance
    even when their overlap range is clipped.
  - Invalidate output buffers before sending the RPC request, preventing
    stale CPU cache lines from being written back while the DSP updates
    the buffers.
  - Use DMA_FROM_DEVICE consistently for both begin_cpu_access() and
    end_cpu_access() when invalidating output buffers.

 drivers/misc/fastrpc.c | 67 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9e760f68bcaf..39ad0ab88aec 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -222,6 +222,7 @@ struct fastrpc_buf_overlap {
 	u64 mstart;
 	u64 mend;
 	u64 offset;
+	bool do_cmo;
 };
 
 struct fastrpc_buf {
@@ -297,6 +298,7 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	bool coherent;
 };
 
 struct fastrpc_soc_data {
@@ -666,7 +668,9 @@ static int olaps_cmp(const void *a, const void *b)
 static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 {
 	u64 max_end = 0;
+	int max_raix = -1;
 	int i;
+	int inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 
 	for (i = 0; i < ctx->nbufs; ++i) {
 		ctx->olaps[i].start = ctx->args[i].ptr;
@@ -685,7 +689,10 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 
 			if (ctx->olaps[i].end > max_end) {
 				max_end = ctx->olaps[i].end;
+				max_raix = ctx->olaps[i].raix;
 			} else {
+				if ((max_raix < inbufs) != (ctx->olaps[i].raix < inbufs))
+					ctx->olaps[i].do_cmo = true;
 				ctx->olaps[i].mend = 0;
 				ctx->olaps[i].mstart = 0;
 			}
@@ -695,6 +702,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 			ctx->olaps[i].mstart = ctx->olaps[i].start;
 			ctx->olaps[i].offset = 0;
 			max_end = ctx->olaps[i].end;
+			max_raix = ctx->olaps[i].raix;
 		}
 	}
 }
@@ -714,6 +722,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	INIT_LIST_HEAD(&ctx->node);
 	ctx->fl = user;
+	ctx->sc = sc;
 	ctx->nscalars = REMOTE_SCALARS_LENGTH(sc);
 	ctx->nbufs = REMOTE_SCALARS_INBUFS(sc) +
 		     REMOTE_SCALARS_OUTBUFS(sc);
@@ -739,7 +748,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	/* Take a reference to user, released in fastrpc_context_free() */
 	fastrpc_user_get(user);
 
-	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
 	ctx->client_id = user->client_id;
@@ -1078,6 +1086,54 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	return 0;
 }
 
+static void fastrpc_flush_args(struct fastrpc_invoke_ctx *ctx)
+{
+	union fastrpc_remote_arg *rpra = ctx->rpra;
+	int i, inbufs;
+
+	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+
+	for (i = 0; i < ctx->nbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+		struct fastrpc_map *map = ctx->maps[raix];
+
+		if (raix + 1 > inbufs)
+			continue;
+		if (!map || !map->buf)
+			continue;
+
+		if (rpra[raix].buf.len && (ctx->olaps[i].mstart || ctx->olaps[i].do_cmo)) {
+			dma_buf_begin_cpu_access(map->buf, DMA_TO_DEVICE);
+			dma_buf_end_cpu_access(map->buf, DMA_TO_DEVICE);
+		}
+	}
+}
+
+static void fastrpc_inv_args(struct fastrpc_invoke_ctx *ctx)
+{
+	union fastrpc_remote_arg *rpra = ctx->rpra;
+	int i, inbufs;
+
+	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+
+	for (i = 0; i < ctx->nbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+		struct fastrpc_map *map = ctx->maps[raix];
+
+		if (raix + 1 <= inbufs)
+			continue;
+		if (!rpra[raix].buf.len)
+			continue;
+		if (!map || !map->buf)
+			continue;
+
+		if (ctx->olaps[i].mstart || ctx->olaps[i].do_cmo) {
+			dma_buf_begin_cpu_access(map->buf, DMA_FROM_DEVICE);
+			dma_buf_end_cpu_access(map->buf, DMA_FROM_DEVICE);
+		}
+	}
+}
+
 static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
 {
 	return (struct fastrpc_invoke_buf *)(&pra[len]);
@@ -1202,6 +1258,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		}
 	}
 
+	if (!ctx->fl->sctx->coherent)
+		fastrpc_flush_args(ctx);
+
 	for (i = ctx->nbufs; i < ctx->nscalars; ++i) {
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
@@ -1387,6 +1446,8 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
+	if (!fl->sctx->coherent)
+		fastrpc_inv_args(ctx);
 	/* make sure that all CPU memory writes are seen by DSP */
 	dma_wmb();
 	/* Send invoke buffer to remote dsp */
@@ -1407,6 +1468,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
+	if (!fl->sctx->coherent)
+		fastrpc_inv_args(ctx);
+
 	/* populate all the output buffers with results */
 	err = fastrpc_put_args(ctx, kernel);
 	if (err)
@@ -2370,6 +2434,7 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	sess->coherent = of_dma_is_coherent(dev->of_node);
 	sess->sid = sid;
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
-- 
2.34.1

