Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CFB23EAB4
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 06:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329359; cv=none; b=bv5QSn6fA56XFfMdfcEmeSzg4nScXQruNRM06XXct4116n7TUSBrjLA/MvY7Po1D+pP1ZPVqJjtVpSC8NtM+TlKr4TZTg23kCDXlEMjof4iSGQ2O5mLVNQA4ZXQ1c+WVzQOpjo/j9dt5MHs5fBVMBxAJvBO/agHJf302WhipUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329359; c=relaxed/simple;
	bh=2O2tLbCSCtHBMYey+e7A3uPt/HONNbOYonSDFLRuS6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2Mpk2EbC6Hfe4hyPnbgIa0SS3z+trUC43vweDQywE7/Kx5vQ5rkK50T/F+pkg4jW3CV2UIOEURwDVef+zbkw/orDiG6dFa2cxDxUvnHDNNKQp9aMdfpG5j1kVLA/Lbzsb9oCle9zfcpfHJrttmPOFPwQ9px7boYQ7HG0Ae1noA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY2IK87W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aO2f6a0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY2IK87W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aO2f6a0o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YeKq1323026
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=; b=iY2IK87Wvd1cPHXj
	BEIzJxzXQgF5YJUqKc+O0//4SjcTUqNeqWB4IZqatIxHAQUhcdkNe2HuxeGqkQDe
	AS+DXJdRpQDmiqEGLhR/SiAZ7Aa0iGD2nXTcGkSBcY5EEAv37Xg+YmlgItF8227m
	I2i7Zl0caFKUTYvLEQ3HsiA+xisvHR/1XNAnGzqoqj9wFWgMzDW/29O7s2Js/s8e
	3Mq6pKHr+EhWE5WyhB9JDvLKG9mOA13findwrYj8S/figRWE7Fci4zyxyThj9Kod
	xROgMtRfPZwRJ51q3dUbzh+XdSzSGOtelvkO1/7NQu/LLsI4FnOcRY46bVOzNJOS
	EBfB5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx0h53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:09:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cb806660so991614a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 23:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329357; x=1788934157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=;
        b=aO2f6a0oMeu/5b4v2er9puwoGM4kvphKFpAmoQQliEkf02mhNxFHqs7pRI3gWQyx3+
         Hoat+1BAR8tuJTpwh5AypjilVsTEolw+16odcce5nqK9FckNjij9uLaAgxSfpvPVZMVZ
         zZONqH0OlbFPgf3ET3gsq6xMp+9G7Ldhyg7xrxsH2r4CwjCXnc5MNVExLLYIEEZf8P1o
         AX7B2kXUqqyl04+jKImHvVGE0H+19mIOb4K1QbgNQoBw4/IkDheF4KupcXO1L7BvHuSI
         iLREw88Fau8HjGxiWz3YvGgBfhG0wPUf8aGaE6r99l41UrUCq9e1zzCC6df+kIUrXyiK
         VK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329357; x=1788934157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rekHoOCBWmiKDF8X232OJC4hGvW2Rl9Y34JGuZYLqzg=;
        b=o1jrkM73mnd+4X4Hjs6stNMXKbXNWO8vLBSiniVG6AFrXJdQlDCCdeHwmN3060zhnr
         kUCBDKSG8+XUowbDtwOIT08l6hT88D2Ih5CgvLvAA82NpYQtw1rx5J5OeUPfpuIm5y+L
         8gqHxAsovW9hQGA94llmFNNKRdtWNl+58Vc6CTRPtj983q+j3z+hyUu7BKAlgu5TDQ3H
         al/dMUDjlo9E4jx5phKbAmau9sQWjZtUwIK1LzgyWyevTCtQeL/0YWTOL4MKf7BoJG3Z
         Xswt9nYV5H2gR/YkVBv/ZRQUcR8koZ/BfJ6O1N9ImQrrtQUCeA/lnzeXu65I5X8HtcZh
         F40Q==
X-Forwarded-Encrypted: i=1; AHgh+RqMY35YJnI4r7djsmWpOtOxRq765pbxZsOcPwdQ/TSuAlPbo5XmQlg7egXx44ZUuQZuoxGtmIsRkv92UrP7@vger.kernel.org
X-Gm-Message-State: AFuF++malOZaZsjbN821869xEM0GwIuxjP9X/NXLMieu7oWGczSUalcj
	SiUHPO6UrLR8Rg1P4QZHctWEA94O+4Z202sWSLo86VK+BTR4BqqWiM7ApTGNpxGuV0yO4Oc5P5r
	2ioE62gnfHcO539QxGZ0hDvVL+yKZ3/SH9wYfpsJa482FXqKGf6mh9r27nEQ/WUMAMLya
X-Gm-Gg: AR+sD10dNDh+u8AIH//y75EegvejwqMXZKU4KdX9v/40KyNw/O9PFN/UKP6us1F7WVJ
	oXBsoLkgFz38iqEW3HEGdFsjk7GZOccRRbJBzDx2zryr9F4EDwq7jY/m3D9i34suORRU/xKHB2q
	6noQaqZR8ID7LST5xqMsBLxZSryf3mBefOK4gKXpkL1Qi3DOeCsLZkHSF0QVu05rCyIzuJxOhmK
	4EHVGJlTBcXSskdJnZhkpDrdA1zA9pIeRBHosiB+rMwQiopYktbJaNxGJftbUI7c+6WtNAaXDUe
	c4A+SmcaZC5LRdyR6rf6bq3BhqkfXPlTYR4QVdP/QVF23grRoUzqDPZA+Hxcgr1Al4GhVXMHbud
	hZ/LH2ip+3A8cfIb5yiPLLbh1iNOv
X-Received: by 2002:a05:6a21:7a46:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d9aa9e2184mr4428632637.0.1788329356455;
        Tue, 01 Sep 2026 23:09:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a46:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d9aa9e2184mr4428538637.0.1788329355930;
        Tue, 01 Sep 2026 23:09:15 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm3257660c88.8.2026.09.01.23.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:09:15 -0700 (PDT)
Message-ID: <942f0a0a-461e-4794-a33a-9c820635eef0@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:39:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM
 assignment for mDSP buffers
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-2-c3dc62354eee@oss.qualcomm.com>
 <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <948de620-a482-4624-8383-6b65eb28a5e9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4RK156jhd9qGvrjrx5ElkCAL5KqPXjEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX/zn6x99COSan
 46ZzdeWzHDk89HOdFG0YPRZL6703yKURP7Bkl0yNHpuNejhYGKqnOG2JMDS2JyB7IGDvJ9SNvCa
 11L5GYWNyaTc0NaIfAMDI2aroCRyyM3Dmwm193U/LslqSb6A/leoVOcaDlxsTxEl4huUMRIqbTi
 gRrbmGw9cQQGumu21/Mx/n9AETSR3naxYxDjXw9/C+gS1m0GiAXPpN38xsFtfFBXlGw0i7xjrgr
 RbHTqBj2TZa6CyMcrjmBAaSML2CTAK9Oc4zGlv7J5xDteIjxp6t1BGxpHu/A5SRnrua++0CfB7Y
 Q1XW4aaasmo2wKxN9FHE2J8jwxi6lJ3N3Bx/DMG45sTyRtPY+Wp4UuciPmhQ6HayDYkcg2djgBA
 JVvE6Wjv3Reo9KYTveW3JYgAXbubIX0bMtRuIASbSiNFVwzZak/psdsmUzmq8T4SsdwowTgA0S4
 he/TsewuhtC3VPj001w==
X-Proofpoint-GUID: 4RK156jhd9qGvrjrx5ElkCAL5KqPXjEr
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97bd8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bKA_SWDmMBWY0RPQJBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MyBTYWx0ZWRfX71/4L6/lCzGY
 2FJ3shYNv/+ROTy7eF1sB9gvitCCHQfN0fzLFWWFxp676+PcKE34w+16YUto9dOR4tBxhPNfkjp
 Yo+Kbvpo9NDfGOH7AVX91qSAjzLo4ME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020053



On 8/27/2026 4:22 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:13AM +0530, Ajay Kumar Nandam wrote:
>> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
>> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
>> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
>> reach the PCM buffers unless they are explicitly SCM-assigned to the
>> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
>> does not function on these platforms.
> 
>> -		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
>> +		if (pdata->has_reserved_mem)
>> +			ret = snd_pcm_set_managed_buffer_all(pcm,
>> +							     SNDRV_DMA_TYPE_DEV, component->dev,
>> +							     pdata->reserved_buf_size,
>> +							     pdata->reserved_buf_size);
> 
> Does this do the right thing if the ALSA core preallocate_dma module
> param is set to 0 for some reason?  I'm not clear why you would...

Good catch.  With preallocate_dma=0 the managed-buffer path defers
allocation to stream open, but the reserved-memory carveout is a
fixed-size pool that must always be mapped upfront — lazy allocation
from the system page allocator would bypass the SCM-assigned region
entirely.

Will switch back to snd_pcm_set_fixed_buffer_all() for the
reserved-memory path in v3; the carveout is fixed by nature and
should not be subject to the preallocate knob.

Thanks & Regards
Ajay Kumar Nandam
