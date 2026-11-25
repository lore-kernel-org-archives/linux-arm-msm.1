Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599935;
	b=eEK5Rb6Hl/GaDaKROROIRE8J21a3D9eIpxs5DP9nOSkMYin/qdHNECRu80dL/fAYlJhl
	 aYdv1qCvEjwK4s5uTpRNaEPBgtL6Y47pUPQr3CQq5Vf2D2pGM1wpOPzBcvXXZyWvfOSn5
	 OMHzseJ9YmWzzeW8rhN4chuQIOdyztqwferBORQrMSsl6pUYficaniKWrkxXbqm+YHse0
	 5Kb7AfpCpj/hU+VkOGqL3NX0li7JkxmhxkGAH4CPy1lWBgIHWyinTpfzn2QmtFdvikCoN
	 NUfCSemO3yWmXF3Bhgs9FKze/hMgCCCTU3bOhwrdAsSm906Nb28aRcbNi3vnlFwcRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=;
	b=ctEiSTy86CVfnolwzemFxfMlce+06s2R/tmGdrXgvZDFu6aPAw+Wwf1SMpi9RDobopuX
	 hzpbehInHc62qvRNRG4EAghTKRFN5kjWw3aU6WgHmmlJDxCFkoJvH7OGUGiqEEaRgJAVR
	 XgN8GbcrLODCpKWtJZVdHth2+HuUwoHWcEgq9PRrlU/CRlbfq/NbDjM7LbUOdk5JXHirf
	 GFBRKXjF6yz8y98lQaE8Vxk1JxRA1qTxcYG0vb3ZEsP40BIJxpVMl31upFzKC90AbhPvP
	 yHI8znkjuiRMxsS+IOa3+Z8Z9rq3wMmEy6bdMIXSKBXuRklzCujHqeb9UsAM6Olyv0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfpIUnCm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dmi9y64F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA88606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfpIUnCm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dmi9y64F
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68TcO3534188
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=; b=JfpIUnCmPGmfQ+JV
	EcOfg0YsGAxyNWnGmc6mIIkLWE3hR0i9O7/T+i5tFcd/vko5sKjQLQlTowOZA+YK
	WMTcuLpXQNqORghCPfUkJQsZ/gmc6Tmr4As493xLl1DV5ziuCxqfa4roDsLSxMLp
	PzLUxxzARgRCMbZlLA2D8RJ0EnKPiuFCRN9SqYsvwO6QHTurL/qWdOfohadEzjAe
	S43XYu8Q7ljfjWdPx1mSjD5J0NuyZYV/Hat7nl7ukoMr6fmzJVdweN9z7ztNckCo
	u0TsIxg3OoU96oTLvDSvJ+/u9EN7ZZ0Mm542NCQWiQO2UGNAu/uenMsg7S0O+4N0
	3jqXug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj3uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:45:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94993a54a73so49700385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599934; x=1796204734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=;
        b=Dmi9y64FyShY00JG8GyzK9zpbZb0WxzmhPwXm7or1c4AbM/oa2L6HnNTiNinP9oTvb
         2TZ5dlW5d0xSVBjh86zf9ksMZz+Bj+kgNq4maFkvJ8L+g9xYvMP64KjwG7rpZOab/0Bl
         bOUzKVlrx4wPVPv6A9EEaH+VgkuZ3w6Tkj49lDERKFDQHDg5rHOJH9oTYGgnQJeHeLSH
         ZHpCDk43++cQylGofvoJTNgfXiYsw8rdrzBEcmd7Xh3IsogSdsRcF4kzUhPTzAkvnv0d
         h3zT14akNPwSxFo5lL7t25mHM5RtxHhUqkO0vBG0wPvR2sf9R8DiqoKdK5mjrMuiUuEd
         yNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599934; x=1796204734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvXtOvEwzZL3rVHSTXfwhOmj0sD1jdrLdqsI9n9mBj8=;
        b=KM3UpMoMZKoMoK1nCazK6P3ZAWDq65uHDX1GliO6V0fi04wHFiUtvTLDkvNTGKnXaw
         azTiE5WSeK11hXHYQVvePfX+Wh9NUaqVWjezeWX+GJcaITyxRPWEGU6uEFfHp1lGYsmA
         /ngpt61GjAQ8QXLRwU+jfiEv80P/Ef/0B+KSxlUqJ0x6QUIwENq6Z2XmBCmsWmNg0zoQ
         AeFo1EIIPdSXkEY4kwH4KIbXgnBT64kEjboMwaaYDbng1kyjZaBRyiCt4szspcKjp5Qw
         IXs2nA819Kdgn5yFwucNI1NhscqwHoL7EqiFz6jy3JwxflwzQ2CNQSe991dubXTy8lhe
         7jWg==
X-Gm-Message-State: APuU4Z/qO77Kf+qYQCxuWb9sw8LZLL2r6zv4bLmTdFnYzj4g2/v8d/1B
	9zNT2MJdFYxkzh+Ygna+lOmElnhj9C/fIPshRUuhCpwMNCP2KdnrahNQ0E5E7/IDt4c0AKCIs2v
	rxtYPDdoL+lr5YJ6PsRBK2K/4zRi4u7dFkPTFAkgu5FvKzI19ZyKnpS5i0tOqenFYRSCb/bB9EJ
	q2
X-Gm-Gg: AZFdTZeummOq6sySXnezXHWUQbKEnju9aWE8EU29X8ApN2uT8FnaUtN/tvLSygUa5tA
	M5Fwt46iLIffmO/xNUu1ejMJoR2UE0EBgenYvchKPbToCPghopNQXUYqxClLJaJNRSeV6R0lgGs
	s7N2LkWG374svM9VDDTGVrkXDaHqgXNA72gDJQYGw/8pQjaqG7MAw2pAR0zkjsBX0vBlJKw4bQ6
	48xRjaej5G8JzbJ4Htf1xDWX8xVFHsGdfqfuCkXeCQpOiA3MaD+U8iLSZj1I0RpVew5c/lQm/rc
	eBz89ckFw2R0i0NsDY7zD9yMC1EmDBr8LijGVfCVWbfV4fTLTfrfaQVvR4jrjcX2i1VDYhO06Nl
	CahMNtpvSpNMCu5Jp8t949ziPnh5OQMGAoYToq8Pt8h9+2ESIw6JHa91fRSZEfaLv7cBpQxg=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2879604585a.1.1795599933659;
        Wed, 25 Nov 2026 01:45:33 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2879601285a.1.1795599933086;
        Wed, 25 Nov 2026 01:45:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm1320136a12.2.2026.11.25.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:45:31 -0800 (PST)
Message-ID: <68573981-f9a0-480c-806a-0980cfbb6242@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:45:29 +0100
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
Subject: Re: [PATCH] interconnect: qcom: Don't read back BCMs without an RPMh
 address
To: venkat.yadlapati@yahoo.com, Georgi Djakov <djakov@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX3f7DJkkLgV4B
 E9uX6oUFjBJN2JxBoxx9CnWv/EB89cGz70+0sAryrrcPT63rrxebPkf/GM6Z4RtvjWie1+/88zS
 NWo0wBqvrX58tXx8wkUKd4VN+LMVPlI=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06ae3e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CjxXgO3LAAAA:8 a=CVOz8DntD0RYTBbE8LAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX6doBYcOTtNZe
 v1prmV2d7D4Ps2uk0kMRAOMKr2ZZiIFqwhsHe8EFUgSDBPi5WHAS9/WBstPhdcnOylfIr9VTpvz
 ORq2dWPT6yOs8JwzGqIG2TaATUm4htGTvhqdRplklhWfaJ/nAA7d7x3lzsnr32SDeqrsBImE7c7
 9GmC0icitX77kfIN2svOg+TV45QSSYbB9QHNxpV1MpLE9QIWlDTukQzOHUQ0IOEGlChsb8Bjqhu
 3EdgqJnLwfNb19K3ghWjK0UoUydt3rtvnL9LPfHNxCgcOID7fhwElpj32AIxiAIuvn+a3AaPvno
 npt0qbBij6UbuG9axnUky9HLAnTj03QUZEsBco2j6OvDBJxQCMPQ0NG+Liw8vqQgB+qCqPHZ5Xj
 4yC6y4WioZXnBj7GU70DeUTICgxeHvF6hhzJcAwzINq+CkIBhf6W3+9i98dq53b5lQG53UpScRl
 bTPH+3V6eAYJ5+iv1SQ==
X-Proofpoint-ORIG-GUID: 13WPtRRuUTj0LeEIAmFM82DzCP3G_l80
X-Proofpoint-GUID: 13WPtRRuUTj0LeEIAmFM82DzCP3G_l80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/15/26 9:19 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> qcom_icc_rpmh_probe() ignores the return value of qcom_icc_bcm_init()
> and reads the initial vote of every BCM back with rpmh_read(). When the
> command DB has no entry for a BCM, qcom_icc_bcm_init() fails before
> setting the address, so the read goes to RPMh address 0. On Molokai
> (SM8845), whose command DB lacks the QPC0 BCM of the Kaanapali gem_noc,
> that read never completes and every later RPMh request times out, so the
> regulators fail to probe and the boot stalls:
> 
>   qnoc-kaanapali 31100000.interconnect: QPC0 could not find RPMh address
>   qcom-rpmh-regulator 18900000.rsc:regulators-2: failed to read ENABLE status ret = -110
>   Error sending AMC RPMH requests (-110)

Fix the driver instead, please.

Konrad
