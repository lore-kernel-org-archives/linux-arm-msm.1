Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067331;
	b=FPFapCMl4G667HWtLQtTnA5JVYzS+OtQvVu3I6djP+unPUqNCRUbQuLhhyjmMOBYnrDq
	 SjpoX5b7OG2+0qFZu4aDgxSFxsiaog8kLBBGigYltbRkB7bTtOtF3pd8oI2kJsEZiyEqJ
	 y8AdG+95X2HHT+lHimO7y/0A3wMoYLD+B52aLOPWsWdCEIBpnx4omVdaQC8t7H2SGYXYX
	 Ktfe5jQU2/T1qLgIOEg7Emo2zoVhsbuQXRLqd72K3QqFFwSoXb0rEqItsVwY7wf4PxjDd
	 9zuh/83V3dx7RYj7SvvszpQySZ8+H6PRAt2/4H/w7TY0iK6YJHSa0AgiWlvfckKNi3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=;
	b=yYoymFKk8r5uQNvgTOdVazPkrZOV4c2RilIIMZZw8wZCOyioxIKF7AGqKmr5LtsodECf
	 phMqTINclfx1A25EaVyGxAKl7UgD6WiZFVnuzcGpjJE6L23nlSpE8m6clbgeR0BWx2CMW
	 Gm9Km7a7q/tKIpJeD/LAWTOG0QxZs+C4A21eKgESlgH5jQfT3WaHURYcC1JoXQz+8TYJ4
	 BBsyK2yA97SMjQFuztnlzwn2sgRen2Is4NEn/q3nVAjB1VsilgFJIAoBTEJd/fqGS27+r
	 ukxbDKR43UoAaRAneUdqBDsH+0QDvRpF7zetxO6KrbQJSbvtih7x8re7NxDUsuIJwgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eMZy01O/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGDi5e+3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB359606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB359606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMZy01O/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGDi5e+3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B01j935722
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=; b=eMZy01O/FU3lmkE3
	rEOy830X9WChu8LeDpAGd28jo+Q15N7GHhAKCCVsni9l+Z25K+luj5Fl1bBPIqxL
	3D2HjqTivizmvBtx5ESJSCw1zjYWj5BlLIb3yR0eJ33Ri20pY1SQnO2f++nvQ7p0
	hMb+OhUoTimDuAYL4tgq4r608yGokDiuo8LxWD6A7AGgC0gz/wjmlUV3WXCWaAXC
	nkJHbnA3JCiK3/XFlh2cpuGQcNuQnb5c4HrxYB027C5cY/bZ559aNm0G6bHZMaZd
	im9ApSuUpgO1fo3NNHEVvCvLq44gcDkKlWDDJzGBQT1/Tqz35wMrTdJgnbysd8Hq
	phOa2A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcs3th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:48:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so1542974a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795067329; x=1795672129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=;
        b=QGDi5e+3eGQzAXgWMQdQ94IeSkHJz0/MOKfclvmAMnyqyxb+fnBEzUF6gHT8CZAtDV
         a7VmEXLk2VNRZ7eNE7c77dBFiA7FDD+k7FrTOkPBDp42PFMONE9ayFs9ao0gIOX8HPCC
         bxsYaXo/5CJYcxVIfmuvG9mx3ve3nwgm+D+LB4bpaHBzGl/kLJ7dNdihE184JFVIM2UJ
         4gIIVJY4CsU/qslZBKezMlYIFAeO46sceSKHkvJ0QlC75U/i6I4E6hwvy7uv5tAq1feP
         xWKQjkytSUVQQN5UlxHyx0pI4z7GCWNlQq4ZadLOmdxySoTFeYIl4flM5femmlG1QiYB
         Th6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067329; x=1795672129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=;
        b=r1oNsdgZPFkmcQ+IIAEpOLFv8EX9q01aCBRvlsCbk2StMgZqCs5mNaixM7Jm48U16e
         uMEyM1TrqqtvF9DrMvk6IU33+zfdCIE8OlMijKp4vF5rItFVSfw+/kOWespfnL3gA+VW
         kfhpoPkKrar9HSpbCsXxBt0zS0rP5Mk7Mb8bIufv6qO5Bp6TcbA+74o8HR2NCbSmR4iX
         FSEMavUd4lHBx27q7WcD62XK1R+UPBYSYVySaFouG+vGxwfMsky2W7U28KOs1Idxbkvc
         Rz9F7pJG6THwtNuzUaZTOF4Z3Sfn6w3klfTv0iJVczq03J6VEa1pckKVM7s8nEZ4lms1
         2q7Q==
X-Forwarded-Encrypted: i=1; AL+hErE1iqS7Y00RjVmgMVzL1yEI58C0QeXlHxEcZqSko/O/fPesQCTlFO0BttGy0B3SuV2wulk6VKiX/M67hbBL@vger.kernel.org
X-Gm-Message-State: APuU4Z9wlL/Xe8habvy6u3uQb8yu7t3+es1y02RkY0JaO2dcfY5Wlan/
	qEQtXMf7T+0BJXn4lSvtFBO4psFPPbrhui2orc7i2O4LUcMGuhi97tu/EJvJyMy5cwQnJxSbRYR
	6nbZSWoSvSbM4vTefN+BUQI1HdAJBeGsy26xrAjjjDbi6r28tKg8MkryXo1MLYKsMpNWGmQO0ou
	+k
X-Gm-Gg: AZFdTZfWNRZ9wMZRCXMrVVPodiia9m63XaklOF9Mw8V2RFiIJZOfDf4mpHN18ak3TeI
	h72iwFjUnM4C9kMDaAotWHbVOxyFDBLwnchQjuKN2OFm2eqO6xLCyiOpNmqqPIlyoZxWYH8aIx/
	XVJ7kus0n80Ws+WtBICcSTvoAR5IYx3n9KJyVauOQ37h7XaDijjko7nViumH47pn5nvqI1DISyH
	07Lk19TGV1g3gGcqT4WjIZB9x0aLo/twUv4CGw6fU9cUGGiL1ZNQo6Vs6+kjGSZE5JwUrMTp4YC
	lzUqYWVg5wq7LA1Bo2CP6SYOm40pxxnVYC7crKJPRPoqRaKKuzN2idrDNTNX5e17hxvabazxbHI
	2gKSB4SsmvsUggRqNuI52ROTZtAnvB0A1dPsmRDIP43YIFrgRoGgA3YB8invhOy1JimXrWQfrz2
	uuv0pg/w==
X-Received: by 2002:a17:90b:2507:b0:3b4:393:452b with SMTP id 98e67ed59e1d1-3b403934871mr471946a91.9.1795067328530;
        Wed, 18 Nov 2026 21:48:48 -0800 (PST)
X-Received: by 2002:a17:90b:2507:b0:3b4:393:452b with SMTP id 98e67ed59e1d1-3b403934871mr471922a91.9.1795067328077;
        Wed, 18 Nov 2026 21:48:48 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm824764a91.10.2026.11.18.21.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:48:47 -0800 (PST)
Message-ID: <d4a676a0-c508-45bd-a847-30179c9cc4bb@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:18:42 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
 <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
 <20261026130559.GB3598537-robh@kernel.org>
 <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rZRiO5-yDUk1X-JnC0F_7XQJdowgC06L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfXy9LWf5C2EV/z
 uNgXg4ypEJBhkzFBZPlQzzKsA7ChGOzmnHYQiiNE/Gkpclx+qeLqzbmkJ+FzqCfFygXmbPYdcrd
 yzcyfFEDE4MNsAfMgvocqmHi43a0bR4=
X-Proofpoint-GUID: rZRiO5-yDUk1X-JnC0F_7XQJdowgC06L
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afe8dc1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IjLffXyxeTO6yLCIuWUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX+OAQBJt2j+QF
 IGz1K3t89uWvFPxCXQoEstkFaS6adtxefa6pDlQalWe9zIAJgAcuEh+FUnzl2XsiswDOxAr4jh7
 MJxUGwKPTxZKO04D0mtwkZgmvNCCwfekCpdhVkX/OteTRCZxONQRQgX8NMCnHhtawmc2itD93bk
 gvbCMoVy/JjhKgDa4DHuMKE8wWTswI69Q1pvPs7KnrJQYPCTk/UJ30MnT/A9ki22xVQEUVE4rl9
 /LMpcAD6ceTn3IjDVkGys0DykbXwP73ZcPZZ4PMhvXm1ZSATmHqY9wET68lnH2qZBFOamA0l35W
 6JANAzLEL5tKBjMX8t5loO0zuH9VuPvSWFqF1dpvS3/qrMDS8odiw+kOfxtdxaWHGEDkueOurYz
 I6U+ZBtq+vwjL88LCkUDGBUMff8Mb8BcFXAgeahJEc/HB6RYT/shu5OJuVxObvv4jMOFe9QUOAV
 3k2/ciX0doISlsLM8og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190022

Hi Rob,

On 27-10-2026 11:52 am, Vishnu Santhosh wrote:
>
> On 26-10-2026 06:35 pm, Rob Herring wrote:
>> On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
>>> On 22-10-2026 07:31 pm, Rob Herring wrote:
>>>> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate 
>>>>> security
>>>>> domain, preventing it from accessing BAM descriptor FIFOs 
>>>>> allocated from
>>>>> arbitrary host memory.
>>>>>
>>>>> Add an optional memory-region property to constrain DMA 
>>>>> allocations made
>>>>> by the BAM DMA controller to a restricted DMA pool. Access 
>>>>> permissions
>>>>> for the remote execution environment are managed separately.
>>>> dma-ranges is normally how address restrictions for a device are
>>>> defined. Why can't that be used here?
>>>>
>>>> Rob
>>> The constraint here is access permission, not addressing. The modem can
>>> only access a carve-out that is assigned to it through SCM.
>> The reason for the constraint doesn't really matter.
>
> Ok, understood.
>
>>
>>> The soc bus on Shikra already has an identity dma-ranges covering
>>> 64GB [1], so there is no addressing limitation to describe. dma-ranges
>>> does not reserve memory, so allocations would still come from the
>>> general page allocator, outside the assigned carve-out, and modem
>>> accesses to them trigger an XPU violation. It also applies to every
>>> device on the bus.
>> It's a bit awkward that dma-ranges needs to be in a parent node. So you
>> would need to put the device in its own bus node. But if dma-ranges is
>> in place, DMA allocations will only come from within that range.
>
> Thanks for the correction.
>
>>
>>
>>> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
>>> provides a dedicated, per-device region, which is the setup it was
>>> introduced for no IOMMU, with firmware restricting device accesses to
>>> specific regions [2]. Stephan suggested this approach on v1 of the
>>> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
>>> same pool, so a single assignment covers both the descriptor FIFOs and
>>> the data buffers.
>> I suppose that since the memory region is dynamic, 'memory-region' makes
>> sense here. If firmware determined the address of the region, I'd
>> probably feel differently.
>
> Yes, the region is dynamic. Thanks for the review.
>
>
Gentle ping. Are you fine with this binding going in as is, or would you
like any changes?

Thanks,
Vishnu

