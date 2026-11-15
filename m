Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776630;
	b=4oZQoDVNi1A28xgVbl9dCGGjHVC90v+kBswfrxcb66WY1AGhpGk/W75fxXwXS5k+WyA6
	 kFbRIc4ZYGvTnKL+SmssMGMOY+3jcQCUrtq4dRtcMBXpm9Gq6oG+hncanorq/wx/ZvkoL
	 iqeF/50wbtnObVXdkFxj06Wi4IGIlo6vyDHjMocd1cqKNveJuqzRetM/Vs2S97+D+I8R+
	 toAGoKMkeuM3RAWoOh/VGLD1ltaOkT+b71uZecHc0ATllga9h7vhqXZcBN+01kdcBqEOZ
	 fgpOSiIvPDfu2SKi0itdBd4BDZf5fwhdgrPwelQhQJcbYKOtxCyQDsu/6Wqd4PJyw7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
	b=DomcsOZmaOC6j9S24JOVzHmnc0zfW8NtuWb2VRHoITgAI3O12TMBgqaEwAVP+9betho0
	 CJmuDvcgtPeTeQb612khV1CoWs5Hz+2EmNp3d+K/YA6ZNz/9fTmMxVEi21HlNFSs4YhS4
	 VkrnI1b0jvVXE2zdMcGrs+6pFjnlPtFoox7CocSBJrp+z+Xcql1nJDdW5wGMXFbhri7gl
	 ftnndKcgyHksfcbMR4xwQ/ft9CMMOP5sdEkSlZwh63uoUhR6tw3Q+5SdoNRckrs3AcIM2
	 DYw4FkCocbgYPX/9GqBrnmBpVE24JKXT/oYSnn3E9HIngA0MeBDQsf4kIkSYmh18jOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mp3k+Rue;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAC8606A33A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AAC8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mp3k+Rue
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRUhx865492
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=; b=agbTALtSR3gbxxEc
	VRvNU4DCIKPvGpMO7CugpH6Uadyx5npRYj8FJv9vBKO3NQTl5CvPYcXjWOUWbMtn
	Axq//AERbURr5exipw8deW1dUK01/D42GkdVxJS2Nkny28LtZ/iUX2aGPbBe8bh5
	Qc3z7A61AmHeExvu24i9LhT76E3P2XSEn7fvlGqNphWMFnSJlJZxR1bOa3ueo5/y
	mqaBgVCB1XM+jyxY8d+ZCvsX3uMQjKQc5aUlSUqnfXdYbQORz4AhR4vDn633F8v1
	Di9+nyS3qXAOiDfm+1q+7TEhvVQfqqp/xC1mQCkjYzV3PxH0izjh5Fwp2peOwvuK
	/ZmTEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8unv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:03:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so301062885a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 13:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776629; x=1795381429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=Mp3k+RueacFxfYr0J5TnocLNhEI8YMeDL5PzYaTbqDYQAK29/Q1DoNj2vfRamPHjii
         wrr2FB1msUSst6BUCcTvwPNJz9evjG6NIhf4/6+wXyQB1M21kQ5xi8efd36zhOwFzVa2
         YRy9LKyRl2LLRGOH2XJKtVuICy+n4Y3cZRF58glBoAOdmP1AVa8T5JiF1TqaQISHTl+U
         Jm4CQcNysqSrhzCJcRHH4RvrMtAVen4mFEHxGDmin3IT6KuH392ABm/JEJRWx2QrCqUs
         en/f3RHmaLir+TGQ/YoDExqLJoCSHrj9BJmBmgtmfGmla7MZ1bM0N8CEl7D5bFym+qs5
         6Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776629; x=1795381429;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=yEPG5fFRVVlQpshuV99eO8RFAiS61h3RJQruprubFKblK9zkkYf6n/yYHyFb6Soa+Y
         bnshSDRDTMRdiF+oQqwhOrUngsBiQGJN9lqw8IESpBbRrjur3ugPtYv49iKyGYGy5i3N
         tDJajeAJX7gsZ6bQJ35Zx2/L1qX0W3ygfoDYE05fahouMhrD6oc0Q3+8k3QKpkbueede
         E6rJskbBBBW5M3mSgWJJmISxshOSORvA+rmCTYotAq33iF2nEd7fXZbMgv4cIh/vZ2V2
         MPHVm876mFN/wILwlZg1JxceqbaZKGMjTLflP/UYTrWb9m1Ln9IpbOJm9IjCTzB9eIv2
         07Xw==
X-Forwarded-Encrypted: i=1; AL+hErG7YzLrsNYjVk1NioegPc39RpAzLV2S4TgJXkFJGqG0nctLV12JE1QwYK73TfhQN7Q0LqRS7dqMyIF32T9F@vger.kernel.org
X-Gm-Message-State: APuU4Z+ibnoIG7W0rkdglys0PE/N5YXRsfgDfPRVUY5Lg8t0Pz0rdmQt
	GJbubLaL7HZZB7HamHvG8JYge/CXJgZY2p1KrRailEkWPXV3Qds1sACYtUT9Pk5NioReuhMbgQg
	efDLFcfcR7AGbsI96Yerq5B27HPbjx5W5gF88EjpK1hwOjkikVFnMN+cK7W6NHQ62zkTfWF0vXR
	r/YQ4=
X-Gm-Gg: AYBFou1298iDn2HVpdQy08/0CU7yFJ3K+w2VqeoUVtKb/guemRiawUtcwbMjhzP1NcB
	zMaA8xqHDGHOAT8s2hrdRicnpsIF7l7102eDLmFSi4Fz09F2hgyD5qzvVczU/hVqAIPY+IoXcwc
	jptYd/VHAZR0y88ye6hwr+lOmYWDE81kzayW7gKBPwDRs40AIlIOgCAT58vqfMdxUBtSArbZN+v
	DaKcBbw1ULWxXnMZCwm+NRWShYHot7Fk9UvvJYCZej0RfhjNhb4CRpqUf3VAAHcWLC8593O666e
	hq7E/3W43Qxah3TNqLgkrYh7zGIQtX9fTqBnrKA5ctjSWw9/vCHG4x+eV/s/zelHaDceA4fgoTg
	GTMcZQ4kMZd6Gc57OCD06cVf6qrkJpBlfx+W0LvNf3oSV/nSWtjX7BOaUgi+FSJHurhZz26pkMx
	CF
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733614985a.1.1794776628047;
        Sun, 15 Nov 2026 13:03:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733611885a.1.1794776627637;
        Sun, 15 Nov 2026 13:03:47 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm18917479f8f.6.2026.11.15.13.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:46 -0800 (PST)
Message-ID: <ea0f1a60-b2d4-4d3a-a7a0-767f4132f8be@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:45 +0000
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
Subject: Re: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on
 the WSA Playback BE link
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
 <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
 <179476416983.140154.148298781294201106.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416983.140154.148298781294201106.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa1e35 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=eRThcyuUgiMSaGfv38QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXwQEGDkbpxz2o
 2mi8ctQ4oQGB57Cr26Ti95ltZUyYpaLQL7YvU7UqJeTBXfmoffpAoMS07pHXsSdcJdTlNgaoEOB
 Npf1ksf8YJeB67TEq2FUFsatk8Wg8fU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX6UEkuNSXgFPZ
 kmtzz/po76jH9n/TTme13DV/NGLN+TMZCfyyAs2dpzqZdmBJ3x8+p49ou5t+Zix1duPTNaW4NUd
 u7KDcQNbb4B09sB50yp2Gxrw78wBObsG8BNjy0bPB14/um9gC24SNLDKzgJYhG0ERkIW7ZOIZcd
 uf99bPPp3+7mM4iFK9HnHooND9G0pgAPBHph4K4cTWesc1DZ42K7PUnEZf9m3JQrqCOsuk9khHi
 MF6kGzAsHiDL1Ikm33J3C429CaF+oo81rKb8jWkhpB7UT23fQe6xMcuuhO839qGGLJ0T5xJgTA6
 Uq0mjMRzHONRPMFc+PSrQlK3h1A8+MVPjWFISJoMZpEZh9eTAF9bulwj8nFLQttAxechK2Zwodh
 koRWLjrhI4mgVNWYuFUCF7Ra+8S74mHy4P4tuIVXSVelyLUaMu+q3QsG15EhxHHFEqDDnOhryNC
 U3OAZ4V+ahWlr3hz/VA==
X-Proofpoint-ORIG-GUID: _0Sba6Ss7f8bu71nHAHG2F_gK1JC09N_
X-Proofpoint-GUID: _0Sba6Ss7f8bu71nHAHG2F_gK1JC09N_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the WSA V/I sense capture running whenever the
>> speakers play.
>>
>> Set multi_direction_codecs on the WSA Playback link so it can carry the
>> VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
>> core's capture stream events for such links power the VI widgets.
>> Nothing changes until the DT adds the VI DAIs to the link.
> 
>> +/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
>> +static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
>> +					struct snd_pcm_hw_params *params,
>> +					int stream)
>> +{
>> +	struct snd_interval *rate =
>> +		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
>> +	struct snd_mask *fmt =
>> +		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>> +
>> +	if (stream != SNDRV_PCM_STREAM_CAPTURE)
>> +		return 0;
>> +
>> +	rate->min = rate->max = 8000;
>> +	snd_mask_none(fmt);
>> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
>> +	return 0;
>> +}
> 
> Shouldn't this also limit channels so we don't get something wider from
> playback?
vi has min max of 2 channels, so its fixed in v2.

--srini
> 

