Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAC41A55B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205388; cv=none; b=QUQpOx5PrK/aHg5eTOFBEItNFf1BB/MOD4sImgluhmz7VnQtompaS8zx8k56QAQMv8f6xE5E4jUObH63fIy0+Ur/PecAdngIcP4cJW3bryDXemR1+qM8el+mRc3cuGUBXrg7OITG/7GRUtQrP70xDeJR4KSpgVV6CrAFj5/edug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205388; c=relaxed/simple;
	bh=hxWWKhI0tQTive2CFXJWMVvPXF4+6eRYQnDoaeGQjBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faA+Rr3tSSNN3DbtJVSdexrs1uDrvLiRxOImEJkm1GJl5iAk5myudyCzXrCIhZX430B6lXhUpnObu/F7lkKK9sMr5vfuTdsO/llScSsaCk9kpSkaWrxk6L/lGdAhAN2HsIH14kZcqczzWezGEdjQNS/mnL3YDxEgNyx0D3De3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaGspmQt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=claUjCIB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaGspmQt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="claUjCIB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBitMa2730886
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqnCjoNOPvKjqbzSrJmJZF6GvgPuzdQC5JrhOmYheMM=; b=BaGspmQtjl4kSv6I
	q8bSLcrNH3Wnci4mYrNw/UXswFYnXxLRLUrqTCIZ9Euifri1kT8TVIiSqRXlgPAv
	Egkx8Zdf2h9hD4K5dZCpJlFM1DBeEDfvGcPSEfzdR8i74bO3+JnI4alN1OV01U5o
	KqASZZbbEWuJtjZL7DaM3UOEGnVEdMn4t6Icuiy6hD4rwoPllwGPvbMnOY8QjUOA
	GAtQyVT6aCsJmSFUvsdE+WxL0gq6Mg3aZIBxAIPcGtZy4M0OUuqMYbTdxZrs2N4o
	hmKPsu3ygyz1wUg13h4GaE83+kig5bv1QgBL7IbLwjpfYL/z78zaXC0cklK/zlPP
	NCiz0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wadv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:36:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so5130088a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205385; x=1784810185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqnCjoNOPvKjqbzSrJmJZF6GvgPuzdQC5JrhOmYheMM=;
        b=claUjCIBH+DusXUNZx/2rm0mZZrYcG74l4Aig3nNYz/GIM6ZI3MNZuqWBsgJ4HXzNn
         EVZ4EM9+ilUIYC8NeYo6pALGr7Z0AmMmbFKNU/gQv6LuwAFzquQo4rwa8gwcKz5+XePd
         s/GcGbcE3KsKS84Vw/uvlNd6Ow1O5CnSx04VZC/7hIIOaQ9VXsu6SgSGHMOxuxZH+0hT
         qqSof1NQX5RYJFUJ9+IlLetAW8DniD76wVFxplV+Ux9CFvZKESouIAHDSbBffeyQnsqc
         sur6YXUavhC5iUJOBLPavqTv8p7tW316D5oMC2k0dpHjKiB2kozEcw9woCmeAN3MXi3G
         cZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205385; x=1784810185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqnCjoNOPvKjqbzSrJmJZF6GvgPuzdQC5JrhOmYheMM=;
        b=klunaHwt8cJSV0xjpCYVNZ4w1uwhYPHFA/X3YkIVGuQ+q208C/HjJRYO1trIzGFXek
         NraHvI2xtJT5sL08mc0KRpxk7ndO1HCz3S8QhpFQgrWA/KCnJs3ny1lltjjvudPudlAo
         jD1HFAL0lQs+wlDE7zn++ADh84ZyGgpi0Rx0RN8HWMz5qulT2Y1v0KMnA+Vs/JqJ+1rs
         yCarmJMJ7g9Fbc9AR7FM3EztfOgMoljkaVhRNnRjPkypMvGsCJMcbQkZmsc91uVeH4Lu
         KQoYJjm16IjKVDBZKfjW7PEutGrjvSTUDtrSOBDi5KWZSA83/Ni/4nWqxo5VqGcfd39f
         cJww==
X-Forwarded-Encrypted: i=1; AHgh+RoQXcA/wZOMWtYzZkOMyFARYuDOFeqgX+ijT6ftHQr7eeC7KPi7Z7BaAW0Ld3shmis6tpT6heJiHzwlEkY/@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVO+dnVH5RTFSUyi5hURpZTgsLHeaH5M84mW21842e+t8v233
	VjxlGkLpo2EK4Gyk8EVfz8Cm/BXXGm2J56YVkf8AUVTyqMwI12ZTPUFjcWkQeS0eu9vM4HpEyPg
	D6kcN0lXV77k9nypWBbEXs4RIDboJBjyAwZ3jNG/JNrfpsMQg57ka50yasroqSrwf4nIZ
X-Gm-Gg: AfdE7cmUFKY4gwFdHHsgBeqd3UmOpc/gKJFKa+speukAQIU/O2xBlxqaxcsCZ+jjPEK
	U4A/bHJC1b5Mk5IOdTLwoPXryazffcHbon7HVN11KcP5vC5/6YaTFP5QTNv1cYyCTg2Xs9d3n74
	7z6FVb1gVbeJeHGkaVTDy5+3cv0zXMzSQp5qyMBNDwy/Af3fZDHuUL9lwz3qMlb9vAMenJjfofN
	wnrc+iIxTpWi9xIrb+jQPHaSnsB7yhrGJytMRt+UoDqsfv/Xxqr3kaJapKBO9uXhycZ0K4AWrR/
	cfex3TufxfmErJ5sRuEG2Av7KC/RP9iQOd3vez8uqO4IdbAIhpAoOkk5FB+uJ+PBe/hi+mlDkgV
	6GqsB5F7w+JOlGR0AFta98AkD1/dC+SofMw==
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr22835903637.20.1784205385609;
        Thu, 16 Jul 2026 05:36:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr22835849637.20.1784205385064;
        Thu, 16 Jul 2026 05:36:25 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm10674250c88.14.2026.07.16.05.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:36:22 -0700 (PDT)
Message-ID: <2ac2cdcb-f671-4f7a-83c3-bb05fcf4259f@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:05:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for
 multi-owner I2C transfers
To: Bartosz Golaszewski <brgl@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com,
        quic_jseerapu@quicinc.com, zhengxingda@iscas.ac.cn, kees@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260708051023.2872304-1-mukesh.savaliya@oss.qualcomm.com>
 <20260708051023.2872304-3-mukesh.savaliya@oss.qualcomm.com>
 <aleoVNavBOrF9r7O@vaman>
 <CAMRc=Mc_4TZ6QjUgQmLehBb_6f90bamYFhE5S_6m-Poem0-u1Q@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc_4TZ6QjUgQmLehBb_6f90bamYFhE5S_6m-Poem0-u1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58d04a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=OlrBKP18NtReKxGUJ9moaA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=FuXMeDijB7eqQmb0U5IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UK_28eGvbf0SO9_aqP5wSMexnyyDCRyO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX+uLZgLNyvSYn
 lGuiYPpxgH7yuIrxx6z69KssumONHel54EYJtY2rORkm+KpD5H+OmGf4A/gthsWMM5K8IMq28ef
 QulYjrGpiXTzaPsWfJ2dUvEMy7LFP/c=
X-Proofpoint-ORIG-GUID: UK_28eGvbf0SO9_aqP5wSMexnyyDCRyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXz9eQV5Y/dXuF
 eFOBiUa+JunmH9ublVv1SXA36AIt+c+1lLQK8BlJSe4DZczZBgQP8Wf7zE+0KDDvyq+QPpfZ2oi
 9fw9Yb9FzceTbHEXrhF2lX8OkDPIwW0w72yyrdiGPYO8rXuF53AESRXfKoKg0+KjIdyogeizLS2
 ENEtuvVdwLnULHxNnrHc7UlgmBH3KuD3YzqUyZFaWt1YTPw4c7u+kJJqsafarxvcpZPi0IbD5qX
 3ZyMhmdvtk7tzNbAtozrmBim/5jzZuJF9iELVaNA5PXrbasMObLvHPRu9T7dk7rMvD2ooLRiYrP
 yNqgQgG+7sR2T2zez5ar6QNmDft58+Es5Xu7fL7ZOVkh3f32tck55Beygz553Q4i9DLTY7SKCTX
 LqvqEuO8UvREw3xbDblAbeYCXoEaWgl7sxalp2eFgIxbJQigMrFmikdtBuuczoqfMzRVyNc0als
 bPwkFTR634qgjmG0gag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129



On 7/16/2026 5:39 PM, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 17:33:40 +0200, Vinod Koul <vkoul@kernel.org> said:
>> On 08-07-26, 10:40, Mukesh Kumar Savaliya wrote:
>>
>>> +/**
>>> + * enum gpi_lock_action - request lock/unlock TRE sequencing
>>> + * @GPI_LOCK_NONE: No lock/unlock TRE requested for this transfer
>>> + * @GPI_LOCK_ACQUIRE: Emit a lock TRE before the transfer
>>> + * @GPI_LOCK_RELEASE: Emit an unlock TRE after the transfer
>>> + *
>>> + * Used by protocol drivers for multi-owner controller setups (e.g. when
>>> + * DeviceTree indicates the controller is shared via qcom,qup-multi-owner).
>>> + */
>>> +enum gpi_lock_action {
>>> +	GPI_LOCK_NONE = 0,
>>> +	GPI_LOCK_ACQUIRE,
>>> +	GPI_LOCK_RELEASE,
>>
>> Can qualcomm people please align on LOCK/UNLOCK interface? This is
>> second interface I am seeing now. Can you folks align internally on how
>> clients should communicating lock/unlock across different qualcomm
>> dmaengine drivers
>>
> 

Sure Vinod,Thanks for your review and updating on direction.
I thought reverse to not pass transfer index to GSI driver.


> As discussed internally - this driver should follow the pattern we established
> for BAM DMA where we don't require consumers to be aware of the locking
> happening to any larger degree than is absolutely required (for instance:
> passing the address of the appropriate scratchpad register as is the case for
> BAM DMA).
> 
Yes, Bartosz, i understand. let me align on this and follow BAM DMA 
design, will review with you OR get BAM DMA changes.

If Consumers do not posses knowledge of locking/unlocking, DMA engine 
(here GSI) need to have some decision making knowledge. e.g. First 
transfer and last transfer.

let me share with you and then will upload.


> Bart

