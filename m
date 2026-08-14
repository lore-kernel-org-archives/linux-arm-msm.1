Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638223BBFDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701009; cv=none; b=p8LjHKZ9mRdfBDOdHFrK7mBtnZ9E73h+CbpXAPI9U1P9ZtRI62tiNkBt8aMLoPvNdG2VM69YrmbNXOtuKXaDxxoVrHT4XUsiVRbbZek3JQLythcK/LAyKCgWLbOZs4r8qClAKa5T2oEYyeQYqsQ5fReiLB4X5DBPXyw2E8UtIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701009; c=relaxed/simple;
	bh=bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ro+yB9XfDCmUTCo6T6pyiJgjFkuVhXuwWSjSxu9pNH33ApL4hKImpI4eB0F9VimnNzdQ4bgxMFLLz0ucvKqJ2CPacbWEZa4wGarxeb9bL/Ur9eY38miTFpzkU4HH2ukvNJtcchsWd6W+y9G4Dt9Lnh/WR/YvCB/iDt22uqgGLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOBIQGjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6FTqVic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOBIQGjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6FTqVic"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7gPxn711703
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=; b=XOBIQGjm4V9isW3l
	VDkpseqsgGD2+cB+YnNpYmbW4TQ4ODlfHtk2vfDuHPycgr4Aezv76Y1fKN38bIZF
	UywzS4RnJ3A5RTScghTyCICdQIB3zGEmDTpmAWrACd+L/PSDL+SBQd55RE+B/5oO
	OVZVwU78ddrE3UL57ZfftmCFRMjbxkCDGST2CDz8g+N5WH6CdnQhNNTPZb2rZPY+
	7OafYnNF4Q92gavDv8Kl3dZVTZyFpslWSC7Xbvgd5WFo7qHluhk8n7Ln9qv0HgAP
	yrIkTYqsFC3ThGZeKsjMPJ/5AxIrtlWEcsVHNHNmqXv5t2hWaqNiSPjxlTor/ZTA
	EHaY/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90urcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:50:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so670299a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701000; x=1787305800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=;
        b=F6FTqVicCAheKUYaH4Iwd7IU8nlJ4eRS9TL53o/y/BqDtmJmEvFUyhLl1S5NnOvfcG
         NEnf464IBWciP1Gigs/bb79NwVlSViAoYMiJM0GxRPpWKY2N/oaazb9VttgXfftwa6rF
         f+EGV9vAKAemWvwIi1SE4tbfa300qu4T8as1ojfHMr+JHLkHVUehncUDkRfG7rG5wgEp
         vap1whjgLcqFiStecZiL15JilMiMJf6Gl/PqbLkCa8/nsPpOnn3tmUSvwLcDosqajEFf
         ou1HIPfhZSVbStGzRFkUbBbvaQbzdKRn5i7zZegThbA/rVMRtBbiqMVzgUjstHb9yVkW
         xp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701000; x=1787305800;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbuQsLL8tNbhWQV7ZzutwSkYT7CQTJBHS2BgGEjkN+c=;
        b=G4w7uBRFq6rHy6c3Ae5Evk6GHTQ6uP15G5iPd0p6WDBpAwRtRTO/Fyjx2yFZkITC06
         r+8/ljn7RArUtzZoFCPvaafTegwr+Gz8iYhdVivnvHWEr6X4TzliUdjV9dmuxybTVbf1
         yZ993RbpnKYamBoT0Gq6hgLE6XlQTDWYMs3BHO9qUmeBi1WHYxnOR2WX0IOyLFg+MrI2
         utatQJpwYOrUsmi6944K04AUCJ/OKyklOJQ+iHEf2Rgy7PEgHZrFCdO0bCX2nzU3G5Fp
         cWR3RCNLIokLQh9vQ2gPqYgp0GaGxHFVan0/+c7bkWgsj967cPSVc3zS5Rw4yC1VVo1r
         lu0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQ/AJc3KupWSyNDlYxjN2hvRqJKR+HFv2WiJy8r1tZ7EDwAAcch5rC0TOAv30m1g/6BEC7MYNOENHGvjJK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZK1cDhNocBxwECAl9agKMmNVAsLqelwpMR2uxF7QSeyRIP0IV
	nh66j8qHiLhzvH1QFOTC90TMGlnrXAVT3dKomJUh4eAKJxVxUDjcgbPO8jgX8iTTQHnCrP5VxtP
	lnXFARlJhwWMkyNh1EMIFzmknKQjlYS/b2CSvwE/VaRpZ97PxMcL8sc5vMM+q1hP7SEwW
X-Gm-Gg: AR+sD11jWNgPaM/xG9GoUh049e7hJpgEpGMUJYWqS2ANQAy/v5QcZDEx3yqLVD0fS3H
	rYYDlQbHyBLNeXCBozjuBhipDTmnx7Cnwcj5Xt7yXVyTOdjigANvcBGau76Dd6OpFNQV/P+8x1U
	NncY5NAT1bzKHOTgKL364E8QohkQ2CzQk+Gc2EWjprvyli/KrC9v8O4Kc8f63Awqx/+8S/oJYc1
	lV4Gkndp97Zlv4zmhLOqV5b5yJJ+MfYDD0Nl+imxQNUrXcqn8Ehyuh7K5exvF6/tS6V6wHXDoL7
	L5F3XiagNqAn0MGsGTp91Ix2dPs39Qqh1vLYY9QQ/wVhsn2PsFicgAYgpjDxam+gM1qO34W/eCR
	5ZhoaKUiXdZE49eLyaveYtZeVn+U/efa2
X-Received: by 2002:a05:6a20:9f93:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cc71de3f87mr4852494637.33.1786701000060;
        Fri, 14 Aug 2026 02:50:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f93:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cc71de3f87mr4852449637.33.1786700999644;
        Fri, 14 Aug 2026 02:49:59 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9fd3sm2621667eec.4.2026.08.14.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:49:59 -0700 (PDT)
Message-ID: <e287e538-135a-4eb7-1b21-55b475c844e0@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:19:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: Add dma-coherent property
 into venus node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
 <20260801-iris-fixes-dma-pseq-fint-v1-2-aba0cb22f6ab@oss.qualcomm.com>
 <20260813-frisky-augmented-crow-fd5d3d@quoll>
 <4b34e718-0878-25cc-a5bd-0d8858df5133@oss.qualcomm.com>
 <30195e14-0dcb-476d-af0d-f85ee57e2aa5@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <30195e14-0dcb-476d-af0d-f85ee57e2aa5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ee4c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=V9F15ByMrN-4acUeBR0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NCBTYWx0ZWRfX+PpY/38j68cV
 obLZ97KjicThbDuYE8v6Cn93fdl1VWbCm2jTDIeVv0i/oNkazhVzHEVW6wbQJreNH1jW5/iM16D
 HncapLLN9UQCZ7p8JQgFRnZwBXLoKzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NCBTYWx0ZWRfX1ghdMU7sltGb
 CjsweY5uWN37+McV+/1LZzsCI2zD5hF/ujM89o8ntd1r25uCHVnNJ8SqR6AL++uF5kLuTLUWhti
 QG1Nz+glFhf7UV8LsAz+X/aP8o32lIq3QvadJRY19zv7S1Fsw9G4CEAk0cumm9LgESBnTgw2nRE
 Jy6xOnyVuBr9YqmBN4rfwRBBROOtIT0n93ZpnpV7t7xVfD9Ju/Hpv/98rPJsv5grnVIeLAoV7Tt
 lHppjd5XlLqlKVCCo4AR6nRJ0i0AYVXu7TZqdSrxLP1KbufbC1aeXJfyroe85a/H82MjCOgGxmT
 Tv4mUJiVn6MaTzHMvZcHascxiNxGZxZpGyt+dRQmFZKCot93B35zJNVuy4m80r873vcFILa6hw0
 2xMNjyjo9jhDS2zcKdJp1mBh9I9wmFehsIODWwRuyyIRGLg9912bsFnsyEHkCQZM/2uBUzBH/y1
 aa7ExeHLGtYwOkFON+A==
X-Proofpoint-ORIG-GUID: c2Xr7cH2WpYMGXLpPSdA1tyLO7jHYENJ
X-Proofpoint-GUID: c2Xr7cH2WpYMGXLpPSdA1tyLO7jHYENJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140074


On 8/14/2026 12:01 PM, Krzysztof Kozlowski wrote:
> On 14/08/2026 07:29, Vishnu Reddy wrote:
>> On 8/13/2026 2:49 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Aug 01, 2026 at 01:07:28PM +0530, Vishnu Reddy wrote:
>>>> While testing with some higher resolution clips, the venus hardware
>>>> triggers a fault due to wrong input data being received. Corruption
>>>> was also observed in the captured output when the client dumped it
>>>> to a file.
>>>>
>>>> On debugging, this was traced to the venus node not declaring
>>>> dma-coherent. As a result, DMA buffers shared between the CPU and the
>>>> venus video hardware/controller are not guaranteed to be I/O coherent:
>>>> CPU writes to an input buffer can remain in CPU caches without being
>>>> visible to the video hardware when it reads the same buffer, so the
>>>> hardware receives input data that does not match what the CPU wrote.
>>>> Likewise, on the capture path, data written by the video hardware to
>>>> the output buffer may not be visible to the CPU, so the client reads
>>>> stale or partial data, resulting in corruption.
>>>>
>>>> Add the dma-coherent property to the venus node so that DMA buffers
>>>> shared between the CPU and the video hardware and controller remain
>>>> coherent.
>>>>
>>>> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
>>> Really does not look like a fix. How skipping a cache sync can fix
>>> anything exactly?
>> dma-coherent tells the kernel that this device DMA path is hardware-coherent,
>> so the SMMU maps its buffers as cacheable. That attribute is what causes the
>> coherent interconnect to snoop CPU cache lines on every VPU transaction, so
>> hardware keeps CPU caches and VPU-visible memory in sync — which is why the
>> dma-coherent property lets us skip the unnecessary cache clean/invalidate.
> You just repeated what I wrote. What for?
>
>> If a device doesn't support I/O coherence, its buffers would instead be mapped
>> non-cacheable, no snooping would occur, and the driver would need explicit
>> dma_sync_*() calls at each transition. Venus on SC7280 does support I/O
>> coherence, so dma-coherent describes that existing hardware capability to
>> the DMA subsystem.
> How does this anyhow explain your commit msg? Are you saying driver is
> buggy that it misses sync calls?

No, driver is not buggy here. dma-coherent flag is missed in the dt node.

> Best regards,
> Krzysztof
>
