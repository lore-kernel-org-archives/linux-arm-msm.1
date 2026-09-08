Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893B954939C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872868; cv=none; b=AKI7GzkcegMZSV55IfHWcxZVEBkQJhhludHNviKrr+SD48xdIqNVR7DYF26VUICLM/KHj/2ali4QwyonY9BhAG3t6UiZLGVt5odJtQ+mI8sddjQwYa5aejymS745FvynPtnkPkfF7INlEgXK83t5sETsKjkL3OYZuuWD6GG8r08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872868; c=relaxed/simple;
	bh=PQVCLzRy0grw3zirN1qPDu012h5/zvKvLsN103jBL3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGMmb1M+hB0jW9FPevwwMf+yzwzbFXPxReFcC8TK5Yw64dNnxPOUCFMRvioNdJi0mjg/0ME62NsoKvUwUayERkXPBBkiKCzZPWoXYsLCeOITk7CRDf6UYoYFhWGpdQqAvAOA+dFv5ZSKLtTY7qugyQo6Q8YyDQ0xeAndL2ACD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5FKPAsd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ng/hr5Db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5FKPAsd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ng/hr5Db"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkiEV3033400
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 13:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZV77+/smsI+gdJupmOVtQAyP43QJBNhzN5UmBhSrlAI=; b=k5FKPAsd6sxjew1o
	TyrZyh6W+xE8M/jepasvvwUreM6iAqi64zZpc9rA1ZFk3xUxEd7IH03Y9lhOvBKy
	pCeNO83pqQgl16eOeXS4tp4khXnHyoKDWN9af9fzp6NR8PWr1J8G3or9KM6lhUYh
	2TkeHxrBS2AB8RMYFP/i2qUzSPXpSYpje09cT+RunbguCfAnUS+PddanwPboST7P
	dGQGHzdQsIIaD090Z7cvmsydQDNEELySncJZW3P21Gs6OW2uRmDzH+UcdlngpRqU
	TKgmXzuo8oYmsbr/VIW1EMuTD078efQgc9xkjiuDQ/MgpXQ5So4zDSO/tF1HMg6Y
	xjSIPA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj0b32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:07:45 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4bb82497a04so17610b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788872864; x=1789477664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZV77+/smsI+gdJupmOVtQAyP43QJBNhzN5UmBhSrlAI=;
        b=Ng/hr5DbWcBsHX8bXphJ9aLQNFNVu8GYH7GoNKqhbDp0CnyExCQiT/PTo1u2+pr6TU
         F0RMp4BcNgO+JmzsRy/jVlkqJ6YE6yrmOzXdR+YO5+sYRUblZTtsGaUIxH6FoFeS+rG0
         CTk3NclOJZSkOXIWkK1gRy/0iusbcz4FM1ndv7OdJ7v4zva2BDxU6Pd4vHHBxmLgx5kV
         jQ6uROE5owHf7SX1qM+yWj0bIFW/9zk1abxBDwE/KtX6ubcTjy9Fh0vFdWwZLZdOXTJa
         d2Q0MnWVXU+pIEFTruimXq+ZAxIYnZ8BBEJBXdAVNp0oQCa/QTaVz/tlfEFB0XNeBSRI
         BsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872864; x=1789477664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZV77+/smsI+gdJupmOVtQAyP43QJBNhzN5UmBhSrlAI=;
        b=nmJzsuNB/ccoIQLK8MzKhEva9iHyhqMIpjr+ykXdlrvBIBSI41yObuf36ZeLl3CNmO
         fK2qgjviBm9MlO/YJFIlt8jbFkhH2YxXL+SXT6r0lrMObz6q0VirlQGscl+IfLHl3djd
         s3uFUG5ByPdrqAtXUxE0gGX+i61X1wLWKf0h314KrkAwmaasF0Zg5rW8lrKyJBF3RBIa
         UHNGLLxbBUKgnXNyHzCokxMa8OCx2mE81Bv3qVUVOZtHl5AoKeuEO0eTH3POPtDgnCrY
         xcC8awn55qOvy5Mc5qHFui0WSMkOuSUkwaU5sWwlExg72hVUZoRrxEYzwo8sBhD6gHXH
         iv1A==
X-Forwarded-Encrypted: i=1; AKwUvBzXiW47sBy2y9A6lOp5gVd/cm2vMWer+s0KRnoOBEqBuQ3EbrlyzStSFJQn4AOwKr1X1Hew3llzBsb10H0A@vger.kernel.org
X-Gm-Message-State: AFuF++mG+KzB/NVm+3u/bbntP0WIzesZxer+Q90Lr+XhsNS11pMQNmbX
	0mV7J2zlwNitEw0/yloItH4/44tW6fatKVtKAi9KcgmcQTL86yYjm4lwAyZw8LAz5/FpU1ZM3Xc
	NsfqLIT/9S0gV6mKohzAKBmoIOPMSaxqkIUv9SE9+qxrP7KcnyyahjC2wzcy0XdggesI3
X-Gm-Gg: AYBFou3jzKu6Rjmx3OyQb0JMTxWOtZxW/UXpoSy9dIf1MN/kkRBMHr/yYQMwsGpKbzc
	3eljxACvwaLJZPKlBHzidLouIXE0zq/DvJ7PZpTOCb4KDJxghJU+TPoTrrzBSlcG1b2iolpWL6f
	efyC0YY+xAMZk37jy1TrDPY5oiUU1PQq6O8xcWo2zHs3zyavaSJss1mHHRB8ClIti1dxIioAA4d
	dppEKtKoL9X7XpEbzCsgQsOJmZO/I4i446sxKL3g+LrsnzGNpB9cQyF7GNmEarDTt7+uK9JFjmH
	6KSBeuuxgif1ZNH+yC8uWhA0b0YvMoOZadnr7JPh4RzYfMg44e3AgynQMOTX6uwdcn5Wd9oXk0M
	9wUSr1/RC/UsC7NykpgKojg==
X-Received: by 2002:a05:6808:1a04:b0:4b5:83f8:781b with SMTP id 5614622812f47-4b96e274706mr12677348b6e.6.1788872864088;
        Tue, 08 Sep 2026 06:07:44 -0700 (PDT)
X-Received: by 2002:a05:6808:1a04:b0:4b5:83f8:781b with SMTP id 5614622812f47-4b96e274706mr12677301b6e.6.1788872863450;
        Tue, 08 Sep 2026 06:07:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5773c5sm615362266b.40.2026.09.08.06.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:07:42 -0700 (PDT)
Message-ID: <22bfce83-a438-4d40-937a-f82709987bdd@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:07:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: rob.clark@oss.qualcomm.com, Greg Ociepka <greg@ferrisoft.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260820154428.1278@ferrisoft.com>
 <30d4a7b4-1f1b-4589-b132-2115cab98b71@oss.qualcomm.com>
 <20260905085428.reply-a8xx-fmax@ferrisoft.com>
 <CACSVV02JMXbUWYGtAv8Tiq5EoAi00KYyfdBUfDGzuETu=rS9GA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02JMXbUWYGtAv8Tiq5EoAi00KYyfdBUfDGzuETu=rS9GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX5w1NvXmxLTvE
 ijqnu52b/ueC1zBC/5NpwpRdfpHBjg8kh/f+omp/TxLbEnaDpKpe2Ap4TnDBuwe38Vx2ZEJXMLq
 tl37oka3XgQ3s0ZU2NbnV/HoYpd+Hh4=
X-Proofpoint-GUID: 4XCWz8YCmS2Pk4hvE7SXIaK1177cJ9Ox
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa008a1 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=a8UEx8NLAAAA:8 a=2z1urA-kA-BrcP7p-FsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-ORIG-GUID: 4XCWz8YCmS2Pk4hvE7SXIaK1177cJ9Ox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX2zvRJrNCXFgt
 yxwagHC8jQ1AS8Iz0QwHkiRHRlt6UX4IaalL4ECUYuFZRmLMwBpcQyFaA/o+9LZUFaddJED6pdi
 b2359W5b2hwHFh4J9eeWV3kTZYiLlDOKEGRadfAUv0PgF2Ek1sNpwnZaTRBRpwH+Yg7lVg4Rw2k
 5N0hvbh28yGmlQzhfCPQ0Hu4GyigDGfIU8jQFSH9CDJDmTuHyzuF4ZhnKS3eGBuTmKL2TPt/kVb
 3N4DjpP6z4zfC2147hKrVMPJVADvN1MGv/Yp83XllJgqSuVmsAb4l0/jq4TfKjdQlnvMPOrl548
 VHAC9Dp9Y/3EqbzsVzpEPZ0fxzF71UqOhRJK1cYAH4/h17vPsCFttBUC0j9vJzg9XyQFQuDdmWW
 u78pPzeGhnMAqjyAEubYCNr23Mu0iT3AGEec0p1/hpfbFrHuIqKLakUzAMVf1k3lLuj5oiXNVwI
 04dvpjuSV1O3X0xYJRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080140

On 9/7/26 6:33 PM, Rob Clark wrote:
> On Fri, Sep 4, 2026 at 11:54 PM Greg Ociepka <greg@ferrisoft.com> wrote:
>>
>> On Fri, 4 Sep 2026 04:29:16 +0530, Akhil P Oommen wrote:
>>> On 8/20/2026 7:14 PM, Greg Ociepka wrote:
>> [...]
>>>> We are happy to test patches, run instrumented builds, and provide
>>>> full journals or devcoredumps - the machine reproduces this every
>>>> couple of days under normal desktop use.

[...]

> Fwiw, I've started to see something similar, which seems to start with:
> 
> Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
> [drm:a6xx_gmu_start [msm]] *ERROR* GMU firmware initialization timed
> out
> Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
> [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set
> GPU_SET: 0x8000
> Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
> [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set
> GPU_SET: 0x8000
> Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
> [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set
> GPU_SET: 0x8000
> Sep 07 09:19:10 shady audit[236335]: AUDIT1123 pid=236335 uid=1000
> auid=1000 ses=3
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> msg='cwd="/home/robclark/Downloads/deleteme/darktable-bench"
> cmd="true" exe="/usr/bin/sudo" terminal=pts/3 res=failed'
> Sep 07 09:19:10 shady sudo[236335]: robclark : a password is required
> ; TTY=pts/3 ; PWD=/home/robclark/Downloads/deleteme/darktable-bench ;
> USER=root ; COMMAND=/usr/sbin/true
> Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
> [drm:hangcheck_handler [msm]] *ERROR* 44070041: hangcheck detected gpu
> lockup rb 0!
> Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
> [drm:hangcheck_handler [msm]] *ERROR* 44070041:     completed fence:
> 581164
> Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
> [drm:hangcheck_handler [msm]] *ERROR* 44070041:     submitted fence:
> 581167
> Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
> [drm:recover_worker [msm]] *ERROR* 44070041: hangcheck recover!
> Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
> [drm:recover_worker [msm]] *ERROR* 44070041: offending task:
> gnome-shell (/usr/bin/gnome-shell --mode=user)
> 
> In particular, "GMU firmware initialization timed out"

I'm surprised the GPU accepts submissions if that happens, it definitely
shouldn't given it's clear it's not going to be powered up

Konrad
