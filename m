Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3838D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 00:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331475; cv=none; b=sx+eE4jd6znYpOr56wgH6Q/Pb81vfdWd9IHR4xXULRUc5B/hkwvCA5EQ3Tdotq7XrUXqqjGrcZq//8gQ+Fr4IP93syDTzVM0GpQVBYG+3c1ZCIm3XnbYrCbMwCoi8XdroOCkHz3Y0o3KdNdI86xguJbkU98MVhmhX+pjdFKIY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331475; c=relaxed/simple;
	bh=VO4HprmEH26bPDpYKpkRUcTkm48LKb/lQGoubvhwlB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9k+30diHxU00JEqTGti0vhsmv79xl7zfuDvAslxerMisDqAyxLr3h60wnJ2Xw8CKZgv893K4Ob7Q3xEykJIlp6979epOP2GLgMZVJC1jTO/fcwznSQdLKrqxd34nXJFsZ3M6JLNXjYnuIbHCZ6zEuNX625zE8+tblYQbIA0Q9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tas6yyzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyN5PF8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tas6yyzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyN5PF8V"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LekPZ592039
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 00:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3JSQSkvd1It0UiMktc5j45ZpdPQLK3YDm6tjbqw98c=; b=Tas6yyzWLItqucKS
	dl8jKUO4sIMPfRmjsoIwJHH65AtlbBDNF38QAKrvnnYDFYDVUBumtF5eBNxc8jXW
	bYI5kMo5syUPyHzMdl7XUOCWMqPwhXIYl0WJzs8c38bj6jx2pmYgztfoUkpnEoca
	QddmSkahpwP06C0ciybD+Fj25oizt/IXikLsx+T/ELm37UQ1ZXoAJLSVgRJofKT3
	IbeKzchhTCEN2yNXdFgxeSzGhSO19G4mzz+TG9LCEEjMWFDUlEyoi+IBZ23FaDQ1
	pC9zhRkxANkzOhYDAPbmlpSdwyv7UDR/sJgO7yCmdQX3BlDIJ0tAb4JKBZ9kWGxk
	832VfQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4y91k13m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:04:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so6887375c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791331473; x=1791936273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3JSQSkvd1It0UiMktc5j45ZpdPQLK3YDm6tjbqw98c=;
        b=CyN5PF8VMmFbBQynS3zvjyKCgnVwSauX26mLPNOj+EqDzW85X81dT3pyetJcAO+Vwb
         z+xEsElO+Aey9mtMSvQGl8WMQlR3ueRXPm7puM/L74f1iuKqs4tIR2Atac8+ZkDVdeqc
         0lbam0f/qDPCCnvSmwMTnd9DBoiRDaublI+i0Ox59M7dtqqYMcMw+13d8/BtePrxLwuB
         4fUwTTZov0/o+5eUjReYeOXFjjXoPjHu+fJV2shcj45+hV0a22kPLOnXlX5H+/iY7gtN
         pFWFSr71m7u5JUFQhkYUAFKZnexPgM5ef9CdsDMjetlCrStyuWTXqn8GaPF+OjAl08o5
         w4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331473; x=1791936273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3JSQSkvd1It0UiMktc5j45ZpdPQLK3YDm6tjbqw98c=;
        b=1c6ySFV68o8fJixkeUJc4OLkfD0AlsJVQUbYFsSG5WUZZuL14pXRgLmuY+2mxZx8C+
         /0fHfr8jQnos8eOxpFbyKQhX0omzPmX929EfjH2bWzOkq4leFR1i2zRPq/vyOpXkU4+o
         8yTzJJZa5hBeLAuls6QnGlqdDKGC+0eZILVE7s45eZJfMTPuar0dxinSTQJ1x1AUdQq9
         3YWhJyLq03jav7ohmpQSzKXZmAgPuB77NqjcQwzmXJmZlxWxzwGt2RyVQOwqiOuOb2IM
         jjvMv1UUpNnELzxIrqRDs08wE7oR1o/bTXKgRyMgOqTRchdowE5PxHhktqMNc+2XzsRQ
         +frQ==
X-Forwarded-Encrypted: i=1; AKwUvBzujh039Tws3HNskFbaULzLn7jkF187cijZDzNeIfhZ2nk9t7fr3fqYhJKEsaSlVkbRSAmxftcHzc4kHt8x@vger.kernel.org
X-Gm-Message-State: AFuF++nKsrCu/vJpclZG4H/wz+ZH3lqUXnVkUD1oSSEmK/GWUNloCue6
	0fidsFW79e8+CsYS4y+VEAHyWeJMksuAI4JkuogkNJIpaERUL6kA/4oUTHkxUHkXc3inYh5jrxH
	PVB2mxO6fYqCRaIF9Eh/y9P6n30MtEB6qhTcNoui6/ZCJR84YiZra/oyuMWb0yQkzfam3
X-Gm-Gg: AYBFou0igSNaDN/kilFMceTCxHFjhsoXT9V+WwPF+BVDr9LM3rqH5uskMrm/rkxVfBm
	tZbsKj/m/NkfcGKfa6DvglJCGPo/ycrKlvrXZx0wsbrpsb055QEdqmXEEwXU+1EzBmQmezKdvUW
	1fioLjInf6naiGXn78kPqBirVzEGg3OIReC6OMv3sYYqCs9hHIAJNZDVQb+0qo/594EnJ0VEXnA
	ua+nCA0nwer0wQ/Ss3gGHWJfFKoiNJv4pFJLlGCT8wqMc71cnzqDPSQJ/qbL2OIFACvjgsYZtAb
	1q+PcmnrJh8YW1q3vWJ1QrFfEQu8dSFrTI2WTBq0n5bz2i4zzomQq3tuPpWOT0q7cPdQx1fQ0/z
	pZknXcEG534eGyXp+Nuj8KOf0G5uuIt65iVSjCU+ES+rCZ/PZJyMdDfKyvqtz99c=
X-Received: by 2002:a05:7022:225:b0:148:8aa2:91e2 with SMTP id a92af1059eb24-16207d7ca8bmr589425c88.38.1791331472068;
        Tue, 06 Oct 2026 17:04:32 -0700 (PDT)
X-Received: by 2002:a05:7022:225:b0:148:8aa2:91e2 with SMTP id a92af1059eb24-16207d7ca8bmr589063c88.38.1791331465559;
        Tue, 06 Oct 2026 17:04:25 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm1995815c88.4.2026.10.06.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:04:24 -0700 (PDT)
Message-ID: <27eafbb4-22cf-4706-b551-34c0c8d30ae2@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:04:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, minchan@kernel.org,
        axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll> <ar4070oH8lRCJMRw@google.com>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <ar4070oH8lRCJMRw@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX3L0NZqZ+3fXx
 OXicdICD/ysHMHPzKSfn5cDITX6PAhsUvCX8o2gEh/qNOV3KJ3zlmxxbqkyKxlALpU97RFvWEdx
 vboTJl2GIgJId5ekFoNQw0/FRl3HBYI=
X-Authority-Analysis: v=2.4 cv=Ho/jiETS c=1 sm=1 tr=0 ts=6ac58c91 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UI1gRxWom6vz8qzGwdkA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX0nJF+zvdcCjG
 3Y6mmmPtqCimKs3i8aj4fUie0rqFyEjdfY8yHQxaa/8a3uDFqG6oqzyGu4ie1VRU8ysXB5M0a79
 IQc24PE3G/d6EWpURcNe5CXTpXoU/Kwte1pmgndimuWDNROU6/gIjkYEnhuaxLY+P3d8mrvz5Ix
 6jrENO03ZwRRSoHar9+6GGGkCT5SjOEMuGPXJ/WRnq8Am/asoGpLFJRdLIyfhOvyf7RJMwcJ5dH
 J2u5TdTDWqTyTdCNmopG+o4nXFUqWt84yZZD1bHvHrFXz2/kSCzm/tcB1MlyJL9odIpn+a8Chrd
 +JttDx+Oz1HrD6Phh/uDElvfb+Hic1J7deGsWTPCBv/p2RFwCm+rw/hzdx/CcXUXtu3p2hGfAn4
 rEEsLE5yvkpJaX371IMeF7gDSiR6scFJEgg/U/Gtp0DKmBHN+pO1O8+axDyYO1AdjKQWUf62cvH
 wXKAmV2wFikPGdz6yGQ==
X-Proofpoint-ORIG-GUID: zFzH9AF7F6Icxn-akKRu5uh1nSuZ_zk3
X-Proofpoint-GUID: zFzH9AF7F6Icxn-akKRu5uh1nSuZ_zk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060095

On 10/1/2026 3:27 AM, Sergey Senozhatsky wrote:
> On (26/10/01 10:51), Krzysztof Kozlowski wrote:
>> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>>> QPaCE driver is available.
>>>
>>> Compress and decompress operations are handled via the QPaCE urgent
>>> synchronous path: each request DMA-maps the source and destination
>>> buffers, issues a blocking hardware command, and returns the result size.
>>>
>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>> ---
>>>   drivers/block/zram/Kconfig         |  11 +++
>>>   drivers/block/zram/Makefile        |   1 +
>>>   drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
>>
>> So entire qpace should go here, no? Why did you create this entire layer
>> of indirection, singleton management under drivers/soc?
> 
> qpace seems to be standalone/independent arch/soc specific, and can gain
> users outside of zram (fs compression, zswap, etc.).  zram's backends
> potentially can disappear all together, if we switch to acomp crypto API.

ACK

Thanks,
Oreoluwa
