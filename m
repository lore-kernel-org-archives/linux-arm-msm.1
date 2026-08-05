Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FBA41B355
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926924; cv=none; b=TMwZhI/bddt12dhLBd8L9fX6Qq7OHhEkzxHKtLKtJ+87oS6e/bVE6shwnCvclq1MxHXqQ9QqrgkC/NGAG7Vwazr0hFh8c48ry8h6ZPXCYBYdyDyunyYQapo55excCVCXhe0cFciKCcBq2/Us9Y5NcY9m3+U3PJoDGG8xS49mClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926924; c=relaxed/simple;
	bh=Z2aAqLef8HplyIfZVACobk8zMAp0xkxlMNwAtZGCx7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mt69xRPPehNqVZCWk5LR5+zckLfrgi0uHsYnq7xhfkIu2uuBN/j+aqe4cS9eIfJI71kyehLgwoGJVnZPig92nI4Q4AZP/ZCiGmL+ShN9/z18s3pEzASp99X0aMJqKDi3j6WTGPnHaaOsqUvD2AKyPzsPac8wyw9c8t+aUFBfAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5anEhfY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFJzHzHJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5anEhfY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFJzHzHJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dEgB2912043
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m49sOBL190ZkFh39Qr0Wzr+p6tlR+XFwT05A9kQTmtc=; b=M5anEhfYh19AzDJ/
	iBOovxweJihsU7d9mgXmtZZJydEiNN18GZ2m1lsc0Z6OYPxsrFY5KlksC0nBSUUS
	tNVZIEpLZ4y8R2X9TfEBdUtGBlEF9TK2W0iAgwp5JPh8ARAiNEdvTrArqJ1eBYLe
	Z3LgispJfhnoMN0pJA4klxhCyr+5zzuppt60nwVg6xsq2caxPhowaGHF6NGw5tgQ
	licTFpg4D6z0jf05kuya483yyZ4XBoy17R2DHk6RRWRcTKqKHKg1sZbGy5xNjBCt
	4FZK6zVZx/9p27+ltC3+rT3iV6XebHCsuXv089U0lNXSkJUa0jNOqIqsY7g3Lgj4
	ucuh8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku349v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:48:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so1583032b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785926922; x=1786531722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m49sOBL190ZkFh39Qr0Wzr+p6tlR+XFwT05A9kQTmtc=;
        b=GFJzHzHJ40iY9lspc9Unk1qHfhFq8A5bVABw+BsD66VVHRRJbE2C+uOqTcrh5bZFro
         mbm8mz4QvR2LEtDtL/Q88hvCFDXBqNJFFCMOXoUjzX7BBJK9GEt6ocsyVINRrykfrNX/
         dxMiIWgXEagKzxZfTaDVT1zI/5fGAiqM+JNT3M7nD8YGThTkLoT7z1q6TUXHeSUL9XsU
         zJG4KV1od9oQdvMi0fEi1bzACW0z1kgk8xrECkh5b41JAwDbGidsefxUsx3NoYmVdcsJ
         qRbllsKlKwvxYOuu76z9M2AfLkp4qYDsijKmj7btV5F33OFpyR/OuTcvYuHAO6wW/A2a
         T3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926922; x=1786531722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m49sOBL190ZkFh39Qr0Wzr+p6tlR+XFwT05A9kQTmtc=;
        b=VFukMHCIxb8xd9k8Q7ZXtZBxew48mJda6OGpabweCRvlTN/RMWAunY/GxKea6uuVt3
         5q7Vd5Muc0R1nWKMQX1ICBxTPiGCXfJvYtE15N0+Kjw2Sv4Vezo+KI8Ug12FSuhKxrBu
         XFALv9tT5Wyc20FkfQEKCqpzpFXhjNXCUfXzZSu6iR40KRIGfDOECJUGiQgp9T406w9t
         aj/FlSFjrsFn9N2K549BMzsoERW0GpSmfZk3eZxHG2VUkwsY/Wz+Oxa7IbHzbvzoJLH9
         Jiucj9KZnykdALxBO5sso3V7Jgo/qGbBztyAk9ZeNinF7vqchixfTwwMxIKIWGS4/+2H
         HW5Q==
X-Gm-Message-State: AOJu0Yyu/aAkaVqWGHkLG8sy3Se/B9eBRQdglUeknb6l9u3c8c+ZDGBG
	NUSGA0UDzDm7z9h5eYK9FG5VcQzZDa15DWg58QkuNON9toDdqeSsEZOKIJtAewGkg/aKGqDtJgx
	mEZNgbDZc2exUBcLBvcbk631yJSsU4NTczTjAEl+sy0pVT0m1iMKxjb/4PZCtW6yBNmHX
X-Gm-Gg: AR+sD11/xTJjT2VH5J0M1fTftesjwbUuORThgS9OisilyF5NYgTLVNmIrk2gSYb09KS
	6uORH6+lOF8NNTNNpllGptWIhWUSbBu20xoH3DyV9CLoTmdxWN6n6PnjvPVKeP/oQL/B9kXoyEc
	tQ4yrodf1h1EIOHADSJxgEFuK9GRK+2Egftxj34E4JWKiQTIs41/gbq4Fpsjpb9sevrotJTvhbD
	O8iI8zhiHn/tlD/SAxGPH6q8yQBTCqvF54hfvnWBPXcUYN2F3YysJksa6HvyBowXTvDCs809K7+
	55C33JIUTV/r+sHGmswSdInzhRUo1i4KpIt0+LVVrxHeDNXde7GsTYZBUOtJ5bYNLBCGuUBFpvS
	R2pKRk7gkoKh3bFUibMHzSyCIqALYL8Nx
X-Received: by 2002:a05:6a00:1ca2:b0:847:8ccc:d7c6 with SMTP id d2e1a72fcca58-84f2e0278d5mr6203929b3a.31.1785926922146;
        Wed, 05 Aug 2026 03:48:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca2:b0:847:8ccc:d7c6 with SMTP id d2e1a72fcca58-84f2e0278d5mr6203859b3a.31.1785926921701;
        Wed, 05 Aug 2026 03:48:41 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e4d3926sm670057b3a.28.2026.08.05.03.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:48:41 -0700 (PDT)
Message-ID: <701d3c5b-ebbe-4baf-aba5-3aacc4ab291c@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:18:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as
 votable
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
 <20260801-kaanapali-gpu-voteable-v1-2-fe804d24d2e9@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-2-fe804d24d2e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C1gFCR27s648ygGmylsRgfg-EjI7neGR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX/cf1VNdOgebc
 pnlGpN//xQ1p7hE3jRATYj4yreu3mB7auSdG2KQH9oGUApZFAK2fjy7b0htnkP08NIX/u2Nm1lP
 BeXri7zGan4kdflVWOj2b/QmctYbdBA=
X-Proofpoint-ORIG-GUID: C1gFCR27s648ygGmylsRgfg-EjI7neGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX3HInJz/oL1wJ
 PrbUZb30mNTKoDRysajIs2STpWiZt1dI5oRKFUEyGVF5OLvH+Mm8RrwtCblZDJDKutpQlG/oAHS
 Mjtp4p8Qdl/LqgakScdsKQs6eG9elwsrB1TkYgDbIxkgwSKsxcOCYCjHWeSzvlbVLLoox0kODZ/
 fcBzA/rpRd/QgifBdcgde1i2JChTAQnc0nGpr5814gTOql4wHOw+bLDOpn6mG2YnDVY8tILQytR
 8Qqv5TSBDFDcQFHnEQvPBrb6rY6DTulk4StYMYrwlsUkclOplbFg5awRvJ04flnMqRDDLifs0xU
 +iPdKbMbADXWx+pnCWaY0/7MvhEpGB/3Ol8p4Lqg1LYV8q3ZIp3LyICuFYxWjjKQmaXkyIA1poP
 9cdcqSSv0FzBmdR+SCS0guAQ4smofmcL8YSvAB8G7CfbUW946qs1+UuFU0YIA9gsC4dxHlVnzpi
 nNIIugKz0iyXxTZ2lBw==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a73150a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vsO0QhTMOWSccifbtmgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050086



On 8/1/2026 11:01 PM, Taniya Das wrote:
> The GPU CX GDSC on Kaanapali is a votable power domain and hence
> should not be polled for power-off status during GDSC disable. Also,
> its power-on status should be read from the GDS hardware control
> register.
> 
> Accommodate this by removing POLL_CFG_GDSCR and adding the VOTABLE
> flag for the GPU CX GDSC, similar to other platforms (e.g. SM8750 and
> Milos).
> 
> Fixes: 685ec348339b ("clk: qcom: Add support for GPUCC and GXCLK for Kaanapali")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

