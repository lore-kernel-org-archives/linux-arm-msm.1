Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B942B326
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163478; cv=none; b=shMsUtoXYabt+G2PmusGNhR2g7zG9FhQ5JIPhKhF2J2eFU6TM9KO9EEWmrl3HoAH0PmERs9iFh0NP96Ew1Marv8HhshUv5zPviXRS5C62zNkqnd4w5prZB2Hwg0gylMEl6ykr10T6HllxkWk98NCK1EDF8TWdK6dieIJPC+ETtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163478; c=relaxed/simple;
	bh=XN3xa/48SqChZE3wm/lRlklcT6w8t9N6WIhdbCnXc5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrZ0SvYFhtY+FmEhdxL1Zy9OifoH0wfrtwrTKuGMOWce/gCz/QMJ4Z49tdLMRce3KBNRQVJYEX/Gh0zyGMhhGtALWbu79iJqIZdsVMjVGTR5xP8KcqbnCQjUc+6Zhk8nf0Ln+v0zb2vaaectf/9Ltw/oWvTSYXx0I/Q2zH/pCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDH0wSwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSJ8D5Vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDH0wSwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSJ8D5Vg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlYKJ855735
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tj5xAxumuNTcwhfMIoVyv0E6o1XgIr7Yq39yh6tYNNI=; b=gDH0wSwp8/jySBt6
	kNt7q6ZV7A4AFGeeGI0CJwodjzk1u8O1BCHbtFhm2G0/P4cuL9Ld+yGdffn7QBRV
	ZVefXjqeuLqa1oEDNFVl9ZuZyWE+s8BDs2UaYy4zcQKRVKjnkr3WT2P4fT6r4Mdf
	gffhzqiCyH/TeRNhkjhVipcKQDWRfesx2ECp2eSKlNdzyzwn8CitYg0tgTQudu9X
	Mze5/fMaXL8tqkkX1Lmg3GfNrKsIauY5wppGqa4dgxTMnzG+AikOAHW5FcXeIj7F
	opNr42EyiFOHjefHEaEVuo5L5S0bSRwhUPLYmZ3fhvEeGIjczzPqYkwkLLZxJytt
	NSu50g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wjf7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:44:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so4940001cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163475; x=1785768275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj5xAxumuNTcwhfMIoVyv0E6o1XgIr7Yq39yh6tYNNI=;
        b=QSJ8D5VgizWY3Q4fbAc5xek0rhImYnn5jZywnEh9SSfVE3Hs2tgMGikKwa8Nm7EmOb
         IlxUB8/NLLD1WIndbZ5bOhIuaibtVVHIkAQy7VS90txK6DZiCYQCtUuPxbznGYvId8Mr
         d/fIKOsxEZ0GCjJz84ewI1gkwtilDrBUWntujiD2HI54rSimGsnvRl8dJWlkX3FvxyrY
         NOIjG2FQQC3F9Q9/XIo3FK5u54q8t8IBIcxESJtTg0psyceFPlmualXMCfFqQAUUORnK
         +DiMIDolhT+1Ok8dyFxyvDoD16cz0UjVnpXep/SmnGTJ32hccmIQ9uk3IOsDBQfDg+Jm
         JBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163475; x=1785768275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tj5xAxumuNTcwhfMIoVyv0E6o1XgIr7Yq39yh6tYNNI=;
        b=nPaUwY9Gg4bFnit1FTy5C2IzaD6DbqH0A5sSVH0m82YV9JSdtK/STFQupnLRVgbD2L
         vinhpNc2iKH4qSkNzKkbveEzXJBLQnVfEE+7Ig1Cn7BkKDXGqW3GGCdrSB1q4IYG//5D
         PTraWowIMn6i0kEvCqYqw7Jn+QeCZbxwHUrAUIVKE6GlMHjZNjdqb1y5YvGbwNQnlc76
         mDPAxaoKsIEIe94nkBxYitXJhFkgVUDU45AAnL61vuPJ7RXMBZUfQQuezWUcaBGonIkV
         4EHPptdBnPwv3ZTmq1AIS+Up+ph+k7slxLDKamF7ON2xx8+t2mlX4Ot+oq7flpOyOO4U
         kdSA==
X-Forwarded-Encrypted: i=1; AHgh+RqjaPBgQp7XFKNTd44OwyzB50T5kQNZenkkGBcwcu1r7cE6bf5g53cMF5NY12PvqtkB1SqUXQ6EzGOU4Ijc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+v8XSsAP2RNMDAJ8nPTae5fePFainI0n1aEMH4/okQOioFgvb
	tSZvDNEP/dCby5xLBEc02CFbIwPXdM1A1w5H9Y7M+DnJu3NHDH9T7CTivgQBwc0KOCNi79B277i
	3fl7GLKfZTpilATVngtlYt4drge95ip/6M2FwV4iJJQn/mEY33xEDT12gPGLHOtCKXF2C
X-Gm-Gg: AR+sD12F3AFbWramlJGMDCtaATMcLg39nmHRjAwWlePDDTwhZL9gvprOlVXHuITGijz
	aSTYoYp6eFfHhdTYgr40gDSp8FI6vyDAygoTTI6p1VOB1ierno0stez1JybIlFpBM3DCmqBb9E3
	OWwb8mJufvWu5ZJAJEhUlG51ifLU7WAPxiU0hpQmLk674PDJz6X2XJ2EDP+Jb03WkQeARrs9OIV
	CFCJU7fhv8q3Lb9MOuFR/WkD6R3hUC/v+0px+eKSCQCHH1qcgchL7/i1j4kSpwU3u8sdjdOHFVf
	HqiUZ1jf/32P9Ao9ZsLhyDISVZ++mUVMbCZUMPwAYmnQeN7ZRWZQWH60/xQIiwkivEBs4LOK//P
	F1tZVxvDVBoPdHI7vnS4zDHiV
X-Received: by 2002:a05:622a:a9c7:10b0:51b:fe41:4764 with SMTP id d75a77b69052e-529cfe3683dmr2895481cf.7.1785163475081;
        Mon, 27 Jul 2026 07:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:a9c7:10b0:51b:fe41:4764 with SMTP id d75a77b69052e-529cfe3683dmr2895131cf.7.1785163474685;
        Mon, 27 Jul 2026 07:44:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1e6525sm1469468e87.58.2026.07.27.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:44:33 -0700 (PDT)
Message-ID: <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:44:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX/C1jwvHrsJmU
 Gvc1WUmpx7wYRE0DHMkYcj1wuYeuIYCtAz1BnCv4VGcmIAT0oLbDK6Db3nwTaweE8NIXxzophIq
 LiVpJs59yNS+VHZVtnokHPOeMF465ldoVl/d7+QJguyKMO8NBxjHtXJsr+OIP9dB6d0Eg5RiLYn
 jKU775lbMJr208uG13RJ8W0SB+oFMX+8T5H7nf+YVM8vdGyxwlxAydQZeLwthcihnIyNIGreYoJ
 wlgZeBDeh1gElSCD1gde5D7Abjpamv+ZLRBzCloe/u+Kv6bH6yfMEPR/ziLncG/DyWTGCvpu46/
 gMRFwzrAjFRHSXcZrHYpiHQ0Gzl7/5OnaQJ00cUiKipThbK8PblXV/FfHL4xBERnkhBUsjmoAc7
 f4RRLKux0gCDe2KtAHU5Wt+JcGhMx9TcVPot2JuSPsBE3iTQpHh8LpS0AOcJew1Pdm08Qx/jft2
 EkSPiK5SeMo8ZO5OLeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX01gST37Q2GBl
 0cNRiNDMxfG8QlZ7RrUr+TqO3cVoFQrkYNhSIeUvMZwuJzHCOBw+8FghHLmZLr8CzyzHOrpj1sc
 UaLdm2eD8sJqQ8eXaL0ryfoUvnBu7SA=
X-Proofpoint-ORIG-GUID: DG5zdU39KGyM--FxnZB7Ld4LGdztF5Lx
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a676ed4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5lWD-fOefMpBFsrRanAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: DG5zdU39KGyM--FxnZB7Ld4LGdztF5Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/27/26 4:11 PM, Imran Shaik wrote:
> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
> SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>  			status = "disabled";
>  		};
>  
> +		tscss@1c80000 {
> +			compatible = "qcom,lemans-tscss";
> +			reg = <0x0 0x01c80000 0x0 0x2000>;
> +			reg-names = "tsc";
> +			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
> +				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
> +			clock-names = "ahb", "cntr";
> +			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
> +			assigned-clock-rates = <15625000>;

I'm guessing this will only ever require a single rate - do we
need power-domains pointing to one of the RPMHPDs and a
required-opps reference to match?

Konrad
