Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9437D12E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251098; cv=none; b=pnGE91tPQ8cEoDG9RY4w2LR0fO+hAdAXwraQJb9WihWSl8OCtCHuiZa2H94LtrLxznCwVMUF+j0AdYq9bFiGTBN/V42iUB/DhtqtFUGXZ03/qfTIA7qvqaOvasyhw2PqFYYhC0HSJH6wKF4d6Y+YLHQxYJ9VwABpaGcTG7AEwJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251098; c=relaxed/simple;
	bh=fQ5f3+9GI85NgNrSAZm13wfXn7vkIjjblxUZUpisIjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTLhfJiUoMnznumDxtQE6GPY8CgTQg8okc5meCY34e6MC8KFCwWHxPHwA38bNslAyq838BD0D6sVOpJcFKx+bD9APCiDRzYdxdMy8eNyGKVSlRwP1S/pPYN0oivNNGgqqXO6tAPPXPTNGTefRk5hfsjJx+UPm6+zp2T0ss5usvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3VpsG3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECAHNbMv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3VpsG3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECAHNbMv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJ5Li3259550
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 18:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qc+7njUReQUFZe7+fYwWzGrp
	ycZ78k0Mq9dJrYEsPJ0=; b=H3VpsG3yyz4jelTLI/7tvO6YKF+p2D3dbsBWlyk4
	XT49xseBZPbYKsCp30ZDi+zFWxU+47EcX+BzcaRJwFYN4tQx8QK+xgIvjSPeRUni
	WaG/9xVlxBC7cxB2udAeWxL0ZG4S3Ur3I/S2SDax5yoQnk6QMPwKi8kBaaEBoOU3
	UBuhVndgannwJNTIAlBiSPEnASmDBM92Fe6fjhgWZ2AIaeEdT1EeDrZuuSNRRX4a
	MAw2KJvGjRO4bRSTAKNs7KBsgoRSMHFqBJ2TWYKAwHjJ6zwkx8eUToyL6C/8FBQe
	aSVZ89PtNidI/ftTeMncRxffBT+Ou0h+YXWvXT8j503rNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytca8s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 18:38:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso2115861cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787251094; x=1787855894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qc+7njUReQUFZe7+fYwWzGrpycZ78k0Mq9dJrYEsPJ0=;
        b=ECAHNbMvbeYWYAvH3edTwPIepF9xEXaM3zsnCOt+u9fcZRfBD4Qz7I0cysNXbqniJr
         GrJcxB3SkCbmVEu4uUKeXuzO203q9dEckhIJLfcNhWLjMYpCfASGwhQ1gFtcm3bQhIaU
         6dImfH0tdukhpy0C4ELce/nzYxmhN3aOUO1DrTmw8qzb8K4xnrhv3wtfqMEA3myhHcdm
         YsFZ+hDg/+miKHMW4VoFQzrtNGBS0bHWM/00ymRHdAVE35R/jk/5KYGSNGJ5m7Q7NxEo
         gYJGoA8TiLyqw58W9NwneMJpPkI0+7+8+boQGILucmajrffvKcn2UMFw9/lATD+j2Mfo
         Lpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251094; x=1787855894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc+7njUReQUFZe7+fYwWzGrpycZ78k0Mq9dJrYEsPJ0=;
        b=n48xxK7Cx2mH6lZr28qAsIxc09+z78QfloDE7kn3er/YVofa4ydVXDoEczfRedZRgo
         AqEx7vJvLVnwxLZlsXbo4KM9F9MfGxEdUUqclGg+AcQnGxVeEYLb+Vg1swnW8sLSn5tS
         CXcnuc8n/eQKXTZmcsC1CHNW/FK13osinxohVNp0MinD97aFGVX5WZDM4Oj/gaxvnnmC
         QyHjGMAJc2HZJtDG5+ST9udrW5ADqv8xPwPYc7pyY5nR/1PrYclQV+fTo1wp2a63rNpZ
         FJx73wwAn+6r36LE2gH3xsYorqbQF7VMhO2PPNQoJ4nn4wdLj+juY12USMbaMuhXbfcN
         VxmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9blvlhge4kQt1K1mX4M0swpH7o/HDmIG0koKfu2Td26Bue1wTDYmSaUqz7Zq0TrEhoRoNkfuZt2G4gm1Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz9RMlFGZLtBEYMmvKupYjBzzqEKKt1xPJcQU2diYj5VMd9cZr
	hnDykNj+wEG7/cRiEGdhyeEf/jw5GH2GHgangXSyhJgESLZ17sFW4wOYyaHgJvRbKFHBhE9Qke1
	MfNXnlLzghsQZ25CUtSuwC8AJe7CMan+ZwLCoge4scuzxtsM+e15A1WceI5rvlfbnwlEJ
X-Gm-Gg: AR+sD125ickgJRnjOVnRkWxJGRkFZ0PHglPXkislM+m7kpaf36HYjEU7bBKDo+7hayR
	WqOv0L37fDlvZeuJuoW5iAu42+m0P/eaiJ58nZ2qJpEx3ZeOFZ5t4Av4SOSzIwwBcRaVKLvidL2
	tZx3KwK+is61SlBWZ8KjA/qlcvLqIPHUA9t21Tqy5cFbpjMTcJOQaNOL4HyMGKiNHbB35pBwHVZ
	kgJnLHiCSqlszB/k75g/QmRUAwnPvAROe9bVVTLc7/2jG45oX87XioTuJXh0FTrAUbKFROt5tPE
	oeuAa3u1NNnrzND8rs54HsHSK3Cn+mZEgyn9YXior27Cv7gcysFo0IiXCkLLbO4ExUQMtAPbl+3
	sSr0vKlsyojVK85Q=
X-Received: by 2002:ac8:5a46:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52df5a93f45mr2744211cf.40.1787251094288;
        Thu, 20 Aug 2026 11:38:14 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52df5a93f45mr2743681cf.40.1787251093676;
        Thu, 20 Aug 2026 11:38:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b29e19f2sm53748425e9.4.2026.08.20.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:38:12 -0700 (PDT)
Date: Thu, 20 Aug 2026 21:38:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
Message-ID: <7ahrj4udyuebngj3dqox643ou3byb23qkbf5yfcdqk2anvyo6e@tjqu2igyvwqh>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a874997 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ba2XhVvwmFK6ezhSYYYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX8/OmYPw+/POK
 Xq/1v9ObJDOq7/QM0fniwzEUDK1qsJo6Mt6ZQpAmbctpD9tglQObgvAbM2d6sTZOtAf99edV3uj
 g775dW3KZz75b9+iTa7FqH5uu4U+3oCzOTlckPTxhiQPjs1PjRRXlsW/1j7dtzF9gygFL28qLZK
 FHl9/wGy/NpBnSXvkpw1qx9us0/Cr4XDyHoBUUiD/8c3IQ8Pu1o45GtASfe6zlNBuKq4Kn1LNGg
 iogPnHtHjlLLLPfVrXwrjaV1hbeK+PFhwnT/QLLwNDV2qYmB0hBftJPECB/gePzuSAJcqHwdUhH
 RDZwhVjIc/bvTBiNFq9+KQMtjtTrgDxcnIhZqKjlykV8Cz0pn6GaF4HklDIZR4QgzWEiQJCQ+rf
 2DxZtN0lNdZXh3AvQgHGWcsIU0dhZH89ECvWztVzPrk6nfWvk9hUe5Y+JJGHphz8pCZv1YC9YAc
 Sd+m12XJ1hnPDyL793g==
X-Proofpoint-ORIG-GUID: UCmJHg13du31KVDCyl_6wGh-ff6cntQG
X-Proofpoint-GUID: UCmJHg13du31KVDCyl_6wGh-ff6cntQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfXwzfQlZdcOSY8
 RjUOBF/KLGFY6CjQLgleAfKEi6q2fJXEVc5fGI1AcVR2FUsvRX1vxiGLrK5QpeFRHAlSdT2JMdi
 UAwpGYvTiNaqIY3hWg8D+z5XaOqbeEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200140

On 26-08-20 20:17:38, Akash Kumar wrote:
> On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
> the primary Type-C port and Cypress PD controller CYPD6129 on the
> second Type-C port. On Shikra IQS platform, usb-role-switch is
> handled by Cypress PD controller CYPD6129 on both Type-C ports.
> 
> Add the CYPD6129 typec node under i2c3, wire its connector endpoints
> to the corresponding DWC3 controller ports via remote-endpoint
> phandles, and switch the associated USB controllers to OTG mode so
> role switching can take effect.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  64 +++++++++++-
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  64 +++++++++++-
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 +++++++++++++++++++-
>  3 files changed, 223 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 3866ab8b0faa..c92ab8e6cc0c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -42,6 +42,43 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ccg_typec_con0: connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +			wakeup-source;

AFAICT, this fails dtbs_check because it isn't allowed by the
usb-connector.yaml.

I see you added it in the example the new schema you added. That
should've failed at dt_bindings_check.

Same comment for the other dtes files.

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};

Where is the second connector?

> +	};
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> @@ -58,6 +95,23 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio136";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&usb_1 {
> +	/delete-property/ dr_mode;

I don't think this property is actually defined anywhere. I wonder which
tree is this done on.
