Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B991F09A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790051; cv=none; b=Ar0bYJ92zH5aqlMDoUp+c59lC3zTpp5XAs9QQD826zzmmAKvb9R650g6zVApjfUuKAzinmDGs5rGjwfVicVxLqSuo2wTCh5XKjEENjGFB8BqTPwmrJQdGkV5R/5mqR0yq8hrgvxxlf7gdKwpOC105K9xe3upBkp/feWK7SaV86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790051; c=relaxed/simple;
	bh=aBDsjWojCpOjckpQIFcWTitHMvL3vFkN2gnGSLVuPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxHf1rtKuFJnjDW7I7L6m5FYprrgoe1JNZosY/mgXgR4QVb1YDpSlLMVm+HV+3+KGwHwUKvuhQroSTacdFBvxLvzSIQiLkoWJjCGwNcJaO7zDc/GGXIqILXN3p5XOvZWm1wO3bI+jxrx+NKqPiMaX7q1BcNKPvQGJldYaT1v370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkAhdFum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEtp/fDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkAhdFum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEtp/fDv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N6ANuM2889865
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J+PD3+eCAhgf+ZAWx2EpNotq5X1MOFJb/Wo64exUAo=; b=NkAhdFumt3b6eBQm
	rItMWiVySlQ0Sd0K4Rkc4Kqdbvt2yqgZp8yUsqUw165b8+8PHBYgLNyQX2tHJsmF
	u34Z6kVKkFvilzwtqnaYVwgxG74aEx9Rhxs2oRLUoP7kU+FUujRrTfXvpjrrZtlk
	/VCtLB7o7ORd/YuEDjiCm5nKdfP85NkLVtD1zc7E1FODw8vV0W/RoXJ+Mb5curoF
	ej4dutPsgbBfSNq22ou6CzDf0S3p9dPDmV/8eC7Msy1R0oAMk/LBRIdIiTLvUzaN
	SBqelh9zpaguAE+ftTZnTL2JSlCkav2w8JSRdD3xko1TG/r6XodFBs3jvdqsAgPa
	acQG8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw0uy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:00:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so4874285ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784790049; x=1785394849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J+PD3+eCAhgf+ZAWx2EpNotq5X1MOFJb/Wo64exUAo=;
        b=SEtp/fDvBp1aQGQ0ZmV7xGqz8O+6AN8qe8oAcOnavBKl4E8hM5d9J0RJuEgWxr2SKC
         HX7+9YUivehPbtGd3hwpVdUCF4ASkjZJz5iiC+6cC95vkSt92ypfKQND97z86m9nO0oP
         vaTuosyYBU/mo+8kmx6eTMQGcsqmH5MXE8o3MwJ0ACgB1O1fOLpVJmxLeedQbvgXba8z
         2U64TYuWy/QtqUwwz6KKRBWQmMERGGAFOVQ2TP4hKhWeUBMR3JvWurcMQd9ZkQkUKZhk
         SMUSCB8EDgu/beOCha+SbAA4gGDJT+AoVyOui7Rf7OdDnpZGT+ZRbc3SFvFrvUK65hHw
         C3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784790049; x=1785394849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J+PD3+eCAhgf+ZAWx2EpNotq5X1MOFJb/Wo64exUAo=;
        b=AwH/EBdFzaTtOBIUTphgLe29pJIXpcoofY75PL3OUyEV+wm96L/8rbUk45sTc7wQIL
         An8qS+9N1PMLsTowjbG7tzeY5s9puodSLMtZ/dRMvAGjr0mbDD5T+MX0pe4sz18zZ4LK
         kj6uy1kTLAzOWxSbsG9LY1VV5pbymTlriGWh33rthuIpXPdVDxyPicaxJi1b7DevwX3u
         yL2wvrEKrFhf3FMN+nLWyNaaSHjbvYV1n91L+RGSFNuJ+d/kj8fy5DKvDNNkOJCdvPbH
         KadIV0qDg8z2uD3ql9BB60k+bT16DQhl+H+qNlQxr78wd4L/9h4hrI3FdFSZymVtV0Ek
         +e6A==
X-Forwarded-Encrypted: i=1; AHgh+RpxzDlIpFk2RSc5G+ZyTL+QjKTHEEoiJIY9Q7Eet8ts6Y8RPW3F6xindqhywpJV8EsxrzbWk4mlV2n7KpBK@vger.kernel.org
X-Gm-Message-State: AOJu0YxJw2kIJJBT4IU9YNNlJXjXZSPOXLJzyVaj7ISalz04kqgxp+mK
	P6i7M2f0GJQu0LxEtvOm+t2rnkkx80YIqrbbqEziPwZyUA02KWlExr3rH8q9qxkDBR/FMUKdUF2
	T5s/57IKAFTd/6KBjiPi4bpXUJamnpD7BHgazQCTqSVNrQlS494i98CR4wPcwwKGpxyBC
X-Gm-Gg: AR+sD13bWHnPv+Fl13yeuEl/BA4aP8ESz639c9aux1m86tjBqgyrRAOOCp/PbDm4Hn1
	X0oDHIoMxzm8ZeyuAskyBI2yMwcjO4GEw1lwq6WagIfknWmTfwAYPaRv+r8zJEaKbUUZTEIouJ3
	frr1OhQUZ6FxQoLByFfmSZuH5E2/oj5KfINCV6642RW6zImvryBll8jmAbwFZT8lQ1SvCfJ2X/P
	Frf+NhbyCaJnrXYc3rZLFQYbT4P1a4MXpF9L07ok0xM5zO90Bv6uWBSTeGoYRhNF4P0+4mDRi0P
	Tgjx8YaNNvuojTf73ZhIEJ0hD+T9hz+xJBwCAQ2hWe5rE4Kk2YAPnBJgm9khRtfk3meokNjmwDz
	9IidwZ8yPYCWc39jDJDWe6O+6wHRcw/+k
X-Received: by 2002:a17:903:1a4c:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2cfa709813amr24046115ad.47.1784790048815;
        Thu, 23 Jul 2026 00:00:48 -0700 (PDT)
X-Received: by 2002:a17:903:1a4c:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2cfa709813amr24045545ad.47.1784790048237;
        Thu, 23 Jul 2026 00:00:48 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6781dsm17746597eec.9.2026.07.23.00.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:00:47 -0700 (PDT)
Message-ID: <3f46274a-d2ad-4eee-b0bb-109013bd6b2b@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:30:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: qcom: iris: fix missing hfi_id in gen1
 GOP_SIZE cap
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
 <20260723-dynamic_encode-v4-1-5fd6bd549ead@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-1-5fd6bd549ead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61bc21 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VE7FxYgvgxv7Rbt1ey8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -Bcx0jUe4_CtLuAnE9DvfxATUsic3Qsq
X-Proofpoint-GUID: -Bcx0jUe4_CtLuAnE9DvfxATUsic3Qsq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX1X3Bnzf3hA9D
 jrKlC9MZnZtRfHIE8cx7u1jpmbSi0v15Lg+VmbPROanm5ochsfBsFsCg2WXz1SWn90YUF1dBVHm
 LhwPFhQkE2THA8vqNKj2J3Wrs2Y/HMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX431XU4iZq3HN
 W+C1JsLWkqoUxbGVALq0wNTUjXxXx3Zml1I0BfcKl0N9lp124DD8BWniefrpKo6VYFoP+aH0kp8
 LruHau827qKUafvUn090xX7JdM5H69asvsbK/pgjMmCADASZh9YiOQMfaI8nEpwKsjYdRg4Oqc7
 gIVs8kvV3kxZZ4a55mH+SrI2cEb2fFk609qK0+tuWVQ0L669370IvZVPXffcJ9iai/DN3Q21wS3
 hjUP9sf1inMNqE32XorOnGQetqKMoEZ1ves5FAUnK4RkwUbYsE6duJP02ZN4E3NYZFgIFNJ/AgR
 CfayjzB2m+0qpjII39O/afmfPcTucVG2An+sysnvb3Zxsh9xmXd7PnKBzEgUYFP5GhKZF9UK0td
 qF/MYzxAC2LPBWKfThauJJbo8XXt1Yk+MJlkv5HI26yZJN7UtqYqrC/meMdiUmj5a6Hnvvux62k
 i6XJXLvtuMaUzjgm8FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230069


On 7/23/2026 8:25 AM, Wangao Wang wrote:
> Add hfi_id to gen1 encoder GOP_SIZE cap and replace the set function,
> remove the redundant INTRA_PERIOD cap.
> 
> Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
>   3 files changed, 5 insertions(+), 14 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

