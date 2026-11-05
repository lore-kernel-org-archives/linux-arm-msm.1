Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875372;
	b=HoCNoAbR2sb3OgiitTbOEo0LWdxfTk2uVGKLhuDdfEFkUvXrVwWr/gbT86zIOFDhNQ3q
	 EuPUmHh4UcqQe4BbEns0UFGWG6aKhUB9l8Il3M2j7zoGWAE0io2ACWgrHj8ZCPtIy33SG
	 eG4b+bDSAiKSfVmj0iLQ3316wE29qBWRaENw4hNhnycaoYp28xp2yv7wrSJvLJqccy1ve
	 VeCVrSmoMEQCz/uoIXMunzPNQYN9O+3BOHe6UtcZUSL4Ru8l2i7EOu17kH/UeOWbEosRa
	 0CKBzMs5PD1Er8uYc1KN8wD13L35fbqatPCRJBNUdblKJSUwEH8fkt9fkE3xrm73ueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=;
	b=biObBpSulu6/DqDDiyYV5maLYPLUKfhL3wyI+jKEISsQ6jNtyAcxmWknoXFOZTJrobVb
	 5gveCLjWb/Q7J2jNIvPIP7C4MAuPK91QWtCNWZXy0dvXZgoFi4Rf/SzUXbiURQ+vN7x1J
	 8UEbui73GmlBJwWMHeUNhVhK+puPgxYqM8t15xijasKwGuat2EF4xeLRY2SPjVPHSHmxx
	 6r+U0bvfNI48caCdMnKYdvDxp8RKKhjfPSODtpe+f1eI+hGwe77z5sFf1Ydtgl+j1g0RP
	 9nokqz0vAxhIgb0A4sDp0AmWW8XI5AroQtlvHh+rV5BsHw93YcLSNb81a1iQkF3IY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmmA4rRc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGScrvIu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F4606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7F4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmmA4rRc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGScrvIu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tbPr1028243
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=; b=gmmA4rRcqTYZZRXP
	KAE7kcQpnSrf6xCfhN75YCvS/tSECBrdo6rY6Bscw7TJahK/NfkAosyscgULmWtD
	D+qqrA4+1se8FksHQDx77tjOxAfhWR0EF0/t5eOUeNB2jLM9peIu8Z16ROMCI+0P
	dDFgHZxFBUwC5hXe8+KYooz8o5FML1RhtiTaIr2n+MlfAbSEaP7/Nrp+i+5Ivi5k
	wj0FBUa88PgBvvo/Hhgfidj4X6JivxzfhU0rI8JkcAhXxWMjnKWX8Wq/03lQ8EOf
	cprI9JkUoEeO//2gXHZceY6bVr5O1XMXqDAnMxmZU7epbIhuQ715NNFq1CBO5STI
	OzK/bg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9b1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:42:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1921646a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793875370; x=1794480170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=;
        b=LGScrvIuV5hmEewC8WAs4PXpptWkFN0fSvDhxlP3CabjQAL3MbYBqruG0H9147UJIt
         9BhUEXoylYupxX9oVgkbfBlmdMRpHYYadK8Jmhyq6W03I81K+4u8Bt0Y0Sdl5Wl+jKkY
         SO6ftPZXWe2wMFW2ME9tuuzV1E5nxms22YYwHNbkt4YoNCDcmVxH8AkzmOxbR61OPH9v
         wPvdI1Ru5B8YUBqihxAdRMHvfr8eKRTiOt3+3eLz9Csr8WJH49HCdG+iC147iD6giHV4
         tqYYwSRfyeZpx1LG+5GURy2BmqlgXlwQaBeUsQWH6483AIaqaaqps670bR2L+RUZVjxQ
         wwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875370; x=1794480170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=062/dz3idDJ/uZv3uCoKSkCMFjtgQeQuvbMZbWJKfpU=;
        b=qvP2LTlhk8XbQ1PKcPcEaD3+tyaME7QdjAgIy1+xjUo+pRAX9YInv9TF9vQkIuHqp/
         1X+kK9zjcTZdXzUkxGt7/26rbYI3AccOqT126Yd3t+q55WD3XNKZlAemqmYSjV2UB2f6
         +1mczV2Z8rOEnc9OXm+ryjOmhkIIzvGGKQEU3h8D2NHazFeRa/3lpnacjk7k0ngjWxpB
         RHRvHbsn4ABb13sRjbXGvRIlyIOlTOLqJazOY/FT9PPTg5NGxvZN1t6lvw1eGr/0HjGG
         Km1OwjWJnc34knZ7NeMJL9w/sCKRN8PvzPXa1LEnQpRkmliD2catfe2wS5B27rUXZwRq
         dZ1w==
X-Gm-Message-State: APuU4Z9DJzI+MIhVsCO3fSAUkW5rPzU7uhVZvEpaJEl1MkeRr5cYDCVD
	XsGIUUqebcyZoh3f+kbKDAfQiJmaJ4IU8CLB2wkT+GqpPjYSgM254vZnLWtcTY6bR4ILtGVIlxH
	7cuAGkTR4qbW5fP/CorL+u5PYSilvC15fn/6JR+aiPlLH+4xN8BxilDtW4bOc17//r2We
X-Gm-Gg: AYBFou2xfJ6QLB2SJ1AH59JM+w50kBHfDW+kn2wzoJ7qD04PdgnbqvHs9Fpby9LfpQc
	6M8UTSgRxqiRzcGra4k27N3FRBk4jCMHaZ3s2wxUHXsbzW4gYpAJK/GqnQtgQI3wEndHEUlSuIC
	eJppqArZSgyYl4BFEOaDi6qrcDO2w+MckMOjXoS3KnS/gAezrZtlgnOkjRVVWNYNDRGpnvCErfm
	FzPGxkD3fp4m1RFFj6mRcw/CRqqaV9jWRu2vKhW7OZSI+ObTWQEJcBpnIFFQYETt93DlLTnUkXy
	tsIzWKe2MGuoJ9bKBslkVleovxM/6PHmXBT4islvnsda2UsG2M/wIOKzdte27lMn06eaqqPc9Ly
	UdZp7NLoRonbZSnYE/HLjWciuJfGwjgI35tgCT/edWRteRAukKtHXcc6hVH5QTo1epHnbURynYn
	qGUCwBD+45ag==
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr16039444a91.23.1793875369504;
        Thu, 05 Nov 2026 02:42:49 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3ae897eb0c2mr16039424a91.23.1793875369020;
        Thu, 05 Nov 2026 02:42:49 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm3266934a91.5.2026.11.05.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:42:48 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:12:29 +0530
Subject: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
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
Message-Id: <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
In-Reply-To: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793875351; l=7551;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=IwKdeVjuVqMKg5GO+i5bhV5v878wKPagYiYrOofdEGw=;
 b=OyeDzxszz5ZTuNqW8QaIHHPPP0DTRodfYN1eSiif3X04h14g0IjCwyJfIrEVwnyIUNtEXe22m
 tn2aah6bSMWAL199Pp6SfmyBP5rxBVN2TwarkfRWMlR8+H+6esBy1Sv
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: W4v630yaKhqcc7Djqtbfv0DvTniZbVtz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX42Yhqr/pzUbM
 KpEBlzCI66uGT7s2qTYcewmYEJm06iSeeGxm3tL6Ve6AjcobvpfUdFiYaNejDZJoCqRJZnoAnJ9
 pzh65VZvPM7TBvmr7rzWUEJV8f80VYk=
X-Proofpoint-ORIG-GUID: W4v630yaKhqcc7Djqtbfv0DvTniZbVtz
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec5daa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_LqUGthVNh1NuqRdQHsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX18tK8O8JDgAw
 PmYcoAhRArRQIbRGPHNY2YcrL5J1ko3PxXMdogDZeuEALeQSP8AFbqkGrXekR5xFF8LA0obQYWy
 fHdkC6HfJ9h6OR35NI6mcmPnmr0GASkMT18ckpaenwo2PBhSrWzX4sG360VMef9q20ExgBv3h1N
 BUY2IxSNEaCj2UzNJYhS71fo5rY9tpZrnO8EfgKObpzkIq/97VBiP859PEMLXKX50o0DkseznEg
 Jxi+FUbIA6ruPBYlGSF9lK7olqdtoj37atTTmPOlV4/75VHO1R3N9G1XkqoE66ldB2VS4q4HhyG
 Z2BsiM31UkBr2yw2a5XZhVqEH+irE5UyjI1ZaVxtADUWJDuVOm/Db7+vMrWSN1BN5HVKlDeSHs/
 wgIZXO2PbU56S/QlhmklNUya1k1Qbkgea7YdoExROfI3B1Yp4YBbaof6Gb2NM7nvQ9vdLy2ki+C
 iV1TSoNd1c4Z9eKY24w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050042

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

Fail probing when restricted DMA pool support is unavailable, when the
VMID property is malformed, when memory-region is missing, or when the
restricted DMA pool is not attached to the device.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/net/wwan/Kconfig         |   1 +
 drivers/net/wwan/qcom_bam_dmux.c | 108 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 2 deletions(-)

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
index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f296ee13c0c31c9b 100644
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
@@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
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
+static void bam_dmux_remove(struct platform_device *pdev);
+
 static int bam_dmux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
 				     "Failed to get pc-ack state\n");
 	dmux->pc_ack_mask = BIT(bit);
 
+	ret = bam_dmux_assign_dma_pool(dmux);
+	if (ret)
+		return ret;
+
 	init_waitqueue_head(&dmux->pc_wait);
 	init_completion(&dmux->pc_ack_completion);
 	complete_all(&dmux->pc_ack_completion);
@@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
 
 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
 				    &dmux->pc_state);
-	if (ret)
-		goto err_disable_pm;
+	if (ret) {
+		/* The PC IRQ may already have powered up the RX path */
+		bam_dmux_remove(pdev);
+		return ret;
+	}
 
 	/* Check if remote finished initialization before us */
 	if (dmux->pc_state) {
@@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 err_disable_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	bam_dmux_reclaim_dma_pool(dmux);
 	return ret;
 }
 
@@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
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

