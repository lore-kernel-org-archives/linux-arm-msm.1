Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3380446833
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231164; cv=none; b=bU5TSeAkiRk4DdBOE7PlP2ciJ3Qk7RzGq0nvmUu9XUzp/m62GH11Zm6CedBLC/ulKQgJ5NgsKvJ4l32ex3VxxD8eYjujDbwrXbHPT8JPF2p/2ysA7i2Z7ZxEw1QKC21zAwZ2TvLLN25qVzkWg57ixAl60K0QrB85X63qZewoEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231164; c=relaxed/simple;
	bh=/MvLGjCq9P+3TJQdi9yv+SMKwpIqRwp5tDl+T95B12k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ka/92agTDl46wFbxNSah5sEW6UHioSFU0yhvmWjK+SgnYY37hHZYKMde6Bo5DzjqBtEI4vIQc72TaA9Ig8gsMhwo4fYqx+cKqvEZ7Xvu8LkHjYFDy1UqiHZ3Bpe3hmlbcmXBZs4eUf4TiPRDZO5U8qck67QiB+6rFo8ljqbhhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwaV4z2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVKOMRdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwaV4z2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVKOMRdd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PEiF2465441
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=; b=jwaV4z2TzGHiIR6o
	jRjasUFvEdE3hZE4YOADkjaSjyq+fcG4SjuMiuZVqbaXpQo4fXaIGY24SYwIat5Y
	xEHhlCuMnmrr/SJYHxUbGJ+FCUVgQRxIlibWMy7b/sBOaiRz0+BwV58KjdvUWos0
	MymhkSBlK9tfmtpyUhUVKJsUFs7C/x9lF8qpNUMfawb2xETI4YbvdSb/Fm3cQMvp
	wpXyQIuiglhtbRGv11uPR8LPyT8bF0b6C169b+Ox9GnAJLwwDeqD8AZtXLm3YYqq
	gt/e/bKxwCGZ8iFBBe16qImQzjIyszZalA0J2/MKSZVYh0FOA7HSdLy82KtShU+Q
	AQ3oYw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29h1dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:05:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2623373a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231159; x=1787835959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=;
        b=kVKOMRdd78nLxwu4IeGKctaQ+4txEocIZ0x6iAsBNJIr/cVVVd1eZua2NMHDr4v2Lk
         S60xwPXBn/PqSctuiZNHNdcxlS43FvhHaSz+IvkACMlBNzjKQvxY/XrJtd0IlPRJbTSF
         pMnrDSQ3B0tS2FTcjbS6dJ85kp0CmK/F5yuQMkNy79YEyaN0WoTCd6BqYrmTbS53r7Kh
         itppL8DG9fCKjrYrQrOl3LJo9gSws1NYkqgYLUAJq//Ir3LPa202NAajI5K39tFPjC51
         yx25dslNrfQMXT9x7msJE0IzlYI8BKMtlldH5FHQs5wdaDvDI3wrHliEAsHEJKuoknpE
         Om+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231159; x=1787835959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=;
        b=cixB1FZJVIJ13p+A05SCKxpPnRW9IBK2Q5MwGMFIg4pqllIZCo33yzT4GCdVX6v1Rj
         cu83bPwUcqhmiaBhAbvOiEfhBbF/OadkDWsrxpEHxXKRQ+iU1ISXXBCkrcX+XD0rZcd+
         GmrMz0c5S9A3UwatCRO4poCcEK1nH927MOeV7OIpwNCG/FmWcVT0nT40TNRSoVXBT4AP
         Jzb7cH8JeiW7hq8HdJ11qQ+qm3tBRdEOb/gV1GU/qi+88zhjH2KOOF2rWUTBUlegPrFK
         LxDExuA1VK3FYTRwNIZymYyb2qzTQ+/9uyfbVXtrkhxYUs88Oq1cnJQOm6uyPHa59h6x
         LvcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSKIfYa87+RJttHWrC/UtMOPhjgJ/LFxsq2nc3hG/OhLEbSVJ67MiZ2nBrQ8gIODkcn+YD/L5/FjMX/Dz7@vger.kernel.org
X-Gm-Message-State: AFuF++lLPvZIa3szmGnFXOg+05SyElkJnswDtk+0NNbgbCde+5eSaFyy
	04w9T3/LszIrqLMjnsZ97qg866OyT+BZmGV7a5e+tR2thFguawYXgRmsRxPXWtN2OrfTmZ1/Vou
	QHMQoiQhATF22wagVq20RMuETbwuF1NIj86o90ioNA98gXTu/oE+EYqdi4iXVFvRWjW7G
X-Gm-Gg: AR+sD12H9EnynnAF5j9q1M3mWPJUCuZXqdF78kj7uF9saTQzf1WSefkcCpYHOftJD0D
	Q1OKaW+JpnQZetdFl6wMed1bCIPviizcq/n0T04492yZarMplsUGIB9Ud4rrcyeI+Pie3nYHWdn
	7hG/6YIXh+cgb+1zpgDPjT+b5Gzbr4q0oFsQ8CKhYArGWcV+GtlT9pa4AlOkgG0MSdLnK+zWWGm
	+sAbDlAc3UTezUADfWWN+8RuV97EB6NunvUoFxv2W/KV0Xvfzlm+2nYNhi/ew0GfogEATJm5JkM
	iv23pIwdMeU25jD3XHu3iozXQNjdfOJZ60qj2p2t1Hkc1HYtFG1IR6yZ+y2eYdG5Ke6kitokCZY
	ijcr7c+PewFyw1VQ3jLN7PpbxuQH7bQ==
X-Received: by 2002:a17:90b:4d82:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39580ed143bmr23044539a91.3.1787231157802;
        Thu, 20 Aug 2026 06:05:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4d82:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39580ed143bmr23044231a91.3.1787231156489;
        Thu, 20 Aug 2026 06:05:56 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6574171a91.4.2026.08.20.06.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:05:49 -0700 (PDT)
Message-ID: <eb05740b-8683-41ea-83ec-8a4a484881e9@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:35:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] accel/qda: Add remote memory unmap from DSP
 address space
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
References: <20260817-qda-v2-v2-0-757ab8ed2f64@oss.qualcomm.com>
 <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
 <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hU_zqqSWMu7RybMUJibkX_Cz9Y7-H1rQ
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86fbb7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rYwYc2LNA-xZppdo0x8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NyBTYWx0ZWRfX/juwbqd9BU1C
 54CTOeFUJBOTmUVqNcpBxEfTNYzjlW8VJRlTqFN7NamnVnTl5wxNzxFNEjK/DAAWxR+qxAcNX4p
 C3PumMj+iwJ2qW4tWM28D6b6EzoHGpzrTClKJ6MPh/T1MMqdIxqkIxmZHbijYOiKAHnYLrmc0eA
 HDVSkE6qdfhiNhm/QU+97JCPmihy0f2DHlfOATZVMmdwYGg7BYVFZlAURoQtc1DbQbIUT3C+pxh
 fh5hhpR/2jgiAy6Km2nDkHeoSzQNAquFkhQ0oQ9OWTFMtTqpZMUGlWmQjhr7yWbh0W4sSylxJYv
 mOjVVyTKESq+waUspRrkO+FSfta9ZgxC3ThJBaiffGPgMHXng7CTHcamxA9E+jCgUhNrU48w1H3
 dCMtX5BAdZgSXu74gEpYZZOCfPjKGhzavwgp4iCZz5zraSa+bIwZJ3qXNasLbot7Aw8peX9/bQS
 2B6Ss7FJB1cWmrIcl7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NyBTYWx0ZWRfX9mbSezJBXxGE
 cjux0aSrE8DGiSNhkd6z7300Z72EqWrjV10W7L2A7cRmF/rbMlEPuPedFXUhhzVzLu4OC1akt3B
 MInkwAal6Th9Klg2VTXF1aYyQ4yX3iI=
X-Proofpoint-GUID: hU_zqqSWMu7RybMUJibkX_Cz9Y7-H1rQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200097

On 17-08-2026 11:14, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:38:45AM +0530, Ekansh Gupta wrote:
>> Add DRM_IOCTL_QDA_REMOTE_MUNMAP, which removes a mapping previously
>> established with DRM_IOCTL_QDA_REMOTE_MAP from the DSP address space of
>> the calling process.
>>
>> Mirroring the map path, the DSP exposes two unmap operations, both
>> reachable through this IOCTL and selected by the request field of
>> struct drm_qda_mem_unmap:
>>
>>   QDA_REQUEST_MUNMAP unmaps a region by the DSP address that the
>>   corresponding map call returned. It uses the vaddrout and size fields.
>>
>>   QDA_REQUEST_MEM_UNMAP unmaps a region by buffer identity, using the
>>   GEM handle, the DSP virtual address and the size.
> 
> Why do we need two different operations? Can you just pass the GEM
> handle to the IOCTL?
QDA_REQUEST_MUNMAP (RMID 5): The DSP locates the mapping by the DSP
virtual address that was returned by the corresponding MMAP call. This
is the older protocol message that only needs {address, size} to
identify the region in the DSP's page table.

QDA_REQUEST_MEM_UNMAP (RMID 11): The DSP locates the mapping by its
internal handle association. This is the newer protocol message that is
not supported on older platforms.

> 
> Also, what happens if the buffer is still in use on the DSP side? Will
> the DSP crash? Will the whole board crash?
The access from DSP after unmap will trigger an SMMU context fault on
the context bank device. The fault does not bring down the board but
might trigger remoteproc to restart(I'm not exactly sure about the iommu
side handling of such faults).

Thanks for reviewing the patches.

//Ekansh

> 
> 
>>
>> Each request type has its own argument builder in qda_fastrpc.c,
>> documented with the packed argument layout the DSP expects. Unknown
>> request types are rejected with -EINVAL.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c     |   1 +
>>  drivers/accel/qda/qda_fastrpc.c | 119 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  34 ++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   |  22 ++++++++
>>  drivers/accel/qda/qda_ioctl.h   |   1 +
>>  include/uapi/drm/qda_accel.h    |  39 ++++++++++++-
>>  6 files changed, 215 insertions(+), 1 deletion(-)
>>
>>
> 

