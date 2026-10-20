Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504892;
	b=MoLxzVko0ctsGp0wfWFngB+OPdv4xavSnVkXMHWqggWARPY5fgaETUkpSjVVfhN0VsLL
	 0OG6cJAiqnmM/ZR7/6duEeDeEG8lhIamtMBTjl2r7L/DmZbDJaBoOn7lUoempBfkJXxWt
	 hq/jBS1pd5zG5MahngeBlxMNz5OjCp2khsMvk5SKme1nfWaiX+5gw/3EN/I6SpNdSwn2c
	 BJYNFFdoYI/EbHjIsgmjE0+/JXx5rVjhR6jlUmYBb/d8TDf8ta/8CUGy+9NFIorWIdtts
	 dEO9cJlGC45w25ySkjehk41eHIBy+2/U3id5sCLR5YThQSAt7DjsWTZoTGSj1+Ke4yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
	b=187IhTm/ChQ8uN/Odip4f37KU6vpzWHGS8WkPrU0cumnIo0GTv5EEKBnKKEHOFHCvk5z
	 h/bzfjrxSOToypm8k29RVtyyVFA10/R/U8LES56BIpz4GaOxnPOXTaTlTKT6Hg/yUkivw
	 MFbCQ87NYtkj8xOJSSIq/grmHqPfh48caeBdE7kU+2cQ1xTjVb/3+ZJs//7SJUxvIWz1g
	 4xGcLzk+b2VG1CgL+gAWFdBViCeJ5Hxz7gji2eWmW4WfIFBPLgpBDp1wJ2kBTQ0HYhZMx
	 zUdUTM2kXgUPC2bdhgRgPQEyw19v7uXhQQ6N0+PQTvBIc5oTtWQtKogg0oTeUVudjGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdfUd8Io;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83413606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83413606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdfUd8Io
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDk1IC1810694
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=; b=QqNYPlK3iN0DZizd
	jG0edZTjx7AzM9Os37g5vfDpBPvpa8eoDAlkhL1XjwDuuhMIqcNii/gyGtdwC/dQ
	Duk9HhdRrssaJfnje4WOWusbTT6Zmdui7At6OMP33f8My2X8pf+YHPvjyHHMu74p
	0D9kZah66xD02sxC6KjzHY+DSYSj+h/9IX/WxZ8+5w5WXQ68LdBo9WW3O++6WJLL
	v0lxxwZGQ3j5cdgIESu2jNP0/qPscJ+UR5AZMgQMVl/HOK+Pt59CEaJLeeaVOY1n
	P0q7/AsDmIO+thg9Ozh8C5zEQYCap0qgnY9K9CHb5Wh8k3uUrZs/fWPCInw5aVBG
	7L/tDQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2sqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:01:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9906ce36960so37842241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504890; x=1793109690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=fdfUd8IoEMG8upHkv9XsdZXrVJxhfAxxy6Pp1K0peZIFDXic5NBPMGRXPMV2Cwu4Kq
         gDvqnNhkAwM91i4aGRk7rhqX07Vbxqpjni+IY483Yw2BkDq65VSICqy2epTx0ijhxsxw
         q+j2nU4ApG3jTXvdHRRnv2xY0n0VCC4retSi3VmWO+GVz2tBHJ6EW2PUc3lIzzSL+Aj2
         NPdy3f5Yo2iNHE+y9pWZlWls+0G0kRjHIhs42I2T2VTZk9pIDxNgw9uaZCts/AQJW+si
         cwpfCBoqTghOe3fx6m2Y5o2VLF3r5o+bnKZir3vUYBqsOth2o9GtJkiiD1gVZ/S1mb/B
         oLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504890; x=1793109690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=j8RuxLPidD9XIheAHhmoC0r7PritiN3od/1aOpg/rBCEp1tPIaYNbfI9nRibcq0OPw
         WAi5pV0AbwIF5F9cQjtC3JFj+uJEzUpv4p5RtaOx09IyjNTI2URNTGgEcaIrxIY5Zcvk
         0b+WmhmfVgamqDR202oOSNuca/BYHyPN2B34fueF75SCQQWv09P2NdWMo8sSZwAFFw/C
         zX+py1uLVKd6sAwiIMPbPIJvRd617FQUFojwQKdpHwRwbRgXyZrxv554XxVjFo3Wz03z
         CrEUjrw5rJKccnpXo6aS1xeuAXTRcGiCkyQu/0v7p66wSHws/s2inCrGYo5aZdZdd2bd
         I/6A==
X-Forwarded-Encrypted: i=1; AKwUvBzsxy4/Q8rkWl1wjb1GBiJbU4L4nZ3JfxSUcrfHeohrp2B7Z1A9KQT9fLj8612OoivRBMDVWnwomhSymzsT@vger.kernel.org
X-Gm-Message-State: AFq9FYLhSEdSi6egl2e6RrK7YPbeHrvViWWnlY1r4XceuVJ4zTYmV6ti
	EvgHqSzn2fmqr8LQKnJiYUpK/kuKcfI1qPIzJ28+UZXmZg3YY7Qdr0sZbWbO3IzFLdMtPOiuSrv
	h11TbR4bzQXVSGf8fxxgp3k8IRbwspJ105I6LlAML2LFo0rlRRaTJldVPeMwwPXQqpSMrPxdehi
	9v
X-Gm-Gg: AYBFou0O5SsMIwtqN90EABEGfvUEFDnuOBozySzsyVBEhAaia3APpBAR3CSuONcXH7W
	zJ4do6/ip4fvtQUEycaWGPxr1gQXDTy64fB0fooANuxrT4c2fQE5b7qpIwBuQLOaCdcVB+HA0Q1
	67YzYZ6coSlGJ5GuJiwj/PAQOtT7omZpFIo0u2+09Mrx++E/leYjLnuO2zm1QEQI9Nn801emkJQ
	f+SzwaPkskqzYkyGSyoLTTT2zScZqzprleGzgVHnPgXKD0ycdI8sBYc2VQRXCWsLEzVfQf3YnAo
	14BXs8mDkTclHy0xypiI+r0R8gwXeosRmA0OdahgkMewNvm1z3BEicxsdm6066KlldLJsBTNukV
	xkkGWk4j11bhp98pgygkANg==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651131137.2.1792504889519;
        Tue, 20 Oct 2026 07:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651074137.2.1792504888917;
        Tue, 20 Oct 2026 07:01:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5333722a12.13.2026.10.20.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:01:27 -0700 (PDT)
Message-ID: <ad849e0a-5ee8-4df6-a679-ffd44c2972b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:01:23 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
 <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
 <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
 <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ie3J0hQNH5QrISqQUNASaATBvxg-sqDv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX5DTlL9GCKqkh
 E2xp0dT8KUCHVfSjM0mJhXoFBBE3JYIjshq3PwDw7unUKVSLJlMoqdcmpybI6mmqzZRXlXzLAb7
 +AxqlMAVdTnAnZtMBYL2usnfAceWHnk=
X-Proofpoint-ORIG-GUID: Ie3J0hQNH5QrISqQUNASaATBvxg-sqDv
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7743a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SB7vGQqGIbRnJ8eduEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXzH5WdwIiUwMq
 /3d75ubuqK/uaNukVZRqab6NaFzW+PY8EDBc95L6phsHa/ayoyhCQgPDW1hlX9nPjCXaRMJ0efb
 +hjizQ0R8WVQOTFHnUK24e9hawickJjpSNAeJxiqVEyeH8iVyFp+jEyKhidOA34UkXYsGbQxB3B
 igWn2nOsG/epuDXur1e+a/h3jsfM9sK1LQnLLRGaGG+cxJVSMxMIj6UUSBfOx7lHkNOOZaBZhnq
 esJOKRkncXHF32KSdagGX2vtdfN5e3hNX2GgLIQ38lcmFl+7tiMeToukgoGJhuxJSxoqg9xcXxU
 cGUzcO4pXK+z+TBMgc0lRfm6b5oDKgnDziFrACeYyiekDjx6vaTG5exGo7WAL7wf/ecxYnGkcLe
 2XmOLvjxn87bJtKftJPD46BApJQlbTLImCLab38gD4PCGMeGw3Uk4WyPZRGZnqD7J4G34clV/j3
 c8ychOxTm2bqgm/dbHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/20/26 4:00 PM, Ilpo Järvinen wrote:
> On Fri, 16 Oct 2026, Ilpo Järvinen wrote:
> 
>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:
>>
>>> On 10/15/26 4:24 PM, Ilpo Järvinen wrote:
>>>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:

[...]

>>> Yeah I know. I still left it in deliberately so that in case anyone
>>> wants to audit the format here and compare it to the DSDT it's more
>>> obvious that this wasn't an oversight. Do you still prefer I resend
>>> (or maybe you'd like to fix that up while applying, which I don't
>>> mind either)?
>>
>> We can keep the member there but I'll change it to {}.
>>
>> I can try to remember to fix these while applying (I'm good in 
>> forgetting though :-)). But I at least try to check all the comments made 
>> to the last version.
> 
> This patch 2 has been applied to the review-ilpo-next branch. The rest of 
> series will have to go through some other tree.

Thank you!

Konrad
