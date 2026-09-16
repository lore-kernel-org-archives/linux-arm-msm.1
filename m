Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E61490BE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549853; cv=none; b=kpPSr0CKPuBGhED8t0L4pu1knU+jgwCcyRY+hagYhL+kZFjeavBchsLzv9GoPPMEfCLABX5SODwqqPCBxR3+2G/UsFMbQjkEehz4YcnYcZqmBIRR/ksi76P5xQcP2istEH+xgV52ANHCGOorUAb/fFOpviCmB0mfTCUF70UbYjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549853; c=relaxed/simple;
	bh=67K35Pq8eUdKaLCHWbihTSEFG4ynrtphpaQ5hmCXCw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyyfPPjH8tgageU2vJov8Q0Jfi56/Lp8XELR+1UFZZGjQb4qeerYblx1fOlQhbV2K1qQ7uNbl7jJ//p2a75zWPFrTKk57zldSs3KF/jJ+Ip58xXdmgr6XIWWfeg0f0udq+XoTiQ/YTyEs//JlQr6EKeifF9UxSrN2AeNRLjLkJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkOPa/Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7q1Ydtr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkOPa/Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7q1Ydtr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qu63377406
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=; b=RkOPa/JxWZk4ddpS
	5B+Z2jMZwFsdTGJnBQQ6W8q6FHyv62SEb4Q5rxc/Vovo792iu+jvLOil9AJdrY29
	krF1CCiG6P9F8kQN0XHR+AfX6Q5HL2pXJXDIgKyn0QOb9xTOBIcFd3iC541yIbdi
	bWtqfcN/xv8QxbyXJWI4mvqgkP2/FfIlA3tViRwEGJwZoneGfFXEQrJn1uR8jMpz
	ldfrRetL63GYuVeyaW+xAlHQdlhdj4PVA8zy/Q9LJl7QVjUwvqXJlxC+cCLX8FxC
	FYoiGmYLgvEdLVSI3CstwhKR8rYoDtuqVrSoodTLIWQ5jiEneuxeC2KqIDczy5WG
	/PJu7A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpaaty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:10:39 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b325074c26so8595109b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549838; x=1790154638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=;
        b=O7q1YdtrYl5HkolrgCHuEYpL64/dzcRezT4kAqbHHpY2wKs0yCwPOi/9Wa+8G+CRJf
         39F7efzNf0PYoNgJGK9Ws9d9cBTU0lgQ7DQOpoKcHB2j86rztnerfBdFgYtsnBfmybjO
         aVk01PFL45MvJOL8LykJZxkJBC2uDCmebvFwkMVfdJfZVF9J+mOnznWWujeYuuY4+bNY
         nrnQJ3/hoVssGLg71bpdiqqutJ1NH6Tof2jnxJcwpQvkWQqFT1IXxF5j3QtCObfJEXkx
         r5awL1KgAUakZzGnZes2QgHQNnLG8Y9palWYtXNV++UoFAc8h5yJGNHgXBgMuW+Ajomy
         W7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549838; x=1790154638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=;
        b=uYJnxWnGrkDB1JSiG7n9RjYIhEcE44yOrEIg7oiVFu63b05bN8beImdzjM+70ZclRn
         pObmTPkNXcdqEMG8xkeZsOWUeGtcQt09M/H9926mz02zyHPQ7+nF/joH0t+Az/uRSqff
         PAuesspq7MAxw2H4B5YFW13vYnntyY55rKJYlQ2/qeo/Oyfde9JY+n/Z6S3HAS03hyz+
         6hkGyrhgiyIGRpt3W0vnVjBQfXH1zGi9h4Hqpf8I+WU8uTtdoHeX+ID0X3QxGmHQgXQj
         r985A2igckA5dUWw1hKei+9q7vc8gnURJu2gsEI59pA7PZEu7VCkOURMcj8d69dL04ns
         NeSA==
X-Forwarded-Encrypted: i=1; AKwUvBz6vxiff5J5L3utUGBIAE29Nv6VAGV4nSifVhBfq2QuudRtCX0Vj+vn/rXcWB920xsI9awipcE5rF9r5jDm@vger.kernel.org
X-Gm-Message-State: AFuF++lbMuMRZvV31D2mbeFuj99bVo8r6iCHBsM/UkYeiL3dLgOBX0pX
	32lUiZmiPirwMCtuuHJJwNTogCAlGceZbI/tdKs0uqJrR/CuxkgH8xDauLxoOmOHgDn3jTPDvHY
	dUXcSXuVEnIYjdwHLA/l4/vUhVNJRbAhoRHfpHMQOfpJvtOnTzWPIA0mwGIhPjSsmGCWC
X-Gm-Gg: AYBFou2xC0Nli72V+/jvxsXu1XS+g+Qy4kOISl/EjKwksXaptR0N5K6Z+kNcxvkuKio
	lL1MsgdE3KTmVelTgXeNZ6cXfN7U1BS9EoXpj+65wmop/QWOh8Q49MBoIK0jMSprJnukiVCaG4J
	FtEOK5qiqol3TwfJuHqn69uacyMzHnSzORzmgWucoBbiNOAs5225jm/1UIT7S1E8c3DPgCW6JRD
	9VsHz4+m4RxZHBlVXAuj75Fr2OQxLtqzcWX2xE7zOEspNjDIuNItzd1dSr0T+SzUzlsAEEZ2iuH
	Q5MSeMX4BiI3aYFP+7O07Ab10X1OL+EUGPRVrBevDk5TS5Wfg9mGgRdIE16Dx8b5iBAcdGSLXU6
	GZb4Q3ReBAIbgzSBX5YWr/Vrk0OeR94L3L5y5LXRyZDw3RBdi/Uk2EIE/Gnv4W4E0ILrpbT0pHK
	5SpTGApQdoneBdE2KLlw==
X-Received: by 2002:a05:6820:1ca3:b0:6c0:dbd:30a1 with SMTP id 006d021491bc7-6c7d11d686emr1924416eaf.6.1789549838383;
        Wed, 16 Sep 2026 02:10:38 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca3:b0:6c0:dbd:30a1 with SMTP id 006d021491bc7-6c7d11d686emr1924390eaf.6.1789549837946;
        Wed, 16 Sep 2026 02:10:37 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a182sm6388715eec.8.2026.09.16.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:10:37 -0700 (PDT)
Message-ID: <0b371ca0-e91f-4ede-921f-9610961bbd6b@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:40:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX9njZiIkqzMPo
 DJO2j7/JWkksewTXMazaOyomQEdoOn8p1XPJiadbahhU2MyaE0BmpsqVvzy/ZSA+HEtBNu5nEEw
 3BZuA5IPKA3x0R4H5DgIJDyldTqf3Hc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa5d0f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jPJSeZr3LZmqAX0kEZ8A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: eXtLjbOIKOt4tylKEJp8ESQV05cSuw0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXzKvrcwIv9LPu
 zbJUSjWfe21/cGkXkFraWErfhGTYT1jsyKxycMXlxiZyCBy5h/d3ebRvT7M2/3FbSFsMc2CXn7n
 +oF9qp2GrNznuLPa0fybHez3V4sKOJwQQ9fG4cjcZY3Pa7nhteYWjqYKxVatIo9w1NrHF26oc8c
 x5Yp62Ob86edza6c1P6tkK1+KXs79ogSNqXCEfoQLgHnEURAknqF3+Na8RFkJSHry2ITfs4APye
 qRQ96ci2KiI4z5imNAp4kDk8xg4W6K3Lso3SDxOhHhm93S9QyoH/O4Y2kDpT+COucRcaieBPUa3
 f1ruLk/M8RWF0Wgu4F3gTsuD+hUfQQufcMWYCg7FCHBwHpDmY1f33Hn4cwlICyZcjRIxrEwqk6D
 Q5VmmtPX/3V7150XsoWwBjVMEv7mqwJrZX4WOxxO2UABu23z5qYMboIooDU/+6A8MXrCZ+W7kE+
 J42P7dF0jK0WAFLZoRg==
X-Proofpoint-GUID: eXtLjbOIKOt4tylKEJp8ESQV05cSuw0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

On 9/15/2026 12:28 PM, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> With this change both entries follow the same
> depends on / select / default / help ordering used by the other Glymur
> clock controller Kconfig entries.

Fix was posted by Sivansh and has been reviewed, should get picked up.
https://lore.kernel.org/all/20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com/

> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..b3ffe1dced017e6f4bd3f0fa9c11bed5948391fc 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
>  config CLK_GLYMUR_EVACC
>  	tristate "Glymur EVA Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> -	default m if ARCH_QCOM
>  	select CLK_GLYMUR_GCC
>  	default m if ARCH_QCOM
>  	help
> @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
>  	tristate "Glymur Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
>  	help
>  	  Support for the graphics clock controller on Glymur devices.
>  	  Say Y if you want to support graphics controller devices and
> 
> ---
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> change-id: 20260915-kconfig_updates-39a684a748d0
> 
> Best regards,

