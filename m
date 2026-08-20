Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CBB35A385
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787199176; cv=none; b=B7JHs/SSmazymivLiQtLcB+Ma9WcDZe6zDIKJKyjxuBUXXpWEEAgQ1pXr0y9ibRFFcV79AkQ8byHS7XkYaEZW0gjuBokRpu5EsbmPac+GsbAYfqWBszNVdArLc6/a7sBf6YC1opMrDfNIY3eRx8KCtvonLxshnIekBtBj6Mk6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787199176; c=relaxed/simple;
	bh=gl53nmErgxNHnBhywqBf9y2uMEPF2VoEaOuh6BLQ358=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEjA15GJ3bs8L0wDTKi/jpF6pCqoCTJSR/oHQJda9h28wKSqivj2PEW+AGw2F46Q+ZvcLkRylD17UBtnCA6wXsX0FyD8u+zazmC8cH10VBvmUURUkYZSL/CAZHq9NblzoRqNpZ9ES5Wtf3g82Ol+CJNMrqlBun/qy71P0lKzpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQgR9plk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu40D/bC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQgR9plk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu40D/bC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL91x51355798
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/So9S1KEAt5OvNBUFCqjrX+Y7R9w32tufku2nOhCX44=; b=cQgR9plkA7XTyz/x
	f5xmgIfOnuBZAITDNXw+tp/xBCL7i5h3742aucSTz67ITEQ5pVQ4x7GlZpopD2ue
	rY6S3YtJIkGI9E/vThBosMqht2uFYyF837f3tVULItgVkoDUAR4R/YQldZsRAjg3
	fNaOBmcvmBuf6ZuxwMGJ/QzhHI4ZGfz/CFL3VoPXESuTblDWtaU8xQZqY+MwjT7N
	gkKkqZjnUPBQTz4IzGUHtUIou0iJ/Ri9cQnXU4Zfprgw0zQTIeKiQd2Wh7MtWuPy
	jL9pNN24O70HUA93grBVhLfx8C/OrP2WvJllP7HItMIgTiQsRHL70lboMin87WeN
	V8s10A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es5b2ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:12:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so2266376a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 21:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787199173; x=1787803973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/So9S1KEAt5OvNBUFCqjrX+Y7R9w32tufku2nOhCX44=;
        b=Hu40D/bCC8YAFixzFVG4IXF3u8YNievRXiKl3WkJCyGCmcnZLEfZ/JFJkpT/Pq1/1B
         k0S3va/i5yvli+fpfx5HBAuklcwPMUEwgiK4V4Rvnwr5PUnsJbIC9VCX12UAm63wtdXh
         my5kKhWbaE13rWn8x9rZefSiIWz+tXdrrxcU2Xvj9lSegu6SkxKrvsTucfaGgOYn5CAf
         FRsnpKsaS8wGAlGIqQcLOHkwvU2+K3xAjwVI7fLiy2/2mxP6hExkvb8dQqHuH15oRoh0
         AFDuA/puzvRSuM2lIsKo908rIoDP2RojdTrEJrMbOhmeiyj8sUIejRCPtzO84gClH3Fi
         nXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787199173; x=1787803973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/So9S1KEAt5OvNBUFCqjrX+Y7R9w32tufku2nOhCX44=;
        b=lPsqLn/HnBAz+FNvTvB7AL5dS14qUZ/eOjM0jzAX1y2rv/e9RkqsTSdHQmHmv7KqR3
         5j0ALc6vMTFTY+Lq1WNHJYh++fg2c1hbbdsZ6n+OsZ2bXyqRiPD0pPPLfhLdDH9/gwYy
         w/lGKEMtbk8mVlp0EzdJr+dhDbDtWlh8r+b0ocFCL8KFUWkb/7j92U5HRQgCt0Md9btP
         WoxFIzsxfElqIT5+MNB3O49PoueJp9yeKQfj0gKcfYsg8MtZJIil8nyNZDBHqghPVEgN
         iagfzqJvokA/HIZwI4BW3MWvM0OoN/1wTgnX3bqoLvhJf+iStidYLp/2pUBpvLeMV+6+
         8g3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoUgoWqHyU32jyroB5wAOTnEp4byvwDCjcw6f7jeCnjNJ7/exMIEou5l6ThfklMcoQpleDuVG+loc4OkWI@vger.kernel.org
X-Gm-Message-State: AFuF++n55rmhn18fj4BguEU35mGfeTF/5CAgl22QT+k1TNqEaV/WWrDQ
	Y6Pfy0KWT1HzYBhiXhKI50p6mvyC8MdKuMJtBvMtZDyFry6bvoO6Za/h0vfCTmLF/FmhDo0Qpky
	yqFaMK5hbaS14P6+UNZNXKTZKRvDeqiY10ZA35hiq8bCADiF4rvrT7HY43tbNCtqKcipG
X-Gm-Gg: AR+sD106U5ShQupY3Ls8pFhBySyYYiFH3G0VakWIl2zhuXV40zShr0dvAMTDEVPyIo3
	GvqPuoa0Iwxs+f2fcLRezDE5vKO+BhsSxZ9Z6Xkt0OSnMslLhZ/hITmJikumDAvprxwypWNWaSE
	Ejhx3jSK/gMtws0FpwAKoLiuJO8jF8xd5Cc317o4Ohc6F2DM9qCj4F89EGP2dAhR2R/D0rt4POg
	RPb31OI6bzI29MVgOFQZp/Mfy0zpZ5MRdFph7vyNTC1JE4derUyuZ0Q789cMHSQUd5F2hLS74KO
	pW9FWYjUVSoHiQLiJiVJVsF6ZidwKdhNlLKUtL60W3VNTiepLcR/tQfqgP88jk0vWHP23HbRUdI
	FqEA+2qg6pv9OcfqP/MYfjs2ebA50ww==
X-Received: by 2002:a17:90b:5385:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395812a872dmr18290561a91.5.1787199173013;
        Wed, 19 Aug 2026 21:12:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5385:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395812a872dmr18290423a91.5.1787199172352;
        Wed, 19 Aug 2026 21:12:52 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm11842356eec.25.2026.08.19.21.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:12:51 -0700 (PDT)
Message-ID: <4f11dfb3-9d92-450f-97e7-f04404c63250@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:42:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
 <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
 <e0a25f11-5c7c-406f-a223-da29bf6e1401@oss.qualcomm.com>
 <f725955b-27aa-4b20-8a4b-84906782b921@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f725955b-27aa-4b20-8a4b-84906782b921@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WuBIxxiY65Uco7h1iz4I5s_Efz7IQ_84
X-Proofpoint-GUID: WuBIxxiY65Uco7h1iz4I5s_Efz7IQ_84
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAyNyBTYWx0ZWRfXwO47Hb/ocPss
 BpEZewLFsy2jAe1f36QaLP2/qU1hOFYPSigKkCZ2jpX0oTyOUrOe5OoXAWOGNMCMRGKUT+X3MW5
 h+qOUH8jXNddfPqQrPUtZBwUvZ4KOJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAyNyBTYWx0ZWRfX4DUqXQb4bLiJ
 4xefj09QpEaA6Li558+rkX3qRazn4K7dxz6DlVWydjALeK0/vAckZZuKIG+yNOHmomH6qAqVvVz
 2sIv8Dw2HRKRGqldrqKHLenT/KBEJoB8tulhwQX85mAUd0eyc3iL9qe5Am6P87gTOCtO+aQSzhi
 l0IA0BRRABf9hSEc3HtueU5COdfLlYmfIRqY14kYBhZjW1q94CDTBUZWz8gcK6EAyBJUCkSm1Po
 T/G9wVN6qei+u954UJVgSCXowJKP8l9hPImtCc1smPGtJf2WsSLLpIGGv3JBz4kx+H43NwOhZf0
 GRZotF7Se3t5KOX1F0JqSAsdNsbNztdctOAW3E2a9bq2kQcMK2aOj1/rtnh6OG8goBEuEXYTMtc
 S6vSuBkVVT1qpFlgfAM2+dTWHH3Q8RjRErMKi5hUhjYycDPlD2Pw/WXcaCWKsMsZ8v2IAy2Fbl4
 EK/7ClNddM5SkXSUHJQ==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a867ec5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4Unm9NrEEcootba8-QIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200027

On 19-08-2026 19:46, Krzysztof Kozlowski wrote:
> On 19/08/2026 15:05, Ekansh Gupta wrote:
>> On 19-08-2026 00:52, Krzysztof Kozlowski wrote:
>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
>>>> Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
>>>> covering the driver source under drivers/accel/qda, documentation under
>>>> Documentation/accel/qda, and the UAPI header
>>>> include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
>>>> lists are listed as the relevant review lists.
>>>>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  MAINTAINERS | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 912837dd4640..75fa90c137c7 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -22388,6 +22388,17 @@ S:	Supported
>>>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>>>  F:	drivers/crypto/qce/
>>>>  
>>>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>>>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> +L:	linux-arm-msm@vger.kernel.org
>>>> +L:	dri-devel@lists.freedesktop.org
>>>> +S:	Supported
>>>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>>> +F:	Documentation/accel/qda/
>>>
>>> There is no such directory.
>> the directory got added in a later patch, added this patch at the start
>> following the comment here[1].
>>
> 
> This comment did not tell you to make it non-bisectable. This comment
> asked you to add that parts in your first patch. Why did you move
> patches instead of adding this into the first one?
ah I misunderstood the comment, my bad. I'll fix this in next spin.>
> Best regards,
> Krzysztof

