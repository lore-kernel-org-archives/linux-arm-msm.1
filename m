Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474845;
	b=X4T9QpcAS5zkZi+7BNc6EZRzRG7QRNLp/F0LKgWkEpmxIIUCRSGCYF7ww6OmreAheFq9
	 y3oPhNTsKh0RSZ7zYEYiQrMh43Mhf7Bzi/dlC2OrCpR88yDq0qagXMvj9qIkL8duAjguN
	 p1OF9z/To+qpXe0mYwht/+EG2b70osLJDAl7PWNhiBbkKeXudF+dysGA/tJQnVU5/YOGs
	 CK0z9vqEDB2XyKyLJnfTHk3jX/7KYpwND8PIQ5dqi9L4D2VEJjAyXHsq8C9fEN8ytk8DB
	 E0H/2OFC7iYX4qQjb1Tm4wdK0IGkwbHyUk2ugNm+NIZ9dM20mEbL9nwzTJRHLx0r/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cXHUFgrajQZDTqzampEcedPWV5W4lRFlewpwRNSO/Kw=;
	b=t+CenH41YP/GXx2YwQb3r2aHKuRv6cfJJGuAi4PRlzo6SLnirhn5w6MWGztnWlXLj9zi
	 g44JFfwUDBRMs69wE3Nv4iXCarTykAQHnBs3TX81ZLBDaHZ2A1Ag+xfHH8UyRD/uOqQfU
	 N2qOW9rnIdhxd+WdWlJCaywDFR9brLYh+VYjdsgrlgioks4tdJggDxm9B2lbMM+6CXoNX
	 +Nx5tcH5njcOPf6sv8D+5hNzJSRPxgii/C2Z9rzRoYVxVu1DIHsSMyTqik5k9CPPfrldu
	 2h4+RwgoTGiJ8pddmpOJUsOlLGlFEd49K9HZmy0cDq3H0xbW1j/4oo2TTtXqgI+Dp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W0p7ElNv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tf8kyOoI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCA606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DCA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W0p7ElNv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tf8kyOoI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC91NtC1475395
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXHUFgrajQZDTqzampEcedPWV5W4lRFlewpwRNSO/Kw=; b=W0p7ElNvJnE52wqd
	cR4psnOMjvFItSwLVyDhV3vpjDkl7zlGjlMwuq8iSj7Uis2MJOHxx2itIaI1ubHH
	HBAMfCMai//JHI0jI/6QsUsVNIKDmA7cbPmLvHC43dt7NpIQBvihZGF/WsQnmST5
	IhB9KlaFSxx6S7CcRKOqePAQVwAKMdChnXWJD1EGHEWs3syTJzOi1UgR38wIM3s8
	6atlUpKQzVCe7D8VxRCtcvu7vU1wAW5qBb48xCOWiaK1aEIVVTyqKOawc9iP0Xgz
	OluBfphXUWNPQWmhE12HYxAzVfyM5x55c5rZ/3qkKnhqPrkD77Qe/QdilpA9hpMz
	HPhLVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymunbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:14:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so190441a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474842; x=1795079642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXHUFgrajQZDTqzampEcedPWV5W4lRFlewpwRNSO/Kw=;
        b=Tf8kyOoIakrYWrSVkXOHkJ/XzclDekMSv0qrPpYzAF6BLYBbhq0BWVpLzriWzzXWaV
         1GHYX/VW42r/aHYIr4f1FphRWn74vIBEt1VbSxgQp3qFKq3O5CchUEEqU9S34ysvAKxz
         +ryFYxOPI0qEi6fzMCkdn6bkBeE80Kt/pN8Mn7S6uEMEHeOEJKVLvGTFM1LUKMFdCYmw
         EeqZjK1mGhYLeMi+pOjG2EcofkLrSz2ATh2HXrAgtMd76p4q2d2Pd+bZlfrhBX27aQQh
         zKskeF6K8Xl+qxrn2TT9wWnw4s4jSMHKDe+MX3yRGq8a70lJkWaMfdL01dN28R2sf6qp
         qcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474842; x=1795079642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXHUFgrajQZDTqzampEcedPWV5W4lRFlewpwRNSO/Kw=;
        b=u2Qm+ERo0EP39vZMvO5OEK6PdiwXqFz/FVjrUgw72d8J+bFaADhK176kP4IZGUInKx
         NGb5hL1WFI77oAIpzsIhvODnHU4H3GL0Fu+CN/1zLIENTJYE6LT9L+Pm1kGH5QwU1BAz
         pzOAAULf/pjxYAwzJQix7d9w/Kx7FMACoQ+V/ez1lLPYlis1eT5RyIZjaZCnlcJPsZR7
         5dDuSFaq20v4SzrJKXVuGMRPmoVd5PkNTehDmi958+xMLrT0vZP9zJB1jMuFtCqszIf6
         WxBjFm/MLN68ACnIkJ2zEBJjjopwQOCQCLBfTyOqePXEhDi223RRJn9WrPQ+LNkJcnT5
         uOwA==
X-Gm-Message-State: APuU4Z/9z8jCl3e8J1fzQiVFSPyH433RJhRaAh4kp3JqxMfAJvG8USAH
	+R9GQnRCRSeJqrEzcGus7pDKhiyHZtfQ5AmqSs9msu+MYZfOYfcPUJ+9dOI23eBL7PqZV2t52F7
	Ms/v+8ueGKDu6SYuryJBSo0OLadogYUb77ls2kJE3t+ZSHvKmq7wK8w0i4XYKL9uLB5BU
X-Gm-Gg: AYBFou1B0mpqPC6vQx0Eg5rkuijlU0m4CnsUl/jynfiVurm6nr46peaEGv9x1cU5TnG
	9grVx8xGFCMp9HjG9asWLZDRLmAOZDsz5V+iGzQRpkZHapduTm3m3VXjmJfhU0i33H4XY7/lacQ
	X+0+B0KITdVcMkALMDJlhL1VXjgjYKAUz/u+SzodVPKGeD5DYLoGw/lU0MBfbqjjvfnKSUqqISC
	NtQkaYqC5HktzqqYH799ywH8Bfdw2D02qWUB7xa2wZGeV9KR8DgabYk3+5e8RkOl/etINSLhHj8
	NR+P29eCIFmZChuKvJuQMy4jQJRoRrItrmYYuWTrYKVuGksWG5vMZC/KPJw2v7pVt5AV3BZpWTO
	9Cvh9dULy4fJ19OWWZsD3PrhK7ydw+8yZYzQKqDCPtSTxfDeUrlhwUoOc6vAth+M2m0rKrweuMz
	4eo51pBBxm
X-Received: by 2002:a17:90b:540b:b0:3b0:a518:ffe2 with SMTP id 98e67ed59e1d1-3b182fe6a69mr4581366a91.40.1794474842236;
        Thu, 12 Nov 2026 01:14:02 -0800 (PST)
X-Received: by 2002:a17:90b:540b:b0:3b0:a518:ffe2 with SMTP id 98e67ed59e1d1-3b182fe6a69mr4581333a91.40.1794474841677;
        Thu, 12 Nov 2026 01:14:01 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm3019826a91.8.2026.11.12.01.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:14:00 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:43:32 +0530
Subject: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
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
Message-Id: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794474821; l=7592;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wNvaUJVixMhJelNhBP+7Qwlam+bEsRj1w1CpNZC/6V0=;
 b=5IM635IkyLWxQaGGPMcMSF2lZGhyKuBP71ifUBORRYu4jvOwUUyfhi93HKnBFUKCmJjn7Goi4
 aSJIWTY9S1JAzZv8wOhO5R5TjDrh2nlAe8KLQx9WRdr2tj1orUm3HuN
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: GV3AzeYlhESSXCZu6N9d-rsOKC2PVNtl
X-Proofpoint-ORIG-GUID: GV3AzeYlhESSXCZu6N9d-rsOKC2PVNtl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX6Berr3GeoiK6
 3VYpeBtf7iexkGmi30Ikz2iSMV6g2+Pc/xlvRqsu3M0vliectQOpBo5oYjsru2VPdp7jn+Vblxu
 zT8clJTrQmDigING6Zmjz2RvcFbF29XmOqLqYu2MJmN4iBb1Ly3wfaSs3HMeabGcjRdnsT7KEm2
 hessvB5YekvX89BQchgVP72PqMeWWlUh+WV4075hPotD218Hva7tWXVJ9YcyamEMTu9RneqWOgc
 cgjuvjFRHMNeWHgxclmOAOabTcsNHclzQ3McIQFkkX3HBgYf0KLWXjpHLifJJjURDu7KSPdvC6h
 JRe5X46c/dtwKp+O5/NCLvrwqB9ngIXMHmsjLAdW2i3iJ6vjqiHkcnA6mTCG5Pt7+wlsm30R3BS
 rDHnvWu4jr1/oeIBFt8d31V+OjSp8V/2KtpDStIen8cUkkWE83OZaLVXmtnIrVi1JkarGhXwR3t
 x+sGnlnUqaLbN6WahGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXzqenH5kk7g8x
 TOR5ATYg4O+hLDGTWA5LhqSI9wHMvRGMGyboHHYFGWXsGkag/FOQIqAIXXrMG87Pq1fXoNduSQW
 O+OdvXDoDmepy/pPbj/JF058pO0WZ3g=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af5835b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_LqUGthVNh1NuqRdQHsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

When qcom,vmid is present, require a restricted DMA pool and assign the
entire pool to both the local and remote execution environments before
requesting the DMA channels.

This ensures that BAM-DMUX mappings are within the assigned region. When
the BAM DMA controller references the same pool, its descriptor FIFOs
are covered by the assignment as well.

Track the assigned execution environments explicitly and reclaim the
pool for the local environment after DMA channels and mappings are
released during remove or probe error cleanup. Skip the reclaim and
leave the pool assigned if the remote side still holds its power vote,
since it may still access the pool.

Request the PC IRQ with IRQF_NO_AUTOEN and enable it only at the end of
probe, so the probe error path cannot race with RX power-up.

Fail probing when restricted DMA pool support is unavailable, when the
VMID property is malformed, when memory-region is missing, or when the
restricted DMA pool is not attached to the device.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/net/wwan/Kconfig         |   1 +
 drivers/net/wwan/qcom_bam_dmux.c | 103 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
 config QCOM_BAM_DMUX
 	tristate "Qualcomm BAM-DMUX WWAN network driver"
 	depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
+	select QCOM_SCM
 	help
 	  The BAM Data Multiplexer provides access to the network data channels
 	  of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index 1479f8362e04e4a5f60219922dea3540921de13d..04f3d46d4c3f3e18cd5313a407b8096d04dd857f 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -9,14 +9,17 @@
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/if_arp.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
+#include <linux/swiotlb.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <net/pkt_sched.h>
@@ -75,6 +78,9 @@ struct bam_dmux {
 	struct completion pc_ack_completion;
 
 	struct dma_chan *rx, *tx;
+	phys_addr_t dma_pool_base;
+	size_t dma_pool_size;
+	u64 dma_pool_perms;
 	struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
 	struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
 	spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
@@ -760,6 +766,88 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
+{
+	struct device *dev = dmux->dev;
+	struct device_node *rmem_np;
+	struct reserved_mem *rmem;
+	struct qcom_scm_vmperm dst[2];
+	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	u32 vmid;
+	int ret;
+
+	if (!of_property_present(dev->of_node, "qcom,vmid"))
+		return 0;
+
+	ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
+	if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
+		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
+
+	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "qcom,vmid requires DMA_RESTRICTED_POOL\n");
+
+	rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!rmem_np)
+		return dev_err_probe(dev, -EINVAL,
+					     "qcom,vmid requires memory-region\n");
+
+	rmem = of_reserved_mem_lookup(rmem_np);
+	of_node_put(rmem_np);
+	if (!rmem)
+		return dev_err_probe(dev, -EINVAL,
+					     "Failed to look up restricted DMA pool\n");
+
+	if (!is_swiotlb_for_alloc(dev))
+		return dev_err_probe(dev, -EINVAL,
+				     "Restricted DMA pool not attached\n");
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	dst[0].vmid = QCOM_SCM_VMID_HLOS;
+	dst[0].perm = QCOM_SCM_PERM_RW;
+	dst[1].vmid = vmid;
+	dst[1].perm = QCOM_SCM_PERM_RW;
+
+	ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
+				  ARRAY_SIZE(dst));
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "SCM assign restricted DMA pool failed\n");
+
+	dmux->dma_pool_base = rmem->base;
+	dmux->dma_pool_size = rmem->size;
+	/* Track the destination VMIDs explicitly for the reclaim operation. */
+	dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
+
+	return 0;
+}
+
+static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	u64 src = dmux->dma_pool_perms;
+	int ret;
+
+	if (!dmux->dma_pool_perms)
+		return;
+
+	ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
+				  &hlos, 1);
+	if (ret) {
+		dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
+		return;
+	}
+
+	dmux->dma_pool_perms = 0;
+}
+
 static int bam_dmux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -794,6 +882,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
 				     "Failed to get pc-ack state\n");
 	dmux->pc_ack_mask = BIT(bit);
 
+	ret = bam_dmux_assign_dma_pool(dmux);
+	if (ret)
+		return ret;
+
 	init_waitqueue_head(&dmux->pc_wait);
 	init_completion(&dmux->pc_ack_completion);
 	complete_all(&dmux->pc_ack_completion);
@@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 		goto err_disable_pm;
 
 	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
-					IRQF_ONESHOT, NULL, dmux);
+					IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, dmux);
 	if (ret)
 		goto err_disable_pm;
 
@@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *pdev)
 			bam_dmux_power_off(dmux);
 	}
 
+	enable_irq(dmux->pc_irq);
+
 	return 0;
 
 err_disable_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	bam_dmux_reclaim_dma_pool(dmux);
 	return ret;
 }
 
@@ -877,6 +972,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
 	disable_irq(dmux->pc_irq);
 	bam_dmux_power_off(dmux);
 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
+
+	/* The remote side may still access the pool if it holds its power vote */
+	if (!dmux->pc_state)
+		bam_dmux_reclaim_dma_pool(dmux);
+	else if (dmux->dma_pool_perms)
+		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
 }
 
 static const struct dev_pm_ops bam_dmux_pm_ops = {

-- 
2.34.1

