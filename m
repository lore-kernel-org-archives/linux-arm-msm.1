Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56001489FC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858554; cv=none; b=dv6FF5+K2Lso/6WbJuNYN2uuJxQnglzJGTSEg3Tj+WdpTcZK9C83aXJATg7zSGFr1Nak1EgqtA49bFW980oNFRvNhlEDTLHoQG1yb0fpMf5WcCh4KkW/J2z2rUSs/BMaE4wZ4zcIfWORVR+RzUw0bHeeWdjSJBaFzkAuZZoj+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858554; c=relaxed/simple;
	bh=dEZPoLoQ8HBxu911Bu8NyaxQGEq0O36z9As/rzJxBw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7gS97E6zYYDR/CLxY4MVzhG1FaoUooj+UEAWx1rgf6RYUy6EOnasI/TR27vtEwKJRL3OKkpvtlluSo9xlf+SkV2fLMLdZ93TEXvBhz00W2HXHRjeQVqTjHVzal5l1F4Yx3j9vALXrsROrp4i/KhsUTFbr2kKbuDfSEoj42GWUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2Kkw3Jf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+2OB06W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2Kkw3Jf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+2OB06W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CKNBw2805837
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	319Mf953qFJrlwKysiqXPkJwGMfgmWFubiyg/ogyw5c=; b=W2Kkw3JfKQMFo8qa
	Y/rN5LQZhaFOwxa6uOZOHBFhqqyj0NTtG3hNs81+2XBLZMiAsinT4u61tnfAOh7t
	DTNjuk0m2JwE9JXYuA8ashMWCjsKgNdYCPDc1iwqduwTWa7MNclOYHrtWGGIR6+x
	ukdfphX1+lRMEYAD9sCfrpa0MJ4E5IKojXSrGftlv7MPAme27eyVwo4KDF1YbSLA
	5lC98GKG1UNpQnHeB28l3R43ksD48z6UiL3nb0ZuU5RnimTBq21P3aZT77VeMlmb
	fbZcDwxVs9IRmAmEoEUJKt+O4K2Y+iCPZHYHr5sNkRanRyw6tEul2fBYRa7FMKMt
	ARjWwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkhnu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:42:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so62741955ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858551; x=1791463351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=319Mf953qFJrlwKysiqXPkJwGMfgmWFubiyg/ogyw5c=;
        b=c+2OB06WfhtJmnAt1F26B0tGVHZAj7ihZQz5QGH0wQix32xsVtfvhG8z3bMSstsvhb
         mDDbKd3SlGbmcUJgIhX3CToFcoFIuMzU/wg6ODq89K76YKY15xW9RvxjfN2ioSvJQLo+
         f8wXpkSQFNaHa/v3rmpXsiR4g52mr82xFRim+ddsh9rm+BFfKu5ZoLEaIwCxlkowv2wu
         tCbSGDX7B2/GYr1Yiph/+CxxqBij9/J5OB/X6ZduKZlKD4yQsFAlvS2Mgtemw+T7KdDf
         8osqg/38bU2ffE4I2m3jhYudpU7kf3TWyRisndwT8fFZjuqIJkhA38BrCH4hQ1qByF7v
         ja4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858551; x=1791463351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=319Mf953qFJrlwKysiqXPkJwGMfgmWFubiyg/ogyw5c=;
        b=mhiCAvx2eozW5qulSncgAEcecbC/ZzAr5blTETZsRwMB3RjC21+XuFO9LsThAMZYr9
         fxcrIj2sY+Ojl868qdRj1WHb0cOStHYkH29SB6erqI/Lieq3pUjz367NbXZjdsltkTPM
         oJxyb3hTnIpwLh5kl6giskPUgZdrwP99UTo8XIJgLDq79nO5tuADsgtH2I8s4bBGkWrp
         BWkuXD2zKHiTTM4fjxUfsI/FkiUQjDB6O6nDzoBm4+Kr2NJIcGtvBtankTO3bP5KvefA
         0CBOSgSoUv6HAMvs3WaHDK/BWExBivAl68I6d8YaQM2M5UYMkGmfOw7HKrclY+nE1ERE
         aDRw==
X-Forwarded-Encrypted: i=1; AKwUvBw+Om0S6SDm62XVY+PQLzabXh7fejGDZ2PuWDJY0vbGASYbNSuM7rwfI7f9RaEAzhengY383pFkhlBStRF1@vger.kernel.org
X-Gm-Message-State: AFq9FYJWo+g0Vdb8vZ5bghd4yA6oZ6Wbo461UOaDuJEcfGHn9Kz81IdT
	Ss7eXdy5Fd1lawwOxRzzn0c7/JmG0vyYe0K8iO21jQjXExi+Z30KonnrPPp4pSMAkiHp1yDVNmy
	bwV2mBQcSvidrcKujGmupKab41lJc+7xHEToi2gZtrTJTV+EC2pIgkryz58QNqFljsRCX
X-Gm-Gg: AYBFou0Mz1E1hSyvxNVsEKSuc6cJhCnmVaFlmDrOKRT907sSuo3CXc5P4kMuPITGPZQ
	Jn1f5PJ/ZfgxCZ0cMoz0xr7QQk0vUvZqTCaQnrVbCEPYcfy1SXXa8/BiIDJtjNh1EsSLPnX+umD
	xDX2ru0fzw2MPNK2ZAQXYqYR2XXPK7j8/2CoB+v/LTMBxRCbcw2IHrGaQ0LiyhtByywV7CD29vX
	p7BtP/+FO6uHs0fA6dimAKZp1wr52YOfr8y+bG9so/JWlyDH2Y6zUXIDRC+To8/TLTzUvFNShyo
	yofB+g7PaA7oib17NY61NDRVQ3Tyg+0uMf4SNLPULKmvNgAuahceXezJH4lf7LOyoIUNoBhvix3
	NjuoxK+oGL7OmnFCQE4s0maWJ/WkjJFoi
X-Received: by 2002:a17:903:2349:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e2e4ba0b86mr36266345ad.59.1790858550586;
        Thu, 01 Oct 2026 05:42:30 -0700 (PDT)
X-Received: by 2002:a17:903:2349:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e2e4ba0b86mr36266145ad.59.1790858550088;
        Thu, 01 Oct 2026 05:42:30 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e3005844b8sm10215005ad.1.2026.10.01.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:42:29 -0700 (PDT)
Message-ID: <f4dd3bc9-9ffb-4d1b-a408-136d6d2b49ae@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:12:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
 <arKjhitHzi1rqKCV@sirena.co.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <arKjhitHzi1rqKCV@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX/0ciqcDzKteI
 LUl+IK1nTXHXN4UVBOPZCmEbPMXTHEVjiJyxUHeD/bOHammOxA2Le7blkZT5zFImzsU4L/ls2FB
 YDTfyRB3ihkO5YcdQmFp8/OZeReARTE=
X-Proofpoint-ORIG-GUID: 8d04oxHjYpOPbvyOD91b39cqVg7gJThJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3PrCrUMJ3phV
 avmbejtR6yftOV7b2rOnA6zZUTSSXiHBlqgw+gIVJWVGklIiqgi9hsr54BzdKvN8D/lwZt2TWze
 vEMeelmJQxTRj9kHVI5Y7qptmxDcCWNzvVM/7+dwlBsA/jLFUfJMntR1OGfSJ1Ehoxtf6YpuoVo
 RmXswuumF+MCDTA0Hk4GwET3eCHC/K+2NhjARIiz4lhYCBzuZQ3lbcKSdG1PLPT4+Qm5nuwYYKy
 VPUNVlO1xpd3lTAciEc3kl6GX750rHUb7Q7uaSi1Fbh4sWl2sTJJygdriZuAgTw1A+MLFcVYVTY
 YMWk0RIaKyq48tp6bsmIOlYFEg6iB0pD8z7qE6FdGrcruaF/vPMNOv1ymp23Dks+dko8UefwLw7
 9cUFfN27q5WZAVhz4ngKJNVEtf7yN3y9So/vFLyLl5FMxR9E23B0607oH3kZ/a+oAMp0hntFtti
 kEdAn0yh3WiVHKSSu/w==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe5537 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=jS2PUwK88M1Llq3_maYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8d04oxHjYpOPbvyOD91b39cqVg7gJThJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050


On 9/22/2026 9:19 PM, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 03:12:36PM +0530, Mohammad Rafi Shaik wrote:
>
>> +static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v15[] = {
>> +	SND_SOC_DAPM_MUX("TX DEC0 MUX", SND_SOC_NOPM, 0, 0, &tx_dec0_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC1 MUX", SND_SOC_NOPM, 0, 0, &tx_dec1_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC2 MUX", SND_SOC_NOPM, 0, 0, &tx_dec2_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC3 MUX", SND_SOC_NOPM, 0, 0, &tx_dec3_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC4 MUX", SND_SOC_NOPM, 0, 0, &tx_dec4_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC5 MUX", SND_SOC_NOPM, 0, 0, &tx_dec5_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC6 MUX", SND_SOC_NOPM, 0, 0, &tx_dec6_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC7 MUX", SND_SOC_NOPM, 0, 0, &tx_dec7_mux_v9_3),
> There are existing widgets of these names in the base widgets that are
> unconditionally registered so these should collide and get an -EBUSY
> during registration.  If you need something different for the newer
> devices you should move the base copy out of the shared table.

Hi Mark,

Thanks for pointing out this.

Yes, this is the duplicate-widget issue. I will fix it by moving the 
base DEC widgets out of the shared widget table and registering exactly 
one DEC widget table

per device version. Older devices use the default DEC widgets, while 
v15/Hawi selectsthe v15 DEC widgets through match data.

This avoids duplicate TX DECn MUX registration and preserves the 
v15-specific mux enum and DAPM events.

Thanks,
Prasad

