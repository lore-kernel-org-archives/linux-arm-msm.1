Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776654;
	b=NGd5HNfF+wpIEjRLguxFfmuE4nIMqBxNGheAayPxr855yF6tDDj6tAmCcKWe6nmQL3Ef
	 2k3t/G0jWIpq3vkYCyJxYHQyg4qHspbcBl4JCbhFICNAOxKiUiV7soz9K4oRYW6UKGUsR
	 otNjmrE4X64NsapxmuBJTxby+yCX6iAEA+tIFvy0JDypGHGlyofX4Ol7p/NwyH2fPE7wr
	 GiitvDVVmfs/vNM8pN6AI8AZkEWgCow2y/viCDogb3Qln66SrepLLR6/BtaiFVX+qFLLy
	 T2Y3q9eIm3XfApPw7Xs8fZOJZsxTSaQLPJBBdTXsupp26RZ5EnoTPDkawBuUW2lH3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
	b=mNqETFmDzSjr4LlA93E5OyRkH1f+HxNqhDpwivz91bj93YbAJCuVQG3m15G1LhkzOOak
	 9TiOV3MTxr4EsVHg5SuKKGkYtz9+lfFxje7HoqH93s3IzMImx2A7ysCVsKiwslx0caBpl
	 Ox+3sWAsEKB/aiUZ0j0zPB0VdNLfX+q91yBWPU9I+K8yFV0SVL5Sg4+zYUfyD+7HuQNVb
	 jG57AlV+F5xzJFI/Hil52Hyrvi6oSGn115rtRqhCVZmVa1KGNVi50t6k3G0YV6OTKIpcb
	 crq+hfyeucHMTUoUkjUGKlmRWI4vV0RpqLsIl9sdMD9fxYe0qlTat9tZUiYLkf/7piw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hq0OX5fv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2E606A333
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B2E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hq0OX5fv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRNBt3620118
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=; b=hXhbcREU6EwFVDDB
	Ac8Vq/qFfizpEk/cik4MmxFQpCXugF+GlgkILLWppwGilyRz8fnK3e++71wVN7Zq
	pPnPwFjle7rgE9KBYeE3NWGOtNccZhbYTL8qP4hq09PCSQGupbcRDLF1HUeqIDA9
	xbblNuUZOCKEv3ciOHVFa2fwZKaU5Spa6NBHGecpSv6IO2QKJFuIgX4RICwmcDa5
	79GwDYzfn2kz2k6sNBOXSFQfyMaSaylcIopDsNYIS2iKIwqJsyUBzMq6FgqmpUY/
	Ce0xE1QeiZ81fcTIL/ZDAHTX7vZyfCjcYxDLjOCU5iRq2QvofjZMFXKkOsNp86Sk
	sJd9dw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqkts0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so492982241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776653; x=1795381453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=Hq0OX5fvtW6YOVVrPNnBoqLfDR5IFYiMF7tY4cCinENV/R3Iy5P3ckgWhcNdhMr3aY
         ItaR/ScXNjFatSPGTVWDwM+kAEhDCKCOgaA2Ph3KgtgHBXBtHLH6i8eONX2u7hdJHyfh
         2iVLY79ETtLoX7Kv027a5UpIPCqJlOi7wF+7O3ShQ+Uf2qWdBxRDoQHpNiiUVhQwnTjP
         tSOKaxFrmzAt1i9ub/X56E6iSCFBG7vv0nyD0uBugkx3Qs9XyQ1eLREgcac9+d6dbikI
         e0s5PfT4A/ET9cNgIIDxcmbTo1n8hUUfJRItOzI7Oo+JKJ7T8wicDqA/T5FJp8kC543I
         J2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776653; x=1795381453;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=V7jQKy7YALXHeuwml1XICUQ+pXlNUKk0sx8QZ+WNMovdEAmfxtMSQsNT1SUPM0XwIS
         3Yk9XQMlzj3D42DO9GWCrAo9n8v0J0XiZ0jh0wtIyXH+FrIrln+DY8PLUZtVxn/ZrQqO
         PzbEOTXtiDYMca0DCQJw6DRvZKLQsl6BMT2BiY3aYSohca9O9iIQ3CyQneiA9V9AxoSt
         M3BoeM55UeoUPw2birIGqUnsO+ZxI2F/C1ONA2krjbhwhg+5izU0dNvCrUQe31Cjx/xV
         kx0HPvSWCVbbuCmqn9HT2jWOmUnmcoRkrd3PKOxhwl2whFnbSF11CoP6oXycK8T8Fqih
         ArVg==
X-Forwarded-Encrypted: i=1; AL+hErGxAMliiEoHWeFHk3cxZlh5rUpMvOem3LuMQDDYL3Qq4CdW5JjXhjwu8eO7okiC/M9L3msLUQ9ror9blB+h@vger.kernel.org
X-Gm-Message-State: APuU4Z8LKBl7YZNAFDYREwl7mMAzyFA3FwYUB+ihyrnLIdfSAsgrJXAa
	jE2S3K1IoHbey0wKeZFcrK5HUVwVFR2t9Tl4ESxvwtU9XZKLHs0L2B8dvmWSBuaocj1CUVT5/Zg
	HLdveFOOs5AAQxfbOznqxQ5nso/720dWNbzsRCbzGQuAfqX0pGshBxegq0jOBLGM3HZTs
X-Gm-Gg: AYBFou3OZ72tjBurR4C/8rtjhWCvTg2TnBNKlUhfl9k6T7UulhIzk3kFV72JLQDFHIy
	+ZL1St5o2BVwWk/BV9WCS1BVbW3Biyq2er7nGqSlsYN5HSn3M6Q+HJSabbEvORMmIDISGC9T5fO
	Y1NBFzgxd0o2ZMiAdb2MOQ328odyfgWOFAwZzDBBqNfSc6Zc5CBhQEhL2TOZU8p2k1WishSLovQ
	rKMb3HHtRcT0bUnS3Ekc0a1Q2obxCEF9WqCr9hbupa4R8RrfdCf88xGvbwWTiCDjiPgfV3rSNQl
	Czday1xDgM7+4SzURwmaz+bL9NFn1iP2Rs39ToMsc7JDxogrDIEW0381Tr7qkhf9Q9GCKD9T7US
	gdLthkK7H9dDX1nf2vNas6gi0bgI27EGwGbJzYTINLIalhbPH5HQMBCQJoDvoZ2SGZ3q2a+Xde9
	uj
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883010137.34.1794776652399;
        Sun, 15 Nov 2026 13:04:12 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883004137.34.1794776651917;
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Message-ID: <85e400f9-eb56-4d8e-b791-ad00cbbdaea5@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:10 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 02/23] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O4PVk-NymBctV_frgojJwLtYEefFzEfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX9fBd3Ub1zL9K
 kvx32MRjb5Yl6uKoDg5bdtUQaPLTIThdt+YIGy+h0tfLLHgiIhSpubV2HJQfywbDRhG9hMEjXAP
 RqEUiu6B5Yb5vIYJMCkEab2PAk9QjZhH2NFOIJqGVS7pVw3yz0c914eBvjltawx2pX+gvdwCigG
 XZbIYGsK/EpzjS1KeIRCiPqsh53PNOGLZzVXKyrUY6Axzzr/+XxsGuPN91auXZYo0bZwH+sBTtg
 gJE6vaQn8W5c2YeBkLOb+UDICytRtVuyrognzr9/0ARX/57T9cugM2+lEIL+9JFirN3/GNLHQ0M
 atcp68rs9s7ma/08j5NvIi1L3fMsBKvyWYWyXBQhbboaZYjFROOKtmmAIqDXCKv1z8Yw+DBMMOA
 I3wMJjT8xLaMxsYuyurJiVOj1+uNpMSiRB/XlLpG5YWVoScStJthk/1e/JBtQ8XRJ89qWvqBu4n
 IOOp513INdTlTh9kCGg==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6afa1e4d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=xKiGHf8qJV6DUAaYMh8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: O4PVk-NymBctV_frgojJwLtYEefFzEfk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX99bo3Gp74QJ9
 A2zEAg5SUMwCTcTyFCG/rFoMxintJoWnkf1wEFmniXGwQ84J2RjHCpuy2D9iQ23MUWU/dAjlSOg
 IIqJnDElAVeYD+VoPQLVWKFmjbdaKNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the amplifiers' V/I sense capture running
>> whenever the speakers play. Putting the capture codec DAIs on the
>> playback BE link ties the two together, but the core skips codec DAIs
>> whose direction does not match the substream.
> 
>> Add a multi_direction_codecs link flag. When set, the core also calls
>> .hw_params and .hw_free on codec DAIs of the other direction, with the
>> substream direction switched to theirs for the call under pcm_mutex,
>> and sends the matching stream events so their widgets power up and
>> down. An optional multi_direction_params_fixup callback lets the
>> machine driver set the parameters for those DAIs. Links without the
>> flag are unchanged.
> 
>> +3. Optionally calls ``.multi_direction_params_fixup`` so the machine
>> +   driver can rewrite rate/format/channels on a per-codec copy of the
> 
> Probably worth mentioning the ordering with regard to other fixups.
> 
>> @@ -986,6 +986,9 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
>>  
>>  	snd_soc_dapm_stream_event(rtd, substream->stream,
>>  			SND_SOC_DAPM_STREAM_START);
>> +	if (rtd->dai_link->multi_direction_codecs)
>> +		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
>> +				SND_SOC_DAPM_STREAM_START);
> 
> This will update every DAI, including CPU DAIs.  That will mean that a
> CPU DAI could be flagged as actively capturing due to playback or vice
> versa.

Correct, we should limit this to codec dais, will fix that in v2.

> 
>> +static int soc_pcm_dai_hw_params_at_stream(struct snd_soc_dai *dai,
>> +					   struct snd_pcm_substream *substream,
>> +					   struct snd_pcm_hw_params *params,
>> +					   int stream)
>> +{
>> +	int saved_stream = substream->stream;
>> +	int ret;
>> +
>> +	if (stream == saved_stream)
>> +		return snd_soc_dai_hw_params(dai, substream, params);
>> +
>> +	substream->stream = stream;
>> +	ret = snd_soc_dai_hw_params(dai, substream, params);
> 
> We flipped stream but nothing else, if hw_params checks things in the
> substream->runtime things will get confused.  Usually everything is just
> checking params though.


I think the documentation should capture this and the codec dai that is
supports multi-directional should be ready to handle this.

I will add a comment about this both here and Documentation.

> 
>> @@ -1061,9 +1117,20 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>>  	snd_soc_pcm_component_hw_free(substream, rollback);
>>  
>>  	/* now free hw params for the DAIs  */
>> -	for_each_rtd_dais(rtd, i, dai)
>> -		if (snd_soc_dai_stream_valid(dai, substream->stream))
>> -			snd_soc_dai_hw_free(dai, substream, rollback);
>> +	for_each_rtd_dais(rtd, i, dai) {
> 
> This has flipping that __soc_pcm_hw_params() doesn't unless I'm
> something?

Yes, this needs to be split like what we do for hw_params, splitting
both cpu and codec dais. Will fix in v2.

--srini

> 

