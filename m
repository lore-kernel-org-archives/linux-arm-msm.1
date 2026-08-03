Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE7380FD4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753141; cv=none; b=mwjeGd7FQVsoNqYdF2gXAu0oCCd1zh/kKHxPeJkabDpvfkHeBnnJvu0EzQreJMTrD+RUj/sR48mldCB8C/uLjsrLtYgw0UiJrscaUbUOdUfau2tWyVxIBSnR/NRXmas/Hc2+SsFW049sypdLn635Jckk3aHMpB45mEvXYdsYdPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753141; c=relaxed/simple;
	bh=kXJQnle2iy213AQWQj46cMV6D4x1j/TtR9P5Qzd56rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdW3dF+lmlPerXumZ90zVzSh1MjWrbj4aP+snur2RvOp2wGeRB6VNh5gYY55K2t56iug8Wat+0pvMyMdTT1R4ueDCWD8GN5NN7dVZdjmrIigQh8h3gFowgsY1vNUEXgKpohzVY7XIvVTXrh09CFT/EIUcjOYqX/X8WB2mI1Z5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiU7BJpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1kuUadB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiU7BJpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1kuUadB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736krQp4123774
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsOg8BzHaZPjVzLWezCKuNFn2YJ6/+JPUNTdZcJCf2U=; b=TiU7BJpNpXEsU/y2
	mhQjK4BU5En47PTImCEEAkJNY22Im2WfBGZQX8fxXy60Ey+O/ZD1BpvzsVcvRrG4
	hCfA2aGDHQ11mL4FdQ3PXjLLka7SpyRcFoz1c6bcgKkvqGC0AplSCkIaajpvnAXk
	6XIVevQZHrXA9y0NNqaBO3OYcC3MkleBsH9grp/jKVbpHuyd1St5mQ4CDJi8fZpy
	UdrpOccwOt+cQ6UVcH7ngtf7ldpNOzcfLDNUnnOnt3oCFyxJGXQcLXByDxSTsMgN
	9pPRSm5YE3IBIw+Hgwitij1zsFEMaSnusV4rIjCE+K13nv6viAIX+d3d0uJyRwnM
	1q5jDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp168yay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:32:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1236136a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753138; x=1786357938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsOg8BzHaZPjVzLWezCKuNFn2YJ6/+JPUNTdZcJCf2U=;
        b=b1kuUadBN3He0pAkStNvDTt5dvOPCxDKWPIL7QkWFQGNGHR+RBWGmkwwypI2+XuLEL
         L7g4apLsAWKJl31Sva64Cq8zCHUkA/Wwn5Y6nckeLYB0+MdpQ8dt7sNbwQxhpG9fHx1c
         DsqQH9Z0yGvkLexyDngSrxmsfArnVv75uqsoiiFKva4D+TKUs1f+3NitzD81lUmmuVfs
         NvLF/4a/v17de5LiRln0wnj1hUVFsNretVACYwCmqnBJBKFIOhMzyebgYGIrxKRlael6
         g7BhEgptI3m4h1UFgVj4dakCOe+5VteNRrKqUQsmf0yDaj2+OshLoBK0jdzckN5/LMaW
         ZyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753138; x=1786357938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsOg8BzHaZPjVzLWezCKuNFn2YJ6/+JPUNTdZcJCf2U=;
        b=ZipfLFX241JV+iFTahqziK60D+OGKngO4cv1XOT2hzac2ZB0PCNYXhMuRr4eKuqeVg
         mS3HzSqb3yuAVz5jot7AjWsJIw0eZg1WP9gVUTBbOVK5lGZKV3cwYVHnIYN7mci7BzUQ
         ugZOEcOIIIEuDlo80KdRtxN3JErtoTl58a2LySTeCyJzFL5ob4lpmNgzDiL7phdW4+oL
         sf5RTjJ8z/h679om01PWZSplHuKxm3Nka6dthd8ZmeNhTDN8kZjTFpTdt4VZ9SNw5F57
         rrK2yT+6vxnMyTZkvb2q/JxM27TJQd0t1lE3R9zJLVHlzmf/Sfnv0OVkeFUvInbKZRbr
         ybGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOYFak/InJ4ZGqdPvP67FWWrsLwfAF4+v8dAZ6//OADQ/tv5XmH+rtYnvnUNHS+RyJUEXh7PdlEq/0NLYH@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNYmrx7t9mxzK0OvtphZcLAxlJ2pj2kfUzqlI+ti5u/B+zZQm
	5Njc4HqMDWQ5Q+0KWLeFerE8dyJD4INQCzA/nSItHfmGZU2SwlzFXqN8tNz++F8O9HUiex6lllP
	JkNqpeQkedboW/F77wdjl/OOUUJR/ojOvANFBYMh993uYnaTgwkHiY/6Dk0vbP7IqDxng
X-Gm-Gg: AR+sD10RCazjhxJZo381Jo/MuKuZk9EE4nbKaPTIVyYpg3jcr1Ko3B/2g0M5i7rEjm5
	XslMfX42z/edyz4LqisWb+cSFhO5TcfqFTb1HwwnlY45CiQwv0oVk/N3y8Dsd3w7KLAkO9tq8dT
	/Sx5DEjZ3rEmLEh7TVyU2ZvVMZpe1OVseqFsIHdcVTv3uHOr0sPc0BxZdKKZGw0ug+LYcubjgPi
	rM5DXQv3x4+QXHd88BaeBzlaKV75RzCW80zuRbdJDIz/DP673PvTBYFVPP4MfbF/D3w1lMoMV6K
	HbYU18bKyBU0BVxVElqsjeV0r3LEUdxdgkea8mQoO+5/BOWdhXcng6he7jFF3hA8oqvCfVjY1Pn
	PVWf3df1WYhomrRtoqJBeEfGbQQ==
X-Received: by 2002:a17:90b:2588:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38fbc530fe4mr8942866a91.24.1785753138503;
        Mon, 03 Aug 2026 03:32:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2588:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38fbc530fe4mr8942831a91.24.1785753138002;
        Mon, 03 Aug 2026 03:32:18 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:17 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:47 +0530
Subject: [PATCH v2 5/5] bus: mhi: ep: Use batched read for ring caching
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-5-c12bb05e42d6@oss.qualcomm.com>
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
In-Reply-To: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=3180;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=kXJQnle2iy213AQWQj46cMV6D4x1j/TtR9P5Qzd56rA=;
 b=+8Fy0NjdzuFsiqbwvScTz4Xn76n/ysFSpxfGLANQlTO8kqhW/k29GAcN9IKv825+jmOn97fT4
 OmfYqMfaJTzBIo5STgSVXs09zHTAA7nUzj1rknHfloExXKfrqI72JgI
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX8kjn5UiSZAH6
 hcrSpHV32pCI4uONgJUwQpdhaqnchqdSvil0i4059DWNEDz8c18a+aPlYkUKbtARceiyn8GgGni
 UHcjwcbd9jhT5N/EhebHxip+Kl7Ai14EoZxEkuonqlgqzyUHNlEDT04RPs0Pa0enP5Upjnjcaes
 6eF1tFF30I/mO5xopdPnwTMbgpDiyFec0aIaKF3CHX6vZjhDkJ/qC1IzL1oHo+fjYN4V7jiiAb8
 cya7Ko1G3GUv0MMhfz8CC3y9T1P4xgmZ/pBLF9BZpqfCayhac0SeVvUQFu3Wnra8kRb0RpwDHlV
 PMQ1UlXPgfrXUW8YnoQr/6aXlN7vRXup1mwmSEUmaDynJPsRuV+bl49/u7b8DnYFwUA9SaiFC2z
 /ar2l+xfOiYzA7O83fEmIatKgxiOLB9Ilv0g//gOwOeA5jl5N1nO2D2KrsG6245lZg2foP5QMpT
 NviK/c8WI1+EMl8MWRQ==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a706e33 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O-L2LWsoD7DDJCLd4zEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXynNf1hkn/y1w
 bTCs2bSE1/5e7kIdA9Xv3TmmSDoUsjnED2anWr1YtZ5/cDqPUA4PLc7ewh82l+wm1c7MLm+xsBX
 xyiTw7894siLGDLlRHUE+bfzLsNd2cY=
X-Proofpoint-ORIG-GUID: hLE79ZnK0fCX81etmrWDhy2wiqNxPrZk
X-Proofpoint-GUID: hLE79ZnK0fCX81etmrWDhy2wiqNxPrZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Optimise ring caching in __mhi_ep_cache_ring().
For the non-wraparound case, use read_sync(); for the wraparound case
where ring data spans two non-contiguous host memory regions, both the
tail portion (start -> ring_size) and head portion (0 -> end) are
submitted using the new read_batch() API in a single operation.
On DMA-capable platforms this transfers both segments in one DMA
transaction.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/ring.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 405ce16c02a89ea2268ea1033ff5c1c26b1c81bd..a369c1eb0c0b849d7ced01b99898ca461cf680b9 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -30,7 +30,6 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	struct mhi_ep_buf_info buf_info = {};
 	size_t start;
 	int ret;
 
@@ -44,6 +43,8 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 
 	start = ring->wr_offset;
 	if (start < end) {
+		struct mhi_ep_buf_info buf_info = {};
+
 		buf_info.size = (end - start) * sizeof(struct mhi_ring_element);
 		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
 		buf_info.dev_addr = &ring->ring_cache[start];
@@ -51,27 +52,30 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
 		if (ret)
 			return ret;
+
+		dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end,
+			buf_info.size);
 	} else {
-		buf_info.size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
-		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
-		buf_info.dev_addr = &ring->ring_cache[start];
+		struct mhi_ep_buf_info buf_info[2] = {};
+		u32 count = 1;
 
-		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-		if (ret)
-			return ret;
+		buf_info[0].size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
+		buf_info[0].host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
+		buf_info[0].dev_addr = &ring->ring_cache[start];
 
 		if (end) {
-			buf_info.host_addr = ring->rbase;
-			buf_info.dev_addr = &ring->ring_cache[0];
-			buf_info.size = end * sizeof(struct mhi_ring_element);
-
-			ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-			if (ret)
-				return ret;
+			buf_info[1].size = end * sizeof(struct mhi_ring_element);
+			buf_info[1].host_addr = ring->rbase;
+			buf_info[1].dev_addr = &ring->ring_cache[0];
+			count = 2;
 		}
-	}
+		ret = mhi_cntrl->read_batch(mhi_cntrl, buf_info, count);
+		if (ret)
+			return ret;
 
-	dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end, buf_info.size);
+		dev_dbg(dev, "Cached ring (batched): start %zu end %zu tail_size %zu head_size %zu count %u\n",
+			start, end, buf_info[0].size, end ? buf_info[1].size : 0, count);
+	}
 
 	return 0;
 }

-- 
2.34.1

