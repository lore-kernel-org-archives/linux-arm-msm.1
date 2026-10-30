Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389430;
	b=DEZnO1YNVMg+++1IwvEZv96DnOh8214h0hTj/VIvYlU/IMATy5IvTUZ57evaoaK430D9
	 TP/vG45RJjiJT+v7Gmx0RLC+8qCDbBoE6lioBfcavqf+Dlp0m9kXyxpWxmLHwfsmEHXS7
	 Xg4bAYwkfDznCFSiHKzRL+VHgDYEvLtbQ2TWBAORDkkARjgdomjCDMcPGutNIIZhhQUCO
	 8kJdowF755inAXqTREUnuSAAZz48s0yDgmKdXMaFpIab767hikLiv+xjhWRu5f4xfU9Ig
	 aTxaf+6+03m7qYgqNFCHvNjM/js49vTAtmbHtZuI40J/33Ya/SzGgiQinK4QoP1EV5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
	b=0H13/H8BCyiIF5kHB6/2+YznA/y/dyx1MJ0z4vBPikMs5mjMVeNkjOukL1ygvFyP/Owo
	 TzuTRMISv5sXcxLUMLUbZeOpYOuiHngeinO44piggBDb7AA4dNXp947xSIhLXxFry23d8
	 vLkbzlaeUJvMz9gHwe4Je4iqlAnEpownQ+yu9d0BUQtfM3jgrh87h6qeo45sisiC9Xzke
	 zG4InSY8CGjPaBQihQJRAeERmv+m9u2RTnWFA3k0/LEw6jA2wPnBi0XtnCaDx9EIYXUVJ
	 phhApzdmtcGaG0JfPTKFG32ZuulXV+VflwKB7dYdlDFU4ESRo4XQsHqZfM6sRsateNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mg/YKwDX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M2E0kHOB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BF606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 19:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg/YKwDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M2E0kHOB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIi0dk4119684
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=; b=mg/YKwDXjNT4sPSS
	zHJ/KjhTajfRCuh8o7XnjdPQKkn8VSnYjnIsnbyIEhg94zmXDIKiOPQJlUhTlE6K
	2JhR6X/Cbjws4VEztAiUqalx0ofpe/DOi9JcvImPuxNn2IO3nP6Hieu+c+OJGwWp
	PS7i2yXjr2YyK2VM27vAVwD62WF0pyNU+YfYk5fgyOH6Eke8mCha8F7yF+OHx2TB
	bDNO4IgKFiJv0cG2kfQES8MJs8kXeOfxaeiDG3qtoZ/U5I8+iB0BAx40hUEl06bt
	NdF8TYkbdzHL91dV2SH917+kOcWvaie72JboesjUDflH4Kc7SBlu9ozhsfGd+cJT
	GfmSzg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sb85me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 19:43:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so1328736c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793389422; x=1793994222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=M2E0kHOBkSMHoeHQ/WlkvKH1/iBF/W3OFjZuIJ1kRxcOZtt1ASn2MvvD1gAmO5PzkK
         jOeZyczIqsR2StDBVCrGv8ygl7Mch9Scr8B0OpJVXBp+DlY3SL5IiPhmTmiR58uL+hGB
         8HEDyorndpZlKArTjMc6JZLUWwdVoRBDzgzP2gL6Gr5zVsWEXAdraaSJBAk5Nm7ecqlZ
         JcdvEVkHNChah36yWY1dMiLdcPFYzqEk1CSzv0iyVhYoqCY1hIttzsozqMOdvFRlr6fK
         3ROIuHmLrSOjmcg/qJa+mICSrUGiqGD7HvXjm/RAuHa3nE3j3DjYjrqUyaemKVaZWbs7
         AC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389422; x=1793994222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=jZM5grtwOA5UCUhlFyO28k/nFzbOgNjyYa0jT3B8TIb25s67xpOJ0Uhrnm20ZcYlWP
         78eIhSoZqihMNrS/ZY7L6TjUxmkEuwrmGtS/qhqRhiNvAFi1Nw5/1BIls9fZ6k7vpmBI
         LXI/2OdHr4KnSQ4e7XEdaAJ3Qdj4sFamDSATGYpnEE0dZyk1+WJbhyPpHoEOGU+B8zkn
         N1UwK9a/xbI+TygvXQwG6RpNDCkTONlauQgHI8LzO+Duhc9So5+vQ6p5E/9JlO5pCtcf
         312RL6TU+2A2j8XelOkR14SqDdXJ3iGQOIQ6JYzcSZ+8bC5QEujq4BnpovmnnNSyEkRo
         athw==
X-Forwarded-Encrypted: i=1; AKwUvBxpq7S5/BqkkX0ps4cot7MS3YN2jMcrOsqCyq0gKjIqL1kQ7nu0WMf19uwNTkG1aVRfeequPLfVFOx4ZURK@vger.kernel.org
X-Gm-Message-State: AFq9FYJfN846vGJKXeLkonvhjQI8DBap5sKSC7gs5qldaONdzg9hjk0N
	mt599irX9NsvxLW1JvY9fM7+g+jkHJUSPD6qNJBTZhGXVx60kNNpRjxVJRuXGyIV29StPguoSM2
	DJ2K+IxvNUsozRm0Df1C5wtj/9Lz8CSLWYsyse1YlpsrW+8FZ2Sd/i0Vqk9thYV8WHbU+
X-Gm-Gg: AYBFou09qooV2xzpQBzIhnB61g4trD+Wu9iLVqObNfUMnHfiuB/ANZe8ttMLRYN9inu
	Tgxwgi9eLoNH2CU8o15ewr82IB4ZcjjKvixN2EA+TeBk/jCa+bxIneChscrP6i4RaUthF7brgCT
	x7mVg6DLXnBgHa6kzj7Uqlmkk4snJ5gdNpfdG8WtpZQPHnMeGJWd1EjnQQnYq30wqjmEyXmcS6S
	nyNLJf5mgm7atZGTAgbtG7fMJu1VnbuLAwptdWj1AteiHuUj6KQBiNQ+S2r31opv+UvEJPnVl8+
	MwHH0w4R7vzZyBS37JjL1Ix2U5bN5/cRheVsGEM/4zE8pcsupQzuhglsa4HkmFUpkXgXYWvHexl
	by6wDQfcBjbUNAmfZ+DvPT/XytIaheptQFwdkHwjOMpjo1Z4iE9eFluZIQCpkvHkqYaWXsB5zxj
	nrTEXMfdqUi5ts2+bBVBpHrJM=
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358386c88.23.1793389422501;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358362c88.23.1793389422005;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm10965340eec.26.2026.10.30.12.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:43:41 -0700 (PDT)
Message-ID: <0f57c001-4c0a-4b35-8864-d83ed51d0abe@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:43:40 -0600
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nqv1W-WQUv06SXkflv8A6Iv1YAnWATIl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX0isLVWKDEIWi
 9FsKVXGTKZunH3CkiqZV/sMFkjh00v1jSiP5aW52I81Ga9ikhuvfPJ3CMk6FvaHaUJ1uZ/Y5btC
 JGM1kks++iHzzOGLeKcqFmkc4fwb2Jw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX0v3YoqN3cujj
 wrWobwtX7tWpsO5p3movN8MvE+QQDLtjbXoIzm6ZolG2MTD4GfmAJuHBIvsCDiaIXndz+R140sg
 IZKx7fPLXYHsqDyhaXcLJzZyBiDSb4b75JLTfimjPAv7auuqMO93cHUD28iQeYpEU+CMZdbDPks
 cRNAIMZZAYDKGfHktjHbal3VgFzStEL5kVj37tjZGX654UV0wmj7D4gwuDbJg+La+y8tJ6Uz9uS
 4xlLZoNW8FrsHoMjx+GClnSUU2ji65IQQGcu00F1+oyjsIUqGEEUSgYddxIKlIxSIQCO04xHaZl
 n7DwWuoqqbA/Dj7Oj2593yUUdxuPhVnAUP7NieNxGfGS5IUom6sZMZpTHxvgXgPE4VMXd1W9tfh
 qXUdlgocCgCrPDj/CXTdiSRyKeceQkVTBiY+zA5r5naNDgZuXRidaqnggVIAz9vPhqxVf3wJTrk
 myhANXYKdQXRKDsvDaQ==
X-Authority-Analysis: v=2.4 cv=JNKuIMKb c=1 sm=1 tr=0 ts=6ae4f36f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lJNEF0nvcUjEJBKM1O0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: nqv1W-WQUv06SXkflv8A6Iv1YAnWATIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300078

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..75c0cf6010e1506fe661cfd110112bbb37465880 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */

You've been told multiple times (on v4 and v8) not to touch copyright, 
yet here we are on v9 and you continue to do so.

I'm stopping my review here. Between public and private versions this is 
the 15th version? The 20th? I've looked at the majority of them and I 
see you continue to make the same basic mistakes over and over. It does 
not appear to be worth my time to continue to point out the same basic 
issues version after version, and thus I think I've concluded there is 
no point in continuing with this series as is.

For the entire series: Nacked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

To proceed, I think someone else needs to take over ownership of this 
series and address the open comments.

