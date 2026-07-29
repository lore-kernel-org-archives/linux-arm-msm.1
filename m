Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42744446FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317570; cv=none; b=MNG9zaU5IyLmMfsFhqZxTy7Jj/hPJtWzIiJCknHphwB80BWYEevMoQaUyNR9PHtb9m8SKLNLABoztHTU2Xvcb2YbYXgCHkpgV7IQeDlLmIsV/ZVPZMrYVGmARiCvU6rL2xHcxC8Jgpx0bQpcNwm5szkgR0m6G7O/3U1exSrhgwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317570; c=relaxed/simple;
	bh=0OVNligmlR/kWNf+WVc/JOMDAt1ImpPPeTZ+L8n6Go8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP7JOccEw0rvfZdsumJb9EGix5z+4XvmRmYt8hik5P/phs8JLXT0CjjK44QgSHWIZzejNEdsIsAr7jc1Fhmsp7AB291tjkScpn6lW6JmCg8V+cDlOa9NQnvQ9NZo5GCgBpCgedSUf+BFUaTX9Dtacl5yTNmUFUfYiBlmb/4c0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdqGLm+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cl25hZCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdqGLm+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cl25hZCE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fBQT1372349
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UM0rcHI55tYDhqLEBsE45BNdlo3SlDKhnpzG6xiM4dc=; b=AdqGLm+x8Mf3Q5Eq
	0dYtgudiIGgZDDpZR4ADhKozeHWyKLlIv9ZgQIk2KTjiliy8J/vr7rGp6yTW0NuY
	FEbxcTkdRZeXRDdr5fGKOCMjWxuTIyadOBTou6+TviFW0iY0QjlTnec8tVR963Ez
	ykKjvrNoYGGnuV6hO58brIEUfj3J5WKBBPZ6WE+WObY/igF61V9OvH0Ff7bw819i
	C0KkbqapU+DEYxsD9JNv2ZFbL5Sy7mimD3f/CR4KWV2wva10JIybth8qXeoQ0Hc9
	TIfwZ9kbFlVhSTsgITF2oepmqFmGUjScnzkTcs3V+oWncL5cPFL6ccXs5wI/nRdl
	njwqgQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm8wyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:32:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276a49e761so1042861cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317567; x=1785922367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM0rcHI55tYDhqLEBsE45BNdlo3SlDKhnpzG6xiM4dc=;
        b=cl25hZCEhOrYRrro84GyTL/UNGghVFUEdBRMsK1caRALZ0h27dqm99CxxFdBaD6knS
         9anUt/N7Tnescln68WF33o/SOeMT57Kng/ChIGF6FgO57bDjMO+yya/EItzTTOueFfHX
         ei4IOw8y4TCA+YMgNonVl63O48UanoW+75F7sNlGcGQ2rh+23VDS2WJp+A3YQoAW23XX
         UWHODEQob7gS9CWlAn9F58KqjyQ50IghLx33oFi2Fwtx916K6lhYxqk82jEG+nO3QAKg
         hsdACHBhSrLtUfj68fPc1yzWiRx9tTrQyDG11X1QKp1h5CYbaNg+vn2nD8g0GUxN4Fus
         CrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317567; x=1785922367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM0rcHI55tYDhqLEBsE45BNdlo3SlDKhnpzG6xiM4dc=;
        b=F5ciH4D5zYnzv0SFQSuRHuRPdUXeaOkVXgmDcWJcPJ/8jeI8yRTwhMSJ8tBXON/pvQ
         VCvrDtWN5oZXBWaqxFWznvoC+IKzpmKRMSHLHLocWU/ModHDptFcJYD8E6S14DcVIYgq
         Eot2LZ2/3NYok7eHP0BYsjhLgacUmnp+vGi47FBG1xDiRE1A212rvyk3XFl7Yk3yhEY9
         IKLVEUSipwQ1taYh29a4Pc/qAQ6xnmCCts9DAgg+NfmxlMHFsxt9UF8h4DM+9t7OxLTa
         By+6Pe9X/FYNGVnZobnQTVYfUcbhIvSXgtmVzDcOaCcbqiOXetQT59OKymTtHJ6/G3hh
         P41A==
X-Forwarded-Encrypted: i=1; AHgh+RpXHx3ymCP4L4Rk25T+En4xMKiDnE7wahCULH6Oujd09H2m0cGJzFrfp2TQBUvPo7IqFAN+VfNQwygeKSL2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LpynMpesuWIKQCaNHIjmwCeVetdQvfMmp0/GCNGlgtNaxIK4
	Tw6o8z7md1QSO/3XohTuiQPdrStCJxjJqLOgE3G1PgKUrOuxvbjDhofpm2mmXU1YkF8iS1ovuPc
	9QPMpnjPD6UFzOHiGAY9CruIZqTqoWgUJy/XpoBRJJFiZWCVMPnecpY2Mltbzh2ulUmwl
X-Gm-Gg: AR+sD13q71P8VsOlfNqeuKzvxWw49Etsxkytk5xeJIeFfJhH125WvHeOlYtjDn0w/pg
	B+uSA6pmZsJyI6giK3azHBogMA37XhKXje6uqXOxLQC9x2w7AD8LA9BoxUSFDXCFS7IlNCa5AU9
	nzxuUeieJg/s/6wGHdOTBXf6E9c/TlW2jJ4ZsKUbjSe2k/xLLjjwkjq1Gggdmf5eddELwRxpVWW
	qzxIrsTnu45nxUF59PfFvsCZhPSYP6sUpHVrId4BXwWXLDV7c9h1b7wH+Bsfgxa+EpkdHE/2s0/
	EHX5X3j0uOM0PmLUF/E3qdS8vYAj9/LyzB4iNvzsRdHPpw85Y3rj6n1NuJK2VvEUAux1gNaoR2M
	8h+STWVBlEpp0QDMbWDOgsQWm
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr36616961cf.3.1785317566898;
        Wed, 29 Jul 2026 02:32:46 -0700 (PDT)
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr36616801cf.3.1785317566554;
        Wed, 29 Jul 2026 02:32:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8400794bsm88237966b.54.2026.07.29.02.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:32:45 -0700 (PDT)
Message-ID: <e59a1272-ecc9-470f-9120-863f490ed2a7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:32:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-qcom-geni-se-armv7-v1-1-cf90f050cf0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-qcom-geni-se-armv7-v1-1-cf90f050cf0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX8MUGrd/XyNOl
 kIqtSNEm2uYTAkuEONcCIz/8RN5Nmdo6fYiAwYBC5wM72F18NQwOrjoFP6F4sQxVbskQ7pxKkb7
 uDyfKGKMKBHfGwichq82/qOtvo8f4ck=
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a69c8bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ax5LA6XsPdTS7ErXUsIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: fPUrXYBkwCX0wirHXVRWHpuugn30E4zb
X-Proofpoint-ORIG-GUID: fPUrXYBkwCX0wirHXVRWHpuugn30E4zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX3mYM4IF9127k
 /uBScaPPq1Piq2Wca9MhGDwrGo4xm/rCtgFtHruYW5XUd25Ajzli/kjbm4uhwsFLxx9NJNl0xqf
 Ea0jv0sZsNL0NEEYPhP1Gu8ZHbhsIK7cE+sxExUNOZG+hA8+3GfXT9Tr0uJnnDiqg5kGSfjrXp9
 syWtVbPcYueuxN0CrmasphSp+dX+nnRLCQrrTdX9t9nEUWwAnr1hwB3G+kK3A07WOoltcdVrlO9
 47B6MtvvyS8YatgmTvT+RggffohpliX46d4QAih6EM6YpsDGMtuI+VD/1POhyBWORnq9BtFj8uV
 w3JACfiN3gQDve8X5eTROzPP4mq6h2bNvOqkCfYlaJ5aX6OnvEx4oBHc95/kCut8JNXo9x5DqTr
 AgzbZWu/iy4oP09yPdVn0zyAWbYD6jGIRwhhxoSqO3U4/QppR3Q3ioGzCu9daWZzb14/Mi/3A7I
 y/tcXH2NK+cZgBbcJFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290078

On 7/29/26 11:15 AM, Hardeep Sharma wrote:
> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> hardware.
> 
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART, so this assumption no longer holds.
> 
> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

:(

Konrad
