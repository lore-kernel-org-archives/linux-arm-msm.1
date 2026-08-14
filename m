Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952F43F8CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703114; cv=none; b=c/nHrr/5kDIfXZ6lhxE9hn4YryZVXPYZkns9wk+W064U9SZmn3SxdkuVByTEDTlGpkY6QeaRPyQ/yAr12b8k9O5ZJu8+BOIOe7TcbVBVUcLVQwabRJiujds7tSswBtrcBhXd+7nsgzCDhEnW7NZ4Vb4hQiFKO9z7dC0kkSgi5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703114; c=relaxed/simple;
	bh=kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjZ+fF0m3VAOq9jg2TAAmSUcrtrPKDvjbTkYvB9mMrce5GJqvnFcP0H01d5jBPhSEnWbSB77mJK/4e9CP/3QFixhclCBhTKuBDkeicuO6nLxSob/G7JRpLRa5NXrFe+Z6R2lCWBCXc9PExZQO0Ffu61VUrimPrKaYVHbOXL7uTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZkfNNOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmrl12PN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZkfNNOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmrl12PN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E9u3Bb1010766
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 10:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=; b=FZkfNNODPdU/uhdf
	PXbCOQB4Y6xM2Iq7seSPco/DlOqzmDMf9vG1gc26c7kf2YZFOw3zKlPt7R3pkn6C
	C3qZFlnKLo+oUQ9Pyl5BocMf6FdDB7KhlSjqx4GgUX9l5MFXbUO2qWUZs5juWUSP
	fuwdN5hWpzDe3bnEUMK3VLoMmRnnA+RP9xRx4F/Rjmq6Vx/bjwTHqazTTNtfKBdo
	u6I4XH5lTlzQKktSTeKmJQLQ+eFDVZcamHFHvyijqT1p/zA+2OC+I2VEvBMzsyA6
	yJFM3SWP1hIKkAHrALpmswu95V33Ax5DMqxcXVB1rNtHiK5HWo86WQaORPhm17jz
	x72R/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20tr0306-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 10:25:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so576490a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786703102; x=1787307902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=;
        b=jmrl12PNoXmfNfktykMPozAaBavghhfEJ+xcmdAItaJlH2zaTaNlbQ9sti7RWlou8Y
         Ho82Mtx1+DJ/roaCm4sTfZl8gxGmqIfXmy2KsmmbijiFbBjroU223k1NIba9dKJpRGiv
         IzPr0YZJ74Tkx+TfVKrOEXj6Hxqsh5wj8/JB4Pgoyo7qTo/ubj5CsRqNpFeQ2InSVS7v
         EK52G6e/gp7d05VgrgYL6v+c/Xgkse03RBbi1vEHrukJmjJ+Fg7uqb0FFejxruiU0sD0
         +3YXVeeHm/XaQCLdOTYoOluf4N81nLq0Mwp2Mp5wtNVyTO5dwcAHS1tfnmwbXog9q7ba
         9IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786703102; x=1787307902;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVtqC5vjqVMxDhomAfCYddXbUgXY2gPiwPy5iyBGIfQ=;
        b=N9NfQtmbjbG2+frZBVRs2Nkb3htatSrieqAUQPIDMuVziKHkbZsieBqBMQK+O5YhT0
         pdfT1FHNDV70Y9hDd6Ag7T0u4jD1feiYqrtLc6zdqtsUZzD+VvIL5A360jAGWiIFultN
         T6PKSTbOJCPiTFsQOqIQLp/nLaVhqoVKzhFc9NOxRuJdjx1Xk6SSNA1kI92IRowDsCd2
         i0lkGbxXpx+YKYDOM+7sQJ4ad6aNOnDUp1nVEJSU2aNpKgiLAEfhK3aobmoevgBsCovO
         +hDgwDQ7iqeBjjdjitxQgk3ivrzs+CSHyIW3lseTn5aGLxm3eg1uLW03BH6Nx5/HNoPz
         Z8wA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs8pv+4f3EMq3Ebr8NYWZZ+92iWgqyW/hUQqJbOxezGdQUhcKwDWV0g/iLyUJD/8i/010++/CRGWcoOnrq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Z6qa0H4rYvLEs2ejK5pgu+qWJx2GQkSnat3DTZi2GzEdISc9
	gRCF3Sh6aR5FyPw+NCgIGV9329eGa6h75UxTyHB4jr+2HHpxMS+V79jmckmXOwaNz3uqSrbtzvu
	KS7YFTPYmsO6QNfbYOndT2v9tOmQ+1TMcbSvy5Tv8iBzCfqXFiXfF3i3iQqFdAYarBdoo
X-Gm-Gg: AR+sD110v8opo/aIuEo4mOxRUB+KaxY3k7Sj71TENOK5sHUAuQlxzwO5mg5zgR8ccSp
	sKJ1uyd+t9GIYqSxaaJG1ZT9LUrrmLcRcIvH6vv9vi/dPIY2eIn6UYUiAC27Xz5LTw5zxksHpUB
	7Z1nQbTU+DZwlWjykMsy3//ifGkBXMW3TJ1n78DZGtET9C401DXKWq2sg4oUpaP2216vrY7IP5H
	7moByCSt9kMAKUQ1t/Ef14y5HjK5EBkIT3tS1w3TkNIcHfmMomMvygE7iWpJYHNGRE3FRgWcqMd
	s72AmQuYwL6PLMFgos3RRD0E95skzDKFLUA7jxn//IuqpJ74Z5qtJhNpWaZbWtADI9A+jG2Zo36
	rkdk9ysnZJNpfoQzUnQWnCwZqHE74Cnkt
X-Received: by 2002:a05:6a20:6f04:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3cc720e1af9mr5407847637.38.1786703101985;
        Fri, 14 Aug 2026 03:25:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3bf:6e72:68f9 with SMTP id adf61e73a8af0-3cc720e1af9mr5407807637.38.1786703101528;
        Fri, 14 Aug 2026 03:25:01 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm3161720eec.11.2026.08.14.03.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 03:25:01 -0700 (PDT)
Message-ID: <c03354d1-843c-af24-0e7b-a4c0cfb8e001@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:54:52 +0530
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
 <e287e538-135a-4eb7-1b21-55b475c844e0@oss.qualcomm.com>
 <26a880b2-5f37-43be-ae8b-2c0c27c777a1@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <26a880b2-5f37-43be-ae8b-2c0c27c777a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B3_uIrh-h7lIAC5ojduQ3CgMt8yjgm4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3OCBTYWx0ZWRfXz2eeIe9eA9SC
 kcgWtfFOy8DzePki19MppMV2iiZafl82KViaV98pyUrC7rjwwoBjo17HLBg7u597YmajtF5jaK2
 VxRHz2++x0CxwY0MtbsGmaMNZ51YF6BZcLXBnjajhAVXsqLDihe2KYgKuvltDkCCUFHAdbG6mMZ
 3heFQjSESIFfOOX7lW4GCCY3XTNGjtls1B549u8hm6oK3CKUMW1jkaGx8cHvO8ic2U0A6GHI++L
 +NmnlXeLjZDAgJMbz3DXO7ne3QqC78PnF9Xr+oED1Qkfc1ZvBlzst9pjhKApwezvVIEzVpwwWpj
 6v9RQjO4nnz+C7V1KGbSf79tXfnjR//fUz1djeW3aGx6avd5doaDoA9IG7tnBeAQo5nHMd9ojVR
 Y/rE3NSznPB5S63N5/abnP6Hy/xeBugqDtlo1ZzdPJoM1lAkLRZN6rjwXXN22m7o4b56EUBBDH9
 3wmwJD2a4V4jhXpZpfg==
X-Authority-Analysis: v=2.4 cv=UrdT8ewB c=1 sm=1 tr=0 ts=6a7eecff cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mqT1Idva8bgf30cmp0IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: B3_uIrh-h7lIAC5ojduQ3CgMt8yjgm4I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3OCBTYWx0ZWRfX1ICh03vL2bae
 GI0Zjqs+vA0Q1/reSt7lIsvTrpYW17w80p4gkxbGOotCg62T46PtjP+gb49jcFxOBUFZrAf3T18
 MPnCmGTwIWVwPUZGDiRw27VQMBdDuDc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140078


On 8/14/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On 14/08/2026 11:49, Vishnu Reddy wrote:
>> On 8/14/2026 12:01 PM, Krzysztof Kozlowski wrote:
>>> On 14/08/2026 07:29, Vishnu Reddy wrote:
>>>> On 8/13/2026 2:49 PM, Krzysztof Kozlowski wrote:
>>>>> On Sat, Aug 01, 2026 at 01:07:28PM +0530, Vishnu Reddy wrote:
>>>>>> While testing with some higher resolution clips, the venus hardware
>>>>>> triggers a fault due to wrong input data being received. Corruption
>>>>>> was also observed in the captured output when the client dumped it
>>>>>> to a file.
>>>>>>
>>>>>> On debugging, this was traced to the venus node not declaring
>>>>>> dma-coherent. As a result, DMA buffers shared between the CPU and the
>>>>>> venus video hardware/controller are not guaranteed to be I/O coherent:
>>>>>> CPU writes to an input buffer can remain in CPU caches without being
>>>>>> visible to the video hardware when it reads the same buffer, so the
>>>>>> hardware receives input data that does not match what the CPU wrote.
>>>>>> Likewise, on the capture path, data written by the video hardware to
>>>>>> the output buffer may not be visible to the CPU, so the client reads
>>>>>> stale or partial data, resulting in corruption.
>>>>>>
>>>>>> Add the dma-coherent property to the venus node so that DMA buffers
>>>>>> shared between the CPU and the video hardware and controller remain
>>>>>> coherent.
>>>>>>
>>>>>> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
>>>>> Really does not look like a fix. How skipping a cache sync can fix
>>>>> anything exactly?
>>>> dma-coherent tells the kernel that this device DMA path is hardware-coherent,
>>>> so the SMMU maps its buffers as cacheable. That attribute is what causes the
>>>> coherent interconnect to snoop CPU cache lines on every VPU transaction, so
>>>> hardware keeps CPU caches and VPU-visible memory in sync — which is why the
>>>> dma-coherent property lets us skip the unnecessary cache clean/invalidate.
>>> You just repeated what I wrote. What for?
>>>
>>>> If a device doesn't support I/O coherence, its buffers would instead be mapped
>>>> non-cacheable, no snooping would occur, and the driver would need explicit
>>>> dma_sync_*() calls at each transition. Venus on SC7280 does support I/O
>>>> coherence, so dma-coherent describes that existing hardware capability to
>>>> the DMA subsystem.
>>> How does this anyhow explain your commit msg? Are you saying driver is
>>> buggy that it misses sync calls?
>> No, driver is not buggy here. dma-coherent flag is missed in the dt node.
> Again, no... or explain why. Missing dma-coherent is not a fix, but
> rather optimisation, but you claimed it is a fix. Explain why.

Is the dma-coherent flag only for skipping cache sync?
I might be repeating here — it enables the hardware level snoop between CPU
caches and DMA memory. Without dma-coherent, the CPU cache and the memory
which VPU accesses aren't in sync at the hardware level, which is what
caused the corruption. So dma-coherent is the proper fix here, and that's
why I've mentioned it as a fix. Do you have any opinion on how you'd prefer
to handle this? Please share.

> Best regards,
> Krzysztof
>
