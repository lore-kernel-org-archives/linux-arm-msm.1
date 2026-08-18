Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C27463B98
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054386; cv=none; b=VbQ05nn4aVVe10oE9+ojwf7RMoynI5YmZ4qKHCKM114NYxADwwEfqmnIvwufJxZrEVB8SEJjt8PYQccWcP9pCFeKiUq8GFCmqoFHc6rd4mqsB7Xb99fkCGAYB6IlNxKMfiFM98o/1UNaqQtplCcogXPwJ1JP+iCasJJ6jptxsyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054386; c=relaxed/simple;
	bh=qNHziLb57Bey3x9iNOwGfk8XQT2SYeQO1O0R4qYBQ5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlNk/rLh7q1/Z2zKgZNvcD7pGLDRMfLlfvBECLgTqlEc2EUMRpy9pukg5r8pItLw49Ji7Zt2NK6W+O8adGfjTBE9ZRS9O337ibVQAshwxhWa37mWMnWh+bSARIX0UVcaZ5VgSnCXdQ+1KERClfCHoYRLN4xuTeEkUFTrhLI3G+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWCt78pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSAf1Iyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWCt78pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSAf1Iyt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABW7U919385
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OppMlgDZ2oFz73F6XSfRcoFpxG34E2g2la3nu5hF/kk=; b=kWCt78pz9fmtZShQ
	OC7Xu00E9soxM2umLaV9T6PutwQvtNXktN8/4a95ao7m9X0YHUQQ+eowSeydXW7S
	uhZunvVrKZzhJtwEdaeONdj1OtDGjWMMpH+F8ZwM2La7gt0xTWsLAVVMHBgaP92q
	nld6CGfwu7gcMMjFo4JPGga5mINmZFQv/eSqM0qvWNyXBOw4axebvWCmMZoC7Tjl
	PX9SsdxhmPWpvGMXP0M8QN5yd/QDDbBEPq9NBOyTMuWO8tN/gf0ze9wBx9Do36iO
	NAma1E/H0WXtM7N0g0LsV0sqaI+ZLE/09zLShnWjwv8I5Haf0ym3eQH0G/EgFS15
	3SSPkw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb18dxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:59:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so1516051cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787054383; x=1787659183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OppMlgDZ2oFz73F6XSfRcoFpxG34E2g2la3nu5hF/kk=;
        b=cSAf1IytSZIG1VWhiBrOVaw5hlGH0nkdh8AIvcdKuqHVg3hzfAsdT+u4h+EM2I+bgL
         AV2K/9HsEvyycQhhpGD4DbYjE946kUwVOq3isaoy93w3il+4F1f1GFDbbDOduv2hVH6O
         KyGroaiYlvjA/leSsnvCoALF2PfUqVr6AFbgF/HlxkEjjfp5A7T6ydR4cWOyW8y+km5Z
         3hkiO6peR87k/vD0xF6/UIYlmYTEsTyKrWHpJzbKp/LK5nliDSQiii2glSprinA7gJBC
         IZJhql2nOnCK0WCakLuoyHpgKmE5PWLv4Ym8BA4cinAlhZoiLTRGIyrJlqGqg+D/Zn5D
         0bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054383; x=1787659183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OppMlgDZ2oFz73F6XSfRcoFpxG34E2g2la3nu5hF/kk=;
        b=KgZLivUkWCKXutu3FuzXtrGfeNLoGO49Ld0Magrrrb939CM5vIgz0zAU4wfLQygW9J
         +XOcLKdqm7NlESaPpuQicehWjqCMCiNXX7ngxlYhX1oiWWGyrasrogUFH+ZdHX4x7M8k
         H6djYFdd4VTHyTEePqz2fI+W9T63wRE1rW9Z8ba3yVoip+0Ej74x9Oh1H+xL3pxWG0f+
         4RbXNWTiJZT3FgDxpBDohUemue0YwakXpXRIv+7QUNfYsWybatfFwmHebrNmsuq5A+re
         zMBCiWbRufHMeAFz4NgtFJl2zkqlHMuM5FiCe9YYiTOfmhNgtm4MYlmiYhgt6ZUcseUV
         EibA==
X-Forwarded-Encrypted: i=1; AHgh+RowNuAHLxfG7bTz2+aH+gXzQttITjxxRPPgCZ080nAUhqzV/FHOPOpe7YQSOFEF4rikTrmN1DHhALiG13We@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSjKW3p33YiyITxfEWwk4klcRaijqihgU50x8avXiFPsJ5mZt
	Kt38Qu+KfjXVWRlfdv7Xq7non0ZFimTh7kfeiKIKK7DPdouHpwObouIw2LEmTWtsGB1R/rpG19Y
	WQCzcNe1Fv+D+uOnbHff0kUO3za5Oq6As2ekGEAnuJJX+kPy8gtuuqgPbQHpjG+hXIzv9
X-Gm-Gg: AR+sD13MrNgXKCYMknGTjGvrh1/z9U2JnuwmZzxe9gFBJRgdi9nNjy6usbfYusNfGEW
	R9DTypqUd4GoYBsSTmsBNkEMojvTEbDB/1CnXycmh/xLxLLxU3wkO093poi5rY/kNxm2KTC69gP
	tiLmlvoNGQV+qE8NOtp7ilZhU0GcQuoXF5ntOlro5SbbJi1FV2Enny2f926wjQ01F7aLr+SOfKE
	ggTrYUHN/9r6z3EHKTgJWJJW7vofZUzIOzDVTo5LX4pnYw04BBYLzRY0Lt9iXL4FS/0cZt0wljB
	TsCqAyF7/kROmvyz5JWcgUg2wnOMWkvrDEo2HSIbyIuTxWi6Ht9rk5RrXSnszWeIY8CvH1nkfN1
	ulFKA1g+FAXph+0qbYQe+pbK/
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr219968961cf.1.1787054382761;
        Tue, 18 Aug 2026 04:59:42 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr219968691cf.1.1787054382179;
        Tue, 18 Aug 2026 04:59:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859b274sm1656312a12.25.2026.08.18.04.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:59:41 -0700 (PDT)
Message-ID: <eeef2c57-872a-4b8c-b781-54fb8d1db9a4@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:59:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] i2c: qcom-cci: Support per-mode CCI clock rates
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-2-e1d80da54e01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-2-e1d80da54e01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4OCBTYWx0ZWRfX0te6kKSqQ6AZ
 iziPwggu6aMyq/TzHEct+szaOZA8ym5DWu1vDsN0WM7wwgukOu3/LqkeNDSq/Dgzu834GVGONl9
 Vr5rJHOzzym55EN7NnwG68RsvW09MjTI1UpztY9KP9IyL2/E2LGDKw0jfQbD/g+H28HeQfR3o/Q
 j6gbstWocKwIR1V9LPJevrcV4qsuokPzYS51tMvsRXhsoFAd+ELifytm2nr37dF2iHCoDhVKtFH
 HfS8BSmAXau4jZWM2hsT7+fj6q6sUy45QZxLJ3WT8Dtv1tQUqd0YbLoxyYa7ZxPgxGGuhtgt9Ej
 BnPbWu9e4a5H2fRjd/lGn7QN0B/WIdZu4uhheFdUAcwPEqwNEPP4OqNZtledNAq2l3XJm8Mb9fU
 lwfbn9ST6EfeEEKN+heR0lEoJ96PVhwhM3w88TgSKma+vIuBEsEQxPW0qC676zWevyX73zfALnQ
 rpYp3ROz9QeMa30Qo6A==
X-Proofpoint-GUID: fX_iIHyP2mJmrqXnpJw4JS-VaBau1s_-
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a84492f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fb-0gDls0OKrqtmrxo0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fX_iIHyP2mJmrqXnpJw4JS-VaBau1s_-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4OCBTYWx0ZWRfX/PEZVoKasBDb
 imnTEQeqy629Yxq+V3oA3aFyP6zdmJSiQOFVTuR9vz1OB4v8yT5HHfr8eFEWA6Z/BnDyu86wgfo
 k7vwAakbLaBspSdTEoJ/zFXXA10fU/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180088

On 8/1/26 10:10 PM, Loic Poulain wrote:
> The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
> clock ticks and are only valid at the specific CCI clock rate they were
> calibrated for. Different I2C modes may be calibrated for different
> rates, and the single CCI clock is shared by all masters.
> 
> Turn the timing table into a two-dimensional [rate][mode] matrix so a
> given rate can carry timing sets for each mode, and select the entry
> matching the currently running clock rate at init time. The existing
> per-variant values are moved under their calibrated rate (19.2 MHz for
> v1/v1.5, 37.5 MHz for v2), no timing values are changed.
> 
> At this stage the driver only validates the running rate against the
> table, the timings are only valid at the exact rate they were calibrated
> for, so if the current rate has no matching entry for a master's mode,
> fail initialization rather than program incorrect timings. A following
> patch actively enforces the required rate so this becomes a safety net.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
