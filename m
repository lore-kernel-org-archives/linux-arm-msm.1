Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39F4248D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441499; cv=none; b=TII1Hyme/B+XzRVQOXpzdGyqQFqKrByIoxPtYF8htwNpF7oY3T4aiLaMYFY72u0VyVJmVpvqFluXr+PwTz/X71tn/anTbIOd8XlcDs9wvSgER4sCm0z/lte0jc1M9VWKroyb6NOSxozODlOZPNNPBx3yD1jLav1SwcdGnFHgX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441499; c=relaxed/simple;
	bh=nDfAe4li7gl3j3Xgfqe/V1wW2kzPNA8XmVphluORGTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Le+tr4utQ3waUVAS0afwtrhAJFCcA7ZPdGjgQ1wKaUZJPQL0HWmmAOppCYYmnyusni23r4bwJV5Nluso9XsMUffis1onKcOT3BjYPYvHLWXazA9+vk1VOqRN52tDMGhv5morU6SmIgV2SGGNmrwQRquhswura8rMmPK9oj+vS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuAzOStK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hb/6AEQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuAzOStK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hb/6AEQk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7JBGh2705347
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xcm6ZNyXh2f9sSiiUiO5nVlTcd9fuj2SxXTLy16daS4=; b=GuAzOStKF2w60iXI
	UqhL5b9gC1D6USYtrVrIG+3r4lJOChWvw6p5WWIfZusaAw0nCIywLI3MmZp7YtBP
	nDqfqkLdYGCBd1Kmnl2diFTLIZlUfR6qSqSEZnLhWt1aOQ4g+fwWU+w/2R/nxFUQ
	XuwdRW/CplBMi6teTgAFlNMAXDZkuYFChU/mx2ohdzxQof6cbpqx+uVyyTtN9VSP
	guVuusXH2Lq0Sd97GhdywVqaXkZ/ebS257h9WY8gcYF74/UR2XD+l1QXjWb2RTJw
	t8irsrspCa8TKF5P35T+AezG7sjROGhM+ZMRk20DNJEOeF2cwaDjRnKOZPl79ezz
	FF019w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk63g0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:44:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9368b4c5964so41913385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786441496; x=1787046296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xcm6ZNyXh2f9sSiiUiO5nVlTcd9fuj2SxXTLy16daS4=;
        b=hb/6AEQkPQfVKn1GQNUuDDcvsZVxFigiKEqJfcNA3L/JziepfY1uDNcAClI5fb26Vp
         phy1uxwzZbrmiJnwC48L4nR266Ui0cxRv3t2ETrKZ8FPkKxA1emumf6RV4racEErK3bh
         fHMkXg88IU6baGKtUo6QTU0Iv6hvxvmtDXrpcN/rmIO6/6VDDVOeEWLjoNeUqq9oK5xH
         7/4rCcmEFBgmp0DKdIFJnSZCckRXzPlX/zxDfpBBh7Fvgi5whHDjMakeqrIVA4L0JaUf
         s3ji9mAFqXy2TicD0DLXDAizh1rl3MqZ9GsWN/ctoWihJNFVorn7Db1J7dfgVk4SnFP/
         0FjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441496; x=1787046296;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xcm6ZNyXh2f9sSiiUiO5nVlTcd9fuj2SxXTLy16daS4=;
        b=eIfMt8zwqOuWtOOtJ/6pahzsP3tbDEpQj28dDwgGB5d+igCQ2dol5NWEZLHO1NPfsz
         krY3kdstfvx0zHHfOxW7WfKOLX1leI2grBv2D+TRc2oDpvuS04zHTE+tfIEA+0p/sOpa
         AF6aKKI9dhIbOh08cZid5WVmCV4ZIWZi2nL6RNBdZqoUO+BZTJSuaKH8gkYEObrvRq4N
         D2cdu9t4eFuoASkDJpG36dTvplUfYOiWbnttuchw/LLa4MUIi05Fb+FoYB9J1ineEc3H
         n9wEG8HxrtmBiVQA/V/Pr9SBzNb1aBz2irxcO/fAb+/qnkbTPjDjgUchsvQlbLl5ISpA
         4s+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoctB7PminI0OJfErned8IVsKX7OnsEhFMuMN2hp5av5aAAR9kGtDQBlkv/FnEwCQCuEzbi3lHOyjTAq22a@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOTF19UOwKtaDn6LBuspyvEp81BlBP0MT8DUrQXtgvLqavScS
	M7Lp1wyJOUSpBUEZ5yiqRhYh2IqqeuU2yacT2bxS2akXQHRZM/X8bMEoqMc5OU9jrGiB/ZJ5qSL
	DsLw5Nn4/eG9xdKWpKYAOZdTECMT9vYYyyiRY3ygohxBTLaCsUT5EI3EcaDe8em8YefwCc9OTkJ
	HC
X-Gm-Gg: AR+sD13IOQ/hdpcMAgjq+d7lxs+WkV3ZLpzBFLeI51bGeoZunWHZvKfCutyfwi3fq0E
	ylISO71LjSNTYhpifmMl+BarcyowIvC6qynLyFdprGsMFiCKVp3tAKHA5vWA7pxroiFuUh4ytjg
	jQKCKld12mQP14TzezfI8sYOirvxy61b1tMYvfsIQPyacZw95aEQatOGApQUh2rtOS53G8p8OSP
	lvhKB6LPinAoGrNO1C9rHSC1/wdJVLbsxzqNjWmitx5lbh2yoBJfwhK1Zt/wG2je8EWUsP70YF1
	EXttQxWppx89TvQvEA/uQfBNhVhe7s6O7jQTmmtkuE7QT81noWXWchZ08z3nBc05jOxKreGdc33
	DF5UCeQfClqU7GjP875RbHIVN9tnZ7g==
X-Received: by 2002:a05:622a:4105:b0:51c:20:aea7 with SMTP id d75a77b69052e-52d584f7ae9mr14705551cf.9.1786441495902;
        Tue, 11 Aug 2026 02:44:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4105:b0:51c:20:aea7 with SMTP id d75a77b69052e-52d584f7ae9mr14705421cf.9.1786441495502;
        Tue, 11 Aug 2026 02:44:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be2aasm3130269f8f.13.2026.08.11.02.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:44:54 -0700 (PDT)
Message-ID: <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:44:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7aef18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C7yNWf0h3UZFXk23xoQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UAyeSOTAAEgj-IwhCiycrRK_MNHSO7d0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MCBTYWx0ZWRfX0rIPo3rnCGVO
 KcD0blRnVLWdaD5gFORNwdJ6pHk87fon9L5i/Aavpds6cf5WzOmISt8EGKo9mNzBWGlwkP4XIGM
 L38vP/JMXC9WifgpRKSEjYNGcdT9Is4=
X-Proofpoint-GUID: UAyeSOTAAEgj-IwhCiycrRK_MNHSO7d0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MCBTYWx0ZWRfX2iWJL/+/nvsw
 iw5IUGaJDUwv9Qqsuhm8dWVRghvDMVXswhWbzvr17Oy6nifCS6kJGCNq8UDj9AEclPtRQzpApZs
 nokcObtnH8GPEjEIq8iu6XmKd/+rL3rGp8c+Kv9uVqDLzLqkgJmk68WH7LRUXJsPlDkHGY40f3J
 19uqujHWEnRlmNjbjc/fYCxSJSFu6lfTay+rzUal01/XtIfTYz/lAMYd1obs/P0gzGx0M13tiQD
 RVoLAKbdpz720rzfLpUeFvsbbVSvVq+8VUjAkSn0W4jyXdtzYMHM+YjTieukGPB7AGxlIe2Sifb
 EbnGwF1SdpttvDygwouJfzLk2CRkYSkiQxGHGHouM6HE26SLm+ywY9mGaZruiDB4wQkxAR8Dx0S
 8sOKNoSz4bwUwI/OO1xzn/YJnOcVT41oIT6PqcZDLO2Q3+15uRJgPwmpulngfYekbm3lGO6i+63
 M5qgXlQfDn2H9O6dSpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110080

On 11/08/2026 03:15, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
>> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
>>> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>>> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
>>> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
>>> hardware.
>>>
>>> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
>>> wrapper for its debug UART, so this assumption no longer holds.
>>>
>>> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")

I doubt this fixes tag, otherwise please explain the bug.

How Kuno could be supported, as you claim in e10b198a94c6, if we do not
support non-dts platforms and there is no Kuno DTS?

>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>> ---
>>>  drivers/soc/qcom/Kconfig | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>> index fd4d4ecd2df0..5b3c9d31fd7f 100644
>>> --- a/drivers/soc/qcom/Kconfig
>>> +++ b/drivers/soc/qcom/Kconfig
>>> @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
>>>  
>>>  config QCOM_GENI_SE
>>>  	tristate "Qualcomm GENI Serial Engine Driver"
>>> -	depends on ARM64 || COMPILE_TEST
>>
>> depends on ARM || ARM64 || COMPILE_TEST
> 
> Or depends on ARCH_QCOM || COMPILE_TEST

None of them are needed, because this is part of qcom soc.

Best regards,
Krzysztof
