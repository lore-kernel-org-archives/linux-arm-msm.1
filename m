Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A840F72B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267239; cv=none; b=GsRk/9Eqq9cP89LuPJp5hhqQsVvhcXb3EEbss58JYQabe0O4DDUF6cx2dvPAMPNHSY5HXR6fxk+MEEPArtUAbcnt0d3FXNj4JzajcSktaNIpfcpTMlIRI+mLH3ASFOi2Y+s2gmM5mvoSmkTEgFlnTuu2x6yn+f4+8uL/LTCpsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267239; c=relaxed/simple;
	bh=O3ZVq2aN57CDDJqcDeeMkmvA4zgCpKP+7hCd9oVPOYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t04e58oixjsM1rsj6Qoqg+QdztPTku1c/ytMZKNBiQawX60K/mTAIeY+wpjWc7rVKdJ4xlCFM7uF68gbLCjVR25CfKaS049JuyDAd1lS6MXgKTbrFVzS/a65CcINMOa5fjMUQbjgfLNpUbKzlTUCphEbGwLSQa0X9aY00ihT4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LP0vSOce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYCQXMbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LP0vSOce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYCQXMbW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfNh91279204
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CDRoRsm88bQqknBg7q9Dc+jZIAjIk1EGfL4tnHnxT9U=; b=LP0vSOcetlf67NYE
	yN3Fu7Lc8lAUDT/B7GDoMweqSY+1ejiSwJJV5/7VghmYQsr48mUWf2wxP0umRul2
	nBiYijy5wDpaarF8AU6dGUmwXENH+O8owuI/+Fjbm4Qg4tMUQCRUqpyTNYtukJHO
	ETy/zjbLM44/p13a2DatA3Okl4Qu9jiPM8J0ifShqnHKElO8nxC7hUnv2C7ZtXyc
	MrWHfBg8F9eKiPg/yHq2aagWuT0jRaBq64ckImKdij9Q89exJ/4+xeUJmNghuFW7
	rNP9pjRAM9MqggryWXXPORVQijzA1hoH7DKLcKbnKaq3+xfPHJbwmm8z8hq/Ui6z
	9seIxw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9my1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:27:17 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso3025792a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790267237; x=1790872037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDRoRsm88bQqknBg7q9Dc+jZIAjIk1EGfL4tnHnxT9U=;
        b=CYCQXMbWWhZ0rPEZ/5No5CY2DzOafhJ3N4A2kW6FDsbMJtYTBQtOHOaH617RAucbHf
         UBBLSNqU+Q6ztCy95mjM9JdJtxmjGiBVAtmaF63YOI/LaizSLifkqNdRztN3neSNXZq6
         EEZypMyCkq3dPfq1j0OOaa73wl4K4QI4j7z6T+5tOKubYyA6svJ++O8EXis2hm+lJNnY
         gRtzxDzesvQ6Wuan+oSw2ZPboSFHDt5ihIZ/VbhvbMcbqxVzAQRLpotu/AQKEz8Ypf3V
         6rBY0xtUIXKxiiLkzMx0ZYK9K/Kl3Upsa5V3LivGp0wjem/3EWNIZJ2G02qC2GeCVQHW
         VR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267237; x=1790872037;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDRoRsm88bQqknBg7q9Dc+jZIAjIk1EGfL4tnHnxT9U=;
        b=ABmSMkLcPCl1t7X5aA3CfsIUV+Qu3eJw9e1VlzeDkZYrj2vcMiOAbwAd7T3CToKNdc
         BMVmvrmJXuuq4EVvchmRwPNVl/bgbSQZgV0Xum75joGyZDi0hC48DNoBygcJ0vGepFGA
         DWiySkXP3KXA3m++Dt7CGMDmnWPrtk8Wud35SjQMOnRAvMw9qT7DXUkZlNUKGJkAJ8Kc
         3mIBLTWmJQCAbFsq/0e5x3BQwvszBI5phzHQCk91JaeSaC7oR0LuIgsinSFrNcehDVNn
         /GS3PH2f/LeSSiI13XFxQkah3aNOnce92B5+gQee9o9blNW4Tyxs0Wj4IWP1aGR2VQ8q
         hGag==
X-Forwarded-Encrypted: i=1; AKwUvBz+CMwv+vuKiyZgNMCS79udIs1MGjs3ADCH4nY85hY4buAxcb9lBcoRL9DfhImuPDWuj1B1KCmQy2b912CR@vger.kernel.org
X-Gm-Message-State: AFuF++lwCWpyF4zThAqdlj8OuXz54iSCmkcFOyeZnCgTMGDZFFEwZm4t
	ttBvgcuUNV+sTkR2gf9j7UQIfOfOkni/Z7nX8L3NfqbtD5FmOidCwH/HuV5Toapcdbq4jJiA7k3
	gMhkHMeEmBPpXKFIr/6CYx4sd+MiVuUPpIzljaynQJm14E+RjJ5W7qRkMzyATQM5m+vby
X-Gm-Gg: AYBFou2qkaJb9BZGNGXPatR4vG1/bEOprxnN6aFL7dTY5Be1znjgncgpfGZaqr9SP2H
	LAxRI1S/QqnSjcK+6RPbHSF8gTB8hhT7SBJ2uWDURSi9wCmTGj4Gmp59KoVNGpbMxInu2VUkKEa
	Yvs99ffDUoI38VuHcfIGgFIEpeo2B69eTTixgcIQrfO7rkMQ+8V96nkoeNAC7hhRFWVroMBQySr
	NCVOiWu978uhcPcgwCDHmEKAhahOSk6F4/RY1r5oliVGhtghIrBhjRuud1rF3SxJrgZq5HIPQ+A
	2F/YTRQZbH6oN4L1MzNJinoGj2ZNBuH8UzpL19pRitClq74pkcRXCzMc+gnHXTa5swFduLHplYR
	5MBIVu4JMYJbV55owLdGRGk0Mt+LUK1I=
X-Received: by 2002:a05:6830:6301:b0:805:2785:fad5 with SMTP id 46e09a7af769-81783b984d0mr3079645a34.27.1790267236770;
        Thu, 24 Sep 2026 09:27:16 -0700 (PDT)
X-Received: by 2002:a05:6830:6301:b0:805:2785:fad5 with SMTP id 46e09a7af769-81783b984d0mr3079606a34.27.1790267236296;
        Thu, 24 Sep 2026 09:27:16 -0700 (PDT)
Received: from [192.168.0.15] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-816018d81f8sm6712807a34.3.2026.09.24.09.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:27:15 -0700 (PDT)
Message-ID: <8bf0e48f-e98f-76b3-0cee-527af9461ea5@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 21:57:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: reset AHB bridge before enabling HW mode
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Birk Skyum <birk.skyum@pm.me>,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>
References: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RyhSPJ7fzzExX5Izml8TdTA54IbWZeuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NyBTYWx0ZWRfX+7EvWQ/RPLU7
 97RsKpdlB6ZV5M7FcpxidNmRiN2NODnh+K6GnmIkasZuXR+j7ePLU5VbfZCPHR06fAEaIangNZ1
 loEwvVGrckhJuzTgs7fizSpdYCfHtlIyZD6d4jBdgSSd7/H+zQR2ErxO1JiVpiPZiTlxB6IUyBX
 v5fhgnTVSGZa7A4ylgXU6rHemUpgNKaj9i91CigzOWGoDY/Y799OcbdgzqrXyE1buAAaBiqIiwd
 IZOzcB8DZcKQ6YOjquxY3u6/WmUjiyljPr9rvnRNi6Cwq5OkGYdMOOA/9T4gW9g4ch8+74IAgom
 SF6aygcrApkVQLNlv1G17bCc+wiyBV7tNXzZA+9sRQf6dznNKqbkV6BlVToWyruLD7RIv3eQeCF
 GTwOxtYXcuB+/eh0udoNdF5dvtmQjP0lp2aWtTrgtzXpFaZnQqch0JwPsGD6LSc5f/Znma4ToST
 LafA1/XdaP9WAIYfHbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NyBTYWx0ZWRfX0FrDfv6tp75T
 3lKv9NBmlEIaGdjQXd834PHcww2ZjvKpGBYcNA5T3KCRJDQ7awe6Dmf/oRGGLdxXaIvzGKviri1
 SpybAKhB0PE5QToS15w6hxqcJ0zxGk0=
X-Proofpoint-ORIG-GUID: RyhSPJ7fzzExX5Izml8TdTA54IbWZeuR
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab54f65 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hkYZVY6NqzSJq9KjeRUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240067


On 9/24/2026 8:00 PM, Vikash Garodia wrote:
> When video power domain is switched from software-controlled mode to
> hardware-controlled mode, the core may be powered down without the AHB
> bridge going through the required reset sequence. This may leave the
> bridge FIFO in a stale state.
> Reset the CPU-to-VPU AHB bridge before switching the power domain to
> hardware-controlled mode. This ensures that the bridge FIFO are in
> reset state before going for mode switch.
>
> Reported-by: Birk Skyum <birk.skyum@pm.me>
> Link: https://lore.kernel.org/all/20260913194707.91885-1-birk.skyum@pm.me
> Fixes: 95a337f92f0a ("media: iris: switch to hardware mode after firmware boot")
> Cc: stable@vger.kernel.org
> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
> This is tested on X1E80100, and is applicable to all VPUs.
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index e4847c1077097160cfc8324e807b4aabd9747812..2ef8004e976e34ac3e5ad1971894253fee77648d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -311,6 +311,11 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  
>  int iris_vpu_set_hwmode(struct iris_core *core)
>  {
> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
>  	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  }

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

