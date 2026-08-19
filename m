Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B921CC5A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144852; cv=none; b=jqAwbBgd7JjEOmPvVNN1lvWNv7UtXjHLByEqcxRyvK6o7y123PP27BsRsgBYX2z83ZHExu9cH/Xdqas1jgPTZhtZ6F8U0nQ5rTwRX91dTx28DLkxwqSxQO7h0D1TeimiPzhIyT46TPeK38nJVrGxVt24DgKmnypAqFWOJ9/ZT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144852; c=relaxed/simple;
	bh=fZgPT6qgh9FtEcr0c6VPD8qAa3eL0s4CIS1mIi66B+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyPnLWsJARAnyr22+cESXClGKqnA3QXZapTNJjYmel+F05YjwstFwuZLHS4gJKhtPQ0vpCj3lNFcIlUwL4fxsYTeBMouJCSyGP3gEXSX2ogxS1um3SxQUvk0aGcii/rNC5xKqt5AxXPJ7+GdjOgfxuycdo/tVw2M9wjyXe+kQow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SI/aUdwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYO5WUDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SI/aUdwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYO5WUDr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0OQQ3334211
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX4WGw6rLTIthN+chKhI7bgUMumRGQoo44hxxKPoEaM=; b=SI/aUdwdjqaRKIux
	F3VFAbwCi9l4QHDHuhIhJOKQc2tkiIvMqOf1H7c2ZK9ZhsSOacGRdziYU7VE5rpg
	htYYd6Y8q/VdcOjhhT3sRQXIB/wHmtOdeVFQUMauf+fOYLvIBjacZjUcoYB6iV+9
	sWkGzO1ZE7RJhR21HZw5Xr3WcPzgQMcHS9qW4I+OL8U3M8UYiGsntjGmhXmPpD0u
	0YJUC9kCfKvnYIK0ITsO6gQW2maWSSBqix9eEcOs16nnxhtv6YgLJ9lpLYphEnj8
	Rtwf1WXwjCV70wJWkfMU3BxN8GzsuusszY4AokZTSGv/a+946fuGt65ZB96H/9u7
	s+objA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbbtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:07:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c38fb5d952so31891e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144847; x=1787749647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX4WGw6rLTIthN+chKhI7bgUMumRGQoo44hxxKPoEaM=;
        b=RYO5WUDrcbS85vEn7ocuroSnhksZVaLnUh8T0wp8SF4ILHPtC7KF5FP8l+zbTWPdrx
         2YM1vgEjB+q3A43qJdnjCrPOXS7SSX3XO0ztVGTJj3uWIbMF4wKu/lwPVVMJKMKBHU0+
         Iv8ERpfjElDwn1TORXS506gDoCfD2LqZ6JjoXsSS0C4X/Gv4Y4PY0ReaRlhH3kNLsW7t
         tGCKMfGx2D+Dgeqf7etq6IIGe6vxztWk1RKHHbBI7dAwck8vTZtPWgi5S5yEw0bq4ldW
         +rsyqiJOGvynS+Y1kaqERo63NvdE36FqQaZkoyj4DOqPrGeEuZnfgNThobrQRntHOQR7
         HjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144847; x=1787749647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX4WGw6rLTIthN+chKhI7bgUMumRGQoo44hxxKPoEaM=;
        b=Zt1jkwyWk41Oyq6IyPz9snL7erfQZVzqD502am5kWWitWR0NvZUkD81ytvq4QktZen
         MIHbGLH6Cm3pMhkmVCjO1RaSBYGxgJ5SMpNUKJIhg0KTbafKboU6/NJUMOUvhjrCV5K3
         HRwwxm90k6ZaKQ7T+ndKDxZuzAjRhmR9STQAIGtOKiK7VAnPYWKugH2UMkhscbw0I6wJ
         qmfGn2l00c6jTpwv+VUFhdCnreo4OuPlpI09ihYnEUk7MAIyfH+gf+cgwFQzG+wxAafq
         ZBByu+jdyVaGjzOYnMGpq8fAYAP3nim44/MzyaP0dnDDX0SogihBD8purzpMnfmJe6D+
         twsA==
X-Forwarded-Encrypted: i=1; AHgh+Ron2FEdFLWEbQEQWVj+B/Fi3xoDf28spY4AK3giq6BLaa1gF4MBlwis9/8OQhuSDSU4AyRSzzwnGr+rBVMa@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHNVBmkdOBHJnQ0BjcvCcxIUxpGYzx3eERMpDVHc83e5SjPJ5
	NEPiROmU5Tjj0Ym/RmmfWiucNghkRct8DYkWUI+cwC5kCacUq2T32fUZit2UX5A8xQ2yycObzYH
	d0lbHjnkNGPtUh/7fRKGmRJSEygluqrdegR1M9TOzBcNmfLJCaKu/b1Thkmk4kCoPxIRs
X-Gm-Gg: AR+sD114EM3ThU3WYl/NwmJpyxZDPLrLRHx6Ln/uWfiWUQ997IL49Ov4CXcU2HRvBSi
	qKKkVoc8Uqqysvjc3AS/XvRXDchowma2gWES1w8SAHWQRX5ygRVfiHaHHFm8bpa4r93t9YlN2hU
	x5PWDYMtgMgHGpIl02eopOEiGImhbYUxNwtbQ9dJG71gKFJYBSddTyDapY5Qp3qqZX4Ttd7OKJ4
	Aqq4bEzUlJdvXD5fDGCX49kc958X0iPATyqb7VtiifTcSFvTGnIBOETNUdp41KvSqf9+UZMpT02
	Ineo8x46qBcQ+VNcJLqd0BQ6FmtnxXaCgI4paQq7wyKRkoW6GayZlwS4Y8Ma/lpNNR9jPFKa02q
	5P9FppGy5rnXYaqu4Jcomy2hD
X-Received: by 2002:a05:6102:8616:10b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-7781bcde03amr230541137.0.1787144847442;
        Wed, 19 Aug 2026 06:07:27 -0700 (PDT)
X-Received: by 2002:a05:6102:8616:10b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-7781bcde03amr230534137.0.1787144847064;
        Wed, 19 Aug 2026 06:07:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm795349a12.29.2026.08.19.06.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:07:25 -0700 (PDT)
Message-ID: <7bcb2c72-73a7-4b5e-89da-c7ef43ddb5e9@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <20260717132218.27007-1-oleksiionchul@gmail.com>
 <20260810115847.253474-1-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810115847.253474-1-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85aa90 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=1m60O56Lj7va4YZgAfEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMiBTYWx0ZWRfX5SYPPzVcFvJf
 sfGIbMuHQNOQYYsd/srglb9IEnl4jN5LUsszqLKP+ZoxVKr0HrN4XdPwa1TTpwHDK647ArobOOS
 9EePN3G5gIoJ1nvY7cPtZ9QeFPYhgHSuShbx6LG8c4COrPvrOE09uMIeeMrq1efEGlOu19+8Hez
 vr0HiidZQ36qSsanEzwNhxqS9SAkwwW0xgv52U/0opMjvlLG8pf1IMO9llCBRrxreEcsmQndDKm
 yt2WyAH63LeCDHSxK/bJLXtYe8yeCPTw8GYBhrTR0DzkwbeNcXtogw7H83MijqLDMBsg3G8gN81
 6dfV/6KcDTPM6WPbaVZTdXcxAuvcpR4edoTeYwNk/duFIgXIQrngKgMSE45GoaQwE4bWxTtuLaH
 BIjzO6ijF+dA50BkYIe0R0lW5B7ebD0j9dOItBRXoI9+siby3oNnSUxizJZBLRko+kDFw4MHj0m
 aUllo+wanWA9A10DACQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMiBTYWx0ZWRfX0GNT68lpbNix
 fgS6dny9rbPUH9Y+dArZjce1vhCOUyGsO/PVsYBkEHF4/Q4ngLX1b0RGFdBO1JIlSWy91DjtduY
 Zimgv5j9yfZ7gsZUyQpprQHXpwbZ+Gc=
X-Proofpoint-GUID: r5Y3vLgexwzDtVqvzjj0SomNIqySVPo-
X-Proofpoint-ORIG-GUID: r5Y3vLgexwzDtVqvzjj0SomNIqySVPo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190102

On 8/10/26 1:58 PM, Oleksii Onchul wrote:
> Hi,
> 
> Friendly ping on this series.
> 
> Is there anything else that needs to be changed?

Non-urgent patches can only be merged roughly when kernel.org shows
that the latest kernel is between rc1 and rc5. Then, rc6-rc8 are left
for bugfixes, so you just have to wait 

Konrad
