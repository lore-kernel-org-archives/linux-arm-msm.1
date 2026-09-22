Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8B524B1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067414; cv=none; b=PSXEN1VwJY0vC6cHZmAcEU3O82OiJWYww92uDDYkE3N6eQzoUPylFM3tb3itH+05C5+jdAqvP7J8vkD8d5fIBR4C/5beo/9Z5ElcEpq01p0rYm3VeyuNQLR89hi1p8aMGY2KA1f+KXVCcw1wNBNO2QH+E4Gd1Hr/xvhgJH3cpPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067414; c=relaxed/simple;
	bh=xcSudL0df4MclDXMa3bDtxmiwJRhRONHmT+v4SEV0xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxoZ9WvlXkxBydwJ8ULnboED35Vac9a1s2syIKxGVrsczyJfOiAj8P/knfMomgu7VASspeohgtI/VAJFSXBSjwil5FtMBZtqhRMrIgCHJojp6kH5PxqV+PIjfEspmUcmo5WtlCkoda2sGcZz8+ydjn1FIIRIpVFLPX1CiK69eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBDitGLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiZFu73C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBDitGLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiZFu73C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M705rA1978710
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=; b=RBDitGLAD4Q1hDaU
	b+xslq1XVVCO+4/r9CoMfBBZe000lwYOkP+E0mD/sML14h9vuCrnSQkzV20qEvdx
	dZYwwjY4DhYoYsmP3XRkc8JUfkfPgdGcZi7mPMT4kMZpQW+NxNIA4IiXF8mkIWrh
	dgmlv5RN5B2dXNv/4VNDcHqKwm8P+ShZzSCX4+kraKkFEtSbC7N251XVTVRcn2c5
	/gxv0PMn3OWSsN5OLkdFt4wsu38a/3Lfv3/U9Rcz6M6baR6gfrmV0L55GsHryJWs
	BrwolA0P38Xdb0TYE1plyyLS8hQNPYyg+ddNHXcw8PWOHMQGG7WOTZ3zWrXjmWve
	UmnYRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0j00e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so22805485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067411; x=1790672211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=;
        b=aiZFu73C3uRVtBBXdH+vChcU1ZAymJixF1hJi8uq3RY1LeSS6mTcuztocfre5k1401
         vuF8KP4r5Vx6n6FwPgNhD9IqFp3kqTZQrT7IWf7hNZaYL5u6EyqbjBVfc7M5HyyYZE7g
         CbNmdmoJ0e3VDGrFpiLEKlAsA34Go0V4Ljn3aicwfvsmGIF0CW0pKBVOpRjZX/P156mK
         iox1QxJ+Dn6P7NqIW9wq23X6Ec9fn2dRcKnz7mO6/ftEafRdyKwzuBoWEAb/9ZDVNP3S
         ujwrJOrfJ6gHBMsj5tsnMDINFHlwvw3KxSM96YRB8A4ReCYvfrlwGBRyhUwXe2rqNqTx
         m+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067411; x=1790672211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=;
        b=NZKrFn5iJuvKyKN1YBOBSY8k7JQFBF0+CpgQlxpSpCNl5+NfDADMiOmDiiklZrsTqJ
         hXnbaef0i2HQfQqOowZg/wHaxq2llz8O+q81BoOZZ83k+KThN4dVZCi0VPKaSKTpSB4B
         oAUDodCmVi33SFpKHXrQkPfcUtg7ElVJTeKuCnT4LpHdMZoAKNKrTV/ojN7TUbLEqiWk
         1q8WIK9JQp/ff8w5Ac5yt/fzgKJDLAvBtkilLZ8ZHe+N0FC7GWTf7oIQ7l317FBK0WmW
         zRA+XrZHCJ3NKsGZQj62CZgeOEe4rcljHZKEh4ViUM4XFBtr2PP7E1DCiSy5NTd97+me
         M7xw==
X-Forwarded-Encrypted: i=1; AKwUvBxWHE7jGl2EqBydPlYZmfVr/DuunKnvDKgdihjgGgk9NJ3fcZHMQ1kMjE76ERHHuDtkrDQDXwfr9GWh49Kd@vger.kernel.org
X-Gm-Message-State: AFuF++ns+F4jjX2GdC1FxcsFSmRxhOhonAHGsQKQfmM9947GD6ehpH72
	gBikhr4L8H3y0E6yZgm11QbSFAm6qs29jn1ORNiVdf1fxm/NMLgICMYILV3rkI/RWjrjA73dOB9
	anxYIIZAEF+TZYTaPwbGzsyxfyNX1w6MkOsDIUaviVU/qXuXinqmGLDqys0u7TeeZgMXa
X-Gm-Gg: AYBFou1G8Kh/8Y0pjJK1Q2tstdUDOJP3kjOf7cQWw/F0pnE96L5R2WB+3lZVmEhYFqZ
	zqd9SYAqbGpgDPQsqgts5k2Bhk2ant56QdOfpGHVR/3vcPczyF9CrlQAOMPiQ7xkf0WCbNnBWyE
	C+UzNjml45/BWKkIFaMwlBi3ZdPJxCDxddhEkkhFsWJ4N2iuqJmVZOrQDajwInbwkMfkF1yfj37
	Y9MPd2SmM4fMZ6qupR37c66a3y82lBEi3WQ9KvPm3sh3ruQksy840d9Ljd0cthYtQwStD/leuGU
	wP9fN9TzzSGS7hYSBb+yjrCMAAwgYRa4ZYjOFPE8W+3XcudAX9whdj5JA8/4rs8As5LU0RkBYls
	MhT56PzVEFcr3Lxid1bmI8w==
X-Received: by 2002:a05:620a:6484:b0:939:e9a3:3105 with SMTP id af79cd13be357-93c15f63685mr458253585a.6.1790067411544;
        Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6484:b0:939:e9a3:3105 with SMTP id af79cd13be357-93c15f63685mr458250685a.6.1790067411114;
        Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f32esm51695466b.15.2026.09.22.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 01:56:50 -0700 (PDT)
Message-ID: <cb89ad25-00f3-4dd3-930b-c4423ffb4656@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:56:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PMcu5TaeCqVP36qdmlWy_Z6BGbo89jWf
X-Proofpoint-GUID: PMcu5TaeCqVP36qdmlWy_Z6BGbo89jWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOCBTYWx0ZWRfX2zF9zVX21s7t
 1HWtbtUpV6HUD3SD2hFyZh2bdataVJL0idrsLdsq73ovo7YT4aZDaur5FIRHsgc9nR2uWtx2JYp
 XgWjPii6Xr/YfVc1sDgtcDw/NM5YGdEVBauzIQgc7Au7XqTnWikGczfvSRlv0ugUczcrAHLfglw
 bhrDhknCVnUiNryG0yRYAKNhxpJL09vf2WlV2RkuXeBLnk1+evEjrhNAZgsU2nFpQi2egltGZKA
 JifPyOPrZyQk80LqIYRSFnYGxgdE6gMoN+v/nv2vndDtKE/rvgLig96mmOa5qzR41J7YUTNXfAI
 fimf09QpW+4yspNYnb/pZDCXTSYOoj36SgsJYGJWU0/RNUmKlbRNJDHhjla9dnRR1Y3UevWQ9P2
 zdPwCRuBwzCSQcUYQFyZ929ZPn5h3jmw3CIxCoZQbrzp/wACieg3H2ffoOzKSkn1vgS7kYCLCRn
 zuJOuc7WQfMF+uQaNpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOCBTYWx0ZWRfX5dnNUqiUHBZ+
 I+AyktCNPohw08GKy9LiLd60RLgEot5XQQUfmY9sm+mo0/+XbEUfHcDdoKcr72fhUVxhg3anmHt
 YO7B4TE5QMHqwsCTw4qIBW1EbtwtyWk=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab242d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kVwqO6oyCToStzI6_vUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220128

On 9/22/26 5:24 AM, Wangao Wang wrote:
> size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
> called with width and height swapped, miscalculating VPSS line buffer
> size for non-square resolutions.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
