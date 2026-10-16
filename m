Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F794582E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141514; cv=none; b=PUcsBmJSRdOq8mUPHwdvlHtn5t2w89eWFvwC2Qr0D/14+CGy6euRbArUrv+b5/tVrI05z4kwn3ZAzp+zKTYPcIAy00mnbSjyvRQA+SIZikEyM8z9uaVB/5fj5Aqcpa1CNSzSMIDwBgzcLd8yg8MatL/DCKm33/PtRGeQPhrRguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141514; c=relaxed/simple;
	bh=H5xZ8mFmtLkVBzBQ+LiUzga4F378YARs7W7NpO/xexg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FL9i/e3/4h9OKD2OvQz/krcXGzKx5zMsBrLnFDCw3Z89KFLfBClQpTPGfRi8AQp3MYzmxoqTH5Hyn8LGdCZLMe3C9PCt0PS11UxJRVINhUTWXbkf/x7sJ9CVw/ReeFSPSeo2ZTmnWYrRQwfCThNwtqs6Mm3OjvycSinwf33vO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyN1LG4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQr82lCF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyN1LG4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQr82lCF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m5L9760372
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ge49gEF8iI1j8v1IuSE0YY6g
	XRwf5wQGaOZV1jpGaYc=; b=KyN1LG4vStI9r8d0GvC9kxXwIBy3ZyFe0NhFO96S
	3wuz3RwOqF7qQgMxc3D//Ba6zw8D0JOhoW18cdNXHJtfr+EPI3U2AnPWTslyaf7b
	A7dQNSXZF+U/CT04mQszi/lN3SBraHuJbjwMvhJTdPkYW6tveFdvisg+LXbFfrMn
	4baymPWqCThIs/YdN8ZvF8NSy/1gzmFTeYj/S7BCCZD78a5jzXd3oWakJ39ea4fk
	UR0n+bsxq6cPyRE1JyXMxWP1DziwV1rTM6O4NliRMKs4Shs9FZoCylQhm4I3GNjJ
	6Y0TkqHwU01qXkrXKih+jTT9AdgOMJzDNxoBTI5CZHsJ6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbpr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:05:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8067974so1453559085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141510; x=1792746310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ge49gEF8iI1j8v1IuSE0YY6gXRwf5wQGaOZV1jpGaYc=;
        b=bQr82lCFsDsKzR1hSmSiTizhSY1OFOvRe+2G+9oJztTqNdlbPSXtsUtXYhCw09y+5X
         yezmOTJYrDwl9+47p7z9GW7Alrcw02L2aUXk+enL/Xfje6YF3BQEWjdVvQDeZvs5Z9ap
         xWCLLXZq7wnQKyPNo+OoSn/b2fOrTi/Lk4ui3S4XHkMtdy0dTdGkCxQqlTDX61jmeqZL
         pwPIJMJK0SqnCL/CydcvdAwhJgnb4CejVLmxaY4SSWw2SSwbpJ6UOhbvBsWMQL+6nNIY
         hQb4vZrFa/ERIz4c5AmITuSjkqRafoXhRrgCh3tSoo1/7K6LZ1hJ6j/YwUS1zXcTgIDR
         wbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141510; x=1792746310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge49gEF8iI1j8v1IuSE0YY6gXRwf5wQGaOZV1jpGaYc=;
        b=IR4RLW9P0+47raOpDUhGxt2jdPVjXJSDyxfNdu5WN0c7bnxHizzmoVNoB+aV2hzMNS
         ilsZ6tsqXm1Xw+Bcw6fqb8muGKwApkxVqs0AJt/puWfWukB99p2YZX6GZYQQkV5A4dqZ
         y4jY3Oe/4p6bMcbVo97tAqG5dS7hfyb5ZFCIcWw3uoaBRBM9HlxF3WbrtaLjeVdGteml
         7B1FSh1Ae8DktsXRtyWeQXTyssyqF2HUOM00/vNb44ey3uiYESoXl4lvNclQyQt1Lw7R
         JcprDXZ6/EniYHxRQXG72FYi5ZlTEueO5/rFyadBs4VIWrzeZhiHe/DdY6spYLSmbFNB
         VrdA==
X-Forwarded-Encrypted: i=1; AKwUvBz6c1f5SHAGjYLU0pNjhLmUCwKhM4RmsgVn7gN09JVSENj/erlONCaFewlP2cdxlaH562JpFsPUOmY9arkE@vger.kernel.org
X-Gm-Message-State: AFq9FYLeGdxwVvznoqbRIRy+SUT3RGliEpkV32DeqOej7gz2R3ZXKGNR
	LpxCh5b3SJAD2xTj6CMVvlyutAN8tH2kY2O1TePMLY0CtvhAq54gCB05W6UPgG9leKac9iQXEoH
	sqG3Lw8YJZ8LhgLP4WSE4wei8UUNHHX0SJ+LJxKwersIHeODXGNkqBT8JSxuaTrzwOLbL
X-Gm-Gg: AYBFou0dz1N/8Ma6PMnJnmR3Ns8uou/uX3j0okRJbJ0slKT0BhVke0X9Ln4jLqpfJZy
	cagBYjr33zbqD2z/CDFfBuSi+b6aTX7bZ79RVJha+mdNFLTuroeVoqBHhqm9+SzDD2TJx4szt9Z
	6yqYGQKu31v0Ph2vl5PxTiITpeDH59JHJkOI/ArkzdGsuSdCP2NEkAC9eE1ZTxjOBzpLLDUHwcz
	2K9Nwid8rokXnOF5otYwtsKe/FIsjEs0hspT4TyvzKilJAgQJpdjpIdT8hHTDBLoWczls9/sV3N
	4Hvd2j+iX4eI/EwTwYlL5TCyMuo0ljukgZwF+jgAvowJvaiboK9WhqvBkTNz+YrCG5PoJrpTXVk
	jRB6ET7mZuj2C8+pY
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr3530528285a.8.1792141509750;
        Fri, 16 Oct 2026 02:05:09 -0700 (PDT)
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr3530523385a.8.1792141509081;
        Fri, 16 Oct 2026 02:05:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm3660155f8f.46.2026.10.16.02.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:05:08 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:05:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
Message-ID: <sgqypoylrjwl7da6vsd5bkxxyfziv2ajxc77p6qgn6ted5bwnf@mctm5rfwsn26>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
X-Proofpoint-GUID: OdQpxG-XDuqwnpQ3KUL49Tiv0AYq6Tmj
X-Proofpoint-ORIG-GUID: OdQpxG-XDuqwnpQ3KUL49Tiv0AYq6Tmj
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1e8c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jKaMUBhZuuUR3B7YIIQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXyq0VOJaVBnU/
 jQeugKam6in/qUYEkfEhNPGux8ETYV8/CLgLiGUO36yLuUHvXLkiSwD+ucdr1GVYZ1nzT59DJhw
 HWRBorNbGqZMROL4xKwxxs210YXOxfkG1QNRqb0lZbHi0vvubBHqfKGT0sauusP1Q0kCR4e8FO0
 Qnu1/K2NoDfISnZHwCIQ5BKfnVy9gYJOCuCcjMVYhEV1RwP9fGncn4K1aPyadOl9XVoOnHJbuz6
 rfP2sgePS1D9cmyNxgzBqQ9+WxhfWpNMQFEiST6b1s4MfNhq6CVgEhH3hBqXs0KlnXXJduFZHND
 dv4LWm+PVj+jacA4pR2suM/+4O8YIVjoCoDCqYNUkLfNm0y42+8tB45XhhJrzrSXmSyKpu1oAvA
 RFWEs5AZsZrnFJZxSz10W3j9fr4qMv9d2deYxnLTewMT6hp75NE4IdknGijsFOO4Ea2atkEo8K7
 8CmrO9SBBTNJTWb7wqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX1ksZyCcJW19Y
 3taoBzCPj9tgk3kMdAyntjQV8RbRfoGa8gNQ6l+STkWJEahLXe8Favo2P8vw9IEJd2DMvGXjBBH
 XdBbf5iADB+VIfJty43jGCskFrE+ubI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 26-10-16 11:09:54, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi |   9 ++
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 126 ++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 6dc4c871f41e..e21b9ba480f5 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -430,6 +430,15 @@ &remoteproc_cdsp3 {
>  			     "nsp";
>  };
>  
> +&remoteproc_soccp {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>;
> +	clock-names = "xo";
> +	power-domains = <&rpmhpd RPMHPD_CX>,
> +			<&rpmhpd RPMHPD_MX>;
> +	power-domain-names = "cx",
> +			     "mx";
> +};
> +
>  &spi0 {
>  	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
>  	clock-names = "se";
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index dfbbaf94a7ae..53c594281f6b 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-soccp {
> +		compatible = "qcom,smp2p";
> +		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
> +					      IPCC_MPROC_SIGNAL_SMP2P
> +					      IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
> +		qcom,smem = <617>, <616>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <19>;
> +
> +		smp2p_soccp_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_soccp_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -1587,6 +1609,110 @@ uart13: serial@a98000 {
>  			};
>  		};
>  
> +		remoteproc_soccp: remoteproc@d00000 {
> +			compatible = "qcom,nord-soccp-pas";
> +			reg = <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "pong";
> +
> +			memory-region = <&soccp_mem>;
> +
> +			qcom,smem-states = <&smp2p_soccp_out 0>,
> +					   <&smp2p_soccp_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
> +							      IPCC_MPROC_SIGNAL_GLINK_QMP
> +							      IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
> +						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <19>;
> +				label = "soccp";
> +			};
> +		};
> +
> +		bwmon_cluster2: pmu@1014400 {
> +			reg = <0x0 0x01014400 0x0 0x600>;
> +			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +		};

This isn't supposed to be part of this patch, right?

Same for the ones below.

> +
> +		bwmon_cluster1: pmu@1015400 {
> +			reg = <0x0 0x01015400 0x0 0x600>;
> +			interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +		};
> +
> +		bwmon_cluster0: pmu@1016400 {
> +			reg = <0x0 0x01016400 0x0 0x600>;
> +			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +
> +			bwmon_cluster_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-0 {
> +					opp-peak-kBps = <800000>;
> +				};
> +
> +				opp-1 {
> +					opp-peak-kBps = <2188800>;
> +				};
> +
> +				opp-2 {
> +					opp-peak-kBps = <5414400>;
> +				};
> +
> +				opp-3 {
> +					opp-peak-kBps = <6220800>;
> +				};
> +
> +				opp-4 {
> +					opp-peak-kBps = <6835200>;
> +				};
> +
> +				opp-5 {
> +					opp-peak-kBps = <7603200>;
> +				};
> +
> +				opp-6 {
> +					opp-peak-kBps = <8371200>;
> +				};
> +
> +				opp-7 {
> +					opp-peak-kBps = <9657600>;
> +				};
> +
> +				opp-8 {
> +					opp-peak-kBps = <10944000>;
> +				};
> +
> +				opp-9 {
> +					opp-peak-kBps = <12748800>;
> +				};
> +
> +				opp-10 {
> +					opp-peak-kBps = <14745600>;
> +				};
> +			};
> +		};
> +
>  		rng: rng@10c3000 {
>  			compatible = "qcom,nord-trng",
>  				     "qcom,trng";
> 
> -- 
> 2.43.0
> 
