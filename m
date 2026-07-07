Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B393F39F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421743; cv=none; b=b24Dfjzh/lPjBxiPifwkrRqoAx80sr+qFOaRY/gIH1ZY1tDZ3ZwKUaJN/ndvD59TeY5Hy7oxRaraiPyu34ZDOqfx48laWs+nnimnklTSdPYOIxOgY2J+1bverDiMjuAqevIFEjgiN4lPENuXIUslsXdW6vymQoSdK7ogZydJeyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421743; c=relaxed/simple;
	bh=/DSzcQElKq0mXa69/IQkZJAYGGmhD2CvPP4Qx3Y+EQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pofQGq8yj9sNLVrQCbp/dBGDrwQRsz4Jn8IL4ebqSeFE2qLCZ+g0Za2T7hoz1LCf+bvOHtFz0Z33JCQRG1XlEbeosdAel6AUrNMg9IusP1bI/hP0+SyMZrv7NG6/qab6GRBRcMcBjDRwlZ4ZEWIlmHTQdhwrJxecprsFK0geMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKdt/hnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vyi7DSsv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKdt/hnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vyi7DSsv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E4cT3004578
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPBAMksDVcTI0m93auLHoJ+VLwr7IoZUpwRRiS+q4QQ=; b=UKdt/hnUw4wLiLyV
	rpR/b9LZuITz9EXW/XgjtIbztvV5+dx9hqmObpB+DeC8aAEBhnFbEF+Eso77odbS
	TQf7Hmo8xbqd0xpFLVMsA1KfhOCHWcF8vQjb+S5CSLI1VcS0MQB7yChWQ/3B2cte
	BmB461TsnbM/bkp28ofoKorctAwAn5/X8AxsegGflq4qzs4uJthSwiveLHm1tXOO
	h7V2pa3VOh8l3j9IffGr9vOVOcaAJuKK0MhHGZOWaXOpaRVcNBhGTWMeN5FIKjJr
	pAdGwiQhxPEaJlu23ownx43hoha4M3AaAQAu+LOykUuYydPkQOWPsgg0wd+5xB0e
	LOUQZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su71k2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:55:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso55008281cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783421739; x=1784026539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPBAMksDVcTI0m93auLHoJ+VLwr7IoZUpwRRiS+q4QQ=;
        b=Vyi7DSsvpqo2iqSwq2ENcHBCHVYwoLH+AAITqyegwdR9PmfOC8iwMSyTCFcmt6RZn9
         uzBo0aoEGVkCXtiC8ICYiWQDdOhKNmsvASYEnqkBp5+VZDiECSS2LIhyCNvrMAh/jVch
         qlDmB7VJQm94E7aZg1q8NmJdhS6LjDfW4mtO30n8nxWHcRRk/SLyuvTNot9ZPtN/i181
         PK1TsP0tISiB3JQ5ghHvoQF3NWtlMBLAkkQkbUQYhtXNaPvHXCi7XjNqggg5hGR048as
         yOgIQJIQiK3u8I8rIz/H/FZbvFSqYma2291QGaEqAji/arnR+UTx12d61exowoDjLcSe
         7G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421739; x=1784026539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPBAMksDVcTI0m93auLHoJ+VLwr7IoZUpwRRiS+q4QQ=;
        b=bZ2VX6XJ3wR0pHVoEOE/HePezgfXUEEBnE9Rvx1uHF3nqkQMMIcZJ9B+ORshg+86U1
         z+UQE/TxPDsifC+Eb95rSFvUgR5KA6bGEE4jmJ9DyLOYprd698j3upd7yDh1kmqziT1h
         n1kuMoGsJfBVlU8Tgpy7xyc80jvcQpbOvCnL7jBfKhbTNoUj3y4oGRnx4vG6qyB24ppb
         +nU6B61Kcu14Q8EMi/E2BAoVfJi0WgeszzYac/w7ETAWUfNbtHp/Q6yxSNGLlxzY3dvw
         2e8yBfp5/yZ3OJ9rcvpV/tH3++HegQTvgwug6euBXvXxqOD2o15xhc6DzjBR4VxgsnjZ
         qNhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1EV3xYM79kTLm/JzJqS+6yCCWfP1wwLV9SZuGcorZO36/8III6LeALZtwxQQ0X3Lsj4uPcXafsZSFKqn9@vger.kernel.org
X-Gm-Message-State: AOJu0YwpU9kE0GNLzCLqw3OP3VteFxvcLncWOxGrLnobQ87XDWkJH4Cu
	ntoTSQ2nfoXEPxBu4DOLwkrZ7p30T354BrHkBgSnvqz7B1VtQqtAbbby0xS5FDJUxDj6NMPLwI0
	qW55qyQnBKRlIOtUklGb8ms08VNsfX3MPCpc3yMAnpUmE6AYEEglkQ3J+WF7XDKtt4aPg
X-Gm-Gg: AfdE7ckY/yn6Z0eThA9Bkw0EDeoSB3wlasOjSgK0FI3S9I5woxDPjXn1CACdY3yiPeu
	YX1z5mqHWYXf5kPVwiZZCnsrXSv+KplG4OtHv68XYQZXztDhXC9duAYZp7NjZ0WClV6M7jQMVQD
	fPFu2ZEwaXbpjfSWN9sIrPvmaHt3+MFFFCnnXF7Pvv0O5EXHSBzA6RUN4LDIpH6wF4G6n8Csv01
	N/AsYBBkvcpnQdDQAtCIVUgouQBUcq9Lsjc4wJQiB2yEPqb/XCtm2ky9CDXr509eWm7AQfb27ol
	gS9nrPFF/NjuekDw54uu0we5PQ/xNxADTJUdNe5p/Mnj3PGHVW+s5tNGlx+hYZJ3OAkpmQ26cDx
	vGbBci28FF2do0tDJfskAPYJ1chaA73h+NdNUVJyXE4OBVGLKisjzaCI0qWwPpr6DQJQr1/daEE
	Lm+kv5wKA=
X-Received: by 2002:ac8:5d8e:0:b0:519:8998:661b with SMTP id d75a77b69052e-51c747bb756mr47970161cf.20.1783421738660;
        Tue, 07 Jul 2026 03:55:38 -0700 (PDT)
X-Received: by 2002:ac8:5d8e:0:b0:519:8998:661b with SMTP id d75a77b69052e-51c747bb756mr47969931cf.20.1783421738054;
        Tue, 07 Jul 2026 03:55:38 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm3346466b.6.2026.07.07.03.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:55:37 -0700 (PDT)
Message-ID: <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 13:55:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwNSBTYWx0ZWRfX6OSOiXmQP8EX
 QNpKRmO8lzk9kQXM8IngkV+rs71tYZWUFoak1K1QSxK4DrTx8IHLmMxJ5QLa+djRSe4ehaLE/Qj
 hvJZyctrwXYYm5zhdsgKSqAvmARccYxlyjWYuJLOH+MCyPPHM1RKzcHIG9qJEBPciXmUCmvWJ1e
 rdgO194fSCL1zpMnNvrfnt55gGUM50zLzd5RpLQKsoFitbst9cQIN9aM/joCBuDyjv8XoRMaWbV
 vnWDeXIBc6QysM3DlqYjzi2Ux83Ef+1fqfBrSmhfaV4nqtxRuSGHhJbSmcPvKL0puviY3CxGOFe
 xdZ3F3bpNYoOQDFQf9BnIn8zGxp1ZI9MeBxHb1V30gsFz3aBhWdxvV5MQmr0z1OYtvhljZrtzr9
 9rur7NEyG5PQ8exTqYkuoHHIpyPJtR8x9c3g5eXE16ltXAoU9FfXZX6iH+/mUs+v0tsG5TKM1CV
 o7RcfiUn9A+uxhEpaJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwNSBTYWx0ZWRfXx63NkWkk4AHH
 BPYMhtO+pNYwpr5TiIlxBr1q3ktLv+VpSlE/m+oxY54xRjv0RntGlD3q1yR5FX8OYoCLUxczB2W
 v5wQkkQ19VczwpRiV+et3V6uAAKM1y0=
X-Proofpoint-GUID: BdxQfjAw55YTwXcSjmXH4lYLgjaj6kJI
X-Proofpoint-ORIG-GUID: BdxQfjAw55YTwXcSjmXH4lYLgjaj6kJI
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cdb2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=g6G2TVJU6GBlO6KxhuQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070105

Hi Vladimir, Bryan,

On 7/6/2026 3:00 PM, Vladimir Zapolskiy wrote:
> On 7/6/26 13:12, Bryan O'Donoghue wrote:
>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>> Note: The handling of shared camera subsystem resources (power domains,
>>> interconnects) for child IP blocks is still an open design question.
>>
>> Why ?
>>
>> A device needs to vote on its own interconnect and power-domains on any
>> bus. A sub-device of another device may wish to ramp a clock for
>> whatever reason.
>
> Certainly a CAMSS device will vote on all needed to it resources, some of
> which are shared and got their description under CAMSS device tree node.
>
>> There is no "master" device in this block of devices - save perhaps for
>> the CSID mux / wrappers on some of these parts.
>>
>> We have shared resources like camera noc, system noc and external 
>> clocks.
>>
>> Please include power-domains and interconnects.
>>
>
> Why? The common power domain and interconnects have already been
> described as resources of the parent CAMSS device, there is no need
> to duplicate descriptions in every child device tree node of CAMSS.
>
The initial patch and work for JPEG was as independent driver.  I agree 
from hw perspective it is

part of CAMSS subsystem and maybe from design perspective proper way is 
to be child node not of the CAMSS.

However the resources shared by both can be abstracted in other 
frameworks, example ICC voting allows to have shared

clocks which can have policy to keep the higher rate and satisfy both of 
the HW's.

So maybe it need to be decided:

Do we want really additional logic for handling CAMSS resource of the 
CAMMS sub-devices by the CAMSS driver and create separate CAMSS API,s

or we can use existing fw's for that. ICC, clock, OPP which all allow 
sharing of the resources. Also there are cases where CAMSS and

is not needed but JPEG encoder is: Example RTSP streaming or UVC 
streaming which require jpeg encoder.

Anyways my opinion:

1. CAMSS is not prepared and not ready to handle child devices, only the 
populate child nodes is not enough. I think it is little bit mess,

some of the HW;s CSID, IFE etc are instantiated directly from CAMSS and 
jpeg and Ope are described as child nodes.

2. Jpeg on its own currently does not have any dependency with CAMSS 
driver code. It can use shared resources without issue and leave

the ICC, clock and other frameworks to do the job.

Also i dont see the reason to mix the both works. Lets have it jpeg as 
separate independend driver and the create series and rework CAMSS

to child nodes and move all existing sub-devices as child nodes, and 
then move the jpeg and Ope.

Regards,

~Gjorgji



