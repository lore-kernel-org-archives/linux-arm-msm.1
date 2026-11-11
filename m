Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402902;
	b=NN4DX6DTEtpgairKBXp2y6R3BOPUr9eroxqgpmgzpXWoVyYOIdznYgEev78ICrAsIqb+
	 3Dmbrkg7TY5BsxrjEu+cZnQb3x4iwcdsQ3kzdPHOnz2vONwCdN3lrf9SDl90RL27Gma0U
	 Bx7ygSObIgGVxsOxFfo3c/JzrfMppDV1810OQ3F1OCRf1Vw7a45L5kBfQOE8ppmy4URgp
	 I66ZD6mnNu322Lfp0iE8VwwgnhzKhDFyHjhifBp8VdqjNi9/nR2Xh800+12vpR3uE0RIF
	 F2Hjtvkyvy6Bbrv7Eh9lqi03USEeZMqYhz1ksbXapVB2CXbOfghzZMpyCBbB2ScwF7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
	b=FfNHvFpLqSewjaQ7InkNQgwUytV5cnvSyDRkIiFafLK2oP3003XHLGpxH6fCzddEZ7jJ
	 ipFqcSGEkWPPJvNy53prT8/ROE2EVhS4hRmejidCI7Oe0ujELW90OA8B+JwqxVLpr04Bi
	 DLaNMX2vGNY08BLLZKl3scrIF7r50btJIPrPehkR6TdoARFKQvyHl8ZSi4mxzk6yyUyn2
	 ElQCZ3Ax4Z2vXxhGrQB+E3FI00AzFZFLbsbQRb5rxK0mFZKwLmgnakfcl4ZoFAAAC7a6+
	 q7eUQwuMZZ5FHOAyI3rSzLjgB3BeoxVQEhxoY9TTdfbVxuhFVaeWHXRVA9badjN4REg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QtFjtj/c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6D606A885
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F6D606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtFjtj/c
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZN3b708117
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tLARcSRWSvevnIhYpFOUnFGS
	3qKDWwMnqMdZ7F5zyEw=; b=WqvouyijUrOk1DUJ6M3CdlTnuxWmS4QaeFAd3EwD
	dhrvlSAfVfJL+z5egf+CST5PQpaf3ezbv8qWApbEdOCiYEv0YTIN0wK5p6+Epd7L
	rUhTle486WvNs/YrxHY8/814TV9WQ+ZdHJIZMPs5C1sFVskfoaP9UF1YSYHqbOpo
	vYn9332qpC3woGUO6uBUHMN4BmXgYYMr7YDMvouidZ1vmAor0PJ+C1+JVdzo82/k
	MSJ/tcIS0LLK64Mi4jTF8R7EVQnqOhWukdQjg0sdys23+VgGa3jO6EcKfLf/o+3v
	7S8CNY4iOGbHA1FOXAEe/mxCxqaoF2AWWMQAf0qt6HkrKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33n6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:15:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso714722785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402898; x=1795007698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=QtFjtj/cT6ns48OQv0ldbES0V3eci9yd6s74s4vT90+AMOpbxE7kj3Y6u6/z6FrVCi
         Y+SK4r1G58dCbnIbUxYrfQY6aZ6p1anJNyFGAyk2tQHvbMVeebPSOmVGDV5vTJQAGjwg
         novxHnjGhRxipByX3PlkvP1lY2CjHT8DPb9yaQXEmbEQB3JgsWmH8FsnX4+FDYylWeps
         owR0QaJh2mEVLfYAHQS1vLf30YkjGRkiy9SzWZqduEuXC/zTawrKlAtqJNM/781eRaEa
         wzA0QxPBnM+GHyY5jNH2pyt8nmmlWbu/C+kwvlQbimmaKYiL0ENiZ/e2zIAZF3Mywnoi
         psyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402898; x=1795007698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=Ho/ykG/e3abyw6vOdHqLNJdd+cVygJwcDxsoKAETa25InQ8hM+S6pOF2W/8wIsy964
         wUWfGce8IShEz7aNUXPIf661BvKHGZcScb2O/nNA3YMlTrcyer+jg7s4IwQcFnR4X4nH
         eR2aZxZNvsqeHeMnaDytm99O3VJVtGjKTTHuxZEl0Sfm0m2KBtEPtuFrebBhtRrrCHqO
         fIxMmoVFRRZUee38AtKjis5ReXMeyl0AcpFYyKLafqPobNF6AQtKgFWre/fzD/Wel0YF
         xNwsHwhb50rFxPjTOttyqIo3oaxyBq/W82dVbBp2ZRaT1B21UMpirK6VX9Tq/rb394PL
         SPYg==
X-Forwarded-Encrypted: i=1; AL+hErHb4M0fIS8oG8VLa1Pb3YyHyuLrsr9/ohbFKQC6i69ytnFakOgwoXb7w4o8fMmRcbOwAnszrEEQx1sEyije@vger.kernel.org
X-Gm-Message-State: APuU4Z866kBVMDb6nMYlUZacajmdQO4GGNN54N9dSuwea/OBpiL+Ea/S
	WsmuKh0e7MZ/DggL46jEOJ2fE098ve4D84QfUD150z3lSU5All1dRstFPMY0RrPdge+R7/CGXcS
	sBX5CVP3X3vjtRnDVhE3kuloLNnLJezRS/MTshQMHGEArA+gYxjAS7AeVlWTjUP9S7Tqz
X-Gm-Gg: AYBFou1L9ZvoK9VknHj/o/PRxamw0xrW1mCvxjN7tHzhyyOMeGPODdKN17yuYRofdMS
	ry259ZgBN6/O4BI8PAg7ZDKmGwkCjpCYtJ/28QWrPSl4RxAGFyz5C6BbjVaack1t1xdCvfD4ima
	SO1uo4DrO53aBKspBR7bS5Bp4rudI0HOrjZUXsffvy9x3UCBEJmra+MxjPOGdPxn1V5lOX4Ug8i
	PWm74BjblDaFxmIeKhj0esHE52hXoZLS+k9tGd0Ff57cLftiB/C/bYFvu+umiCmEJ6fQmcl9Mqa
	+WJXok638NkbIozqo2Ja5lDW8P2I1YxrH5bBDLxIx1E57LzuRQRMpeC689fpmUxZt3GTMsLFhzZ
	l/82qnHNb6Jjsl9mNEtLy5kc/Qx5VUCgBORDozS38cdevzaOdmYupi8do96iQP8kIAENSfoEk7i
	54fYVMT+3xlzELtD7EDomr5MFcBSImg8ic5M8C5SiKVyYuvLSovMRtF2db432mcg==
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372346885a.6.1794402898472;
        Wed, 11 Nov 2026 05:14:58 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372340885a.6.1794402897888;
        Wed, 11 Nov 2026 05:14:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm9929161fa.0.2026.11.11.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:14:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af46a54 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ad0ScDXB7ZbbMzgY0o8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX9FUwZQnet7PU
 rK/Q8qKZRzsLqY+8mM0EOb1ws3osV4z8bAeB4I0kMoEefGzEo/VpooGCU5kDwODZ3IkWilfjQzI
 lPruXw7JiL2yvs7kzMFv2y2gu1GgA8U/mLcH/Vh22jyfYuYgsNxGc3tbGicxA/4cd0ZNaEpX57n
 Gy+mMmT4zt8/JvTEzOmM2MC6kLWErXCOOsPHbbKLGagu86bUnIoDc4UmpY09Nt9UEEV/QPTX3PY
 OpL2JRWmDnoR2RQ+mGi8lkUgxlFiCDkx4Y5U5hb9G59bJlqUHvP6/RpnqN2FmmFeDZUZgUnr4Ef
 xRhP/CZ3O8+IP5FK1Nr3XegauBFnLDgY/L+a+pGDg4QwuaWQuxnOA+GB+4nrKPnhVkUMkPUSqBV
 8eH4f6ShAi6FCyOcdntHhiCZJGFG8/obZEe9ur3o4vsi+GRT79AN3baH1xKOJ1JcRxf16W0deqq
 LVlIkVtOqHbmlMqLq0g==
X-Proofpoint-GUID: -tzHRB-rLOElHNqB9J2j6G0DpAYDxbig
X-Proofpoint-ORIG-GUID: -tzHRB-rLOElHNqB9J2j6G0DpAYDxbig
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXxZvprVin+vNz
 RHNIFD3UYNVLBWOfpOOAe1/1hVZUDddArixLciESkydVkE58uEwL0Ugkih57dCXSu36mH+5LGeL
 InJLOUlj1Tn/+jn/4Yw8+ZW7HLydx/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:06PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f975c2183269a..7e8447df40188 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";

Drop, there is no point in keeping it disabled. (And the status is
expected to be the last property anyway).

> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,

TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
separately. Instead cast the votes on TITAN and they will propagate to
the MMCX rail.

> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "titan_top", "mx", "mmcx";
> +
> +
> +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;

Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

> +			interconnect-names = "camnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					opp-peak-kBps = <262560>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-peak-kBps = <524760>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>;
> +					opp-peak-kBps = <978600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
