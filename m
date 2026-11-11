Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386007;
	b=iykIY2A7ElcHu1aoGUpoOeR9tNVV54d/INMPeZ2O0Q6rkLs1DSxwb8gJXxz7Ku5aTiob
	 1TyjZgC8HUogbQIJTqJExs4MZbOK5S1RCxyYz6nsP2qe/nKPB1fADkutnY7A0kksrZkEN
	 yv02QIi9AnQv29Tr2pOUkUYx10c3o+mNkNXL+0aB3pV0GhvhTJybOJBPVm52ZW1prXtfJ
	 YglD9oChiXrUiMl2uZYdm3fmnSavOCe9fveqwFUQUeOpnWpIlVjjNSrXyFXn91Yf++/96
	 yhCmQTU2iQjcXZ8FBy2RWqJ0B1fRV8b6JoB5n5U6OQ8EMZxzRc4vNU5HUc+Wa2nbRSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
	b=RLjKm8wkzf2D2q8EEwlQRzi2GYV+BoKkbQTwNjNSyA0gtahSZGP0lEkuknbBI0PJWi9a
	 1qjCQI/D2u5p18ulMXLd+mRBUXbtUCkhKQ/zEhFFIDa7zgdvewKl6NcKF9P1p+TXy4GuD
	 MndCHTPc9rH/dlhfxOEc/7mQ8mitd6W8U0HimWfeVjuvSFaeX40yMCJb2OaXPN/9yEQCo
	 Re8jdAcDHD1cRBmc2XI6pWNl9Y10iM9izM3t0AbjpNQaVL0Pq4ZtbkFCsNNIXpFR9Cn00
	 gVVxzmzmwdESytqwmiO64fG+NkoJVFimNI8qF+bmuKGSoveSq23T1nKNf9Q/dC1yXnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592FB606A33E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 592FB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KKFr1386397
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=; b=ExzrXnKWCIJuRBYW
	adlPonufNKzumfWmayEMC2ytP0DcBjWY22YFKn4YbEymsgJmsfGf64Z/I99EVESM
	Iwwh2NEDAYO1fknxf3wpxObrSHiaPMgb0dFAejfkLOjJozEtfs0tP/Roz1hQmT+X
	KNtOXCwzMXVzmymZPX2+ldNXcDr4IbSK4YAKqiMlVRRBBPYuSJ/b9Onbg0VyWEkZ
	5noTWZOHi925H8YZ6P2Y99oaUphEDMhKHnGufPJahXIykXXB56H5oUiV1Y0Ubc8U
	BMh//eVhierB+74JJRmF2uhNuS3jwvlB+rKcX39D23/HSmhcuTBivBjo2pZVUIOu
	jAFQ1w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9msh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so4893122eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386005; x=1794990805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=LumO8tFyNpgZ8WmIxaPO4OMDIu0tC/OKETcHi48LvuoTCqPGQwNB9CGq0oMq90SP+9
         k2yEcYpmBd3COz+n72MRc/puVC70IhmgIJ1AIWMYXjlcBAP7Pb6NjvgdGzbxPIPDgyqf
         bC7zsSRebGiHdxAqtRmJboMaXW5TZvCHoN19knYtib3XAElz2KGCl+bdpfNtMduf9gC7
         RRKf5sxYEq1sEiFeA9j/ZjJoSQOpmzFpnxPq2iWZPqam9HxRDNW+ak8zsRM8aTI53lV4
         48ke54AFgaa3mbljvrZDNNgaftlwmyru5jQSq2uAiCUFOFvrdY2wvJmHCM0czUmkKjYK
         rtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386005; x=1794990805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=KI4Ol/ahXBfbMeVknXW8iYfHQcuAKriizJ39vDUfAOzijC/mJQggwvh5WI9RZ76DPp
         93uDF438BnkfNEqHJzJOT5wBUZT75FJrLlMCb6gGuFCS4YWzQrIgSta4l4boJozjGMay
         GXIpwnmZEY89kGjAtUdzwpuDHk52kotKkC/0HInhV7KqVOtu298YZh3ok9GS7tpgAzYn
         DooFt9Ehj4oxiXg0k9H9NJjHNA0n2g/QYKGV8v4dNSKHPmyYV4FzrY+Tt04D3wDAqVwl
         PkZYn5i7BH/p/lOz1VnVN9DT/qendF1/nqWhiH5HssTyjffoTKOuRXQaXISM0TPRSR8J
         mpjg==
X-Forwarded-Encrypted: i=1; AL+hErF1PuQwj7QY3f1ISfhWbBiT2HMd/yuuBBUIhCsEI5pFk3Qv2nunN8kYyKuQ762P4l7WHPJT+7M3OflAdWEb@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZPU6RM4qt8gSQcIK7ZrAsOBkGcMg5xI9/A6AgvidvwuZEuwT1
	DHZhjI/yFe6P0iO3tsMLITKooCYjZANAHEEqEOKBT1xX4K2Y2chJr1cMvZ0Phu8086PKQbjshPA
	urrRZEQC2SghrcNZ8t7geR9GClV24Xn0cSgp2oCsi4eN4vV4Kq+uwvA+53rAulE58ryZ7
X-Gm-Gg: AYBFou31iKGWNlxOziNpp8gtgX6qVMi8LugXndSa+W5fn5o7w7dej/TEzCth96zx827
	sVFU0o3WydkbhGVQmXGFS4QRPtYS4uCrHnUyB2RZYr+BRSNTYMfEBnw/AV7txKcvRinXYcjXN3n
	XVc5mOWEDHkUnyyuAc+LKbALSQ4xJiZ/sU5KWmKqlYEFkeSAsumzH+NnOIdB7FCMa7eAiNA6ZP5
	kUZ+6eTI5ruUtmRsSxiG5B11l8nJkqomq/39kizQ8YlnnLkPyjGzHd/AxJU4O8J5c4hFu9cW5ts
	oC+tMXopT8bfIVQ2CnZ72xIyN4gTpR0da0GesFKYmkA3gDk82poDI8FdHv0Bxm5gi9EkbelzR1g
	P7Oz11JcGd/nNZyO9yzQ/qLbl2sKsZr1do+xYap9d8bBtMzx9LZnmklvY0v7igewORve1CMeIaR
	cdrA==
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455984eec.5.1794386004975;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455945eec.5.1794386004375;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm26864637eec.29.2026.11.11.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:33:23 -0800 (PST)
Message-ID: <811819ae-ebff-49e2-be25-134b58711a5f@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:03:13 +0530
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
Subject: Re: [PATCH v4 02/25] accel/qda: Add initial QDA DRM accelerator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-2-88f2f24a5f0b@qti.qualcomm.com>
 <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Abb6zSTAz4NW5StK2IIC22AbmFClk-pY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfX00bJAup3eanl
 VqfS4dG6//pIxFXuwb43x6DHT664gm6Nvs2l0nGcHkHcTGzB2cTbuCXj3yEGW4wVs0qnpBxzxXG
 60xlcHkhFn41mstoNK00wRePuT4xmSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfX4SoRizyfBnEm
 SEqt2erNb54qEDf5WWxVaV6y4Bv/tahid0nPTbi1g9zq9qpjV1K8OqVWPFdbM4E4P976ipNXlfk
 94bAZ0K/CchbDZ8/frtyQ1Lu3TjEBk04zeFSQoWJxQlhDnP6g2xh2iG8YuwyM52NRNkCnUT89eL
 YQtgOu/ndEFExM/ixshO10ujXHivOmHP8n088TheAvbdcp72oXngmMFAOmVJPX8wOtw63qSvOnc
 h7y9afxt7d+1s9s9NtT9GOd7bp4h56AUtD2De4t8PpFZRyD64y0/h8t74Ys2iHJp522INjcaCcW
 JmdsBfD844FTizY4hc+7X73E9XFhvANBtVQWCfWPmXtTfZz8gUeG5yxyzQJ87eEMV2pjA8ZV+JG
 Cu+QV9lkeYFAxc7e1ShMoe7t1AI7pGKvdYqvrKWOAwyDU+RMlnpzay+rkyeDAApm/3Kl1zGZau8
 6x6eINDgNdcRhUPmBnw==
X-Proofpoint-GUID: Abb6zSTAz4NW5StK2IIC22AbmFClk-pY
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af42856 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3RgQX8W33KRH0BhMXdoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110033

On 02-11-2026 14:12, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +#include "qda_drv.h"
>> +
>> +/*
>> + * Both compatibles the binding defines are matched here. The glymur, hawi,
>> + * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> + * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> + * attached as match data by a later patch, once there is something that
> 
> So you add empty or non-working code. No, add these once you actually
> have complete and working table.
agreed, will add this once there is a complete table.

> 
>> + * consumes them.
>> + */
> 
> Drop comment, redundant. Referencing future patches makes no sense in
> source code, because there is no "patch" when looking at the code.
ack.

> 
>> +static const struct of_device_id qda_rpmsg_of_match[] = {
>> +	{ .compatible = "qcom,kaanapali-fastrpc" },
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{ }
> 
> 
> 
> 
> Best regards,
> Krzysztof

