Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F338435E1A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680938; cv=none; b=T6ZcFLpB0wfGXUKoFshlkxfe2fA6SJI2AplwOrBSwoI5ZLSjHsUOHy5VV8qSpMeS+hZF7wKYv3LXz7iqk4xWGGIVWDB3w23sR9pOaioXqyfyb69wo3mOIPcJOe9nTDFwyCtuexaL+YhQLrUGvkkDEwSRSoh4cA0VvHWw+30SVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680938; c=relaxed/simple;
	bh=fN9ona/wSMTxiWxLf21KESYvFeIGY1maRPkNdu/RO28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7y0PsvekxyhiwTL4YbA5rYb4M7VYbF/VKZO49GGx24o+J5kNd/6zI966OVtNw9yJ9Ca4EyPpyPOuqvJJb80b8iQrRXtzCyW9SHPhZsdP7EE0Wtb+7ZnLx0BXifBn26W9LfodkG2gVFMI8PVH55pB0LqhqoeZbPCK3YeNIpR61o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJulP1qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahH8sKn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJulP1qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahH8sKn3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZZfx3196660
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrfNeWHBi17EZfKI4U5mPbx4WL5IKPebc8hx9iiGVZs=; b=RJulP1qvqOa7fGi4
	z/FrRdBYtlpqFD1n4dHQKenTsF6cwv0WpDvskb8KKNL6jfXr9HZ7SudodOENRUvA
	JgiqfR0BR0wmDcj4F4CLvh8I/YalmR1yxwAyg994YjW1i9uqBqm+4kqSa/F3fczn
	BNYRh9j9HJgFnqYyPLwXP3jM3HdNhxt8QhZFGF45icL9KuTeRqyrG2GxBFttz+Or
	BA/2zLDO5iOQ0vZOeWNapeoJqwDtQffAhgPLZdmywJKXqxRxjjQnfkSPNyLBKMTt
	28hbNamn+EofgKcsVD+obqgO2+AdEYvHhQGGsPqOpO+E/6uyyJx7fqO+uH2We+9T
	OZn77Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863pp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:42:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so108088991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680935; x=1785285735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nrfNeWHBi17EZfKI4U5mPbx4WL5IKPebc8hx9iiGVZs=;
        b=ahH8sKn3Ba08fkl/vWBJloDD3bfeSO2aHoz8VUmgIC8QtI+WynLg8hG8ZhEVROC9Hr
         w7ByYS6FHlAtIU/QJcUPF9zDWbn3hDg1twAyo2fyosrOKWAQCTwuKu2STwc1UtfodCEJ
         +uT5VJvaTr64RQME5xUJMO2d8RORAezlwARJt1sQdiCULyQiAWm7t0/KqnR6Pw+nLjRV
         t6M3fy6fq9qwDaFWJbmvH87yBm9ASr2IeONqvxs4SDQ7bb0rbI5phyC+O5HaVvQ4R9Wu
         owQc5/g4YFH8wLYCLUeHlLW64AMgsnSB7ioK6J7WnVAVwPUFdxsj11N9huhMjLIL1nd/
         cSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680935; x=1785285735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nrfNeWHBi17EZfKI4U5mPbx4WL5IKPebc8hx9iiGVZs=;
        b=LFcrw8Wr4afoziivIwzsX33j9UqFJHLJEyohm9Wm9Wc5I1iAlM+cf6nWEHkF+yPom9
         sYdtGJKB1hSV9kYpbK78CRL1jcWs7VuzZ9ko99w1RMoJ3LP7N9zKjKG7xncA4v7d3sLx
         rH1Kc3Ozn6b5AkYZPsQxnw80+vfy5M+oU4dj3VgzLaR7sE1ceWCgkG9Q1YqwNcY/kp3O
         8j2KLOWmBD7u4SUAXkEZh2eK5X2bCWGAaCNXVX3ehPDWDXvFpRSdxUuk5/2JRSnCgaX0
         TOa4eja2v0rGNlKyL4+gJ5L3Q7ZiToXFOeqwhOAOEeV96VwpM5IJovTXgWjUWSnqCmUd
         w/dg==
X-Forwarded-Encrypted: i=1; AHgh+RpUswmFub6+90JPqnCJmqgCK3kmu8ubT4oe+OLldJx3esEArkJsU2z8BjLw+uQu5khO/PSQiuRBQGxBmbP/@vger.kernel.org
X-Gm-Message-State: AOJu0YySvwade0TGHg3SpTMbyx82mMMLNCeO3NAP4Np6lFqf5g0DMFdz
	1J+o9PlYO/dYdaOq62+9LdbfhbOZ5+VbxHnKXTnP/e6ArBpXA5cbSwdlsaGhTIZG11xRDtZ0zp+
	MjiHjrIj4xg10Dg61xo5DWBO85n46S8J/EZYUIZjxXmfASZNWbOhkwZ/6WiF0Iao7IT9J
X-Gm-Gg: AR+sD10KEB5vNnx5EYuMwlDsZOcJG5zsWbt2bhhAyjFOaPYPvgervxBKcl9WF8YNSap
	JBO5wTBreHDTU8LFsjTJHm8uRfgZv1CsvJSb9qKkfv0on7u/4mZQ+geyl9U5vS0+YK4pCNkU3ld
	D/pjXbXKdce/2eCq24/vYhyVJ4uetZKFeQIJKIZ2sTIYSCOIhMzT8wn2qj8tV7Kehejx7kWn8EY
	C6z8k4x2t70h6KaxFLNPtnMLI+fywaEunU1HjQoSB5/vPPD5zIYGJY95KlVa5P3bbLmddH3iXui
	C53xlukg7SGWVhf8mckGYWp9HB31r06yeBnh34BVmMJ2AznJfFLB2NkYakbVmEk3tFBfUF6dbo/
	xasz4SRcAhSVh2RSC4dnl/ZqlJDq99v19WctOcu/Qy3+ItAqBDAeEtKMWaL15ZhPirqpKMs8Zwp
	nFZzSJiK4h/o6tbQ==
X-Received: by 2002:a05:622a:1a85:b0:517:146d:2db5 with SMTP id d75a77b69052e-5213c10a295mr191824691cf.2.1784680934889;
        Tue, 21 Jul 2026 17:42:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:517:146d:2db5 with SMTP id d75a77b69052e-5213c10a295mr191824381cf.2.1784680934378;
        Tue, 21 Jul 2026 17:42:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d303d4sm183985e87.48.2026.07.21.17.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:42:11 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:42:08 +0300
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Message-ID: <bmwchmknzje3qobgu6raomw427pavv5j46vg6vtp5ns24cekij@2vvwn53nykzw>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-3-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-iris-code-improvement-v4-3-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX2Y+StzXSKsox
 zGnkTaaclwSWLkwGSv5Ooltf5GF4eB3OcYfPZ8myR0CRiwhNhEUnvHpOx2lALbPeA/f08cNs4D4
 o6/agOcNlfz6Uf6VamkdmfYhCQOmK/E=
X-Proofpoint-ORIG-GUID: tcW2yKoC_-v0oNS3EvJ-HOxR3-wNZgL5
X-Proofpoint-GUID: tcW2yKoC_-v0oNS3EvJ-HOxR3-wNZgL5
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a6011e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=8eBIOSJlEs-N-0KpAZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX5ywvBwABVUre
 WOBB8LcCwitWHPCZqoREiKA0Meeeqvwp1FO8n/snCvQ6in+/cVGBO9FeshymyarHPsksNDMe0sd
 Aylw9vAKTzXHOFhvLJc1FYFkOcwc780wOkmh3M1WgDLGlQHDVqSpuc+Xjf2d6uESuJPPc+ZPbIH
 afukLd2caNcgbW7fhkdkdqGDW6IAlDoU/OHbHvCDmj9DK8p1xuPtGPplzWht11L16Fr+Tz2p0K1
 +0ld2tXWNkWg0h4H2+MqkCoMdtHo9VNkCTgvd+RjDwP7HhVqikyuNJFQ12v5ImEERgHzq5oHUF/
 BNluHLHM+ZZXZodc5IUTuOofF3eWSOw4dZsbfmiS5y4FgR2iOEBHZ5w0dv/gx1W/cjOW5riMazS
 5sezleqC/AEU5yMuGYIVKEi1tQuRCpS1IfmYVhDqTI9DbVLNeh+IC5rxenDXpAGBmDFpFP8/Gc/
 +K0LYpgduzY5R3LQpJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220003

On Tue, Jul 21, 2026 at 07:50:36AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
> equality comparison. Since sub_state is a bitmask, this allows STOP to
> pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
> intended drain semantics. Fix this by using a proper bitmask test.
> 
> Fixes: d09100763bed ("media: iris: add support for drain sequence")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
