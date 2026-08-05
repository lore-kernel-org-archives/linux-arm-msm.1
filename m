Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034435E1A2
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947838; cv=none; b=t9kQnRloVjsGZ2g1TMK+fozMcHePaUD/hRu3RvGbV28O9MD1p/1uOwWFPs0XHhTLQ7jbVMxfNDrO6QCGJi58lOXfH8xU/4/LAB1aDuMTxLrXJsAnvdte+0E5iUg51sDRNIPGMYnO543DORBuqZgbW6PE3JNMyfXyKUYUkam7w88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947838; c=relaxed/simple;
	bh=6ZWoRV8QIp3lQ09WONZyrSwbDUglgkINZgHm+j373O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoqoX7uVF1KuGkZiB8JGtIBVqRBOUUGkZ/swVnqxGZTVn2X/gLx5ll7jEp4vscSB2IrC05y1aPtEOXlksJv+09fHUi4hXpTMufMPwVgbWgtJmKcN2eR2kmD5kJ7AatLTzJV8UQ7vMLhdMI11s/Su5Z5o1CATKwKY+Wqe2oR+v8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLbleggS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwbcGvwt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLbleggS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwbcGvwt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVJRf3297594
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQDX1yfy43QiYgvUwPZaOxEOVnZnft0zasFNojOrKOo=; b=BLbleggSibq9byjl
	shKrY/dewnAGTEAzROO+BNpj6cVAT5AgjpnXnAV87+m5Im/vBPHNXvnP0qPwE6Pf
	VlWYElkKPJhfVaWnyl/Fk+7pblCMhrzLP9M+OMdTWNvdvPVCrxQkamcp81sxZGbB
	hXPoJoyJigAoQ8pHEXVOo+3nNC3K/F5jC1jcfsEANtpl1vgm2BBumPmSNKCXcPfi
	g5PVupc+AjIMpMbIax7glYFTXS7/jZuRyGkQ7sUXHN4BFNWR1bwYCfZ8hzrNer3z
	mQNU5m34bIpVmW+nJNALK/9d36VgTSOhQHvU3Z34auXAM1mtsOkBRM7ELxEAGmrI
	NgbY8w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5s1u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 16:37:14 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b5741bbcso238544a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785947833; x=1786552633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQDX1yfy43QiYgvUwPZaOxEOVnZnft0zasFNojOrKOo=;
        b=OwbcGvwtC+FxOc1Rr0Sps31Ecv/x/HmziHKIaKtxC1xLcOy75chBkHjrUOiZTmWwEi
         HL2fD1NS+7awNbRqNGV4Sfq1CzFqHVnTd3alGTz1qfzABvbPUvbKJUTtN5nUquYie1vM
         hXq37RCQZ7laivVRs/KP2hJjOmFWBHg8PlXVbYmdk5IgyP3NDAoW+nC+almlDiv7BKYL
         D2e/b4gyLH8H/Ts/8wgrw2TmwPwCBVxMSGdPtKpmtrK96boH59DLgPP0sTk+glC6t634
         d18NquHJ4Od+4+cwDUjCIYJy9br8dO6p7XRfy4fqHK112QIJkG9dMVjVdFMvgMEfZHUr
         5zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947833; x=1786552633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQDX1yfy43QiYgvUwPZaOxEOVnZnft0zasFNojOrKOo=;
        b=tLY/4wJIGY+6ZJOHhEGNMac4ZPKkFOv4o+jyrTgZOtMmfTSxehFCdj9frk3UnjVnWA
         OWh2EM9vzf83b9mJrDfKqLVp4AW5Yp7DJN1pAbpcqzIWiPOVx/Fd3LbPbzzcCa/T3bpA
         oLPocaLFLFlXByDSdORGETn+58U3EnJCmkfnmubFgk8dAlnaXvZTnHaj2IEyhTkk3gdb
         yiWj+Jli1o3MhPKGz0YCogPB0ZGNRdlwbqdEF1h9d+0lU/nb0vTMrtGi86vB2n5pcUdN
         RMLOCBncvWR3aH0dCN7mO8D5XhfRQdPxrewCWKpR1whCw0RZtSAscOC0C3sXVGHsWc1p
         rIQA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jEiHuay1iSbLD9XoLUkqA6N5LVn9UYtNjg2CjRAqKCIz/NARQAZCuUn0pP7R/I95Rx3C+NOhI7rTTr1v@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrLtlQc10UCKPP8IituXz3XjZooQ+6BA5oqaUlNrj0/xHusdb
	/h0eaywsez5f7+Hrc7MAUhlsUopCJp+8l/RjE0F1TtifquVICkTyTz92iJ9Se/w4mwI4bHzJpfV
	ouJ5TJQhhq5HY8T8aK8j3f6VybYoF54UYcTLJ/aUB0DLIXnWkNw4Yv2X2ihB4SwqSwk7T
X-Gm-Gg: AR+sD130h7kR0T3sg0BvwuT+3Gh1Op5v+Icx98yj4UrD5T7P7SWNgPaB+qBxhQZR+oC
	P5DBt8ce7p6TsSO3C0aY4+AgICbLfLkLudsIrBdr9HsD4tWBWt2awQSo4aWqhnW2jad1iOk3mXn
	5TMyh/ufhEFR1JtnOu1bePoC1DZR09R2r5aZpgPuiMmn/MLZwhooMnfdH9kCQ8P+nk5Ihd8t+/L
	0yCqpANvFhspwdqDEd1YaFn198TPbd/F5ZMh/s98UFiedmUwWifxaQ6d3zIOGYkOgp/EKF92+NB
	E1HP+R60nzxevkaiXcmaJr7p0nga0ErU94y/MFkJVlMiXUoE+NipwY6LEDZlFbqcQF8zEpkKtQc
	1gP+SU/wlyLmRcTQfwVby2ObkZz32xQigPnWaZ9VsiQJYcO992qKRs9AalVBryg==
X-Received: by 2002:a05:6830:3489:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7f1e5ea9deemr3063874a34.3.1785947833516;
        Wed, 05 Aug 2026 09:37:13 -0700 (PDT)
X-Received: by 2002:a05:6830:3489:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7f1e5ea9deemr3063845a34.3.1785947832936;
        Wed, 05 Aug 2026 09:37:12 -0700 (PDT)
Received: from [10.110.6.162] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5a4f9bsm3081690a34.23.2026.08.05.09.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:37:12 -0700 (PDT)
Message-ID: <320d38b1-1ef4-4f5e-91af-cad1cec59cd0@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 09:37:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <WoOjVIWC4XK-emqOnxnAfbETbnFi-sNNFh6ctmUDJOokI9GD4YAx8pVjdB-ygch4T0tcEeH6pVha-Ep_OaPysw==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-1-e03b622a2d48@oss.qualcomm.com>
 <c590fac2-5c41-4b34-88af-fb00e83b8575@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <c590fac2-5c41-4b34-88af-fb00e83b8575@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pDMZVQ71SNGf31SB0rUFq99960trbiS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX2t/kiNZHhEg0
 zJWCyfLIKfdzcxGQu8WH1BA+oF+5/yntZHk1UZ2wY+Q0mjjhi3FsInzwDCq3Rnpp28OVcwt+Rhc
 s6p/JNJnajLQVXjU0DaLiEqAHaEFGoyFAgAfvwrmKFCbSpYR6ELAuvumMPnsqntyOROZ2XAJn/D
 JJhK9bERIptfGeyPzaJ27uaSp1K5iVqUyjjhwpRhZLiqMRwHtaVa6Lp90unThxkeSVFQJM4nilG
 goXmFvktGAaIjQ7zoHCXFGQ7qT8oyPMsJOrHJrq8ParPysharvgOX4zR/v52WjNpUi3Zmj235pZ
 vPp3+EHnPqYWfGTI7vbL/On+TRSYryiJxRt9riswJzIuq+zQOF/AXsuI9PPj1oeF1Ykf/Dtyqve
 5WHT5cXI6oAIbLAFJa5JDGcXHvwsfaYNQz0tCsfPbmmoQL4pPFyPZdvU9EAZXsB2XVj00UXU7Kg
 IegPaxEdWn3Yckj/A7w==
X-Proofpoint-ORIG-GUID: pDMZVQ71SNGf31SB0rUFq99960trbiS-
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a7366ba cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OAOW8-Q4FRGSJhXIPGkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX+Acg1Dc42Bkn
 EK+RutlpF3A18qTGRJ2A/m5W5iu6gb7c3xcdjFVRJk7PIoJ6f/rA9zFoQUzrHP5pkU/3wLDokJT
 IUPL4aPZpNQZBSFTCY9w1KqwOds51OM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050135


On 8/4/2026 8:49 PM, Bryan O'Donoghue wrote:
> On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
>> Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
>> video encoder Region of Interest to allow applications to specify
>> different quality levels for specific regions in video frames. Define
>> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
>> codec from the hardware encoder and set the corresponding ROI MB 
>> delta_qp
>> map that adjusts quantization relative to the frame QP's base value.
>>
>> This enables use cases like prioritizing quality for faces in video
>> conferencing or important objects in surveillance footage while reducing
>> bitrate for less critical areas.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara 
>> <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 19 
>> +++++++++++++++++++
>>   .../media/v4l/videodev2.h.rst.exceptions              |  1 +
>>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    |  4 ++++
>>   .../userspace-api/media/v4l/vidioc-queryctrl.rst      |  6 ++++++
>>   include/media/v4l2-ctrls.h                            |  1 +
>>   include/uapi/linux/v4l2-controls.h                    |  2 ++
>>   include/uapi/linux/videodev2.h                        |  3 +++
>>   7 files changed, 36 insertions(+)
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 
>> ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..0f8179de8f742253a5152231592fb8b4355298f7 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1674,6 +1674,25 @@ enum 
>> v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW 
>> custom range.
>>       Applicable to encoders
>>
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8)``
>> +    This custom control is used to set ROI MB map delta_Qp for whole 
>> frame.
>
> "a whole frame" or "the whole frame"
>
Will update to "the whole frame in v4"
>> +    The frame is divided into a grid of MB Size by MB Size pixels 
>> (MB Size is
>> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). 
>> Each block
>> +    is configured with delta_Qp in raster order. The valid range for 
>> delta_Qp
>> +    is encoder dependent.
>> +    Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
>> +    A read-only control that reports the MB Size used for the ROI 
>> delta_QP map.
>> +    The supported MB Size depends on the encoder codec.
>> +    Only square macroblocks are supported. The value returned 
>> represents the
>
> macro-blocks ?
I will use MBs to keep it consistent. (in v4)
>
>> +    width and height of each block in pixels. The ROI delta_QP map 
>> provided
>> +    through the ROI control must use the MB Size reported by this 
>> control.
>> +    The number of entries in the ROI delta_QP array is determined by 
>> the
>> +    frame dimensions and the reported MB Size. For example, for a 
>> QCIF frame
>> +    (176x144) if reported MB Size is 16, the delta_QP array must 
>> contain
>> +    99 entries (176 x 144 / 16 x 16).
>> +
>>   .. raw:: latex
>>
>>       \normalsize
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions 
>> b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 
>> 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING 
>> :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE 
>> :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE 
>> :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION 
>> :c:type:`V4L.v4l2_ctrl_type`
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index 
>> d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
>>         - ``p_u32``
>>         - A pointer to a matrix control of unsigned 32-bit values. 
>> Valid if
>>       this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +    this control is of type ``V4L2_CTRL_TYPE_S8``.
>>       * - __s32 *
>>         - ``p_s32``
>>         - A pointer to a matrix control of signed 32-bit values. 
>> Valid if
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 
>> 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>         - any
>>         - An unsigned 32-bit valued control ranging from minimum to 
>> maximum
>>       inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +    inclusive. The step value indicates the increment between values.
>>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>         - n/a
>>         - n/a
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 
>> 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 
>> 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
>>       s32 *p_s32;
>>       s64 *p_s64;
>>       u8 *p_u8;
>> +    s8 *p_s8;
>>       u16 *p_u16;
>>       u32 *p_u32;
>>       char *p_char;
>> diff --git a/include/uapi/linux/v4l2-controls.h 
>> b/include/uapi/linux/v4l2-controls.h
>> index 
>> affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 
>> 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
>>   };
>>
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (V4L2_CID_CODEC_BASE + 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>>
>>   /*  MPEG-class control IDs specific to the CX2341x driver as 
>> defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE (V4L2_CTRL_CLASS_CODEC | 0x1000)
>> diff --git a/include/uapi/linux/videodev2.h 
>> b/include/uapi/linux/videodev2.h
>> index 
>> 5373dba640fae3d19247ab1c74ba336e05dc0fe0..3ed343f8c81e0c9240d5a7e5b2dfe365a529fb6c 
>> 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>           __s64 value64;
>>           char __user *string;
>>           __u8 __user *p_u8;
>> +        __s8 __user *p_s8;
>>           __u16 __user *p_u16;
>>           __u32 __user *p_u32;
>>           __s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>       V4L2_CTRL_TYPE_U8         = 0x0100,
>>       V4L2_CTRL_TYPE_U16         = 0x0101,
>>       V4L2_CTRL_TYPE_U32         = 0x0102,
>> +    V4L2_CTRL_TYPE_S8         = 0x0103,
>>       V4L2_CTRL_TYPE_AREA          = 0x0106,
>>       V4L2_CTRL_TYPE_RECT         = 0x0107,
>>
>> @@ -1997,6 +1999,7 @@ enum v4l2_ctrl_type {
>>       V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>>       V4L2_CTRL_TYPE_AV1_FRAME        = 0x282,
>>       V4L2_CTRL_TYPE_AV1_FILM_GRAIN        = 0x283,
>> +
>
> stray \n
>
sorry, will fix this in v4
>>   };
>>
>>   /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
>>
>> -- 
>> 2.34.1
>>
>
