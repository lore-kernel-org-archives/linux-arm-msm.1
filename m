Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DEF3CC310
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032329; cv=none; b=IYZ+jGlNNri55wliQcxMFjRr2hD93rVCqB12PaDBfRTrV3STJCz20z32vidTXK3R1HB71x42Gdpt60TVVkSzpqLAILnEX4f6hnliaUZiwafGf49zlO8LpNlFwRq9ySJgCmnGwS5wwRKpF7C9drF2hHTvUReF8E9S/KEjW4a2qMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032329; c=relaxed/simple;
	bh=t7zqK2kfTIdM7DeJsFj7PjMFIgkgpjQMOw5BoqQOa/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxV3bbr340l6XGO6D7CvSgLlQIacZbUFrzXLkI2TspWkW1chKDQRLd0C3ZbZan8Nzztr9BRcZS4/KKB3KV/RN52S8hfw+ECywq4mBN45Twu2KdM7qdoyIXFKbCQ8p1vxJPcrFhiclqCiEOVRy+/mT5GKfFgDcnViAwLYjIkU/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMcr0RWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5HEC0BG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMcr0RWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5HEC0BG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I465Js4187349
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MGPW6/DK7pn6fKMqjuLg89wJJuJK8oCiXQggTwY6zk=; b=DMcr0RWQv+aJkxOq
	gUbCjFe3NzYI3OjesOMkpzJTRXBjrRxwtH6VVpZBWH95TK5T4AdoohWTSaY/Pe+J
	7tE2qg49EPqjakmV9X+lzItNlEm7Ty55bS8kqEOEnwYgmz+Q+l/A0UzCX8B3sPM9
	sDLkI41D8h8nuCTY9rYTbpOgu6mrJUSjA2Qvflpzd0evQ7B++9d1DY/3qUvCF6bu
	zrx997uDw6q4U81ym76aIR6FRJo8UnMBeBbxrACpSQDKGrchomzeg+g28RME5jk8
	9ksRJuowsPPRozywktrveZAJuq887VPVTCAA2SLmyqcwqlWkg94kKRxXskHAGgDH
	aayzoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p0eja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:52:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f7002f9afso3697382b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032326; x=1787637126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MGPW6/DK7pn6fKMqjuLg89wJJuJK8oCiXQggTwY6zk=;
        b=a5HEC0BGcsVO+fnXI/jcgLBZ1rKBMbq2EGj6+HQ9x6LICKHMO8CqS3nPi8M/g7tFb1
         4ma6ePhK5NWSrgxqOxuTZGC/pjzKefPEwI4biag6nYD0s/2sy8IUPX5kKl3EJs+NWU24
         cHg2csMR9JZGaBahSFruylxq9fK/l0BU1vHyj2jQibTz9/M+tGgJxgOxMyDeQr4rLuZO
         HoYjH5kC+m0pn8hfsTkjDXN8Yn53SECQr/3T73B/2reo4Mw3NyQKbbk7LApaibxAb9ST
         TTpVGe8acvC3Ik4Q3UUvlcYFSlIUs51s5qbBd7oT25735zxxB8k2oJ8zuGUNz98qPPfE
         fxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032326; x=1787637126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MGPW6/DK7pn6fKMqjuLg89wJJuJK8oCiXQggTwY6zk=;
        b=OzZaDCMcqCqsNboBgGLLwihvzFv7Gl+4INjALUovGPeDYR7iVToSXk0MDDQEa7AqVa
         W7Q7NtOfNqX72OZNlwh0c4pBIz7PzdTaFn1DpZkLRKPoPPLz2HYOz7pbGp0g8QsOS2cn
         6/cgmtKaO86htxYToYFnW50SDn8HRojgmQ8baDq0uBYoGZcxSILZhWAAIax4kZIr13oi
         jNl15XkXOz3Z8qYDZd12FseTuEDSVTawe9Dkm3jZoN3CaB0n4ACibV2adSE4PnB4oIRB
         55G9KqULOGV4lx459mR/F36RTlEFlee/u21nZdIHfXQOFNNdAVz67/JtwyPeVNdDrxXi
         8RIg==
X-Forwarded-Encrypted: i=1; AHgh+RrIC5fLJ2dUOXw04/I+G72qEYJfFENHU6pJqQGi0dSoVX5I8qq87hjXrrHYoh2s5zEJGfuQ4W0L4EO3kicG@vger.kernel.org
X-Gm-Message-State: AOJu0YylZT6m7FHcGaFPttN0snnVhDocvykNRd8nyOZiZTU+Z7mXsJDD
	TzKsUiYTfAmFuji8UScVAfDMVa35PxTN8pMljOgpej495Aam+B/9BgxFdlLLethYoMb5o5BzkXL
	h9K8WJE2iNyxZZ/1QvZe6zz5ybFOf7WnJa+YJH4ZS3u/VhuuP65PPEwzeO3qW7G05qtb+
X-Gm-Gg: AR+sD10QWd7z6tm6C2xWQ8HHaMO/SSqZjPPh3p9rk9BAikj68PImhfbW5bJ7PTBhFS7
	IReVMrA3+SR1u99+n5J4ePGmYm7HR66R8nhQZql6pTnqgiCq451uvCgLeMWJE0U5QQHAUkqSErO
	A83LvDRiVpagmjwhRP9F17LzzvCobrrmFTilBCsw7iKl0GknBUC/XZCODopjmmoYBpmXduDVPok
	zhWxjrGargFAf5zRvld1Fu+wfkLT7UlLhpyzAAcYie2fsJfVkbuy9/Ga3yke4uzBCydnQogObvE
	EYdlrDqJbGVH8mAsoSpVcAZ3mUZkantTGh0Qc3SmbJZq+t8p62JgpvBZcNpUg9OWkLgnGtJMiT6
	mnGDIW4r9e2zmqGtM9JH/jSEE/0Jq/Q==
X-Received: by 2002:a05:6a00:4395:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84fde14ffecmr33705026b3a.7.1787032325955;
        Mon, 17 Aug 2026 22:52:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4395:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84fde14ffecmr33704931b3a.7.1787032325493;
        Mon, 17 Aug 2026 22:52:05 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b4072c39sm1284034b3a.26.2026.08.17.22.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:52:04 -0700 (PDT)
Message-ID: <2d092339-a691-4539-8419-c9606ea35f68@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:21:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <g3dkltejtlzrrelv77kjteqbkny6vhedyuet7d6b2p7yfix3ys@sop7vjvpdvzb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <g3dkltejtlzrrelv77kjteqbkny6vhedyuet7d6b2p7yfix3ys@sop7vjvpdvzb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FekZW6mITVvytsqQQmhXUpwM8af4Bi38
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX689OLZP6aAQb
 c6uvsRBGjH3xU3gNWOd+AYBT/5yqn+P4fTfG9ZAYMLewLl76K9C7yaowUIz5hsfvPS3g7tSaUto
 jmnXxG2iMdf9EpD5RZT70fM2YmSY4iU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX3eIhcY5ffEnl
 Ogt/7WtTp2OrSVpZsXCBBvLMu6tT1pgEil41rC8Y43PUNNIil9mX1KyNWKKfsoK9F+61K93Iyzk
 NgzsJQv6GdwAiHVGi9/PNs/IN6iiKRehsopHFcKAhTNlnUWfDGlv3pip+BxPT8vPaau4iloF7JH
 w8tahAMdilMLt2pBYKDJrCR6NOpTdBs5J3VX1gdERgpT/WdBkeK6DhEDWhe6Cgom0MX890heHQp
 MSGNFDKUGXMkVNmRoVbVyjeowzg4QTd6jHx4JBtb+VO1vyXeFd4m0aX9YBpYzJVa6LVZsv5Cvk/
 O9Fn/ilPBj9LvKTptZ7xAotC7MusStwDlujEjUajUJxVXZZjUpeOhHdH0oxtTrpgjZV/+0DzxaL
 lR4iYmUVLHddRLKUMUDX/WlRUue1yJJISxNkWQnsuuFLjLw2A16aXWWOFvOyw0mZ9gBmheuNo5y
 6JZYoQ1SP7rM9QQ2ntw==
X-Proofpoint-ORIG-GUID: FekZW6mITVvytsqQQmhXUpwM8af4Bi38
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a83f307 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=U_ymhupkC0DnaqHl0NQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180042

On 18-08-2026 09:12, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
>> Introduce DMA-coherent buffer management for the QDA driver, wiring
>> together the GEM subsystem, the IOMMU memory manager, and a DMA
>> allocation backend.
>>
>> qda_gem.c / qda_gem.h
>>   Implements the GEM object lifecycle for QDA buffers. Each buffer is
>>   represented by a qda_gem_obj which embeds a drm_gem_object and
>>   carries the kernel virtual address, DMA address, and a pointer to
>>   the IOMMU device that performed the allocation. The .free callback
>>   delegates to the memory manager, and the .mmap callback uses
>>   dma_mmap_coherent() via the DMA backend.
>>
>> qda_memory_dma.c / qda_memory_dma.h
>>   DMA coherent allocation backend. qda_dma_alloc() calls
>>   dma_alloc_coherent() on the CB device and encodes the stream ID
>>   (SID) in the upper 32 bits of the returned DMA address, following
>>   the Qualcomm FastRPC convention for IOMMU address space tagging.
>>   qda_dma_free() strips the SID prefix before calling
>>   dma_free_coherent().
>>
>> qda_memory_manager.c
>>   Adds process-to-device assignment: each DRM file (process) is
>>   assigned one IOMMU context bank device for the lifetime of the
>>   session. qda_memory_manager_assign_device() first checks whether
>>   the process already has a device (reusing it with a refcount
>>   increment), then falls back to claiming an unassigned device.
>>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
>>   to the DMA backend after resolving the correct CB device for the
>>   calling process.
>>
>> qda_drv.c / qda_drv.h
>>   qda_file_priv gains an assigned_iommu_dev pointer and a pid field.
>>   The .postclose callback decrements the IOMMU device refcount and
>>   clears the process assignment when the last reference is dropped.
> 
> This provides a nice summary of the patch, which is pretty useless.
I'll fix this for all patches.> Please teach your AI instead to describe
the reasons and the design
> decisions instead of just assessing what the code does. Why do you need
> memory manager? Why can't you use existing GEM helpers?
I'll add more details for this in commit message:
The DSP requires each buffer's DMA address to carry the stream ID of the
context bank that owns it (SID << 32 | IOVA). The memory manager tracks
which CB is assigned to which process and ensures all allocations for a
process go through that device.

`drm_gem_dma_create()` and friends allocate from `dev`, the DRM device
itself. QDA needs to allocate from one of N child CB devices (each with
its own IOMMU domain), selected per-process. There's no existing GEM
helper that takes a per-allocation device argument.

//Ekansh
> 
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Adapt to the dynamically-sized device array introduced in patch 07
>>   (kcalloc'd from DT node count, replaces fixed QDA_IOMMU_DEVICES_MAX)
>> - Protect register/unregister with the process_assignment_lock mutex so
>>   the device-assignment and device-registration paths are serialised
>> - No functional changes requested by reviewers on this patch
>> ---
>>  drivers/accel/qda/Makefile             |   2 +
>>  drivers/accel/qda/qda_drv.c            |   4 +
>>  drivers/accel/qda/qda_drv.h            |   4 +
>>  drivers/accel/qda/qda_gem.c            | 134 ++++++++++++++++++
>>  drivers/accel/qda/qda_gem.h            |  52 +++++++
>>  drivers/accel/qda/qda_memory_dma.c     |  82 +++++++++++
>>  drivers/accel/qda/qda_memory_dma.h     |  17 +++
>>  drivers/accel/qda/qda_memory_manager.c | 239 ++++++++++++++++++++++++++++++++-
>>  drivers/accel/qda/qda_memory_manager.h |  30 +++++
>>  9 files changed, 559 insertions(+), 5 deletions(-)
>>
> 

