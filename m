Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA0C480DE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158127; cv=none; b=poa4NkvZ0VmDqOQWABpslw/hG/urIcH5K8b9wh3iIyOPX1lgMH9q1qPC5VYNF3tcvuK42p0mgGpYy+v5bVKxjCnMqA9xc8yrFP3ziEQITWJXwvcyu0jhQUl2tRzBMr6Q7RKSKMOi08zBHAw4IntSogAmZc01Hd4mt5JzP+IDTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158127; c=relaxed/simple;
	bh=RKgV5hZvafCihZFGYAAI/L2obRXJPdA1lHWrYC52Kok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLuMZ5D0tXuISiz0yGTj0D3EmGsQ3ucPJt7A6VmVmRXBCjH2+08HY6AdM3Y8KzYf1MU8RHuTzsHTFWyydkfjHVi+Dp8hIZxXFWeugCH0ja6GctLCYTBXHxNmEU3D/E/NUan9DJUYQbR37fehxcWuCeMqdrRVlh8llCa2TXmLFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orKZ0Li1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCg4LdH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orKZ0Li1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCg4LdH4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GDE54v2802044
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=; b=orKZ0Li1t4druC1H
	6hY1MMvOXVDwKuo+7DpV93/wX0dUWT5ysZNdQwDKDYzgEGkGB6nYunT4cGGJScOp
	cUFL8cU1iLX8RakwqdJs3RP7RkbtOwGGLMqXyXURNnJ39nEcAYX4pOMXzMCmycRD
	DMWF8iQOZyhMa/yj2jWeBcufHGq910wcBNM9Ie6tEgsyWYJsuS4ekW2t1KyQ+IJx
	iZNpBq/D4cpIpZDBx+96U1dFshdK7X11wy2IEPdODUYPNiFeFqMeTnwX49sjwU9y
	L77MLVyAk5uMy6HiHViVYwxy30eNXFp51jh4d7NeuslWaDO1TL4+4Pv0GSPbGYCy
	ObVc0Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbmmq03c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:42:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b561a5ca4so19646d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158124; x=1792762924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=;
        b=RCg4LdH4q+LZeU/U/U3vCCcRwr1QT4Gx3xy7gbJ954dzvwRRb0ID9v1qzjrOdkTNiK
         z7iKfPPyXnjrt/iMvxXyJFUYgNvhB3U+7OvaN+TZatzI6AGKuXCQBxZ3mQ+QVAmhLbUK
         bg80BRHDMSNz/q3w5K6zbVtCnsZ/OmIbJoel+HSSkFRPHMToBJ1p7K+KsXyGWaTYgU4y
         vv2X9Sp56QdBIaIJD2jspEGJnn1IQxlvmeIc5fX6QISyg1DkWQpynqvjjHiBm7W1NoxT
         gPfs+0Jqw3pGLEvb6Yja6v0GvdbpanG+L9p3TLAwRljXRbn1u92rrCzPdxUXnLt6iJwR
         STpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158124; x=1792762924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=;
        b=TCaoo0oHMSsoEUmfyDCU5RO40lbYV9ggIHDFcwiu8DbzElw+Qv8kIq/decwVKJW/SC
         bNbVgejdvm5Ttxuuwaxe7kfKuopFqE8hzYvCZ2DPQY3h7oI/EOV+U+heSGftFToYvaaf
         HkL75xrvfWVLIAQRATVUDw3oA88G9fgVnXjSV6YchGjS5fdKwH2KxNRyM/I6NkN7YUqq
         8cOvB6A/cAYQsLJGoXiNMKUWGS17HNbiEh1O0WBsP1exzm3qAc49N89gtIpDUESWySQj
         Uqf+Y5qgFFY1KfM0J6IySZvEwhRhyP1Z0cpZSPBJDGUsLK2ENMazmTWYba1uULYPQ15g
         9sBA==
X-Forwarded-Encrypted: i=1; AKwUvBzady1pN11RQ9WAsaROzyM9qK22r1VILER7kU10JEiB5jFd27Si5/x0T/1EMpOHaJHgoUSWcBBraM6lCR/w@vger.kernel.org
X-Gm-Message-State: AFq9FYJz0SzqhxpodtyH9WwtCbO7mCwMKjfKplRmR9QO5cgICjw8wI63
	Ut2Nj7J02uxKGJwyVMOOrVODZI5GNopwiKn/K1IBS0VGQc/TaYIkLxb/PWTj2eYCx5Q9XkiTO8X
	tMgH0AfHtbzi2QMjyFAojSFEx1SSfJQZltQp29sh2vB/mHrUxdzRn4XbpG+LeYiA3OcNH
X-Gm-Gg: AYBFou3yrtCWZRiWOaNLBHWgHS7R8CV3qhPtXX0zAi7UCUzJB5Q4hve7jIwaKJO4djx
	cA0Wbawb/0CfSIRT6CJSjMfPdEUM+Q5LeOE/t5u4vocSKSvkKKxGRny65ibtl8wJwL70sEmli3v
	zXWATJ1jmrNv1S+bbD5OQRjLj2P78483xwzqpN8XymsXLN98ix9hnn8nHXahGUVG6lYARX2upQV
	MSbvWQmrwuMhJuMqvZSB6t89mz2F/NLiV7mlNALHQBu0Qq433hMFFn2jUecNdzFudTdDhrpak6O
	F2InnnNuX0LqAdy8LgBmMhcSHgvkJJO+5HpOvURzvYeFHwJs+e7iexYGouynLqJpXhlY3fOTe1o
	WbvcJyjPohQ+ml3NgZVbCIQ==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3752546685a.0.1792158124386;
        Fri, 16 Oct 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3752538885a.0.1792158123718;
        Fri, 16 Oct 2026 06:42:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d8b4csm877756a12.26.2026.10.16.06.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:42:02 -0700 (PDT)
Message-ID: <6eaf5257-8c9f-4cb3-9232-e8f9fb19de71@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
To: avalon.vargas.centeno@est.una.ac.cr,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
 <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfXyzoOSchCqlwz
 D8NRZayQH6osY7QAP0mxWNK2/NCFFI6Kjc19oNL/c7EOYz3RSVc19K7TFNI9FWtPO2cHLDH1GHt
 Yh/P6+8HVBrcMpn6t2ENllUV9ThFb90=
X-Authority-Analysis: v=2.4 cv=P9uvFSAu c=1 sm=1 tr=0 ts=6ad229ad cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=gXMl86fzaOV-y-lz5Y0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX36Ypj9IW9GRl
 qhHP/s7ebCgxsCKKBxJkc49LKVyRVeEBP8kSapTFvWb4LmmkYPZ4ypJ6nL2Q4idy/8NeiKOyxPo
 gPHpbE1grNlF0fwtmQcXePCqmwArr+EiUvjvQxQVv8HGQ1nDKXBrhXUVoHR3813lu45XiJkoD9i
 LtulLsi5+FMmjF64O2N1VnhLvGuQNlXOpu7a4JL9BeQVOXd33sAcBYymPhu+Y6VfcrbdxtxyA4N
 pDl06IVezqsl9j6pOWTaIJ49yvmz1k053FAI44W28eSpUdFVXIXkQMw9K2kZ01ZvJyCxSyvp+z+
 si0HsSrplEeBv7TouiV0LQeqc6w5YTEnt3Wr5J7LHRQoPujvMplN7Rf4hH1qqVrB85JSetpVyRU
 6z5o0nwlmhYCi14i3pqRcwWs8oAd4ZzpAHMKgi9Wn9lJe5STklrP6zi+ce5ymnUM9UDzLFEWS17
 HBRUf/Dqz+8ZkSTuzCw==
X-Proofpoint-GUID: uD_CWvOnVsxjx61Yfx34PLc5sJ0FKlN0
X-Proofpoint-ORIG-GUID: uD_CWvOnVsxjx61Yfx34PLc5sJ0FKlN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 9/15/26 12:04 AM, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> ---
> This replaces the earlier report-plus-diff with a patch submission.
> Only one unit has been tested. I have no evidence of double-sourcing
> or a working Inspiron touchscreen at 0x10; a typo remains possible.
> 
> touch input and suspend/resume. The native upstream patch has not yet
> undergone a full kernel DTB build or dtbs_check.

This is a prerequisite for all contributions.

Bryan, does the touchscreen work for you without this patch? Is this simply
double-sourcing?

Konrad

> 
> Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
> ---
> Changes in v3:
> - Add the Fixes tag for the commit that introduced the incorrect address.
> - Link to v2: https://patch.msgid.link/20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr
> 
> Changes in v2:
> - Drop the testing details from the commit message as requested.
> - Link to v1: https://patch.msgid.link/20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Val Packett <val@packett.cool>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> index 75e10d97c..0cf5716cd 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -25,9 +25,10 @@ &gpu_zap_shader {
>  };
>  
>  &i2c8 {
> -	touchscreen@10 {
> +	/* LXST2021 */
> +	touchscreen@9 {
>  		compatible = "hid-over-i2c";
> -		reg = <0x10>;
> +		reg = <0x09>;
>  
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> 
> ---
> base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
> change-id: 20260914-dell7441-touchscreen-6b6201348ab6
> 
> Best regards,
> --  
> Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
