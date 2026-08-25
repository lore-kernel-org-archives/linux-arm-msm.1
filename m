Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020A37E5F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683251; cv=none; b=sW+5ueHUVzOJXew8rXz2KduixSb594SSFGl1ilVHClWE4vcq67+4vLhnpg4N+5LPK7Cgdj0sDCVBCTbbmk7dQ84Mi1mhs+gmyYM14XAk7YAH1g7lTt1jCNvJkd9lXg0Ol5AvvuNUakWbeg3/FGbQc2rk3QPdm3JqkiWvO2vNKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683251; c=relaxed/simple;
	bh=tBc/t2nMMd82eh3YXYtokj4gYtOHLgcMo2pRVZ++1aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ER9auyqcFjQCeqQKQ0R5x30BAiPKA5IDLKSLDCaKva3pC56urW4cr5Vlt6hPn8I1fcxOkb9RSmW8cR8TZpKUGxUDmZ4ZxRafcRosliVKpF0dFexauXACuHo/fCthqt1n8ZcCYF362d7xDUKk2vAs2tVuVivZ0TikYh5zKcHyoOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mibpidea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hC7Rshuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mibpidea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hC7Rshuo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdN2k2446278
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xW9JJ31PzHxg4v0ggm/lgGaOQctNgyTdJoAgpJubpzM=; b=Mibpidearz8mBsIp
	k2EYd91pHNs8RdX79rIkdsdBIDa4ld+RE9f7bH1BqGSjwk4q/zw7e7hT3FrNj/MR
	PQT3msAb0FH9y3Rh2fvk4Xch8W5C+VHyyoyfpr710B+65YbMxqFKHsY80RZws36R
	MseMWX7+wBPngqA7Zlnpx20SI3yjBZBu849ZV7+FenWpTJ8sEbKs399FALAOHUcQ
	0B/3eXp/wost9iMr3D5F82fan2C1UdplN+9IWfFOk2R1qGq9ebzAPGELhPlC2tP2
	oMGLJKEULEJ7qsDjF+K5MFQcJpHp7bmKm9ChU9pdhQzzT+7N2vfvIpKn9NBBkjkU
	e729bA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcerb8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso51095a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 11:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683246; x=1788288046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xW9JJ31PzHxg4v0ggm/lgGaOQctNgyTdJoAgpJubpzM=;
        b=hC7RshuoFpo6zKO7fxV7igtJDEzwd4Q7m4KyJ29i6NI4n8Ah6sg8S5vEmxd5/O5ONx
         Xg2caJ5GuPNBhAs5qaQ8lCLnWvZ7L6TvmYyKA0bNIXXTgVB10fog+FkG17LgP3az2vqS
         KOjNwrsLeXXoXFvFMDymi0I7NoqVhl09hkqUeOAAq7rlrSLsVyiviU+muDBojNAqrXHZ
         /vh4ZIRlrtiQP8+F7leRGWhM47SkG3BYc5IzeDsqq8ZKxY7ee0yMI6EG8Fywqa088tuM
         NujMsq7yFOkcGtMs1IavlYQoV8LX2J3T/yuUky9MrxFtv+9p2Tgt+c2gTbsiJEmHgkjG
         prNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683246; x=1788288046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xW9JJ31PzHxg4v0ggm/lgGaOQctNgyTdJoAgpJubpzM=;
        b=S4Csj30crxT2XZlIoZU7anx68lT/3KP/YlClpu8M7see8bG2I28sghE1Yy7RWHdhgI
         KtIqRC0WwdDHEg3oDFJ9QmNWMPQA//KMA/k9XPE0QQVPFFc/l2kqPkcZUt2A7kYWsen7
         ASmc63dCqVnE3ca/C0uO96yik3lNq+UkloqhFLteFtmAR5pGAghSlQr8chY00Y4y0cWM
         FcdqDuvVPzkN+9vaZ5lxYbrKDU8aW79gN6xWeRc9/E3P3ny34Jp/NdVCoOrAVTTzC+I7
         Crd7K6Ih3WgSz8lRgN3li1lJg0+dDNH7dMe0x4VppJITustrrHYjwR8uMs1rJsMmpxA0
         GusA==
X-Forwarded-Encrypted: i=1; AHgh+RplDPwR+4f5s5fmM4vzqCquVSK1iK/WX9SesdcSPO+435EjUqOdrbJj+vqDRCH2UIJsEFzp6jiVTz8q7mmy@vger.kernel.org
X-Gm-Message-State: AFuF++kVnYkSxhkYlEtvYRZi8+GwEdRR9+VbQLOKAw25UN0j2A3AKbGt
	RWbcoQjTJ0h8w6oI6pZI1LAaRRg37FK0GtwAU04TbkfzjpxaWxTaesIuaWzEAoVhERtfkcpc+SZ
	FAhD4Pe5awmkI6X/1DyqjDC8/V0tF3xpC8HVoRjA6ofJFrkUh8fvaXIyh4S8O+q9Jp3IA
X-Gm-Gg: AR+sD129dPxhZC4wwxkowq3k96hW2dJgvFJwOoMmRFzbf+fQqaLOKKU03Ex0416N9zR
	24exhfdKBC1QrLlZlQOgb2owOPD3MD6Y3XSz/DospcagbYCIwMQ//2pj/sHSszcLEtXLVi/4mv0
	R7QgeJ8nRpb76OJpdjE8xR+VX3XA+/bVkM4DxJjx2AaNhGwv7aPhlR5LAtyHoZKrZO/2O+0FV3Q
	2L+mJ1amb5aZIsQsaf0W1gkDppsm9SOBxuTLSwxIsiXtHudFHTltKIglijsPtHRKqj66qWEw6q4
	yiCYPOTneYr542n9jJGxsX5cpNwjlrBQ5LuNp1f7XyLoM7WEY2J0Ftkno1QHWbN2qdbKqSSa6If
	+2p307cw2Mc+nDi33Y4hAR8X6EMSo
X-Received: by 2002:a05:6a20:a106:b0:3cd:1037:36d6 with SMTP id adf61e73a8af0-3cf6653a531mr1091389637.0.1787683246194;
        Tue, 25 Aug 2026 11:40:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:a106:b0:3cd:1037:36d6 with SMTP id adf61e73a8af0-3cf6653a531mr1091293637.0.1787683245623;
        Tue, 25 Aug 2026 11:40:45 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm256117eec.8.2026.08.25.11.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:40:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:10:13 +0530
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment for mDSP buffers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8de1af cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EVZQnPdvptyBUfj2O9sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX530Tz8foqaNZ
 3agHuzjrPm9PycB1hXwAkg5Ul/+rBn5VhCJXWVKS3x+GRg6BadBpasQlhQoTBqS+yfLlhPUal3l
 qsSarAe9wJHIy8fXBYBs734Vs/3UdO4=
X-Proofpoint-ORIG-GUID: ywa0Tkyno_-ESCPQ3FRZSxfXpwu3oBBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX6/TuhL8aSXIi
 HS2ysk/tx3WPTwsNmKBYm/MCQRwxtyYAVfwJ1TQwi2CpIHvkfPdx8S3Gep5EXNu2d5pSk32JWSt
 VBleS66YAqPXaMEYvNUXAsQcULlC1IW6DcaSGqqOcNVKUIlsWCT72WrETE/95DQwjOuLWejPgJG
 CM3Fcd/XiZf25UNpgnesQyBoW0T8k7iLcrmTqOlnI8EnieQ7DkMD9OlpWSHRI6RTOyqxb9iTXWK
 MWAIQzjgOjWvn+BBjIEIehx2xOc2gZlW/bHpK/Rizix0XP0+JXA9Vd7K/EN/V8TdbAMcmAbL2p2
 MVNPW5hzg8IDjrG+eb/QjtukER3WJRNDs2YKAThlS7hN7fxrl300ipwp0Q8sWy27picBG0atsrF
 95nA3gD3Gd7UNmowcck9lE7fAKMuXNUg5R52PBPYWgahCyku2K6kqtyu+5XG1jUlzVBHQdhLDJS
 lqwG0jNmyOjyBArCeHQ==
X-Proofpoint-GUID: ywa0Tkyno_-ESCPQ3FRZSxfXpwu3oBBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250158

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
where SMMU-mapped system RAM is directly accessible, the mDSP cannot
reach the PCM buffers unless they are explicitly SCM-assigned to the
appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
does not function on these platforms.

Parse the qcom,vmids DT property and, when present, SCM-assign all
memory regions to HLOS (retained as source owner, RW) plus the listed
consumer VMIDs (all RW). The two access models are mutually exclusive:
a node uses the SMMU path (iommus) or the SCM path (qcom,vmids), never
both.

Memory assignment follows the upstream pattern used by rmtfs_mem and
qcom_q6v5_pas: reserved-memory carveouts are SCM-assigned once at
probe() time and restored to HLOS-only ownership via
devm_add_action_or_reset() at device removal. For the non-reserved-mem
path (qcom,vmids without memory-region), the fixed DMA buffer is
assigned at pcm_new() time since its address is only known after
allocation.

When memory-region is present (has_reserved_mem), the data-path carveout
is attached as a DMA pool via of_reserved_mem_device_init_by_idx() and
PCM buffers allocate directly from the carveout instead of system RAM.
Buffer constraints are capped at reserved_buf_size and
snd_pcm_set_managed_buffer_all() replaces snd_pcm_set_fixed_buffer_all().

All new code paths are gated on use_scm_assign (false when qcom,vmids is
absent), ensuring existing ADSP/iommus targets are completely unaffected.

Co-developed-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig           |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c | 373 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 351 insertions(+), 23 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..82f496e53acb 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -101,6 +101,7 @@ config SND_SOC_QDSP6_ASM_DAI
 
 config SND_SOC_QDSP6_APM_DAI
 	tristate
+	select QCOM_SCM
 	select SND_SOC_COMPRESS
 
 config SND_SOC_QDSP6_APM_LPASS_DAI
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a09f4..19a5c62cc4e1 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1,20 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2021, Linaro Limited
 
-#include <linux/init.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <sound/soc.h>
-#include <sound/soc-dapm.h>
 #include <linux/spinlock.h>
-#include <sound/pcm.h>
 #include <asm/div64.h>
 #include <asm/dma.h>
-#include <linux/dma-mapping.h>
+#include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
@@ -34,6 +36,9 @@
 #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
 #define COMPR_PLAYBACK_MIN_FRAGMENT_SIZE (8 * 1024)
 #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
+#define Q6APM_MAX_VMIDS		2
+#define Q6APM_MAX_CARVEOUTS	2
+#define Q6APM_POOL_MAX_STREAMS	8
 #define SID_MASK_DEFAULT	0xF
 
 static const struct snd_compr_codec_caps q6apm_compr_caps = {
@@ -57,6 +62,13 @@ enum stream_state {
 	Q6APM_STREAM_RUNNING,
 };
 
+struct q6apm_scm_region {
+	phys_addr_t addr;
+	size_t size;
+	u64 src_perms;
+	bool assigned;
+};
+
 struct q6apm_dai_rtd {
 	struct snd_pcm_substream *substream;
 	struct snd_compr_stream *cstream;
@@ -84,9 +96,123 @@ struct q6apm_dai_rtd {
 };
 
 struct q6apm_dai_data {
+	struct device *dev;
 	long long sid;
+	int num_vmids;
+	u32 vmids[Q6APM_MAX_VMIDS];
+	bool use_scm_assign;
+	bool has_reserved_mem;
+	size_t reserved_buf_size;
+	struct q6apm_scm_region carveout_regions[Q6APM_MAX_CARVEOUTS];
+	int num_carveouts;
 };
 
+static int q6apm_dai_scm_assign(struct q6apm_scm_region *region,
+				const struct q6apm_dai_data *pdata)
+{
+	struct qcom_scm_vmperm *dst;
+	int dst_count = 0;
+	int ret, i;
+
+	if (region->assigned)
+		return 0;
+
+	dst = kcalloc(pdata->num_vmids + 1, sizeof(*dst), GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	dst[dst_count].vmid = QCOM_SCM_VMID_HLOS;
+	dst[dst_count].perm = QCOM_SCM_PERM_RW;
+	dst_count++;
+
+	for (i = 0; i < pdata->num_vmids; i++) {
+		if (WARN_ON_ONCE(pdata->vmids[i] == QCOM_SCM_VMID_HLOS))
+			continue;
+		dst[dst_count].vmid = pdata->vmids[i];
+		dst[dst_count].perm = QCOM_SCM_PERM_RW;
+		dst_count++;
+	}
+
+	if (dst_count == 1) {
+		kfree(dst);
+		return 0;
+	}
+
+	ret = qcom_scm_assign_mem(region->addr, region->size,
+				  &region->src_perms, dst, dst_count);
+	kfree(dst);
+	if (!ret)
+		region->assigned = true;
+
+	return ret;
+}
+
+static void q6apm_dai_scm_unassign(struct q6apm_scm_region *region,
+				   const struct q6apm_dai_data *pdata)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	int ret;
+
+	if (!region->assigned)
+		return;
+
+	ret = qcom_scm_assign_mem(region->addr, region->size,
+				  &region->src_perms, &hlos, 1);
+	if (ret) {
+		/*
+		 * A failed reclaim leaves the buffer owned by the DSP VMIDs
+		 * instead of HLOS: it must not be reused. Warn loudly and keep
+		 * it marked assigned so it is never handed back to the pool.
+		 */
+		dev_err(pdata->dev,
+			"SCM unassign failed for %pa (size %zu): %d\n",
+			&region->addr, region->size, ret);
+		return;
+	}
+
+	region->assigned = false;
+	region->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+}
+
+static void q6apm_dai_unassign_all(void *data)
+{
+	struct q6apm_dai_data *pdata = data;
+	int i;
+
+	for (i = 0; i < pdata->num_carveouts; i++)
+		q6apm_dai_scm_unassign(&pdata->carveout_regions[i], pdata);
+}
+
+/*
+ * Reclaim and drop the runtime carveout tracking the buffer at @addr.
+ * Only per-PCM buffers (allocated in pcm_new when there is no reserved
+ * memory pool) are removed this way, so tearing one PCM down never
+ * disturbs regions still owned by other live PCMs.
+ */
+static void q6apm_dai_scm_unassign_addr(struct q6apm_dai_data *pdata,
+					phys_addr_t addr)
+{
+	int i;
+
+	for (i = 0; i < pdata->num_carveouts; i++) {
+		if (pdata->carveout_regions[i].addr != addr)
+			continue;
+
+		q6apm_dai_scm_unassign(&pdata->carveout_regions[i], pdata);
+		if (pdata->carveout_regions[i].assigned)
+			return;	/* reclaim failed: keep tracking, warned already */
+
+		/* swap-remove the (now HLOS-owned) slot */
+		pdata->num_carveouts--;
+		pdata->carveout_regions[i] =
+			pdata->carveout_regions[pdata->num_carveouts];
+		return;
+	}
+}
+
 static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
@@ -409,8 +535,11 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		size_t buf_max = pdata->has_reserved_mem ?
+				 pdata->reserved_buf_size : BUFFER_BYTES_MAX;
+
 		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
+						   BUFFER_BYTES_MIN, buf_max);
 		if (ret < 0) {
 			dev_err(dev, "constraint for buffer bytes min max ret = %d\n", ret);
 			goto err;
@@ -431,17 +560,18 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	}
 
 	runtime->private_data = prtd;
-	runtime->dma_bytes = BUFFER_BYTES_MAX;
 	if (pdata->sid < 0)
 		prtd->phys = substream->dma_buffer.addr;
 	else
 		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
 	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		size_t buf_sz = pdata->has_reserved_mem ?
+				pdata->reserved_buf_size : BUFFER_BYTES_MAX;
 		void *pos_buffer;
 
-		prtd->pos_phys = prtd->phys + BUFFER_BYTES_MAX;
-		pos_buffer = (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
+		prtd->pos_phys = prtd->phys + buf_sz;
+		pos_buffer = (void *)(substream->dma_buffer.area + buf_sz);
 		prtd->pos_buffer = (struct sh_mem_pull_push_mode_position_buffer *)(pos_buffer);
 	}
 
@@ -529,6 +659,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream);
+
 static int q6apm_dai_memory_map(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream,
 				int graph_id, bool is_push_pull)
@@ -549,15 +682,21 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 	else
 		phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
-	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys, BUFFER_BYTES_MAX);
+	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys,
+					    pdata->has_reserved_mem ?
+					    pdata->reserved_buf_size :
+					    BUFFER_BYTES_MAX);
 	if (ret < 0)
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
 
 	if (is_push_pull) {
+		size_t buf_sz = pdata->has_reserved_mem ?
+				pdata->reserved_buf_size : BUFFER_BYTES_MAX;
+
 		if (pdata->sid < 0)
-			phys = substream->dma_buffer.addr + BUFFER_BYTES_MAX;
+			phys = substream->dma_buffer.addr + buf_sz;
 		else
-			phys = (substream->dma_buffer.addr + BUFFER_BYTES_MAX) | (pdata->sid << 32);
+			phys = (substream->dma_buffer.addr + buf_sz) | (pdata->sid << 32);
 
 		ret = q6apm_map_pos_buffer(dev, graph_id, phys, POS_BUFFER_BYTES);
 		if (ret < 0)
@@ -572,6 +711,7 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct q6apm_dai_data *pdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm *pcm = rtd->pcm;
 	/*
 	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
@@ -583,15 +723,17 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 	bool is_push_pull;
 	struct snd_pcm_substream *substream = NULL;
 
+	if (!pdata)
+		return -EINVAL;
+
 	graph_id = cpu_dai->driver->id;
 
 	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	else  if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
+	else if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 
-
 	if (substream) {
 		is_push_pull = q6apm_is_graph_in_push_pull_mode_from_id(component->dev,
 									graph_id,
@@ -599,13 +741,46 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 		if (is_push_pull)
 			size += POS_BUFFER_BYTES;
 
-		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+		if (pdata->has_reserved_mem)
+			ret = snd_pcm_set_managed_buffer_all(pcm,
+							     SNDRV_DMA_TYPE_DEV, component->dev,
+							     pdata->reserved_buf_size,
+							     pdata->reserved_buf_size);
+		else
+			ret = snd_pcm_set_fixed_buffer_all(pcm,
+							   SNDRV_DMA_TYPE_DEV, component->dev,
+							   size);
 		if (ret)
 			return ret;
 
 		ret = q6apm_dai_memory_map(component, substream, graph_id, is_push_pull);
 		if (ret)
 			return ret;
+
+		if (pdata->use_scm_assign && !pdata->has_reserved_mem) {
+			struct q6apm_scm_region *r;
+
+			if (pdata->num_carveouts >= Q6APM_MAX_CARVEOUTS) {
+				dev_err(component->dev,
+					"too many SCM carveouts (max %d)\n",
+					Q6APM_MAX_CARVEOUTS);
+				q6apm_dai_memory_unmap(component, substream);
+				return -ENOSPC;
+			}
+
+			r = &pdata->carveout_regions[pdata->num_carveouts];
+			r->addr = substream->dma_buffer.addr;
+			r->size = ALIGN(size, PAGE_SIZE);
+			r->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+			ret = q6apm_dai_scm_assign(r, pdata);
+			if (ret) {
+				dev_err(component->dev,
+					"SCM assign DMA buffer failed: %d\n", ret);
+				q6apm_dai_memory_unmap(component, substream);
+				return ret;
+			}
+			pdata->num_carveouts++;
+		}
 	}
 
 	return 0;
@@ -635,15 +810,29 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
 static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
 {
+	struct q6apm_dai_data *pdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_substream *substream;
+	int i;
 
-	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (substream)
-		q6apm_dai_memory_unmap(component, substream);
+	if (!pdata)
+		return;
+
+	/*
+	 * Reverse of pcm_new: unmap the buffer from the DSP first, then
+	 * reclaim only this PCM's carveout(s) back to HLOS. Regions owned
+	 * by other live PCMs, and the reserved-memory pool, are untouched.
+	 */
+	for (i = 0; i < SNDRV_PCM_STREAM_LAST + 1; i++) {
+		substream = pcm->streams[i].substream;
+		if (!substream)
+			continue;
 
-	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (substream)
 		q6apm_dai_memory_unmap(component, substream);
+
+		if (pdata->use_scm_assign && !pdata->has_reserved_mem)
+			q6apm_dai_scm_unassign_addr(pdata,
+						    substream->dma_buffer.addr);
+	}
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -1017,23 +1206,161 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_EARLY,
 };
 
+static void q6apm_dai_reserved_mem_release(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int q6apm_dai_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct q6apm_dai_data *pdata;
 	struct of_phandle_args args;
-	int rc;
+	int rc, vmids, i;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
+	pdata->dev = dev;
+
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
+
+	vmids = of_property_count_u32_elems(node, "qcom,vmids");
+	if (vmids == -EINVAL) {
+		/* no qcom,vmids: SCM assignment not used on this target */
+		pdata->use_scm_assign = false;
+	} else if (vmids < 0) {
+		return vmids;
+	} else if (vmids == 0 || vmids > Q6APM_MAX_VMIDS) {
+		dev_err(dev, "qcom,vmids: invalid count %d (need 1..%d)\n",
+			vmids, Q6APM_MAX_VMIDS);
+		return -EINVAL;
+	} else if (pdata->sid >= 0) {
+		/*
+		 * iommus (SMMU translation) and qcom,vmids (SCM VMID
+		 * assignment) are mutually exclusive buffer-protection
+		 * schemes; the binding forbids both, reject them here too.
+		 */
+		dev_err(dev, "qcom,vmids and iommus are mutually exclusive\n");
+		return -EINVAL;
+	}
+
+	if (vmids > 0) {
+		rc = of_property_read_u32_array(node, "qcom,vmids",
+						pdata->vmids, vmids);
+		if (rc)
+			return rc;
+
+		for (i = 0; i < vmids; i++) {
+			if (pdata->vmids[i] == QCOM_SCM_VMID_HLOS) {
+				dev_err(dev,
+					"qcom,vmids must not include HLOS\n");
+				return -EINVAL;
+			}
+		}
+		pdata->num_vmids = vmids;
+		pdata->use_scm_assign = true;
+	}
+
+	if (pdata->use_scm_assign) {
+		struct device_node *mem_node;
+		struct reserved_mem *rmem;
+
+		if (!qcom_scm_is_available())
+			return -EPROBE_DEFER;
+
+		mem_node = of_parse_phandle(node, "memory-region", 0);
+		if (mem_node) {
+			rmem = of_reserved_mem_lookup(mem_node);
+			of_node_put(mem_node);
+			if (rmem) {
+				struct q6apm_scm_region *r;
+
+				r = &pdata->carveout_regions[pdata->num_carveouts++];
+				r->addr = rmem->base;
+				r->size = ALIGN(rmem->size, PAGE_SIZE);
+				r->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+			}
+		}
+
+		mem_node = of_parse_phandle(node, "memory-region", 1);
+		if (mem_node) {
+			rmem = of_reserved_mem_lookup(mem_node);
+			of_node_put(mem_node);
+			if (rmem) {
+				struct q6apm_scm_region *r;
+				size_t per_stream;
+
+				/*
+				 * The data-path carveout is a shared DMA pool
+				 * from which all PCM substreams pre-allocate.
+				 * Divide evenly so concurrent streams fit,
+				 * subtracting per-stream position-buffer
+				 * overhead. Reject a pool too small to give
+				 * each stream a usable buffer (unsigned
+				 * arithmetic would otherwise wrap).
+				 */
+				per_stream = rmem->size / Q6APM_POOL_MAX_STREAMS;
+				if (per_stream <= POS_BUFFER_BYTES) {
+					dev_err(dev,
+						"reserved-memory pool too small: %llu bytes\n",
+						(u64)rmem->size);
+					return -EINVAL;
+				}
+
+				rc = of_reserved_mem_device_init_by_idx(dev, node, 1);
+				if (rc) {
+					dev_err(dev,
+						"reserved-memory pool init failed: %d\n",
+						rc);
+					return rc;
+				}
+				rc = devm_add_action_or_reset(dev,
+							      q6apm_dai_reserved_mem_release,
+							      dev);
+				if (rc)
+					return rc;
+
+				/* never exceed the per-substream buffer cap */
+				pdata->reserved_buf_size =
+					min_t(size_t,
+					      per_stream - POS_BUFFER_BYTES,
+					      BUFFER_BYTES_MAX);
+				pdata->has_reserved_mem = true;
+
+				r = &pdata->carveout_regions[pdata->num_carveouts++];
+				r->addr = rmem->base;
+				r->size = ALIGN(rmem->size, PAGE_SIZE);
+				r->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+			}
+		}
+
+		if (pdata->num_carveouts) {
+			for (i = 0; i < pdata->num_carveouts; i++) {
+				rc = q6apm_dai_scm_assign(&pdata->carveout_regions[i],
+							  pdata);
+				if (rc) {
+					dev_err(dev,
+						"SCM assign carveout[%d] failed: %d\n",
+						i, rc);
+					return rc;
+				}
+			}
+			rc = devm_add_action_or_reset(dev,
+						      q6apm_dai_unassign_all,
+						      pdata);
+			if (rc)
+				return rc;
+		}
+	}
 
 	dev_set_drvdata(dev, pdata);
 

-- 
2.34.1

