Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679353EB0F0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497895; cv=none; b=Bweo2GfXpbQ/dz9zsdzzrXFvkLDH22mStkjMhE+FoxhBvZStJg0OCtRHLaugCiqnOTvJA92vrUCKSeGMVwfKHW6qW8A7UcQT2OCYXevldK7yi6o6EnSidAYmcd7rWQeYB8iGX97M/VQKyaq9zaySwPBW2m0g/mtUW4gjhdSx2gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497895; c=relaxed/simple;
	bh=vV2SkM0yNJjd731dpBt8g2sTf775LbK3wbwLSPbDh/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGvHzXrw85a6x/fYypqm0RZKEIn9ETBwYSLOzyfwgf4kUo9EKQHOXxtv+TglliyCPDb5j0+aHrVSnwWFku7JmMgKLk6x5NxhW2COol+qsh325MeCNw7HvjP3GdJQh8ZXzhz3qFlIVgK4XEEJbQn61RHZI5GMBUlcADoExyMECw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+qmdY0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5j27Gid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+qmdY0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5j27Gid"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBMeTN3856949
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV79Lg7diCi5lX/hgaJG1o94pxC1WlFKHg1QeOlGtrc=; b=S+qmdY0yYBo3aTnR
	syEnKXb89wqsWwXTqctsIQwqiWybT+fzS93WyvksXRG82GFGl+WSpkU3QVknDELL
	UyQzANkUHHzt+0nms9DzOewIt+V5W7Kf7SxfTMGV/IhwbRa0NicGfsKgxNOzrLbL
	RbOROJJD1WFaR1QdJqdQPd3qvjBrY4BkZBddgvBo9M03+xyvwlsEXYNUPMeY29HO
	yGhjcM1U6o+isOz8rOv0JkF7CAubSmlMPij53dxGtCz/Ybf6wIecXhjiBkOFBGiN
	XEWkd2rYAHjgnzuZtQ2BBWyNAEw6GnAJ3I8RJbw+/1H6qWnbaAGKVbGZBlUxSCYV
	K6KXdg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtms838g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:38:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9058a836724so2126496d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785497822; x=1786102622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SV79Lg7diCi5lX/hgaJG1o94pxC1WlFKHg1QeOlGtrc=;
        b=X5j27Gid1T4fo5yeSd7Q7iwD8idKDnMX0keGwvdXy3aPFQc+2+vaHawuBgYMw+H97K
         gxMncf/PYebESNhHRwb9TdTcjvDRuFEg1FPPl5kBWPLMBtK8VLQW2vGevRUvb5pxa75p
         A3c3+v+zUrYg12KCny0D0T+hli1B2ZK1FBhzXtnnW1PAlKR7iCJU/bNlfSyzr/nI+yl/
         NQmllpI6vdsbNjf4N5Yu3rtda7Ig538b3qTi6xdIpJ16VQp8B1AxDMmrlJTnQ06WYatJ
         yHYJmu3qP/smsaSiUoyKf1rDvdWOJrtF6Mi9jJkewgYGCMMPWwsAx00KTOFzYyLe4cxF
         9O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497822; x=1786102622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SV79Lg7diCi5lX/hgaJG1o94pxC1WlFKHg1QeOlGtrc=;
        b=DDIxnomh+78ASvm3f/WJT0tJg+5kWUrYpuHTgPaFri6rR97LhNYgtmWU5KzuK0VGJM
         sJ3c0T31xa3sJ/Ukq51BK/mAZpRbbRT7KEYOIgHyKYLy7WfedeHNuP87CkDcIZaZanmj
         yxoE9cbw7ct30vznMt6Et5/kSqz5iefwSh3gWdBNqFd5c2rKjxyoh2vnxRFrEeOeU/rN
         02nbO9j1JzwQcM+GLMXD16Y+HuGR3MnhfEvd7XFsClYCeG81P7YEyFWinPaSYmeCXGU4
         W2D3z64jwvTLenHP2nT3JShqYwgIR6nVJa3k4W+1OQp+CAWOtXV22pPcvsurvCo5AxQ/
         dD8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJTOPRg2uuIljAOsbqdUyXHyAFER3dZIBktXFiGR/mywzTEl8JFDW342XtrEBChcxgiEUoYrCgGY1RA49p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9aYLwUE9z8olkboMC7UrzVNutx7jEPWsIWMNEvLBtdZ+z+zHi
	RsCFrv9sh6+665fV9ciXXKKjmgzbsnTpDdG+eDfPyFG/j0NfbiByyhrwY+UhW1P6rs3R4U0jlav
	+vlhixflTqwy3c56fiqaW8NpmEy/ZhiGVGWQa4IYCWSeeMZRtLyX1Flp+2fzrQIhC6wUf
X-Gm-Gg: AR+sD10IWmU6F8Tirw3ycGGETbpv8xvXnLDvRPk9LkugQu8nAu133U/A0rLvSmPWw5u
	jbbBgc2MUXGrUGohxG8Zoh3IWkPR9+mpu7aYVv6xvoqnGHLJaVoYaCFtYelZHAttYnaEW4/4fc2
	VlZH9gGskWPjTxC6PBE3dOwmhKSi95/iB93QoZir7X6s40X/dc7m0sPmgCxMd4JE+79vHzASde7
	44Ll8sLPr/NVhHMIoexSoBdWG/guo7vldcH4T+WXZbXp0Q7pdx9tPDB2YnERP84+LGwzcVXd6Kw
	9bPZ1NDeZpCtgv5+zoOAdCG01FTXnX9cQw2ejPqCnFKFwMtK73fZsfcB6P9kQ/idx1BwE26YnYi
	qb+J5yFaZU4JKNdFWl8YwAX9X
X-Received: by 2002:a05:620a:2684:b0:92b:55d5:ba3 with SMTP id af79cd13be357-934963bf85cmr199626385a.0.1785497821906;
        Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:92b:55d5:ba3 with SMTP id af79cd13be357-934963bf85cmr199622985a.0.1785497821095;
        Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c93a87sm125439266b.18.2026.07.31.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:37:00 -0700 (PDT)
Message-ID: <234116c1-5e19-4365-9b3b-0dd1ce64d972@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: iris: fail firmware boot on invalid
 uc_region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-1-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-1-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DU2r_7GuNxBiwW0j0_6ySpRDyfpFo_J_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX0436hV/y+ee/
 oKPRlWKhLHQziaw5jJuTneGmuoNTImvqaey97G5V2iB5sbi7EX9qg9qI9MSdec/1pCyPF6sNbnl
 A0ITFX2lkpJFrPganLMXND91T/iQ06oJvAmM1A38wq7QzpVZm6T3gYSgTHWVSY8fxBgnU0dTKbk
 UDxZRp/ovTgZ8piSdx7bClnCGCpkP4AHn3I+3FFb2KC/+n7BxCqH9Bg+DQQdnQdPDShIwI363yn
 9ab5pPQ04w6nrSOrhMYMr2ecuAvrIH/o6gVGruYaKaAK2NoRlR4lkuiWqE5BkwFRgrmoAoQua12
 8MUcr4LCv6wqJmQqhXDvGaavODYSmmfWZH58ktXuiQsMw3u+4bZl20iUzHd+ZVyoRY14qMd3wYg
 QXgQMOd66SWCZLj0IyLZHZ/+DHaNxlYcUZ4zMDyihhNErXOAvTqBn5NZynoEakSSVMyFY9BXLvN
 ANHsJSl0oMvkwSW2oEw==
X-Authority-Analysis: v=2.4 cv=SuigLvO0 c=1 sm=1 tr=0 ts=6a6c8924 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=M_9emyDH5AVLG-PN9cMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: DU2r_7GuNxBiwW0j0_6ySpRDyfpFo_J_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX31pKpivfqcLG
 mQL7eCC0yvFi2Kh4f+8aYsayTL4H7xWiYJi/SlMxLxI/v9oVZtU66wABPyFxOBdDnymZBzmoNBg
 dR6gM2lj93IsC3BBWlvdcgWhy2NYhhc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310088

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_vpu_boot_firmware() polls CTRL_STATUS while the firmware boots. When
> the hardware reports an invalid uc_region setting, the poll loop breaks
> early with count still below max_tries. The following timeout check
> (count >= max_tries) is therefore false, so the function skips the error
> return and falls through to return 0, reporting a successful boot. The
> caller then enables host interrupts and proceeds to use firmware that
> never came up, which can lead to unhandled timeouts or hardware hangs.
> 
> Return an error directly from the uc_region error path instead of breaking
> out of the loop and reporting success.
> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
