Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484264;
	b=ZPd1wVKhTPJAY7x2B+Do0iIdjyQKAPP1ZP4Fbzi9d1MUj7iRuE1Xg8WtpFh13M+vxLaT
	 szYuJxX/pswzCMAHkDCvngI+l9Qhoc9aGRMir9pv6AxY/S1/Q7Q+w1thB69cehCA0LQ5r
	 Z3cHSiFApY8Nf15NWC1PLngRCkpxphy9NBNEbEIDzAIj3qMywuxAeHYs53COWOuYPbZ0z
	 Da4ZvoHa4Ruy1kamxrCjwDk9/wHv1sIJtKf3cinuAchbU2+8J9UwQIKqJwLLHGJcb77B9
	 wVEddeVQQJQWiNnnvdNCKfjzE4U1K8aKJTOxZlb7HRyHdwMmY/CGW0LFTgF3jqLgYuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
	b=2A4LB2lMcdUa58uFNf85PbSVvuQ+rzaZxSa//gzrl9oQ2vXh+b2rlVaUx4XXu7dMmULA
	 nkuVOkFE/bOUZoY+f0+E2sxlrI7JrYlOntjP9RloHWg8lSGGGxwgkSyyyutGYcRpKhWhc
	 ulnsyuUaIIDjP0ef+Uu+cCF7Dz115ysWqU2glzx9qBWMA9VSDw2pVCcuTsbXWWX2PKiZ4
	 7YhrFESxVMO6lYoAifdmcjFA45sQGwxEPs8xlBZNOl6XW5Fj3MPrRYswTvHswG6srDPPy
	 2h4VtOGKkq7Mw8s3Fv2NBTcepWc7Ms9XPBiPiNhS/kknUc9NnH0cn11fKtcBdFcY7bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A4D606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A4D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBhPvX441999
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=; b=OlaWAyPQmxzF+Xys
	250SgtYy6aMFRtP5j1LHgvALDWsPYKUVXeW20Qr+su0AhQvDnkFNb+5slp9+HPjV
	aVrwn4BetA5ZLFO0jg8l2leJ6FyKquLHIu3ILvkkmMk7bhENPP5KYcfndOJJQgsm
	Jmbz91+3uGQSGQhNAVUfUWenSrL4aGD5r9NGcYTiUMdudWCGLXuu10VNODdQEYRA
	gmhJ62R6/qj5T8oQgn539euq181GrKrw8rHtu5fxN7iuPM7vg/tVQJLSutLvCTz8
	1VWNuh/HcATHzYugn30N7xGzkcmHG+Oqk2aoIlSVcscFNE/YFHDyDkZud1qeqc8Y
	3dnBhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc19u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9501034c4so63864405ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484262; x=1795089062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=fepBsLRRniJHdsT45aPOuXmbekNHk8qsvgvpZevKY5rpsMdw1kISwUlpHBkv84LPFF
         2a8FUMrAVNPF3ggvQu9UfgAfu+ZQb2cA1T3bosK7TiImUip9gQPgYm1l/bCO41VPI0fy
         lBurt/KIkUPyuiaN+syhejGu6h5pFlpZPjVTsFpthQUf97Y+U4Aq4SqpEPUUOJuU3PhV
         S94Nxmn7RCkTEOdXAJK6FB8FbN8wIzUR04aS4JRhafchAFdVE6iyN0enuPCnjJGCbuLo
         fBZd+7yxoQMO7ARzfwBxPJwdfDJgNqkaANzf+vf+o+qGifh/8pNH5jUAzyvfvEvhGEYl
         hm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484262; x=1795089062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=avmoQtqgJqALgz4bccMAaksA45lrlJJJNLKhm0D0buGz9hk0wsGqsxkUOHkRt9QpQ0
         o3sDDQd88SPggiKrYp/6931PW6BYxyPdtpdpJC1f6i27yRXUL7TEVFLg7/6EaVDJnfCq
         sFD4mSCMa3DFFeFjwSuN2CXjggKQ9M1O89tQEFa49mnEYsWEud1F7EoyQX/aKmPentVT
         xhWdm3u6NGwTmNGe+FNMy79tIbMIazrBBTVdcp659thqvU6Qm/iT6PvJ4dHruK0zecrH
         WSAchqdxA8m9qz8rK4uGi8xXaOPWMVdfZbDhybVZmaO7/0v9kgedvugw29zjAOxi8HkP
         28Fg==
X-Forwarded-Encrypted: i=1; AL+hErENaZncIc2BrY70GhfDxsbCEVXI9tzt3kt+XtJXDXfgmzSD/6n+s8wIOju0cgsS38mUthE7qY6k1zy2JY7V@vger.kernel.org
X-Gm-Message-State: APuU4Z8YWKaS1TRPSS3QY8uUtPE1U6TB1xAWYCDMmoUL9m0LWva2a+i2
	LqaemVppxenX2yQ3jdZu/WF5hHvi4nZSNZTZUVJ09S609wVMUMiLVTaDWGiT+WfUoIAuqndyRXv
	IDhPc/W4f2afg1d+6GFS6RR9cC+9MGrkSF6N5VHiZL1Ay4h7yTd3JAgQSj9uNfEkriF3Y
X-Gm-Gg: AYBFou3z9suPYgn+XF43MzTej+vn0uuZFojlX92CcWxVRbj8USklw5QxT1atz9oP+kO
	sLzKJxG+MAiW61w6jR2Sjd/AMwutx2g9g6Umdwk4EYv7ZlHWRKZCwrM6XvyRLP5IyrSlYUAqmog
	3N0ybs8Y5ZnlA3Lbn/Nuq/Iuvipa22LUTtR6bWpMNfMrlvHhM6nwVkD/G4YjSYgLTA3sSmc8xlw
	n+QtmU49xeUHqEaUv7gq2fBiCq9z3u7ZUh+olKU8kIXXLErB2/U5y0U7OJJhdeRtg0boPLZtei0
	6NanTMLlPep39q6/qMdw3BOrNs4OYvXdYdipb3wPFqhjvS/wP0Ns+lAoFA5seMMOIIA1+j/ON4h
	SZkJYnzMv45c4/APUoFJaPu4GKTtShnW44Fw+xoDY4IbLlV57YlPEZ2HyCCEbFdVrrU1il2q16t
	ppI0ok7k0=
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971735ad.43.1794484262451;
        Thu, 12 Nov 2026 03:51:02 -0800 (PST)
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971575ad.43.1794484261955;
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Received: from [192.168.0.111] ([124.123.194.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm33309415ad.9.2026.11.12.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Message-ID: <6b02b6d1-1bed-4304-b11a-bf2bd3e8f852@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:20:55 +0530
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
Subject: Re: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
 <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: blRw8C-0M6j-a4TqXzSGzFUrgyTNMyis
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX63aJ62ar4hIZ
 FkV4vCJq5nTIeAUyxZiYMvQHT4jMd3xO3gH9kweJqosV98kkhw1ybfmEtwQxlTM89rXyb+m7yZE
 bPqJ3PpJSMh02M3Jf2HW4XvL00OgtQ8=
X-Proofpoint-GUID: blRw8C-0M6j-a4TqXzSGzFUrgyTNMyis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXzVRB5Ly/Hkh2
 E0/EveZrKNKSt08yXER7DNxmOnnjFSB5l/XqIF2KM0dfxSiuKeh53mZJ2K5PEwyY4QCRAsD8iHX
 WwrUAJgr1SUMv59zQQlRHZRP+p3b0rTbq2nZnmBgkkpbkEPG0LJ2lZxrgawIDIDCq70HMtkefCV
 FBbyuODPGk4Ql9IBm2KO355fHjzqn1OAK2rnUIeTofRXpn0T5gL2HdOwW0TRLCrjF69/F9AW4BI
 4brF4DVf3z1Gq3sXseavAkdbhmOLb+DoFybPx9y0uvDTFMpMqf2lKHK0iN8rYcUT7q7ZsEfwiig
 Fp75Dr+iYJ//1YtyvgBOSQnz0EEIHLjjd8dAGeHtL8GUvtDUZgOiH/lcU1rcRGb/Z/vCOSRl2xr
 HYwUIK4GudrxTNw6sZ/SLl9NZZbKfZBOeahh3FC02sYXE4Z3KTxa2AGKvvOTigzOnUhR4GisI+D
 1cfnJrYJQAwmtuHqU1w==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5a827 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=H4FFYLkF8j2uoF0yKy44mg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1p-7M3_SpvjJ0s4hP8UA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047


On 11/9/2026 8:32 PM, Srinivas Kandagatla wrote:
>
> On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
>> version = LPASS_CODEC_VERSION_4_1; break; @@ -2175,6 +2178,7 @@ static
>> const struct of_device_id va_macro_dt_match[] = { { .compatible =
>> "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data }, { .compatible =
>> "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data }, { .compatible =
>> "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data }, + { .compatible
>> = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data }, { .compatible =
> Why do you need this change if hawi is compatible with sm8550?

Thanks Srini for the comments. Although Hawi can reuse the SM8550 VA match data, its DT clock interface differs (|lpr| instead of|macro|, plus|heartbeatpulse|).
Hence, Hawi uses a standalone compatible and needs this match entry.

Thanks,
Prasad


>
> --srini
>> "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data }, { .compatible
>> = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data }, {}
>> -- 
