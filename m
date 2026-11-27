Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798916;
	b=vVota4nKJ0KRuy9x26Wzch4tAzkVqN3WhkjvLaosamKvCgrcW1HJNsRqpmctpu1KrdIE
	 9oT6UVEqRiGJXdBlbJPxkZtX0Lum+Lwc7nXrvisSO54VDxJg/bAX1bi5IYk3bu62Nb49x
	 giNXyClt518iB8Dblvox0hfvsMtrcqxqTMSgEdknb/UgB96u5/o2/brGx7Ch1cdEAQuIA
	 FzzB5yke2rzg8WZQEMCUWjlWzGhLo1J8B6WsGx9eeFeuSKgC++Ga3s5pU0wV8zmTNrWcw
	 zSYJzk35I2k9HJUkUW0/1Mz3tJG2bPv2wPQO5/itkEHb9DZ4yWF0QBsrw+JikgNI0eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=;
	b=1L0ki6nfBvJ+X1uGpB8Yy195h42j1eCIkfXpIHLL3yYcNn3OADD3rAkXemRO4Z0/3LCN
	 SFa86RX4xN7DP2B8q5Pb6tYj3Ingu0chvvTytcQB2wI3MlrvFWdvyUNExPTX8RU3whL9K
	 ISFSGWelykaFT8tJS84AK7QXG0EzcPstchy/OaDf//JSM+VGfq8BclK51Por+CyhfB85c
	 7dyjjv0thAyL6/IKfvQMRtCUHNMbQKuJja7m7kxM4vpGsKhxcAFjbZswvH4ChbCbjQC4k
	 ZUuk0KB6PxWRkEFqkbsU0b1jnW+3DMu9SpilUELrLF2sWMOH/8rijoRUl6zx/SARi0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUuIYPYL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyqaHPyH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BBF606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 17:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BBF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUuIYPYL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyqaHPyH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpLK42033050
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 17:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=; b=BUuIYPYLZgdXcgQh
	Jd4j5oblTIPyKCG05mdOQDP4wkDZBYPv32N4XQ9zbDtMsYpD53rW14IrB7nILfER
	ZYjJSYiNARQoag/Z3XrYlk6ToGE8SF+kqdryqfiOFXfFfdn6hB5tAmRstRNkHLPP
	WF7N/NFnQN/kWyzkCqSB7NdnZNG3kXFVVuRBmDq1g/+WCTCYtAoU84Z4B+0ObViT
	TqDcuCICdfovgNV6SNYgHsbDdMa2J4+M1AlYeWaosdqI9ry+ADzbHFs/nLCv+5xd
	6kdKvKs5tv9/eLFXKe+t5MUNXttGtmtlZ8WOJ+d5fqTOVQHm0Pfrfg7kkVZEgHJT
	rFEVEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3bfhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 17:01:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so154284201cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795798914; x=1796403714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=;
        b=UyqaHPyHSnpMFVcqs7UlU5wcl9tEimYql6f/+HTBMh5v9la90S+QCQ6WUD2RY5aTff
         RiMQLzFlBQDtjU5G6WMagWXKxKEjzeM0F46WD1IPhcTA68KGKrhLZrpq7NdMnBBc0GSq
         3A/8hC43xdy5bfhAQ2q3KpU3oGetGdypJAqKppyd7Va8bgUauAMgzalgRIu7keY2zljv
         ZdbvbcjRDRtjYRG02oHFWfWARzRTRCyJyrGIBdmcMN844lR445jsAnzX70q2cpQkw2LI
         YPbGlNVu46ATU4o9J4URo7UtkSroK+8d7yFPIHfZ83TDfY/4UR2idoR5rTZCr9oqU1mV
         kcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798914; x=1796403714;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=;
        b=duElfVfdGo+NrVofaZ9LQlgOU6ibyGMHJu3/ykW/YQ562cgQDBXXYV8X+Ao5K0Jfwh
         uh23pxjoIgZvmQTwVnwkj7uPouWuVv1TP9MBznMJ8NdwzNJdVw19mJxuhnSEBcDjbp2m
         06U5nsz9YJeOHUxG99svXMGC2Ds5iB1fmTmJE4AxC5wBKo2dAzVy/OdJtqALzSzTcCAX
         3tRg8VzoxXFEzqSQe9SsfOckBT/tKab1IwpU0bB2JUppTmG4hK6sMhS6/mDTM4Alr4Ob
         GI9ThFXmE6Dz3LsTNssFcdEe3OBE2HCuAeJdP5mIEIiXOs/ybjqrp9NWG4mga5+kDg3D
         nf5w==
X-Forwarded-Encrypted: i=1; AL+hErHR05nDhu2LVyJLBFps/k7UW79Souf6nre0+Hld/3osdqeE6EEjkPVqc1/UoQFa37TzZI4wQgu9I8mkIWO4@vger.kernel.org
X-Gm-Message-State: APuU4Z8pBNP9t4KzqDiRCZKP7CZo/NTsW2G5werH5EivGBrSq9bQktVV
	VHmGuE2oxSmokuIOCQ8jMBgkiAXbWyIDcmzz8OWsXdr2S0D2VeocjHNHSRRh2BtKZOWddOHM7xf
	SPMuARZwEXCJHlLEpUVCPNaVotBBP1u3Q/Kt0XgtM7ZLFvy2OJlzSjU3wtlH0rAaRXx1LIBRqi6
	yj
X-Gm-Gg: AZFdTZcBVkdenpDMRquuAz5Sf7Wnds1htAenDWP1ezq0C/FMTTNZROZiVmmAaj7BcBy
	EetInGBDzGMWaJ8P4T5//MxIiS0Nr3fNwJyena4XDfYw9g/1zAf6wXebBnsdEjSFyFc379FlDxS
	h9UBkXEk+bTfjQypCTX7AXm4EpvRbPCo3PyCxwEMAYT4pZX1MxDr9/Fei57n8a7n3U6RyDwVOHu
	JxX4oW4F5lII7yvVn/IpnVOpbEKAeSPFMDvI/fFcdNYmqPIv6O4hL3ahAMgsoL82x8fc6PNgEw+
	NjNTYRp+k36KneBdBJNvC02LU7vRxwszosEKTJKt5ynbzB91aPFHRPEucbyJ6Whh8aBtI1q/Zam
	DMdVqvUt7vOorIkdbPav3a80rJwNRfPDCWVoKLyu6iySmS6CO51lZ1DgcsXqzMqsO9sk429tZnM
	czwQ==
X-Received: by 2002:a05:622a:5c05:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55d76b336cemr474791631cf.68.1795798913247;
        Fri, 27 Nov 2026 09:01:53 -0800 (PST)
X-Received: by 2002:a05:6122:d91:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ee8aeb4a46mr15581542e0c.7.1795798890254;
        Fri, 27 Nov 2026 09:01:30 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm980228455e9.11.2026.11.27.09.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 09:01:29 -0800 (PST)
Message-ID: <1acf294a-1124-47ff-8591-eb58f2bb6900@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:01:28 +0000
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
Subject: Re: [PATCH v4 4/4] ASoC: qcom: x1e80100: Allow userspace WSA RX chmap
 override
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
 <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09b782 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6DQespTc9-vRJuCPugMA:9 a=KZtRBZcSfhoCt_Qu:21
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g8-JvcC490k7Q4wtQ1-iZzIJn9IRBC6T
X-Proofpoint-ORIG-GUID: g8-JvcC490k7Q4wtQ1-iZzIJn9IRBC6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NyBTYWx0ZWRfX0/mYW0TVrCeA
 ba+lVAhCNpxNrhuOEmBzDbmdPPnrFgHxsyd3sA6DTjgSy7NW24sTjW8F6YBh4+PY6K6NnmxlB5V
 F6p8NV6FKHKku9skaiu/G6zO5PABptjNL4J5qAZ1HABZtRCmCooEIOZqMWY86R85U4yLyArC4oJ
 iQMQO5DQ4mB3HO8kXFXZJ2p9AGHs6acC7DYsaGm3onQrNIxvrq55g1NYs7aoOd7N18Z9nkM61nZ
 lXo3hNDb1fpTM3DByQdQqZbiJUyFBZ1V20K/pVwNWr/I8zWKE9i1KU4kvRF5SYC2OW5KGvKA2gB
 8hxDMixYUr2uiz/6Vl7+hRHXGpGptFr12NRsJjLL97Gi62mO93SJ6NO9zoyE8uLxfrsAc3iqTQW
 WUx01pFMOCnCOt1/hAiXdI0DO42mtKAxSYMxMXu3YtHB+a+Vw5y/yjbatNTNEqvhGnRUNozbX5k
 6KGKTRNENDpvsXS0c4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NyBTYWx0ZWRfX51aO4xrWidf9
 E8e8h+yssXbQea4q08iuNxC7rSIgI18ha+yFdnXb+9sYvEaLUjuiKfOU/gQRGOy2p7CdwUj5foC
 VPqW0254+vz8Ckp3IEsTwnjzcsbBmD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270067

On 11/24/26 10:57 AM, Abel Vesa wrote:
> The WSA RX slot mapping is currently computed entirely from the channel
> count in .prepare() and pushed unconditionally via
> snd_soc_dai_set_channel_map(). Userspace has no way to express a
> different channel map, so any map defined in UCM is ignored.
> 
> Add writable "WSA Playback Channel Map" and "WSA2 Playback Channel Map"
> controls on the WSA RX backend PCMs, using the standard ALSA channel map
> TLV. Store the userspace-selected SNDRV_CHMAP_* map per WSA backend and
> translate it to Q6 PCM_CHANNEL_* slots at .prepare() time. Keep the
> previous default mapping unless the selected map describes exactly the
> prepared channel count, and reject maps with unset positions in the
> middle, so a wider map is never truncated for a narrower stream.
> 
> Until userspace selects a map, report the default one for the last
> prepared channel count, initially stereo. The map only takes effect at
> .prepare() time, so refuse writes while the backend is prepared, and
> snapshot the map under a lock so a concurrent write cannot tear it.
> 
> The controls are added from the card late_probe callback. The backend
> PCMs are only created after all DAI links are initialized, and adding
> controls from the stream startup callback would take controls_rwsem
> under dapm_mutex, deadlocking against DAPM mixer writes.
> 
> Allow up to six WSA channels for Glymur.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Hi Abel,

Thankyou for the patches,

I tried this on Glymur CRD. this is what am getting.


root@qemuarm64:~# amixer cget numid=150,iface=PCM,name='WSA Playback
Channel Map',device=16
numid=150,iface=PCM,name='WSA Playback Channel Map',device=16
  ; type=INTEGER,access=rw-v-R--,values=6,min=0,max=36,step=0
  : values=3,4,0,0,0,0
  | container
    | chmap-variable=MONO
    | chmap-variable=FL,FR
    | chmap-variable=FL,FR,RL,RR
    | chmap-variable=FL,FR,RL,RR,FC,LFE


However crd has 4 channels, for some reason the default channel map and
channel count is not getting applied to this mixer.



--srini

>  sound/soc/qcom/x1e80100.c | 246 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 222 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c927672eaede..4fe86ec062c4 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -5,6 +5,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/soundwire/sdw.h>
> +#include <linux/spinlock.h>
>  #include <sound/pcm.h>
>  #include <sound/jack.h>
>  #include <sound/soc.h>
> @@ -15,14 +16,151 @@
>  #include "qdsp6/q6dsp-common.h"
>  #include "sdw.h"
>  
> +#define X1E80100_WSA_MAX_CHANNELS	6
> +#define X1E80100_WSA_PORTS		2
> +
>  struct x1e80100_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack dp_jack[8];
>  	bool jack_setup;
> +	/* Protects the WSA channel map state below */
> +	spinlock_t wsa_chmap_lock;
> +	/* Userspace-selected SNDRV_CHMAP_* positions, 0 means unset */
> +	unsigned int wsa_chmap[X1E80100_WSA_PORTS][X1E80100_WSA_MAX_CHANNELS];
> +	/* Channel count of the last prepared stream */
> +	unsigned int wsa_channels[X1E80100_WSA_PORTS];
> +	bool wsa_prepared[X1E80100_WSA_PORTS];
>  };
>  
> +/* Default WSA RX channel maps, indexed by channel count */
> +static const unsigned int
> +x1e80100_wsa_default_chmap[X1E80100_WSA_MAX_CHANNELS + 1][X1E80100_WSA_MAX_CHANNELS] = {
> +	[1] = { SNDRV_CHMAP_MONO },
> +	[2] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR },
> +	[3] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_FC },
> +	[4] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RR },
> +	[6] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RL,
> +		SNDRV_CHMAP_RR, SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE },
> +};
> +
> +static int x1e80100_wsa_port_index(unsigned int dai_id)
> +{
> +	switch (dai_id) {
> +	case WSA_CODEC_DMA_RX_0:
> +		return 0;
> +	case WSA_CODEC_DMA_RX_1:
> +		return 1;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static struct x1e80100_snd_data *
> +x1e80100_wsa_chmap_kcontrol_data(struct snd_kcontrol *kcontrol, int *idx)
> +{
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	*idx = x1e80100_wsa_port_index(cpu_dai->id);
> +	if (*idx < 0)
> +		return NULL;
> +
> +	return snd_soc_card_get_drvdata(rtd->card);
> +}
> +
> +static int x1e80100_wsa_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct x1e80100_snd_data *data;
> +	const unsigned int *map;
> +	int i, idx;
> +
> +	data = x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
> +	if (!data)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&data->wsa_chmap_lock);
> +
> +	/* Report the default map until userspace selects one */
> +	map = data->wsa_chmap[idx];
> +	if (!map[0])
> +		map = x1e80100_wsa_default_chmap[data->wsa_channels[idx]];
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		ucontrol->value.integer.value[i] = map[i];
> +
> +	return 0;
> +}
> +
> +static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
> +	struct x1e80100_snd_data *data;
> +	bool changed = false;
> +	int i, idx;
> +
> +	data = x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
> +	if (!data)
> +		return -EINVAL;
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
> +		map[i] = ucontrol->value.integer.value[i];
> +
> +		if (map[i] && qcom_snd_chmap_to_q6(map[i]) < 0)
> +			return -EINVAL;
> +
> +		/* Unset positions are allowed only as a suffix of the map */
> +		if (map[i] && i && !map[i - 1])
> +			return -EINVAL;
> +	}
> +
> +	guard(spinlock)(&data->wsa_chmap_lock);
> +
> +	/* The map is applied on prepare; refuse updating prepared streams */
> +	if (data->wsa_prepared[idx])
> +		return -EBUSY;
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
> +		if (data->wsa_chmap[idx][i] != map[i]) {
> +			data->wsa_chmap[idx][i] = map[i];
> +			changed = true;
> +		}
> +	}
> +
> +	return changed ? 1 : 0;
> +}
> +
> +static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
> +				       const char *name)
> +{
> +	struct snd_pcm_chmap *info;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = snd_pcm_add_named_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +					   name, snd_pcm_std_chmaps,
> +					   X1E80100_WSA_MAX_CHANNELS, 0, &info);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The core registers a query-only control. Make it writable so that
> +	 * userspace (UCM) can select the WSA channel map. The card is not yet
> +	 * registered at this point, so the control is not visible to
> +	 * userspace while being modified.
> +	 */
> +	for (i = 0; i < info->kctl->count; i++)
> +		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
> +	info->kctl->get = x1e80100_wsa_chmap_ctl_get;
> +	info->kctl->put = x1e80100_wsa_chmap_ctl_put;
> +
> +	return 0;
> +}
> +
>  static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> @@ -109,29 +247,43 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  	return 0;
>  }
>  
> -static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
> +static int x1e80100_snd_build_wsa_slots(struct x1e80100_snd_data *data,
> +					unsigned int dai_id,
> +					unsigned int channels,
> +					unsigned int *rx_slot)
>  {
> -	switch (num) {
> -	case 1:
> -		ch_map[0] = PCM_CHANNEL_FC;
> -		break;
> -	case 2:
> -		ch_map[0] = PCM_CHANNEL_FL;
> -		ch_map[1] = PCM_CHANNEL_FR;
> -		break;
> -	case 3:
> -		ch_map[0] = PCM_CHANNEL_FL;
> -		ch_map[1] = PCM_CHANNEL_FR;
> -		ch_map[2] = PCM_CHANNEL_FC;
> -		break;
> -	case 4:
> -		ch_map[0] = PCM_CHANNEL_FL;
> -		ch_map[1] = PCM_CHANNEL_LB;
> -		ch_map[2] = PCM_CHANNEL_FR;
> -		ch_map[3] = PCM_CHANNEL_RB;
> -		break;
> -	default:
> +	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
> +	unsigned int i, set = 0;
> +	int idx;
> +
> +	idx = x1e80100_wsa_port_index(dai_id);
> +	if (idx < 0)
> +		return idx;
> +
> +	if (channels > X1E80100_WSA_MAX_CHANNELS ||
> +	    !x1e80100_wsa_default_chmap[channels][0])
>  		return -EINVAL;
> +
> +	scoped_guard(spinlock, &data->wsa_chmap_lock) {
> +		memcpy(map, data->wsa_chmap[idx], sizeof(map));
> +		data->wsa_channels[idx] = channels;
> +		data->wsa_prepared[idx] = true;
> +	}
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		if (map[i])
> +			set++;
> +
> +	/* Use the map only when it describes exactly this channel count */
> +	if (set != channels)
> +		memcpy(map, x1e80100_wsa_default_chmap[channels], sizeof(map));
> +
> +	for (i = 0; i < channels; i++) {
> +		int q6 = qcom_snd_chmap_to_q6(map[i]);
> +
> +		if (q6 < 0)
> +			return q6;
> +		rx_slot[i] = q6;
>  	}
>  
>  	return 0;
> @@ -143,13 +295,14 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	unsigned int channels = substream->runtime->channels;
> -	unsigned int rx_slot[4];
> +	unsigned int rx_slot[X1E80100_WSA_MAX_CHANNELS];
>  	int ret;
>  
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> -		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
> +		ret = x1e80100_snd_build_wsa_slots(data, cpu_dai->id,
> +						   channels, rx_slot);
>  		if (ret)
>  			return ret;
>  
> @@ -170,6 +323,12 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int idx = x1e80100_wsa_port_index(cpu_dai->id);
> +
> +	if (idx >= 0) {
> +		guard(spinlock)(&data->wsa_chmap_lock);
> +		data->wsa_prepared[idx] = false;
> +	}
>  
>  	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
>  }
> @@ -181,6 +340,40 @@ static const struct snd_soc_ops x1e80100_be_ops = {
>  	.prepare = x1e80100_snd_prepare,
>  };
>  
> +/*
> + * The WSA channel map controls are added here rather than in the DAI link
> + * init or startup callbacks: the backend PCMs are created only after all
> + * links are initialized, and adding controls from startup would take
> + * controls_rwsem under dapm_mutex, deadlocking against DAPM mixer writes.
> + */
> +static int x1e80100_late_probe(struct snd_soc_card *card)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +	int ret;
> +
> +	for_each_card_rtds(card, rtd) {
> +		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +		const char *name;
> +
> +		switch (cpu_dai->id) {
> +		case WSA_CODEC_DMA_RX_0:
> +			name = "WSA Playback Channel Map";
> +			break;
> +		case WSA_CODEC_DMA_RX_1:
> +			name = "WSA2 Playback Channel Map";
> +			break;
> +		default:
> +			continue;
> +		}
> +
> +		ret = x1e80100_add_wsa_chmap_ctls(rtd, name);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static void x1e80100_add_be_ops(struct snd_soc_card *card)
>  {
>  	struct snd_soc_dai_link *link;
> @@ -201,7 +394,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>  	struct snd_soc_card *card;
>  	struct x1e80100_snd_data *data;
>  	struct device *dev = &pdev->dev;
> -	int ret;
> +	int i, ret;
>  
>  	card = devm_kzalloc_obj(dev, *card);
>  	if (!card)
> @@ -211,6 +404,10 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	spin_lock_init(&data->wsa_chmap_lock);
> +	for (i = 0; i < X1E80100_WSA_PORTS; i++)
> +		data->wsa_channels[i] = 2;
> +
>  	card->owner = THIS_MODULE;
>  	card->dev = dev;
>  	dev_set_drvdata(dev, card);
> @@ -221,6 +418,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	card->driver_name = of_device_get_match_data(dev);
> +	card->late_probe = x1e80100_late_probe;
>  	x1e80100_add_be_ops(card);
>  
>  	return devm_snd_soc_register_card(dev, card);
> 

