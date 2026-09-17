Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BCF4DDB4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658305; cv=none; b=b05RyVkMn990FwJIfprpvAmrkeQTaWn6dHxoUlRubfQIuvTOMDVxj4OoS3Ju0AXCRTdtcFehcPCZ6h35GnI1vBWzFMJnS+FM3zQLnPfSipQrc7C8jI1fGcfiRzkiFnIA9jy5GhmkxUEPfhTx+MW54eZatfQCuzJC22AF3op/0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658305; c=relaxed/simple;
	bh=imspMyYY4nhHieMW+i2YWT+PHBtT/L1W+xnPfAEbQV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgJQX6/SgQJjND51pw2PPaGYX4/+lP2+3YHpJ9yKbBSxUfQwszA0VvjvTi0y9lf9QLfiN8FNfy/VpL0l2fmJMLNsNxKiwqbCNHB2TvFmsBzkBrhw7YM/401CcPryIM4+mCLJNmifywJFn/PWLl5fwCl8sc/d5bEEGJdFlMFTwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXv5O6Cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ip+S6n+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXv5O6Cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ip+S6n+U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjdBJ1307344
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLtcp0wixH48sKhqM64EmYF4
	YUT8W87TUrM3wZuG6iM=; b=SXv5O6Cl2yYepZ0v8R3j/AMUwUZ8lqh9vpjH3AKa
	NswxsxSv274sO3fYBgpEb6SdHI8WGU+AkObOa8LHMIjihBcRpi/jZnBt6V9y7Flu
	/GTeFeWaNyTVhI36R/6ESMpvjLgKnlmV6lJjdICovPqmkjYaEUIHFFrS/ZatKZmg
	7ZA87+bk/v703x54xXgDdf0Z4EBwVNdyQkdqeLZC97ljrvxFrsL5872EM5+hR4t9
	ed21bzrKIOq6Y01HLhUWk9wluybvvgxCXQYfLBKTqdnaGlrZRCeCuncGPwMHm7Iw
	5d26QeUKxcAqzQbqvXXIKDkYCkMNr7UobsHoBYUCB6bEFQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9uhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:18:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91051512080so15978506d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658296; x=1790263096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLtcp0wixH48sKhqM64EmYF4YUT8W87TUrM3wZuG6iM=;
        b=Ip+S6n+U9AMHch9POikqM10NcK5AzRsNy+DbmCGdksm0NYV97UL5KY9WJ6bXNzOtT2
         59tFVjBt+qLh7DVj3iASUghdn4hEoP3SfPCIsm29yAM19t96jBayvHDBz08EJbMYJUSQ
         sRQdcBfDzGFAuX21i3KBpCcGJlk6hd2LEiekg+XIrl3jucOFtv7FH/ZbDytF1TC88sRh
         x5HA6FNFNi8bE37GIEKjDKfSAeaC8XbRRJreG4hlDnxPTuyA0JJmnKFDEt9QikrRggo3
         /M9T3G/ty/IuLzs2Xfrz8ow5smURrk2QW+q6XfhLfKeG2P3O83ynZ/JbxEkZiXdjkMI3
         oP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658296; x=1790263096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLtcp0wixH48sKhqM64EmYF4YUT8W87TUrM3wZuG6iM=;
        b=RRXfOD00ckgTiAAQeWRL81ZhcXgRsDDtoOBNXD1i3yH6XoQlqGsz5xeh1uDgx5bVdE
         XdyUlkbDoQzEksoDKNs5cT9CMlo6wH+qiP6RCk19+88qDaWuTA8E8tZWbgmUVTAWC4S2
         KCkJEPN26oVuvF1/Z9r5p9tm9aB8xKwbK1WvcbpXsBfri/Z/Zkq8iLXX26oBlbMVF+EP
         RC3YoH9yG4slRnIGIrv+TRmVhwFuOVFfggVOLenQnwSEDnUGF/8Ls244iwS1TKiGYht/
         +8Uqm0nbQK+i9AEEVg4sUBFQJ0RAT99MPSqhVAlTs0Lbh5QUKqrJGTZL/bf2LXGtpiFK
         fccA==
X-Forwarded-Encrypted: i=1; AKwUvBzGMmWqKnz9eQBoGnvxk2g1sAtAWe7xcc4M/RRYHNS7tvpqLfRVLA/3Hp0EVzlKfvRgyD8C2JKN9u6KFA2R@vger.kernel.org
X-Gm-Message-State: AFuF++np8wJBN4rBm+22070rSx3w9h45AaDaHhRYO/9F45AQnSxHZHw3
	4F+N7/hzG9JkjUyDwzPmDLlqnIssAwA56MIxIKzvOOFlrNsfxwCi/g7LDp/lXfuLhHJVyKP1+lC
	LPGDKreiPsr8aLcMcikYBZw8LUNT77HGOK+SuAsdAGpdsuHJeB5TxYNncHslkbvOtCujG
X-Gm-Gg: AYBFou3unoIam0SfppBtEQIfwq0jRY8sVdbBoAN9YHJxnsRf76Aapnl01W7O5ccn1uk
	8Cbk8/pyAGI//K/eja9yXtlph3nk9vpjLf3r7l8/3ba1rsINIDeByrTBx7Hl9OZJDY5LwF8v9Un
	JdQMvpQjxTw37jhC8Y7uJ3KRHNUmGaD8fxKZurPKS75DN5/7EIqmlix56FBW3Fd4U2wfidkBXY2
	9F00KArGO33+gqKdLrVEkfRf8BnEw2Pt0UT6zNQMhL2Fp16LVtKdeUJYvTSLCR7+0LGug3jnSYU
	W2kPyaT7PuE4YX4M+P5v6bBv61b0BClzLT2Nyk7QHWOoua0yWNh1cgrMPMu6xEcpDLypLoxZR6J
	+/yTuyexg9XhQlQ==
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12692686d6.57.1789658295717;
        Thu, 17 Sep 2026 08:18:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12691686d6.57.1789658295146;
        Thu, 17 Sep 2026 08:18:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm95692495e9.0.2026.09.17.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:14 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:18:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/15] arm64: dts: qcom: sm8450: Move PCIe phy and
 GPIOs to root port node
Message-ID: <ixtoau7tae5ee73m4zspgbmjlairlfkw3amirufvkrvq4wbitw@yhbpk73z43he>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX/RXChHj7QvkZ
 gnssoJXMRMSlOQRXKcB0mRGjfDONL5/B/FI18uFcSVYrKIqsSBqZnLUjYjM9AsZRyzCGXpvAbl4
 tMaoVyhyJghk8NzC/F50CPm0kc3VCLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXyhhyZSx7TFKG
 oVvZ3auaDQ7OB7okhRoaPzG2shSnEROTFY7jfdGAOvAvGBEjSsclTbMpDY55gP5NS0QHr6s3tBw
 aJpnjYuEHa9/Gm9i7KU7qfOksEh/pDFwjx9UIF/9JBNioDkrfJ7QUNptqvVj/kRp2OG/+btI6pk
 IPFm5Fc+nfoyndTliSV2w5O7P7npPAO0HIC/r4OBO5xjTd26eR4wkvRqBdKE1WY5UDScSORWamr
 7wjovCkpMp9Ojgm4+4CEqxrATIlu6jKAJmoCDW04i1ciLAk4qe6FimSQ180xv54Voci96FHpOrR
 gMeebPE+rFnNBz7V8qHiLUmC+vA8Pv3PCHExLp91CtZsrjNU1uiuZta8RsA3WEL/BJiLFeIEUn7
 P8YOIEYbXrXhoMucekrBUGoBeMYhp0/M5/wDIW4MixptLGObE49BVxmpfFzAdQN+17OflQn+wLh
 rNdu6PVzstQdgXtKbYw==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac04b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tc6zKZNveC6fAoCGgUwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IeoBCcag_Om4HJPVdngHMWtbcgIb9r_A
X-Proofpoint-ORIG-GUID: IeoBCcag_Om4HJPVdngHMWtbcgIb9r_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:24, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

One nit below, the rest looks good:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 7bc5f85e7ebc..05e852ed7995 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2017,12 +2017,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			power-domains = <&gcc PCIE_0_GDSC>;
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
> -
> -			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> -			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> -
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pcie0_default_state>;
>  
> @@ -2063,6 +2057,10 @@ pcieport0: pcie@0 {
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
>  
> +				phys = <&pcie0_phy>;

Nit: If you respin, put a blank line here. Same for other places in this
patchset.

> +				reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +				wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> +
