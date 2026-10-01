Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF52DEA74
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829037; cv=none; b=M925bRHC1AQsUt6IyxpVZ4ZyrhR4C69mrhjFALmWQtmEF3+YqI6MuKfEf6VGLifucN6y0UQQCa7X2Fk53Z+e4a+JE/WplHjKpF74/Aa1K2XkFlswCeoLTuoNwG51dv7ELUjnglXSZB2fmMbEBlg7gn7QVVrMBVPT9F9CVntC4qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829037; c=relaxed/simple;
	bh=A+HAuPGVEEtFzzKIx71J1O6XHYUXXh3Xiiqvz/WV3es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObbvYfUOKqALx3rdRdPCgU6XqmuzQcOuf/k3rEWThHDcwEX+LeXG6fnfP7tyyl4OKw4tlyWPw4OqwlSzWJXv7T+MrKrDIjq/2lNpDhE73I4PpHBvliohHAzzAXv5vFwJYt/Mkgv58Mq8ktQo8aySRbe9VGqdg33VZlr4RYndaXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2DLjMEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Og0WSxhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2DLjMEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Og0WSxhW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gSPv1754536
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 04:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=; b=F2DLjMEmYfSjhk2X
	dxrAswtz4KApnEFFKw39luKImAWqHKPw4tEggoxkSQhe5gP1yTsW/CxVO5ia0mSS
	Qog083o9xcs8b9kX4d7rZL6w2QNQtXvUuCXy4+c0Vkonl94yIfIldcQy6fQo/JOX
	SM5rQjFR7kg+zHYxvflmKBlQCZTF4i20rHBIoeS5HvLRym4rJrBkh/xWP2TJzIjQ
	pMtnnDVrNqaY6/7CIovA8QqshTP/hxGxMJTQUibQIU1m3l4Q09Rt1iCLvbqctL/8
	UuPyF9a5HEGDS4tp8SG7l5TsB/Tc3jnedS0dNeHnqLI0KSjHxhaUoILd8oWEtCv9
	BnGiYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vtqkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:30:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4357803a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 21:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790829033; x=1791433833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=Og0WSxhW/ttjBRdrz3WxhCr+IikCQk2wXDODG1bBxQh+mOf8h4L57UuZksweD0lrmL
         IzkKL1VLbxlYRMiUUydzzb13ak6K1fphOaBCIjHXtVWNTXnOy7QRmE+B2ooRuDppJ2eQ
         EDfKQYI4bActl3vHsDbNwcOghQbTtz6M1VFT9lKYxBkoy7eT5yTHwJf8s9XBxjgBnMh5
         +SjKcRjDxev8A78Xcj3oASmSCrJss/S0kIVl8PTlABEzYJb5jmYBIOW0apklI+KSJMdX
         OnqOM4i7lyxcQj/zKly8HIYjjEOpit2Ez4kE6pZEoZLHkWsN4E6fHLa4k/l2jrpiG3FS
         i+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829033; x=1791433833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=Flzz6w8pTjnmMpg2UXqrV2DJ59vE+64Q3k73QizVN3JjVpRE9IOJVJYSKjlmIPMwc6
         fgjKC4IjmizXnhUVsThc7f3h7wqLlqAZ39gTRlyednCxCAkR9P5u0b1Xh5JHorS0Voqi
         m8NzZ4r2aEBBCkviTVWHVN8CzUxZyVt0oS+CA4xWIlSfM3ydgapRjf/GnRL/aIzTOzzK
         PA2i+jJdlfNLTdyBgTxOfPZ5pSubdSOgHO1nKa5LkG9gqGOBDVCh9lRh1NACHGQ7iU8m
         Fk4hCJnhtx79HtvG9AjkJkWJx/6wJ/KiaMbpAp9/61Lv9sm79U9Jk/bq6C0pGDbHKupL
         7pig==
X-Gm-Message-State: AFq9FYKnYp7/hhwb0HJ3NKO7SRuSwp3An09iN8D3DK+GOXWMwrb1nl5o
	C9IURr+dad6WlKb0X1iBEBPDdTVqlr1ZbEfJzCmVTJubdKwfuG5TnD5YzgzHY49BSKLx+HNwRzT
	qznY3SRvn4yCYOL8Ah8aP94RsYljZaASpqHX4auJ1uIgaehn9NoDy03GeYJiS+hd0nlkphThPfi
	cv
X-Gm-Gg: AYBFou0WneNqnzEUTIuGWS1VFmrmfF0OfeDKgXhPJOfUBO5MD3nk8TpsKlXnAagoF0r
	UJCfs/Bj6sbwl43gJr0DPyCZCcpXjiEUzDtliAmfx2RFo89KIwKXZLlVvNfXQ7GnNDGy0+n7Wl7
	Ym2kRYgdC5y6MRgOZiDPwdzUvj8kG1vxlWrPo9fQ9qUo9aarGxaFfQqwAtKsjZF4iWcRvqE+h1k
	skwhdlBuu/0FbcRj2dxVuQhgwZ+ozNbNPj9RBbYu7d0fyb3yXpEQJ/DqmfkuTrQgdZEosDco/ZT
	sOrU43nB9EXe3Hp5idAnJwGQaAvF3Pol8PC12DFAcolz7bvLsVxaJxJ41rPI1FeS2VxTeHuZYIB
	kQcPN8RLvKxOlV0zMyz4nqgqWzqkVuA==
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358359a91.67.1790829031747;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358336a91.67.1790829031165;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4372f81sm2370864a91.4.2026.09.30.21.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 21:30:30 -0700 (PDT)
Message-ID: <3b766c9e-fcb5-49bc-9238-48caa085b5a5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:00:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling
 support for Shikra
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX/e2Z9o7QWX0Q
 Ydd8XsbRSTaUmk7vaBWgbwV8NbiZq64a2cMGK8762BaoPUhhgcTsHmLenPm9uUrrIWHltY+3MKB
 cJj41AhU33EuvMJB/JnDfTt662DHv+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX6g6W5S9ACRCk
 awmrEC0bsHIZ9Ow7DDdTOr5pMjTnacOjugW+b8HusrtJn33acuAUmxEBCdlqxbcRdEVRhCLe0Pg
 x5hKZg3G0RWKoTJKx2tBTBFah6ejLfR3V8aAc+0yWMpeyfscDvaPCNTqZvnsirgBS3L7oE9HVSF
 qrB5iyLEam57zHAYScObNTVfhAW1Zgk6eYZven5jWrPTP4rlDpJlimP7fJHvvjGo5kHuHnpRO5r
 JvhCW7wqxOZ6eo1hrlQRbTTGIHtLgQ9dJtkXvkJd6Mlzq+yplDRSRH8576yMqgzcunX0WbQD0lT
 BwuZZ+pjpQXC+1tB+UtzDkCFU7Piem2mz/kcZGEidrCVjkJ5i2XwlGPLoyGkwwgKyTNhMT8PVaQ
 V+6QdwEpuaASiltCo6i8SIqiJuU7zpnZlZFRZg/lyBjE5KiB1PNARHo8c+gCkipAKaPRitetKtb
 w/KRsseF3NgRd2kls7A==
X-Proofpoint-ORIG-GUID: N8kIr9f257ztg0uz19YaLX4ubpb8bUyt
X-Proofpoint-GUID: N8kIr9f257ztg0uz19YaLX4ubpb8bUyt
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abde1ea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=K35ozmOADcEJOmzUQUIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010017



On 9/11/2026 10:33 AM, Dipa Ramesh Mantre wrote:
> Add QMI TMD instance IDs and cooling device name arrays for CDSP
> and MPSS subsystems on Shikra to enable thermal mitigation support.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..3daaed6ca596 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1660,6 +1660,9 @@ static const struct qcom_pas_data shikra_cdsp_resource = {
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
>   	.smem_host_id = 5,
> +	.tmd_instance_id = 0x43,
> +	.tmd_name = cdsp_tmd_name,
> +	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
>   };
> 

Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

thanks
Gaurav
