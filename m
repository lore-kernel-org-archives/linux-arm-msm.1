Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776674;
	b=p438X5X0DBfd2fgavXGTmx0ThbYl890O9KvnHGhihGSXqk1GZ3VsOZl9nkFsYtPWnpFg
	 yo6/PJyr7WFD3bVFHxYXprqUxzp8u0OTgh7KjK2gS0F+xUzPQ/jJB1Q5PwOjAKI9x1qvy
	 bkYCs3BN2nswAk9lowBFbqgUblSDZV6mKVkoBcE2lB5aMWt4tfgetyH1xKMAJwTZofFWv
	 MR5QNwm/G0WUkXkU9LCdBvenW2lkeVvjOEAJL+HmVY1nTcFRuKfkw0OV0DcpdvhDYv08r
	 7Fb7bRpy9bwT5QMkGLw5mQvN/epi6K8WTRROB2YfXZPB9JBY5xyA+eMKhB/2nXmGgxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
	b=nuJC0ke6/c1mL1Vf62PAd0/C9P8BDSqV7mgKC1X7X2dmhviHXut2EVNOa69rd+o8e77g
	 ZXu8B09x1K7JP1ljFy3FkIdgrTdZPVjktH/Gr0Vg/BAl5DJdJAEePrbcbNVqJFAKu6ODT
	 DLtInBRu0f62AWnLqUTGv2MisQZUKSJkPpKhcp2QmSEFGT7Di8XEfAKdvPOC9tjCXcrJx
	 o5px309qap6Iwser9gy6+b5dxSvK/Nq8E6KfUietwTdeXhg3tUYa8SX/Tz7zKjSVCdhFd
	 Mj3BPmGSgAg0a58T8daKBJtf9IJEMzUbPasMnAMjl0XBz1v1bJI1gfqa2ha/OKm7BVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oF/0+aqw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni7r6Y3S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4589F606A32F
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4589F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oF/0+aqw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni7r6Y3S
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQTOR4142973
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=; b=oF/0+aqwESMrHQKj
	1sdeu3kSMD22w1XiSlcthjvvll0gokTqAWQcduUSGxstXfrbk2ZG6iFfUbFOyjQ5
	aTKZS6S5OXZshv1BZ5J4zAic2u9Jh4sgnyJKIYDDlpOIbdQJzKgz+jG9DwC8Eann
	z5bjts8xnIiZi37qGDud9gLYe27NQTu1VpLkg1Ua1g4KqAOiYI1QCxgQ/Q/CCl2N
	w4KDO4LXhXvFFM76iN7aQ+GAGWHR28RPg5eXkEBJTT7Vmc9W4DQ+4isg9tAuFCCe
	Dr8UdlI7QApi5P9Gsx5ig5h8CYP0vPKtYja5HcCGUlUrN81DSNoleZkw3O1HzZ27
	4cSdPw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmakqje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so2064254137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776673; x=1795381473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=Ni7r6Y3SpAkfsCqPaKjQ1Dhny8x7aOgsUnMOquZg/CFlLsPFLsZ6mQcqytqv0k7NI+
         r42onz+vW2AmiuvVWxJEV73ui70p84kM50AVaKLlIbCo2w4vj5FI04klma7CEvFr8Luv
         QHtsO0HoCr/msaA+Of/pbJeNphtJ2+q1gAjfpNaH67BgwS2UNMsTWCU1FbsIbHlvChaS
         B4nfXURHrNitVoUqWEWG/nt4oUer7d0rDdYbxEOLWnbJOny662D0Jg0OlF3mhwit47lB
         omIBUd4/oaBHsAGHiWTgdIl0/acQ5hUlvfI5tS+3oHuGq+Dx5H/MKg7gO0cSDY81DXqa
         ldCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776673; x=1795381473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=yK1N0PBZSx7qVFnBTkxf6p/9uBPW/NWwki/ZdKK73ULgVFDbPPd83XCxoVkZ8yxBd3
         /ToyFkKFSc4bGEFHGTjHmQ7CBdP3Fi8Ed+mGB1biAmwBm5EGflJ1wlyqAjgyIBnOwSA/
         h381V05YFvIH7CjXgr+u5vXCUCN6SsNoOQQIRgOtZH3odjV9R+a74jxde71kMInTIaxv
         Ey4UHFGGilPMKlns3q/zfd321+1F0SiEXXLaLeB2NdkZHktzkbZh+UeY8JYVJjAelQkD
         mN5tC4zrJ7OEH985seQ3znPDaFTzzuWHV0rkdpwdnKg5ZZupdxA0Insr1vLVC7SXj54d
         e0Gw==
X-Forwarded-Encrypted: i=1; AL+hErGcCxYDHceEL4KRO97Dz1ykmK/7hFY6Z7z1niPs2I+CwivKEGgivXZsqTTXTQZAOpfOIIP24PnwyYfuvKdX@vger.kernel.org
X-Gm-Message-State: APuU4Z/IF7RgW1N/vuJX19/WPneyI67BEo7YFPOjo6IZKLS/OzatY7Af
	D7elI4vuyA43eZ1ie8UKt/0m2OFxkI1w9rwjMvls88xYB2mVpn9TrT9mfGQuJWYMwViyKe5ZIU2
	SwoCgMuIQRpIpM4aMgXLgKWyiSMUv74aEiQWo+0Abth58sEvOboO7aplzCUtXJqFU1LGi/k3ARU
	LrUHs=
X-Gm-Gg: AYBFou1d/aKFqZvY4hcnqKQ7nkLXIcRlfS/yLzdQvD8Sr4xCZWWzc+RZGQY1PkaXASy
	ggF7Q5fMk2tZbAqfzCc2O9WgcyIGCNn5VWnmw+6mPwOOxbzrVS528gqM95cwtaVgPTOEinVXCbl
	7abQqT5pTT0otqjwd67B69DmHTuiiJVe/exjXqOWtYJLSaDfMBFC09CdzzHU3lxoxDZbglC+ojY
	XCebF6zJX+ZNQM0ZxQOTlvEej4jZlyLaAJgp6lEcK86dhkt3G7S1s2Fqcw++Tq0nEOEJ6kgsIXT
	0g2qtdcX6hUu1F1wc6OH15paRHv7q/LksqWHdOp64mjWfZCNnzoojpsAkQNSl9igKvDqiDcLw5X
	k98rhfeP/lw1gPoiFhlA6kAIPNZVgRGgrNaVN+rRpabSNkdhhzl0aJUJWmgcCxSi/EFjgp7wp2S
	8p
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128298137.32.1794776672594;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128278137.32.1794776672148;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm231653655e9.15.2026.11.15.13.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:30 -0800 (PST)
Message-ID: <e0757b36-cbdc-4282-a30a-4e5f4866cbce@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:29 +0000
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
Subject: Re: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
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
 <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8HOv3mr8w38fFbEB2fFUys3cp5Fo9Jdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX5N9OsAShv0EU
 txuAPJtAP8ADRx2IDuaH9lTttWglaSAyMdn4N/AYlTqz/EPXlXkHhnDBQGb0mT5o1pyFOk8kliB
 7vrkmjFKQS7uxs4YWnETQmZoTxN53tAXN5JRO+8bRcn2FyXJoI6mkMMSH0bgzmxDDXkxqb7Zxy/
 GYAC7mHRNZv1r641QADRgsbVwrQ9qHg3Zdg3kDZS2OdTxe7zYyAPX0gJEV7C+NAwXYLd6MdvAlT
 y7Yirr/vQm1bwFQ/1UPDd1u45dmr309RrwQCNVNSrzDT0hZfcZNbfMfFE1VOQhMEQVIIbqUQQW2
 z/aItfGw3aDpEDWv5TZiRU1dUM1SMLONq6EZfwB9GPMWlG4LXQz45kR9XRGdhA2eG2BFuspZqIX
 mBCQQMEu2GYXDZQVEWS6SLCaR/LsEwj2RTdpPHBU/YQ+fDBr3qzbgQi2kjNc0mpyPo37FpOB0Ik
 GZ8k8gYCtYqME9eL7eA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa1e61 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=YIG-ia_FBqWyFDXOZ9oA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 8HOv3mr8w38fFbEB2fFUys3cp5Fo9Jdg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX8AeZOYVbrj/k
 6pPAW5yVctkg6UbjKmF8QJCAB1l5gbuQTo7gJNCqjW896v1meN6u1TWGNOiXViKNdfo+z6gqNjQ
 CpTYAvyKrGFEN6kQqmo5XyR12WTYR38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> A SoundWire BE link with multi_direction_codecs carries codec DAIs of
>> both directions, and each direction needs its own sdw_stream_runtime.
>>
>> Split startup, prepare, hw_free and shutdown into per-direction helpers
>> and run them for both directions on such links.
> 
>> +/*
>> + * Inline direction check that doesn't require snd_soc_dai_stream_valid
>> + * to be exported for module use.
>> + */
>> +static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
> 
> This looks a lot like snd_soc_stream_valid().

Agree, will fix that in v2.
> 
>> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
>> +				  int dir, const char *cpu_name)
>>  {
> 
>> -	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
>> +	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
> 
> Both directions will end up with the same name which won't help
> debugging.
will add "Playback" or "Capture" Suffix base don dir.

> 
>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>  {
> 
>> +
>> +			for_each_rtd_codec_dais(rtd, i, cd) {
>> +				if (!sdw_dai_has_dir(cd, substream->stream))
>> +					continue;
>> +				sr = snd_soc_dai_get_stream(cd, substream->stream);
>> +				if (!IS_ERR_OR_NULL(sr)) {
>> +					sdw_release_stream(sr);
> 
> sdw_find_dir_stream() (there's other copies).
Yep, will move to using the existing sdw_find_dir_stream()


> 

