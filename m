Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E73F8254
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786099456; cv=none; b=sPhqSsOAbIq6sNi1f0o++EOX7vugnnmEHU2lzeocA+41mHLYsrwmkNgJo/w4cdp6rATVURilrVFW/WQzpRE1h8M4x8LR/wokw1nr6GqhF+/TDYI+GTSMrIsITHW35fNEkjlfqEmGFfdfUOtrIFu9bKOZT5YjLUsGJsHVg0XIFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786099456; c=relaxed/simple;
	bh=8+wEpsin/yeuLn/fb8ngAOeIi6+WvuSNR3Ik9m8tebk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmwEPIRzcXaiz6Q+15Hr7pDliPZt+0gaGEPi1l78aJd7swA9Et5/Tvc4GcA/K/JasE040JfnJkRpEmO0Nm6HCHnNLnqtjkN9rjdBN0QVxnH5DLmUCEP1RhQHUnGd+DmAWRZ55bDFXeDmMGangAFjkYEbfW6LTgKdOowrUvJktE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdqiV1qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tuvo1IMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdqiV1qa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tuvo1IMy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C7Y73576212
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 10:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma7D+aNpc8m+Jgpg127jyC6gD4giJWqOzfXGaQO/jUw=; b=gdqiV1qaoN4eFLuY
	onEeWN+hg+OlvIopwZkhi8/h6JDqcaICd7XhJNJfJrD7R/MKIS8lSqPJLsmnYk/H
	RhNBTWXoHUKho2nEBTM8ykTX6JBhFt53HFL/QBb2D3hwHaz+CuhgBC1sSpejtQLw
	5IoBLQ6VfQQTPEN1dhTJ3L0Zw135WjrFmSvyYXaxe244A+bXokyXBST6MVDzcaGS
	wMX+Ap3nlFwFNFJn9sh2ocqOZtmlm36TP5jCZQTxFgX0/BAGSn8kcaN+g6pMKv2P
	UBtSVs2jxLtcREE2ORucEnRZ7fKx5SfhoYEyHknsm3BybE9HQmtMcZm9gHf7IYFj
	OkUIJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu0ytf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 10:44:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so4014162a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786099453; x=1786704253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ma7D+aNpc8m+Jgpg127jyC6gD4giJWqOzfXGaQO/jUw=;
        b=Tuvo1IMyY4M7E9RmGOOf7tk698Jf893b/FErdvtqvcESz43hCdIsp+81IeCEOkSyPY
         2y16v9RC4x1DuoXegw+c83S2dFf1AgMmRSLq/7edXZG2qri2ZdqonoTRkSFzm0yUroCe
         a8srUWQAItFiP3kdYQIx5BdGP4dBfHtRUa6NZRhQoNOwge81IkoDg3oeHMuEJlCf71kg
         p7eF4KnnYfUHl/vHZzegzHoxUgG0pAO8rsbYwg54Hp56acdelFnlYXm8GbwTVm/4QW+b
         MgByGmiI/buTkI1PjZPZ8VCbt6BSS6+NBAL7zstbnVZf0r55goQXmlclPEiQeREhGRZ6
         vL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786099453; x=1786704253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ma7D+aNpc8m+Jgpg127jyC6gD4giJWqOzfXGaQO/jUw=;
        b=sUD9bCrzUoSldEmWnYPrutP2lDEav/MnMgdJPTxfkVT3YFKM8ry4PK3M+IywGwmSf6
         jMnwR+ySlRdi0/ajxxCgr+1WjuhZdV32B2nrBdJndA+eZwq7ieHTITuOtv5pu2JhayfI
         VWyHDg2cIaFnZ8GvMPTIyTRH1ekKmbDnJkeSgBwVLGMe+aWAL6YsnBOs2JWw/DYzOf1Q
         M0vYJ4cT6sUXQJkpaMyM73cVzIKuH+C/IgjNgDjJylpjuiAYnT/SazN7PhstcGPyMHrR
         TALsMkx/KK1pQ8xIm+6vYI2uszDyUAC3K1z6xXNiBQI0BBjToA0wfoXZnl2BmQ+XAWIy
         JgSw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn7ASWeyTkGFvGsLnEz++smiuLhU+8UlOjuoTJPzlYhsQqfJNvdOwy3hHSZqge9Q5RwbeFZLeJrn0Xtxbr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4PKNcpRjb2J/DALqDrFTm16iRvcWXIRwnDi/fpgP8w6REkg5V
	IO1rxmKcRKNCduaA6ZR+Wy5LK1j9ePevlkcpNpVYDMdKlrP9ImEZvWwHkRC8uUU46x69DUnm31h
	To4VIT/Lom1y/pg9ayoZAZFNr2LZOyC+HjO+VGgaeuh6s6vtNN7gPePVlMrbGSfDzqNNW
X-Gm-Gg: AR+sD11EZpTM240VZd/g7tsICk83J3+iuvmdIaYjvjYfYf/BtC8d7x7l6hdc0mmWPkZ
	d1XzUYEb2TSP9GudhkdBFWXeq9CA5t4wGoZdEQMOW3n50IYW+0VWBhBOPfxzB8Wv2JFOcB4zCU9
	/rjA8M5d+K1h+8/yNEMox9qlJz9jvaHuWDjH5DnERWmoid2yByVqseIw4cCIBHXcs3akneiimrI
	KBuin3r1jpDkYcrwcrXshqUhuDoI9AU9We9bKT7QJ6QTHWkM36d0GWcPujm2wgcfzGzvSy0jPgX
	6RUPIBMB6z7SofCYGuPpLjZ9y8vR5ch4ooK3em5+D0ba68QlmTLlQTaOVFVK58wmZ9BDG6KvhCa
	mMwGuE97+XLGbse1iiUUXYr41SedwjA==
X-Received: by 2002:a17:90b:3c07:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3926228789dmr3195129a91.17.1786099453569;
        Fri, 07 Aug 2026 03:44:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3926228789dmr3195086a91.17.1786099453177;
        Fri, 07 Aug 2026 03:44:13 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39086164982sm4410327a91.16.2026.08.07.03.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 03:44:12 -0700 (PDT)
Message-ID: <d1c383bf-d563-4c67-ab9b-619e7161854f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 16:14:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PuugxsMHa7_WofmbN4uepPUHS8oSEc-R
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a75b6fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BqbkvxNZUh3vXpf7O68A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA4MiBTYWx0ZWRfX9zPaXahowo+3
 VVL5CqPcUYgherDdPUf9mUbzmnHpzjzfWA6FF32VntqXt2yN+9aMYxodX2tWf15x5ZbseV7GOnW
 GNxgosNLCYp9vMpIpjN7fghdRt9kx0w=
X-Proofpoint-GUID: PuugxsMHa7_WofmbN4uepPUHS8oSEc-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA4MiBTYWx0ZWRfX+1s69p76yU9R
 JIsYApp5AloHs1SANZfkFUcNZeYc15Yw7povjUUEWW/sG5c2CN9+MTqJVGOeOUymNbWqeOg/R0p
 jvDhUvHVBf1YaSRc0ETksZ7aYaVRulUd4qvvx8aXAIEf7HIYDXSWNd7RC36XWvDJAhx/9DF1pva
 2uVWVEck93vE0OthdzIUsnl7VZj7oxZLaLvPbgMXP6886Hqs79euAdxIo4boK5zQ0G9M2DJCI+V
 NiFIoYMhNvgtammRhCeVOLrDxXw5aVZ7wlTxq3uQ02QZLG2OazimTdgxGrH12DHqOXPyalCsRyx
 O+dC7IkKlXZIsgK1EWflLfL57FkkPpV4HjVnF79jjW8x6TmFu0akrpFQJKazBZ9YjUXZapDigIi
 Ula9vIjKAJ0d2Mj81krfJGIR1uP/MTgWhZvZwVB36p+MZZQE1oBWfpTVXOJ98ocTqvjJrCx3Gw5
 lROPyrlBioprjdslw5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070082

On 07-08-2026 11:20, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 590bd2432d85..2064eed01327 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
> +			reusable;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  
>  					qcom,non-secure-domain;
>  
> 
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
> 
> Best regards,

