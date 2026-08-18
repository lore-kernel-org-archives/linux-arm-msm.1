Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F949375F6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787029838; cv=none; b=mFbmX/2J6klpDmoandU0Mqp27w8wIxwvX4WrQ3FzR/9uRUa0g7PK4vhMNhAkTDjln32/dKYtL7tMH2/QXHrlEAfEK0PEUW9yNT3b0+rjfdJ4nx5z/NYt+hpnVI3Vf3y9veBC4N7ULA0VXRH+1+gcT41Ej2r0R5bva5PmcGEEPpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787029838; c=relaxed/simple;
	bh=FeAbcPh2BNksaU1ol+KzsK0r4wOWdTJppcdaT2TRPqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJQFSqOyGtt9Qn8Nyf9KhesXnvuWVp5NGNSnrnuGddUJEgeatHkMxaiE48qcCTbXo/Qdg9DVfSrvWxqID7F1cdXlnOChLKN83v84NoOlXfEO7qoiyDFGRaiGB5FGSfokIwn9uf5SsuGAWXN5Zz0ewNYgoIiNqWDQyrGGqjfcSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeBhHxQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWr7poZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeBhHxQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWr7poZJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4x0iT3531735
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=; b=KeBhHxQZWxpTR36D
	Psjvj/wq85jpkNoelRCr7GA7IQCCNbmQzbbatB7HF/+kMmEmIX47iSfKo78TrcSi
	zRz5ZSG449nqvSpSoNWzt68dQQgrrECiYvvocNwe0bQUC3g/OuRn/tEfNoxb24oC
	O9wbXTcyPL56yRHFNej8KVXdeaEMBbZEEIPNDfRrpfJcoG68OgijLhbpI6ejiKy9
	0/VB2vb/qCwEl8lPPqalgpvM78u5K5Sp+CNMHTxsKImtrqVSh44YqH9H+pABffO5
	hr6Tf/yxspMv8oPqYzuJdIWNp2SdtEDSQsiwbvkCPxvoGVfB+nOTF1tlZ9n7YP78
	D4B/iQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615jm89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:10:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e1da97175so5312861b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787029836; x=1787634636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=LWr7poZJYk7Q0HTF5LwrWCT9KE4JuohiFX3PV+0O4QlVUd0fXDrxhbK9qUC7HsnJaf
         rNQ6/FfjGdng7iKIft9KFK12ZpAfHG7VeogePVdd5k2jeX8bY6RWpUdWocaW1rQ5NOhx
         99iAa6i0hHaiEY+krpniHI5EFQHpVETeZX5FI8xDeS2/vfddChZO67qTSCzgc8f5KOHD
         8rM662Fuh8v7cHO/p7py8HFJO3etIDGjYUYDEzc5M9Qtkj2opIZNy3EowEryaU1E8uZK
         7shtfAzhDB7RIFDlCqeFv1btfd4hM/u7fqWUlpYBQZxj7xPFIdJabOO0Y+5pWIN6rQRG
         ZvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029836; x=1787634636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=eBv4OSdAc/lWugfYuuL2myPj0EPpBzrPbwagBNcV1FTzuL6PPJGwXdI36kcC9eFg6D
         sEiC68m5VzniVPkP47hdOw8/2ZpPh6YS9x3BH08mhkV3MoRBGE9dCCCoqaHjR7FjzcyF
         XMQFKt6tF8wfWyA7+IjTawQnpe/mbOqEQm/HNj/TRWHvIrVRHhSmnPDmoCvRESDcHC9d
         1UNxfyxiHuPsQWSI09Wk2178/OnI9ohtSyPnB8ZosWLb8oPKPodRgfH6JF91amHS6SJu
         cUHFxBJ0TOM6TmL34QgjfBew68WJtw24eEMnHhZNf93IaJrlftPaQ5rYUpJa/9SWQqXV
         66/A==
X-Forwarded-Encrypted: i=1; AHgh+RrbqNLibrNeqF8H6LJG/WZJPfuuvRopRa0VyAwxYW/s/uqF8kmZwMzkyvRxGglfNtJ7Jd3PSTKfNxZdEKcT@vger.kernel.org
X-Gm-Message-State: AOJu0YxguMQsPRkEaydgR1SD8n3l3ZWFuLi7gMnRu7AurVhsRmPfSOe7
	tQyRsk2MsamygQlU27yc9ViOAYojtGWXAoLgPYQS8twdAPUGOcdsmtCn8fgPN3fOnaFJ0cth9gU
	K/DjLYLYQnGLlW1vEog5UFfc72iDFhu7EtYJr5DvhAU77Pbc7ksz+zYS39gT4N6z1ea54
X-Gm-Gg: AR+sD13Ex2Lmxc89QaL0MiCo4RrAhd6Oqhg9hV8hupcv6dvy+UL7jVTBcLm5wwEK73y
	Ka+pus/5zrv8hXiCAONN4xIioGP/VTjttyuES1su+RCZL9Msaceop3yknkFm+Hj/Y1UnkpjCigB
	G5sb8JwpJ4a3/+rGYhkAhlNsMHqqKg43DGw18VqFMqbbqd+1/5wtR7RMODLOHcEhuvf5OGYSej8
	X9jVh4VGI8cNCowhUkP1TsjNP4JjgBEAUyxAXFUkfU8xs7AOkvjszr3J/Lrq2TjhmnjDx5YeRCt
	q2+bFDBLyo0PlaEWKfM+1R88yhXKqbW3WCCADCIwexbI8ks43FvkwMo1sPwah/KzQz3Do9uxWaT
	baXwjx/9Uc2DnpBJ6IJ6ss+PDJQ/InQ==
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499671b3a.13.1787029836094;
        Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499576b3a.13.1787029835654;
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6ff2232sm1015652b3a.52.2026.08.17.22.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Message-ID: <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:40:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
 <20260817134416.GA1415075@ziepe.ca>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260817134416.GA1415075@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -4B-Bo4wh_E1aLU1rBQb_F4-VsrRaC7d
X-Proofpoint-ORIG-GUID: -4B-Bo4wh_E1aLU1rBQb_F4-VsrRaC7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX9pPcAoY43fm7
 ZYsjM45zox78aeKOJMPHPgLPCd6JeIYZb+uBKNf4V6IE8bb8gyLg/hJIaCdEYx2am2xgiUFg/hH
 nsgHRXa/mWJGGS5OAWrlBJWZ1Xvjf49RDEu+Xn0d1pYsqA1anbHL1if9wL/oZYopkkOOoJdC0HJ
 8TVC5V5fPU5GxYHozJ2YhoxIb4+KIaJAEUM4NnG1W1rwYHDezJWXHAC0lPzMlPVYKkenIExDViT
 FZk1+9ctNM8ay57Uji0QGmOJXUoNjCNvq3ZK3WsPzh8pkiXg1XJZboCaofBgmQvNkVE44OmPfYy
 eQ51N/ESWRQKIGHsrqOv6+B5hHS+o5VykeU/dHLH68vHtnIdXsDabLq9Ifb4LXB4wdODAQ104ez
 sqfZ0mvW+o1GVbSHJ5VNEZlkQkyGhuT3EMY9Hajmz1gyMDokN5sNh5r4ElH8nWFzZEz+4T9ntQq
 jaKtX2LqWQ9gn4wbZBg==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a83e94c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=UlZBYPnkdO8YS_jrOJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfXxuaHvah94i4N
 /ruETDuwM7bYMtTQ/78vcrCyC6DWqkgZ58TP5RwUBwGMGkSWgvvqvmIdH9k95jO5zCf+qqqLAGb
 vL8faA4/9Y0RlgSKZxleJvqHgUvbhU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180036

On 17-08-2026 19:14, Jason Gunthorpe wrote:
> On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
>> Register the QDA compute context bank bus (qda-compute-cb) with the
>> IOMMU subsystem by adding it to the iommu_buses[] array.
>>
>> The QDA driver creates synthetic devices on this bus to represent
>> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
>> so that the DSP memory manager can enforce per-session address space
>> isolation. Without this registration, the IOMMU subsystem does not
>> probe CB devices for IOMMU groups and of_dma_configure() in the bus
>> dma_configure callback has no IOMMU domain to attach to.
> 
> I didn't notice a clear explanation of the proposed DT schema for this
The context banks are described in DT as child nodes of the fastrpc
RPMsg endpoint with compatible "qcom,fastrpc-compute-cb" and a `reg`
property for the stream ID, this is the existing binding in
Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml. QDA reuses
this schema unchanged.
> 
> But it looks awfully similar to the other driver that was creating a
> kernel synthetic bus for actual real HW, that wasn't well liked.
> 
> What is this for? Why can't you have a normal DT binding for the
> iommu with normal devices?
The CB child nodes are not separate addressable hardware — they are SMMU
stream-ID assignments described as sub-resources of the parent DSP
interface. Using platform devices for them was explicitly rejected by
Greg KH [1] and subsequently using a generic shared bus in drivers/base/
was also rejected [2]. Greg's conclusion was that each driver needing
this pattern should have its own custom bus type.

That is exactly what QDA does: the qda-compute-cb bus is a per-driver
bus type with a dma_configure callback, following the same pattern as
the existing host1x_context_device_bus_type that has been in the
iommu_buses[] array since 2021. The bus creates devices synchronously in
probe, calls of_dma_configure() via its bus callback so the IOMMU
subsystem probes them normally, and tears them down on remove.

[1] https://lore.kernel.org/all/2025062434-reviving-grumble-1e53@gregkh/
[2] https://lore.kernel.org/all/2026042442-luxurious-antonym-f20c@gregkh/

//Ekansh>
> Jason

