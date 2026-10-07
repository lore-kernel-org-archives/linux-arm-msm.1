Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77C478E23
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366842; cv=none; b=u2gP/7sDdESxWIvv2zZU2ommJFqMBuJ2unCT9nk4z1FAAS82JcJTAkftQUfRLEcnvmcCoV2LrjOrvDgepvn5wz4aGGcn6rsuRVM80gxF3gAvjqJ2UlboR/2s7IeLiIO8jRhTMVXrEW87LnITUSDivkp9y7S+HkjepRtlW3e9wwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366842; c=relaxed/simple;
	bh=4FILHaW/m3meZucbQysgzno6ZsvSqgHmQpwE8RUeQtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCt8EFMdT3+WP00GYNncriv24aLYrq+haDFZRnJARSfgefFspCvlYfEwiN0BzpHy7k1TKz+Ezi7vTecl46I6iPsXgX+JRd2UdGATpvDOo2s9Y5ACqndlYXo3+K53TUHJ/Q8Dis05YVBWPO9LZCnQByZRttoeFWQDrpjFcMwaPMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGgXZTzC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1UYqLLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGgXZTzC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1UYqLLl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jZDl1873483
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r18vIKWLagSPTg0F2/c9XC5wrThn4+aBw1//HDW0gK4=; b=HGgXZTzCuboNxPFw
	bcuT3p5jRntLG7BTEETbxu5WtY9NcGpN42p0GuekvoBuMUlUZZdrsJYdrjuJqjp6
	J8ydR92t48mDLFevYjgD6s1NlOsSuMcy0PFaOJMFZ5Q6zlM6ZLFSczN+akpOVqJq
	60PTuIGPj8+40xcJvkB1DlOM311TuRANBhyv4XhZ7JW5n/MiuCsqXfUA3aTfyIBH
	lEGCeUDQVvR4vwnmO+pz14z6S3S9kb+T7NbQN5xagbrv7Vb/+YLK3yDBLt1aXFyn
	QXmhuvbKm5/dfoeGUpjYEvU2MdQvJtLGuvS0aYHl5HD1W4HjMs8OApznn9exzPwC
	Nx6hww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8ru70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:53:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc359d9easo621569285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366831; x=1791971631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r18vIKWLagSPTg0F2/c9XC5wrThn4+aBw1//HDW0gK4=;
        b=R1UYqLLlngZp++RNxu/7C1U0KiLBHtEt/UABCmfLM1EZ4Sref9rpXa+WJLZBiwBLeO
         iEvsm+9mkhkLFRersCys4DL1ysoU95UByhb2kkkHpBp9P2gJf+2YKzZBlW5B9uk4LP56
         ADVpPy1LaujFc2auH38bAVlS0IvyFkwWBsAw5OmQkXsoxpdyPuwsJLDegQmS2qvLN+O5
         HPYBtgu8erb/uvAyeWUqMGTOkd9poOL4zv/9V1qsiogrsNQHKcL5RTcdRYHmI/A0sM5d
         GNayrik4Dxi62UVJsDvxYf2JWpu9HRJDGKjJJdASmBp45ULC+tnKQw4oGD8ynUHTk4c4
         zhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366831; x=1791971631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r18vIKWLagSPTg0F2/c9XC5wrThn4+aBw1//HDW0gK4=;
        b=FMBzXoTgDZR2yt7ea3DFIP6kbFDIR3phyM8BtSEKDuQd2JjE3RRJafHWldqBdEW55b
         Vi/VZrKOkPFUjZzmCWxfTNGEDhefGEec5JwNPljHjPFGPnP+MaT7SqgkR1arYBgS8sw3
         8kZAEX+jrXkqsV0PaZdz3miCvURG700guvlt1Opp5nUePIthmH0+WMi9/gLopn2XcWMr
         u1KSqsTs7BQlmk9RbTzBVfWKa7AHox2tH/80CIWsInXXnXSnyyCBAeaPl3xMX47HYYQH
         MIHraADYhpyjOfgQD5FCiG1+VOX4OoUKRYBDm2bw9zIHNEaRTqj143je2HvOGEJMxARV
         eUTg==
X-Forwarded-Encrypted: i=1; AKwUvBydCSZrBCpCe8PH2sWSGn/9o/s7fM+W7e41giNC8pGNKJPAVjTZOKkbpbdEw/SQbET6z6+/3olvRXQlprlI@vger.kernel.org
X-Gm-Message-State: AFuF++kFCmXbtPZB6v85V3Ck40eH09ZGcAq0C354acnLGh4JkeND3OS9
	UNc1jU3Gb3meRG8oOjDP2yWfRjnNecGQXLoIR4ueWmekOO1m0Tk2L250jzZksAXtZAe2255iQST
	PVh7Ldq/reV1nMR9jYTfM9dknVxGnW43p5pUib21fFhgRarakSZaMq3gfci44d/6e4iHe
X-Gm-Gg: AYBFou1X9V0F/1UHcOQ6UdLrqboCqV4ZG9ASAmxxZojjuDv8/zYk+xpow5uoKOUExEo
	+9AJzdmPOUaHeQs4vaVj+faU4ZebRDOygn0tir6qThprUA9e2FWP/onjQPxH/DIJoKRO532AYcJ
	bbglBcQc7VSGdokHFe2Amoe0zork7eXxRwkBfe65AWsSZ451++bWVbGl4Z+0ley7DHY3Eeg34Yd
	dfb+eTr2M6dd4mCOFdeh2e2l8AQzX7LxaAU0GWJuotvTHYwatpXZ9k1tDLFLseIwG7DpCI9JeMg
	RARLM00Hj0dvIuTC4BxClTXRY+v7gscWF+yRzTS/7wGSZbo+yulL+x4iPn5eNs+wmhHGkgng0l5
	doze3DeobNIMAOtohV1TmaO6Fg/0l4u4ZgPkmtSJf
X-Received: by 2002:a05:620a:2790:b0:93e:7192:191c with SMTP id af79cd13be357-93e9b700bd5mr333153285a.17.1791366830946;
        Wed, 07 Oct 2026 02:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2790:b0:93e:7192:191c with SMTP id af79cd13be357-93e9b700bd5mr333148085a.17.1791366830419;
        Wed, 07 Oct 2026 02:53:50 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d44asm4845181f8f.54.2026.10.07.02.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:53:49 -0700 (PDT)
Message-ID: <2799181b-df9d-4d02-91a8-86b77f920da8@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:53:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/45] media: qcom: camss: add common IFE subdevice core
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
 <c1cd9e24-b1a2-4c30-aa99-7c0cf6f19077@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <c1cd9e24-b1a2-4c30-aa99-7c0cf6f19077@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX3Of/f9gkGNU8
 IK5Nq7QzQkzw3Sk3clQis/LyAkIz+tUEtMer2aYM+/pQfTFHEm/hZxlUq5tbxjZdKu+G15/Cdaf
 njYk+n9Ec6JOPtVHQ3WOJsn0h8RS2O4=
X-Proofpoint-ORIG-GUID: cXIX4OgSMV093LCPVOdsxouaC-rFMr5C
X-Proofpoint-GUID: cXIX4OgSMV093LCPVOdsxouaC-rFMr5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXwWQ0JGUstTqp
 EqySHV8+XqfRe74W2fuJL2TJrSpeifI/HGmnJfhYxpjwTp1gzzr9aoPU9csRiak5WS2E7AUrHCd
 sQGui1yIf3x7yzK9JF0AD/mz4zYDmD6uFVdxSWkW4IIPO3AtAlm3hehXB/WqUKiOi9ED1LZ6keP
 DdGnHqZs973WuLDSJyTSuFcYe+cEDPCmIp24Uio1DXnGnEUmsYOVgV3dmscNlpOcqWbqqI682Pe
 kABE7I00XdaQy85W4UYAnnT5yZzNGto+Xkx3ei+a3ImpyogPyGKOkIf8NxncVp3Av6/KBPFO2PI
 6Rq+DQF6UyPY47lbac9QS1kBRw/b1ShA9N7/vVaaeZLhTccLPIKE1w1i8ztEzTE/6P3EwKM5Xct
 wWmqy89RNqryUFeY26z6oXBYGmLoRqZA7NMVEX/hzJ6fc+Rk0kmul+Viuspvb+O42IMKRh+nk0B
 yTOwyXXA2y2tYlJNpCQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac616af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ddtxKsdqBGp8r1WauXcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:42 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Add the common IFE subdevice core. It manages routed streams and
>> formats. It also handles buffers, hardware pipelines, and media
>> entities.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |    1 +
>>   drivers/media/platform/qcom/camss/camss-ife.c | 1617 +++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h     |   46 +
>>   3 files changed, 1664 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-ife.c
> So, having a new IFE along side the existing IFE is not the right direction.
> 
> Please see my series on IFE for sm8650 Lanai - which rearchitects the 
> driver to stop pretending write-master index and RDI are the right thing 
> to be passing about - instead reformatting the existing code around 
> lines and outputs - which is what the hardware spec itself discusses.
> 
> I'm very enthusiastic about the hardware enablement piece of this drop 
> but having a whole new driver inside the existing driver is a workaround 
> for the technical debt.
> 
> In fact the first and most basic thing to do is address the technical 
> debt and _then_ add in hardware enablement.
> 
> I'll reup that series to V1 status - and lets look then about how to 
> stack your hardware stuff for 480 on top, should be 1-4 patches extra at 
> most.

Do you not think it is time to left vfe and move to new code, but perhaps that discussion
will not came to an end, because you dont even want to argue whether to have VFE as it is :-).
If we go with existing VFE i think will be good to have per pad
descriptors and abstraction for the internal modules. And i dont think is ready 
to have multiple pads and streams as of today but that can be fixed.

However i know your opinion from the beginning and you will not gone give up
from that. I will wait to enable the 480 and move forward.

I am reviewing the series you have posted lets see how will look like.

BTW maybe other reviewers will be interested to look at the code as it is.

~Gjorgji

> 
> ---
> bod

