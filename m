Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B813DB335
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148815; cv=none; b=M6mLCrVd4KTFRyHlUVLEZGO7x2bp1OuV5umnbP7ChSxhQybyoVikCwpFIrj0zE6xt0aWeNtWos9T5jr5gmF1t3E1Z4oO2sVELNVN0rheNYu/PhszJR379WlmezZV/Y8gB3gxTcfE6HPlZlPaDS6EF0fkcNB8RoFTo15tTwKsqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148815; c=relaxed/simple;
	bh=gCTOUSz6Xj9/k9OuCwCSYnw4OvrWc6XZi9pYFF7Z49M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzcT7TyKdUiDCIPqCOs8tdrREAGSt7h2c1jOqgsyvZxQmD//W6WMo+lNE3yx5PInyhJvI3p1U+jxRH/iboq+wJFfl+cTqSMtd7DJzIzQE5tTRCpUkWru6t8R+rS8/OkjU3w6mdsJsXIC73ic7T7/ORdA5sgwYI3WPLbej+Tt+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTveZBb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzDugZWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTveZBb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzDugZWj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA6jL942713
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SON5F/DY5kya39+CRJQh/XmORSH0D3r0659aeUKPdBw=; b=lTveZBb/LfwgkhOT
	nxrVKBzvVO3V7dzy1NukRSDCY3fK4rBaH7IqAF+I+W73hivanGzQ5nK46ejExf3z
	VRhf3tL07iTmUNJ+whBsZi2WKcUma+I8GN2GV4vblB181oF0L0+z9jPzlMP+NnN3
	TBQR8U5eDRcoOOGixn6KGwtdGasWbPSTk6wB5cJPk6LCL6DcNU4L+W8cho/eDZ95
	KxCltqMM+PZCzXxXZ8SCbov7Bm8TzYDlNfovxVmwWmCfcBqPvZ0ktO6WNW+R1JTu
	hBB/hohAZ5L/khNKvwhrYzN7NmrQTWelWSTiOiHKFWCVxoGBlBGZOClqYG7kLggS
	1Qef7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur074x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:06:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so945211cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792148812; x=1792753612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SON5F/DY5kya39+CRJQh/XmORSH0D3r0659aeUKPdBw=;
        b=jzDugZWjBnJj7sTgg4Zab/cGbY/+anlUC0h7iEkEqOBcocOY0nB4bvXf3rlSwExkFv
         n6z7GuFQT8+BpzYb/GqSLJ2TurpXY8T0LgY5Cr521cLrt/2QJszQXkk4y8gcaZZtJPDf
         jrmq+AQSlRdn4Fb50hBym0t+X1L3cFePpF0iNUZSr4OooXAWy+opg04Wa5Jwjar/DNWJ
         7QyocpCLHqIxt0U4MzOkWzG3jHVkbbzY5QLpe1BAYD7cMgssJDuzwrY2kHXxFaiEkkRg
         tYiA/6E/AA2Sr8qx7ZhJC5MlqDRKvwX6Y24YkntZ6XQLOyK4HDMW7tajoiwiJVO0rIGb
         bSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148812; x=1792753612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SON5F/DY5kya39+CRJQh/XmORSH0D3r0659aeUKPdBw=;
        b=KvKEDs7eoCpssxHXmat8qKyoOB5WvLup0rNX/acyKKU+9N8Wwo3obxtnuVhFkHCIa8
         PHdbcfLeihQpElV5YpcXv/sOMcAThZsTtIU5cqIQDNs3DKh8CgeRMPuYmGPnpWpOmuMu
         0nLbfxjrU/3raP9pov72EdfeYFGEAAiiKvZNUZpAcQmZa0n52NEiRn/rwhOzg3nNrIi8
         lz4Gs5rJXBnJ7Tq+zxigKvPQp8lrs2ReiqRtWzfJQM70HAIRPdcdZeRcYGB51Xo51As7
         TN8fnfYkcYHUp6TJlC2koakOzaUqeRCHlehpGMv6lZ73Q8KTxD9zyu5+pdRlEpAWBLsg
         F+CA==
X-Gm-Message-State: AFq9FYI6tV1LI/Dp1tWu2JPYqli9yd9lrYopCYg0C5uUz+Dld/H0k/1l
	Iu9DYoM9YokpJH1C1Fi+9C+W9R6eIRENDIdfTKTWIZlVderXK0rqgR1UDugoq1zIZ8nR0iJpmiP
	HIAILoiC0miSL8pj8eE4PUiiat3Xd4Va0DUtoERcjxPpVzSbMet8QWNCZDExaNKv8GNJU
X-Gm-Gg: AYBFou2BRg66+eLKmGhS42FwTUha5zM4cj0kooy08JiHBFpxMaWz36+jHlCS6Rg4hp6
	84N1d5z394810Pq3/CKrKJwq/ITVc0UOKKjgmaxJ8K3n2M2UUz+STB+Li4t2DP5pOpXBEQJp2qs
	aM+i1rf3pUaxuh43oa4CBmAeG9PmHGVbcY8ee7Kb+JZumfNVhvNrnqzNgSUVfjnZli2/KD+1APG
	q39F7I0WEH6U9j4QZjqEVBsc42unad0+R1xXjUGfi13RuUnHibmiPDNhFoesWuGBrqJeEufgQGn
	1j1D9c20dTK/Fsjc3+khkAO6peUHVXxscguTatqJjs5+ir9I+QGCaGXPFUef+u+wwLrTFdwlRLz
	KcEscv0Ryqq54rjXKdnyYdw==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr428930871cf.1.1792148812404;
        Fri, 16 Oct 2026 04:06:52 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr428930121cf.1.1792148811681;
        Fri, 16 Oct 2026 04:06:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm59964966b.75.2026.10.16.04.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:06:50 -0700 (PDT)
Message-ID: <cd2318b8-7619-4885-bde7-5ec6961ac5fa@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:06:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfXx76WGDvAQMpa
 yJegNtgP7ZBJ0RGfzsYDDilSKo3/a73jz7CqzqDeKcnnTbz8ZAmciEYeCNVSc1QFr0PJPGmFsIc
 eGQgFdnGuV8kXcl3Z2hmysKBsrMO1L6GB4BSRhu8KCW2U2sVVYPY08Zpdv6VB9qr5MftFvxvGJi
 FJPyCykoXIHaGEuiwU/XgXd6+7DG9ahahpySjbROZDCOrappLt02ENpfceKEcTsCANr3xOOIw/E
 I3rfOoSRxUX6NMk5mjwL4ra3ExSdGeb8cLN3yXxDTzg8fdeon88Ego6NGdqL5QkSSy/uiXs6oHe
 ++1NcX08ZoZdY4JS6kYHsy5vhji+ZMMm6z5A5OvtAAMMBmV5cKjfuAYuD3DzNsii4ISgb9qpHEq
 4IU1W7d55IB86CW5OGx3W7qK9/Vao+hbBHZWOyz/v1TUC4+R5+mfSFODEIUHGZt5Jj4NKWb1WlC
 239XaRaH51+AOkvQtYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfX8AhEnGTqX1uM
 xK2zyVJvRmlQRLl8Y2JSyplFotMqrbGCQoCAsRqZSAzuQPp4a5ICLT/qxpyq//GG+puQ8+1MzBT
 Fc34X9kr/td8yaY0tq1TB5zDXgZ0wZw=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad2054d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nURcFc7YoTJHLg9ZjdYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: x_xh0SYuele3XE6yohPpuhrB2fKCsB3Z
X-Proofpoint-GUID: x_xh0SYuele3XE6yohPpuhrB2fKCsB3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160044

On 10/5/26 2:54 PM, Jorge Ramirez-Ortiz wrote:
> The firmware resource table is passed to the PAS backend even when the
> firmware carries none. This only works on the first boot, while the
> cached pointer and its size are both zero.
> 
> Stopping the remote processor, or failing to start it, frees the cached
> table and clears the pointer but leaves the size set. The next start
> then pairs a NULL table with a non-zero size.
> 
> The SCM backend substitutes an empty table and hides the problem. The
> TEE backend copies from the NULL pointer:
> 
>   remoteproc remoteproc2: powering up cdsp
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
>   Call trace:
>    __pi_memcpy_generic+0x110/0x22c (P)
>    qcom_pas_get_rsc_table+0x38/0x60
>    qcom_pas_parse_firmware+0xa0/0x100
>    rproc_boot+0x2d4/0x380
>    state_store+0x40/0x100
> 
> Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

To my understanding, this patch is right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As an additional safeguard, we should probably drop the stale table
size whenever the pointer is reset to null:

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@
 clean_up_resources:
        rproc_resource_cleanup(rproc);
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;
 unprepare_rproc:
@@
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;

        return rproc_attach(rproc);
@@
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;
 out:
@@
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
+       rproc->table_sz = 0;
 out:


Konrad
