Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002F940BCAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163178; cv=none; b=hLhV0rvFcAEmkE3Wnnai3uGtzg6h2tlwHemX0zwVNKHteqCvYbfokavkpHBGarEWcI9w5GkMDGh+eVxiZ9wigl9nfeNj0eoBnnRA53LF+MgfbydUqw/m4wUA8qODA6hCTqqEA4sXmVMaSjFEQEp6wlRoJA/rMwquUB9VRHzcpAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163178; c=relaxed/simple;
	bh=xH9UYE3tKui+PpJ+oJjv266cFUJrFsy6ZjDBpLen2Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPFoPDaDShNfKrN4B4A1ko6i/zgbi/QCgSsl8urjZumA/snbCHfPfIzYBxckQsYhJz6N0akmQ4NTnvj1iX/WDKRK2YUzOTowdFU7buEcS1B0av6fQjJGzj13l4Vg352g7taUBCqflx71P4DJesvhCd+WBlbHgwkFNBvPwIQjyJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVYMFvJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyTGsell; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVYMFvJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyTGsell"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDmCJ83823751
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWqul+dcRPvRCnkua2Q9yspTH/JRLTFe01JsmLOFB8Q=; b=WVYMFvJ8/C5SEbO0
	7oNFheF1T4F4m3e1pi8x9EJy5l2jhDquUqOSDJOuLvEnCywyGL8NkdMtQaXaJpZp
	9C9MVFNDQ6UKUGqrHX+zaimpQOZpNXakACySLZ5C7EaVcaaPGf75crBR/WZMvkbi
	SNf1XP8ssFejOFC+0LxwN2/lbs14wtP8Mt///bTteUUxhgzl4/m0TpqI6jt66O2u
	ZhdtfiJaqM1G3jFwYaE1lg2smE4hXVkmKdkkWgR/+P6sjXtXtdwqtSPQgE/D7gSQ
	eHKWAJF/M2XdDNr7rpHIUQYY2iJdZVTzniNjIzUMt+tbyv4nW+mvryUaRhpRsfEs
	+erByQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs6un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:39:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so6935331cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163175; x=1785767975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWqul+dcRPvRCnkua2Q9yspTH/JRLTFe01JsmLOFB8Q=;
        b=VyTGsellARHfNvfSCUzopaUhoTFiZ53hMs6fh/wKtj3A6JLEZ+JnZDjGu4aoxxqDtS
         TohbvWMr//mRzrrkQyqBOLdXZ8XQalSZcHaaeanef09MI8RQOym3ER7W+SZMuIM3viK4
         BZXM4wHqz9ZQAR6riCijmZec/WCmjC5/PxBzwEq1oEZM+NcdRhC5rL6Tqcb4ZIP+y8lH
         vO63z4JLjQYpkqWo29fHiSVJzWj90ojwtiGZSoqt80bZN9OE2fUQvIlgVZ8SHwoRj4Mh
         mDte4UKLC6PMDZduWVYVEUN+zDPXODUYtRtIyIcvZjWgbbI9I4xcqA6ajSW1C4b/VpXu
         yIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163175; x=1785767975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWqul+dcRPvRCnkua2Q9yspTH/JRLTFe01JsmLOFB8Q=;
        b=UbUWSNrWYfIWDqJDQHJsicmsX0IYxfnNBOaDy2CjVEbAbLx3uB9HG/jqwMpvokjDGL
         Sa0jHwCkeGltAULzLxtKC2FMG1NTn7SzzYORaY2fftD7D7Uu7zTY5E/yvMnffu6c12jU
         e1iSiUOXwlyTPZ2q85P0LwHVJzg/j2ir1nALMXZHI9ia/PJqRWX0/fusWGsvEssbRTBH
         Hx2Kqx20FORy+C07o7/muZ2t1Jn+KvqD+V9I5LsS9ZhF6SsVSQFa/+JSRCOCrtHiC3Ro
         Ae+zVcK/6iq+jgG1D32L/DPqLaQfUvyLE//4ZFfUheRRRf7zBR7X8MM6tVJdFdWSFJ8l
         f//w==
X-Gm-Message-State: AOJu0Yy34c5cLrv7Ks3lWOoWATAIcc1QuSNh7Ar8QQkLFpoOPeKib/ub
	I7kLP4JV2dA3MIpwdr1482GeeiXI1J72sB6wj0djWNUSHyWoZ+JpmM6WEuC3fwy8IfSM30Vkh62
	L7WpEuzFLjWOKjWmrxssbHxgzpJmxW3g1QXAiOHP3tp6Yoirucpu4Cd7rRSz+3Xz0UeTC
X-Gm-Gg: AR+sD13b1W9bypCw9PD3VQWhLguz7uALB1QnR67R7EVJ6qA4rY/UdQAQivUL6ce0uQx
	+NkvRDDMGa3Xfug63owYHq1B0dkzHFeW54jKgLbZKHhnfzq59XkF3jNw4ZjWA+y1kwQY/Xdhq8p
	Zgufw8AE6qkrciQMHuFQC+VuD+o9XmR9qKb0c0K4V0LmSZfoKeD8RXWHE2r6OBagwEh7DMeadOw
	CvfgPBBpQr279pmCGAbI6KTN1IlM1EXYLt7vDC9w04zpfLHXyQyzfrGYBhL8ABavjHYnqQawSMQ
	5RV7B5d8GlVy1ysFZeF7iLefhAI7A87h8j8enTkBFlqvAtfCm8Ju3SBxu4BHyjDaaT4Xdr4CJ9Z
	LiP/P1oP9CXG2cRqFCroJ6/AV
X-Received: by 2002:a05:622a:1b8d:b0:51b:e991:92bd with SMTP id d75a77b69052e-529cfe17679mr3478781cf.7.1785163175067;
        Mon, 27 Jul 2026 07:39:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8d:b0:51b:e991:92bd with SMTP id d75a77b69052e-529cfe17679mr3478451cf.7.1785163174501;
        Mon, 27 Jul 2026 07:39:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2224cadbsm14056031fa.28.2026.07.27.07.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:39:33 -0700 (PDT)
Message-ID: <1dbdd44d-070b-4abc-a79f-3cde09de7d74@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yzVw7_q77DSya9zoTeLwWAqbocX1DCbF
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a676da8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h09ikyFUrcXnkDd3N-sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX7SVoe7DzwsTA
 TKu6s1ULtBDKJBDhUTRcc3Ymb3hEv0Ovaj4I/vHpUTed8gMlJgqJmRxYmjvWUo//or5oL4uHUH9
 PU8k077LfQTkVSn8+ZfUtRUl8R3g2Tc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX+nAx8P/0P8iT
 FjVTEaPrwR5qgERyuNBbJKP6JzigUtmnCcsdGD6X31fhDPEv9GmwnAUgaUqC3Eyk35R9kj5rfLr
 2Eq85TAHUqbpZiA2Czks7dg1eTRMys/kJwgQ113xataYcGOUPpTVmDhXDSGF6ltsrm3p/iQUC/h
 z5g/UVeWngRS6xUZn80ANaRaO6vOQUo6Lerc1RrnO+gZe9eIIubuV/0JpULSzzd8oLDLBUG6jb5
 I8xp3H1++axGB9rBloH1C8ha+oTVX6vcrGKTWTwjo0PASe8qtjtpDiExL3O/XbrJ5kAryurW3jL
 3bSUefEV/gxlDrYc9StrwZyFpdXEN2yQIdBYO0aXtn/c1vS+Uz73sgJLZQscNMBctzs67QOSotv
 /PN/094ScnA25Icc2leINhiFWG44yn5I7CvyvBNFizwm0eQ+JLB4GqWAfNFZ278iUXiUOeoIhwW
 qZZTAxtPWm5wnQJbFxw==
X-Proofpoint-GUID: yzVw7_q77DSya9zoTeLwWAqbocX1DCbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270138

On 7/23/26 12:33 PM, Krishna Kurapati wrote:
> On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
> Type-C port and Cypress PD controller CYPD6129 on second Type-C port.
> 
> Since those changes are not yet present, enabling both USB controllers
> in device mode.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7ae..006e24a62f5c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};

$ rg shikra-evk.dtsi arch
arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
9:#include "shikra-evk.dtsi"

arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
9:#include "shikra-evk.dtsi"

arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
9:#include "shikra-evk.dtsi"

I think I asked either in private or in public, don't remember at this
point, just enable these controller once. They are all the same board
with the chip and PMICs swapped. Override just the supplies in the final
DTS files.

Konrad
