Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001F4848AE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841410; cv=none; b=jpimRIOo2YvICzQhKdpM9Gl+t/BKu0/CM0VAWPoNyi9PlOfOOA7AFwUXr0RXSa1WuVOWMWI5xRkuLWb8D7KEtuQXV4h2sRT5qYmp9QUmQmZSdHJZ7l+f/3UdbWip/j6H1WLnfk4rea6pjF+VUYa+GHeSu9efRoYoCj3rXFl+Ur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841410; c=relaxed/simple;
	bh=v1D4ajydzyqYEMG5R+vTMdFB3iFKvVChNSVYqQUyMhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bb+tpBLEUocXamBREuX40agmzmSZq/gUyQaQFixEvwWLB3Ms9Yx1x3wy8lGfdA9R1gmaIQFwC3dqewR0dZZLYE+SzAd5OsgQ51Ir4EzaglwRzkmvCJKXHnfKNGUmrQUdLV47xu8wwWXn4AyM3V6j/t43nwhKm1UbfV3dh2Mphk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEnDPkWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itn9LCD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEnDPkWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itn9LCD4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfJw2176996
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 07:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55BoVja7JiXdBlZ+YWBAfLc8GBsMp64knOlHKQvzge8=; b=AEnDPkWtkJTJRUjw
	nNdGsvrlezoKKR8IEQXvEEsjaViue8/L1mSDUz4s3yhs0PM0zVcF/O2ewrZ7Ndwj
	sEBRz7D9E+T6zwAIYk7ZoaYDsaflCl0Bml2wEZE8n3VwlTZ/ZIZMuU4MqquyROui
	4QxO4A0+EU/D6blqv7bXHPHfyyr+j7v75CVSdBdTDt7eXaIfkTSXfuBRBzbrvR2a
	aqQ5+qok5ee+DUmeNA6pfpMJJpxTcA8rDq75/69CNYEGBsMwLMX2ylxCpb0WwOtb
	AC06X+pvTf4yU4Y9V4ZnAM0A4EH8PVsl1i37L/9Dc+l+jshLi069YcG/GdNVjhOc
	hVwBow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nrjer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:56:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so3652526d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790841407; x=1791446207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55BoVja7JiXdBlZ+YWBAfLc8GBsMp64knOlHKQvzge8=;
        b=itn9LCD4aoRphvMNzoeLmTFLcuHnq0K1RqQQ7acekOyC+T4iiBvwR229XcHdlTQgHj
         VZUj/+xHF48EAm8Pf0+ovA7vxMsT1YS4XxNaY7qx8CDXjNCM3frtHw7hh1iEFITQMXCz
         GWad+8xkfAHqBwLJcU58IwJxOVqXO8fZ54pTqv06Nh/uRO4W+S8tRN2cwN+4wh0Skf7K
         Atdg+LAzMnLv1fNMLTBqGrmCPF4EnUrcYtBH+YernfXU3mlrays8WllNnhd+63gcpeIp
         NjX/hdFyaa9ksqmeQfr34srgktOtpx8xA5CnPA8PJujeZiDCpyH9DSQJM9YQoKt0nNFb
         jecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841407; x=1791446207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55BoVja7JiXdBlZ+YWBAfLc8GBsMp64knOlHKQvzge8=;
        b=jvkBJgY7C/hcCuypX2BjliZUXTJABXg2U0iayGWIQs2vhhm6324TQ9Cy5qQlwvkuLn
         EMkCtNtvik5lb1aFpvrLTxLrAyMHi+kg+lNcDUwFqwSgLgXyrkY/Q5O3mFIEWyjDk2a3
         PpHKLaxidWJwTQu+lUBMDfvFs54P0Hc0FP+F0KIefSxol9jbQaqMcW36APTUgZu30kP+
         8nVi3gYQeyseaacjMlCNSV/U/3xZv6OvTjPG6MFDrfwOg591FbOCSGpQ4d0kAqP6GZS/
         mY2kJwo6x1KUGd6C5/dTJBLJd09TCyJ+OsVdAa4n6bzkRcKhgvKML5oDYHI0fcnEO2h7
         8VsA==
X-Forwarded-Encrypted: i=1; AKwUvByEMeeKdb3CO3/cfZOWcDBQE6+IwB5HueFLyhpnDQ0i0/vGzTNCaVquAX5kuiMd6jYV+r5QH6cv3b7/sS4J@vger.kernel.org
X-Gm-Message-State: AFuF++mFMzrIgWwjoriTQxio85o6o5Fdl51ogKnUwfbQv4G6Il47O6jR
	uxwj+MHHv8+i0InfjmxXVwhTYkZzgJTMtMRMOC/Bk01lBD+j8/ayL6CPKdaHZLNdSFqZsM9vgn8
	hnd0RgUSBxB0AsbGilSYNynyL9ofIQ8qKp61SBKyAusoPC5t/fki+/1ToC9votDTlz9Yi
X-Gm-Gg: AYBFou2yIkxKCzN0DaXUl4LJAuRnwMA6Rr/OLLK2DtaeMvagcKpv/nJgM6iuYRCU5pO
	5lMDkHJBn7nCQizf2Aq/QTVstlJz82JOfTO61e52TwnCLTJkzEgWQsCUxWkdXypnXkUM+sCweSK
	sC724PmqgyOL9XG7iydTX7pL/zr7GOQa2IlSwwPj8eaWMski6f31s2LSNEmsJKFAEm13a/JwGQz
	Avmv9TV6rpP9q06JLkLwQWvt/M6XbKni1zMYOWdD1Tgm+W55gEmrrQWyw1IuvqdKmtW3LIOjBz9
	MF9MSFAqL2ObPVSoCZWW4nU1KHUcdFA0P3wgbQoes+TPkB5WZfjmAorXJUTZJmwWzWntz5xAqRb
	tWFs4uHgSve5l1iHQcGOo6w==
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr657117785a.3.1790841406725;
        Thu, 01 Oct 2026 00:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr657114985a.3.1790841406140;
        Thu, 01 Oct 2026 00:56:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d866d9sm104499266b.54.2026.10.01.00.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:56:45 -0700 (PDT)
Message-ID: <15e32d18-1f58-4a0f-85b6-affac29a0a48@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: check pm_runtime_resume_and_get
 during resume
To: Roman Demidov <roman.demidov.nn@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
 <20260929142103.81854-2-roman.demidov.nn@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929142103.81854-2-roman.demidov.nn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe123f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HH5vDtPzAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8WuSQyhVeKmarUdqJEgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfXyznideAEJwQO
 q2DfgjuOEXPG7lMWOqEgxowUew6MBoaiSq1n7P/dVHy/ogXCh5LWpXBlmftAJSo8FuAVrKz5lU2
 UdFkgiDnddLhqWl8edywCNd4PgIN4EA=
X-Proofpoint-ORIG-GUID: 89tukqB-N4vc82sZfFmOnXn-UtNIPqzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfX6/gphygGMZ27
 EwL02DACDaFOAiVveLe9wV+gmjMVTvW0ipe/KH7ZNTeadMXAb0Xu/c7wOt6fmI/5/E74iJiLvWX
 M1vSxk2SR02OFKHfVnG5OThPPDZPJTCZQ0f7at/a2skc/11K9qAwmit4+kNEAWBSRCtnfVoxEE4
 mzJ6exxusCWEB69Ay9IBTZtYBr5zOUfqcnzmGnbQOdS6RbgHQSHvast6MOlTESMsfXOcKcyFVNT
 RAGNBb0uacLbxsifddYhCOmHLG3jI3p1b6mr5+47k0t1ySTEUVPQNulC7IpLSgTY65LoNk8/CYB
 Lnb8W/VhHhxsHLDJt5bjom7DWN/+ZfUK12JDOuvcAm4HpLmCpMHNInyIFYe9ALHnqOnY68LBXn3
 iFySRPU+PLhyfsER9KmW+NlQF5OG/vkzs+Vm74ffpwex8qdqeHhaTxdmnFtkq/om/trOAJD4lRC
 gK8R842pckxCnOW+ceQ==
X-Proofpoint-GUID: 89tukqB-N4vc82sZfFmOnXn-UtNIPqzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010031

On 9/29/26 4:20 PM, Roman Demidov wrote:
> The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume()
> are not checked, which can lead to hardware access on suspended devices
> and PM reference underflows.
> 
> Fix this by checking the return value of each pm_runtime_resume_and_get()
> call and properly unwinding the previously acquired resources on failure.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
