Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EB43F4858
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946437; cv=none; b=efJTM8lpUpRWzuF6yt1DVAM4RXtiBbs00KXR29n1ScRiTha5uB4zs8QdA4aznFBDcUdKXcefB36+yB42Mp9Afhho36VhAVl+R3i2pjOBfjvtyJb1Z0F+wpBrSeXpp+MRLujpk4qzvdDvq2glJi70lWF1Y0t9nhCfaTNuzOv8F7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946437; c=relaxed/simple;
	bh=kNqW4sSYGE5RLkZoBx/ZOl+rx5XiXMMo2xzg3a4N4Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeEbhwyOfMgFDXpaIeZIBq9ZfcpjaNRa0stCuoIYD3xZ2e+S4A3L+pkNq4tR2bfvJze12ECohd0T48HrTFPE4DmvEfU9YqhD2KZCNEG8Qc9vaSkaHqCz5X8/Sx//r4DgeemszxkFJGywd4BoKTHw4mu0wLJRv2r2s3e5aoSNcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSd6TU9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hESV9MM7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSd6TU9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hESV9MM7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899UMGX3771444
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3ioQZMKHwe0XM4c4x4bDZIuIz125l7nRfQhXfiQNYQ=; b=jSd6TU9ikeRQPs3y
	FeEwVvdiWJ1SfErQCQQiALnOJ0hXnDx0R6jmtUmWrtbvMlDXaMiLwB4GFCgl1Guh
	lCm+eOMTpPIjeu+JFw6a16zZRtaO4Z9eYJu3BMOfYjVFoetNySyIYSPunU94X5a+
	UsruwzKZT8hVNpeC61WX/V1UQjWb6cwgYewmIQPMnZpdFSV4Hg+7hkZbc0y0HHog
	/nAWya5FprPJiKaO+fu0Q/wnD+LnWYe8xaefRVyy6b5+5clRNqKdMofwq6e7RQim
	JgNdjESDhTlmWd5C0lLvmxSxjPAJ9R47vOIaS7D/gDpjkdzbI6O/LQyt2dMF1pLO
	h/ZiVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr19w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:33:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1034508a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946421; x=1789551221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3ioQZMKHwe0XM4c4x4bDZIuIz125l7nRfQhXfiQNYQ=;
        b=hESV9MM7rDgxB6U3t815riSjOJ1gp4ANH6gjIiQwici8OmrcpqW0C2aOOZc+2ioI3E
         vvOw5Hdt+tEhOlatpk6AGLsa20FEzbt2tRAjIIA7jlCyPSK6W3mEXFR25csb7LTgw3JJ
         ZeFQS8X7JrV9CjaTFYF77YMfVuGTBDZgPiGJgyQAjVOcJp/wjzJ1k3uA/zi+KwpgLBlC
         pNdkn/CXIoeUUFqpomT6ztQ/Ze5NsZ7FoI2gBYkj5lX2TqZV0VkRb1l5IjJqMAN+o5DR
         o9/ZYF503qKSHFOBVq/hO7vKj48PdeaMWjXne5VAv2QHZ3fM19ZmHCgUhs60ARm4VtxL
         E02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946421; x=1789551221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3ioQZMKHwe0XM4c4x4bDZIuIz125l7nRfQhXfiQNYQ=;
        b=BUalCD6SF/lcE/CNJa1YFkdvu0AXAP5J5srl+qOiIT9i4Wjdtkizzme61yRq1+4qIz
         CokHZivDRwywjssg8t0XsCqVfBqz3fkgOmbVzRXGydvEAuYFzGxNu+AXaaBDQkWqW1DO
         LV50Wt5mSiM+xMa29qrWcOw0mYqjJR0OsvvmJAgB5HBxLu1VwINpydO+C/WvFCH8Uoe4
         qPXWKkqAw6LrD9Qcmsg1B/EtiBSx69L6KlxdwZPh6uRYEE37YLGsV3UDmLkSV5UMhD9T
         v538a3u4osETmasAELY4JsOU51PnMjvOwfUjXZYxWSk8+pgx2umkmIPJ5rk4IIDKgn9b
         I+mg==
X-Forwarded-Encrypted: i=1; AKwUvBwgyHtjTIneziAqoTz8Eo3stzRJTElR45ajagydKSfujpeRipDG0xFqbcxJhJqwNaYD987SjW3GIMyv9b5t@vger.kernel.org
X-Gm-Message-State: AFuF++nxLejDXgpO+fkQdN8VxIPQPaN1M9RfehEcK9i31MhYwQ42vga6
	tA3W3NiE2UqspTgIowkjndC/yoYR51tFTdxmalpg65XkNQC7Tsolth8iX3ZaQ35RDrJAUVJXlRu
	uQvM5qMdlbJdKY8zQnDi1Pg0gbw009yXNvSJbFoHCTILwjHsAkixjJ0YUZPgg/6h2yiZp
X-Gm-Gg: AYBFou24/WueLYkTD8nWpyN6uv23LGytBd0V/nLdOWeiaA0nton1FSTn2xi9wgfIx+w
	i6AUPF9yyGfIfGVbU1FjCD1yiT3L60urDjMJ0vht7yaI16crwltdPSTDOv48HEBfKNArArH5Oja
	Th5W2L0Ea6So4BKXtMeIut6Bm+9vg+LABRiAxqMIP4aIJCKrBOjCUxyA1KpT+mGJ+GfCdMEKrIb
	eSC1qybaUDhCsOEBwFR89s9Ew55jYqa/zLhp+BtTv6ZM4/drgUZKzPU9OrBlrt8DGSLWut+ykCL
	G1ZcFVFd6INnsuNtrNlGbcq42vWj8zMNtbhTnrrXV7+nbGsT8/C4ZkEp857LWbIET1toe7vvAvP
	YnRCoQBBvgHVBpyOyqcvNTe+3rhVrDA==
X-Received: by 2002:a17:90b:2c88:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39b262e28c2mr56016279a91.25.1788946421002;
        Wed, 09 Sep 2026 02:33:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39b262e28c2mr56016151a91.25.1788946420231;
        Wed, 09 Sep 2026 02:33:40 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm49524306eec.7.2026.09.09.02.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:33:39 -0700 (PDT)
Message-ID: <33042b5b-28c9-4df6-9c97-8b389a3f1112@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:03:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: rob.clark@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
References: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
 <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
 <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
 <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
 <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
 <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com>
 <aqCKgM1yCbWjFdgO@baldur>
 <09f62d84-18ad-4d7a-ad18-9abccfd5e508@oss.qualcomm.com>
 <c447c7ef-828c-4fda-8e82-6983a3d0eddc@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c447c7ef-828c-4fda-8e82-6983a3d0eddc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa127f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=aHQZQ_1TodyndcZw4m4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNiBTYWx0ZWRfXwCRPZKdZyIZP
 Rs38LgBjM5SK+rx71XD5ny/TtyMyw7Ox81nVJZcTvohi3L9TzM/IL8y12hlXgxBxGlMQNLApi3h
 iGLmlNmZUrtRYKXlE/DW1iv6VLE9bjdxL+qncZ4CTNPVJqb7fxZSHkDWyijf3aRlYBN8UGnYH5o
 NxJNvEvgJ7R8lExvU7otqbtkvGFULzEYsqms3Dr2A30386z5l3t3xw/s5xHKlYZKGIuI7YSLL2J
 ZzfGI295XW3qF2lz8xu6mWzCrEzvBEafMHBJSmBAowp7+LqjeHlR6TD45KYyVPri5oUoL4qiyHO
 mHYR8cvk2WNAji+aY3ARF1GcZlJ/FpRJu5ZwjkZQ34Ia0+eCRWGRaFeHJhbvMVYSl2Qn7KUFqrk
 WxEcHBfCizDugTrKBom4OD8uTV20YY8uOu553Ovg81afCDRMUdzR5tfwoWVqYSAlzsRtwUbUyjj
 VfGo7ih0SUc77U/jQcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNiBTYWx0ZWRfXzdwSVDq5bu6c
 xLg9QkqPRpmAfdZRKQQcjzkzFHMp/JFCl14TRiVBCRNivcokhha+wBfPEzlYovCt5AuHS5fokOF
 GgE6y+hkM4L6XBUuv9ZGG//StCXqumI=
X-Proofpoint-ORIG-GUID: XR3gdJnEgJGcJchPTsG8OJCxc_8qTf6d
X-Proofpoint-GUID: XR3gdJnEgJGcJchPTsG8OJCxc_8qTf6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090106

On 09-09-2026 13:32, Srinivas Kandagatla wrote:
> On 9/9/26 8:53 AM, Ekansh Gupta wrote:
>>> This is the actual problem!
>>>
>>> We have existing user space that depends on the ioctl interface exposed
>>> by the current misc driver. You must not break these.
>>>
>>> Hardware cutoff is not a viable solution, because that's just a
>>> declaration that we'll let the old platforms rotten - or alternatively
>>> you commit to maintain two drivers to the very same feature and quality
>>> level.
>>>
>>> So the only reasonable solution is #2; from there it's a valid question
>>> if you reach that point my stepwise migrating the current misc driver
>>> that solution, or if you present a new driver with the fully backwards
>>> compatible interface, alongside the new ABI.
>>>
>>>
>>> But this does bring to a question which the cover letter should explain
>>> - but doesn't: what problem does this patch series actually solve?
>>>
>>> Regards,
>>> Bjorn
>> Agreed. I'll target #2: QDA implementing the existing fastrpc UABI
>> alongside the new one, rather than a driver split by platform.
>>
>> On how to get there: the blocker we hit in v1 was that legacy fastrpc
>> buffer semantics appeared to need a drm_file, and there's no exported
>> way to construct one outside the DRM core. I want to re-examine that
>> constraint rather than treat it as final, since the legacy interface's
>> own buffer model (a dma_buf fd as the buffer identity, no GEM
>> involved) is not inherently tied to drm_file, that's how the existing
>> misc driver implements it today. I don't have a concrete design yet
>> and would rather work through it here than commit to one prematurely.
>> If anyone has thoughts on how the legacy UABI could be served without
>> requiring a drm_file per session or if I can somehow bind drm_file with
>> chardev by exposing some APIs from DRM core, I'd welcome them.
>>
>> On the cover letter: fair point, and I'll fix it. The problem this
>> series solves is that a miscdevice interface requires us to hand-roll
>> what the accel/DRM subsystem already provides as common
>> infrastructure: GEM for buffer lifecycle and reference counting,
>> PRIME for cross-driver import/export, per-file (per-open) context and
>> handle-namespace isolation, and the existing debug and lifecycle
>> tooling the DRM core already ships. Every accelerator driver added to
>> drivers/accel (habanalabs, ivpu, qaic, rocket) has taken this path for
>> the same reason, rather than each maintaining its own equivalent
>> inside drivers/misc. Building QDA directly on this shared
>> infrastructure, instead of extending fastrpc's own ad hoc buffer and
>> session tracking to cover the same ground, avoids that duplication
> Am sure you must have already tried this, but Can you not migrate
> existing fastrpc driver to this shared infrastructure under the hood?
> 
> Can you elaborate on what are the blockers you hit in doing so?
> 
> This will ensure that UAPI is retained and still get benefit of QDA.
> 

QDA's session model is built around drm_file, and fastrpc's chardev has
no drm_file associated with it. I'm still checking whether that
dependency is unavoidable for fastrpc's case, or whether there's a way
to use the underlying buffer-management infrastructure without it.

Please correct me if you are asking/suggesting a different approach?

> --srini
>> going forward.
> 

