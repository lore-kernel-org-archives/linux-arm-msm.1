Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108863;
	b=OvJmD4me90kPO33bGqYSpMhZWdtPN8CtqfsVQJpPF7Z1s6gQvZXGaLQv0zjPyen8za7P
	 0Cw3yEIvfiB60J8/wcD+8Z9J1/BRpyC6hIlaDrxuvsDOrEyqZFAYiIx4Ighb6JBIeOUXD
	 AGHs56V1OMNu7FMoPxks5zkOtP/PKpcVDJsCb8X0o5ELrGOLfsSoIbizVfCMI8qZCOR+U
	 G7xCWfI+h7rzQKUvJiqzEZg7074kGhFHxzCSji022K0SPPJC+/+3LcljeakqNxa1BeKRR
	 zDNidiQWeYTKzi81uAOhVb2PfHLBsuhbE8mKNq7WtWIiZ+w/Y+TRVxf7gCJyjSIX9Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=;
	b=YmNE1f7oYfLZEmyG+8y36f6E+eGoAmVNkU9pw1Bar1ymxsvl30EoayaIlSxXTMkKhuqV
	 qFyKRY5YQR1b3EfNsmOVwENtI3agWnV1L5Bk5SYg8F+9sEXuBDUVk+/vo2YMqBPGCsGtb
	 dCpUjtF9n9js0kT5WpAxHURsYeenNrWKd2yK8paLu5tAEsa7E+FAyf2jXumX1zI9El4iZ
	 OtphBac9PTKEL9TLHj2n1f5H5jgvxMzgVbtiv9Bjiq4g2sMW7/UItjb0qg8JWjWZxTegy
	 Wdldi6iRqv9bPeRJ+V1ejSW+qgsWgIfoecQhZGiEOyqek9Uz9d1bnDiIQ9VzBTupShw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ikdeUetf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IsOvpaHp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68786606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68786606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ikdeUetf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IsOvpaHp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3LM432370
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=; b=ikdeUetftx09demK
	cOUP61XV081zUWjq1bYn/wWv6mgFBtW04n3oLKUlTO9cU3W0p8EnNinxry6ZU2NB
	ez4aWGy7nzwzIeuM/dE8wsYLC6vp+ZvbDG/xfxuNezWmGsYOm9uGHQ2RYFvGVQTV
	uT2peFtXa8yXRRvnuKdPpgMhfhezNc5/1RQZs33BTHJF5igOUNPUAiVXjsxp/4JC
	QItjsr8XQt0eLl/rPoDKY/GKrKKXOi0qq+1Sy3yexpbCI34azDyf87U67VaALITZ
	y9VjNLyGYpWR8eL27uiS5J3/YaKnQK8HCJSIklZ90tZOb3xYXSBwYMMZtXI7/Z9k
	iNaBNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54m3da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so669381985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108861; x=1793713661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=;
        b=IsOvpaHp+Wg4QUR6eANyYcLeJ8DABW+gKoLlCDQSfGMOiyGxeSGNX8vPnk2SyOGCdr
         K2HLLVXx4c9XiMFDNn1rXIp0n8avHLuN+twjPVcaSk5ra1Vg5qfjcf7Q57vsm/tnKwfS
         LYWhppJXieGhfIcQljxKz78NeCChUOmLl4B/JitJcw6DNW22G1l1Z2hoSltm7jDlWjTl
         RCB5XxuBlodh33BvM+/Wp3DS266LVFpBdzXsYnA8OFLZ8OijZSb/lCndXUy+edhCP/x1
         ZivNmcoyp+7l3D9gxB5mUpBbc03jlEdLI7K7qBEzcOkcNvxcGKeswxql+FIS03YHk3Rs
         rmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108862; x=1793713662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d6rw2owiMRe6NAfcJICofeHjIgCc+NTo53e9Ex7MRc=;
        b=UQrdktbuFzLF4yaScTb93aFio5rVXuoc/ZtaJB7/tQVlFvmSts1eWVHRwVV+ttykmv
         HZYEmF/t8BBObQ0mKHDaIv7I/IJ+XmuWQAyApSP87VsN7uvWGvlBfJar1mQpLoMOWGWX
         IUqbT1+FFicYvsb6TUFD3VhHvs2itZfrSlC61lMpdl6am8vzpW/3A3pD8d1a1FpoSd3C
         tJIL29hZMLlyTLPiHAR2NSoHiiWuB4REGkzeR9yoMTd7PQPHY3RAQ2gNBK0A5g53EYnl
         2yBchJq8as4tZrPOWL2WRdJ8Cle+QqCJkGjnDdR3VgKvMDJZz/kVlOKrD1pwnbPWIkYp
         LPWg==
X-Forwarded-Encrypted: i=1; AKwUvBy4tpJuCTd4tjbNJDwndGRZHz9kA8dYsvRFALx5rSJPPKq+VFZoTjJ6VDbkUlzzeXrZ+eLQRPWUFkeRVsrW@vger.kernel.org
X-Gm-Message-State: AFq9FYKAc1Ha403uG6ExkmAJYa2W72hYqabSn0vig3cQYhvtzTLrZDX3
	ub1ilH697joLGl9KR0kmwlAB9GvvEY6n01x+D/iQuTXzH62p462imRFaRqAtyvNNCwwncKY6JWh
	c/Uo1lU1eqxXsG9C45m146HuNtzL9vQHLShsTWPpG9wRFPJaG7dC3UWuYVhlyfWhn6KsJ
X-Gm-Gg: AYBFou2hYJbjE4bCWGSioTXQ5I9CHVFjw3vavd3QgUAXxwu9XMiGVVoqyEqHptdeHrr
	eCva1pItfHt/bofLUL81l6W73PQnFarLeQz57P2OB3rpT95G7231rmwPmunXBeFOJ4g3Dt1dbWz
	Vo11VV/Ccx238VF0o7e51iKKeZc2+umrV09o7rBXo4px8+wn2EepgGcTa0wke4LHguCtb885K1y
	hV0f0KaOY92gxfK1i1S75zD3K+6XcJXl75+KTq/JHos+Uk1KOY5MGdvzecEDC1o5PMjuOqZTpHl
	/4isjNpPSrQPEY9Id9jhWbdc0fcluPD6IxnUcNkudoAygH0wnvBUaRTi3QmkkA/mQ6xa06dDG7G
	bNE8bdAcHUCZF5rMOWMIozoY+QQ==
X-Received: by 2002:a05:620a:198e:b0:93f:6f8:9d74 with SMTP id af79cd13be357-940ef94d19emr1545838385a.77.1793108861542;
        Tue, 27 Oct 2026 06:47:41 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:93f:6f8:9d74 with SMTP id af79cd13be357-940ef94d19emr1545829185a.77.1793108860756;
        Tue, 27 Oct 2026 06:47:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm451676166b.81.2026.10.27.06.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:47:39 -0700 (PDT)
Message-ID: <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:47:38 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfXxOOdYOINMYPN
 YF2czp/F7tiNNjsUfbW743C3Q3MZP6wmp7rdJJjZZuUD5Zgo9sZ/zrovSNdrbpuWcKYEI15+Xh9
 erbUFUU6OnzsYtXIJn3pPrV5p7jwnH0=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0ab7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VWED3eWwzX_2bvjvJsAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: m5-cfR01DKXH9rb3sQh7NBiKIa1mT_cB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX5j4LdUlZ5u0s
 MqGWNEILUq24wvdtn4rBU3Z/Oe9nThrlgxHwxH4hG9T3oIk/Hw3pnYeYgFwULOsGL5UhEN7lVHy
 6MyJF6kV5yWBRkbWT4jMwz9px3F4hfq1NJ+ieAESMzGvclYmL1H3jUBhm91ttwHQ3Yeske8clGS
 6DrAFwRDtP6RU405kMR2LFwhpWlsTOSMM74uh9KX8Qk8mDDT1xfbjwkOMFeMHiiQPEO9rpN9eTa
 grwMVbn9DnR4ZvEE5dtAEWAm/tGKYNoObQBVTRyrdj1+F4V8a3cn31ETtnB4Wz5vRk5UodrJNvJ
 iwhk5wIwodKJsTNdD1aCK9TMkzC2c3+OYDqHIemHhtQ83IKWPziO6Qsl77M5YT1DHqVVhO/+WDB
 yekLstHvr5PA6a0P25vcBzKKxvXItQ8kvBplQoVNi2R0nAu9ZPqbympuNPp2259fQJ1ZRcdUARi
 Fcr+eBPV9kv36WP6Dpg==
X-Proofpoint-GUID: m5-cfR01DKXH9rb3sQh7NBiKIa1mT_cB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054

On 10/26/26 8:25 AM, Zhangfei Gao wrote:
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
bit more context would help, why you need it now?

> 
> Reuse q6dsp_map_channels() to support multichannel PCM formats.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> ---
> 
> v2: reuse q6dsp_map_channels
> 
>  sound/soc/qcom/qdsp6/audioreach.c       | 26 -------------------------
>  sound/soc/qcom/qdsp6/audioreach.h       |  1 -
>  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  9 +++++++--
>  4 files changed, 16 insertions(+), 32 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index d2dc5d37bccf..33161523c7da 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
>  }
>  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>  
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
> -{
> -	if (num_channels == 1) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -	} else if (num_channels == 2) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -	} else if (num_channels == 4) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -		ch_map[2] =  PCM_CHANNEL_LS;
> -		ch_map[3] =  PCM_CHANNEL_RS;
> -	}
> -}
> -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> -
while you at this, please remove AR_PCM_MAX_NUM_CHANNEL too.

Other than that it looks good to me.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  static void apm_populate_container_config(struct apm_container_obj *cfg,
>  					  const struct audioreach_container *cont)
>  {
> @@ -1185,11 +1169,6 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>  	int payload_size;
>  	int i, j;
>  
> -	if (num_channels > 4) {
> -		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> -		return -EINVAL;
> -	}
> -
>  	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
>  
>  	struct gpr_pkt *pkt __free(kfree) =
> @@ -1275,11 +1254,6 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>  	int i, j;
>  	void *p;
>  
> -	if (num_channels > 4) {
> -		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> -		return -EINVAL;
> -	}
> -
>  	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
>  
>  	struct gpr_pkt *pkt __free(kfree) =
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 587f14ce71d2..495072da070b 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -1009,7 +1009,6 @@ static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
>  
>  void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
>  				   uint32_t token);
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
>  void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>  			       uint32_t token, uint32_t src_port,
>  			       uint32_t dest_port);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 58beaf906b9f..83594b693569 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -21,6 +21,7 @@
>  #include <asm/div64.h>
>  #include <asm/dma.h>
>  #include "q6apm.h"
> +#include "q6dsp-common.h"
>  
>  #define DRV_NAME "q6apm-dai"
>  #define POS_BUFFER_BYTES	4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>  	cfg.num_channels = runtime->channels;
>  	cfg.bit_width = prtd->bits_per_sample;
>  	cfg.fmt = SND_AUDIOCODEC_PCM;
> -	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
> +	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +	if (ret)
> +		return ret;
> +
>  	if (prtd->state) {
>  		/* clear the previous setup if any  */
>  		q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>  		cfg.num_channels = 2;
>  		cfg.bit_width = prtd->bits_per_sample;
>  		cfg.fmt = codec->id;
> -		audioreach_set_default_channel_mapping(cfg.channel_map,
> -						       cfg.num_channels);
> +		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
> +		if (ret)
> +			return ret;
> +
>  		memcpy(&cfg.codec, codec, sizeof(*codec));
>  
>  		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..fcc0267d3657 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
>  	cfg->bit_width = params_width(params);
>  	cfg->sample_rate = params_rate(params);
>  	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>  
>  	switch (dai->id) {
>  	case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
>  	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>  	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>  	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
> +	int ret;
>  
>  	cfg->bit_width = params_width(params);
>  	cfg->sample_rate = params_rate(params);
>  	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>  
>  	return 0;
>  }

