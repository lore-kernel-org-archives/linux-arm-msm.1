Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B957D236
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888426; cv=none; b=LD1zo5zrZF1GoRZ7TkxoyBecPu5evgl9x/WOfJszNDfsJed10FefgPowPf5LGdPCU+YUNPb5kGnvEtmpPnW1APmXDVooey4vfRmkqDYQTQ5S2w4cMKtVMpt7bsekwCXo1Drjnj5CFcvgCiFZb//pntPeN1S4X0+yHUI8iWDverU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888426; c=relaxed/simple;
	bh=7EuFd8qw+NXi6D8T/yq0hMg8LIndzUrKVacIig9ZqHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjYwjoU1AMYzYV1WSw0zUTvZoo7g3vOn5tAg45neOEG/tsqPakjxT4DgGgmBmRFTAcIcHfk03KStx1UxyocIv8m4I+RUb+W6Co8I3ttuIszSuS0QkqOnj9HMof8tzT5a7UD8a+GGpMulk97JCT9v8ESuvvi1iR4QgKJg35vZNpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAVS/Zp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnpP38aC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAVS/Zp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnpP38aC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fdaip2194414
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 17:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amMF2MvJ98Lc+hlX80B9g6sPIEnWibvTt2OsLDuR2vk=; b=VAVS/Zp2G8+Ynn+Q
	FL77+oMmFU5gJXbrUc1zxBhnxoyi9qMj9fQNzs/h2bgsfBW2SGJrcUMsXchXzu0Y
	XqpUek/2xaFqvRM7bxgsIBuE5YHPSm0Q6taN77YnbCtxuXov/AWUFdNiJ3UTvaaD
	MoGnFRPkL5cIH/kZRMjgF0d8gqI6YVZvaW315GxLRPfWLa99pb6vklhf0s5biJTs
	GWvdtEuJKOnj6vMNvWV/umnMBxCNI/c1UZdqY3swDroHPvbs1BMjhgoN1ltKlDOj
	5TiK3JwkzPczaENb8N3o8Mf2CtBoBEngvMtrWOjo4E9G/HrqRgKcXjMirx72rnSq
	3U6m0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjkshs2gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 17:27:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db050d469fso33324245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788888423; x=1789493223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amMF2MvJ98Lc+hlX80B9g6sPIEnWibvTt2OsLDuR2vk=;
        b=KnpP38aC6/AdSyMq9gsRZYGSgg4j42Wp1R+ipTJIevnMvq5+mtMhFeHdixt89uQ2FH
         PqtVyZLjUzPhHvvpCrZxO8P7Dum38Auylu9u5WgT2XwBQsRylPX7AWqN8Wd4tM+dbhuO
         uGgQXfxgFmIRvxREB/NCkHxpmWuvXy1DlE5tiBWR4bj0yo7TyulEFRmxk+ylN+ahnCy0
         LgAbvWxXSHAMa/RjSy/fR+/vt+0M93L7iwEf6y0yJP9Fqku7jCleVdU/wbJukIWjMuyf
         elBE7So3m2FHN41MnJcCElu2HmVLyTJOKauS57yzn7/cTyxGPALMzP7me70SnsPUlP3x
         T6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888423; x=1789493223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amMF2MvJ98Lc+hlX80B9g6sPIEnWibvTt2OsLDuR2vk=;
        b=o4zp4ti/GdR7l1brCEpE/W53TnAVCnnSJu8zu+ogZMc439LsXn2UzN7dGq6rvmGxal
         0Jbe1noEkUiuCzdHwkXiA6OByyYevyfhoWBmznPUcQSbl7FKK0f1ZjmBeEhGb61YmjQe
         q792lqNCxLOf0gvOmA+ocglWK4lTU0HvsSeZgunAHm2dOV/ki47YE8viWS7AonxQrMBA
         7rkuKgEw8AQ/G4zSGnPw8JP8NDpbPY1ynhcwWiCVlOLG204odsdOrPgEbHVk/QyeP1Hw
         KxxZRdFL8KmMgJ5uGSihJSPDf3nTcWsmCodonkL3N9L4k1nrLZoy648qUKRsicQ9l1Wp
         XRQA==
X-Forwarded-Encrypted: i=1; AKwUvBz3GMH+MpvsZz4Bh7KoZN/O9q8y3vCzFsX2EFQxm+7bQ7Aw4/KJf+AJjZTJ6WdN9a22UWaI4vmeS0AdElc/@vger.kernel.org
X-Gm-Message-State: AFuF++nyi8utJKFSFMYYK3Yj3bO2dlOb6vXNXu/NL8LEnjkYJZt4r/pk
	EP9mLBR1l3TEE0bPO3TCiYBkeps5qXJnggI9egXehSm7H40xx6mAKoyuN+R/MAF3irU70c5S+KR
	fXnjRxss+BqOcfEOOYwT9Eoh9wUQzQ9jVYrYapVQsPwvDMsVus6Dlsk108AOP4xahRSGh
X-Gm-Gg: AYBFou25WhMO3Mxzmv5NraHpgmW98DFZuGwHr6HIpKGR//kCi8gRUqZqsbHCprobtFE
	j7wObPud2rbczpdhxi1UdRfULd/IbMYfEWWSXGVMUuwzQohF+NGsgVglEKlhVwrt7j4JJGr43fT
	TF5Q2QWmXWHHvVm7Y78JofEpmDNFn8GcdNFOGWe0WVpPN5VievGJEQQchzaZxPlH2dGSa2UwuVO
	d3cFiTFK6ZtCdneNkj5wTf+2BEPWNkki58pOR4wfrPK9D85ldq5ANP+LvZOsKRRNVl8bUjCTyml
	oUWT6cQa8SZ7rjHPi/rsMIfbQo9+ap3AOr2ebCrqWxI/xwhg8HzWNmLDxvEh+qOPV/xWkETUGeD
	t/7FlLm+IhRsky3zDMfVEhJr4VHtb5A==
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr41175731a91.4.1788888423314;
        Tue, 08 Sep 2026 10:27:03 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr41175692a91.4.1788888422812;
        Tue, 08 Sep 2026 10:27:02 -0700 (PDT)
Received: from [192.168.1.6] ([223.184.127.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm57765170c88.4.2026.09.08.10.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 10:27:02 -0700 (PDT)
Message-ID: <5ac58cd1-2ef7-4ce9-bf97-dc120ddb9f20@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 22:56:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <006617c6-e3b0-4a3b-85e5-6b5af8f11879@kernel.org>
 <51413da4-eed6-4251-b2eb-5d2ad8cb36ec@oss.qualcomm.com>
 <c97d0871-0c89-4590-9ad3-4d3859d0522a@kernel.org>
 <23d6166f-50f7-4d23-a700-ab738c1e872f@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <23d6166f-50f7-4d23-a700-ab738c1e872f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4OSBTYWx0ZWRfX97eHHdNkvhJU
 QfodzNYGJXJ65c0m/9Wm2iFw2ahfEnxXC/NmR1Ztd6Gy/1hHqgk1XkPCJ35VNvnAq5DdGQ8pU9m
 JVtNF2p/5hsUVnJzY+/Inla2ty12YLw=
X-Proofpoint-ORIG-GUID: jP2TN_uRwUTe413ipxEsAVI7DGufZ8u2
X-Authority-Analysis: v=2.4 cv=TammcxQh c=1 sm=1 tr=0 ts=6aa04568 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=66SLN7faITJN3pPvMqR9OA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=jJ3HrK66ljBcDBb3hHsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jP2TN_uRwUTe413ipxEsAVI7DGufZ8u2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4OSBTYWx0ZWRfX1K2F8gvoxS7J
 6FPgh5+oMkjZ2FfqaVvBb+iENTEj20FPWyrkstr5YDASbsMwAee23Fs3YfDA4c39lEC8SFaWAvG
 IHM44IyAo0MvOYjDsPSzp3xdi1uiMzPlhcuhsExhKnJlAXngXg8qv44v3yOAlRSPf6cyQAUEfhB
 YfX+0B8yj+ptw6V6aNEpBatEfn6ElLIljfGY4yKyJxCmt69W6b7Xg20Z88ZCqU0t87Am+nY5dPc
 Exm+fZ5TXxO9nTt1G0XeNiHxSFlXhOb8LAidNftoI6g2+arattJncprfeqn5JgRcGpZK/sNiA8l
 3kQSFmAPgxLCRS0J39QyZQBybtnHSLrEoDzZXmA8f9rOOW008r8rK+FiUifw/mJPGvLy2MFIByV
 l03M7F93poIby6R+eVbtsjMOi9a8SbvTYExT6DNlkLtL+n4CgTTlrXBw7Cg2QLU0KvK7/lxwUy2
 k9SNt0ByBK1QXOUrisg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080189

>>>>>    
>>>>>    properties:
>>>>>      compatible:
>>>>> @@ -20,9 +28,42 @@ properties:
>>>>>        minItems: 1
>>>>>        maxItems: 2
>>>>
>>>> As I said last time, different hardware, different programming
>>>> interface, different features, so a different compatible.
>>>
>>>
>>> The APM DAI block is the same packet format.  The driver uses a single
>>> of_device_id entry with no match data; there is no code path dispatched
>>> by the compatible string.
>>>
>>> The iommu vs VMID distinction is a property of the memory topology,
>>> not the DAI hardware, and is already described by the mutually exclusive
>>> iommus / qcom,vmids properties.  The DSP identity (ADSP vs mDSP) is
>>> carried by the GPR node's qcom,domain property and read at the send
>>> layer — the DAI node itself does not need to know which DSP it talks to.
>>
>> I am still trying to grasp it. You have a device "APM" and it accesses
>> PCM buffers or other memory in some way needing IOMMU for that.
>>
>> Now you add something which you call EXACTLY the same device, no
>> difference at all, same "APM", but this time this device operates
>> completely different, because it does not use IOMMU, but talks with
>> firmware via SCM.
>>
>> Well, I really do not see how is this still exactly the same or even
>> compatible device.
>>
>> The way device accesses its data is part of the programming model and
>> different programming models have different compatibles.
> 
> 
> Additionally, as explained to me in off-list channel, the qcom,vmids is
> not a hardware property at all (because hardware is the same), thus does
> not look suitable for DT.
>

I understand the concern. The qcom,vmids property describes which 
Virtual machines the SoC firmware has configured to own the memory space 
on a given board. similar to how iommus describes which SMMU the device 
is wired to.

There is existing precedent for this in the tree:

- fastrpc (Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml) 
uses qcom,vmids to describe remote processor VMIDs. The driver reads 
them from DT and calls qcom_scm_assign_mem(). The compatible stays 
generic (qcom,fastrpc).

- rmtfs-mem 
(Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml) 
uses qcom,vmid the same way with a single generic compatible 
(qcom,rmtfs-mem).

We are following the same pattern here. Happy to discuss further if you 
see a difference between these cases and ours.

Thanks & Regards
Ajay Kumar Nandam
> Best regards,
> Krzysztof

