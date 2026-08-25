Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA13DA5C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670625; cv=none; b=H3TRCVrEcIhl32e3nCkCWvNp8KuJldHzBvvzm7zAWXe6D8eXZ8dCDQJJz8hunxuZCfk79FbxiYReKA5A2GVFO+tbvCR1Fqqx0ATxzt76nyBjgo3AcYBJ81KGpL2891KMa/3lVvNg4JPZ0x6c8TJyAjQbNA5J5v73++0zCct4mOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670625; c=relaxed/simple;
	bh=31rNBGesDBZX+Xtthz+D0TJ2t/NrJy1H92YezKiuGcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQnJloQYz8m6CRkwfUCWynt2mNxlFESH6YwFb+5ZDwCqTxmZGYkBnR/4xUEA4BFDALunLqI12Hx4/JzgLJMDZcHFIz6Z62u37Ju0aDFvWIaMlu8L/6QMRf5WglZUPu48FhfLb6B0vfEw/IinksHkDpB45Wy+cwK/fvMXhfHMxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkrB5NDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpeZw73r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkrB5NDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpeZw73r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEU3ZN2220652
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0A9btRvyQfNGEMbRXj1NIxUjbY9mjUOkIxhGDJcN9c=; b=jkrB5NDNepVjLYDj
	eZeRB8LkZxGejvAJe4aqukp3qAgik1G7tK3pZCaYJIBoP9TI5iirYJGJce4+O/92
	FVDnX7WS8XThY20+BsebBDH1Gxv+yNjcrfZny2PkhrmmuPrciEVVSWpYaIohFY54
	JfnYnDdrsY37MePXeXbQMT+0lDAcqyhJA0VuwEA2hFF69Ozr3ePpgvPbn0+f7T+p
	YyTpBU3cvU9NPUVLpqxjHUg0akgpydNF43QUSSAjnldeZ734llwFi2A8/D9MloH/
	uP48yOqvJ9ZoMOx+0RAs+V0pky/sjHvhIOqDriZzaXAaqCgi25qLwpcoBPgUHwyc
	AudaDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bku8mn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:10:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39640eebc57so2844297a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787670623; x=1788275423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0A9btRvyQfNGEMbRXj1NIxUjbY9mjUOkIxhGDJcN9c=;
        b=MpeZw73rjcW2PnNRBj6Ka7HjbcuDceaoq4rnmypUkcvUEJSKRMfAuxyE665gk/WNQv
         2Jlkyke+c8L8tpwQnvJudUalY7yMDsU7M5ZinXBcA08voIfKObawJW2qNzYyzu1xQVPK
         OPs9vRdHRl1dipt0tvRSfgmnaNYiWtDvLk6A5IrPcaNqbTN4vfkTzbJ1MHRIoGuOrPQK
         Z6qoGmb8sKppun4UkG/fJpGKwVBGPsm9+ftZQX+emOWhfIAQN2tz3BodTcOVa3Vpf6hS
         2fuQ7XaOyoEvn75pVAHcgBxhagSglN3vBHDxhQwHGWAhNEAboo0SAigA5QcuIyS8NRqE
         Va6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670623; x=1788275423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0A9btRvyQfNGEMbRXj1NIxUjbY9mjUOkIxhGDJcN9c=;
        b=iFRGf26oDv0y7WXdb+KFQ25m5KidAY7mCK+isXpbRzBBxAc46X9oBOkTF6aQZDVaPF
         C+P4aHopiIKBJ/7hFXsZUyDQGaw+zwWqZ33lSbOkKfIr394aZCr4hQ5b0GMRtlC13vVe
         4uk9Oh3rF3Xy2kR24WQUKAW4slDFjAwtYpoAVh6HoYT95NkN96ucmV42JSkKBjK4hUvo
         ADReX9D0MNfxoYSWPsaKOck2l466gdlkuK1DD1wrY/WoyAkwLVtCPVYp2oiNOhLwVfnt
         o6K1FnBS5dIwCuKYrE/NLqp2BGqUlmc10asbmW+WHDn+jFwn+w6obc9pD2mujDYJjuLY
         zf9A==
X-Gm-Message-State: AFuF++kx9RyzTFOoRKIJuXj6OyHQq6dDz2hNBP1ynA6ZImXHxtJ/Is+S
	RTQCIh3eBwZlBLrc00LHQGCcAylKNkxEV7syIRbbxWKYdsaU4tT3xfLibdtZWJ5yKYKrXafVZND
	ImSs7aD1cMClcZsNpeJwaVh71QOMfrYbsJWGYpzfwmRCW6Ze9CL0h/1OM+9nNx2zg7N4f
X-Gm-Gg: AR+sD12aJvqA7KLeGFFYWhGh55bkDzcj5pmstXA2qQzp+AHTzseSdagCFc5uvgEirS/
	PRXfVkD6gZSDvKSo1YzqZaxtzRfW45V5ODKd3EF5aKjjNSx7hQyvlhtMkziJ+lw4vmt9T66WFLb
	0gH58p1a9Gvue30TKampfxCyFmzylCTHkIZZhYNU+I9LvSOB/WSCKKua2CKzqJsCYwFHoYVvJYk
	rAn8qrpAiNXIYclieLdG4e1LOXsqGNzOxoDLbjs8rGB+PcfTkLTr1xFAI9g4GQpWa+JliTOYxvZ
	Eyjaibo8c0iKLSR2BUJ9FrmHQdhACfdveHDSQWv74rgzArWRHKDMlV/8JPQgOkTQf4T/aJQv+g6
	yQ6abpnBxTberkXZjasyvPmCN3H8=
X-Received: by 2002:a17:90b:56c8:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3964652108bmr15862958a91.12.1787670621388;
        Tue, 25 Aug 2026 08:10:21 -0700 (PDT)
X-Received: by 2002:a17:90b:56c8:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3964652108bmr15862841a91.12.1787670620891;
        Tue, 25 Aug 2026 08:10:20 -0700 (PDT)
Received: from [10.204.78.62] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3965d119724sm1927178a91.2.2026.08.25.08.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:10:20 -0700 (PDT)
Message-ID: <a5bc4ee3-2c9e-4098-9ce7-08a71d2f7058@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 20:40:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: advertise linear-only modifiers on platforms
 without UBWC
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260819-remove_ubwc-v1-1-5357d5cc517f@oss.qualcomm.com>
 <672f91dd-749a-4448-ab32-50ac064a4b98@oss.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <672f91dd-749a-4448-ab32-50ac064a4b98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F7z1z9f50D8Mw_mbxPnuwN5M4BzNzqJH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEyOCBTYWx0ZWRfX82OrvcwsoFXn
 pGlFml0Vt/YvtvbGXKnFSIOQrcjX9Ne1vVBBFDaRK70BXT9VqgozNBmmZrtc77QLWSFGVJm56FF
 p+0dhsCq3v13BjXPgufuXySykuYsYuo=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8db05f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=INP11UExdj8QQtfJzOMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: F7z1z9f50D8Mw_mbxPnuwN5M4BzNzqJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEyOCBTYWx0ZWRfX2U8m5dsLFYNw
 oW8AJkeZ6+il6I0SPzjtBepViztHz+oxiz9fT3vYrKEsPV1RSOZm/R/MIXOCTCP51auiYh8PCVn
 27bE+gQAsm8PsIdR3mLYnTWZeYicAVblawQ3xgztpdfZ9wg7TVXs8g1uqJ4OOjeFt0+RzZYdH6G
 wuelY2fQv1SYhDciii9vMqlgy+GSSHmUOUhXtLv2sbZFrOzaeU/wFcuasOcBDysF2xx3A8qBy8M
 e8Xjp0SPI/DyqGf2QxIV9T6iFtzC2vAySkpqLXlUQn/avZmnkRpphPT+FUmqnN/efta8nvX5xsq
 jjEsd6jsxR5mz/iOBiSrxUt63Itnz6hzhh5K30ebt91gt/c8R3jWjkWkzWm2Lhc+QIRFSOyyZma
 j22+P6nRpO6UNpRTd9sMTIwhhONvqICIZEnfcsQRH8UXcjvvjX+TFVOy3P6CNHDjjuSv0CdSSkg
 D8Mcr1iWrdhbOB88WIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250128



On 8/24/2026 1:01 PM, Nabige Aala wrote:
> 
> On 8/19/2026 4:53 PM, Mahadevan P wrote:
>> Certain Qualcomm targets like QCM2290 and Shikra do not have UBWC
>> support. On such targets, advertising DRM_FORMAT_MOD_QCOM_COMPRESSED
>> in the supported modifier list causes userspace to attempt UBWC
>> allocations that the kernel rejects:
>>
>>    msm_dpu: [drm] *ERROR* unsupported format modifier 500000000000003
>>    msm_dpu: [drm] *ERROR* unsupported pixel format: AR24 little-endian
>>
>> On platforms without UBWC, only advertise DRM_FORMAT_MOD_LINEAR to
>> avoid exposing formats that the hardware cannot handle.
>>
>> Fixes: 71c5c23be874 ("drm/msm/dpu: check ubwc support before adding 
>> compressed formats")
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/ 
>> drm/msm/disp/dpu1/dpu_plane.c
>> index 7b92082d35a6..c8bd034690cb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -94,6 +94,11 @@ static const uint64_t supported_format_modifiers[] = {
>>       DRM_FORMAT_MOD_INVALID
>>   };
>> +static const uint64_t supported_format_modifiers_no_ubwc[] = {
>> +    DRM_FORMAT_MOD_LINEAR,
>> +    DRM_FORMAT_MOD_INVALID
>> +};
>> +
>>   #define to_dpu_plane(x) container_of(x, struct dpu_plane, base)
>>   static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
>> @@ -1836,7 +1841,10 @@ static struct drm_plane 
>> *dpu_plane_init_common(struct drm_device *dev,
>>       pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
>>                   0xff, &dpu_plane_funcs,
>>                   format_list, num_formats,
>> -                supported_format_modifiers, type, NULL);
>> +                (kms->mdss->ubwc_enc_version == 0) ?
>> +                    supported_format_modifiers_no_ubwc :
>> +                    supported_format_modifiers,
> 
> Can we just pass the NULL here in case no ubwc modifer are supported 
> instead of "supported_format_modifier_no_ubwc"?
> 
> would not it automatically handled in this function 
> __drm_universal_plane_init as default_modifier?


Thanks for the review. Please drop this patch - it is not needed.

The commit message was wrong. The modifier in the log I quoted,
0x500000000000003, is DRM_FORMAT_MOD_QCOM_TILED3, not
DRM_FORMAT_MOD_QCOM_COMPRESSED (0x500000000000001). DPU does not
advertise TILED3 anywhere, so this patch could neither have caused nor
fixed that error. I pasted that log here by mistake; it came from an
unrelated experiment.

Having re-checked the current code, there is nothing left to fix:

    - 71c5c23be874 already makes dpu_plane_format_mod_supported() return
      false for QCOM_COMPRESSED when ubwc_enc_version == 0, and
      drm_plane_has_format() consults that callback in preference to
      plane->modifiers[]. UBWC commits are therefore already rejected on
      QCM2290 and Shikra.

    - create_in_format_blob() runs the same callback for every
      (format, modifier) pair, so the QCOM_COMPRESSED entry in IN_FORMATS
      already carries an all-zero format bitmask.

So the patch's only observable effect was to stop a zero-format
modifier entry from being enumerated in the IN_FORMATS blob. That is
cosmetic, and certainly not a Fixes: for 71c5c23be874.

To answer your question: you were right, NULL is equivalent.
__drm_universal_plane_init() substitutes { DRM_FORMAT_MOD_LINEAR } 
when format_modifiers is NULL, and this is documented in the
drm_universal_plane_init() kernel-doc.

Please mark this as Not Applicable. Sorry for the noise.

> 
> Thanks,
> 
> Nabige
> 
>> +                type, NULL);
>>       if (IS_ERR(pdpu))
>>           return ERR_CAST(pdpu);
>>
>> ---
>> base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
>> change-id: 20260819-remove_ubwc-0180dfb2908c
>>
>> Best regards,

Thanks,
Mahadevan

