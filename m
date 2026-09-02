Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BD70830
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 04:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788322534; cv=none; b=BDDPYC1mS+0HSKIJ5oDdO2vVdSIRo/N39KFR3CDcmfQzeAbZQZ+RaxRZitLFKUhgJBR4bbVXUXBaY7Zu1dH8z0qzdhsYspJAE6F7eXeOpZCWZE0Em/nsraYAy0yDENgvVbunkzB6TLL7JN3r/kAA/nzELq+gts+xeAtM0a9zHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788322534; c=relaxed/simple;
	bh=l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPBQl+TgU0KlHxQ4uDWGNXOSuJhpVXJQ8VIKlWYlEnROf04dfiuCna0CMJfSEtu/3gB0RPTqsX5Rcz50j8RAGmA+Q2Qar+9r+T0J5+pJu9P8uSyqa8w64XmwunJGJtMwhzgvvul6If8a3RVstRI5NiP+JuU/THi6bnVP5KSp8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THN4Bsv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjtUDyeK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THN4Bsv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjtUDyeK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTGTH3750858
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 04:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=; b=THN4Bsv0J8gsx/yH
	GbdS5EW4kw0BSNhhd/FOJ7+SoqYtMdSWnNhmvCY4x6PpokQInuO7zO7RbD+nyOMC
	ZmE9ZU0jD+QtL2lRxJWRZLnSxvalmOG3ewnQxv6zFNwXIQaEduoJxGhpu4GmChaN
	688A6RfEbbh7ty3ZVYHDXyehew9oYizTCKnj21qsjAwXtyombUvJsLOQBN4wD+Vv
	8Du1b16qPIgiNhIQOqKyFQ+ZoydLzZVO8eYbIPCTttC8PaWXVe/U6AhUJOJCVgEB
	SqJ3fx/2AxrF7c61U2uukMGSl9qkYFt6LhJofqFYFTW11/JhwV36M/g4l1bZZfTb
	Z+9+1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w21wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 04:15:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396638f9a18so1094636a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788322531; x=1788927331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=;
        b=LjtUDyeK/E9gZlLI7ZC4bSeQLYWigickkDeGjK7fSgAR+Lg/dgoPCyT4u/8up8ol4P
         hpbpQVNcSLHfGrx/UEZNEm/Dc+E/w2It24Xu4iWKYBSm8Aa6nWqqm86Hb2jYaqc+Tzbd
         kPPeoRC1qBITRXiZL9h56JAu35LdDo2fcxK1/Ia4jX2I+sMNx4REYu9Iry0DuTKZQRhx
         AlU7FslwvxurHJxK6XR2iYlsOSULxGsdLvi/I30k4/aEyyfnyQjfHRHZSgUvQQBgrApy
         p22RNs7yDz5tw1yinYGK0FDNOWrLt19ICeA4l4sUXv4rBtsOw/L1xU+UjLCRDqMUWEnC
         VNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788322531; x=1788927331;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5OuSovWW2R5VEYb4S773mhEFSG2I+gBnh2xu07zQqo=;
        b=sF/Yr0kaIeqp2hZE9ObCRNceE2fnFBna5yyC/UTr5aTDPwGtLcqToqwTcB5iThr5jX
         kmy9D1e1hyPbu0nkASC9xZ4i+K7uzWdbQKmcP0iw+Rd/s1Eb8khfMue16DYjXAFAW0pV
         N5gAup+2I8RSvb+IAQ+qJ96rSl7kB1NCt2GTNNor3YpERfpMG1KK/fHf0Fe3LxGjgmaC
         vG6I+cLFvZe9MrRpgv9S2dWJT2yF0ipF3tWzUhmGj58yPYJfNYc0Dx5EXIFMzDeyP2nN
         Az4cGhORG6G4oawqPvbk6TF6iJsqbqX27fh63p/9CZHu+qXihqboWYmHpoeySAa+5bDw
         02lg==
X-Forwarded-Encrypted: i=1; AKwUvBxlTGgchqlupy97QB4xasYHZ2Cj1viA6soiguHnVAnOWNy5BrK6hkB5V3Mpkqj8NDq5ImWWpdctOn0Ux9k4@vger.kernel.org
X-Gm-Message-State: AFuF++mMvChsu1d13a7Qvx51iHG6ve5cFANf4HDvbzcNnFSuu7Gl3BIs
	9IF45cw8/HIfLDxs7jMZUJ2ZS966+gxl5Fb6FOkOA2Movoz92IHEHr/EbdNZTAcsJzTE6WPpXV5
	mYIfabSZnpZcrdF2Fm3ntjzpWI7k2fAH88n7sGCBe1ay5yuWM2s/MYs9gErIp0kCtFeo7
X-Gm-Gg: AYBFou0Q+E6mrs5p60V/AgIn77K2o0gwwlPMlsgT9UrhMgywwZJo81PZX+E0HK4bnG+
	/w+pmBkLedcJ83EsjVwszdFwxOr8iodBExNTRlZXbE7XJdSqds7TAetex7v2v9jPXfwJROEAYNJ
	v2wqf7Q+R9mhFDQgGusXURms4E98Q3at8jzfLqP9Y8PiaaSeowM2euYwy5ONJmdCXtF/Q4r2gDO
	99lip1v/DbWE5QV/TVlUzLPl2MibH+j+yltSIC7eXZOFAc/OdaBQ6ouz/mCXN8BnQzpwboPsCrt
	JKznqZCjx6k9SxiF7o7AvPjzeY/ifRNDZJjXNETVElDYbQoFD3OgR1FYXeBy1QMmF3nIJ93be2y
	ugUb9dAtrgCJkzVKrka4fqNxWdtctc6i2
X-Received: by 2002:a17:90a:da8f:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39aee156f4amr2902824a91.15.1788322531020;
        Tue, 01 Sep 2026 21:15:31 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39aee156f4amr2902754a91.15.1788322530535;
        Tue, 01 Sep 2026 21:15:30 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea2e175sm2422630c88.7.2026.09.01.21.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:15:29 -0700 (PDT)
Message-ID: <594345ef-4e64-4932-590f-02dfd6d96349@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 09:45:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
Content-Language: en-US
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
 <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
 <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EHbPKdhCynJ2wnUSgmjOL5dvKYKAh6dg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAzNCBTYWx0ZWRfX1jrmFlkaVgt2
 KNsKy6cvD7lk5gDD68ian8GGkHfsJAaJ45+8r+LYzsPbgm9kxFUrOtY63yyQU2E0coc/djoQsZD
 AtdsZ3CU8UO350SIToEnpmSJHxSCx9c=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97a2e4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=y2p0JO2t6SGPmjSrTqgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: EHbPKdhCynJ2wnUSgmjOL5dvKYKAh6dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAzNCBTYWx0ZWRfXyJz0WkI/aZhL
 3vsas9orqxFDEcrDPva5kDWDbKCxBTdwlf8OgoRuK0Y58kfFKrP+H3Thsj90yOgvsgvWEr7FAIx
 UmX7Gr7t8EANfI9+iUCXParBGKmb0uU1vg9A7F8c+UGmH5HsxcRwMPFUN4f0hUIxmWSlwmXlxkA
 g+oED4BjXZwwcORW+MKoHzi6avvnwkysm9ct2sL8oSxQ5OyRjsRwTSSN+KUqCSNSz2ZZ4Pg2cl7
 w06dTTrPaiZzeYxahdJAi90x2Pm6Jd2ioQqyCf/axrL9zyQBp4usG/4xY6Wdzyeanby1zXIa77s
 dyiqvDkPWNzJeocEK9JEOgm1y2ui/yM9t1ZbUpuEGScXDjAVZP2URquMvziew0KbOzIG0w2oWmD
 oB/+3eL019BtqbYmWkWgKFIKRhNxdJoNG5TTkvVwf+18nKcxR3dB4YJUF2EiZ9fYwKq56LKtk6b
 0Woc0014dXHLaQBsrGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020034


On 9/2/2026 9:32 AM, Renjiang Han wrote:
>
> On 9/1/2026 12:13 PM, Vishnu Reddy wrote:
>> Setting the firmware log level to 0x0000003f may cause hardware response
>> timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
>> be increased accordingly.
> Yes, but this patch is for fw log feature, response timeout value is
> performance issue.
> I think we'd better use another patch to fix it. What do you think of it?
>

It's better to include it in this patch, since this change can directly trigger
response timeouts when high FW log levels are enabled.

