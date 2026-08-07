Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170E6476062
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104122; cv=none; b=a4abn/LdAAJJBs+0pUrI2Kd5e/HTkMzZExQmGWHP5+h+7bIxgb0jmh5Np+nZmrQU6+P9ER70pOQO3nvldn7XmS2siPzRurtsD3M9BeePbLtpVqN94sqx7m1OHRdcC6LIQw4cR64M7ntUWrAdJRhyGM7PPoj9Ffiv3MsQ2DQKl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104122; c=relaxed/simple;
	bh=B0uti1CPQbFicBnvePoAwv+eP7JNw39gAjbpVG28OJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jl2VHR1ZJ67jRGoY/lix8/hngOjzzXasLG6KTZU3xWysVzKWITDmxK0BjyHlk1r0dXIx/fJ+nBMIziHeL3u7sB5w1DNS1CZaVO1W3Wj08I5OESCLKyUUs2JWqDmFCn9bGyxFifjrbfYXWghSwGSFH5w66Fj5UAYfn5D80VLKBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRW7UznB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUPKl1QN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRW7UznB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUPKl1QN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C1n03576091
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 12:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRpx9LYw7i4KLEj8Owphyt5EH7uTHU/Qvcis/HYmUgU=; b=oRW7UznBIqcAT3Mt
	hoUJbNhpbaaBoVJoqSlzEy/3VOoIHF/lK6Isg3cxKv0QTOf1af26Lmj1Iu0Hu1/h
	5KoRTD83CfwzGciEaP3donn3VPqE2f9qbGSAJSedDwiEWt3DLKyuF2vWCq6MXzyV
	Qd6JXcr+Ozr2+a3wfyHJzeLcfIL1sJMg8ouix7a+VBX6hknSetpc67TP41PXerjy
	H8UVN57C4LWUb8Z9ZiL/I+dRuBe8XVIyNSyZ/bWJvRlsIz56TvAcVkcwNSINy5gZ
	CHs/oAxlExV9u0ENIfaruk++yHG1/bHIhI1Kfazo8kIHRoSu/v4srJ5Wbb5JvTVi
	TGP9Iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu17ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:01:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so30954291cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786104092; x=1786708892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRpx9LYw7i4KLEj8Owphyt5EH7uTHU/Qvcis/HYmUgU=;
        b=JUPKl1QN9NOodI0Mbf7HbAxYCOg/Nr2tfq9PIUxfBjbXJOjRcEfDK9+68FFZ1fHJHN
         +R/N7Wv8Z1nmCkVeuIuEMQZZwQX6vIR0UybM7SxfxkQOwzvRBEtF5OcVi0r/MNsSp7M6
         OhGD8ad8+Zz2Anq+eDkoPJw9hUuLTUNW+Wj+FUiDpgmjoyKtljkBDNHUCvFGfUuwC27V
         Gw8MO46zQtGKDHxgvtlX7SJ8sfzyeqFjoN5OJ+78j5n5wTN/Lzzb+TUn3tv73+g9sBlG
         f2/qfKozxr1kgOTtjLbGhAlBiAAQ6SwBKbP0EP5tTNCOZqKSimWwVUiaiZBAwEr5I/mE
         5tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104092; x=1786708892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRpx9LYw7i4KLEj8Owphyt5EH7uTHU/Qvcis/HYmUgU=;
        b=cJQkNdwSnezmtsugMWO39Bu1XoDuOdCpRHraKSj6hVJZn/3ClbhjXllch/7B6aSJXS
         lOQpExfVlWycFv7hNUwQZgMCzsrj8qFKRPEebUEdJgq7BtN0GEO0vVlP+5x9cjBZ6yN9
         TeCEjTf7YmcISvdQABW3/S+Bv3J0sHw85xYx6/Ixx0HB07yzJYKtr7l3xSAxciP+l+2f
         wKbPeHs4FF194RZsAoLrSpQJIg50dbYWPPNm6LIvn3TeHrwAJfPAm0nxCgAReTjY+5j+
         6o8JhBwz3f+RXiuU7w2Ft1y14nJemkn480c6KkPKxYUTmLEuYCndzB/2mIwPfMFlCzki
         be+w==
X-Forwarded-Encrypted: i=1; AHgh+RqGHCJxytLUQ8+5wqTx79wmzsYJ0EOqzeTxe6r3RK9RY5+gYS8ui/85jLm+t8f0sM143RStaXaC7I9ubjoW@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8FblQzDHlwYut0pIGrf3VvtjwQ7fcK1SKGOZ2OAX0zZ/yT6o
	Gl+7VFnhqqHsVR8wXP7I5d/fx0pR8IjbYzZ03WnkykPKSdB401Mvgxh5IF97PgRUrlHx+SAmexM
	0Sh2h+wMhNGYUaJVwlOKAQhbt6bc6ZfNXSIJECH90sx2x4q6CGHkqTzB25cJGzbaCjYH3
X-Gm-Gg: AR+sD13r9quoINNR/1ykaGjHkUnKs+fqzpamaAA0kQ3LCfsFa97C6yVQ9CIYa7LF5Fb
	tG/mOFCOQCx0KhL8lgk6WgtL+8q15SOsbNMsjHP9CZixtka+NQF37+k2CZlDcC8yS6BVxjiMw7M
	GHOE4SOnLQxrLRtW409LiaNYZPbGNsjnz/HZ5DAKwycM7BJ8ZvYgXv39pd3RlSYeV+YUZAXL++Z
	4ov3sDn28HcSoX/4KU4NkogMKM27FDOU9YLsMBiKJq5/YO7ceKeQ8Z3Ew/4Cc69oAWtDbS+aDUh
	+doHGlYQCwJrbgOGlYBsV3CXPaF69Pzww6AYZrWJnTAxM2YffYnIuzvICB+9NQACjxJpo4DLe49
	e1ylGG64ur732cH8Rs3TTcgLnPrJUhbrEroc1xbp2QLmFmg==
X-Received: by 2002:a05:622a:58c7:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52ce5fbdcc4mr257610371cf.13.1786104092088;
        Fri, 07 Aug 2026 05:01:32 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52ce5fbdcc4mr257608751cf.13.1786104091454;
        Fri, 07 Aug 2026 05:01:31 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8b9bsm5890100f8f.25.2026.08.07.05.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:01:30 -0700 (PDT)
Message-ID: <d7548617-01f0-4c1c-b708-5cb8903a8ee1@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:01:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
 <20260722-gen3_adc_tm-v4-3-011981f756c8@oss.qualcomm.com>
 <a68078d9-9b80-48af-808c-af24d97268c0@oss.qualcomm.com>
 <anTwleq7qTOBBr3U@ashevche-desk.local>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <anTwleq7qTOBBr3U@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iqi1EHuB-2XSnXRLtv0A6fzf8GpyAu1t
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a75c91d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QyXUC8HyAAAA:8 a=_yZyQ5FlPg0S-AIa5z4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MyBTYWx0ZWRfX+BgGlBO95xhz
 EU0yOSn39CD0W0TSBsTcVLxj2X0Q3unHmHhBth7eJsqJMlHSChQUA/H1s+iNTb5IuqG4lVOfPZL
 n9FtizZc28XazzHPwB3pt91khobMnzo=
X-Proofpoint-GUID: iqi1EHuB-2XSnXRLtv0A6fzf8GpyAu1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MyBTYWx0ZWRfX3tbhNBLqmjXc
 LkgvO6neM+SM+VKJShPQg6MyKvwik1a2wUHXqvc4gGSvq98nazuxyQLIEo0NILTt49b6hTqzchy
 TYPXGfwikM6eWgUuKmFRt4pLsWq6Q8r8B86GRA2qPIFyaLJGNNra5c0MvQ8qPJAacHppbXRLD9j
 hDcoqjDkpD8sd5Z8hKkkscX3S6149VZo4N0trG8wlqFB5iXv7cNVlyAGZxLtmPhO1UD5nbNgPnm
 pY190MRUACWZRa5ZcjCA1jHlcNONm93qp/3/Zn3hgfYxa16QojIC+9tXllrYg/DDVGv30RJYBYN
 8Mweov0bDeN29iGv6qTiC2EC74YsktQCav015kYJxGjK2JhZiT4elCjtJMGOGr9rbO08ZiUeU62
 8QU/ACGbwwYpg4JIDLlLS5iV8Peq+RnBvkAxaAO0XvPQbl0aCgY6+kj61847irE+dk4U5o5bWPx
 buGjNcCj1n4Ytvm9eAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070093


Hi Andy,

On 8/6/26 22:37, Andy Shevchenko wrote:
> On Mon, Jul 27, 2026 at 05:43:22PM +0200, Daniel Lezcano wrote:
>>
>> Andy ? Are fine with these changes ?
> 
> I think yes, sorry was on vacation. Will be at full speed somewhere next week.
> 
>> On 7/22/26 13:26, Jishnu Prakash wrote:
> 
> Formally you may use my
> Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> or wait for a better review (1400+ new msgs for 2 weeks of vacation in my mailbox).

I'll pick the patches, Rafael is expecting a PR soon

Thanks

