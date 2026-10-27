Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084391;
	b=B8WRoF7Ant+r6pJd+VJNqLNMOzr5/2m1SWnSES1ypIH31NvSHSCgm3y5fmTt3Dm+YctN
	 5QsLAwfFODZDOaWrldPwv1JpAph273knTkrcTobwRXMTtYoMnmTIlOXjE0ExMF5DtXLm0
	 /Z6OWnfzDKnPwHKoCc3cRrEA4Xf/sQsrI1LMGWWKuH4WmN75o6+dhvvax1KguBruPbKvA
	 fhrDLkXTdgsJdXZYDbh1Bxz2IF4ar4LV8jtVcj71ZvjmINTc6WLlkR9Q/bxIh7YOsVnzs
	 Mj3f66wq0I3/uJT0DhEylYRrSwXqKM8k8352zyHYh8XifbblPEztdAz2brsUHtxFCEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
	b=Ict43rQJWcNiuhYoZSI1/bIhjT83KisI/zZvbEUPzHKQwVxU7Xgq5SvIlJMyHpa+ZfrW
	 GtGu/MECKezJDh57+MWYq8qULqCbZdk2B8dsx6etAEixx+XSJhk75gAQFxGUlQnJSL8Za
	 D7GF0kCjCBaVmutTY2OSpxGI6cJqYtZVDsVq7JeA4uPjy4db+xj2cpxXBCBrmunK8wU7M
	 dp22BY4iX5gm/AHDrMUZPFChugjWQ58uf01LnGwqRYCroFLCM0kSWAwlyIGiJKtHOqgnz
	 2cPkp9xAMTRVE8t6ULQOtd1VjrG5ZlmU00oVK4jsCnchIt+9oWjP7sQ3FCYiu1+OOYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAVRLh4P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4FzZZbs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD89606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD89606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAVRLh4P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4FzZZbs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJRN3950123
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=; b=DAVRLh4PXOFgsY5n
	NOwS1p564NkTFUyqLClL/gsUJR9wNX5qnJvEAmMt/meuWDxin3W026bwuMSDlGhi
	DEYsNqPGlP4l+RtFRwlBt0s6Qa1zjvo6TOkLIZoI9chXqrOg0breRflgS8vHRRbX
	IhssrvHg+ZcjAVcWw6fMnB+zThniQpDauTyBiYFCqg+PHGVjZV2m/B8OXFtwaeP1
	i/dhAWkpoOaJ5YGykdTdAOWwY9onmx5ByNRJapV/HCIRBRKDonJkyHf7fasLii8s
	4I7CHxuXfMPvQak69CmPD57UZpxpu0ldWgHGkvX4pa7Ki/xAQaH+mjDxp85hGiMT
	9UtFXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jh35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:59:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so6128681a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793084389; x=1793689189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
        b=a4FzZZbse2fbYo2HO+BOk2KVJIdehLeh5UPnmbx+/WyQxqXOJny0RNOup3jIQKEqGr
         YV6OULdNCVz76M0XAD8WJtNAodcfA8FhmY50nyt1IbJvwXEZX8I6ZvpMSa09JOJmME3I
         PvNCYTVBxfpUQRRmcR0UUiNyu8/lN8egY7Teoa3WbiiVRUPNGdtfOBjoLHiIv/G3B83B
         8w9vvZMABVFRE+P1vTOAr3kgoFQb3w0r275RPVXc0223NIhAMh807wo0N9Pgjf62mYXD
         5eummGTkmUuWaVLrCuj4nU2d8kUa6HAHBTpF7lOYg3PYzbBXhdebCnogRkFMAl7mvDiQ
         V9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084389; x=1793689189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNC12pOFow6vg7cxuHOJtzrj2t/7mEYl6Zadij4kSCU=;
        b=a/umrtBm1ei8qg82jvr01C7FSH57A08PySTjOOq9bGdq8TKezid3jGm9zlOiJro1SD
         pYXxUlyuBvBPQN6H556Yn1Q3HKT7UBh/V9W5+fXuklvgQFYsIrSojuwlPLdnXw3ubpYl
         tebdDHEzorT883XQabtbAvb8b3m7TpmJpvrHqMgl11pCZkS4Df/uedChJMRkmtyvwHV4
         s4AxnjugdsoeUDgTR7OV8l2QokzoD0vLxBGVmec8OIxwjVBNh6mZR1R2JQWCvc0AP9EU
         1QHPwmFus+fyBorT+NSboc+EBnJVVGnExV73Tub0AWTsWxWYWT31HjshG1NxX4L4Uohg
         80TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHbgqsDignhxSsJ0XNbOje7ogOsi7mJEkDp2Ac1DdbscCrpQn2wPosSpJ1rSYa1o0VcU3ThounXFcZWcjS@vger.kernel.org
X-Gm-Message-State: AFq9FYI2dtz0bQ3l13lQxxFtFD1kUv+mt2Pp/vgIHYdj/GSHqRdJetVu
	SmQg4gf6F1rXr+DpAOzZe1q6KftLOeo4KyM4rHEZhiGeDmkbw7ZNLo6ccySIFpk/7+Wg2Kuj/0N
	mviMFxI5Y3V7XHdxN1SL2Ech1yC8eQACt+xAduuFF0pNtO7opuCsNtwOSf/BXS0MKBGh4
X-Gm-Gg: AYBFou2j0+L6ihH9rXrCNxozLotxCr23UsV5uR54mvrh76sojZgXQrYkqJYLuKc6kgz
	lwNh7LlRPe/kEXFjSdBdrv+s3pF2xZBzJz9ytCmGfNT/EGexjexdjFk9Co+HV4oyzMDzO9p/+P7
	IyDIf+FQUq/rVj7tYZ+Y20EZzRU9EQYXdvh0bB6xZzg9FjHBCb3pBbfJ7Ky4gw1ttqPBwF/ULph
	TounXDHT3P6JfaIOnYAQUlvbaWCEhMH1EbTDSazJI2Z34wsVafjlVSg2NtMLiNuRMm459UcITvq
	SnKBYLXJmmwAmTrO6o/sgJRSRzKHFb7DLSZ2OyzVom2OuT1cHTHuVzqZ9fbMsF0lrRF6wVYg1WN
	r8DZcvifyqtVralk2UhKsT/SAN/aHNZXEAog=
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr7647142a91.30.1793084389118;
        Mon, 26 Oct 2026 23:59:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr7647128a91.30.1793084388707;
        Mon, 26 Oct 2026 23:59:48 -0700 (PDT)
Received: from [10.218.35.238] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404730f1sm2350317a91.15.2026.10.26.23.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:59:48 -0700 (PDT)
Message-ID: <8ec30a0f-2c9d-4011-8e26-9ec51c68681d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:29:43 +0530
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
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-1-dcabe94f1074@oss.qualcomm.com>
 <20261020-accelerated-husky-of-whirlwind-ce022c@quoll>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <20261020-accelerated-husky-of-whirlwind-ce022c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNyBTYWx0ZWRfXxns6ZF8z4pFF
 8xu7V+DMDeDsncXItLmbTPxV2oGHVd0cV+8yrMT8Mr85E1eoQ7P85hZRf0SFVr4jbxFA0fUPj1w
 WH1gsrq05Jpi3Ke4S35whY29L3dvFBA=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae04be5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Y71-Jxx4QiA4W6V5z98A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: W6HOBjDPg2tHsWgwiJEUdjuMKwyAnaLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNyBTYWx0ZWRfX1a7CRNeyWecX
 wk1JW29Q5ijVtrjEgEM2a404edSLLUAameB1JxGkQAvdoRCfo/6XB07QTFi1ARszqxAX7PjA/fs
 RXsVm+Ed5wcCNnKbPGKAhXC9wZfYmb0sC98WrSBiA2eilMmzFpG+qjDamVJdjCkoKrRZon1xW6l
 QWKDxCxk7lFZJ15JWJHuVJtK6rjazBGzYVztozgK4WYmHeNX0clQ6p7SIst8Pbxc2i9KtjdMz/A
 +tmfFcQ9UeoreDFEn1IyOhHIkfbkklKQ9fCt02fHzxBBa1O4+zmIRri5NyUpIEIB35DGMHPORj/
 sAnQzLA5bCO/6d9ajT3qKtyjvbBfxT3o4DdUelX+1E51QkQB++O35QlY4rjRSaeiEcov0vA3Tx7
 2FBlD1tcGsj6e1iwWir1vPJ+t5lcydA+Mf1PSgE0W6LGFeBCg/E/BEE6sY8soMPhqpIQ8N+uOGd
 GmctrDxhoH4IJPJNsaA==
X-Proofpoint-GUID: W6HOBjDPg2tHsWgwiJEUdjuMKwyAnaLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270027

Hi Krzysztof Kozlowski,

On 10/20/2026 1:21 PM, Krzysztof Kozlowski wrote:
> On Mon, Oct 19, 2026 at 03:57:32PM +0530, Gopikishan Thawre wrote:
>> Add the qcom,lemans-draco-evk compatible string for the LeMans Draco EVK
>> board, which pairs the LeMans Draco EVK SoM with a common carrier board.
> 
> So here you explain any oddities, like why SoM has no dedicated
> compatible and why common carrier board means it is not common but
> SoM specific.
> 

Thanks for review and suggestions.
Agreed. The LeMans Draco SoM is the module itself, while the complete
SoM and Draco carrier board combination is the LeMans Draco EVK. I will 
update the commit message accordingly in v2.

Best Regards,
Gopikishan

