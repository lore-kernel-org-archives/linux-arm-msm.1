Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B982EC090
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212018; cv=none; b=ZO2LthyEA1arcdNx1ZRW79tYFL1zrh1O5ap98weTXMV3u4qPsymDf3CvG7AJWhkTi08vpD0/T/mR6W6ElV1eS2bhuqNDRgEPg1lkVqMgfGwI7oOQSlOxEnsKTYtxaBmVZ8C+2gL4v8BGXp+qErsaOpmmUEPEGMdD0lUjfTfiGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212018; c=relaxed/simple;
	bh=ntWIhGPCv8YOpC68QvRSI1f4rEH8B2H01GQ2C0C/DsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrSlTpd9KsHffeW5z3e5zy/FCEdvM4WTLDVHmOkLdOd4kmqXZZO6N5Oyen9fhmfwaEdxCwpbqUcy4dNRVP+908XwqiyQK7fZQUcIaOL+hFX8H/53Iics+N2yJ1KfuYh3qBuJH6lLFGwjBhulPL60nw/rh8KxmTioCePbsmx++r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL5gMY6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zx0eix7y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL5gMY6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zx0eix7y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3ajT72692932
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5yvewQqBiTql/JhNjWI05fR7zGFNYByzwORgxWpSeM=; b=hL5gMY6D7NoAqVU1
	GotzTO1voT+Omdo7mIvv2/0GRlI9XY8d4CVyGb9vD7r3f+dmbJ8iqOp0ebrNIPVa
	4tJZJe0XFUJ3nYsPLAqyH9L4KmYuOIiJnYatHf8RDjvxlq+sdPij/j5/7hvnl3dG
	nuDTPZBBGbPa3yKlUXhRldg7N1c2drVjCTqutKtftr8ayRQs8hJ1KSI5PJrX/JaB
	qp0SXVNuUo4pqBLWHu7xfEa1gWXtDTJcOzef8PpXaP+f3zsf1bhkiy8d+WweGsy7
	6GedkunIA0HJ0zkZEkFe2XjrYN1nZmca12QBqQMqxyDE+xs/LRwlnxbPhWIR8AcN
	KaFljg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5jbr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:13:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5191462a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 21:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785212016; x=1785816816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5yvewQqBiTql/JhNjWI05fR7zGFNYByzwORgxWpSeM=;
        b=Zx0eix7y53Nr5d7YHkFAw2xjUxyEFxMFvxwkRTDYxu7QIkCiYVvFOqZfk+uhAAqdax
         4HbN+vH0/btWHj/mOzuVvKj5NBus50+MeuAHCcySrJ0HvgzvJoCSmJag6sy+qpqZwrQi
         VodsxW62wiippL16yI6GxtZI6pDLOftWjlot3qgZUo4p7z4GAiBa5mEBoWhac2Fx1vys
         F4ub3So/6FWXkqG8uL6og6GPCLyUhEEqs7UYC3HpSHVIxSUIYhpJe8yg+NVdrei9tnTW
         R1rzvI4UTjwKPzt8buRcAEZiKq7UTRSq1wyOp4qUp9P1an81kQYRb3C1GLUNCikMdNHh
         6UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785212016; x=1785816816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5yvewQqBiTql/JhNjWI05fR7zGFNYByzwORgxWpSeM=;
        b=IKoruRdqMTwQt9HI59sVon2IMRSBoBYblsftFOqJ5bXQKt3RX7T7qSk0VT9b7mZYRq
         11lP9Ebyiw8jj7hDlFd7rqOMYc7O236BF9UFb+5PicXLZ0Y4/XGByJN0MBxd9KOav4RG
         4iHG0a4SFCZumiJnEaz88aYW4lOm3weUYspKkqkmvMMJvD893Ge1WNs+dDzlTOp0SQ4h
         QISkRgyqSth0bj2kUPAnwxbU3RCTA6hIwZ3hyEgaxOjrnA5Y9nUafkwNogOuTlsGhX3K
         ahXsitndTRB+KVOEiPa/ecKIfopQ7257k0XtRxHgQw64E90UUxMeEZOig6B0qsBy/4Qp
         jiPg==
X-Forwarded-Encrypted: i=1; AHgh+RosWad4atWSBiYOu56z8vHGbrS+Q9zAUXHa3KEVl9BbK+5/f+V3d3naGHEUbUNeOf1E+5rkAfosj9sqVd3y@vger.kernel.org
X-Gm-Message-State: AOJu0YxqWswbHdjUtDFayvCte9d26UXq75mSicxQlK7tyakLR0ocmotn
	p8xGMgJHNBGMaYCoN9/zpYE8HxyV409yQWvxLgDHBXrWPBKhEHZWcoSrlQAFBY3mDzBorh1nsrQ
	IQ3Yrt0nykNqOHS8fr8KcoxhQy1DK0ODXMKW7lrTjpXZvMMzUy8XfDFZ9E6oZmEXcZPaP
X-Gm-Gg: AR+sD10SdYmgoSor/wxgOKPMsbZAUL4q9qT2x23a3m38tzKhHdyTWdGv5Vctm+dAvfS
	yrXwAlbbkk9sjDZeKLPd/jjB+dQgbEV2oOMFPBdYbJSOoAATP4y5DV7t8YnPo1E3hTfKPbj9ZCu
	JyenFzwMwhWUZbGERyUUGiF3MMNfNs/AmvAlH1Bvx0II8a+AfxfqS7ehFpxxo0C1/vb54xmWXvZ
	AsHB4+rYcOtduPRLZmbC2E4TDjohEmQy4NsvfaMVm6BMTzqvS6fzKCiP3NZurrZAfMcoJMzy3Cl
	vPfyOgHY9a/DCOT5dlh/y48YUSrWDJ/AReZ1b5HeKwbE97p1R+iMqOThLTwHN53q7uF3+6qotVQ
	e/dVBIXdGSSX+gvKnrFOHDhO7abG16LNzyw==
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr1156194637.13.1785212015753;
        Mon, 27 Jul 2026 21:13:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr1156167637.13.1785212015342;
        Mon, 27 Jul 2026 21:13:35 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e52f0c6f2sm32025750c88.11.2026.07.27.21.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 21:13:34 -0700 (PDT)
Message-ID: <8a6ff7a8-f547-4137-95bc-e4fae3f668da@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:43:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: iris: add support for multi_slice in iris
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
 <20260725-iris_multi_slice-v7-3-b4365c4930fe@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260725-iris_multi_slice-v7-3-b4365c4930fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzNSBTYWx0ZWRfX0ioAtIdMY4Nr
 ENdA3e/xdhVdw6RuqHT70qVuNxpmOTIYREVB7MX8Km2gnLfNM+9rNOplmBMPEkcCYBDVAIuR4jC
 soDVQvlQSMYEbfOUYdHX3qRm+zw1Cv0=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a682c70 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=grlzeUCm5dlgAkIZSioA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzNSBTYWx0ZWRfXwVDbxArfVGdq
 OeXqL7hQt3K477Cy867yLutPDnNOeFuxxR71WA7oAxsc3XSSN+AjIYKJznR/Ghq4uZyX5YvFGZA
 +wpAylgCsfYgLalf2SOzpd0t/wDhEDnTGFqZC/JeA0Y73rDDvEw7kRWeBypve5u8loS8g7WcNXm
 lbWBxsmQYPY/ccIIaVUSIQ5lGB6FecSbciKhBkpv2QbdzA2plaJPjCbKNotO5oEUk+RP0R+PMTg
 oRLc7AG16f+TTly4moStsXcHQgzQDo29Hq8iwsSZNvTeMx2xQBf/Qx/ER3zea80SIuHzxScj5aT
 vjuOpqMtfYWQ82gvRttD7ORhqlrjKjt/PsngO6aJVtO3GPhYOFwXfYCskbcCP5J1tDvPi9YbOMs
 dRdHAfTwCFHflzwkPFic1eub1Bk/4qaVrOBkfgT35/kn2ZRikGx2PJa+7biHL162KesCibKMAOR
 +ADT5Dn46zXu12Nmscg==
X-Proofpoint-ORIG-GUID: AnJzfsVU91-Rv_Qu5vVJlrNZd_u1Ae3I
X-Proofpoint-GUID: AnJzfsVU91-Rv_Qu5vVJlrNZd_u1Ae3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280035



On 7/25/2026 11:38 PM, Sachin Kumar Garg wrote:
> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
> 
> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
> control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
> 
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 86 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 45 ++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>   .../platform/qcom/iris/iris_platform_common.h      | 17 +++++
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  5 ++
>   6 files changed, 155 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
