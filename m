Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1031F9AC
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 04:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321746; cv=none; b=iNMnircfMvsFRyTHbPEgzVVmye5XBPzdT1J/VhCXtIgEfsOqKtTUHleOkAUxBOoFp5qGvK42fNVlX6zj91cxW+FQ3HghlUsTIUnlKYd89WaJqDq59sRm/FNMP0ql2BzqttgEeFRqNuCwbsBimqFFOJe4Q0eNTGYoIhxKYFvh5ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321746; c=relaxed/simple;
	bh=Hw1pCWbKjons5MyktJhlnowCAcV8eFfeJO77b1R7qgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yp/hdo8lFugKt1A3ph2UBz9OLNLHP0MViXoteH6pzcTPYq1g/3Ehd5gD1/uJkk0XSAU/51men6HxwA7nT/k44peB1sfO8Ich1FBrKOo3ZS6Ztdaj9F4wVhU0GWPO8KmyPMBa78z7+VJWyhssrdLfmqU7FjJcwlvBikydBThHfQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brKuIfk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSZpLgKO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brKuIfk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSZpLgKO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6822Z7n3172795
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 04:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=; b=brKuIfk2shRiR1vU
	1HoUrB30jg8r6qidhiP/raZCoOnApbVO6JIoNayQNtcNRihs158l+vNd4Y9wPPM7
	iyvtnB0gAJcxPqYA6T9b2WypdV2pWceF7yp+iwwflw5PUzYYJHd5CqWbk65g8VnR
	lR293hjd0EnHJ6ctb5y0GWpJFwilF6ngLkPflIO/XiTg3IEPjVBwBSrxtBTmu4kU
	r6uZUn/8ZGDItwY4Fw0Q5l7OvBgnxJ1RUWLRoxR3yTTp3sVR/1OXIg5P0Drnx8Cs
	wZWSkHXrjMEQoRMiU9X+i52cn4bemuC19oZ7VUNiwUXDEHVjuWBgN2HFTDn2JoTY
	f6etUg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb5608gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 04:02:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088202so567752a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788321743; x=1788926543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=;
        b=hSZpLgKO2x9gZJ2vHwBV6UzksIFOYV46M2CMvcI21Wyj9m5mo52Ht2dlp3D6jgC+pC
         zOV4VfWTnowRlrdOF0NIdpId+iT9iEKYm2tq9dbxsNY8rwYRuTjgR2gl6EptbbjfRGOy
         DxT07wzWnR0wZmaPDvbaVS5iSKhMmltg0LE0tBHV+NBZOGgGSjBtKDZ9fZpw9PxE52f9
         N6Nsg31ovfW1zSz5Cn3vgKN+eTGbCm4rY1vwP2NPMm6CYNpl24TuOb1BFzCkAnK9/j9z
         zkTTk+tUSpkRJ1CSF91BRUOf0z7NhaRSXVoE7eDPCCeupfqvsYyczZP8VuM/g9Q20c4t
         q7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321743; x=1788926543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=;
        b=ZlDFyTwkgqUzjI7dtYPl+OKInmQAyoNCiUP4ZvnowMlijt+aK8HpZ9w+C7HjJ1An0Y
         wVpxTCVHjBn3tuP5SkmMjhouE0rs27B2qwxkih8ixXvaeU6xScNFgLYOgfTBozIlburm
         WpQtaUYE4t8RFgGEd+ZKIV0vtlEjabrCZBfL3FQTjfTOQ4GCDZy18KfeIvwJRkaJwCBy
         9/rueXs1SDaZD/3tS5JfWXLqqcA+hBJ3sGY1tHmICZF14zpbQ0X2fTDtDfWYobfV8SUl
         tU0tynpVJMl1iIELxiUdgy+XMtShugkAQZnP+wChUS+IVhXnp2gfRK9fbl2I9QXT5IQq
         0J5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrrgHA58Y0vXZpG6/30KGt7mwYeueJCS9y0iwfWTV61PN96g4PvIhzlwAPAsWwsvJ3xTkn+u/nDGrEU9jR/@vger.kernel.org
X-Gm-Message-State: AFuF++kZ3S8uXj6W4ZpsAjFEkFaQc0sZllmGRy7eFg024Ymaw+YD2Z4g
	hrI8gAHdIsv04KwDovWRaWBOF/vaqv/zoDihVXik1Ubnk81mL+KGBn5Sqz9hrAI0ZaZofUl+mTs
	1OFK5bL4ivFe4PFhFlJ2GVcMjBFBlR9LrSnT0grDpJxadI6OoI4aXTuIrnNn+t/E5c8DJ
X-Gm-Gg: AR+sD13ougvbCBInkopS9h4+qzFTKTy0ViBUNjPo8nvwFB0jAF34GDsBoaNSldr+AaF
	CqxmGRgdaJl0xGZsGCQQUXkoKPvO/IpqfU723ukjosopPH1oag7nSH85MHbYD5bRuR6Y6pKPkGK
	XS9UbVF7Mwljk4txjYJD9a7CESwGQj0kfeftoAYXVO3sfUTmHcxG6qmzG+5EMhLondqqKZc03We
	0jh4oZch0sLE6z11j7WjvYxXrrHDgoT4LmF0J0VyGGh08DZ/dqShp34j+ynSryivWPkVma5H4DV
	fUi8ONAx7kLqeZnRpzKoRAR/6uzWmcC+fz8qdEdV7DdoQ42f8OyuaENeU0NEIyNqfLoVk7vrqXx
	wJVq0ELHkZLSZR2d1ZO+//wIvFaXnRAzhjHv05ca+r8/TK8UjM292wwMy+6V6elW/voiLa0E=
X-Received: by 2002:a05:6a21:4613:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d9b0922531mr3228185637.27.1788321743387;
        Tue, 01 Sep 2026 21:02:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:4613:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d9b0922531mr3227931637.27.1788321741477;
        Tue, 01 Sep 2026 21:02:21 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d03b5a8sm377772a12.26.2026.09.01.21.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:02:20 -0700 (PDT)
Message-ID: <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:02:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
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
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAzMyBTYWx0ZWRfX6Sjn1AV/GEAe
 +eA/dB+I0r4Hla5n7nYGuVn07ZaZlmV46bXJCdAWpTwkSaLD0oLHhgKozVnXG6HJHuczRXEG+CC
 +uaRiIO83By9XEToJ+Dc7Qf6o9ETAuoX7yVuxkYaR3b4bKy8Dz3PX8r3RhrWl++5H6bwAVp/f5j
 WVFBS5qVmeZ7/YsbuzLSNUOBLDqmZcI3YNd/KvJ0q1OvdJW7SGfqfsWywo+6lf2sYIBvZnxDqcI
 KyYLoO+/2Jr/LNoLUs9TI5hf4jGElTDxcmo8Ejf+vbIUizLTEAermk9XEVu61VxxdxSJaq4XqGC
 pUzs7c1yQe8EU+If7nFdPlCVVexrzs2bTHyP0MP2Dp/EGzh0RSx1u/HBb63aI3SY9yC6OOOgcEn
 u5Gze0j0MUfTI44yrg40M4z8QeQ2mDuZV1Loa+6FVvRw3OrtEmO5FZE6cpgm7SRtdfgXEgbblPw
 edhgcnsvva+tXIm5JFg==
X-Proofpoint-GUID: TIUjgeM-SVKCdz8oHRqo851Io3VheMod
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a979fd0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=SqRly4UM2iiU9c_N8OcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: TIUjgeM-SVKCdz8oHRqo851Io3VheMod
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAzMyBTYWx0ZWRfX2GhWRsOkTZTW
 FCIT0HzgY83v4GIud1NBFsDCqIduAoILaYyeHFohdOW7kiMiKub+O6PoxEFT9T4rSlaSr4Iu+ms
 fJw9quV7QkSBPayw9DMs+Gac3Y7YvOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020033


On 9/1/2026 12:13 PM, Vishnu Reddy wrote:
> Setting the firmware log level to 0x0000003f may cause hardware response
> timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
> be increased accordingly.
Yes, but this patch is for fw log feature, response timeout value is 
performance issue.
I think we'd better use another patch to fix it. What do you think of it?

-- 
Best regards,
Renjiang Han

