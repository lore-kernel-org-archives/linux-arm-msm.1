Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437285;
	b=zGVY4TPT9e5d8+eNLxCYFCGb6rOf260UzfqXo8VpAb1mIqKKmFU3VtoFNZSYVAKI3GKd
	 SOE6vl8/GMgIecrvitzzfbKjQB9ZFyJOJDUTDA3m4zjbAt2hfqXSASvuog3FaTV9ntamG
	 CrAhUkG6hSltyQcEpHE797kzsuKxOn46n6eDUBSBUM3DXgnF5dz4tc2E1Y60AgfwWsVtl
	 Aee8nXn3kE5tHu5QlOyrBE9Ajj59IGTwcpOF6xlv6vAUyMkfz9v50wQUjG8ziqzuHJkft
	 +8uTTdPdfTWSPo2keBBLk8H7mcT1wg/OtHQFfAxeIaKI+dN0Dbju9RsZzT6U3KehMPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
	b=CHC3dha4aOJPwfTj8jA3d77ALeOdJxyyCAHiGJoPweRnIGUFO/z8I6Bw9mKVMFK/y1xP
	 jI0ASNyA89Cr3OafNrXGOBKLLaAAGPVWkzgcT1GyiPWS4kp56bgU1GfyYJ8iWRUDvYg8r
	 aQYpAYD6A7Hzhj7kJYvt64CoBE3NqipwC547MMG9zJ/sdrwRWcodsd+hvGZy7t/5Ja2+J
	 aGP9sQvAbXgOreRkQNCVfU33uFaTnAfzklOcEtyVOps2Db9xMOUoH7KkP9NHam7WE7Y8r
	 r8T195Mel2iPkWh6fHmTdkWMwVI5dBTr3cYe+wCUsN39RvHlCylkpDoQ4j3oBe7Rl1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAlWEAIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvYIAkT6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297A606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E297A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAlWEAIt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvYIAkT6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFvir1794792
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=; b=eAlWEAItlWqboMBz
	ciU3eY1E/tLoITK5Te7/rhaxnoqWgCcZjMOp7WX82wKy7MBaPcgxEmujxuAVNEMo
	nPUFTP5zeEkMwZb0z96CfZjgvWpjrq8CZUROIvviR8b3jdS5o8+xqNHv/92bTb4Z
	Ieeh9bp/p+Mobxs4G5duNUn8oBNjFv7wJYMzgvLHnZZc30YNioaXnmVaW/Ryhoz9
	U8GEIDX8/smIoUa9xwM5ACaKGUl5QzDevUAtsSsXDgAWC/2ypMvkJC4j3xgw2+3A
	rxnFTAO1U8CAJ+J6vOZ+JNgmBnDUHDNWv67ZstdjJ/ivR7k5z1YqPw4lyiW6xKGf
	XMjcfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx1jvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so651025185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795437283; x=1796042083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
        b=AvYIAkT6EmvKa84bvblmRoqN2zEXnr5evixmbno3916dFKkFtnZFuECgsbcnpbQGuw
         Wm4IwMIHWiTxZgeCCB7NM2fNakAjRlnALskG0pZgfDNmHqk2YdyskB1oQ7H3PfmxIKKE
         S/RCjLqhv0UvG+TgLNv7MPFc2sADFJjXZVlRgEt90Lx6uo4D4Z37Bs1+i0+mYXPc/ZnE
         YSrnLcNkM/BoHefdmRLVd6EFgS7uiHpi3KpQdpAleLu99qQ1yMbaKhl+SlGkLJ3KFGVI
         pHlj8KT0GIQFqP4PyzpebchhIXyWOajysiVqAVJSHkSl4c0lQRPe+TbgJfzznO334Sa9
         AcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437283; x=1796042083;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLuT8GLe4HwTCpvjQP/m+EwaJaKw1kg2kVuZ2QUXpM0=;
        b=W/7stcOKPfrv3Aiu7UU+UAQaHHFPyj6NqzN9pJP6zFP76E1upNyMBKUOLRtbP44xs9
         3+b2FM7Vzs5rs/wFarBX6byManbw41d87eQNCiozHxFxCi81Ji4avJ2+81sSEF5m76kO
         8nx21q5vZCO/KLVylzDi8dkAO2psB93MaixdVhqSBPrzfqN1Wot9FrNhXFCCgEHq0Aa8
         GHhjuloKSDFZJU9Zr9z6kGyEjcb/KltZTPj+ZddvgOBJMsHVQxpQO5jDHXCbgAyrFFyK
         cpjU81BjXGvIyMjsncsZE0xhK4U0s2ftwsH/n3/MlnyaLhOsQjlHbtQDYdNWg52HnMYV
         OAvA==
X-Forwarded-Encrypted: i=1; AL+hErF7xRvzBxHaUN7gZO6aOwWRkHeG1MwiFOqZMLAUsN6z/Z65F1RWL85tbnk8eoIPxup3CF7+lKCMQyQ9Tp3o@vger.kernel.org
X-Gm-Message-State: APuU4Z/3aIQ5GrpVbn5EUPYQ5qETgxeVTTUQEB8NVJ4WI/Z2paF1pIPn
	3JFmij+T/BtjD7RVhz5vzX9DGolwAiM2HL7jnMlEFsrasyGd8bpQPspYUcr5KPKW05n3Iu7RSgf
	RF+8GNQSNsicwWEB9qrLzM9KdbP2spM0r7+7aEGrUGkUa400VAPrPs4g9OgiDtzeSA3PKz6JJki
	l0
X-Gm-Gg: AZFdTZdMOFsdFYFMRpzfF/VV7PAA2TWdmCNceJ5pVnOIK9/TaSq7Z4vWzv0r43WanV7
	evxRHo0XqbehHSJssuQbFDLcGyHOvhNiF9zv0YiR6rScL5PGY/onB79G41/pS+inVrhCNCojLhp
	JpNqh2ldpyQDxOfpG2dvZKn0SjBk8z1uAnXXFPraDMBCZpSOkMZS8tlObp8bz+YECtagKaaDRGQ
	uV6w7x65yJTtnGzEivwI9zON2FnuPXtx+1ydQqA/neXbUl7ZJ4a7hLyL+514r3ERLFPZxGyW8l9
	i52urYvtXfkCqGFGaesIpy/OQFzxCzHCKIP7YgGGRnhREnG2sMJYByKhAsYdviDyplhKYYCCAXD
	VUuCS+2gTFBxNtTn3GZ220wT91MkpcM9zdHl+bK3K4ARA8+g+tdka3VAWK86HhVooKp5LcZxVTy
	mnIA==
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1754286585a.5.1795437283004;
        Mon, 23 Nov 2026 04:34:43 -0800 (PST)
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1754280885a.5.1795437282514;
        Mon, 23 Nov 2026 04:34:42 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm542505485e9.14.2026.11.23.04.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:34:41 -0800 (PST)
Message-ID: <2ce99966-6813-47a6-8d0d-11f3f6f2f2f6@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:34:40 +0000
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
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
 <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
 <asCxoMbtsSfVcX_9@parshuram>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <asCxoMbtsSfVcX_9@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0432e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=TNgizOjfnv4wsRTjD10A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YPeB2l1ZuKAFa_MmpgTPb1Xqt0lBl1yb
X-Proofpoint-GUID: YPeB2l1ZuKAFa_MmpgTPb1Xqt0lBl1yb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX6HRD+TzKHVPI
 Jerosdvl5eBjsVnGdp8oVdytmovNyYAC1FMpWZDepGwYMNYQHbAkTBGWGg6EBs+murkjM8YX8nG
 vmKa5BeTDNI1FXbVYWTj5uw8JE1/nRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX54Z3aO73+Ago
 ertEHOuDuuflDGIG2+UkwwFCLgEa2ZSKwKsb55+DYkMVoMO4NQpZ4b7fz8mbtpg3Bmqo6SIdTV9
 uT2JqCg456r2s5dJZPCjus4W/cUVxOKpqooDhbCm47YXTV8LuqpuM34yB6181hAvA6+yFfxWmLG
 3hYqmhgSsDHKcavhLAozO+CvDVu1R5hoWn6xg4A08E1xuygQKvEf4rqeGKef0VegDkHG2KCzpel
 /9ibVCwPYqGerDBBcbt6B38WI5C41S6iCWtnJzKMed729RWYXPbw82xsYmVQ2I0PhJet/OmC2s8
 iwHz7Akvrm8y69CMEwcpLKMfb7uYNPWHrULDWZBdyfTtOkrQmU9aR2/Jp90hiFaPpWRZnX8wzm0
 k2HndfX4pqxttFkYq1zhvEdpF3EO4+uVoVgGR2DQSYyhpDRLFEaTmVWjjW17mPaFcE32+zsIkpc
 5dxi+0RXRABARs4GBPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230049

On 10/3/26 8:41 AM, Vinod Koul wrote:
> On 01-10-26, 12:06, Srinivas Kandagatla wrote:
>>
>>
>> On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
>>>
>>>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>>>  	const unsigned int *reg_layout;
>>>>  	void __iomem *mmio;
>>>>  	struct reset_control *audio_cgcr;
>>>> +	u8 num_lanes;
>>>> +	bool is_dependent;
>>>> +	struct qcom_swrm_ctrl *peer_ctrl;
>>>> +	u8 peer_first_lane;
>>>> +	u8 num_peer_lanes;
>>>> +	bool is_primary;
>>>> +	u32 peer_dpn_offset;
>>>
>>> nit-pick: do you need both is_dependent and is_primary? One would think
>>> that a single variable would be enough, no?
>> I did try to do that which made the code bit confusing to read.
> 
> I am viewing it that both should be set always for this mode. Do you
> have a case where it wont be the case..?
these are mutually exclusive, will add an enum with in v3 along with
role member.

> 
>>> also without context it's hard to understand if lanes are independent in
>>> terms of transport or not, not sure what 'peer' means in a multi-master
>>> setup with a primary controller and N dependent ones? Code like this
>> For now its one, but Yes, technically we could have more dependent ones,
>> I wanted to keep the patchset simple and right now the only have one
>> peer and i dont know if we have other setups with more dependent
>> controrllers.
> 
> Lets add the logic when we have such scenarios and keep now for one peer.
> Does Qualcomm roadmap envision more controllers?

There is only one dependent per master that is supported as part of this
series, there is no platform that i am aware of would allow me to test
or support the multiple dependents.

I can add a defensive check to not support multiple dependents if that
helps.

We can always extend this as an when we have that usecase which can be
tested.

--srini
> 
