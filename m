Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB13D4121
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737222; cv=none; b=Eovq9VIZYMqCEnGNRyyi0tUOhV2NCEhaM8WTsdgK9RAZ6uoudSenzrWk4Ijq1L/8FvBsCa8/aCFIEjRo9mXckFxObbFN37ro0Pw40WKNQ6xyA7E1XZimvAjKl3D6Hvopm+z67yS9+OLXXdyp/4t2L4wh5jbcws7B1dq9FQlz8vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737222; c=relaxed/simple;
	bh=6ZFlkT6HMH1EESSA6pydGAzTXgJnBomR45rRAmTbe+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEc/yAfur8ogjNrvAym9u1RSoiAOA53dyKSiyFekbFcsgFDLmuU2ynMR3YdnL9yEfSgM9+PmL2SqWvW8Iw6GZS0eSriYCSDwdt84AkjlSWcJRTy3E17z98RfYgkCHnzAEh2I2AQ8mGJFy69fWaho1BGOsWDNcMYCAEo3PNZlAUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFaBlX+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQLcVpH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFaBlX+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQLcVpH2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJhDc01438029
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1O3PoybB02/UOh93Lrjs6E8by2ys+G44a086V6qWPI=; b=ZFaBlX+M3J73p00d
	UpULt7QRnAvBEmUbeC/Qt/mqkmFG7iAnNlJC/cHqcc+ngiuSuqmPtA92OFjGjf6P
	WcuSmC5q+oh1itjXPSXvwKinlYz6cXnuYzDTyD8YpKiP0ltfj+K3UDrxBoVnZid8
	IBLNCWEH4d2uxNBWhmZVQY+NhAi0VE+oxGYz38/rBJAVc9ql+7QqvHshPZ+LUDWu
	5v6oxZFugCEnHb5gsbGglazYVG3h8dPr2uD6Dd6aleh+Nb3mRz5hik+5QIDdz/i7
	C22PWMB7Qj/2Ftbtb7Ysj6PnOkMF716va9jiYb/hUBjdQQwGE6qVx6yA6xp+/W7A
	awbRGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g25ub8yu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:53:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2463368a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786737219; x=1787342019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1O3PoybB02/UOh93Lrjs6E8by2ys+G44a086V6qWPI=;
        b=BQLcVpH26ohqOJMMvbtEuVB/sd1B1kFq9jUK3rqSHK91GPKO935sz7NAJ4HdkgZ1I2
         uopDXhrE9p+3HvcHtYyr0186ebh+z8QVhgrymvHLo8qzFfCY9RB1XgPb7kDaTNavlL7z
         0l/iy8HE7msc5gXwD/ipfj94POa380obrPylUisR6eJ1C2I1z+vJT4e2OK3FK3YgmeU4
         hE13Ip15bHVgR2A853+438RCWXtN188msm+3CLRHHxkX5oSiWjAvXgPZnpjb29+7FtF3
         EHsM1t0Ly8UySrIFPg+87dnOC4qVS0jBJngssLgo219sOTJo10cpwXqfWXqvhp8YjBja
         DypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737219; x=1787342019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1O3PoybB02/UOh93Lrjs6E8by2ys+G44a086V6qWPI=;
        b=WYGKwSxomioiofZwK6UyTlwL1V8b9n3VKEZik/kKswf6wWWDTUE2KMoFxlzMoUieXs
         clOehhUtEPdo93ZE+mEndCEeUk65l1GnH13aB3khk6qjAIgtWGQ13cylTGuW60NYAMoC
         AwNffPnYI+wMiSrlQaBlWn2NThR3xoZMeYH/3WVCtoUQviEHuvN7NrMls0pZqINX3IAT
         y703eSet0UJq6qxTjGmDxujGmpmjCkPzshVOoeZiPo0pt0sYrA1C74ckVkKFvD3Bpuip
         cg57KZr+gpi8iJyIdMhbUyCK3sq4FIFtqIYjQ68C8/zhkc7gAK35Ff4+LD2bEnnGpF2l
         gRdA==
X-Gm-Message-State: AOJu0YzVFAxIf1mqBr0kBdpZ8O7/TcRM9urrVGoAsUPhryuz3zRQ1H7h
	v24eqQRIC/nVFE6IePLhR0IN98EHJa1rw8CHFxERw1YgfKh+DeHw41RF1jPLWcrQwXi6VyhyfPh
	AKaU5MZbNrj9qNWd8YCh/h+N/s71Jm1U+NVhpPG+iGrHidaoNZUggLtfzBob2Wus73wNL
X-Gm-Gg: AR+sD10kX2xGY2b5YKpdwv9pZ5IrOUWLuYQJH0JgS5QfhKvxf9j6LRQzJ1IBAJv0SIU
	J1yjCQt3j5bVuAoQpaquctWBljIJWKnmYAiTdrqfhS2I1Fi7JbXEf7rGlYS+2DMAd37M+1nMjmi
	amK0+khE0Hy1dnMCYuxdZC50zH1loSWyiZOD/tDKwfiJPHTzY/hOHSa2csnoRfflSFZmwyZ9Wah
	hGzAIbfvX9Ti9FnF8G9OO6DDmC+COr0Q9cQ2Tg9kIkX8r+px3G3hxuAZ8xsdl29Vv/jNWNamshA
	5k5NeTHLfW7Vyi90MGbqenAm6TzC8i6B1a+VcFyRs1OSon9yZ4jcEBslmdFa2u+Tx8r01mqwcWZ
	NfDWbahgK/clsJ9659sIV4M/sRPV9cQbgqK+V0YnoEVOYWgzehiTYeg==
X-Received: by 2002:a17:90b:3841:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-3931f614141mr12290141a91.20.1786737219044;
        Fri, 14 Aug 2026 12:53:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3841:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-3931f614141mr12290098a91.20.1786737218563;
        Fri, 14 Aug 2026 12:53:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm17250798c88.12.2026.08.14.12.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:53:38 -0700 (PDT)
Message-ID: <ee1ba786-03e6-43da-bdf4-cc57673f4681@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:53:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: reject BO sizes that overflow page count
To: Hao-Qun Huang <alvinhuang0603@gmail.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260708031959.966009-1-alvinhuang0603@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260708031959.966009-1-alvinhuang0603@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsjiaycA c=1 sm=1 tr=0 ts=6a7f7244 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XvhK1WYLh5LTG0QYcLAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1MSBTYWx0ZWRfX5LAFUqdvD15Y
 I9qXuh5pjBN651TA8QiGtEvt2Iorb4d4EHa+9rUpZYeBMfDDuKth3IGSam8rIjXaoISldnfXdYH
 CIsw6TC0Nyo6mb3dsDL1caI4olOGUXID5vuSA4DhFtbOjudvgaa5H155Jd/z0RTdRXnMWSYsXWS
 lMVZil0tjyBbX3/+RKcjgp0f1oZqVDQyjgBPwTP9K+K+m67gSgBjTqlejXm8kkWanw+ji92xUz4
 erNdSrpm+Iw0436vy5WEdU5sXD6N4CmntePCafwnPKYo818cIyttuN0QG4lwT3wQDCjHv8Au9oO
 MckpBeO80+kO3eSdjoVhNzkYlOlC09Va0QgTpOu2GBQJSP8t8DiQ2JnRncAHO+glUYqPBAUbLaQ
 XdmfX+jsje7GwHCykiVqBkstp/Wqojrn0owIDsd/Y0C2WL/x8+Gd16Uaa13g/SlxAjYHV4wORkm
 dzgo4XR6N+qePs08Jxg==
X-Proofpoint-GUID: DIp9IfXLhlhgZKefghtLBqZv9HrtG_uY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1MSBTYWx0ZWRfX9yjlEWZSv5DY
 2wxW8gGSBkl5w3pdsb4o6mOvsVZgspM0BecAjx7tQG+DBpHiLKsFMZ+iu/oMZjsqnVgGbtr8wIH
 uGBVEbTasG/nhCy+WWJWrYszqDv/DrY=
X-Proofpoint-ORIG-GUID: DIp9IfXLhlhgZKefghtLBqZv9HrtG_uY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140151

On 7/7/2026 9:19 PM, Hao-Qun Huang wrote:
> create_sgt() receives the BO size as a u64 but stores the number of
> pages in an int. qaic_create_bo_ioctl() page-aligns the user-supplied
> size without an upper bound, so DIV_ROUND_UP(size, PAGE_SIZE) can exceed
> INT_MAX and truncate when assigned to nr_pages.
> 
> When the page count wraps to a small positive value (for example a BO
> larger than 16 TiB on a 4 KiB page kernel), create_sgt() succeeds after
> allocating only a handful of pages while the GEM object still records
> the full size, so the request never fails with -ENOMEM. The temporary
> pages array and the allocation loop both use the truncated count, so the
> backing SG table ends up smaller than obj->size. Later slice operations
> validate against obj->size and then clone ranges from this short sgt.
> 
> Compute the page count as a u64 and reject sizes that do not fit in
> nr_pages before the narrowing conversion.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
