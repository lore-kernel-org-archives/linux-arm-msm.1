Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2674756CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464216; cv=none; b=ZVw1IxSQ4KnxobFuBajU4GIhYV5/GIlC7LK5CCh/Vo6VP2RwySEygKYfwXpmNDyvikK+JOFGAedT+oZGQvVbSEeqHtEIkfRx3WNjKClQxTzU0TW6AXgWwtfWRmPV/SNvZlr6uhbVFrT2tgSklgFW2a+DAwd5o1Ad0xY1ToIuD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464216; c=relaxed/simple;
	bh=k+B6OmVSZRHF/7PniO6p8HutiPOy9at7ASl9vPW22Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1NFM4E6yid9fYzoEtrdLbWtVb8OeWAAY3+ryeUNMevA/Q23cJQbwd+oPZV5R/4IiTU4NUY6FW6lc7Zp0dHbqiH7Pi5OIIKdh2JcL/MaCln8mX6ivSjNdrUnGHpdZRLXm0mtnZDjvaAYtEqt7f5iBeyehWP3JHn13ZzJBvjQnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvBAdIxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyB40/RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvBAdIxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyB40/RQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZdTK3824091
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=; b=HvBAdIxh2Kp/+5m6
	LNzP9NgnaHxpNQK/P7OrE/guR2KqcL3Had2yRgXxmgE4MuAKkdKNYaad1YV1Akkk
	N3dWH9oxOKTbdDQl+eEatyxEeTkq1PMMhipEnMEwzHBlCcQ8c7a+rAjoyhzMvbI/
	7c/BeI4koMNzcrsquPrDw3++2cCrKfUVaiyQbir6et1hqB5CBifqe5sLalSuYz8b
	l5tEaTj8L4tC98HiwFvq3SvmKYkIU5agRE2zae7URkaQaLi4VUk2U+M9/738444f
	FP9vRKTJ4HRFv3ygyb3t/bPXYhb5Opf7U5lztpxbzE4Duxus0lpb3oIgDc4PUK2G
	F97uFA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41un01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so5223075a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464212; x=1790069012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=XyB40/RQwfLUnhMMPFiQNq6xnneFQ3zBXJ58qtkJgyfIAQPWsNQjqFDb2C4nTHIN++
         TrQ0bSWUxAM/OJODFXLNDdVfylg5uLcaRuJ32u68bPkC/h7A9rG0/7EPgWSmatOfKnmK
         6aFd8eT/NAez+K3DQCZYs4DJMG2wDPkVKgXKyX7vNIjLJUIJBi+tTQShraRx+0rgv/aQ
         yz6it1bAQhXkXw9QhZGb8HXpCAMmx8TpKbvBpu1+BKPImryYYj6zMUUmYp7wC5ZXFv8L
         7pbS9S1u2PTPPZtkL8M35XI9Dwu+vubSSQxM/tE7IFtsjxjEDnuBcwow3QnMGCeomcV+
         vLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464212; x=1790069012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=nH0G0Ot5zq6CQYUq4kG4FpTPwqg1p/HsqqQ70SqRkxbNXAVrUbCWSlFNMLoxjhpZlf
         DVsTJ0Vc+XMQ1G5JUaBcoZhYxfgyyqA0rYBkYpmveedqeJk7uAhAi1wGP24GJbxkErXt
         4sjTNPPDb0XE9EoLPHIMNkxnjZHmDREj40CwTRe3XwuAJN57xo2RcQD6BfMG5nxM8iOq
         4dRMacNDuMSYO8omru1S1r+oAJSnZ09It/3eKJEdl30r8PmbR0pgPISwBwqkEQmjamb4
         et/7MqCTUkp5kaozbgw+3VtEm2Yqt9/wsolSrjgAAiediCN+UDAaDw8GITtVrNSWlOZy
         VxKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1onm/20avU6PyWjzBb/yqwLNp414yIenCoHaWRXyHxR32DruwMKOJfHMZRy9DX9bePG6JCsWkUm8JH1fU@vger.kernel.org
X-Gm-Message-State: AFuF++kxfhrBykwrEGNd+K0phvizB4pxVa3YttIbwWXQDNJU/U91ZfSE
	J0+MV9GhGWY6IIcwxS40JlbMTvjfROoHwoBMCokcetsL6nk8HKchAnQMwMxW+gtOPOafFXBpzjQ
	BQmZ2m8Cn93GDnf9vJw18QqiKh4paYpW/D5gcyDdaxCRRRXiI8ZagO3cJ3iXgT6d8fDU9
X-Gm-Gg: AYBFou0jmp5eIjeM8UGSVt+tFcpisHZMtxAkvoO+HZ5D+VB37/yIRi9lNF8J+EJiiuy
	mQR1dSAIAD8cP62VfaqWJ3MQbsqIA5yCPEuu25oppIkx98WkB2uQTdV/TFTAmHhAnOZ4RXl30q4
	oGvpVzM9Lrh5Z//1Ikm5V8mGHj+rIyN+LVxY6ENJjS74VEUvhF48OJOR7RL9tmZjQEq7MsEJOmX
	VckonG09TfRiD4UpAv5ti2rJCmX7HPOI+AAE6Qf11hgWP/5U1qDwCtFZ61xYiZvKVgVlZVRa0kX
	bl+K4972kPN+/adwqE3kjhqh4sXKvqAKfLwC4VhPQP/WGICbMOryL2t6NtpU0eVrzkwzqjo/sGa
	X7wOZgQWP++lzz671/eYdiZ4=
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609050637.6.1789464211808;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609012637.6.1789464211403;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.86.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm29591306eec.18.2026.09.15.02.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:23:30 -0700 (PDT)
Message-ID: <73db10fb-7778-44be-aced-562aa1039404@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:53:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Monitor Yoga Slim 7x EC sensors without taking
 over cooling
To: Birk Skyum <birk.skyum@pm.me>, Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX3Z7z41nxd6bj
 +3yKDBVctZymHyYIPlQdD4PQQFGnwChHsqqYYhWIF/uuQTLJ6Vbcu1+N4aDRF2PgXiiWOXtrkWr
 F0ATlNe9d22kHppf1Pm24GlHpENu+DA79dNcPVRdk1297pl8NdzqSJBtXRyfDXoXK/tdaCQ8S1k
 oAnLC8ICy6hi3JGneQX4H55uaUUWrrPtT/HRzMDES4ez0IaWMIcPJU1KRExHzCfdzE2iGptBVJV
 8ZU3vbr7E87J9Js1em54VIYrE8Xx2GiUlwf3gEdawJhs8jBzttHiHotrTwPjq3iCgtaYHHJQBzV
 wpd4EY01hU57a0sMxIPVggtpMc4+MBtrlnDr6ipcYqQ2VX62kh5p3QsXYASvqYED7UvgocL15Bg
 YLVI3iKQPtfKmDRtBziC3qZ5RbttaqjcNTRxfIuwwWQpdCQpoKcnNGbAJEIXhv30zxm6X2omu+z
 Ewv2aCdfB9h4AH7I6Ig==
X-Proofpoint-GUID: rKQzjCT-dodkn793lrRsMmpcW9EfUyA3
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa90e94 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=YsbRjcmUuq6dkflYeO58cw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Aa1CV5B8TMOsY60AgGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: rKQzjCT-dodkn793lrRsMmpcW9EfUyA3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX01f9L60OA7M7
 qt8I8b71ZoeyNympV+nchYBuIWhsG24vRZooRfr3qtnhMvD0nave6X0d6utz56J9kE1Iyis/spI
 KJbQMcXnUGaObMv2HEc0o1Vwr7xy1i0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150134



On 9/8/2026 7:28 PM, Birk Skyum wrote:
> Two design questions for this RFC:
> - Is this read-only match-data path the preferred way to accommodate
>   the Lenovo firmware alongside the reference-board work?

The read-only match-data path looks fine, but it should be integrated
with the existing LUT match data. We should not replace the current
match-data usage.

> - Should the pending Lenovo binding omit the qcom,hamoa-crd-ec fallback,
>   given that this firmware cannot satisfy the reference driver's probe?

If this firmware cannot pass the reference-board thermal-capability
probe, I think the Lenovo binding should not use qcom,hamoa-crd-ec as a
fallback. The fallback should be used only if the device is functionally
compatible with the reference-board driver, not only because it uses the
same EC chip.

In that case, the binding changes in Daniel’s patch also need to be updated.

-- 
Best Regards,
Anvesh

