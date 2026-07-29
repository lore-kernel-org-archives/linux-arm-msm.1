Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9144684C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322138; cv=none; b=bXxlKGoIb5iSsUk4SeHmNDhx1grgE/wUY1gSlLuIBCYkPzbVSlBeLebkdU3LN74t/LezY+YpuVZpm2B+kWgJemdHexs3Y1YiCsMp4hdJTsuo0mvFeUcttxZ3l0jnT68T1CU/oad/HCXN43OjbgbmhsoniSkjNXXMg0oI3C+ePpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322138; c=relaxed/simple;
	bh=VRhYzPIdcSv17taoy4pE1umPA4UcbJ8+0xxHd07W9wc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fB49ccHsWTDLfMcwmODKItt5CAblC3GnZkLpioyz+4R28h+21rAExM0120yjebGy5wQMX9GrnTAk1K/lZp1bI+D5HvlOj7pL0iDi6AA+tvk7fsC0igbOpGzW+KoUPN0I6B2J/DV1B1qPdLYElNqZQRXt1jZreums8N6+C6K/bb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQPl+uM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmZ7+Lsc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQPl+uM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmZ7+Lsc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fC1k683497
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRhYzPIdcSv17taoy4pE1umPA4UcbJ8+0xxHd07W9wc=; b=lQPl+uM+kKooiJ9i
	sucOi1fhJ/FuiVYZWFj+RDDfiBEe1AJFHwsoHnnk3SOi0sq088fXbqj2GvLDWQaG
	m5ky+IKnANBldUATO+zr/WHdbUwTIVUDs4yi5fzqZ0qWxiamPrT5YNxNPVS+8NnZ
	2Ze32i1RvNLSGs+KsNVZB/BwulJ12ZnAmGPIZDIJbxY3VV3Z+G3X1Aux3FED5K7y
	kXTtT/F0YiqTxOITTf1V0lG85EaXb9vf7IbD2laM5EfhNkYj0qkUSKfkbUp3aaw8
	mwC/52lw9djgZupYi/LGcYpWHCrU09pkPyjCuMGC3rvb/qPR0ftZ3xectxVEZYoD
	O6pn2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbn1s83p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:48:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so8832011cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322135; x=1785926935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRhYzPIdcSv17taoy4pE1umPA4UcbJ8+0xxHd07W9wc=;
        b=OmZ7+LscZtJb6hPQ7PzRZKMEHhzWkVr+zl86Tak6IzpeBQ3rwZTFfW4TyzBmvg8bSv
         5sfTFSctk1O2uVLHqtdNkXjS5qPmeoUWP5zP8PKJIYNbZReKuuFaeEC8rPkbDmLVeWY3
         tOFpqoV/WFipEbmxZMjl5Zxv/SkKYtHQZKEkIP+XHqYCkjDxRqUFIligLeMADNY5H+NQ
         +YvEayimkAiTkCOm1uREC4RYZxbbcGYHG+z/0z2ugHz3Z9mz0lJbR4aPvbadC+WnaFmF
         AjqfUNjvyTuaLnZh6kFkfTU0smAHpFJ1DI1VPv7wX4R5NvSI54qM6BxkKvZo7B5mNias
         IPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322135; x=1785926935;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRhYzPIdcSv17taoy4pE1umPA4UcbJ8+0xxHd07W9wc=;
        b=Wlup/SWKohq/ox56cwKmPwz/gAsUKtl+tac+RkmDT/wbkpz10oXUsBNy+/Sqm2ZSoD
         iQZhF8A7Y2i9y/7n66N7EnmYIXmtZBhTybXpeoy973PiEVmkiBqZFUrIgDG7jy960ttq
         AYZVX7oSJJkFb+6zq1Tr/uw4B2+taPKUtCPqcz0n9u89hywqAqernaTtLd1pC2F2eIPs
         CyurnoE3e/w6q3tXT9wnBMK0nhAmkZatdR7Rr5Z0fQ5+Tt5Laa0Lv2jBa3/hlWl0vKRR
         l70LwQdUiMZidOp7uT/F/OCLoT2s74KeVppTpQtgjccxmJalfVnEbZHHdJGzDmYMIWKs
         xaXg==
X-Forwarded-Encrypted: i=1; AHgh+RpYur4gFt9dRZ7kw3ml8Bsn2AZV0N4VuQrvp4N628n+lEsAgbCn7UEFCcsLU6NlbbYKokWGnd1ccJGvyVII@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmRee3+Ofd9f9qNdKyZ3tXaZyjeaYZs1YE/ttBuoyaOWJg+66
	22o40zd3K88KJAP8fw+yWUHVd5coCGlvsDdln76amiqaWMNVTw+IiqrAwDbixUXavO0MmA/yaok
	VV3sUdQo5PcHiISB3AFTi7vFMKSYHtnxG7y8bTy+L/fnb8MwJHi+nHeFjDKnyBvyhBfGw
X-Gm-Gg: AR+sD13jVz/nFPMh11crafvKFrSJUV2dRLmZiITabGP2h8XdjrQmMYrCJsOh0TFgXL5
	Ix4MBzUWN0plXymQCJ4eTAAIdGJo201koJdVJuPxNE7VwVPbG7gRFESqkZMW820zix1M1q3Q/4M
	bCoXCrkFxX9c2YjkMBPKfRHuXw6yHXoM5ww3plXVsuvpWHYdpMgW723O7i1V86+O99BEbjXeY8X
	WajcW9zU4y1PeC8QwaC1qyKtygHoygZFYaeDZBqS0pzEVtmfqGE0zTKXcWNJntWtCEeexmDd8o8
	mMQ6QJbOQLT5r9xhHK1tRrPxStK9DJHinH+skTAD9EClb2/Nm95874uwIe+W7OsSzNP7NisZW0i
	I+WeBDQNSsJjT9o9J679BcNZNDA9n0A==
X-Received: by 2002:a05:622a:53cb:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-529d71474b4mr57345311cf.73.1785322135301;
        Wed, 29 Jul 2026 03:48:55 -0700 (PDT)
X-Received: by 2002:a05:622a:53cb:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-529d71474b4mr57345161cf.73.1785322134915;
        Wed, 29 Jul 2026 03:48:54 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4615f5fsm140842595e9.9.2026.07.29.03.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:48:54 -0700 (PDT)
Message-ID: <c5915e58-eb73-4e04-9a58-61cca2d24bfe@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:48:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com>
 <24f7a6f4-e369-4e63-ac2c-055f159c4b7a@oss.qualcomm.com>
 <e861a5b4-38a3-4f39-932e-558188b5438f@oss.qualcomm.com>
 <32b6fb33-0e80-4e7e-86ab-12730744ef32@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <32b6fb33-0e80-4e7e-86ab-12730744ef32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX8Lb23Vin1iSd
 zivMUYuiC0QUFvShYzYNYVVDRlQJzZ+9EKS/fwlpgg7LvuTkScu+qftLH7dcwfsifMq4VNm1LWM
 zQUbnapKcZebbET9QOmSUSZz7lESZWg=
X-Proofpoint-ORIG-GUID: 2sNhyypEsDuZUG80ZJeYQYxlazbvCW5-
X-Authority-Analysis: v=2.4 cv=csCrVV4i c=1 sm=1 tr=0 ts=6a69da98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eJoEciQUwBFPcfgth9AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX6iIVBGvb/vDM
 Gb+3YJy79uDYJSj6qS7zPLIUY7IrxflK2HFFnWNet58ntNLrehOML+8h8iH0xneSYmC6F+VNH6L
 XmKdqlxWJA8Z6KCJBmf6lvFl6ZTH1ln3VCWlFwQhcKBbdFE7tZy4kpLWz0k2hRzk+TIc5gAkVzw
 p/n8/R9iN7YbLCjgHp1dWduSq2Xv2cEU1IcytveLd/2nyrVg/WcXxyr3V5l4/kHXijPE8ZqanBb
 8MXrGb5WWWaDOzKLuV5wkF5frz2ToLofOVaucbLo+AdONUoAjv+hEz8PKnLS0omaT+q4Ai81vIo
 3/u/DqiGXqyO314/aGeHPOggPI+B1XFYtsST5xtZInxhvY0wFuJOiu7JlFv76linBv2p/+4n5dI
 feZ7wnjEqWfEwu+zSH3NWZEn941Bj13C836pE9INUb7LTPcejm3Z4ImzLChbKmyq2x0yI/ahIu/
 t78b9xZv4a5ujH3EmhQ==
X-Proofpoint-GUID: 2sNhyypEsDuZUG80ZJeYQYxlazbvCW5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290089

On 29/07/2026 12:45, Krzysztof Kozlowski wrote:
> On 29/07/2026 12:28, Hardeep Sharma wrote:
>>
>> On 7/29/2026 3:30 PM, Krzysztof Kozlowski wrote:
>>> This gives me nothing:
>>> $ git grep kuno
>>>
>>> Are you sure you organized your patches correctly?
>>>
>>> Best regards,
>>> Krzysztof
>> Hi Krzysztof,
>>
>> You're right — the Kuno support series isn't upstream yet.
>>
>> I'm planning to upstream the Kuno support series shortly, and this


And why are you Cc-ing here kernel@quicinc.com and
kernel@oss.qualcomm.com? That's complete mixup of recipients.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

Best regards,
Krzysztof
