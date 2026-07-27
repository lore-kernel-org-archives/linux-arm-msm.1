Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925C377575
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162088; cv=none; b=DHHz56sDwzl/etWg8vONUj6GT3KR80nMVHDprKS8n3Of87tCJKuCghLMAMBME4Yb2unixXIijQwAo2xmuFlpKkEXK2m561tdr3bjkKcDG8+H6S2PoWnrvmdTAC2wNz5ananP5+Sg676stgR4j//4iob0+Wdnn5f0MhjtjdTMFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162088; c=relaxed/simple;
	bh=Nkd/PsFxoZAG5j0IfWZP87uyUdz6RJvzIekPjAz1gNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TB7S4bZt4ML6/fM5D4Gr+0pBGIurCKq0y3B2+nNCt0QvULKaj6W1FmGQ7ecFz233SHg3B7XsmKf+Nvk62Ceb5f6/yYJxSxV3XZN1Srbr1BuNi/jaXGlLnvZOrTuYC41flvgOx40FekPf+4APlahj6S9Dv+kpExyl+rP4RKOJHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkxM9W2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1BW0wDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkxM9W2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1BW0wDN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlbsj3895555
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wyyxi6qEfG2lpZGcEqKCVp/wYqYUgxjoyp778N46+xQ=; b=EkxM9W2KxjGpph1g
	Ch9gxWjv2zmSqOuwe2exh2NS3BPiM1e3GmtncHW0JzA7wB4Va1nm1nUpmeoJw54t
	eX6G2SavjLPdoNd9je8s8LxitPssXZdDd7rabkWAPB9fxPuk3FVkpeaGrwgr8oxC
	GjE9jvFyVl6cgFON5XMIErFQlTzNA191iaOCz4LKVEEL0JBxcMBf4tLPa+f8iMJh
	dF/QxbW6eI25oSuJ5qYj1T+9BNHxmwFRFRhAQdaR3an9vVREl84kM0cSJjQToWcq
	VE+sjU+rNhe9XPeDD3W9NbtEOjv8OgSkd0V7vCWQl9sko63riGt6pqytDTvIOk7H
	/Vkmnw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2yxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:21:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so31358271cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162085; x=1785766885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wyyxi6qEfG2lpZGcEqKCVp/wYqYUgxjoyp778N46+xQ=;
        b=G1BW0wDNqyIcTu7vp0P/Xc1EqcWxEBFvosphBBoO7A3AUpzk50/r0KDqf79bbcrWpI
         JQBOcV4Hb3zQ+gMiwmFg0WstuFHEAtwCbzV9PRzbITi9UNVeGMsuUVQI2Fi44U15AwvQ
         rOBii26dKhMOJVoHtC00myK1/Og9Mwy83x6ENK6cIGv7hQi05FDh5hTGoIpxeUycVhYW
         vw/925Ko0GsIaVVBf3Pf+0xAu5lFEOmko+h8Qagxpc8xz+jBqKiwB2hBNAF/JYuKDww6
         F/kmQ+CGSNcAO/AZxHORgt6YRH6OPZ73OglkbtWSh5sH3Xcs6rYr31MvEXiHh93HQZOL
         IDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162085; x=1785766885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wyyxi6qEfG2lpZGcEqKCVp/wYqYUgxjoyp778N46+xQ=;
        b=StouOt7US93WzS+3IOq7oxF9gmoGry0STjRvdsP6+lfMMCAflS90dhFdZGQKjYblMD
         Vvw6WfW/swdKCEIc0lH0sUld0FIqeAD7t3oTysh409JqWh539LnowIMAyJspqtD91gJD
         MrcW3cuDsBKADnMR5X6esEPt7kBTQNuKGpgswBa1nHL+6HZPBgQB2mV8bIE8MwiWZmhB
         Lc+iZc9FBLhIzlYs8Kc9F2yoixj7Hh92atb9safz2sYskekDru6Bw/mNSaVuGALF0ek5
         Sg4c2z2h0f3xOsidmiydw3olb+7aa74ZjtAe5HymTi9BF6iyf+TK884xi6rwNTSMr5pH
         uO3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/FxTqOn9lAW21P8V0aooB4V6vnWyhmuieGqb0ZeGSBrLkPXRzR5I+v0Y0mZfg7OeDEkAzccAucdxuilKN@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVZoKX3LLsA3YLs//1kVy15aX/FVUXWXvjJA/qkQpRFKLXjGP
	damM2qg8lNJB4f1hT+4PM07KeSx2hcGnLs3l6yAT0DqvIERLzby3sSkQQTAW/RwxPTZPtyCM1TD
	KUTt3pu6K9JdGEjAyAxj5INqCkF+8NR2AYXdQp0iTJW/8OlLsBb1j28DDjJnx1bMpiY6x
X-Gm-Gg: AR+sD13ZF5G90tHuNLz/6v4RSHO+wlbzYod6kyqNpzZbW4oSusfefDuA+e7GHz+XD0S
	K8iyOFzNuYxKia5p1powZo9NR967IlPkRuPivehpogl9QELbjeBM1LNt59V5wgOSDdR9nPGg6MX
	QlObrMaRMbURT/LkBpmATBrjMOi1OgDsRCGDIcZkY3w+Ko0Dc3HU/kWUwiXk+qQLwz5mX0f+OcU
	zLpqHjxZbvA23dH33/RoI1SMBQyviqIOBxk9qtIMe1U8v+dO2PPNrMs9lKnVFQMiSu1KFdU7Lau
	YHdBun9jGF/FOlwXHLLGV//0OkWMGNcsc622ul7nFZGe/0aCz2raRU262n2bdE0VOPfZL0UxA8B
	n/lAkBldGJ+izZUDO/MRgCaOjbJ7MQ4nOwfGinEu0k15dyQ==
X-Received: by 2002:a05:622a:98d:b0:51b:fe30:b8da with SMTP id d75a77b69052e-529ccb4999cmr11544831cf.33.1785162084849;
        Mon, 27 Jul 2026 07:21:24 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:51b:fe30:b8da with SMTP id d75a77b69052e-529ccb4999cmr11543041cf.33.1785162082787;
        Mon, 27 Jul 2026 07:21:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858cfdsm243867485e9.3.2026.07.27.07.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:21:21 -0700 (PDT)
Message-ID: <397db9ac-5c09-4208-975f-f2d9feb71317@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:21:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: qcom-spmi-adc-tm5: drop IIO_VAL_INT check in
 adc_tm5_get_temp
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20260724-adc-tm5-drop-iio-val-int-check-v1-1-0b85a0895dd7@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-adc-tm5-drop-iio-val-int-check-v1-1-0b85a0895dd7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXz3nnDCv1sgzV
 9ivo4/2mgkjCg/hSDSYdPrknH+t4K4Lyt54JiuIIWpPpHgFv77hDAcWNez67EeRCUQQKAAvheXE
 8/Ob3OzaUhn0tO7fr1X78NFXgfY4oAS17oC8gW77gdSSH1xeV8/MvBk3xgTgsUrcMQt+nrC2bVB
 ouL2ELEuIN5wYtbotsdNqrk4DNxF9xJletuGxdkocxFpQHfnJgo53AJ/loS9RBVuckKWxieZ3Nf
 /fAUekOoQqzptPjQV5Uei/RyX3lfWc73mbRX83JnyIh6+Yz1dZQSZofBgUo/IBAvP6IbBunGwKr
 uk5kB/m/Uo2oXtf5mBN2Z7fcnIYFSoW5Uq5CQQ2ub6EAczHeJKi47ZoIb/PrJh0XbNpwN+388wF
 v2dFKkMnjjZBOM1HAhZuyoDtfTYZq+5AHutFPa3kbESvuPr6BvazUVQVW4vKSrMg7hQrE3/qfkt
 Yb2H/jNrVSAsJ/gCmfw==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a676965 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pOZ9Tv2q1Ie1c7YLocUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: A-HlWRMIpIjFWMzyE0YtiHdsnJbHqDlc
X-Proofpoint-GUID: A-HlWRMIpIjFWMzyE0YtiHdsnJbHqDlc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX0ro2l3zKeoeg
 /jBcccgWVvBadvHLEqWABAjFSihWEaACbNFi74KQOkE3BOUB5c8QPCoAMVPpACfzEmPKJ4zUcve
 DnqFm7qbGWOyqcnXMUG4SL80FAzw/Ug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136

On 7/24/26 13:00, Rakesh Kota wrote:
> Commit bb21ee31f575 ("iio: Fix iio_multiply_value use in
> iio_read_channel_processed_scale") fixed the
> iio_read_channel_processed_scale to return 0 on success instead
> of IIO_VAL_INT (1). The existing check in adc_tm5_get_temp()
> treated a successful return as an error because it expected
> IIO_VAL_INT. Drop the redundant `ret != IIO_VAL_INT` condition
> and rely solely on the negative error check.
> 
> Fixes: bb21ee31f575 ("iio: Fix iio_multiply_value use in iio_read_channel_processed_scale")
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Applied, thanks
