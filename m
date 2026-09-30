Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C204F96C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788499; cv=none; b=DzQpfqCC7f+njaGGtRRF4t/PGH7KdHI5lEc6glxKyzDVNlQLw0aZh1hKHgma4ThWalWA6AYdNkQ+sM5fRXdglGmhs4oNSjoHwcmHlA06g4xs2PrXUgzbz/8oT4GwE65ihU863/pQcfNSwbiA7b1cuTv3GzWNl4xXtrG/4cMZBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788499; c=relaxed/simple;
	bh=u3gkLrkF9kVgOJwNggTRWnNyg7mLMRr/4qwWou0hjVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3gXjUmPpqdiuCpR60yLR8KVe9l7FytJciU0zVsaioWwFJ82jnXX3FJDLZuuRRHKn404xdg998TydxIWLyIHX/KHDm8raVIYfXObCuFhGe1U9zMxJ0r6dGS0qMh2iA/jF7ndrLiMgGnQQybiHgZoC7zIcTzfHKY7m7PnJ3gDDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlUySY2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLj3V/8y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlUySY2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLj3V/8y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxs2I2404708
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABNmpZA6nprlf29bjnwIeQz0NrJAORbAu9yDE7O7gWM=; b=TlUySY2lTHxHkgrl
	FUvyBqLMzaSQ0ETbgsL9IzU8XyruHQuEox23I9yG16Ndu4EmV1OQBPCVjdEJFsZU
	jLmcKGAAczqU2ihOcGwikIqVcPjpZySjnQjCfI3HJwCXiz4VAhGRdhBx+4oQqWS/
	EO2yw0tptmDwTpBcOBm6ZpTqruFegC7yeTF6+tJaxhEq/rHv5cDg25eyEjbrUdO7
	bQ5MU1wuzGiLKhh9FsRQjBppi8cqvUvd8h/m7QRX5Smw0y96yDU9MoxwqjUrKPGl
	9aBgeFOIL58vlzFg5F9Jt01omZ1b6oGlNuuRjoZO1ilMHqzgPMwNykp7Lv/C4TGF
	bhUYSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2kqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:14:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34437a03f3fso379078eec.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788497; x=1791393297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABNmpZA6nprlf29bjnwIeQz0NrJAORbAu9yDE7O7gWM=;
        b=PLj3V/8yLoUTdEy7ul9V6SS1N8CpP1boFRtD8uixFQ4eVq+Wis5JI1nH7Kn2/Yt0tI
         S/LcrKOoO+r7PKV/uepjEAdWCDXIiTU9TtgteEP6ujhKu2CWT5k7sFDfytNwUY/PjTWf
         PsGCngbYqn3M7d6sE7ytok+Q98MePRS5Tn3J5/VEY6I9IjJqpLslf3A8GYd5cy70HKyj
         V0KG4yIJXRrFN1oDhNSH5+uXHWv0tEiXn4LO4YD9hfPjsjElrEAV4Vbcb67F00npg4ks
         41CESSmanoX1i5aaOAMMSzn3FyZFdVuCVc2wYb67rZVcQFuy4ote3BPwguG4P4fDocWD
         EoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788497; x=1791393297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABNmpZA6nprlf29bjnwIeQz0NrJAORbAu9yDE7O7gWM=;
        b=t3Hdw7znqksVgDcivIokYmZcBB6Nw2AVPnHPubdkphmzhlIgSCY/7JYBq/yBcrP11F
         lVtyk25C01Ftv5LX+Y7VTotw5AVTkLy3EQWL4PXiaFcWNkZfjDqB/nW24TnCHKBZYkG9
         WWPLptLZRTIcXuPVcp5hzUkH051RuKNVYUdDod0tZhoTCpEYNt07Y21/YziRs/w9WkuX
         Big2MZ1HKgnrwHEXMhvXiGilAXgNAG8DZMtwHrJ8qPPRIV7whu/6yPADO1ZrlUWqBL5v
         ywuezWzVAjTc6kNkbATOxv+V0VnP5NpTi/NQk2yXGAJ01fccoVvh0Q82FA96xPDOpm7B
         bOcg==
X-Forwarded-Encrypted: i=1; AKwUvBwQlgV9MFyutR0ASE7HEhvs3lbWH1PYO4vjBgEjUSP+A6qy99BQBhkhbSvOjQsy51jcbOB7iDsMRn3+nnmi@vger.kernel.org
X-Gm-Message-State: AFq9FYIYF7qfm+0OO9INMy46+L7oZmIalx5sNEdd3c6HP/7fRacT+gyk
	Cjuz9B1UX5tI7G+gKOTRtqEjWIrw8UXbJUoj7WR7roCVdb3QZEnG/c/YplJBuOvDJXaX7yZ4rju
	gcWhpKG5Tm4k+ts9CMTNsuzj/A5+U9P4v0O3vPWEJzoUnS/YwIAJYBYhZCawINiRwo0pn
X-Gm-Gg: AYBFou3V2m1WPz01sIW5bdUDZgsZG/KfBrqoNT38HwqD+gtIg8HpuZ0SB4yOdVlXhDz
	Rg5FchkuV8Pa1s2a/X7A05SyBH/whZdnLYVuwzFpHKbjU7FRqzJq5YeM8MUVbWfJT3Wqjx8GGKJ
	s6RvUruO2ZG5FvdN86XEPLwlOWCGerbd/kvITS1YMyH8RErk8C1O8n4PZKGPbQw540WHNEIlBtj
	AMYaJ0EVXRvujgF8wWWoX6IP23RNcpiwMyv07tsseeSmgH/3M7IiQfhBx5gk29TrbHwIB0mwA9a
	MFXx0xQqHLuMcaVpvV3TYqGnuTmOU2nkaWrVHfX7wauU/uvDt8+vAnKJJHvQVlXLz20VjADQx+v
	mruwscJcWXBtwTOEBmdo5U+Yc0wJw8/qieVpPV5uCmWF4iOOj0YSMWVQvWj82wA==
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34cdbecb18fmr3550097eec.2.1790788496395;
        Wed, 30 Sep 2026 10:14:56 -0700 (PDT)
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34cdbecb18fmr3550053eec.2.1790788495630;
        Wed, 30 Sep 2026 10:14:55 -0700 (PDT)
Received: from [10.110.82.170] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db42325c5sm343876eec.21.2026.09.30.10.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:14:55 -0700 (PDT)
Message-ID: <34398ea8-2ee5-4197-bc89-e0ba744c4d93@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:14:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-1-6fa7413af23c@oss.qualcomm.com>
 <e9b1f3db-9f53-44f9-a188-b1ee0e9c47aa@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <e9b1f3db-9f53-44f9-a188-b1ee0e9c47aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXz24ACy0Dgp3l
 D5F8hmZfd4ktDpUt0NglbwDqhfIz32v/2jYQGafedKlwmp97+GN8fCheXFBLe5YuGBx51NnbZMX
 iXik1yMKyWapEb5gjMC1Wxxky3ClODM=
X-Proofpoint-ORIG-GUID: s9KOt70zeP0x3ejdjv2KWihwQZhXrjqV
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd4391 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Q7n_TknA2OIddNHkTQcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: s9KOt70zeP0x3ejdjv2KWihwQZhXrjqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX6Pqa0fkMicVN
 NyeR8WIQTYXz512/mXIoRMwIKykPj2M00J2igkaH0Z5Suk7jQN1aX2hGIEt2f0QivmsUIfDcY2l
 CAi2uU9gpvyvGlfZY0yZnfq5gliU86fi6NGmEIlxe/LGbtzeZ7b+Lz3b3jutgbhi0pj2FUnDkqv
 XgaO2yY5gnSiKPFKL1Q9searIbfIi1EfpK0t8dmYyPEbaHh9ugnJi2CTspnBzQ9GyalbQMI9B8Q
 xZStYReSYDBhleHhpLSiVUO+rSuyh0grY8F11jNHA2H4TdcQZ8quU0XekgjbnybaFP/qvib7G35
 V0DjofwyXD0juUNP+2AIstozkT4Lfq1zOYCZR1tiDklSu3vYptVrR0w8Ykjs+MTptQ0buB1bXTx
 lXwk/THtvMmylBhbeDqixfCD4+ouepCk5py1WEUy2IfrmFT769hKsPp/Lc0oJ75oFRTiffnWxhG
 RQ6g6sa2SCToSKyqC0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068


On 9/30/2026 12:14 AM, Hans Verkuil wrote:
> On 25/09/2026 02:28, Deepa Guthyappa Madivalara wrote:
>> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
>> control type for signed 8-bit values. Add necessary support in
>> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
>> v4l2-ctrls-api.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
>>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
>>   .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
>>   include/media/v4l2-ctrls.h                               |  2 ++
>>   include/uapi/linux/videodev2.h                           |  2 ++
>>   7 files changed, 32 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
>>         - ``p_u32``
>>         - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>   	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>>       * - __s32 *
>>         - ``p_s32``
>>         - A pointer to a matrix control of signed 32-bit values. Valid if
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>         - any
>>         - An unsigned 32-bit valued control ranging from minimum to maximum
>>   	inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +	inclusive. The step value indicates the increment between values.
>>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>         - n/a
>>         - n/a
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>>   	case V4L2_CTRL_TYPE_U8:
>>   	case V4L2_CTRL_TYPE_U16:
>>   	case V4L2_CTRL_TYPE_U32:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (ctrl->is_array)
>>   			return -EINVAL;
>>   		ret = check_range(ctrl->type, min, max, step, def);
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>   			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>   		}
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		memset(ptr.p_s8 + from_idx, (u8)value, elems);
>> +		break;
>>   	default:
>>   		for (i = from_idx; i < tot_elems; i++) {
>>   			switch (which) {
>> @@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_U32:
>>   		pr_cont("%u", (unsigned)*ptr.p_u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		pr_cont("%d", *ptr.p_s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>>   		break;
>> @@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>>   	case V4L2_CTRL_TYPE_U32:
>>   		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
>> +	case V4L2_CTRL_TYPE_S8:
>> +		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
>>   
>>   	case V4L2_CTRL_TYPE_BOOLEAN:
>>   		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>> @@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
>>   		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
>>   			return 0;
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
>> +			return 0;
>> +		break;
>>   
>>   	case V4L2_CTRL_TYPE_BUTTON:
>>   	case V4L2_CTRL_TYPE_CTRL_CLASS:
>> @@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
>>   	case V4L2_CTRL_TYPE_U32:
>>   	case V4L2_CTRL_TYPE_INTEGER:
>>   	case V4L2_CTRL_TYPE_INTEGER64:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (step == 0 || min > max || def < min || def > max)
>>   			return -ERANGE;
>>   		return 0;
>> @@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_U32:
>>   		elem_size = sizeof(u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		elem_size = sizeof(s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>   		break;
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index cec9217d97ac698cd447574f5d079dd913a9ef6f..6a181a6c6b43beae87310cacb044a0cc7ad2c063 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -27,6 +27,7 @@ struct video_device;
>>   
>>   /**
>>    * union v4l2_ctrl_ptr - A pointer to a control value.
>> + * @p_s8:			Pointer to a 8-bit signed value.
> Nitpick: move @p_s8 to just below @p_u8...
> Sure, will update in v8
>>    * @p_s32:			Pointer to a 32-bit signed value.
>>    * @p_s64:			Pointer to a 64-bit signed value.
>>    * @p_u8:			Pointer to a 8-bit unsigned value.
>> @@ -61,6 +62,7 @@ struct video_device;
>>    * @p_const:			Pointer to a constant compound value.
>>    */
>>   union v4l2_ctrl_ptr {
>> +	s8 *p_s8;
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>   		__s64 value64;
>>   		char __user *string;
>>   		__u8 __user *p_u8;
>> +		__s8 __user *p_s8;
> ...same as you do here.
> Sure, will update in v8. Thank you!
> With that change:
>
> Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>
> Regards,
>
> 	Hans
>
>>   		__u16 __user *p_u16;
>>   		__u32 __user *p_u32;
>>   		__s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_U8	     = 0x0100,
>>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
>> +	V4L2_CTRL_TYPE_S8	     = 0x0103,
>>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
>>   	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>>   
>>
