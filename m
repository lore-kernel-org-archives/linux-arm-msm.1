Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65E352C54
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782569; cv=none; b=ZFb3qooFYq/QCkggNDR43DjJKZEQxK/ckH9+DlHeTUGOaCQKKJJxFrt1zKIYK4rhiPbPmPwIq9IoUxyyzDkC3rElb7IvueoT/5cAt4SUw01mr2vHFn7EljUXMJ0S4V9LOlkidwpXd9m+g44slBIOryDfA82K0gHhDFZkfDFAexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782569; c=relaxed/simple;
	bh=Is7cVHBL9VJkYWvJHLk1gILk5eXgqAUwj4yFUAB7td4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdrOXR3yZ3DozsxXzMucq0LZ5iX2Y3kepDdVbYx6IJFeQg5gpNOHNuZmsyQILkM48P5iPMsLGH7ojMWLcVuxLXFcysG/9EgK5Hbud1V8Bfl+aylcsbZOWwi6tK+aGQ1Qz3uOX7KRlnElvXnAWtnPXQEJRprLI4W1uPq436w0znE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKi/1e6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyLl2qSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKi/1e6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyLl2qSY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55pYF302994
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8BKWZVHSR9V4f6/HpYHrSFJOcgrLr37eR8Yl3ULiEc=; b=MKi/1e6M+3KxbKCQ
	yM1RlndeJURikFBoSCVKSjx8myh28FIwRww4X9RnFHKgTYir/FzuFDKU5Xt+dq4p
	POQMywIBrDf13FeegO0Ua76C3TDujO9XmQM4xofwMELGgsQ/0D3N9WHXuTM/1eVV
	xd237/NyHaG8UGCIMzPu7XTrRGlKbt1+vfWE2Bxs7WXndpmUUuc0rmUeLeEystwj
	xuA3gTe1g21BPI/xvlYZndmhqrV3gOZubabEB/Ug3gwMrs+SFsELxBd4bcNNNFma
	L12X6GWi0PyNMvKrnV7OM6SNCI3Wt7A77RO7BmnFFAEZ9NWymMuA90Cjul6XSLee
	vJkO9A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dh1j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:22:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so920881a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 22:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791782563; x=1792387363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8BKWZVHSR9V4f6/HpYHrSFJOcgrLr37eR8Yl3ULiEc=;
        b=HyLl2qSYUolqknRql45ivg0CPsAsdmpSPyVMdFwhS2FrNCwAu7suXRChJNCtZ/bxfh
         2+QaEt41mTZYuf5C227nk7YIjO/pC2Yj65OLC/TUvMA6RfkBuevMUQ1Wcjwl3cXg+yJ7
         4yXF/M4HnV/KxcPsmw6wV+YLbvN/CeJTyEg2yEuOcnqtrKDhgSNoUk6bEUt0WZ5hwnV3
         +Y0io8muAMNv7oNOpASAq7iVL3vb9TqA/6BXFJdiICTR82BF0iDTlGMdOnoF+0p31IWp
         qLjRXFi20edtuJQagQyboNd3bJijCkr7/CLc1LwU9Bo8XRE924JOO+2s1wc0siCl0hUk
         TTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782563; x=1792387363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8BKWZVHSR9V4f6/HpYHrSFJOcgrLr37eR8Yl3ULiEc=;
        b=PqQOtDfW2iz00zqkoXPZoHwIadr6APiA0BIxpFSI9+oZkHVNtIhuBkBnSt+aORdFCs
         DhF05ecbG6IChNgrVy3dKyCDz25z8SJq78oH7FZtHxGizdY1UKHu2OWWFX5xSbmDtARg
         5vY9vuEHBqUDXyQMUqchwTLuEgZWm4FcRaknenglqrYg67jpueIeYncKTrJeGLSo9zKy
         MJuIJlAfmAvRapoJDk/eUVgOJvCmXWzQNJfcUp388GhoRZad9AgZY+WqXFO/PH7R2ID6
         a9JSXpv8DOFy0zK9EeoSXNh52Yo4S8x+tWV/V9RAcyG/bClKE0qJgnqnlxBLd8f7QUCl
         O8zA==
X-Forwarded-Encrypted: i=1; AKwUvBx99RcI+RDQhW8BHslqDLQN26FXPjxLO9GOneQ9IJZwOAGQFNUubF/24xW9tQRSmWyiCUWwQqA0sS/vFMQR@vger.kernel.org
X-Gm-Message-State: AFq9FYLsWXBoDdNGAkGR7Dfcx6Qzpea5upxlH533/EK+um6DFZuP12SV
	JPqFsGWSB4vjCL1OwxmDnyCJM57eNaVx9YsxXGCbhaNlh4uYKhaQChCSQ/HmPpuSsBZpxYzxs5C
	vL+2hCB1Gvl19WLVfHHT94TRp8O5b3wue9bVIHaEIGR6irCbzTXNZeRcV6CUvFh8s104y
X-Gm-Gg: AYBFou36BqieA29HAVzrxH6hJXGMrYl0DNZF88hkO7/yKENCNp7ES53Ly7E8ncXWtMV
	jvKYJHfaegdzpcfNxPzJofj7B7p587Au3jXOEyQsU83wPnWcQZtFjGi/WrqyO4DaBf7ZaCVPscy
	uGyBG3pWNLPit77B2z+jvG+//zyyUBlsTyoTzH7uI0snK6cZW3XYk3mAbhYgjdLzS1rje4V1vB9
	hlf4xF2A7vO1Bwmh9uu/D6koYXMURx/H3KESK0z3zUoi+wfKhUp/FJRPJN/lkpiPUn/5FaThUHt
	QTAi9kPttl0Qk4/biHPGxvqQW4LB7dyhwGD5vVoVHWTJen6bTtrSoA5fGedF7oXsOXZSjrTInvi
	v5QqOnmAEs5e/LOlKgffVNrxiZe8QA3Od
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr2912948a91.11.1791782563307;
        Sun, 11 Oct 2026 22:22:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr2912936a91.11.1791782562625;
        Sun, 11 Oct 2026 22:22:42 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm13933280a91.7.2026.10.11.22.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:22:42 -0700 (PDT)
Message-ID: <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:52:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
 <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX2tGRYKyX1SPG
 WveLU7qdjJmcBtj7+tmgv933qM6pCntGEYrVM7kJPiuoqISRyTf8v1nosj5QN7UTqVkZVmTcT4C
 vhFIUlzs5TKka9MWIJDgshNNp/pMUCZ4iA9WS4wR7ZsKw2O2Xaf4/GTT/OdwVQQml3kqPizos96
 XQkyEz+x+8Rjb/pGalv06wI7vmsplHc151PVaBsGdK7c9V8oWjYAlxJ+eII76yKcyzQh/ftaStE
 x83CDBPFBT4+0ldUTlLpGnVt48vvw9D9daZPrFJ/jGDeWuPppBTbPc9fzzRAqI5eHFFZt4rhIP2
 rmT7Rbit9rQbLDonvgb4Ja/lEAeTSJH8q+rnUYWP11UH20OfXGE1fBIa8mNNtIn4BRzgRGHQaEz
 AuGjQHWhc7q4bM1Xg4RbKzuVAICemx1wkdr+5miFQliFTQOFHJxMzr9gYDMdewndg/O2ImxUIvu
 +XEYFNOVmXDsLFHcjLQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc6ea4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FBv_mFsaT7uxJJQ8OfYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gY9EvKDd9oWEx4AacVY6orvlI4M4BRSS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX+eV28DUF5WwL
 II+kkStPnBQmpmxxxiPOxE8e4FhYEhPVWOCsUaXQevuqB5BlYLnaPSyN0UVnhxJsALF3tbmX+F/
 p+Nq9eEPUQIXUPMukBfWrmXvFzNMZxs=
X-Proofpoint-ORIG-GUID: gY9EvKDd9oWEx4AacVY6orvlI4M4BRSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120021



On 10/10/2026 8:04 AM, Shawn Guo wrote:
> On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>> Nord has four PCIe controllers backed by a single quadfurcated Gen5
>> QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
>> can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
>> topology in effect is selected by firmware through the TCSR link-config
>> mode register, which the PHY driver reads at probe time.  Describe the
>> x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
>> configuration the boards ship with.
>>
>> Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
>> with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
>> and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
>> also become available now, so hook them up as GCC parents in place of
>> the <0> placeholders.
>>
>> The controllers and the PHY are left disabled here and enabled per
>> board.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 926 +++++++++++++++++++-
>>  arch/arm64/boot/dts/qcom/nord.dtsi          | 297 +++++++
>>  2 files changed, 1219 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index c7ac2e66632e..6e79f3cb20e9 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -342,6 +342,738 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
>>  	pinctrl-names = "default";
>>  };
>>  
>> +&pcie0 {
>> +	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
>> +		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
>> +		 <&gcc GCC_PCIE_A_MSTR_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_A_SLV_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_A_SLV_Q2A_AXI_CLK>;
>> +	clock-names = "aux",
>> +		      "cfg",
>> +		      "bus_master",
>> +		      "bus_slave",
>> +		      "slave_q2a";
>> +
>> +	assigned-clocks = <&gcc GCC_PCIE_A_AUX_CLK>;
>> +	assigned-clock-rates = <19200000>;
>> +
>> +	interconnects = <&pcie_data_inbound MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
>> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +			 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
>> +	interconnect-names = "pcie-mem",
>> +			     "cpu-pcie";
>> +
>> +	power-domains = <&gcc GCC_PCIE_A_GDSC>;
>> +
>> +	resets = <&gcc GCC_PCIE_A_BCR>,
>> +		 <&gcc GCC_PCIE_A_LINK_DOWN_BCR>;
>> +	reset-names = "pci",
>> +		      "link_down";
>> +
>> +	pinctrl-0 = <&pcie0_default>;
>> +	pinctrl-names = "default";
>> +
>> +	operating-points-v2 = <&pcie0_opp_table>;
>> +
>> +	pcie0_opp_table: opp-table {
>> +		compatible = "operating-points-v2";
>> +
>> +		/* GEN 1 x1 */
>> +		opp-2500000-1 {
>> +			opp-hz = /bits/ 64 <2500000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <250000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x2 */
>> +		opp-5000000-1 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x4 */
>> +		opp-10000000-1 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x8 */
>> +		opp-20000000-1 {
>> +			opp-hz = /bits/ 64 <20000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <2000000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x16 */
>> +		opp-40000000-1 {
>> +			opp-hz = /bits/ 64 <40000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <4000000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 2 x1 */
>> +		opp-5000000-2 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x2 */
>> +		opp-10000000-2 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x4 */
>> +		opp-20000000-2 {
>> +			opp-hz = /bits/ 64 <20000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <2000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x8 */
>> +		opp-40000000-2 {
>> +			opp-hz = /bits/ 64 <40000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <4000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x16 */
>> +		opp-80000000-2 {
>> +			opp-hz = /bits/ 64 <80000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <8000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 3 x1 */
>> +		opp-8000000-3 {
>> +			opp-hz = /bits/ 64 <8000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <984500 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x2 */
>> +		opp-16000000-3 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x4 */
>> +		opp-32000000-3 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x8 */
>> +		opp-64000000-3 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x16 */
>> +		opp-128000000-3 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <15753000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 4 x1 */
>> +		opp-16000000-4 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x2 */
>> +		opp-32000000-4 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x4 */
>> +		opp-64000000-4 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x8 */
>> +		opp-128000000-4 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <15753000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x16 */
>> +		opp-256000000-4 {
>> +			opp-hz = /bits/ 64 <256000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <31506000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 5 x1 */
>> +		opp-32000000-5 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x2 */
>> +		opp-64000000-5 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x4 */
>> +		opp-128000000-5 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <15753000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x8 */
>> +		opp-256000000-5 {
>> +			opp-hz = /bits/ 64 <256000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <31506000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x16 */
>> +		opp-512000000-5 {
>> +			opp-hz = /bits/ 64 <512000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <63012000 1>;
>> +			opp-level = <5>;
>> +		};
>> +	};
>> +};
>> +
>> +&pcie0_port0 {
>> +	phys = <&pcie_phy 0>;
>> +};
>> +
>> +&pcie1 {
>> +	clocks = <&gcc GCC_PCIE_B_AUX_CLK>,
>> +		 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
>> +		 <&gcc GCC_PCIE_B_MSTR_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_B_SLV_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_B_SLV_Q2A_AXI_CLK>;
>> +	clock-names = "aux",
>> +		      "cfg",
>> +		      "bus_master",
>> +		      "bus_slave",
>> +		      "slave_q2a";
>> +
>> +	assigned-clocks = <&gcc GCC_PCIE_B_AUX_CLK>;
>> +	assigned-clock-rates = <19200000>;
>> +
>> +	interconnects = <&pcie_data_inbound MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
>> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +			 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
>> +	interconnect-names = "pcie-mem",
>> +			     "cpu-pcie";
>> +
>> +	power-domains = <&gcc GCC_PCIE_B_GDSC>;
>> +
>> +	resets = <&gcc GCC_PCIE_B_BCR>,
>> +		 <&gcc GCC_PCIE_B_LINK_DOWN_BCR>;
>> +	reset-names = "pci",
>> +		      "link_down";
>> +
>> +	pinctrl-0 = <&pcie1_default>;
>> +	pinctrl-names = "default";
>> +
>> +	operating-points-v2 = <&pcie1_opp_table>;
>> +
>> +	pcie1_opp_table: opp-table {
>> +		compatible = "operating-points-v2";
>> +
>> +		/* GEN 1 x1 */
>> +		opp-2500000-1 {
>> +			opp-hz = /bits/ 64 <2500000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <250000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x2 */
>> +		opp-5000000-1 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x4 */
>> +		opp-10000000-1 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x8 */
>> +		opp-20000000-1 {
>> +			opp-hz = /bits/ 64 <20000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <2000000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 2 x1 */
>> +		opp-5000000-2 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x2 */
>> +		opp-10000000-2 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x4 */
>> +		opp-20000000-2 {
>> +			opp-hz = /bits/ 64 <20000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <2000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x8 */
>> +		opp-40000000-2 {
>> +			opp-hz = /bits/ 64 <40000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <4000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 3 x1 */
>> +		opp-8000000-3 {
>> +			opp-hz = /bits/ 64 <8000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <984500 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x2 */
>> +		opp-16000000-3 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x4 */
>> +		opp-32000000-3 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x8 */
>> +		opp-64000000-3 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 4 x1 */
>> +		opp-16000000-4 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x2 */
>> +		opp-32000000-4 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x4 */
>> +		opp-64000000-4 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x8 */
>> +		opp-128000000-4 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <15753000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 5 x1 */
>> +		opp-32000000-5 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x2 */
>> +		opp-64000000-5 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x4 */
>> +		opp-128000000-5 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <15753000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x8 */
>> +		opp-256000000-5 {
>> +			opp-hz = /bits/ 64 <256000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <31506000 1>;
>> +			opp-level = <5>;
>> +		};
>> +	};
>> +};
>> +
>> +&pcie1_port0 {
>> +	phys = <&pcie_phy 1>;
>> +};
>> +
>> +&pcie2 {
>> +	clocks = <&gcc GCC_PCIE_C_AUX_CLK>,
>> +		 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
>> +		 <&gcc GCC_PCIE_C_MSTR_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_C_SLV_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_C_SLV_Q2A_AXI_CLK>;
>> +	clock-names = "aux",
>> +		      "cfg",
>> +		      "bus_master",
>> +		      "bus_slave",
>> +		      "slave_q2a";
>> +
>> +	assigned-clocks = <&gcc GCC_PCIE_C_AUX_CLK>;
>> +	assigned-clock-rates = <19200000>;
>> +
>> +	interconnects = <&pcie_data_inbound MASTER_PCIE_2 QCOM_ICC_TAG_ALWAYS
>> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +			 &config_noc SLAVE_PCIE_2 QCOM_ICC_TAG_ALWAYS>;
>> +	interconnect-names = "pcie-mem",
>> +			     "cpu-pcie";
>> +
>> +	power-domains = <&gcc GCC_PCIE_C_GDSC>;
>> +
>> +	resets = <&gcc GCC_PCIE_C_BCR>,
>> +		 <&gcc GCC_PCIE_C_LINK_DOWN_BCR>;
>> +	reset-names = "pci",
>> +		      "link_down";
>> +
>> +	pinctrl-0 = <&pcie2_default>;
>> +	pinctrl-names = "default";
>> +
>> +	operating-points-v2 = <&pcie2_opp_table>;
>> +
>> +	pcie2_opp_table: opp-table {
>> +		compatible = "operating-points-v2";
>> +
>> +		/* GEN 1 x1 */
>> +		opp-2500000-1 {
>> +			opp-hz = /bits/ 64 <2500000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <250000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x2 */
>> +		opp-5000000-1 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x4 */
>> +		opp-10000000-1 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 2 x1 */
>> +		opp-5000000-2 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x2 */
>> +		opp-10000000-2 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x4 */
>> +		opp-20000000-2 {
>> +			opp-hz = /bits/ 64 <20000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <2000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 3 x1 */
>> +		opp-8000000-3 {
>> +			opp-hz = /bits/ 64 <8000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <984500 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x2 */
>> +		opp-16000000-3 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x4 */
>> +		opp-32000000-3 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 4 x1 */
>> +		opp-16000000-4 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x2 */
>> +		opp-32000000-4 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x4 */
>> +		opp-64000000-4 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 5 x1 */
>> +		opp-32000000-5 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x2 */
>> +		opp-64000000-5 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x4 */
>> +		opp-128000000-5 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <15753000 1>;
>> +			opp-level = <5>;
>> +		};
>> +	};
>> +};
>> +
>> +&pcie2_port0 {
>> +	phys = <&pcie_phy 2>;
>> +};
>> +
>> +&pcie3 {
>> +	clocks = <&gcc GCC_PCIE_D_AUX_CLK>,
>> +		 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
>> +		 <&gcc GCC_PCIE_D_MSTR_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_D_SLV_AXI_CLK>,
>> +		 <&gcc GCC_PCIE_D_SLV_Q2A_AXI_CLK>;
>> +	clock-names = "aux",
>> +		      "cfg",
>> +		      "bus_master",
>> +		      "bus_slave",
>> +		      "slave_q2a";
>> +
>> +	assigned-clocks = <&gcc GCC_PCIE_D_AUX_CLK>;
>> +	assigned-clock-rates = <19200000>;
>> +
>> +	interconnects = <&pcie_data_inbound MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
>> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +			 &config_noc SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
>> +	interconnect-names = "pcie-mem",
>> +			     "cpu-pcie";
>> +
>> +	power-domains = <&gcc GCC_PCIE_D_GDSC>;
>> +
>> +	resets = <&gcc GCC_PCIE_D_BCR>,
>> +		 <&gcc GCC_PCIE_D_LINK_DOWN_BCR>;
>> +	reset-names = "pci",
>> +		      "link_down";
>> +
>> +	pinctrl-0 = <&pcie3_default>;
>> +	pinctrl-names = "default";
>> +
>> +	operating-points-v2 = <&pcie3_opp_table>;
>> +
>> +	pcie3_opp_table: opp-table {
>> +		compatible = "operating-points-v2";
>> +
>> +		/* GEN 1 x1 */
>> +		opp-2500000-1 {
>> +			opp-hz = /bits/ 64 <2500000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <250000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 1 x2 */
>> +		opp-5000000-1 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <1>;
>> +		};
>> +
>> +		/* GEN 2 x1 */
>> +		opp-5000000-2 {
>> +			opp-hz = /bits/ 64 <5000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <500000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 2 x2 */
>> +		opp-10000000-2 {
>> +			opp-hz = /bits/ 64 <10000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1000000 1>;
>> +			opp-level = <2>;
>> +		};
>> +
>> +		/* GEN 3 x1 */
>> +		opp-8000000-3 {
>> +			opp-hz = /bits/ 64 <8000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <984500 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 3 x2 */
>> +		opp-16000000-3 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <3>;
>> +		};
>> +
>> +		/* GEN 4 x1 */
>> +		opp-16000000-4 {
>> +			opp-hz = /bits/ 64 <16000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <1969000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 4 x2 */
>> +		opp-32000000-4 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <4>;
>> +		};
>> +
>> +		/* GEN 5 x1 */
>> +		opp-32000000-5 {
>> +			opp-hz = /bits/ 64 <32000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <3938000 1>;
>> +			opp-level = <5>;
>> +		};
>> +
>> +		/* GEN 5 x2 */
>> +		opp-64000000-5 {
>> +			opp-hz = /bits/ 64 <64000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +			opp-peak-kBps = <7876000 1>;
>> +			opp-level = <5>;
>> +		};
>> +	};
>> +};
>> +
>> +&pcie3_port0 {
>> +	phys = <&pcie_phy 3>;
>> +};
>> +
>>  &qupv3_0 {
>>  	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
>>  		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
>> @@ -704,10 +1436,10 @@ gcc: clock-controller@100000 {
>>  		reg = <0x0 0x00100000 0x0 0x1f4200>;
>>  		clocks = <&bi_tcxo_div2>,
>>  			 <&sleep_clk>,
>> -			 <0>,
>> -			 <0>,
>> -			 <0>,
>> -			 <0>;
>> +			 <&pcie_phy 0>,
>> +			 <&pcie_phy 1>,
>> +			 <&pcie_phy 2>,
>> +			 <&pcie_phy 3>;
>>  		#clock-cells = <1>;
>>  		#reset-cells = <1>;
>>  		#power-domain-cells = <1>;
>> @@ -774,6 +1506,100 @@ mmss_noc: interconnect@1780000 {
>>  		qcom,bcm-voters = <&apps_bcm_voter>;
>>  	};
>>  
>> +	pcie_phy: phy@1b00000 {
>> +		compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
>> +
>> +		reg = <0x0 0x01b00000 0x0 0x10000>,
>> +		      <0x0 0x01b10000 0x0 0x10000>,
>> +		      <0x0 0x01b20000 0x0 0x10000>,
>> +		      <0x0 0x01b30000 0x0 0x10000>;
>> +		reg-names = "port_a",
>> +			    "port_b",
>> +			    "port_c",
>> +			    "port_d";
>> +
>> +		clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
>> +			 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
>> +			 <&tcsrcc TCSR_PCIE_CLKREF_EN>,
>> +			 <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
>> +			 <&gcc GCC_PCIE_A_PIPE_CLK>,
>> +			 <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
>> +			 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
>> +			 <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
>> +			 <&gcc GCC_PCIE_B_PIPE_CLK>,
>> +			 <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
>> +			 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
>> +			 <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
>> +			 <&gcc GCC_PCIE_C_PIPE_CLK>,
>> +			 <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
>> +			 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
>> +			 <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
>> +			 <&gcc GCC_PCIE_D_PIPE_CLK>;
>> +		clock-names = "aux_a",
>> +			      "cfg_ahb_a",
>> +			      "ref",
>> +			      "rchng_a",
>> +			      "pipe_a",
>> +			      "aux_b",
>> +			      "cfg_ahb_b",
>> +			      "rchng_b",
>> +			      "pipe_b",
>> +			      "aux_c",
>> +			      "cfg_ahb_c",
>> +			      "rchng_c",
>> +			      "pipe_c",
>> +			      "aux_d",
>> +			      "cfg_ahb_d",
>> +			      "rchng_d",
>> +			      "pipe_d";
>> +
>> +		assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
>> +				  <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
>> +				  <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
>> +				  <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
>> +		assigned-clock-rates = <100000000>,
>> +				       <100000000>,
>> +				       <100000000>,
>> +				       <100000000>;
>> +
>> +		power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
>> +				<&gcc GCC_PCIE_B_PHY_GDSC>,
>> +				<&gcc GCC_PCIE_C_PHY_GDSC>,
>> +				<&gcc GCC_PCIE_D_PHY_GDSC>;
>> +		power-domain-names = "port_a",
>> +				     "port_b",
>> +				     "port_c",
>> +				     "port_d";
>> +
>> +		resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
>> +			 <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
>> +			 <&gcc GCC_PCIE_B_PHY_COM_BCR>,
>> +			 <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
>> +			 <&gcc GCC_PCIE_C_PHY_COM_BCR>,
>> +			 <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
>> +			 <&gcc GCC_PCIE_D_PHY_COM_BCR>,
>> +			 <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
>> +		reset-names = "port_a",
>> +			      "port_a_nocsr",
>> +			      "port_b",
>> +			      "port_b_nocsr",
>> +			      "port_c",
>> +			      "port_c_nocsr",
>> +			      "port_d",
>> +			      "port_d_nocsr";
>> +
>> +		qcom,link-mode = <&tcsr 0x71050>;
>> +
>> +		#clock-cells = <1>;
>> +		clock-output-names = "pcie_a_pipe_clk",
>> +				     "pcie_b_pipe_clk",
>> +				     "pcie_c_pipe_clk",
>> +				     "pcie_d_pipe_clk";
>> +		#phy-cells = <1>;
>> +
>> +		status = "disabled";
>> +	};
>> +
>>  	pcie_cfg: interconnect@1ba0000 {
>>  		compatible = "qcom,nord-pcie-cfg";
>>  		reg = <0x0 0x01ba0000 0x0 0x7200>;
>> @@ -998,6 +1824,98 @@ nsp_data_noc_3: interconnect@1fe00000 {
>>  };
>>  
>>  &tlmm {
>> +	pcie0_default: pcie0-default-state {
>> +		wake-pins {
>> +			pins = "gpio0";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		clkreq-pins {
>> +			pins = "gpio1";
>> +			function = "pcie0_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-pins {
>> +			pins = "gpio2";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
> pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
> stay here. But wake and perst are board chosen GPIOs. I think they should
> go to board DTS.
Shawn, I don't see perst and wake gpios are changing per board, for that
reason I added them here, but such requirement is coming we can move them to
board file.

- Krishna Chaitanya.
> Shawn
>
>> +	};
>> +
>> +	pcie1_default: pcie1-default-state {
>> +		wake-pins {
>> +			pins = "gpio3";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		clkreq-pins {
>> +			pins = "gpio4";
>> +			function = "pcie1_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-pins {
>> +			pins = "gpio5";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	pcie2_default: pcie2-default-state {
>> +		wake-pins {
>> +			pins = "gpio6";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		clkreq-pins {
>> +			pins = "gpio7";
>> +			function = "pcie2_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-pins {
>> +			pins = "gpio8";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	pcie3_default: pcie3-default-state {
>> +		wake-pins {
>> +			pins = "gpio9";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		clkreq-pins {
>> +			pins = "gpio10";
>> +			function = "pcie3_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-pins {
>> +			pins = "gpio11";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>>  	qup_i2c0_default: qup-i2c0-default-state {
>>  		pins = "gpio111", "gpio112";
>>  		function = "qup0_se0";
>> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
>> index 83760341456b..0fb292074b99 100644
>> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
>> @@ -1587,6 +1587,290 @@ rng: rng@10c3000 {
>>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>>  		};
>>  
>> +		pcie0: pci@1b80000 {
>> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
>> +
>> +			reg = <0x00 0x01b80000 0x00 0x00004000>,
>> +			      <0x00 0x40000000 0x00 0x00000f20>,
>> +			      <0x00 0x40000f20 0x00 0x000000a8>,
>> +			      <0x00 0x40010000 0x00 0x00020000>,
>> +			      <0x00 0x40100000 0x00 0x00100000>,
>> +			      <0x00 0x01b84000 0x00 0x00001000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0xfd00000>;
>> +
>> +			bus-range = <0x00 0xff>;
>> +			device_type = "pci";
>> +			linux,pci-domain = <0>;
>> +			num-lanes = <8>;
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			dma-coherent;
>> +
>> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			iommu-map = <0x0 &pcie_smmu 0x0000 0x10000>;
>> +
>> +			msi-map = <0x0 &gic_its 0x80000 0x10000>;
>> +
>> +			status = "disabled";
>> +
>> +			pcie0_port0: pcie@0 {
>> +				compatible = "pciclass,0604";
>> +				reg = <0 0 0 0 0>;
>> +				bus-range = <0x01 0xff>;
>> +				device_type = "pci";
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +			};
>> +		};
>> +
>> +		pcie1: pci@1b88000 {
>> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
>> +
>> +			reg = <0x00 0x01b88000 0x00 0x00004000>,
>> +			      <0x00 0x50000000 0x00 0x00000f20>,
>> +			      <0x00 0x50000f20 0x00 0x000000a8>,
>> +			      <0x00 0x50010000 0x00 0x00010000>,
>> +			      <0x00 0x50100000 0x00 0x00100000>,
>> +			      <0x00 0x01b8c000 0x00 0x00001000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0xfd00000>;
>> +
>> +			bus-range = <0x00 0xff>;
>> +			device_type = "pci";
>> +			linux,pci-domain = <1>;
>> +			num-lanes = <4>;
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			dma-coherent;
>> +
>> +			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 835 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 351 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 830 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 348 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			msi-map = <0x0 &gic_its 0x90000 0x10000>;
>> +
>> +			iommu-map = <0x0 &pcie_smmu 0x10000 0x10000>;
>> +
>> +			status = "disabled";
>> +
>> +			pcie1_port0: pcie@0 {
>> +				device_type = "pci";
>> +				compatible = "pciclass,0604";
>> +				reg = <0 0 0 0 0>;
>> +				bus-range = <0x01 0xff>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +			};
>> +		};
>> +
>> +		pcie2: pci@1b90000 {
>> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
>> +
>> +			reg = <0x00 0x01b90000 0x00 0x00004000>,
>> +			      <0x00 0x60000000 0x00 0x00000f20>,
>> +			      <0x00 0x60000f20 0x00 0x000000a8>,
>> +			      <0x00 0x60010000 0x00 0x00010000>,
>> +			      <0x00 0x60100000 0x00 0x00100000>,
>> +			      <0x00 0x01b94000 0x00 0x00001000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0xfd00000>;
>> +
>> +			bus-range = <0x00 0xff>;
>> +			device_type = "pci";
>> +			linux,pci-domain = <2>;
>> +			num-lanes = <2>;
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			dma-coherent;
>> +
>> +			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 263 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 154 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 110 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 258 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			iommu-map = <0x0 &pcie_smmu 0x20000 0x10000>;
>> +
>> +			msi-map = <0x0 &gic_its 0xa0000 0x10000>;
>> +
>> +			status = "disabled";
>> +
>> +			pcie2_port0: pcie@0 {
>> +				device_type = "pci";
>> +				compatible = "pciclass,0604";
>> +				reg = <0 0 0 0 0>;
>> +				bus-range = <0x01 0xff>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +			};
>> +		};
>> +
>> +		pcie3: pci@1b98000 {
>> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
>> +
>> +			reg = <0x00 0x01b98000 0x00 0x00004000>,
>> +			      <0x00 0x70000000 0x00 0x00000f20>,
>> +			      <0x00 0x70000f20 0x00 0x000000a8>,
>> +			      <0x00 0x70010000 0x00 0x00010000>,
>> +			      <0x00 0x70100000 0x00 0x00100000>,
>> +			      <0x00 0x01b9c000 0x00 0x00001000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0xfd00000>;
>> +
>> +			bus-range = <0x00 0xff>;
>> +			device_type = "pci";
>> +			linux,pci-domain = <3>;
>> +			num-lanes = <2>;
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			dma-coherent;
>> +
>> +			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 111 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 246 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 239 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 234 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
>> +
>> +			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
>> +
>> +			status = "disabled";
>> +
>> +			pcie3_port0: pcie@0 {
>> +				device_type = "pci";
>> +				compatible = "pciclass,0604";
>> +				reg = <0 0 0 0 0>;
>> +				bus-range = <0x01 0xff>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +			};
>> +		};
>> +
>>  		ufs_mem_hc: ufshc@1d44000 {
>>  			compatible = "qcom,nord-ufshc",
>>  				     "qcom,ufshc",
>> @@ -1736,6 +2020,19 @@ ipcc0: mailbox@9007000 {
>>  			#mbox-cells = <2>;
>>  		};
>>  
>> +		pcie_smmu: iommu@9980000 {
>> +			compatible = "arm,smmu-v3";
>> +			reg = <0x0 0x09980000 0x0 0x20000>;
>> +			interrupts = <GIC_SPI 898 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 900 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 902 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "eventq",
>> +					  "cmdq-sync",
>> +					  "gerror";
>> +			dma-coherent;
>> +			#iommu-cells = <1>;
>> +		};
>> +
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,nord-pdc",
>>  				     "qcom,pdc";
>> -- 
>> 2.43.0
>>

