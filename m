Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9EA43BDB2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838275; cv=none; b=PnhdrwCHulENiMCxkL+Fu83/TpEHUvGsppmTlarbs4/fjmUeRGVlRbUVpBPW/yEC1VbvNplXGkjtBP8Wnp5Bv6Fuf7RTljt2D13Uw501bmuqkjnmgltZWwEFT7im7yWCZfRO/TAXO3U3iflzsC6d1A8bJG1XzzH1/Ngnz33e/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838275; c=relaxed/simple;
	bh=ZIN4AB3H19EpeGemtzBMBcHpqh6iylI9p/IA4nT1UOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=owPAkpMo3tNEXtti7OAZWWjfTDRRxRVmEAoot8/X2hJdMJOqLIeAkkv1u5c6ykUxjovvDqkk/GaHl4nJjiuXrh4O7QrC734ifvC4EYisdLxrgLsMZnIkGY0R1XbWFKMBKp7psjhgNgR5JUn3JNcOy6rBHkS6VtE/OuLV4DCTZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5PNkzpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxtXk2Ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5PNkzpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxtXk2Ko"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748vVRU325564
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 10:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7S4tgahxOSinB3HPtJChGJl3G77hB4eJuWb6cUOxp18=; b=W5PNkzpGuM+eYUXQ
	I00oa4RlGj1L4i3AIS4ObH6GVLJiu55Gfoxgi0OfJ+uzRmh5p63pLp6qa1zLlcrb
	75Hwqt2HvbFubeEdsRkDkeLvKj88y+4a1LrIQ6MTcNVAn6FsMAKtAF86gxlYKh7K
	ScmxbF9H7wU5VHGM05X0JBpJKfA3xeVfdnnR3V4B/Mo4cD2e9sc9tFs4mh0A34nc
	ADBsiFPaU+/rO16nrSpm377cd7R9YkJOXTqS2fUSo/bgunx0rXryY/riDgMye0f6
	lE+4YhwotpyktqnQa2nz9HogsvuxE0M2gAc94tGSyqcV8FSt0HUv5GWfKD6iYB+z
	j5An5w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dg9ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:11:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so862999b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785838273; x=1786443073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S4tgahxOSinB3HPtJChGJl3G77hB4eJuWb6cUOxp18=;
        b=kxtXk2KouLge80vEjEpRaVB+TtN6LbYIV9ZIpy7/SqpmrDvMlG2BIE1AlJAAHamqJ9
         jlSt7sU10pLOknCi/7fBeI0/5xpZlJRdpz24uk4XXWOIlUcgkZuvMqG16/DwAbWCB+nf
         Q+LxRl3lkjn/kHyLHDtbtJGcx3474p9NbUJBIs0Kv9doVUvw9pj4wO2IfrYs5GFTxuz0
         Vd1eJTfjMyPpyA3GrBsQN5Zc3l77g3zkv+6t7B8XlUbK8b+NrPBWig8AIH6O51Br5qKw
         BvQMRzgau2E8yr6j6eKz1mK3aVF6+E7vjOu/L6+zH9bOHHd23zdsg2v+c40zp4KSaftk
         7AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838273; x=1786443073;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S4tgahxOSinB3HPtJChGJl3G77hB4eJuWb6cUOxp18=;
        b=Jaw3mKR/bgjoMWsXOQLPQIjvvNwpVZaoZ7a9kGQ8FaJebBYd/KogQtk29iV9MthxiA
         PHA4U/FP2ctDt0Lqbi21+sdOeyVDTmu+IIwgUOTBos4MLFd7qvpDFxrnqXSgpAz2H7nx
         jY4rFqCP8cPhrLocAs394ea0XhfQnUvmLSSIbjYUWJ2m6Is7NzD+bG1n2Sv9pYMpnOmW
         HCOPrc8VtNhaRvv159STTTQL9dBhoV/aDH4bJTffGhI1MeaQlPY7DO6YHlAr8EfSNUCS
         BJ3Gug/A8FKCNB/S01WACWwnZYTwNXFgcDZ7ktN9q2eeI9nW56zUppbPkeQwPEw5cvTi
         k4Dg==
X-Forwarded-Encrypted: i=1; AHgh+RpiyBcU92nXyVapnwHH0TcGFIRA4rhwCSApOKDaXUwXqBWBHF2Cf9wAbTWD7I1e+ix51evm9ydVLwXrNuTb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9yyrLdm/9fwhRcj6lzrQKZcfqHzHCxziX3syFVcKBDGr+m3sv
	gxVzN/yIw/WrYVse7pxOIs/4aaPiVfpVQ3HkV6IlFN5jwnVeV3FOfB9hSJ+g67gEOb9J9XDu1oP
	vWesuJ/9kXDmN9fs5TPr4MIlhX2ADsB19Hs/NxPApBROGIMnr2QmS+krRtNfVDJIguSlH
X-Gm-Gg: AR+sD12vanNdpmz/iky4OpP9SyxHlWa2JsIGWFNFKOhU+b5m/IbpVZVbylfmX37WfkR
	NtUjctBzAWvt+szybMTB2DMjkdmeel+aF9qeSZwah2UlbTb0KkAMQCyto1kX70xp9eRcmoig9Ck
	XGw767cOwIvwx6JiqqoyZ2WD2Hpp7XnM866fxhTWT6QFOQgu2KV/jx7LfqBUZoGAQAp9ROTn8Hd
	P3Iira2FgUoEWSK9twmVpyMDB0BahVY/WWWedlRJPSA6m53cNhX+Bz2ArqnvokD4roiXNWZV1BY
	HFEJ3SLfHWtVBqk5Jj6X27JKm2+WLxrhUklVxI3DY0+r7S7R+KEYy/lJgO/ukJCrvo68l/pnlp5
	sxG/GjE+Oy4AdACkIje+qwcOAg6WSEXU3dmrTFVvd6HK3uvMGiBX9j800JYkB3YBIfz753w==
X-Received: by 2002:a05:6a00:9a6:b0:848:48d0:934 with SMTP id d2e1a72fcca58-84f1cb6b1e1mr2636465b3a.18.1785838272646;
        Tue, 04 Aug 2026 03:11:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a6:b0:848:48d0:934 with SMTP id d2e1a72fcca58-84f1cb6b1e1mr2636435b3a.18.1785838272142;
        Tue, 04 Aug 2026 03:11:12 -0700 (PDT)
Received: from [10.249.10.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe396ea57dsm5003406a12.21.2026.08.04.03.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 03:11:11 -0700 (PDT)
Message-ID: <2da7893d-96e3-4f80-966d-3632329c3e27@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 18:11:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260731093210.473-1-jianping.li@oss.qualcomm.com>
 <ba6v23dn6mmhnowqigsojbnjnuhzr7hwmoe3treklr2zpbnfxt@vgvdxiarcb3k>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <ba6v23dn6mmhnowqigsojbnjnuhzr7hwmoe3treklr2zpbnfxt@vgvdxiarcb3k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xJAh4kfdPRpC9d-leSV50seQj0YFvpJ1
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a71bac1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4ZsVrytpSORdhRWgdAsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: xJAh4kfdPRpC9d-leSV50seQj0YFvpJ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4MCBTYWx0ZWRfXzna9Wtfgx9fI
 1pTU/O5Wh8oU8SSbRzInzzGKwTdY6lVrM3MCC1Po4w6HlB1JG08qLQ547VgSEV8xvvlkco73S8n
 d95IWaJ1lJztZSwhQ4cgFk9TZEIXKyM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4MCBTYWx0ZWRfX0CHdrXcZPnZl
 msRBIo3jr2C+U9Crddmwi/9/RUnN21KVoiV7U6ZAlicIj3YAgioI6+0W08zlqm9WO2SaVVKV/oT
 8YRvLxUQaCA5Bv24V1rFLMu11XxaWrh5D6lxkpUHeX/ghQSyvy4A0dqEdEJ2bCuWlTf+tBX0MaF
 aNVhQwP1D89donWLbpke+Twsw6p2WXJRFT2UZpezHJQDtUIz5nRUNvdIAexy6iQ5KBOKkfooVzE
 Ez2jQvVxAb/lWR7u8U1uUzxezaHx9OFIQ2HTiKTl/qF5eVBZClZsWKyYdH7rRgJ57Chs3LcgE95
 mEe05X3K+rMlP/CRTe3kfX8hUMU9C5pDxktkMA3bRHKP+sZUeyYaNghDikDV07SHIvt6G0wDxnU
 MWgWEfL2SlQhj9IIqdP/tMh3S/dKSo9tDRhrbMNvSq7jLdL+g78h4bw+pVCggDLCGPeRXpq+KxP
 z6VgJIWIjz/HiC+EXkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040080



在 2026/7/31 22:17, Dmitry Baryshkov 写道:
> On Fri, Jul 31, 2026 at 05:32:10PM +0800, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed only
>> when the DSP process is torn down.
>>
>> Validate the presence of the Audio PD reserved-memory region during
> 
> This will break compatibility with existing DTs, which is a no-go.
> Existing DTs _must_ continue to work.
You're right.

I'll keep the existing behavior and only use the reserved-memory region
when it is present, instead of failing the probe.

Also move the check to create_static_process
> 
>> rpmsg probe and fail early if it is missing, so that a misconfigured
>> device tree is caught at probe time instead of at process creation.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>
>> Patch [v10]: https://lore.kernel.org/all/20260716095847.479-1-jianping.li@oss.qualcomm.com/
> 
> All of this should go under the --- line.
Ack, I'll move the version history below the --- line.
> 
>>
>> @@ -2584,12 +2547,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>>   		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>> +
>> +		if (err && domain_id == ADSP_DOMAIN_ID) {
>> +			dev_err(rdev, "missing mandatory remote heap memory-region\n");
>> +			goto err_free_data;
>> +		}
> 
> This is what I mean. This has been working beforehand. It must continue
> to work.
ACK. Will remove the checks in probe and ensure probe can continue to 
execute.
> 
>> +
>>   		if (!err) {
>> +			if (domain_id == ADSP_DOMAIN_ID) {
>> +				data->remote_heap_addr = res.start;
>> +				data->remote_heap_size = resource_size(&res);
>> +			}
> 
> Too much of the spaghetty code. Can we replace all domain checks with
> the functions?
I agree.

I'll look at introducing helper functions describing
the per-domain capabilities instead of open-coding ADSP/SDSP checks
throughout the driver.
> 
>>   			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>>   			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> 

