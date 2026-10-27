Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082139;
	b=baanCYePyhX6uW8ITOUBRoXrw/6KWOmRbwiHbpX1Q+PGBURzjWjC7fq4d69G+HBbPQ01
	 jFyssIdf1aZrn3MnNxFVwan5cQZZjejm9Yq3gjTUe1yo1qrZHccnkmDSyqclSSsMq+rRb
	 n41hVG+54i1TzzDhr2yVcy9tz2HhGZo6ufSHMhxbsdea7OBlH+aGAmiy8SuUQntJB5C5v
	 ohQJNuPGHw5qVFvAuN9AJBV3dOll3VooplnrgI+ln7j6pq+bn8mtP57hMDwR5FFyK57wa
	 AjbSTLgGzNTnWujG/TIlwaipaeEa5CP/uoJe9+b4jePLwCS+iK5NaA9WOUZthDKyq4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
	b=by7bIS1jhWVwZiGV0DShtt74/Y9hiRTqr76DxmGLFzsY1Tn2pfxLCN/0DOPxNwovXLKQ
	 8GrzMXq5cOw5oLu4X0p41svHJyRMFs/4mMwaOfImrrekdKMTi2tuSv+me98ACFp/ahtYC
	 za1MCia+qdo/d7lF2ygzeaXhEF1JPYIbUgDoba0z7XAAAX/p6agdLjFx/xbEx3p6kZcRR
	 /Np6CwDBVTWeSdQ0EfZWK04FY+iOu2kIJuTMe9cXwzJyOGlpKFcDVjK1GfJjbVzco8aIm
	 bP8VI99bOejZcJd8WzBQ/7hijptGvwv7xjg46yODnim0TBf9d44oLQX2R4RMXouIM/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA6606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YwGi2336795
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=; b=fo7AZp6f3MxcfLqm
	cmr8GEfUPncYo4l+FTY1si0CTrFwIxCyAIujaHf5lhwiBJvJ81GX5rKkSLxVliOb
	c9DREBO2BLC7X15GM8aXZ0iGQ/m9VqEC+Tg7AxNdJXmewMFmvzKj0b9w66KI8Elp
	ou86K86hBNNMTnrVDd/NoMbAUrn6Rwi0h/A5+ez7xAi8IcqldGnQ/WeF5RzPXTyr
	uZTS0het8nc6cOgIonhhEJ4QxMx7U1Gx7KHb43mWKPqYGSizskB3b0qUVH0fwAW6
	u9VAFchs28V6oHADq9cdZZjq0Pp49xohXNa58S1AZXGJBvvQ6LUDRfDuZRviF2L9
	4C0ozg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d9n1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea0fe07201so25714725ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082138; x=1793686938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=OIG68irWumdoQjVhk0a2wDNij88TpZiTY4EI/MU9tLqDvuS0I6/q43D7OXY4aUXCth
         GdZhwoWyARcBXIEodIdcEXuxbxgDTAjLYGBsGjp7BlfbjSYG6Au9PHa/blZXvz6MIhsH
         ViOOMJvQw5cM9CbPFyAtzSYOOw5bfBjDUiMvczu+WFguRIlkLdr7xAj1cxCCCv1Hq8WQ
         MrjlbKwi8ZUHo8anZqd7LuUSdr8YNALXZ2R2Ajn5vFlOx4iQ4jTqlTaYy8EnWYHivTd0
         jpjkrOOivGNyx3W2qDBTVUPieIpR0NChp/ZihVpC2MGAwHzvRaQQ8X59mpxRAUmyB7ug
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082138; x=1793686938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=b3FLbIy7tBP+b0QnwK5fa3vOMqh3bunHJlaHF2UXlht3ZH+dA1/dBUN1Q4IW5j2wx7
         5meH3zJ5aGcp8nuuQC1HMYUidXqw7BKfWtTrd6EQwLLjoWvvUgjBkjQsg2BtVzZP+Qq7
         C0+KS2kx5HslJfiOo4iko4aOfnUPV7bskxWl9tYjwE9iPoSWcGnURuFSxc3OYbFydKUH
         gUzJK7Mknt0Nth7kB/FKyiUF5/MDSYnLefVrJc+HjD3ELTc9gUvYTatPlS6fB3farQuc
         r9QgGYMPwQ31uP/cCjfDx3vAC0iZgxr5QkXorOrQSBRTmnUUE9GuLkQBxAm7bey0uXaL
         XdfA==
X-Forwarded-Encrypted: i=1; AKwUvBz7lFq1ktwcLs7nsbkMI8Aj78KUfiBhxzigE80MW11mrGoqAnbPXZlB69AYQ7yDB9mVW3I2W77vpLLRiO6n@vger.kernel.org
X-Gm-Message-State: AFq9FYJ70aegXO9S73AzGqd4RcQLnOTHpSYoXWd5nJP5tPxDok9D1du0
	pq2ih1w3p5LV9WsRDf8ntDJcH9ojbbg0Zz521h6KIN6E6yEZexD+Vjo3r7s/CHxqFLyxq3WP8JI
	uQR9t6y9sRO3JnIpTr4aj3Z5RMTVetL9uUHcpefrhsobLKuiOW3LF8XqxB/QFJkAsLzyH
X-Gm-Gg: AYBFou2gGTEPY9bjaLUGnu88dyKujbiCKfjyidFrdz4TwgfFscHeYhPIjGTVvTaa86m
	uI/Q0eU6PrDA9WRJH4QpG98iqIF7UofExwOL2jduHyexUKUdcKafxm9WhvX4g1hoBEEuKYEsL4P
	f1Xu6sSPlLaew7MeDGKOBEKjB97gqNL+vQ1XAIoGBGDrXzpyZkbP6CFAGcYoWQPC8Mgu2yRDCdV
	7GrjFpCKxm4eYVJi5r8pwjeM/2sG/p+PlNCtEU2VrtRN1H8cFgrJeBSDBRreU+Ug2xOBozp1sKz
	zOC8kj/alO8ztDdcYvj3Yw84O5/nnXjAmR8JTK/kZQF9P4AET0T1vfVxb3TX35+n5xAidTJOsen
	rIQaB2Yv4+rqYwLPmoHlcXqop8tYo7RSD
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075645ad.22.1793082137698;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075355ad.22.1793082137217;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4003565ad.24.2026.10.26.23.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:22:16 -0700 (PDT)
Message-ID: <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:52:11 +0530
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
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261026130559.GB3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX59bTfmWyzMg/
 fN5c8AKNoOL20uw1qItJErgNWRKs99Yn8fidIMouDwm/VBuhltp/ikYr/f4Y7PsDihtgozamaxc
 zlvKZIynR7SF3jzXPXvz5IXplqeyfhY=
X-Proofpoint-GUID: jZNZOJ45RlMUMko-VBlR1VSTinuCB3hW
X-Proofpoint-ORIG-GUID: jZNZOJ45RlMUMko-VBlR1VSTinuCB3hW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX/H9YF40IWwS9
 Ka6kBWvlaWCxZqAUJfkWubBIslvG+rna011ETFJ3AFJcY4cd8jvyzQ/ItHx+0UsbBTjqomdhB7R
 kZ0zWHGfl6SLVirKPO2aLECAeJ8JxdxLhxY94fRw5Cuns5aWjFZ5GIQtc6X6sjALgu4W+Fz5+W8
 Jk5DhhFDk4oD8yETkfZA/XiFOWMncAoMdMY9+nWX2cC6nmTqY/i4/ikuOw0yi+SifGcZZeUz5oJ
 iKhc2k2tXl/8jS3Peb99wRDH9OY+PCocqIh8qT4LdQOtSiUNqzX9jzQ9fXZNxwqnTN5HYwXwxD5
 cTgQOmpTYm4xKmT8kxflyUTKBLE5DKH9wZSN8+EKIJ1IHCug2rqk0bD46ih7POHXx/s/4UuXV+L
 8ckDgrfv6TZSHvgBPuEezaXscrBQyMtgit7/rEkgDYUWr5RtrkVAoxEoQLqdNid6JPFKnPx+bUb
 nKL+7/r8UeC2OEv8S0A==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0431a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=zuAiZn09hdMMTQJ27doA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270025


On 26-10-2026 06:35 pm, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
>> On 22-10-2026 07:31 pm, Rob Herring wrote:
>>> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>>>> arbitrary host memory.
>>>>
>>>> Add an optional memory-region property to constrain DMA allocations made
>>>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>>>> for the remote execution environment are managed separately.
>>> dma-ranges is normally how address restrictions for a device are
>>> defined. Why can't that be used here?
>>>
>>> Rob
>> The constraint here is access permission, not addressing. The modem can
>> only access a carve-out that is assigned to it through SCM.
> The reason for the constraint doesn't really matter.

Ok, understood.

>
>> The soc bus on Shikra already has an identity dma-ranges covering
>> 64GB [1], so there is no addressing limitation to describe. dma-ranges
>> does not reserve memory, so allocations would still come from the
>> general page allocator, outside the assigned carve-out, and modem
>> accesses to them trigger an XPU violation. It also applies to every
>> device on the bus.
> It's a bit awkward that dma-ranges needs to be in a parent node. So you
> would need to put the device in its own bus node. But if dma-ranges is
> in place, DMA allocations will only come from within that range.

Thanks for the correction.

>
>
>> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
>> provides a dedicated, per-device region, which is the setup it was
>> introduced for no IOMMU, with firmware restricting device accesses to
>> specific regions [2]. Stephan suggested this approach on v1 of the
>> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
>> same pool, so a single assignment covers both the descriptor FIFOs and
>> the data buffers.
> I suppose that since the memory region is dynamic, 'memory-region' makes
> sense here. If firmware determined the address of the region, I'd
> probably feel differently.

Yes, the region is dynamic. Thanks for the review.

Vishnu

