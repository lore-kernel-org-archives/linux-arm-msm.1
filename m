Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B805439F80
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146266; cv=none; b=icwG2qBLs2Mxu4KJzoTngsOWVBN4PvPIW8yAfLsuOz+Qpw0vhS1xuSg0bEs3kDXjTU/U7UVkzPatwxsBIE0K+L1pA9XzT8rIcGnBth3kaFi1YKsQ6cmf8QQsGzif5Q21Cw2mehcRUEzQLMFCev51F6FBAZ96Z8h64rjPhNvtR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146266; c=relaxed/simple;
	bh=1U/pS52KTORHRz1FVOPnZs1ybhsXTgMYLPt7vErK77c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTvT0YBoc6RiU6csSHkg+ldkV8Z0/9ZpTTnmL2e146kMiOxdZeVt0xBgeGfjNqbO/DQpsC3xicquUE733etbzvXtPJNPAk7GwTzNdErmkd3ejaupCfmtY7V/nYekD7XVWOZjq25i3QzZzlkGyfWY/Tksw7+9vbIvTl20L2M5h9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyvQHgIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWr/xwah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyvQHgIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWr/xwah"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iRvc1399305
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJBpzIH6PyyU7AP14G008RbJSG4rRil+b08CrfnGxpI=; b=gyvQHgIGJ9a/wWJG
	PJZkX2j3/laISwHXHTPHZ47PPHMKwdNJNANf71APjgDv/RfzrkNJH1NdN5htNHOT
	6epgO9shh8QFw0TjXd4/85zb7UHZhY3MLu/OkGD219aiRO7rAUIMLifhmhNG0dmW
	x4z97rxEtZAHRaxUE9aRhMROt0lyVmLfH/uYobP29rnZIyS10CrMd/o7OwDzuGpa
	+IP7zEGdq91p4jV+ktDQJbyDd39wxbyYh1g2M0S8Zmk8F/P9uNa8Yyc4NrbVTIux
	oVsYgcWNbk9zO8WXUIoaDyNhcKXU2yciaSIoWUQ2mNh479Rze8igHYVKdviwehUP
	i2iv/g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec417n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:50:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso794426eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146255; x=1790751055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJBpzIH6PyyU7AP14G008RbJSG4rRil+b08CrfnGxpI=;
        b=GWr/xwahhGLLISCRIvfRD9Ry8aOlxfWawpV8K2CQTm9gBEf8DwZiSH85goq4PXmncB
         1/wLSM8e88QHKB2c0eL9yqhlHCQTfYm+U4KHCVLjaH21e2neJIrYSHEGIj1MEGusU7e2
         XqFuVJx6Q98PHLD7GDCF9C8z8AuRcmLVjk7Neq2uUYL9/8PX3JVVaWsYQ2uYnSiVGSQX
         6a+HBQMYp+wjoPKy7fSlEqw0tKckUcfn9y5IKeKp7H2/ZFRERi3m+1e3Oym12dE9CvAH
         4uCURnQFJ8PMmh/R0dUB4wQ9t2zFSF4unCsvskkKypRG/SAkLkwJ6HT/C4LSM/Tw6m91
         +Rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146255; x=1790751055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJBpzIH6PyyU7AP14G008RbJSG4rRil+b08CrfnGxpI=;
        b=fi3rDMWsXUCD6PPDASApxUAZ0M4UTtXFmU+z4TNJ6PSBiQxXYNCmIcC2RmY4LDiZwh
         rHpH9JRkrVCQilvKIHMWlUmsJv/Ccp7s6TBEp1kWtDTL1oe/s9qQvzSiaW6v9Gm18xc5
         Zev6rm71RgWI5nEpBeKrTc650U5JGHGbIjiTDdZ9RmqYmZWS2+LzzNFNoKtEIhP+uWB3
         z/nFxmyDEc8b4lLCEoPfYM8757o8cscDsb9KPtrM+fmllyqt7Fu/5F8KMLKz3gd7qZWM
         f4dWizgOS9U1HMUARdVB9fY5drzAqYYUOuNtcN70D/SOfG3WVvFT10TH2FbkWm61Kokg
         wq1g==
X-Forwarded-Encrypted: i=1; AKwUvBy1zIkU2lQ4nYOcgPore5E2lxoXrk6SWZNAuQH3ic7rB57csBPxUjMxjLhlq2/Xb949V33PRg3yoONCGdA5@vger.kernel.org
X-Gm-Message-State: AFuF++m+xLhvGqmn5Ib0cmd907GrQOgRTJsykBPfseE8TXTBce3u7L6q
	0QmSnfjAoEM/kJKBJD0YHwExykPpnm+UFKFYI8OxNt3RWesODguToZ0s6g5uWJ5yZPuq1//52X3
	9CYVf9Lbb9Fh+GEpoqVgqM1MgQEQshqDghxJBA2tKXk2D/JPNh2brRVmaiWibdPhZUSNC
X-Gm-Gg: AYBFou3VWXAaAaJnEvw90xZntDkZToJDxwcre3QTBaSnMoHz52EFyKype3GZMae1K9i
	op7yTeIR9OfxWep1Ku/tRwg+xY2PYR4BxUbNDbulV0x3akQXclRhAEPQgNx6QsboDOFiwAAmMPC
	wQu2GeqtfJjSTblBva2ArcUtwTTiZ22Kk5ReS1oIO3FDCsDIkP4QQZZNa/hF+HDp4pQwLEb3Wpb
	KcjiY/iUwrgbpGA2f/pWl+HUy7DT6NUROpL9iZjnZMAxx3wU+RtRpQUC4PdIhtJIoQMBMqYQ8GG
	Kax+1nkKbTfBsWPggtzcYQCL2QFkGqFB+KkFLQBgu4YT+JAAGoZDRP+UcXslmODOw9SwnYkTEoX
	yk28QTFUQCpRdkgtaHl5ufAzY3wwRxVI=
X-Received: by 2002:a05:7301:730a:b0:333:f303:502 with SMTP id 5a478bee46e88-33e8dcc695dmr1526302eec.27.1790146254984;
        Tue, 22 Sep 2026 23:50:54 -0700 (PDT)
X-Received: by 2002:a05:7301:730a:b0:333:f303:502 with SMTP id 5a478bee46e88-33e8dcc695dmr1526275eec.27.1790146254421;
        Tue, 22 Sep 2026 23:50:54 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96848e18sm3603663eec.17.2026.09.22.23.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 23:50:54 -0700 (PDT)
Message-ID: <0157421d-986c-4a3e-a2e8-069a6869059a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:20:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPU4x encoder line buffer size for
 rotation
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_enc_line_size_fix-v1-1-f0ee5556bb0e@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_enc_line_size_fix-v1-1-f0ee5556bb0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX7uBiIBZQLhri
 6Yoy81BZSGeBRNQavhRr6K3t2FduIH/6U75KLtqJSLDBUUJhwM8Ppw96Z8fEAUA08VsepU8FIJN
 iccljE8DVFKzXdCCtTEenR7Juw98bNdpzLRBBl97z8L0KDGf0aaTT/QTxoWuYVI+2d5d5QiNJ/8
 WX72bKGFqkPQMswPhRoGJb7DnAQsEKwoBcEr1YnhDJUxeZ/yLZ7pVgy8n6b+diN15bsNWcxUDb2
 0et0CQhYyJiBin58ma99XrzfK/RTAVhbd9wkLqzsMOA97NdCYGLnu30FNlsIu8LsV2eLlZx67R/
 JVtA/dqoso9+JkLuppNtRf3NkA6el9qe8jZc29e7FsRGQY9LKljmqmQCjVS8IKshigZoGMyKrmw
 fkHwOipi4tDOqawxyruC35s381kDPbKlsmgEfuePoM7Pf0EKGMGeb7/H9wqsMqK9ruxngGveX0m
 nMorqlzHZTPKDDfSMXw==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab376cf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=61IncRaRvCNq-QmzfB8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 2tRon-igXTV3Z-u0mQ-0aJ3SJuzBWToI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX+j31D4fln3Ae
 qvUTOagL2PM3Rb8KGyqxcXuSqbeC1+BXfq9X/8yQtVrJmwgOUKkmX0RqdIC5F3+ArIUQyzzOmbu
 aBN6Xfradysh4tQ8V6NbNIaI1bnGqT0=
X-Proofpoint-ORIG-GUID: 2tRon-igXTV3Z-u0mQ-0aJ3SJuzBWToI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230027


On 9/22/2026 8:58 AM, Wangao Wang wrote:
> iris_vpu4x_enc_line_size was reading resolutions directly from
> inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
> account for the 90/270-degree rotation case.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

