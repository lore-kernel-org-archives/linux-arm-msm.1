Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DFA3D4121
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737269; cv=none; b=PmdFWnHUDcUTJBCqQofSzAMHUdOz4yed/4gGJAPERT+X1iwiEAvUUKaSKHPaZ7FY/aq/3x79jnFLNTmNQSzKcHjFS0Tc9ljwSA1qUZwiCQz2mcVbc/DixTaryWNThjEEgUE8zGL+RNo/xCvHCAP1PolN/tY/uXmCjHlYlduEkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737269; c=relaxed/simple;
	bh=Dh9w5Rsi8N0aMlcWPS47FBfYiWUPTJS0SnpCA8oZyaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJb4rQSofiJ8TBEThjy8gjHZsUY8yndP/UHYY2dM3hcBYnxEn2bVFHx1SWAC9Fsh31JHtmmq/M+38qn0f3O2zjHkV4FMlYUov6a6s8ls10rlFYlIXb7ldZG4L45N1qWVH8MeyVgNV20njtOCOkl9094LSQ0AEAdz9kx2nKHO4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dzd8g1Ze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieksknDK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dzd8g1Ze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieksknDK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJhBLU1438002
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBb2cKTCYnoOH/mWjGOkU1ht6j2WF9ppGTqUJGv9xjk=; b=Dzd8g1ZeWUYoMuE8
	SgbpxjJfR8vd6YeFIzC1HB5sTGKKn8DKxkk1bvOB8Rlw+LG8RGDAwDxgO5kvMA6P
	UPT2TiGqPqQwnpBdhyq7NTBZC5rde/0ki8ZcGcK0ISuP56lERJZq5ye0xWszduss
	pQHt8KHJ4LJvm8IFSAEJW8kKD5g5wiALb6CqaYzu0jxcs/kOkAg06SWCjmWfzR6r
	JdR4+CT7Wyi9VMETR+8RQIb2EuSpaFOK+VTN+n0fPFngKeAs/igQULTPizon4UgE
	6ag+ugOMPTSgeW4oiZLQOQG5M1JKsoeOVtEdjzDGiooidTP0bcUkKvlgEZLDeYe2
	TQCzzQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g25ub8ywf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:54:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1966573a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786737266; x=1787342066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBb2cKTCYnoOH/mWjGOkU1ht6j2WF9ppGTqUJGv9xjk=;
        b=ieksknDKy3rAwvAuYV8Cl/0eD1QhQAexiBt6BIKpupVUC8AbLI1B+N7k3jbYYMmsGK
         0ciXN4WBu7+yIugT2B2MpB+z4bNC9CUZwYto3gOEFUytkFLDnqu/TIVlm4DTPuvTcktK
         ETAAKAlwRdIryzEo5HzfsJZ1YxC5XCJjmmY/kg8BXhPZBc91Oi8fWobZms9a66uMzSB6
         6yo/pzDpMVsQItKiRznmFGjjARhdtxnys8yhiujv59N3NN2YWYf9kE61n0s69k7NEJ5u
         CZqZa/RfSSxt4JkSNjdFrkFKwUjnOURVH1gwsfD3RvPAP+U8feO2ImuYpMqaGy38ci1+
         spAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737266; x=1787342066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBb2cKTCYnoOH/mWjGOkU1ht6j2WF9ppGTqUJGv9xjk=;
        b=T69HL2l0U6G6HqwXP0X7trdKo21VLFUG4ArfwRPL1rUoq/Qp6HWHHBSttPpH/XZ8Kz
         pfHPZL6S4gDUE81wOUOnqsv8Rwi5fFK/5VtNlcOKOXWAcpNhmFNBaimZ+9sDYPotrZkX
         Ap0PpsIar1rHcs8QIAQWN8bP2OJVfot8KJwNyy8u75teoMPk+h9v2CPDHAA9Dniumve6
         SMJvjZTS9o/rZHMm4nlhJQwQzwhkTA/pOmYT63TynNcWK9KY/XMGhhf4Ogv3e0m8V9Zl
         GvA40LS7N+dMNASxlDZurM3idQokB/B/jOrwkWTD2hLF/aFoXZPLQA0/Oj2Xvja16exH
         pDww==
X-Gm-Message-State: AOJu0Yy7KGFG+s3IC1qrWf17qDrVxKsyjiN56NJszHb9/qzMe4A3XKvW
	ZRrqhP5PkFIybYeH4BpHeDV19WiRE4+fmE+Yv+DDiwQRe3mqPxi1cBzNXyCbDZzVEHRQvT+5RCG
	rbC2FORaXjTIvdmMIPzFw/VWcJYUnUye4Xwxuu4BCy6M6VkZ0ovZuInLQ9fWwCiCv7sUw
X-Gm-Gg: AR+sD12ggkuZa5+zfl5AAqgWn7Z9hSqMgGUNuH55XVgPWtTpe4QWjB75Gv66wkfZ37o
	Y2yiW9IMo9jBuPd+FoJOTrBQHIrcdSpvYwCNJ8ObT5wPkIvLNRaMRhSCizJomLmgCjCucy0TizD
	tloYbLxbdp++nNZuTkKOiv2vVKoavmGWdE5N+8J/8Hn6wdnfp+qP1D6p8TpPBO/vIOIcN1r9LMM
	pRwJrT3Fjgp+nAYm7gEilz1qZJTd4C3hR0Z9nAsUCXbI6Z2ZIKLIfOr0R/ncc61yI+rF0veU5jq
	r4YuEWB5jrmRy+lj3nOqKzGEhXghrY0CWNs7eABzZtJIX9G5nP2grsxk47u8CctqwqJ12E2Ypqo
	x6fQx/o4d3zlQctmgntQeadHuv2RaEX+ne1cOgjTM2VL9HZJZ/KPVNA==
X-Received: by 2002:a05:6a20:a106:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3cc71a24cf9mr9734306637.8.1786737266071;
        Fri, 14 Aug 2026 12:54:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:a106:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3cc71a24cf9mr9734265637.8.1786737265610;
        Fri, 14 Aug 2026 12:54:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm19164963c88.8.2026.08.14.12.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:54:25 -0700 (PDT)
Message-ID: <27160077-35ab-4146-8b9d-cb8f64683c99@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:54:23 -0600
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
X-Authority-Analysis: v=2.4 cv=EsjiaycA c=1 sm=1 tr=0 ts=6a7f7272 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=XvhK1WYLh5LTG0QYcLAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1MSBTYWx0ZWRfX8wDzAuuXUfE4
 IglR76WJ16n4ZmzqHoFiOeSSqu2mQAqs6TAs/pBoBSvTsf7ZpDFtDSNa6t40zTlhdoIgDaT88gH
 1CvoYTMr12cplqKSBQ0F2oayZ746rQNw60WSFjPEqcyfIGCzSMjukoFwskaks9Z0sFM2J8Pv1Du
 59+5+KH2lbWPnbjg/Ch5wV8tuHa/T+g3wbYMOs5acCmmqCytvF3R9YR1JEb+yz5TEV7akVGsXN2
 3qU+vPSPp95MRhbCT3ckPrMetUxTddlmVg+OAH7T0PTLtyZ6STycOZcGWZrMqAlRPD7fGI7mq/d
 fXaz/ajA8d8nQEtleYz6DpfswEd/jzu2KucE6E3b++0YKXxYH9Jx0ZXRdAMhg0ANbFM0H4h4fmP
 MndYBWx/J28QnnFR0nM8XzShJEsytZxWwAeRagEQJ3DmuexmSeAF04dao0OVZVrUL5NA6qM/BIG
 HvZZifEVe04i7USJeNQ==
X-Proofpoint-GUID: oM5ySjESmsFUljra13Jzw2AuqmQD--B-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1MSBTYWx0ZWRfX8HOCOwnWWZeP
 7C3xf1cxTMh4/25kxaL7qjTZ6IF1071Qpwq0OFAoYP8I9FiVKHG2wnvb8PXJwIIZVxbcjwFigeP
 wnfN3WU8hTjXhWpdGsToef3ovtkcQlo=
X-Proofpoint-ORIG-GUID: oM5ySjESmsFUljra13Jzw2AuqmQD--B-
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

Applied to drm-misc-next

-Jeff
