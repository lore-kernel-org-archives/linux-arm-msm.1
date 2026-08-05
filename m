Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA139060C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918046; cv=none; b=mIm4qvdjVgqmO+X89UaHrKcsU59ALVw7Lhjh3NPnM88wY8/71Uljh0BE8xFS0tWnMkzwjeG43HOXGobIaUWEEoRdPfTz3WCS1+Y0qOpQ+xYdiLX5fqtBsN933hVJJ6AfN5NE+l2H9Qns3/8tRt1vsKNm4md3mZLq23WzZU5XCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918046; c=relaxed/simple;
	bh=8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMsfzHCF9A878oTHwtqojROrP7ZsdkbLlgcMlykKfWu9negi6ZMjFabNNYGmXxymqSzMHXd7EEe3ryTN7wJFiCWCZ91TtDsPLMIuU06trKA2aR2JOpFEIkl37FOC/c+MfvKjlA4vw1MBteqnPz3zoGmWMVjfoiBklDCC67Jmy/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMCQvOj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DL3WEvDN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMCQvOj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DL3WEvDN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755l2Rt1731726
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=; b=DMCQvOj+fFm0L9VB
	JuVUcjphS1DU8UeVVJqs3+RUrYv+xR33Jqyvex6UNQhOjfR06nFv+LZnXSCdD1nv
	P8kVw+8eHRFhy8MzR+kpsVQMk0noaMHAi+8A93HwZrdlYA4ldWr3dHW5DAJPUXKA
	k9XFLy450poSY/DE+PEeRITVHC1I40HtjNnEmeaX+a5N8evTS1W/CFcQLQvk4DtX
	F5Fku9NqugCMRmJ0glVAAMgITPSD7z3FxM0aEdkauUdXy0awbX0s/RGy3h0ojIR4
	/4R3bn0SxmGiuGGBzDuhtHMPJmJJiKojCvD+kYq6WpSHx3Al6Kq+5im2y+jZz2Cl
	0hSXjQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgmqqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 08:20:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso11315155ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785918044; x=1786522844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=;
        b=DL3WEvDNPQzu9bQQad2wfnJJKTzxm5CAktKSVgS32QBzsp04FfNHS3YOdWp7EJtTmo
         YLae+iiU42PME5JQWgTJKpkzJdrpHgGBHFt8zPfc8MwKAvmNC7Q5W+HQvCg49kGXvKo2
         eARE4qHlXocEHJPa5fKrKmd/G4MuXLgj2b8Kle26YTWAmyUuMZFwZFbQsnrF1zyZ+sIi
         7jjt7AnOSmLjtbGKaL1rawX7XqgO/qW6jZuAzMw3aSdb8Wxodj6c10I0K0+6omte0gAE
         Da2YURwfgekMtUC/mxqhVAOEGyUx1oUXA544fAq7D8Bv3ia1ByBWW6udBc2oJPgIKZWk
         9alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918044; x=1786522844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=;
        b=JjK4CEaTMuEjLrM3p7AZR1NhXErPchl5DIFljbX/83EfBOMea+lO8DxDdJFWUI9Coo
         gfmAxrpkoMmz9V1qDElylrqrGFFty+52+ueMKbOzhMSx6NdqJUGYc/GZ+I46e/4ziGlc
         I0EaC5yzjmZ3iDxAtVJ5KT7k54RatEQMUxMfWRgEdHkHl2TnIrgaGOR/VCUEBFyZIbcq
         Vl8ERBMxzZB9zc7Uk/MNJ9sFt7bVdQu7k/b6iZTIeuwt0K+nBXj+gLMkTY0ozCzTYgCI
         /mkQK/zW+iiogyudQ4cVDjuRkPxD8oQa/hSN6u33q/M0Ivd5iKwUIKkffCPE1Vpwguz0
         Pbdw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3WM2OrNdHdBVOKhDAxeftitbN19bfwVO+Gxl3Pk7CHRggIhXtDdRjgYarpikn+6S3jrQPLwwiMj13yVek@vger.kernel.org
X-Gm-Message-State: AOJu0YzWC3qr6bh8Jtk8iDl2mS73VxmSB7OjjrKHL+pHSBqxYU0/NKXZ
	Da0ulW9p//t2mtrPB8bij5cW9eyWmEW+VfVNnseJnyZeovdEygyOW0mcofv96Z0JU5wNOYiiAeB
	jLo18J3qdwkxkOKL3nbnbvK9ojumN2JGut/F6ZwbFG/uwZshitucN1dB1o3wCZGtK7qb/
X-Gm-Gg: AR+sD12udmxK9KKL8KT/7n3oWLp7cXqPMvPfj6h0J1hmJLWeFfYxUu8L5HR9D6ac/pb
	rxtdGxmqbFRoAbf7pAlRmVGpNRmg4Vie6hAVlM+KWT3TreAZBN+0bqYFCEGkrdDb1GVx9r0UPf4
	QVzDFoqCKJUzZ2zP0/FW06JOSEdGdD1C90BUSYTiYQ/XiwQaiDb5Zo6l14r75ZnOyoQ+AXpqEu8
	EXsiDY7nPxZPMvDfJ2zJK3CBBfml9hyFHUorzh5JAs0oTvliu1QzEiP3Y27Ky6qApQZ6vYxdllF
	fFiBCVY1VMxsxHaSYPYB3WStzgZVByCzT/dQNgO0/u1oAwgt9v/MesXeZYiora7MmgykhEwYUZj
	wAb8zN+7XXUPsr5ky3R1wfvu01xww8mFRbg==
X-Received: by 2002:a17:902:d486:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d08aa64855mr95187975ad.9.1785918043775;
        Wed, 05 Aug 2026 01:20:43 -0700 (PDT)
X-Received: by 2002:a17:902:d486:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d08aa64855mr95187635ad.9.1785918043312;
        Wed, 05 Aug 2026 01:20:43 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d8af6sm14454145ad.74.2026.08.05.01.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:20:42 -0700 (PDT)
Message-ID: <4ad24e6f-03f2-47a5-be82-33b51bba1e40@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 13:50:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add qcom,vmid to BAM-DMA node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>
 <amu9hfJQ3VhRZ6PR@baldur>
 <a8862b6a-28fb-492b-83c9-a02730fc366b@oss.qualcomm.com>
 <anKwCKnt-3wrtzRt@baldur>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <anKwCKnt-3wrtzRt@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA2NCBTYWx0ZWRfXzUdJK/KQRPx8
 6jRg5ns1vbzqCyRf5AfnNOSTC8wU7coTvJTmRhGb1Me15KvynLWkEEkqA0BXPNa0QGM4nm25xq1
 nvbFCk3pj1JumcCb0uEiatKHcTQ52grZvRRfC8IAPyhFlbXVPE8rihXemr18RrjERQd2mhcSmHF
 mWx5kmMfjN4S4RV+XXKQkTQiJ/0IrM6+QNeInMi7RqGjMlotFAgk6GL/1akG6VtPhRsip2GXHcy
 iXho4IE76AmYiYCdBQPGRY6Pa4IpNuwHsT6PsGKUzc8smvNUp5yR92pLdZm+XfE/ZxdCOP2Ntmz
 EYYvypV6ZTgyTv3P6OBTNCDbqPeuOCBlkdufKMGakZ9xroFkCMbOegkr+06oTTf2TWIVvFWPfGk
 NZcSjW0hElW53V0o12SDZcxDS5JEmY0Ummgw6filzpmWLstLsbaVK8kdSYBK252GEPQ9RfhA5GB
 jVwApgCsWbF3qD+Dk1g==
X-Proofpoint-GUID: AGoZE7naKA7HioxwjGFOXdPRw3j9BJRF
X-Proofpoint-ORIG-GUID: AGoZE7naKA7HioxwjGFOXdPRw3j9BJRF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA2NCBTYWx0ZWRfXwUPnRncenFxd
 Wz2nzDOB//KGIw1JaJpP5NpWCFCnhXif4cNgw1LJcuAYgxlBXGLa03fmhJR/k/KdQjM7RIMZN7H
 3WMzPfOe14gWDuKevr5XP9LZUx4+wtY=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a72f25c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oVj3lZxTCizMYWdbe9AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050064


On 05-08-2026 09:08 am, Bjorn Andersson wrote:
> On Tue, Aug 04, 2026 at 09:49:18PM +0530, Vishnu Santhosh wrote:
>> On 31-07-2026 02:49 am, Bjorn Andersson wrote:
>>> On Tue, Jul 14, 2026 at 02:01:53PM +0530, Vishnu Santhosh wrote:
>>>> On the Qualcomm Shikra SoC the mDSP (VMID 43 / QCOM_SCM_VMID_NAV) is
>>>> the AXI master for BAM descriptor FIFO accesses. The XPU enforces
>>>> per-region access control; without an SCM assignment granting NAV
>>>> access, the first DMA transfer triggers an XPU violation.
>>>>
>>> I'm a bit puzzled about your plan here.
>>>
>>> You posted this on July 14th, that's 3 days after I asked you to rebase
>>> patch [1]. This patch literally says that [1] is broken and untested.
>> The XPU violation itself wasn't visible against the base bam-dmux
>> enablement alone. It only showed up once the access-control policy was
>> enabled, which happened to land close to when [1] was posted upstream.
>> That's why this series followed so soon after.
>>
> Are you saying that none of the shikra patches were tested with
> access-control enabled?!
>
> Regards,
> Bjorn

Correct for [1] because access-control wasn't enabled in the Shikra build
used at that point. It was enabled afterward, which is when this XPU
violation was found.

Some context on why this issue is Shikra-specific: A2 BAM (used by
BAM-DMUX) sits in the secure domain on this SoC and doesn't support IOMMU
Stage-2 translation, so there's no IOMMU domain that can be attached
to it. The XPU is the only protection mechanism available. On past
targets like msm8916, the same A2 BAM configuration never surfaced
this class of issue, so it wasn't something we'd seen before.

We are currently discussing with Stephen on the SCM calls on bam driver side
to fix the violation. Once concluded, will verify and fold the dt changes
together with [1].


Thanks,
Vishnu

