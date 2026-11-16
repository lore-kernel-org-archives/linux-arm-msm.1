Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827936;
	b=vsfimPLTJh8WlC6se/Y3fbiof2zAkboiHR5tjVnBYmMQcdiI3fbU12gYFopjTD/+8aa3
	 +x+oAmp4oPgvtWDddJ3MCfpDLJxXoj7CohUqQHAaSOO6qshZRWr8CimH8K+r1zhkD/SBM
	 DVdXijneX2KQg9U5dKVsSw4s315sT4WdBnr4+WihXQ0RE9c3SObHsYEyXzr72v52xBgXE
	 scLBStvj6jVu6yMJNyntIuwdhUmyesMMTTz5wTM9c+K2pnV/g4aKCd1Q1e+mnRJI1dGu0
	 snYbsrrS7spYW+ZIjfAK12JTNHPooF6tDWjxu012KlRTgNOOP+kBKjwsG33j8Y+p+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=;
	b=p/0GRga8dQs6AB+aTjc3BOy9krYRSYruhhSvwu+9ppPF8dC3pzNUpo6XUbTjV9FFCyUi
	 Sh5I0bEFH1sd/n0f2lnADhBHradzVYImnS+H+AZEsnSkOqG+DwdBo4lSvliDvKPeh4HHk
	 vFrPRPNIfFoFYozH7O9uSbfmzOlAJcO25K4EV4bKnr8ootiLnrG3bh5XNNtc7xuhE9Wxq
	 DlsfUindAdI/Gm4+roLXRqZUfW/VvNCktbxDYfr7Ei+/4r8ShEHpHucOoO+weyI9z50RD
	 cEu+t5oUTkAshxXy1f62c0c1FgXShcBcPdjVGhFolDXMAnTkRZJvOU+PKo1rtrD8sOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Buu2wo26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNtdGh9h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F2A6070709
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F2A6070709
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Buu2wo26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNtdGh9h
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG97XFh1161026
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=; b=Buu2wo26A87LNAvo
	vfTcVD3KrHkISdUrofq/hDwS6Osq6iV85QykFm9BSVpW8Rq0Z/eRsXRyG+4kUXox
	lPGhxqXjD/XP8J/jaKDoQ58k6XqCcrG59N6dk9azLoWq2tkW/BVVSswlim17ukVk
	Jp4KzFjKIFjJcFURryPkIswYZlXWqRP8MWsp57QTdrndTEwEYfMN2INHZko70NGb
	UDOUBwqV4A3OT/bXshTEz+PUmYKbUONTsAAtRUdAbZWRdV47o7H6LaPRUYquoiwC
	acZOMyVVqc6fDe/e9nRBZP3AmlfpGPkblE8ulj4FKri8SCmM1wF8g2wnjHKI2Jf1
	2XjvBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gfjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:18:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so5731860a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827934; x=1795432734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=;
        b=kNtdGh9hQrKfSbzsMJV1U5ylLOTzp3nsf/pn2RkkuLv//oeyHPFCDsTzIVBfTc5QEa
         naVFRMp62qaRsL0Ca6gQpvjSSpOFFGgPGWEyOQ/yBmnlt+k3Zv8VN5CkD9EEXqCn60oK
         zmoaSB/pdzmGHS9BhuTxrraVCbw7OyDXVyQkpJO9rYkeD5aNYxsJVaNg2UZwJWFMKjiS
         Ml3WNsvPC+4WeP3CVEMkqOLoe6FTX65HCm9aTto0Iix3ezweKM7iIEC6KbWpcutGHn59
         2RJK+bsaqf3T7M8WsCwdNoLU9hqTyCIwlKdvEEGinjzipUuvUmen1JRZDzmr4y7kUSP2
         WzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827934; x=1795432734;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=;
        b=ZPgolZkmB6z3rLUqumyDruhBoIpJlrzgh5CZvfzZi+3ZWRayYxq6QXaJgfyEThKOob
         L1DdTCyV1psjhzeDKDY0jycuBdjaShdEFtPTSKibDaM+aVMJGnul6ERzNu4OYuQLLyiL
         FOotsMuuiJPz/6XIiOtnOfdxeVB8UQSdfEbc2o29sc07UeIkpFYNOtDo0/cov7Y2LdRa
         /p6PyjmF2W+xq0UNVsGGuK1uDN7UsZ89HhVljb5av9Ou/WxylZjn7g3XKE3DlmJ8Za8r
         sqf1JP8/xyZEcZhJLz9A3Aw0Gahq6PWREWlPjy2QbbBpvrYb/bb4nFF3lGtjPn7KVUnZ
         X5Ng==
X-Forwarded-Encrypted: i=1; AL+hErEvurCVkYatowQxEPjNuy0raNTOeQYm1Zmz+f5jgUbh+8rPkj5BtRKza30ck79MaW2ZGNznXEZG+1vGiYK/@vger.kernel.org
X-Gm-Message-State: APuU4Z8TaWXhHMT/rp+gYBMUPVuVKdkC8W4q3h2nebUHTC/IKY+iBRiw
	NlZVS1InFkaL/bTOao/8vM/u59Swa2LiJYqa4Vw75lbFn4Qglss9a22jCdTyJLv4qddlt3cSI+b
	DJdR/L8hF0rnUxCfWj0X9STtc4FvHvwLZvBDN7lyK8rGslvf51Yd101pA9f7raXnfrrgi
X-Gm-Gg: AZFdTZfjIda3Rrxi692Y6AEpzocKK+wIXGdsA/ygnqTf0IMTg4RDEXRISMrFTXFm8Rb
	7/v1LuwElKn+zRDvk5i5lToNBo6163yffyl4rGHvTPPHr8ubLQV0KJt/X4+8UalVFkcLThwqG5J
	bMwKiWn5JKhAkLXcoM0W9sy5g8V58Jwwf1F9I8VOh9lHRcuJqBZSC9iRw0TTYYC1Op9s5C+d1xL
	Vmx/dcBMMX3+4lOD1B3umr93fK6hrkKYIX+bxOQ7S62D2a29VTm/KmbMex5b/63LqiV/6LpB/zw
	YfstzJ2dTjLjIuPc4H03heglqEe6vWM6jj0LQOQdzX3Y0Nx7Zg0H/8JJOkWrGX2Cj9wKWuJRtiD
	c/a02PiYsqHVgyLwHgoZ1Kpp4W+ZT85gETd+RwRQDCY4b2WdN6E4Y7lVcihhjIq6IBvjeAVV7lh
	g=
X-Received: by 2002:a17:90b:2d85:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b1b0ca53bdmr10317951a91.37.1794827933776;
        Mon, 16 Nov 2026 03:18:53 -0800 (PST)
X-Received: by 2002:a17:90b:2d85:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b1b0ca53bdmr10317925a91.37.1794827933363;
        Mon, 16 Nov 2026 03:18:53 -0800 (PST)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm22100109a91.4.2026.11.16.03.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:18:53 -0800 (PST)
Message-ID: <691c3ec9-b21a-4e66-8c4a-de14c8987705@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:48:47 +0530
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
Subject: Re: [PATCH v2 2/6] firmware: qcom_scm: Transition to ICE TZ agnostic
 operations
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
 <20261111-ice-migrate-tee-svc-v2-2-29d19f6c92ab@oss.qualcomm.com>
 <20261113213403.GA35210@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261113213403.GA35210@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afae69e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mWdmoYhiF-GBnKHWv5IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfXzoWTOoEe8rMQ
 G893Fqo2rzColLKEhftivdtKF9GqcHk4sV3RGsYGAV0/LCPhNuTyZ7/gILNWr2/bG0aPXSm5+mm
 p5U93IeVa6H+LQczWEnb+xYFPzAd3Ko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX7+0pws41Dg3i
 1U2ugCFAo01K1xT0YNLAQicim64yJ4xc9ra71kheLLbmJpAn3o6ezReSwjVep6dc2NfuIozngeR
 Tw5U5Vn69n/Re4xn5gszrj/nYKODTQupn9UMOvi6/PHjiGQhRx8rh4C9NGFO8Cc+hHUE5sQmmEd
 ftGZQPBdBKwgdr06U4Dqm29+O+OFkpdBodZjoB5zCOjaY4t0QQhZZr4hb3Yn6ZVP50rm5EEcjkp
 CpHDlgx4cKyBiYk/tVZcAjybX/TnzOZ0OrmlMKDY/wsjoHFxzW/e1a3v1hXbo/w/MuHp5NiiylF
 ce5DwIdVXyNgN4/2S97GnaEhQokPn+o2I2Lw5tWSWobxBZZOBAG0lIZCsgZtWP29f3+ovAR64jn
 d6UygRgrRqFpjjL09ODGz763l/eHQK+nRzB4JbKfoDOSeQbNBFN/ZUqnKB4yf4OvXrN+mZyuJtn
 nPV4W/1Pa7uEX+c4z1A==
X-Proofpoint-GUID: Qk6a17hxTdooYtWAsK20FgaXby5zq3vT
X-Proofpoint-ORIG-GUID: Qk6a17hxTdooYtWAsK20FgaXby5zq3vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160044

Hi Eric,

On 14-11-2026 03:04 am, Eric Biggers wrote:
> On Wed, Nov 11, 2026 at 07:47:02PM +0530, Harshal Dev wrote:
>> Transition the ICE related SCM calls to the generic ICE TZ operations by
>> registering them with the ICE driver and wrapping them in exported APIs
>> with the same signature.
>>
>> This prepares the ICE driver for eventual migration to the TZ agnostic
>> secure programming interfaces once the TEE bus based back-end becomes
>> available.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 131 +++++++++++++++++++++++++++++++--------
>>  1 file changed, 106 insertions(+), 25 deletions(-)
> 
> Wouldn't it make more sense to leave qcom_scm alone, and have qcom_ice
> decide whether it should call qcom_scm_ice_*() or the OP-TEE backend?
> That would avoid the circular dependency between qcom_scm and qcom_ice
> which this patch introduces, and eliminate the need for patches 2 and 6.
>

I agree actually. The QCOM_SCM and QCOM_PAS already have a circular dependency
because of the function pointer registration approach. I guess it is much
easier the way you suggested. I'll try this approach.

Corresponding to qcom_scm_is_available() and qcom_scm_ice_is_available() we
should have corresponding APIs from the OPTEE back-end; qcom_tee_is_available()
and qcom_tee_ice_is_available(). The qcom_ice_tz_ops_(un)register() can be dropped.

Ack.

Regards,
Harshal
 
> - Eric

