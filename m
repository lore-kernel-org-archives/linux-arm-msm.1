Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C51383C80
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701605; cv=none; b=YbD7iOSHNVzt0RJhGaXx2aw2j1CmUQTlp3XVMWjTmYFDyFSg/grM9ln2xV68BecJXwjU4kUolK5FY7cD0jP6IXpz2EHSk0JZSM6I2jYKGaF3zVLuI5waejcTaUMaI4ieAaqbOFU6DoeYdCB44ne9KNFOLV8CHvjyDaJ4y8VTOn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701605; c=relaxed/simple;
	bh=B14hrMZ1sDb9gGqrenBhxTzRDdupq+Tu7JIRdlnhaEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laGff8eMxqASx7P65EhIac/ZMPtN1cXEfbUA+Jpg4pMdPR+0e6y7EumP4TTbGoLuxLfegCnFc/W1tr6TGirhgTsPtNHC5YwbYk6LsfUVnWvy8d0qLVUYbWGo62uuPORCIgLkDrElGV/u+2nnUlCvFcj4bW2UJltoU0NPPeUdwMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3PGt7Qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcfZuUHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3PGt7Qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcfZuUHk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53uFx4055654
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1SkKvBAuLJm2jQktvSyzJDXU
	xtRqjv5cRcM89fYH3Z0=; b=K3PGt7QewVJzEWXkX9e6XCH7Gj/YMeNljWRwSAtb
	qwGWbB4O/UELpsX7QBHL/zTPsPiRJoIq+UquaUTr00jXKOz9nG+8WtUy7A/EwhwZ
	Dlbu4l+RMIZulvUYsLiB9eUk6iZJZ8rnU/Z35zGcNhR7R9h2ekkPjNSBAZBXvzQs
	jofkUniFt1Vz9CVKpGrZyQhVQfC2MEyc1l2xoFaGOU83FRZhYCuA/zDJJmm9XZC4
	dSmUpwoxJ5uJBPS4JFvX3mg4Rq7OztBHixGFsmkTkTy3BPP7YwS3lvdBk0BNK1Ns
	XSqQXV3/zS3JP06hcdflqg8lbpIIRzLgvezm4XZB6yHL4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgc1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:26:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso98907401cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701600; x=1785306400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1SkKvBAuLJm2jQktvSyzJDXUxtRqjv5cRcM89fYH3Z0=;
        b=TcfZuUHk7xkwTrf1vp6cbxZOk4Qvk87Hb0ulyVL8Z0TIsQpf0K4mI62TQkoL+wMVrG
         KJDEMVVRofro1Fr6qeyEHTXlFmPA3F5RiJxKZMmTVNNh7k/iuIB7eyM0sVnBsZI6TBN9
         MGxhz3FIUrlm9sjMw4AihpBqYdwCVGdvAlyDC9AQvXXO5C4GSbHb05AZWZAa4eIl8Luv
         HAeAa05IGh9+9xqC61n3LMqri9H6QhbHcqsyVGWk3/hDU4N9/2esYdyq9uRhX8hXlsDe
         N9wZomNv56gXkbXn43NClrcTuSaneZvvEZqYT1UQqFSuHG8GjYPNqJj8reRiiSmfvJSH
         hYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701600; x=1785306400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SkKvBAuLJm2jQktvSyzJDXUxtRqjv5cRcM89fYH3Z0=;
        b=sCXl5tSgI6IyWcKiXh7hCBZwk5QMSXAOtgp09ZW/Fc6bK+5D88Dkk+inMBJju6HvTH
         wy0abAbdKpP/GepvViKhEYZ+UlIs9vrD6+YnCBNVBq67kcPe1svfgXH7TxzyBvZfSV5e
         u3+pilYBFrGIazrbDI6/IQa/7E+bA3ipZB6/UW41zwG1PK3acBobNakAb4sIHvPb8Lwp
         hA3zgL6ySTb1udSKA4f/H/SYSXWnkFawmTVHQ9God7bmROsv9civyHaYHY6l/4oiGAJQ
         KH/O6krsyLHIYhhjp3i8mythYNaOzgrsD/FXyYwNmF5/jiVpB4CNA7q5IxuTP3vk5J18
         XT1g==
X-Forwarded-Encrypted: i=1; AHgh+RrZMnwKeCt7imXip1U3KXZA5wPuhx9yj/XCsJg6637I+IX9ggPVGTy4M5g3l0WiOzjvzFWUP9RjvR4kxHHL@vger.kernel.org
X-Gm-Message-State: AOJu0YzTtFvfKoqvQz5VOYeifJJVKH0eHSVtf/VO9a099lYyKGNeYvU9
	ru5YHGoD0H8m0yinb5jcTMH5ZVQfDb2TxYbI7Gdek/LX3qWWJJ8QhXFq8RuV6Uc1IIa9nNpd4QY
	wJNu+9ecKtj80L4HPqP/F3OUbBQXHMK4598rv/cR/Ebc2fF3B1hYHkbt5HpDFwSv7zh4G
X-Gm-Gg: AR+sD135vCp08mRfov8pBVwtpsEg5EmixRRoMM/8p7QEUhkV+hMZE9nkPza2tvDn1Xk
	Su7tL2bVc8/fdhof40ORgYmTxFzA/s7S7fTEqEXrck0CXRMdWNRFXWXkG2jT/HIYQwIbglkZjdd
	8jZUeoCXgrggT+pzBVw6xk1uxEPm63rd3ADLLDTw10GZdnsxAUxIUq8uaB+0pAcInKw6bmAg/VK
	Zt4MLDbcEM0B+g3Y5IfAhSGJM8dN1FyesyiDD18aZ1F/UABZt7hZjPJHzO+RMq6PFESdnRE9D1A
	Q5VxVcasHLDg25k1x1Y+/Cki2JzuWxouT+hKPwtmW9YAxTizGIDtd5K4KhIV42PEtQhKNUh4ZC2
	UhkGSikJBj9khSie0V6ikjnn534SmduGlac4L1ASQIX2N4KrHruz7WjBn/355FB1yJH9TWiTIRy
	QtakpY8lJ5LaYzQQ==
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-5213f274ab8mr207064361cf.79.1784701595757;
        Tue, 21 Jul 2026 23:26:35 -0700 (PDT)
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-5213f274ab8mr207064091cf.79.1784701594907;
        Tue, 21 Jul 2026 23:26:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm289421e87.83.2026.07.21.23.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:26:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:26:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Message-ID: <pm23untgo3zctvqtkm5kcchofp5fyaqctp4xsmroy5lk6e7ouw@weqlbm6gm73p>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-5-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris-code-improvement-v4-5-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1OCBTYWx0ZWRfX2txpzEjVfkSN
 clN8by67wn8s+hl6mCZeU0Y6bfd8DorTG9Vxxc5zRAGdUcgayzxkcDAat8lXNJ8psclDmUGj4o1
 goUEP93cpN7jbSiJLeiN/XMECpN7I5k9B5PrSEsoSZd2nCjD6GJ9SnADKoZnQ8qgkZbuGR0IOOr
 zUXjvB2o1EgDO9FhTx3lBDUgEGj90asXFy7lJAmoFqqVmy9mFCDwBo8zaMdofM8O0/Py5Wk9G8x
 MKf5Px677WvfuDTijB6Tluh8C/j17qUhEHhGiYm88MVb+p4lkDi+x5F2WLErqYdKtJyfyuhqHTI
 VhMxcYsWPxfhKs2LeUJmNYS3H1CAxgSkGwh3YEdWuIrmkIMPiuOo+t9tLHg2H9//fGwQj7paFB6
 nUc6WJ9Ra+gGFNs6ZMtLxwSmcwX59O7HWeOPL/1jyqZX2UFGiJXg3s17ZFuW28jV5AQxHEqHMuC
 yqn+I/BzIO4utlqnMAA==
X-Proofpoint-GUID: t28ou_oYF8OXo1XAm2M__cDi3l1yuoAt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1OCBTYWx0ZWRfXzp59UorztCpn
 U6CFuhB7GtIa6vkZ3yvCxzTB6RF3Y6zQ/afIr9EpjZETboGLxEcconwvbaeR8Rv8uNSpg6+ARn1
 cEogb5TzGf/XVob3fz3BnMCL0dFW9ck=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a6062a1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hVsuJ96k3IJYCa03ZK8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: t28ou_oYF8OXo1XAm2M__cDi3l1yuoAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220058

On Tue, Jul 21, 2026 at 07:50:38AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appears twice in the
> dispatch table. Since the property lookup stops at the first matching
> entry, the second instance is never reached.
> Remove the duplicate entry to eliminate the redundant entry from the
> dispatch table.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
