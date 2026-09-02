Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68841A517
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341246; cv=none; b=UamrTG8Lu90pEllkAQ6LVQEbvNzJOOpEpuVJFBZumTOqC5kg0I6bj+s7YT4zoBinWPL9E85ueijv5BhsXGFtHF1eg9Qgc0jCLmPqT0WIez9o29Rygb2zbQLqvZrq0nfTz2n/oPItotiHAdFNyOr4E4pkV3j5F8klRup2eP8IqPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341246; c=relaxed/simple;
	bh=4RrWg3YRAeHPQUzHKjgVo28GNnYT956K15imGLTP8yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLH9VTaBU/0JxAi/vmaSMu1U50IbnCoFeS8kKZPTRua/gGDCeM314KxpMIKY1az9Vsj10kcbwS/8c8XJf+rVbekflm+jGyx/jImcko7P3qEKzDUuB2HrFl7guxmEhiHLu05KwWMiUM8nH2Qy2QdmWOgutlUGOqsdG5Q8iKOdEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVF1nDol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0lSWEnC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVF1nDol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0lSWEnC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NVXG1839337
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 09:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNLzMLJZKI7OImu+XuzOnLBC17S6dnkYMkkwnpIHzgw=; b=CVF1nDol+hpZwsFS
	MOgvCBfb1EwOK0kpu/Z3JNm/mxhLAgh54XhaeCGkXwlxAj2rRKgmNudMadzRAUB6
	6VIahtjrGJKoReOrZVYXLEGFRr340+g4JsWIFwWZl2yCIersIw0MU7Bnw//mavuL
	OoTVWoM5YAztEdwdxd0tLDEnFQIeZ/iIuIuyGb3gMKKvSXd43IpYyfj5PZ2a24Vt
	PyLbKWBXkxzhRWd6YLdV0QtDLb/OhlYfmF0+BJplbFO+QH6WDUNfJ51h3pEwYY5U
	UyToNEgTyeLhWpkb0DJIjqLj5adDzsiqMKWdNWSDFmnc9pGRy0KLjsp4mSavnPiK
	41ffjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx19b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:27:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d70d8839f0so10420065ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788341239; x=1788946039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNLzMLJZKI7OImu+XuzOnLBC17S6dnkYMkkwnpIHzgw=;
        b=c0lSWEnClzg2XppVrp/7RBMKxPMYeYw6ZdOIWskOhVe8iyw9qJ2WjXstbDBXgARjrQ
         g54y8QP2fp10TXB459oa9w3EKlqSTVqoIT+qIWhUEEXpdmLkttSExe3p3XhzrGRcjb4n
         Ig4gEIZPtGvXKbcjjhM9IHYwmJnJpgl4CxyxylJwGlhKJYEtzVX1ktXu8SWOWqKHwWyD
         rJyoTiyYaJ2cW+QMWyAfgkkqwrgxpOCfDfrajV4AXg2TLL9rFmXl3VgSYCEQpWwZVE3w
         /cMbS50srO2deGojeHs9igKmKqi4lUMhJ1LupwkM0atSwwWT/EeH9Pbawoje/4onPKKt
         0dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341239; x=1788946039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNLzMLJZKI7OImu+XuzOnLBC17S6dnkYMkkwnpIHzgw=;
        b=G6lsbadRvcXK3GJVQb0gAnnqIwCliZq1Xh7JQHrJOiu8KSDUkaQZZGjry9bRauy8yT
         7oIWAbfa1zS2fKUaibnXurL6Lr+iU+XnlSmU4iiXF6QcbeB+U2+NuqRDQQRV1ybinRlN
         HGGlSWHEY+cRglyjJCqQKh524+r1nY83qMbFoc0L6SnQgFgmzAwJqJWIzaaQGR8cpBs4
         Q6Buss3m6cNGPvA+7tUE6Hy5bWFqDnNxz24qsMn9bQWr24aO4Hhio3yBTN5/9DFlKy2H
         zbT7oyXZU0P8KcXcVp61dToAzwQKti8Q22Z6AH61fmJ8wQirwHEq3xAEVpxltNnAp+C2
         8qJg==
X-Gm-Message-State: AFuF++nc7zBD3UAXvwAxkGA7Jw7iUgJR9NB2DGVAcx7I1jjoZrYE9HqK
	h/2l1jrqIxhUS03672mHozMLu4mqMDVmZbXL9nHMHRBVTQpzgzcBGnNtCpOefwHZxKpqcfbN81V
	xw/E1lJHHre+jybdwkzbCMLAs+f3URHpvvCR+EQLZw1267acFxekk6erZYAvXExF9LMJE
X-Gm-Gg: AYBFou1NmyboShfr75Z1m+QaMvoWuT1eEL+YPRno1OC0l+FBUwsuZ1Aus2QtW8VoLP+
	bgEhck4TZUAaSVKdoVghHtK69N1UIo1IZIWeIB+xD+SqCFgLDXu/lf11ggw8NvaXfPasUpcEjY/
	Sp4TQvzMn2bmSrz46UKDWqhJGxBjbpkrtUgA2NkFnGhRkFMwFys6iZRFNuIIC9gRjjxbQHQgHZD
	inA5YoZ8bXreqH7vvvIKxSnRiF77b4ALgFxOuOf8BAFNuzlIvV1Ww9ZG1LGBDz4BryXPv5yfL5G
	1IwUVpIUWwrc51dN5lTkBcP5O96bWE+ub4K/OpNBM2RyZgD+A5xYdF4UkuH8ihiUNcDybWPNzgz
	GfJB/eWY+30o0Zx5KFHIzHU5b+cMVW1U=
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr5659445a91.19.1788341239440;
        Wed, 02 Sep 2026 02:27:19 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr5659371a91.19.1788341239018;
        Wed, 02 Sep 2026 02:27:19 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e9eb4dasm8445304c88.2.2026.09.02.02.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:27:18 -0700 (PDT)
Message-ID: <54de34e2-cbe1-4464-b186-3ba242ffe3fd@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:57:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-1-6f16fa6924fa@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-1-6f16fa6924fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H_2iEIYIpPZN_j7QDEB5dvv9sNgvVqZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4MiBTYWx0ZWRfX/jbG4fwCXkoz
 WHGSiJ9m2IfiFcVRRepsiIqGEY/tudZ1TCfEdihYaQRkBME7W9s0IPCrSH+rLYSVC8wXdgM0n++
 UimJhxalx8nGznAGFZLsMEUN/NAAsCDbqvtflFL2aHb6SFWajmaiv7ZTysh1gqp5C/PC1TCnWfb
 nlKeMBrpH5h/wAHZvGfY3NimohX92i3vIXEs+7Gn/KURegeDEFUqIK0CA01ZGwYKuAZjIXC+LyM
 ltR36MC1BrxfqUx0Qu6IpvgzgmBaZM62ssK5zkUjDY+8lCmPb0QX+bVlf6ov32/KVX/OhA3+cVQ
 uMqe9LbyiTQa4Y4Ao5Njs4HeDrRU+7qYBQYtyblfomCvYBDJzLLPIOiGdDQwfW9UvOTHHwIguDb
 Roqddx+g/bKMrFC2o3KwO+s7ZR+9RYrvVp2YG7s8oFjCMqcxYA44jESHJhV3rKfIBRI0WdjUvma
 QWyRp3ycXiMj2CcC5iA==
X-Proofpoint-GUID: H_2iEIYIpPZN_j7QDEB5dvv9sNgvVqZ0
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97ebf8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3Mugy72lF2TQ84n-Z4MA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4MiBTYWx0ZWRfXzm//YU6pkzFE
 4yHE7oF2GMAxVBYG+0eN6petb60LpMOx+02Y/5v7T2P+ZESmpN2Am5pvF6t9GkyynfMLR7jGuma
 t4XVVYrpKam7MLxTecG4dYv46xQkHXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020082

> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
> index ecaf8db67d45..888611b801c8 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -106,6 +106,8 @@ union qcomtee_msg_arg {
>  #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>  
>  #define QCOMTEE_UEFI_SEC_UID            413
> +#define QCOMTEE_TPM_UID			489
There's discussion ongoing in QTEE side on keeping idl with uid 81 and
not a new idl(uid 489).

I'll update if needed in my next patch.

-- 
Regards
Kuldeep

