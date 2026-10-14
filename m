Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DA3472F8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961410; cv=none; b=jQCMGZSrqTCxIcsPx/nNeUroJlUmySZj6koVgpV6mZ/7Wt63gugA6N6Su7TDUGLPSRgXWMCUkRnWffHXiIp+zbIcR1dg8bEmIypqY3bf8CSEZ01rkLCA8oL6/7EKWcqJmWCsu8KvHXRwOdMj20qijMSevX4oxIcdS/AFTng81QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961410; c=relaxed/simple;
	bh=F21OYanVAAqs2hKx7RUf5LWkfkGTby9HdJFG9d99jMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u12m5+vsEGZpprQW1SwSVj7uzfK00phfd3rHr1ifwBomhnXKXhPFAKxt40jNSHRATjTlVpuiRQ+VrYuJqtFm/IZyL+bKwPbuwCU6P+rFBd3YuNyh2vtxjxxrpMSXWnIlpTd4fIQgPdiSXyPhq0K1VyA/tiNL1qdYNfPTxm0DdXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaQXlIcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYF4wtDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaQXlIcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYF4wtDE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5wpLB3951298
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDTuFl8M0uMSte9I6JILvtX4U0GUzx/YvPxeogS4InU=; b=gaQXlIclILUHMx24
	O/etvQlXoYgrYhLf2Ew0zGH20YEEgZgJ0Ll830LRehTRwJ7p7GlCyPZ05HIu1ZpA
	qvprP46RHr59x3naK7vjvSk74edQbFgcBPjdJ0krBs/gpUktqPrS81scbH+0tKa6
	MLJzSDoDH04CfwOuGqwLlra/8oLu/pgm72tEx6tCfEgQM+C/Dc0gap+J4KdU+jEU
	zW0pyz21dEo5pAWRNNdZ+WJVynh1b04tZfE0YyD03vPW8FdIlXFqKdWSCvRAf0gP
	F2U2Dr66mQ/e0S9U52cPr9wNV0xxpve1bPebsLv1not9mhsdHwfNugR1Sp/jCU3s
	FWWgRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p08af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:03:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so46009705ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961406; x=1792566206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDTuFl8M0uMSte9I6JILvtX4U0GUzx/YvPxeogS4InU=;
        b=KYF4wtDEc0MYXHbHFjM04Pv/lflPaYOyWdnv+EfnWgl/kSBlP+uTlWT1Sdwefn9CcO
         UEpCnwKe9MFgGim3D+1iDx21lwgWerP0Bd/Spj+rYZAQOh3yPK4mlm79wXGNwpLRyunY
         9mt9kCU0dAsiE2AIIlhGxExQdzBLiedsXJMwDaH7WcGF04MQYs0d19hjUyqIGsg/s+z+
         1jm2GaFP4oyHHMGgBoI5kL7tY4yFqSHj5klqsE3dvcouEaEqn3KYgOgzR/ztLyYMODdz
         fUHFE6Gto9szWyBUufq1jS2VD3Aa1PIdvaMzDDBH9X59wj3n/BnYALJOMh1HuFqZcIdD
         XFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961406; x=1792566206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDTuFl8M0uMSte9I6JILvtX4U0GUzx/YvPxeogS4InU=;
        b=I5ELBlszzuuSWri0v7jMBbtjoZCdxoZiKzFmztjVTvKnZCGRXv0WmL72HHuVOHXsF2
         ViGloaGwu9ECNwkjZk/GFv5U5pgYmkQUVIZOa6PIjEZSyqegrv/hNyrgM5Yc9Lsnc/xf
         c51GoXPJiGXaPRxPk1Tomkibg5G7MQR3hSpJEKoslvV90Mg+1W97SdCae5JpTtyEefpY
         1EdVKt7omFVP7qfW+36jISz1mhGcBXEpr6pFwjYl9REkUNdMeisvGLCS4F78fNpgGfYS
         qfCXjRrJIQtcoXFY0wSz53faFKft0BRIdi7hSsTejnFPTwiCso/YUIosuBYR5pFoEB3i
         ATvA==
X-Forwarded-Encrypted: i=1; AKwUvBxeSzB+lyt2d1/URwSvUEx+MVaCd2PKG/3G8tHfm5Lz6NOkQq9Nuremllrhrr3edrRjymjATtPgM2uArg6w@vger.kernel.org
X-Gm-Message-State: AFq9FYJs4RslU6LMzeDUwbC7r2Wd8/cTpsPANHV0IPiXC/+AVZGd7mwC
	ndzLsWWDxLp7FpUgngXkj1Mg1evl9zOqoQY8oPRPy6xDG3U7Y9Sa3QtmlfXAwM3H8uq3EG+VlUo
	uIKaFajQuHIgIbsfCQe00eML0d973TPLiATNVwzH2/OusDaJ8Ibu38CxND6krCJ+eZbT9
X-Gm-Gg: AYBFou0PwI28gxImRxWHgfPZN5c++bWe0jKoIkuR1W/3g5ol+ha/I5ZcIQZ8U/Rvd8B
	xaOH4MhFCRJ3Dh6AgOrHP73T3HYeKAwMY+sSey+VJqexR+GbAgod+8+tETKfiCO308P1y+GTGtk
	6VXdGbhluOk8XkIVdGUz4+F0uIseeby0hL8zi/M4KYdCr4p1CWbwX4n5G3xTOQrIe+jHeEmJTTl
	NAclLJ594YskwjXEhQjhw0QO+g5Ca7WqEgo8K2+ljjbL6Sw2gyAX5ZpzmZfUEbnHlkGOrm0gdQa
	eMO7WH9N/V3TngBiYibX4S+xb/aFCXoVp9pp5ufUc6EfeuPA0H2G3yY3hT9oHdrAvs0JyB02NK1
	nJ27bsZlwKtkjmX7GJfcabQ+HSic=
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr122592105ad.42.1791961404432;
        Wed, 14 Oct 2026 00:03:24 -0700 (PDT)
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr122590705ad.42.1791961402348;
        Wed, 14 Oct 2026 00:03:22 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4eb2sm66260575ad.74.2026.10.14.00.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:03:21 -0700 (PDT)
Message-ID: <72f6c61e-6a54-436a-a189-5df2aacf5009@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:33:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-2-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-2-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX8B2Sc6wdFIbh
 lVuiDMd1tS21CBspsCU5sDrQkEGl8+8gSDiVdsCVD3+NmjMffsUpbli1l8ik7SUG6q4K5yt9z9C
 +7oEbkdM5xokWMB9s7iw1q64LXZ/K5c=
X-Proofpoint-ORIG-GUID: cxWdIjO_yK1kGH70WjOb8u2Ul6wER00E
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf293f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z3bimFajvD2yUsiwNYsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX3MNDeng/FS8d
 BJ4jIbDhXhCxsA+bNU3754puULv7uHYPZ3Qw5qya7LoAwigA92htx53NJtN8YAWTodZaVKi9Ko/
 V4uRWtCqnA7pRsn0zeuBsk19Xs5asR2ZCERdggZoJxA/uJgnXw3Ghdm41tcMxDzht2wqW9Ekq2T
 Bsmskjb2RjOmpGrZ4LsSe9ewCo53s5Rm3s1VUj4APzTohoU/7mZumhk3UXE7q5Bz8WVIzAmsWHs
 zDiBH7CFAee8uS4EuwNxWHlwasf8bNyqFkmJDVBj3MK5/BRivhEEw6/semDoA4/VOtl3YRUgfVe
 moWSaOvZvktquvzy27LQkvKz0qKRzX5yAGrUTCt0GKzkmaSCkyIbl4towXrotIhAT1zBWBnXw/k
 auE++1OwfJMv/yrafsTKWzSZsADWT3gmXY/k2Hj6gkngVZMELEh0TKqIhfLvNW0/pUVj3EQVcNw
 0NQRo882cMiDK0dXklQ==
X-Proofpoint-GUID: cxWdIjO_yK1kGH70WjOb8u2Ul6wER00E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140027



On 10/13/2026 11:21 AM, Harendra Gautam wrote:
> Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PCM
> platform drivers.
> 
> QAIF exposes AIF DMA paths for external audio interfaces and CIF DMA paths
> for the internal codec interface. The two drivers need a common place to
> describe DMA channel allocation, regmap fields, interrupt dispatch, SHRAM
> buffer tracking and per-stream runtime data.
> 
> Introduce the QAIF driver data, AIF and CIF register-field descriptions,
> IRQ mapping helpers and SoC variant descriptor. The variant descriptor
> describes the register layout, DMA channel counts, clock names, DAI table
> and platform callbacks used by the QAIF driver code.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>


LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/qcom/qaif.h | 292 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 292 insertions(+)
> 
> diff --git a/sound/soc/qcom/qaif.h b/sound/soc/qcom/qaif.h
> new file mode 100644
> index 000000000000..794d02ef128b
> --- /dev/null
> +++ b/sound/soc/qcom/qaif.h
> @@ -0,0 +1,292 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef SND_SOC_QCOM_QAIF_H
> +#define SND_SOC_QCOM_QAIF_H
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <sound/pcm.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +struct snd_pcm_substream;
> +struct snd_soc_dai_driver;
> +struct snd_soc_dai_ops;
> +struct platform_device;
> +
> +#define QAIF_CIF_DMA_INTF_ONE_CHANNEL		0x01
> +#define QAIF_CIF_DMA_INTF_TWO_CHANNEL		0x03
> +#define QAIF_CIF_DMA_INTF_FOUR_CHANNEL		0x0f
> +#define QAIF_CIF_DMA_INTF_SIX_CHANNEL		0x3f
> +#define QAIF_CIF_DMA_INTF_EIGHT_CHANNEL		0xff
> +
> +#define QAIF_AIF_SLOT_WIDTH(bits)		((bits) - 1)
> +#define QAIF_AIF_SAMPLE_WIDTH(bits)		((bits) - 1)
> +
> +/* Watermark level 5 encoded as N-1: hardware field value = watermark - 1 */
> +#define QAIF_DMACTL_WM_5			4
> +
> +#define QAIF_DMA_BYTES_TO_WORDS_SHIFT		3
> +#define QAIF_DMA_CLOCK_FREQ			38400000
> +
> +#define QAIF_MAX_AIF_CFG_CNT			4
> +#define QAIF_MAX_LANES				8
> +
> +#define QAIF_MAX_MI2S_PORTS			8
> +#define QAIF_MI2S_SLOTS				2
> +#define QAIF_MAX_AIF_DMA_IDX			8
> +#define QAIF_MAX_CIF_DMA_IDX			8
> +
> +/* SID map register CSID field (WRDMA_SID/RDDMA_SID), bits [4:0] */
> +#define QAIF_CSID_MASK				GENMASK(4, 0)
> +
> +static inline bool qaif_is_aif_mi2s_port(unsigned int dai_id)
> +{
> +	return (dai_id >= AIF_MI2S_RX_0 && dai_id <= AIF_MI2S_RX_12) ||
> +	       (dai_id >= AIF_MI2S_TX_0 && dai_id <= AIF_MI2S_TX_12);
> +}
> +
> +static inline bool qaif_is_aif_tdm_port(unsigned int dai_id)
> +{
> +	return (dai_id >= AIF_TDM_RX_0 && dai_id <= AIF_TDM_RX_12) ||
> +	       (dai_id >= AIF_TDM_TX_0 && dai_id <= AIF_TDM_TX_12);
> +}
> +
> +static inline bool qaif_is_aif_port(unsigned int dai_id)
> +{
> +	return qaif_is_aif_mi2s_port(dai_id) || qaif_is_aif_tdm_port(dai_id);
> +}
> +
> +static inline bool qaif_is_cif_port(unsigned int dai_id)
> +{
> +	return (dai_id >= WSA_CODEC_DMA_RX_0 && dai_id <= RX_CODEC_DMA_RX_7);
> +}
> +
> +enum qxm_sel {
> +	QAIF_QXM0 = 0,
> +	QAIF_QXM1 = 1,
> +};
> +
> +enum qaif_irq_type {
> +	QAIF_AIF_IRQ = 0,
> +	QAIF_CIF_IRQ = 1,
> +	QAIF_IRQ_TYPE_MAX,
> +};
> +
> +enum qaif_dma_type {
> +	QAIF_AIF_DMA = 0,
> +	QAIF_CIF_DMA = 1,
> +};
> +
> +struct qaif_aif_config {
> +	u32 sync_mode;
> +	u32 sync_src;
> +	bool invert_sync;
> +	u32 sync_delay;
> +	u32 slot_width;
> +	u32 slot_en_rx_mask;
> +	u32 slot_en_tx_mask;
> +	bool loopback_en;
> +	bool ctrl_data_oe;
> +	u32 lane_en_mask;
> +	u32 lane_dir_mask;
> +	bool full_cycle_en;
> +	u32 slot_num;
> +};
> +
> +struct qaif_pcm_data {
> +	/* Flat slot in aif_substream[] (or cif_substream[]) used to track
> +	 * this stream. Direction-encoded: playback uses the raw DMA channel
> +	 * number (0..num_rddma-1), capture adds wrdma_start so playback and
> +	 * capture of the same DAI occupy distinct slots.
> +	 * Set by alloc_stream_dma_idx(); bounded by QAIF_MAX_AIF/CIF_DMA_IDX.
> +	 */
> +	int stream_dma_idx;
> +	/* Hardware channel number (0-based within its DMA bank) passed to
> +	 * register address helpers (e.g. QAIF_RDDMA_CFG_REG(v, chan)).
> +	 * Direction-agnostic: the register helpers select RDDMA or WRDMA bank
> +	 * based on stream direction, so both directions of the same DAI share
> +	 * the same value. Set by get_dma_idx().
> +	 */
> +	int dma_reg_idx;
> +};
> +
> +/* Named 0-based DMA channel indices used as the dma_idx of a
> + * qaif_dmaidx_dai_map entry, so board tables reference channels by name.
> + */
> +enum qaif_dma_idx {
> +	QAIF_DMA_IDX0 = 0,
> +	QAIF_DMA_IDX1,
> +	QAIF_DMA_IDX2,
> +	QAIF_DMA_IDX3,
> +	QAIF_DMA_IDX4,
> +	QAIF_DMA_IDX5,
> +	QAIF_DMA_IDX6,
> +	QAIF_DMA_IDX7,
> +};
> +
> +/* Associates a DAI ID with its physical DMA channel index on a given
> + * board/variant. @dai_id is the DAI to match; @dma_idx (a qaif_dma_idx value)
> + * is the 0-based hardware channel that get_dma_idx() returns for it.
> + */
> +struct qaif_dmaidx_dai_map {
> +	unsigned int dai_id;
> +	int dma_idx;
> +};
> +
> +struct qaif_drv_data {
> +	struct clk *mi2s_bit_clk[QAIF_MAX_MI2S_PORTS];
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct clk *aud_dma_clk;
> +	struct clk *aud_dma_mem_clk;
> +	void __iomem *audio_qaif;
> +	struct regmap *audio_qaif_map;
> +	int audio_qaif_irq;
> +	struct mutex stream_lock; /* serializes stream open/close */
> +	bool qaif_hw_configured;
> +	const struct qaif_variant *variant;
> +	struct qaif_aif_config aif_intf_cfg[QAIF_MAX_AIF_CFG_CNT];
> +	unsigned long aif_dma_idx_bit_map;
> +	unsigned long cif_dma_idx_bit_map;
> +	struct snd_pcm_substream *aif_substream[QAIF_MAX_AIF_DMA_IDX];
> +	struct snd_pcm_substream *cif_substream[QAIF_MAX_CIF_DMA_IDX];
> +	u32 smmu_csid_bits;		/* SMMU stream ID bits from DT iommus cell */
> +};
> +
> +enum qaif_summary_irq_bitmask {
> +	QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA		= BIT(0),
> +	QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA	= BIT(1),
> +	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA		= BIT(2),
> +	QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA		= BIT(3),
> +	QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA		= BIT(4),
> +	QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA		= BIT(5),
> +	QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA		= BIT(18),
> +	QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA	= BIT(19),
> +	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA		= BIT(20),
> +	QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA		= BIT(24),
> +	QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA		= BIT(25),
> +	QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA		= BIT(26),
> +};
> +
> +enum qaif_client_status_register_bitmask_info {
> +	QAIF_BITMASK_AIF_RDDMA_WRDMA	= GENMASK(5, 0),
> +	QAIF_BITMASK_CIF_RDDMA_WRDMA	= GENMASK(26, 18),
> +};
> +
> +struct qaif_irq_map {
> +	u32 client_id;
> +	u32 mask;
> +	/*
> +	 * Called from the hard IRQ handler (asoc_platform_qaif_irq()) with
> +	 * @status holding the summary interrupt status. Must not sleep.
> +	 */
> +	irqreturn_t (*client_irq_handler)(struct qaif_drv_data *drvdata, u32 status);
> +};
> +
> +enum qaif_dma_dir {
> +	QAIF_DMA_RDDMA = 0,
> +	QAIF_DMA_WRDMA = 1,
> +};
> +
> +enum qaif_irq {
> +	QAIF_IRQ_PERIOD = 0,
> +	QAIF_IRQ_OVERFLOW,
> +	QAIF_IRQ_UNDERFLOW,
> +	QAIF_IRQ_ERROR,
> +};
> +
> +enum qaif_irq_op {
> +	QAIF_IRQ_CLEAR = 0,
> +	QAIF_IRQ_ENABLE,
> +	QAIF_IRQ_DISABLE,
> +};
> +
> +enum qaif_client_info {
> +	QAIF_CLIENT_ID_AIF_DMA = 0,
> +	QAIF_CLIENT_ID_CIF_DMA,
> +};
> +
> +struct qaif_variant {
> +	u32 ee;				/* Hardware EE index assigned to this driver instance */
> +
> +	u32 num_rddma;
> +	u32 num_wrdma;
> +	u32 wrdma_start;
> +	u32 num_codec_rddma;
> +	u32 num_codec_wrdma;
> +	u32 codec_wrdma_start;
> +	u32 num_intf;
> +
> +	u32 rddma_reg_base;
> +	u32 rddma_stride;
> +	u32 codec_rddma_reg_base;
> +	u32 codec_rddma_stride;
> +	u32 wrdma_reg_base;
> +	u32 wrdma_stride;
> +	u32 codec_wrdma_reg_base;
> +	u32 codec_wrdma_stride;
> +
> +	u32 rddma_irq_reg_base;
> +	u32 rddma_irq_stride;
> +	u32 codec_rddma_irq_reg_base;
> +	u32 codec_rddma_irq_stride;
> +	u32 wrdma_irq_reg_base;
> +	u32 wrdma_irq_stride;
> +	u32 codec_wrdma_irq_reg_base;
> +	u32 codec_wrdma_irq_stride;
> +
> +	/* QSB master port selector; only QAIF_QXM0 is supported today */
> +	enum qxm_sel qxm_type;
> +	/* SHRAM sizes in 64-bit words */
> +	u32 rddma_shram_len;
> +	/* SHRAM start offsets (in 64-bit words), indexed by enum qaif_dma_type */
> +	u32 rddma_shram_start_addr[2];
> +	u32 wrdma_shram_len;
> +	u32 wrdma_shram_start_addr[2];
> +
> +	const char * const *clk_name;
> +	int num_clks;
> +	struct snd_soc_dai_driver *dai_driver;
> +	int num_dai;
> +	const char * const *dai_bit_clk_names;
> +	/*
> +	 * Optional per-AIF configuration tables, indexed by AIF interface
> +	 * index (0..num_intf-1). NULL if the variant does not use them.
> +	 */
> +	const bool *aif_full_cycle_en;
> +	const bool *aif_ctrl_data_oe;
> +	const bool *aif_loopback_en;
> +
> +	/* Returns a direction-encoded flat slot index for use in
> +	 * aif_substream[]/cif_substream[] and the dma_idx_bit_map.
> +	 * Playback returns the raw channel number; capture adds wrdma_start (or
> +	 * codec_wrdma_start) so both directions of the same DAI get distinct
> +	 * slots. Sets the corresponding bit atomically; returns -EBUSY if
> +	 * already open, -EINVAL if @dai_id or the computed index is out of range.
> +	 */
> +	int (*alloc_stream_dma_idx)(struct qaif_drv_data *data, int direction,
> +				    unsigned int dai_id);
> +	/* Clears the bit set by alloc_stream_dma_idx. */
> +	int (*free_stream_dma_idx)(struct qaif_drv_data *data, int chan,
> +				   unsigned int dai_id);
> +	/* Returns the hardware channel number (0-based within its DMA bank)
> +	 * for @dai_id, direction-agnostic. Used as dma_reg_idx.
> +	 */
> +	int (*get_dma_idx)(unsigned int dai_id);
> +};
> +
> +extern const struct snd_soc_dai_ops asoc_qcom_qaif_cif_dai_ops;
> +extern const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu_dai_ops;
> +
> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev);
> +int asoc_qcom_qaif_platform_register(struct platform_device *pdev);
> +extern const struct dev_pm_ops asoc_qcom_qaif_pm_ops;
> +
> +#endif /* SND_SOC_QCOM_QAIF_H */
> 

