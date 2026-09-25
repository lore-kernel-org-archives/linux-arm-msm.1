Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC54749F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324625; cv=none; b=uVn8dJm2RfPAqNdjpnk8dG0c65BAdCW0wxjj1pCGTbplAO8EZqrrwa9tFar0QVioFN9gbH/+mFv9nOrMQJgnQICe6aR2LYE1O8QYlSC4C1314qrCW/JDHResB6KLbk3QC2WaMnCxt1q6uLNc9F1+jZUbwQRk3hEIedn+98GRauo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324625; c=relaxed/simple;
	bh=PvHYSJt7cETPVzZoFjPPJ4GjtobWK7P5ajK4Vcj9hoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgJKPpsXvCcEy0RQdXs6/5vtccOXUUr0RI6AKhNjFJAfbLd/8bwhMEVcsUGOaVhqWsQL9u7RI1YPDM5mpRgH+m8UVat2OXYUYWdesJ/IAe34hJBQEocG31r+wc9KDv52L9Lxoz/bnVes77Qcuw+3r6yDYaLj1oniMqYbLHyG0+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFeuBWZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9NzBQar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFeuBWZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9NzBQar"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YUOF039586
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=; b=NFeuBWZHhED9Wue/
	Mh8WAV8yWiw3PVYHTNtIERJ2wd8Lowr4NfheTMuN6S/OAY2+ZAynrg27A1sCLbyd
	0whfifYnkzSUYyAQCClqcP3E3y9mTSs2azauxQTxU0Li0jnMZRcnBZGvG7CnvKzM
	NBIClM9Dgfpm695EyRj+LoyV0ffIucj7TkCFqjSBRClF7MCRP1tmv+NWv29vLPsq
	jjAGdyyjfRgiUGAUag7FbZGa9WU67Hdlkns6WTKQpMaLn1N4qjEO8DGqqM3rkCYT
	FyeyjXY58q0MpQlWjaZtxfPEETh9sOLLT9uQQjaijrIW9VNdo+4RfFDX4lME+4oD
	Qp0kCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4653vbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:23:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so135806985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324615; x=1790929415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=;
        b=G9NzBQarVDhttHoeKSDE8Bw8SWptZbIXP7Q+eaU2ToCr85U8L+kZ/x4DoruFpcoft1
         aqusko2G4S9Bd+T8G5thMUQxZsmqETw8dv67tn3PEjQBJf2KtKc58aKaBsa1vFYUa1dw
         kcldYrLKtlqy0t8VFvIf89NiSwD3+VHrH9rPIEI3+cnxbFwQiyrlKi8jSZi9PI0j+y/+
         rIQn3Dvbf5S0m5D18V0ItuqG037+LoVVjQY7dGRytmwo1pEc+2x9t+c/ikCjcXaZAJqg
         AEaTlm6AE8tAfhU9mC2ngdKu7iidoG3b+7tWAyORa5+tr3FrSmDAhS8pfSCp8MxiS6sJ
         XT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324615; x=1790929415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=;
        b=oAunW6NJPzdeZmftvTUijB5CyM24sBQCh7cj1GJnOy9yrqAwPsJRBU6x5OuqGaDDRt
         7RRgvxrsgSwItUFfK6jDjyycW92Q9fcYI8iu+IWcZ0T1KSUK0wySWPPhXzbl0B781upR
         F+ATtAhxDLmbuLvEo7T/B0B4ZjU+EHp0khs72V1v882tecCf/I/hpuD7eULxAMIVUDuP
         jjVayl/YR46KRgz4Aw2PQ3Pz2f+yokon92uLPl7qrvpC1fyqbc79bNg2HhUVvZIezrcH
         aOCkaYfXUjrTkhQ0cwDv3+spXiuRokDdV5WbqO/AeOG9d6lQCFnWkLxXUKx6SPLW/IPz
         iUZg==
X-Forwarded-Encrypted: i=1; AKwUvByliNP0G4MDeOIQ1Q/06SdUT4rlRpr+mR01x0nNXWD3KwrAEs9/NN7W6F8cioh04oRNaAlOKZNpoM9YWDvq@vger.kernel.org
X-Gm-Message-State: AFuF++ku1pFMFl2HDsaGYgCgPWOyxiO6YkU1YvAjTIuo1WGsa79mVeeo
	+ghCmQRIax9RYwN+xL/N+OfETa2wSUQ3J/51aUJV8Cg8LYOHH7gPSRBnEIrf6NkodOD8rm4c+Kg
	bfwPXc1cqZ89Lkiet3EpjksqfSW4F9GT0AS3/ccxfh83cWoznE817mK1HzPQXW6spSWNx
X-Gm-Gg: AYBFou1R9C5gsdcMVWsKgeTjj/tAqY6c/vfLuQbvfICnj762we1DNdB0kRdBdN6El4O
	z7EWOQ7I72W8rOvg0d085T6vo+FhSHVCCfo9uBApESVq6wQdJeXW3SN0eAKPgcDUlrpg5bpwj71
	nHDEQZUdvjXZqtcMJ9XE9I4m33q5UI1xO+VYKRnxrY3xT9XDaiViwpR9e2980Ou4CS4v/cZgOl0
	8D2pjs9cIpPN0Y82zI3mmW1fk2jkGPP2A++0ULHMxct2gV8BrmMj/CzLy3Nkl3rSr0AxtEUdB+D
	G8jjY6lkM2B3s7VKMzL5mOnooghJox0vslXEqoHcV0d93Je/007KXKytLEWn2OCMrTe1tM/k04m
	TnW7lZ9L+loClg7M37MJKcCBDYA==
X-Received: by 2002:a05:620a:2849:b0:93a:251c:5337 with SMTP id af79cd13be357-93c43b61aedmr295574485a.4.1790324614550;
        Fri, 25 Sep 2026 01:23:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93a:251c:5337 with SMTP id af79cd13be357-93c43b61aedmr295571185a.4.1790324613997;
        Fri, 25 Sep 2026 01:23:33 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc1034sm735531a12.15.2026.09.25.01.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:23:33 -0700 (PDT)
Message-ID: <39dc6ed0-d0af-4332-bd5f-498831a49511@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] ASoC: qcom: sdm845: Use per-speaker RX masks for
 TDM slot assignment
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab62f87 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ffX9cber_TX9B_cfV64A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: U2C3QmfvlO5iBqIsmPjFU2uAm5kFXWDE
X-Proofpoint-GUID: U2C3QmfvlO5iBqIsmPjFU2uAm5kFXWDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfXyo57r3xv8sQI
 I2EaXRrxXW7wMfQomqHHrofC3gOtQc2U0CEjWc+q1aef9A3d5b7YVLqUYVIjyGyD8IAm3xU27pl
 YtIbK4+LUn3CXQlPGwRIjdidqsgG2R47OoZinILsdeSmgbzJxeVRj4g3Ty7AMgsbQ8nFnSe1YIW
 e49mV8flUUPcTMdIhRj+dHh/frp+DxtB3HvSnSTEpHSNrrlN3orGkYz4qqTj4uUZNTI/MRqTJmS
 xKiqrCmNByf6wSxoklW2Twi8UgTjtSeFbPmvj6hZCVAFDHN/cH9I3KAhcTHZw21h+UL3gbEn2yu
 AKw/yjVjK2XbvSUbN24n8mYK1fB4ekVLBUjjC0nK2AEb1qfjO6QOxXe7u5/AnOJlRSvCa5eQG5V
 yKpjRRRzGFgg6FqRcpVDKYArM5s7ukFX2cRMzawrqvNGZhiSnJmYxA2j5qB/VSWj0Cg8umn+oBH
 QktAvMsh3qt5YF0vcaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX5NWJWZESin+h
 KKkD+pl3XEv99Sb5bhN4YQfRAj23jgGXo5Um3p3Q14czGrfTo2CM4SknVbqH4A5Vrkk8aWG2DeO
 j0uWdcV3AE3QOCpgEOKwLSOquUQe+hI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both Left and Right codec DAIs were passing the same SPK_TDM_RX_MASK,
> both speakers ended up on slot 0, breaking the one speaker in
> configuration such as on Pixel 3.
> 
> Split SPK_TDM_RX_MASK into per-speaker masks so that the Left codec
> gets slot 0 (rx_mask=0x01) and the Right codec gets slot 1
> (rx_mask=0x02).
> 
> This commit is here, so later CS35L36 receives correct slot for right
> and left speakers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index d1cc825fc5cdc..59cfa3b26cd4d 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -152,29 +152,29 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>  		}
>  	}
>  
>  	for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
>  			ret = snd_soc_dai_set_tdm_slot(
>  					codec_dai, LEFT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
>  					"DEV0 TDM slot err:%d\n", ret);
>  				return ret;
>  			}
>  		}
>  
>  		if (!strcmp(codec_dai->component->name_prefix, "Right")) {
>  			ret = snd_soc_dai_set_tdm_slot(
>  					codec_dai, RIGHT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
>  					"DEV1 TDM slot err:%d\n", ret);
>  				return ret;
>  			}
>  		}
>  	}
> 

