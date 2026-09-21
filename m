Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C035C6BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969267; cv=none; b=qHiFk3BwRoWFd+opSMtL3eFXyA+nQiBbsEm/aMEGndgLZx4sMOWhn65klzHeNfW2FF8KVJr+kGvhVTbOBicE3iX+X3vFYHcRNgC9VSUlMFlOGgncYN6oA/GiSXFBLupXcDrNK1FO5EF8EUFbFdUpjWjxMVmBkORIVwozVh9Z4qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969267; c=relaxed/simple;
	bh=d3HVsWk02OgPZg4wIfAf6CTsMf4Z1Rqgb9pdc8/ud0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YY/ycCm7LVciw4dRBjssarWx2xy4XMJqcrbHLP+xs1n2rwgRECXuJkaP2gdc02CIpMsDhkm2RH+NpY8H8SFOiVF8/GBGE6whOJVDeW00o9HGi6rzCpP4AIdjzp7dYgmdDf3gEKE1wYzXAd1SlrETSwWMunUjiAOkn2oYIm+vwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrurabCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz5cRno1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrurabCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz5cRno1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z203485200
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5O1q2g0NwbsDyABvfhBt2IxcvC+noAvU+RSFr0J+CQ=; b=BrurabCZzZ5zl1yA
	xhd4j1v5Ifv5KQxUChIUcuOI98tJ3cnxA1BMT/zjnbjBs96p6zf84apN0LJJedvj
	OnK01pv9dDK1foFWo7IeerWKkxuIOIZfxPiE8sKK4bEoCkGCPkJVg3PF5W7RS9z/
	8FKxCOXou5PPsRaO9Zt2IcHVCrqYbcrN8J/W87amn4hlTjSby9/dTGsetrNxRSJV
	rjdHxEIhduOp+bA2kTmuZeAkXs9trgZoezxZekAlLhozEK+wrDk6lF0+thhS6TkF
	s19kSKFaQFlsFYJrQes1KKn6auoFpDTq7kg+2ehdMvKhK75up39s3gGgUqSNH5ny
	9cXiwQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j92fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:41:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso4837506a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969263; x=1790574063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5O1q2g0NwbsDyABvfhBt2IxcvC+noAvU+RSFr0J+CQ=;
        b=cz5cRno1U0PKLq0T0E7P5Wsph0pEitpuB2qQV8Vpno6uMV6j7PVTkOdrLn+nFnu5p6
         dNC5/wCv+a2koDvjRn7qjm9O6TUWvE6dwPfvsvQVSiESxSwv5DUdphK19AeRh1AluM71
         44ckB4jUTvGirgPjlo653CuiwVrpk2HDo4MSLDir5bzJvHSxjGWjyCc6ggPNPHPW+PmY
         fQaQq/OPICpDHQqROYUn/A7niC86TtFngUlJMZ/htVpjZ/dNx30bKxx8T1xNz6/QtOet
         6xt+Q88JvPZVlZyadFvek9tkvC8S0Qvml7EbCQKDrcTZ/QwvO6lhGVX+zqsktA6IFSMr
         NvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969263; x=1790574063;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5O1q2g0NwbsDyABvfhBt2IxcvC+noAvU+RSFr0J+CQ=;
        b=FPln81JtSMu6qMDGERSLNUn8/IMA7k8USF/T6P64VHuy/202x2P+Rs36QhGNiwLUKR
         NYviGH5qTUaeE6cgiv0qkTvz/brhxqIlSLewVmPTmm+uY85C9hA3Tg101/9pIRqDnLPl
         CacDXwyll64H9nXf1G0LPl0hIHO/ipK45ggD9T/EwAvnR8UBswS5zj6qzJWA164gOZPj
         tEnABUkHSBq6fbWPuWPsqeWAxNZpkQoNrqu6KeqrYTuB5RLkAPZk2g4EMJWSjQE4sQ6l
         0xjp1bH2BOtTZ1FiA6PrMuzTpn8vbsNiTGf4wyK49Q8GikDsoUttcKfhkhhYYqbPPC09
         pHEg==
X-Forwarded-Encrypted: i=1; AKwUvBx+WAW5py+AST8qFxRdFvr0cnuS9xKrQWCGEoz+wFA8WCBn7Auwi73fHezhRgMDAz9w5MWS0mO5TmCQs8eo@vger.kernel.org
X-Gm-Message-State: AFuF++kYzeyB2/rML733y3rpBMZmXysT2lX8V6R+lTyPZxVeIEIrvu35
	yARXH72pKGN5Hnpw676zQg+lq3gNcLmXeBvqPqPJppA2ya5MjgVOxT2q/SPk2Ja2eBFbiIDUkZO
	Dt2jNx/3hwYWLmGbUduC+bmGeJQfE4lnmmQhzXlC1B1eRZNDK04jX2ujO4QteNKHacQCZ
X-Gm-Gg: AYBFou0RLo3S5bpzfiddPQ5WTUj9WWYfMzJshRca01g5FpX4Jgi56FZ05MPl4xoB9DP
	aMu+mZzi6SqPQofOB8pf+wP/ofwu2s0rQQvbUiAPK1UF0b1s/Fio5hHzv1MJX1+5aO5qzGPu/hl
	2lzbjAnCN7uLKgDF1czGaCBOHJnOkRS09eDF6u/aVGeBtyK+Zk99Skf7kP+MEsbd4G8t+ph/SG9
	s4LF7y5QVnHeWaeBR2mNrfTxJlmndV6T6bdQjD+5u4LyqRjdAWcrs4nc1H1FTDMLYZMkK30gXKg
	SKiGVHOqyT+kEw4nzqHgbWtvs5XUtf8SL9rj4Pz4dBena6HK5R0AAqrCbbkUtFYxrz1C3t4wo4Y
	S90Chc6H2YGr7glpQEHkgVOY5ZUGB1JA=
X-Received: by 2002:a17:90b:17cb:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e54d13343mr16318604a91.13.1789969263269;
        Sun, 20 Sep 2026 22:41:03 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e54d13343mr16318581a91.13.1789969262785;
        Sun, 20 Sep 2026 22:41:02 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e14dd04dsm6579012c88.7.2026.09.20.22.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 22:41:02 -0700 (PDT)
Message-ID: <43e757dd-17f7-5b03-33e4-5c567e164be2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:10:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: nord: Add iris video node
Content-Language: en-US
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-2-94428761ec06@oss.qualcomm.com>
 <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab0c370 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vTOospmqq8J8sbT3TakA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OSBTYWx0ZWRfX/QoEgEvdKS47
 IrcRRhyOV6PTDsrMt50JvsB5i1JWjZlUECeHgZKuSQEHQpB9dgY7GDk1MEs/2r1dgMFka2pVJqr
 Yk6/GweZHSqxy/4DrD6pmCnkGS/edE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OSBTYWx0ZWRfX0nuQmsCdk1pg
 bVGNsGVf6CU5AKKdvaWzKqhOTOsmOqLvC2CaZTjAEc/u1sMU1y0ajKfHPCgnTo9II6eERe6WEDZ
 fC7bJSqlOhUXM9G0/u3zRw/DRVv8g7pUfANPCeMDlog549E5FRhfaoIp4uoh1MKrniMbU65rP57
 sZhrMPXhP66LdPi4h/CV4B0mpx/hhf2qdjzyaq1hFmLITlzVB+RI7HtE2N7ALZ4L089br0jA6hv
 /QoSYnY4U5TYlU4u72m2XNOjVVNtd93PToa9HITtyBWbC/pXNSekInt6/EaVZa2PWir87wpYNHs
 OS4EJzvd3L3emHUVLe+3BKdtXHC1y7O/Jn7jr+MVT7WMb+LPCR7ex0EAIM/r55A3aMdX6YX8wCy
 x1hdXELPS0Rr9Cgsi7iTpLS0apOObCLVDViN809EScQN6xbbNigG7oeQ/kSdeUWbklew/C0TWJu
 lMna9ElB8nTJdPyi1ZQ==
X-Proofpoint-ORIG-GUID: kvq1nkoc6rmcT2W1Vtn_x0q5b0ISo8O7
X-Proofpoint-GUID: kvq1nkoc6rmcT2W1Vtn_x0q5b0ISo8O7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210079


On 9/20/2026 6:46 PM, Shawn Guo wrote:
> On Sat, Sep 19, 2026 at 10:14:56AM +0530, Vishnu Reddy wrote:
>> Add iris video codec to nord SoC, which comes with significantly different
>> powering up sequence than previous platforms, thus different clocks and
>> resets.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 114 ++++++++++++++++++++++++++++
>>  1 file changed, 114 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 74f4e6be8652..03f827f3e5fc 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -1428,6 +1428,120 @@ camcc: clock-controller@9ce0000 {
>>  		#power-domain-cells = <1>;
>>  	};
>>  
>> +	iris: video-codec@aa00000 {
>> +		compatible = "qcom,nord-iris", "qcom,glymur-iris";
>> +		reg = <0x0 0x0aa00000 0x0 0xf0000>;
> nord-embedded.dtsi is a place to accommodate Nord Embedded variant
> specific resource descriptions, like clock, regulator, pinctrl,
> interconnect, power domain, PHY, etc. The rest of descriptions should
> go to nord.dtsi, like reg, interrupts, iommu, dma, etc.

Will check and move it to nord.dtsi if no issues are found.

> Shawn
>
>> +
>> +		clocks = <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0_CLK>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
>> +			 <&videocc VIDEO_CC_MVS1_CLK>,
>> +			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +		clock-names = "core_iface",
>> +			      "core",
>> +			      "vcodec0_core",
>> +			      "vcodec0_iface",
>> +			      "core_freerun",
>> +			      "vcodec0_core_freerun",
>> +			      "vcodec1_iface",
>> +			      "vcodec1_core",
>> +			      "vcodec1_core_freerun";
>> +
>> +		dma-coherent;
>> +
>> +		interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +				 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +				<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
>> +				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +		interconnect-names = "cpu-cfg",
>> +				     "video-mem";
>> +
>> +		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		memory-region = <&video_mem>;
>> +
>> +		operating-points-v2 = <&iris_opp_table>;
>> +
>> +		power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +				<&videocc VIDEO_CC_MVS0_GDSC>,
>> +				<&rpmhpd RPMHPD_MXC>,
>> +				<&rpmhpd RPMHPD_MMCX>,
>> +				<&videocc VIDEO_CC_MVS1_GDSC>;
>> +		power-domain-names = "venus",
>> +				     "vcodec0",
>> +				     "mxc",
>> +				     "mmcx",
>> +				     "vcodec1";
>> +
>> +		resets = <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
>> +			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>> +			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
>> +			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>> +		reset-names = "core_bus",
>> +			      "vcodec0_bus",
>> +			      "core",
>> +			      "vcodec0_core",
>> +			      "vcodec1_bus",
>> +			      "vcodec1_core";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		dma-ranges = <0x0 0x0 0x0 0xffe00000>;
>> +
>> +		status = "disabled";
>> +
>> +		non-pixel {
>> +			iommus = <&apps_smmu_1 0x0940 0x20>,
>> +				 <&apps_smmu_1 0x0944 0x0>,
>> +				 <&apps_smmu_1 0x0960 0x20>;
>> +			iommu-ranges = <0x25800000 0xda600000>;
>> +		};
>> +
>> +		pixel {
>> +			iommus = <&apps_smmu_1 0x0943 0x0>;
>> +		};
>> +
>> +		iris_opp_table: opp-table {
>> +			compatible = "operating-points-v2";
>> +
>> +			opp-240000000 {
>> +				opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>> +				required-opps = <&rpmhpd_opp_svs>,
>> +						<&rpmhpd_opp_svs>;
>> +			};
>> +
>> +			opp-435000000 {
>> +				opp-hz = /bits/ 64 <435000000 435000000 652500000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>,
>> +						<&rpmhpd_opp_svs_l1>;
>> +			};
>> +
>> +			opp-480000000 {
>> +				opp-hz = /bits/ 64 <480000000 480000000 720000000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>,
>> +						<&rpmhpd_opp_nom>;
>> +			};
>> +
>> +			opp-533333333 {
>> +				opp-hz = /bits/ 64 <533333333 533333333 800000000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>,
>> +						<&rpmhpd_opp_turbo>;
>> +			};
>> +
>> +			opp-560000000 {
>> +				opp-hz = /bits/ 64 <560000000 560000000 840000000>;
>> +				required-opps = <&rpmhpd_opp_nom>,
>> +						<&rpmhpd_opp_turbo_l1>;
>> +			};
>> +		};
>> +	};
>> +
>>  	videocc: clock-controller@aaf0000 {
>>  		compatible = "qcom,nord-videocc";
>>  		reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>
>> -- 
>> 2.34.1
>>
>>
