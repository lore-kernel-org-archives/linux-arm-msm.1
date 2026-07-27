Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33D53EDAD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144775; cv=none; b=M97M/p/Ulu+sTuLMHY5cz4BGcwEQBeABEmRyNyzFcDfCy1yPDqbG4NZhROyZhNzSjW5bG72p3DUNF84pQuxuSQpw+Mvm+YQ5pZ3tItP/kUb8MqmkKV/dy2Teqb7K4TOp9RdLa6mTAGhfRKy2hG6XpKLIbyMlHb5MKyARq0hn6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144775; c=relaxed/simple;
	bh=DxHPu+ZBHuJjPeP+qoukOuz+EhfgJx6UBbxE4jwWWDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ie7BmA4jfE3UTCWT+x0aIteTaZTQDyDvBXqBVtA9ChaDyX32eRdYl6f1MZoaSETIYNasTvlFG8FrHvUETkyOhhNfCiqnuvbikG/7aVZWn/skMSfEi9OTlynwshufVi2t7R8wr3SdsAX7BGetuFwZ0PctkJI1HfEz2xqAMSNRnMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlmxyI9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWArCu54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlmxyI9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWArCu54"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8g2Jk3198239
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xLQF47v71L2X6bUQ/Qtzf63FcuNgYEt7iBIsu4p1MJQ=; b=PlmxyI9gEbmDO+ig
	MD3M5E3Cph4yIdTI1cPudLGNLcp5pyWRWG9Sg4yXG0XpC/6lHOBgy7ZJEeP++EoG
	HPGq6801wT6WKMvENDe8jiKY4B5f+P2vo8usegz+Z2IX9QGvfhEEe+APwER/HmEA
	WaYIkbjimDnSqDRct/rJEclhxPF08oiRn+Kg3jkchMI9YtFT5BSp5usabUOllBJD
	jeDZcFf3VJSlCtCYW6d4zveS7vOYdlABB9F13mjgMUIqr68EWdK9JpQuHohSLDDQ
	AlSU8qbov7GJdh32NtqirnFRlwhPrwBL1y4Lu0ZZi03FLZJuTSTHEVWHkJVqmVT7
	FJ9dhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs1w88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:32:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e667368f0so4191126a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785144769; x=1785749569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLQF47v71L2X6bUQ/Qtzf63FcuNgYEt7iBIsu4p1MJQ=;
        b=AWArCu54zPGrfAe33UWBks0rt/eBD7JovfMDdXQbcB9XIK1DiAbIaW7pDXpS4O1IM+
         JmHYSXxWDthH0BWxowPT7l97Ob+Ve3/KCOxBo4UBgx4QqaWkAR0PhXZs0g15DHHpcuho
         DUVrROWMkUPXQM0GwDggUMotJY42pOJeGNYbaMdDm4ldLIENbVGWS/0R+kF/3Vj6JP/a
         9ll1sOhWXFFnY+QEoILySnF3OX3QX4fW+7Ec3f5ko8lfYlCAytxcYTrvcFmQCq9JGAZA
         dBaHS2zzzaRV/2OdOBfjnsTgWy84QypkUvvZlj4VYvZMdNgBZffp9vpBUhvoI+gGMfx+
         sJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144769; x=1785749569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLQF47v71L2X6bUQ/Qtzf63FcuNgYEt7iBIsu4p1MJQ=;
        b=jYPjH5tVyGNjOTyMxWwflYeq0BVyT0M1aMeq6KDRwEtdyvsJXV3ULTALTkrAjtLXdH
         YUZmH1CqMvXxC+/VQE5MZYAYahvSgbo2s2prTVU9f4uKD5AbNhF/33MBGwhRM7FZiAo0
         xebpdm9oOd73YB2w1Cb4TfL8an7OyBysV4mdwi6BpCeILj3ORhI9RTYqnvmGMBBAddi5
         fkvMThTtBf3zZ7zCpOjv3vXnm6qidq8FGbY0vMsZci6fV6s4MpCJxEHRMDtdY4fRS1Md
         8srCkgWrgUCYkqfAKmGQOYQljtcLGjjGpLfCk5vk7nacASiL6vr01RSHTva72OoypOnC
         0AgA==
X-Forwarded-Encrypted: i=1; AHgh+RofOGwrqsQCPBOGRIJDby7+35I5c+5hhvuCWasriIMBBn6r05HasObpD45ZO3Ry+vl8l8kUOSW5AXB06tK6@vger.kernel.org
X-Gm-Message-State: AOJu0YzKT7PQUh0e8vi0OyUxU1R/POo8HYrn4JroYyHHUixDSdmy+rjd
	sBBnX2gsMWm7jZFcmwVwOCfwXIAAAR5uqXGWETJ/GKgc9TjmwxeOjlST+RFqyVZe5c7gimbH2eJ
	man/Mgx+f1ZSCUFET76rMjb7PM9/7B9hDfA74PyVFCgLXNENCeYGhCmkbelK4wKufhffB
X-Gm-Gg: AR+sD12Xkx55jN7WJG4BoJQAjHj050cPpfKZHjzZzB39bXY0mEPgENM+ozpaZGs2cit
	uoLKHFBDFifKnH2xAPJ0DYoV9Fy8quiezX7tgd+QbR66Sj+XmzamorkJApM/sC4NMkXd/wUq4FP
	hPR9VfiJ1OiOZVy0ecvGcJ6ZHLvTWpFq7TOnHfhcS3sAXYCH3cqKd4gMJ0yUmLWPOsWaB9jw9Jo
	A3ngi/tXQSx0tlNtkP9aFNTKCJx9oTzXIS6+W4qayOVX34uEt87vWksknijLTuGYHCvk1TFFHqH
	+D5K3CphAyAf35Pe2vSUijnVmcgSLCttj7BNMz9rbMyp0QigF03yy4qfC0zxS5YO3T+4JDMO8dQ
	7SYQpy79DJf1IWdjIfeRMhylDfO1pfg==
X-Received: by 2002:a17:90b:6cc:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38f293cffffmr7671845a91.6.1785144768781;
        Mon, 27 Jul 2026 02:32:48 -0700 (PDT)
X-Received: by 2002:a17:90b:6cc:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38f293cffffmr7671823a91.6.1785144768359;
        Mon, 27 Jul 2026 02:32:48 -0700 (PDT)
Received: from [10.204.78.209] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm4681901a91.5.2026.07.27.02.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:32:47 -0700 (PDT)
Message-ID: <05b9fd90-26af-45b0-b72e-a9dab680c8ad@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:02:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add missing <linux/bitfield.h> include
To: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, broonie@kernel.org,
        stable@kernel.org
References: <20260727050238.323039-1-ekansh.gupta@oss.qualcomm.com>
 <f5976c95-e59a-47ec-9d92-f3119a4f3e8c@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f5976c95-e59a-47ec-9d92-f3119a4f3e8c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfXwDU0us+6yim3
 /f9VNgpQ7mBol0EIq7lKVhKvKbFonIVmv36swEh70gbcVC0lU88fctScDen1BzbiXNP252eCFDu
 O1isRqXIAv/qLVdhuMwsVjbTkibTfmwnTt9sqF4z++dGFNMzEvbx0D8BXSl6N72LxLLyPL3Jd/Y
 jeoGcCWur0YP3WDTsifkNJjfTWEYFyVNe2y6cXpWEufMubrm/lwNbD2sKMF5p5sEoCZoplK5AYt
 0AgQWjrQTyMoJWBjUPAMNW0BtSGtxOdDxoT3o1lN4d3osWzdNhuOMBD8JBpuOfpOCx5ASQPeY4Y
 4ZZWl38TPsDGwXMLL/oVgiHcRBbB/CXpJcfmxC0qiigKVLLFoL940TfolrDidOK1fFS484Szw7H
 p9H6ingOAS4LMxw0MAhoLlQwniF0JINayKyjpqFDV+6O5LCEIsviG1ElHWLHVYilRr9CmSH8kr4
 NwvOZPLA32nShPEmifg==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a6725c1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=qNABUOcEAAAA:8 a=EUspDBNiAAAA:8 a=LC2F-ezy9jLIYNaHqUgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Ytm653ucTKQjCvbzLygB:22
X-Proofpoint-ORIG-GUID: IC0ifgoYg9FIQ-TTqSdAeTM3AKuC5p7s
X-Proofpoint-GUID: IC0ifgoYg9FIQ-TTqSdAeTM3AKuC5p7s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfX8b/Eu8lA9iLq
 Ljtb8Aed1hLpvP6vqm4hHf+Uu/yYkpZM+vYKJQxUJiaetoDcKWNc6NgNLuRW6HGIowdnMdBTolf
 IanhpIR6RsntzNuacX0QKokFq1xGHqc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270093

On 27-07-2026 14:58, Srinivas Kandagatla wrote:
> 
> 
> On 7/27/26 6:02 AM, Ekansh Gupta wrote:
>> Commit 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with
>> GENMASK") introduced uses of FIELD_GET() and FIELD_PREP() but omitted
>> the header that defines them.  This causes build failures on x86_64
>> allmodconfig:
>>
>>   drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_GET'
>>   drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_PREP'
>>
>> The missing declaration also causes a secondary -Wformat error because
>> the compiler treats the implicit FIELD_GET() as returning int, which
>> mismatches the %llx format specifier used in the dev_dbg() call.
>>
>> Fix by adding #include <linux/bitfield.h>.
>>
>> Fixes: 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with GENMASK")
>> Cc: stable@kernel.org
> 
> Was this reported by some test bot ? if yes, please add Reported by and
> Closes tag.
> 
I received a mail from Mark[1] for this failure when he was trying to
apply it on linux-next. Don't see any report link there hence didn't add
any tags for that.

[1] https://lore.kernel.org/all/amaNYEchEvJAcnQT@sirena.org.uk/

> --srini
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 94681394c1a0..017334ea4f34 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <uapi/misc/fastrpc.h>
>>  #include <linux/of_reserved_mem.h>
>> +#include <linux/bitfield.h>
>>  #include <linux/bits.h>
>>  #include <linux/bitops.h>
>>  #include <linux/compiler.h>
> 

