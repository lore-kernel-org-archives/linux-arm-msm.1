Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2153EC829
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330229; cv=none; b=N0P5xjtdgNk4S9pGDlkE1T8E2s2J4RuE3zdRZhrTQxFNp0c/wHjWEWn7WnATwVrYcsMgQinGSbOYYD5GgODg4HUKs5XIzfkfFvMHY5+SInE9dWHb9oyTmGIwoTimGa+BGAWZl+bHeYXlRg+/7bhY3gcq7oavLtnWIHR7GNRIjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330229; c=relaxed/simple;
	bh=2GSHbF3YXVluZAKbyVS6Nt6058MWLjB86rDBXAHt+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJdysypy/4GX0NW2mgtyxU1dygdQYpcGp9sahN82qiKXGA5BF4WHxnobK3e7Q9hdngZgdDyCmDiW9ugaLpofqGvCMZWwijtFM9TUMY5gL/K1kVb3LqGvzQgJEkxWkIV7nau5SsXt3fd7rAL/bjjokJTrjiIl9WcIyI0BWOz8Ujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTXR5kR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFDG1V9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTXR5kR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFDG1V9m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4ZGf71195211
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=; b=gTXR5kR0Unq8X40S
	SK3/+9fH6PfVZKnE0FJlMV155Wu6TO4ZZuSwvXLTv+M1jfhqhDJp3mIy+FwCpTHL
	1tOHkn8r8eo4WGzTk0G31+3r+vxerLiy9DYM/y4nrLR9NJw8P9dj1lYUGeMKAcLo
	GARCugl6mbkfU2W30wBfobo5Jl5Q29Fa42N/KuSPBAMYQPzShV4PaWNSYmXPAdAb
	bpfVv+VtWVXCjZ73lg7ZaeY+lpkba2FB8K0VvgBBm7uPW+bL8DHyAYMX2NCOcLDs
	RZXEM2+ZHu9wADkkMnpNQ5Enl/NlKEctETmG77REYVTB/ivt1tdB+TpIErJ1Ele7
	pBIzNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jxrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:57:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3282d5302ffso928552eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330224; x=1790935024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=BFDG1V9mqWydypQe0gNr5o2ETM2XxrarfOoBjCZDerEuarwmZPH9fJCc5E7bdMWCXe
         wvd58io8tHC91u3olcCDIYrvNxqM4QVI/u1QYrTAyCXPhK7DkOqzwvb04qFpHIL/TXz7
         fmAK4NxBNPltGbMzhRCOSGgJSB8LKFUbLplxepHnjgN3WiBOr+7uy84F8ZJR9NP5p26/
         RjGkoibgFLRlwkMEksQWqEnHpIR8NSFV9rcbRdhgsOMKsbGhO58hsF1SoVTwOp2IfP3V
         A/tf4uJAZ+SnLl82REVcY15KzPWw+qk4QmoA4G+cRSV0igh9NchMu2TgyiCwq90jiheB
         Buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330224; x=1790935024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=f058gBQPMESVwLIbpQQ0cJ+/oQlAfkL1YONFf25BlHBoK4gaNVJTnXIoIS2QJvfdZ+
         GMMVcBYmdQvP2NyINmDzFdD3XZwlhH3W5jZ+w48/kighSRN5YbNSOP9WXsEtyr2in3pd
         2vvoJqEC/pSSRdJG4xeXznCjcJMKicMXY7lMBzwKq3AmbW0tXE7WwBT98VivjY4s+AqE
         iH7OJguNaUz0F+0Wph1jUzqGFi8a9UwWpWdCtSG7GsnbI4zRyvIf1F+sahZfrw9xmpTD
         9zkIQjZTFrUrEg095hSUUzDjUkVQuScSdc2KZOjjxLd504HVND0jwd7cjm1xpMNoLMy7
         Y6IA==
X-Forwarded-Encrypted: i=1; AKwUvBzhbHowvsAIfgiElmWK3ZMPFsNTqZwn4YAS4nM8zUuSHz8Q3O6b4VAqp+YE0MIchavg/uqX+QBG6rBeLjuk@vger.kernel.org
X-Gm-Message-State: AFuF++lPPMZDKF/zPx3lcqnXmYU+17jPzzuNpcrW6+TjfCnNDGKvBnYu
	pCw3xRzobHlBS9mj+UBDmQI08Ji5/cP08GU2RLmQymfH1GOCpwounCjpaO5/SA/QnmY7VNLFN4i
	+3hVZDFHkkUnIuoZ3LgZz7sIf6lXbvVvxM8cApGwAex0penoG47KkJmnRkoCmdFak5x2f
X-Gm-Gg: AYBFou3kXtUq3MNoSJxjbx7s0kgMY6PF/pXTU9uf6eyhg+3rOFQ177XdNobtQeiHuxu
	menvhEWvs8Ifih2EQYKwFUCQmcvHmZtYCH6rm+XUjhvPl1oRSU3Whei6U+QC+qdmP4VkFB9r3Nc
	n73NOZONu/omBvCO9Xf31XOfFr64wChMe0uVO4/z+exFRRTVejkt1Xpf0QSWGNR0YuagzxCHDqo
	+Uh0Ni1+VWJXyjmb2Tc0fC/AiCQU3oJhOP0H1bFfKrwk/zX/a0+Eq8288iliEA+Dnr+QeBodSzP
	zwoLQeP6TaWt+4OOa44mXa1DhATYs2NHFXq2UOUFTK3BQ48C7A4Le0L/5fdflklPcUM5Ki56ZiK
	Q35MRoxtqoLjtT64=
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802332c88.2.1790330223872;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802280c88.2.1790330223054;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm4731779c88.7.2026.09.25.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:02 -0700 (PDT)
Message-ID: <5eb29865-5d14-4fb6-9d79-5e2af6a08c8d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:26:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JJpaqKsE4IZsCgtWHBMBqqpNGq1-tTYK
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab64570 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX0F3NumGqWP/P
 yfr249b45N+Wo0HFRIFsPdp7AGiVx5ZKTZa48Llb40K3c4DuzCoIiL4e+hhFZDut8UlpgzgMhZd
 zDnHj+D2h9Z0UZq7QEot4sDSur6WcYlTx4FtjQ6bQpepJwcSCAqgYEcYr9gWVKCLMEUS9fIQb3A
 /aIELTAGLfHe1SUxQkv7M89UgWp3lkDw/hgvUde3RLIZu6qNMZgf6XRsbQmmNqOa4K9s79SXdj8
 FB54roc3JoLj3fC+2F/vrgG4v5ExdziiqhC0ZBuFvg0gONpVpqTNnFSXBlK7aJvoFOI4OMELHb9
 C8kahP61+KR7ryqeEosgahjnzocHEs7PCUG1w4gwC2p9aUZlkZkNPfnUzLToDUd772CH/j3eCm5
 /IHMt4n/UzrS8KZ39QMTtiW3D4n33XhNqPHxkmInGnx7Zf/rzsL4k9dvfebA920lD72H033vwyx
 gnHhcjG646zadmPvPDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX/ZvHJ50zSU+w
 7RkgH6KnbBLsy7qWnpi4bMjebPCnyLwahaI32Q6xwmQ/oByq8kl8/J6XiVDW9alOCOmr9h6iwxq
 zqZa7mnEJZavbQEiKOpTnQtBX73bdCg=
X-Proofpoint-GUID: JJpaqKsE4IZsCgtWHBMBqqpNGq1-tTYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 2ad26902ffe6..98dcf57652fe 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -442,6 +442,12 @@ &dp3_phy {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
