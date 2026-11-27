Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754056;
	b=xQpGG7rkxu3xqEd8aZV+NV4n3cpasXaGmSyCsrKfsCO3eJ+9PVeMEG14r5jF9QGGuYH/
	 kAvfyZste5lfwEhqjVhvlbU7uF5wY7kWvs8tyGDuaAUfMue8jGAInoQheNCE5ogrPWPus
	 lTWnGjBD0O2X6wx/3dPhFV5mxEsyRkA+U7jr6esiLxa8nd8F5JU3aYfxcUY/qma4AyLSC
	 6T05YT7Ho2KVJuqixozKByzdU1GSAAH/4v/gx+WXsAm4BpDKAdrIuFHHShbnEI0mo9UOP
	 autic5C0MSiFeFDAf4CiT73BxEbcj5EFAxPPX/R2P3NwFKMwg55rg5g0GUwLahYOl8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=;
	b=eWl2FF9WYr+RLfz5lW2m5mDjQWKsfxrggyrOjnZng4gaHJPWP+bf9cKZxVLJ/PcVsElB
	 5V1T2IoKme8XPru0LuXVu5+jvv/u6uxbqq1TDBg1HcQk70NeKnZX9YYIxbMTOvCLL7bxT
	 hQWd0thBEIMJpkuciV5IwY1DV6tkQnu6TUESJH5ANVxNfW6bpqc7fEkGJfZY06lZl4e3C
	 rUS0fEmkKXI3eQu7LXFcvREZ50EC6kSHn87z6sD/IGW2+9nGx40kaIX0Roo4zzN6b+8OV
	 49YNiDSlz5AlMNVgVyK1zcKbPU10318ObjJ2jHfrkdO5Htsn9DEVJnEnXLNVgGXzACA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGue6d1m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y5PbYJnU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA935606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA935606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGue6d1m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y5PbYJnU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwDNf2354305
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=; b=nGue6d1m8DsYwjEj
	4sWcw6MIvmApzfyB9G9mqIfk2o6B/C9LQwTaCwRzWqQVUtN64BqeNFY4NpLNb5Bs
	lcfPTugE92I1XzFOE0xph+lLi+78uKYQPkSkyn/EI/G1M3ISxeYQQ6LrhZ9ctHvt
	jkCCIqPVG/WOCMH0P33h0QvDOdaWRQxklqBk0CL3oU1WbusJRxssxTUO6Du4r4QG
	TeGfFjZlmxhz3Nf35O6XUzttV4/jXlGHBdvuj+fenx9BzF01T4cudNmAhuFtKRhJ
	dHf3mpgV+EaoCNlJrQg6SCd4HeFCDmQsKWIexpiINIqKJI07Hp5IdugX41nme3K4
	qRVfnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7us7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:34:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so5338358a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795754053; x=1796358853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=;
        b=Y5PbYJnUmHx4cZz+DctBrWk8vLPNXZ4o1oQmPkRcW8ScYsCqU3REji5TvQ20koLtFq
         4twIRx4P+aoFbPWc1vUQxJQ8ssrqGlDgLo97yCQZjx1S8nOfFzPoaSDveazOPhxWzeBs
         w3f1RnBAojIwuOijuVYER74u1sYfp8NLEd7c4HBNymsXvk89NantfwG9Vef35CnKerUL
         5HYAlrrdtWRLpjtPuAYQasYW7c31eH9pUPeqbLXyxM7+vNZYv8pHcnkKEGq2PAHXuo6H
         Qu5qXdA43cfzqtXwH4M+xI9jcQu4VLJXxankV71ysCHuAZE6BdDoZY//tcNHSgPBNXXE
         yOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754053; x=1796358853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=;
        b=1TjfcbRp4sr5ekRtlVfChTL4bvAhenylsDotf+Dwi8Bpt5g2iVXvxh/CnbCEIpGXBT
         jrMLXpRDS9Xby0hPIuGZzYkdo3+ACHrpksvi+1m563Ao33YC4jbIeYPPvo8djJkfTt1A
         Mf516WuXm0/s0s1dPnA5J8yEhykmA0L383G4IeMTAZtL/7it+IgxsYdT3UlJpotzZUCU
         kj5NskVjePnH0Up6jr0ug/kKPkFkebDn69iTy7VYA7BDe2GR/a1twyzY3Zp6XEQyybkP
         fA7T4vcjq9u2g3p3/feaYysncGR1NqVsgWqz1xKZMi/mbra+CpD99U3FUPHuPw3Jgviz
         aLoQ==
X-Gm-Message-State: APuU4Z+GM8p8j8v7W0jiQc3YH9VAGX4E8Lo3oo/saSu8zohhNq/9cdCi
	ncMvhzPWvtnksH4v2mP7lg2IzEqBxp6T/8ToMVKI9TmVQ9PX82pq0x9Fn7gxXpC4JfYkDmoS8Na
	1iJU9M4Q2qBKRcNh5q5GlZ16JE2d9ZmcdK6jr7TOJmqHMxazkchJC/FQp8KCyID1Rj5Cd
X-Gm-Gg: AZFdTZcwgmhaHQlog2fouOk8ZdmbCaLwkHvWjX20marV6VTbdh/sXyu+mSVjAqZtMfY
	udTGBU1MGaVyc/QS4xC/3fnF1ZZTAn1Vrv8Jd+f6RqrgtfbZTFGLaWLLNfhtNotE9qclPV4HeWp
	6GZ2z0YzX/dCGFq2qrt6B/hCq3ND+/hayF0m9/oMTX1y5QYd6tWcu/SVN2dXlxPYpZscBLVgudG
	gjFhWdnkxH5+cNzyCT5RZsJKEyQmxW0F/OcPtumJ9AbEnH4qBpVTmBHN2XESsTYhMBBF51A95ON
	fg0UIRzEoFppRuVBvZ8Kmx+Kv8J7F56AbJGQGtFNo8R/8JcShNJHOVx5Cx1ldPDXR4KUihd6t4D
	J1U+2KhWLlHXL5ny7mIAMOLDyR1/aZ1lZ/swbhw9j5nlTg032EIFiu30+oXqE7Xrn/npLc66+Ez
	6m5ErMct7lIuF/42VOY0gsdBAdr4Pi6B3eGaAtXg==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr20195710a91.13.1795754053387;
        Thu, 26 Nov 2026 20:34:13 -0800 (PST)
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr20195683a91.13.1795754052777;
        Thu, 26 Nov 2026 20:34:12 -0800 (PST)
Received: from [10.133.33.188] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm36653001a91.6.2026.11.26.20.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 20:34:12 -0800 (PST)
Message-ID: <8d0150ef-a8f2-41ac-9128-9d887cbae6b8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:34:08 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add CoreSight nodes for
 APSS debug block
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
 <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxNyBTYWx0ZWRfXwInKd8k2hSDY
 JZXES2mCEOZdUeU2jXOByaW1C0OHG+QnpqGw2R/dwVRsuG4CY0AO2nSxpRE0sXegjtcWafS9RQF
 x/F3xQrr6PDD3CvNjnOtCg5Lr0HoHsg=
X-Proofpoint-GUID: XIi8csmgYsiEMMlEZRVMr7j_f_9iqn8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxNyBTYWx0ZWRfX5pTOTGaPDGka
 JSm0HbDtyN/8fzmd68b52169cQ17Lh08u//xf/KoAkwP/RwfwAI520+Ff7MAIUcLEDK/Vaih1Pw
 L2eDR/D1WJ8HvlVaLn4E9KGiL0hnPEHaP603RuaubVNI8eBvRctlVAWhTzTYW8IJJrxLUJZSJRe
 i1pzl0PGcY0p37olwdVHOVmbyJJyPTJ3B0/OkilvuTzhP+9hkosZcaUQXrfelk8JSJZK2XL+9uZ
 r04j+UnuGrwtFpvV2H10DsKwt4U+ktfGTzEd6bgwiuAkIcKJuIpKts3spuvYpCiNVRaHUlERjZP
 1B3qhRyKr3jIAZTsAX4mc5o8ePr6bLrvYYrvrkwrhN6WWMTBPBZID9VsErcn8OZkxDaSXgapGIj
 2z+0XjCQGp+4FUGm00avr46kK2ZLtt4d5DChwFU8QcwpFVnHsFf/H3u0ASgaOG8ZG5GOQBm9vP8
 AiU2S0wQpeQzJGlTiwA==
X-Proofpoint-ORIG-GUID: XIi8csmgYsiEMMlEZRVMr7j_f_9iqn8Q
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b090846 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5P6q2tN5KZ0Jhqwe1_8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270017



On 11/27/2026 11:10 AM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETM,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to
> enable ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated
> always-on rail. Add a power-domains property referencing the
> corresponding cluster_pdN domain to each of these nodes, so their
> power state is tied to the CPU cluster domain and the runtime PM core
> can power the domain on before the devices are accessed and let it be
> powered off otherwise.
> 
> Mahua is based on glymur but only has 12 CPUs across two clusters
> instead of 18 across three, so delete the ETM and cluster2 CoreSight
> nodes that have no corresponding CPUs on that platform.
> 
> Kalambo is based on Mahua with the first CPU cluster removed, so also
> delete the ETM and cluster0 CoreSight nodes there.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi  | 1184 +++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kalambo.dtsi |   16 +
>   arch/arm64/boot/dts/qcom/mahua.dtsi   |   16 +
>   3 files changed, 1216 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 165dfa11f17f..9dd23a52fb2b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -397,6 +397,312 @@ eud_in: endpoint {
>   		};
>   	};
>   

[...]

>   
> @@ -7837,6 +8151,51 @@ pcie_rscc_tpda_out: endpoint {
>   			};
>   		};
>   
> +		funnel@12080000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x12080000 0x0 0x1000>;
> +

Sashiko reported this node is out of order and I confirmed its valid.

Will fix it with new version.

Thanks,
Jie

> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				apss_funnel_port0: port@0 {
> +					reg = <0>;
> +
> +					apss_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc0_etf_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					apss_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc1_etf_out>;
> +					};
> +				};
> +
> +				apss_funnel_port2: port@2 {
> +					reg = <2>;
> +
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc2_etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					apss_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in54>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@11c03000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x11c03000 0x0 0x1000>;
> @@ -8514,6 +8873,831 @@ rpmhpd_opp_turbo_l1: opp-416 {
>   			};
>   		};
>   
> +		cluster0_funnel_l2: funnel@1d021000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d021000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc0_2_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_2_funnel_out: endpoint {
> +						remote-endpoint = <&ncc0_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_etf: tmc@1d029000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d029000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_etf_in: endpoint {
> +						remote-endpoint = <&ncc0_2_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_etf_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_funnel_l1: funnel@1d081000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d081000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ncc0_1_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc0_0_rep_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ncc0_1_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc0_1_rep_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc0_1_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc0_2_rep_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					ncc0_1_funnel_in3: endpoint {
> +						remote-endpoint = <&ncc0_3_rep_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ncc0_1_funnel_in4: endpoint {
> +						remote-endpoint = <&ncc0_4_rep_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ncc0_1_funnel_in5: endpoint {
> +						remote-endpoint = <&ncc0_5_rep_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_1_funnel_out: endpoint {
> +						remote-endpoint = <&ncc0_2_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_0: replicator@1d090000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d090000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_0_rep_in: endpoint {
> +						remote-endpoint = <&etm0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_0_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_1: replicator@1d0a0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_1_rep_in: endpoint {
> +						remote-endpoint = <&etm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_1_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_2: replicator@1d0b0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_2_rep_in: endpoint {
> +						remote-endpoint = <&etm2_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_2_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_3: replicator@1d0c0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_3_rep_in: endpoint {
> +						remote-endpoint = <&etm3_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_3_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_4: replicator@1d0d0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_4_rep_in: endpoint {
> +						remote-endpoint = <&etm4_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_4_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_5: replicator@1d0e0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_5_rep_in: endpoint {
> +						remote-endpoint = <&etm5_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_5_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@1d121000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d121000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc1_2_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_2_funnel_out: endpoint {
> +						remote-endpoint = <&ncc1_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@1d129000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d129000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_etf_in: endpoint {
> +						remote-endpoint = <&ncc1_2_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_etf_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@1d181000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d181000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ncc1_1_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc1_0_rep_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ncc1_1_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc1_1_rep_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc1_1_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc1_2_rep_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					ncc1_1_funnel_in3: endpoint {
> +						remote-endpoint = <&ncc1_3_rep_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ncc1_1_funnel_in4: endpoint {
> +						remote-endpoint = <&ncc1_4_rep_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ncc1_1_funnel_in5: endpoint {
> +						remote-endpoint = <&ncc1_5_rep_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_1_funnel_out: endpoint {
> +						remote-endpoint = <&ncc1_2_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d190000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d190000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_0_rep_in: endpoint {
> +						remote-endpoint = <&etm6_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_0_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1a0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_1_rep_in: endpoint {
> +						remote-endpoint = <&etm7_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_1_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1b0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_2_rep_in: endpoint {
> +						remote-endpoint = <&etm8_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_2_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1c0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_3_rep_in: endpoint {
> +						remote-endpoint = <&etm9_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_3_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1d0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_4_rep_in: endpoint {
> +						remote-endpoint = <&etm10_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_4_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1e0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_5_rep_in: endpoint {
> +						remote-endpoint = <&etm11_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_5_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_funnel_l2: funnel@1d221000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d221000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc2_2_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_2_funnel_out: endpoint {
> +						remote-endpoint = <&ncc2_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_etf: tmc@1d229000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d229000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_etf_in: endpoint {
> +						remote-endpoint = <&ncc2_2_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_etf_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_funnel_l1: funnel@1d281000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d281000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ncc2_1_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc2_0_rep_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ncc2_1_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc2_1_rep_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc2_1_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc2_2_rep_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					ncc2_1_funnel_in3: endpoint {
> +						remote-endpoint = <&ncc2_3_rep_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ncc2_1_funnel_in4: endpoint {
> +						remote-endpoint = <&ncc2_4_rep_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ncc2_1_funnel_in5: endpoint {
> +						remote-endpoint = <&ncc2_5_rep_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_1_funnel_out: endpoint {
> +						remote-endpoint = <&ncc2_2_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_0: replicator@1d290000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d290000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_0_rep_in: endpoint {
> +						remote-endpoint = <&etm12_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_0_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_1: replicator@1d2a0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_1_rep_in: endpoint {
> +						remote-endpoint = <&etm13_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_1_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_2: replicator@1d2b0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_2_rep_in: endpoint {
> +						remote-endpoint = <&etm14_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_2_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_3: replicator@1d2c0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_3_rep_in: endpoint {
> +						remote-endpoint = <&etm15_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_3_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_4: replicator@1d2d0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_4_rep_in: endpoint {
> +						remote-endpoint = <&etm16_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_4_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_5: replicator@1d2e0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_5_rep_in: endpoint {
> +						remote-endpoint = <&etm17_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_5_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
>   		nsi_noc: interconnect@1d600000 {
>   			compatible = "qcom,glymur-nsinoc";
>   			reg = <0x0 0x1d600000 0x0 0x14080>;
> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> index 868b924c4734..41218577777b 100644
> --- a/arch/arm64/boot/dts/qcom/kalambo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -5,7 +5,17 @@
>   
>   #include "mahua.dtsi"
>   
> +/delete-node/ &apss_funnel_port0;
> +/delete-node/ &cluster0_etf;
> +/delete-node/ &cluster0_funnel_l1;
> +/delete-node/ &cluster0_funnel_l2;
>   /delete-node/ &cluster0_pd;
> +/delete-node/ &cluster0_rep_0_0;
> +/delete-node/ &cluster0_rep_0_1;
> +/delete-node/ &cluster0_rep_0_2;
> +/delete-node/ &cluster0_rep_0_3;
> +/delete-node/ &cluster0_rep_0_4;
> +/delete-node/ &cluster0_rep_0_5;
>   /delete-node/ &cpu_map;
>   /delete-node/ &cpu0;
>   /delete-node/ &cpu1;
> @@ -20,6 +30,12 @@
>   /delete-node/ &cpu_pd4;
>   /delete-node/ &cpu_pd5;
>   /delete-node/ &cpu_scp_lpri1;
> +/delete-node/ &etm0;
> +/delete-node/ &etm1;
> +/delete-node/ &etm2;
> +/delete-node/ &etm3;
> +/delete-node/ &etm4;
> +/delete-node/ &etm5;
>   
>   &bwmon_cluster0 {
>   	status = "disabled";
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index e7141f8c9e0d..d2ac3e632ec0 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -9,8 +9,18 @@
>    */
>   #include "glymur-cob.dtsi"
>   
> +/delete-node/ &apss_funnel_port2;
>   /delete-node/ &bwmon_cluster2;
> +/delete-node/ &cluster2_etf;
> +/delete-node/ &cluster2_funnel_l1;
> +/delete-node/ &cluster2_funnel_l2;
>   /delete-node/ &cluster2_pd;
> +/delete-node/ &cluster2_rep_2_0;
> +/delete-node/ &cluster2_rep_2_1;
> +/delete-node/ &cluster2_rep_2_2;
> +/delete-node/ &cluster2_rep_2_3;
> +/delete-node/ &cluster2_rep_2_4;
> +/delete-node/ &cluster2_rep_2_5;
>   /delete-node/ &cpu_map_cluster2;
>   /delete-node/ &cpu12;
>   /delete-node/ &cpu13;
> @@ -25,6 +35,12 @@
>   /delete-node/ &cpu_pd16;
>   /delete-node/ &cpu_pd17;
>   /delete-node/ &cti_wpss;
> +/delete-node/ &etm12;
> +/delete-node/ &etm13;
> +/delete-node/ &etm14;
> +/delete-node/ &etm15;
> +/delete-node/ &etm16;
> +/delete-node/ &etm17;
>   /delete-node/ &pcie3_phy;
>   /delete-node/ &pcie3a;
>   /delete-node/ &thermal_aoss_6;
> 

