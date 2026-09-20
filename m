Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1C2E266C
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789879861; cv=none; b=E8WqmLxhWmQx+xkefCrbpEiNI1bDeOU2VocqzPXJsKFFYHZJ/BZ+uafenKRRqCDdGDmddidZQhNcqGE5SebIiX85LfXMGRR+j0xmGaCC1p3pTwuwK45jfuD/mlqbdOGbooJjhGzrl5mDyRBBt0cl9HN5lXtTwY0Xi5S5nBeL/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789879861; c=relaxed/simple;
	bh=uX2rty1SWxMORGgldgYzns9KGT5JHl48c69XGGwBtbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7upWUJzk/mXfHR+a5nWHXgjaRrU7nGDqbMCZiE44eZCHkog0SXz2q2n9AsYXa8khVyDbayM7QicL/lIsZi59eDulHe213jQwzd5fUf74GFw59faYmvYIcNpKyy+i/KIqStWrBHvL8IWPNcbXXDn0Tzxo2sSPUdzdx13T8tPrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8czKT3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LY+344hT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8czKT3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LY+344hT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1maL81548481
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 04:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Jqtxw1u5HbOVkIJ3+H/45I2
	xGGsAsB0Rio8YvSqcOA=; b=o8czKT3SrCpavWK+igNw88xF2Agpe0oSpALZcUm+
	JJ7UOsgESfHY1Gx/ZbGvcQdOe39xRBpIYWtXf+XwS8sflfbWknG1wMleXkCHRmx0
	/tWocKhg0bgVqE5Wjioba+JLaCpcrKzmhZ0SttU7/A4y+muI7c/SI3PYcnL6IBso
	/vk7BX3wP05BLgnnhNEABGRZDZ4nMcPcG/hLqWyUYLBUZp52HHn2xhPaKi3MzJDS
	lxRAv0YUg9w9zElmJEzFNxGZ5Z7C7GiZYyG18dsd/MmhRKNG9naMIYBeiVev0snw
	VWYj/4u1Kf2tQ79lBgNGrr9AY+4W+qkJ9t58hJuE04mg8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd62c7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 04:50:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so1724395a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789879858; x=1790484658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Jqtxw1u5HbOVkIJ3+H/45I2xGGsAsB0Rio8YvSqcOA=;
        b=LY+344hT+ml51yJU5OOcl6RbLhh5s8dDfhK/5nSckbAm/4BhN5s+kY/PNCu//OqpJE
         eFDtyCauxVvz1T/r/1IdVrcxqpTi6z6AauJpYxiKDa3LR2gY26Dr8t/3sgVsHXk+a4gd
         yHrTWU+NPyz1Mx+8oFgweMtG3FbbCJa1gTnBgNNFA/662WyzsFSd7LHBbsyt8XRa2H8h
         Hyxpd9QQGwpq17B/jTKsXYZHeg5W/Yss7wCmGb8ectNjKuuiCj7/B1nz4CqMdWdIQaic
         oJN/tacA0PQ58O6l7xJ0IQvCgfeGqdRrDynB87pID49sB8rM1GAuZ6fDX5oxTsd9RCr1
         8qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789879858; x=1790484658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Jqtxw1u5HbOVkIJ3+H/45I2xGGsAsB0Rio8YvSqcOA=;
        b=CYgmmAVNSjvaOKBEoDXQ/RPyKzttucdu3hJc3uXPYuKOmyOjt3QoWIXMukmxur6K9k
         kr6AnVwAOvRJcKQzBhP7yLAUMWrQKqYZYdXDLpOamPO8HTopRS1BjIQg+DDw5yEhcO9v
         W1JY0M6AdSdC7mq0UHh5qXnwKzD6Y5rz/dy3kxVclgJ5osb1G3SWXo7V2CikrbIUmaIy
         +Td8viFoMf2yAkue5p8Wsk1lQ9acIw5loQH25yP4488ossrHk1ifHnaR6yhMdNG4QIy1
         BLusv630oqrg60yhWjCLU1/WM3CQmkL8qONW9l0wgHK3W3jJBbs2kZSMuClYKlZjUbch
         xWxg==
X-Forwarded-Encrypted: i=1; AKwUvByfl0aANk6simCj90sGDDAFK315bitNuAsTLSH4vuPvmmFsnVIofOHurNNKMcUeQGfGoXTNaUih/CQ1sdHB@vger.kernel.org
X-Gm-Message-State: AFuF++mZVt49gh2cdkU4XIqN6S7bzKFGfwzMJdcPPSrW71MK9XVvaIwJ
	2Kn6Cbor/vf15NIkH0nXUQq05kNHwyG2fIYo7Kx93VIcqSoKswsjaIV1pOJIjvc61dB/zS8YJ8H
	xOLFqndEPng9vAyF/1vatiayIrPZ/2WBrYeJWA994CvypspO1lcgJGntAJnKOwN3W1D0i
X-Gm-Gg: AYBFou23tETWVoGNyxAXaV7QXwnQcjUyA5yzdbpZyAEeyvcVucDscDNanxEL2e+um8t
	i0yPFaILLuQCXbRpRDlQIyxG0wLdzfgpBneqf88JjGAYSZnVxiv1RaZ3F+crdSOnceEYb5yWvE1
	SoyNHGiFXOHT6fZ/z6mbLHS0Kfz7O2sWeo2fMIRdc9bIiqqs6wbAgOSCUTqGq+IIgECbWOgt/Qg
	z6j0jwSS+R40210nCJRPRxXZs2AKf8FyxqLxB1/7tVE8MK6OlYCHhA5DV4mAwc7t5kAh8uWHg08
	6h8qzmYElFA4nGAJxg3ulR+X4LfkAgWnR/t2UDPYpcUGhDMxL+6Yzy3aF6dOO7Gg0SifaHoeSNU
	Lc8TDhARCVcJb/fyiRwMEeHvCKIMZuxjJrjzK/C30BDo=
X-Received: by 2002:a17:902:d2cc:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2ddb1ba0faamr110279055ad.26.1789879857732;
        Sat, 19 Sep 2026 21:50:57 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2ddb1ba0faamr110278855ad.26.1789879857302;
        Sat, 19 Sep 2026 21:50:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e3f17288dsm3479740eec.29.2026.09.19.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:50:56 -0700 (PDT)
Date: Sun, 20 Sep 2026 12:50:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
Message-ID: <aq9mK6VpRB75x5FW@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904081619.593602-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDA2NiBTYWx0ZWRfX5PF8TLc3kfrN
 8GOv2dfqn9El7YuJSm5POQQ6qiDbGsmYbpMjqK4DKhngnIny78FZTnICS66Vw45yYv6zm1BUZ2M
 azdFWf1rcNyKZuGGpwHkX9CXmy2SCFJfNgQfNsOzvVvm8oOooncjcFmXUPl1PfV6JbmZX7fCVWT
 ZqT7Ok+8smBVQxMK/qrm7i3V54pKotPzwv5Wb+y12y0PrP+E8GyeIhImy82TUoVpybVFR2umTaD
 +0rDUJ4v8aJSZbj/ajSFqAKZEdsmJL6PPFGG3IRlHeILGyhAyimCrQcVyGpbSbJAY87HGfQRZzV
 ZnqJWCSYyCjd6t7g8JC2x7BGR5BKGgcg7cbTJJxotVdl16ZkTa8H3MyFKrFouYs7opu6kp0qIii
 lTDAPVTjW8mHT/mi1F2kjOB47kCb2yGM7Pqwva3Y0ExO1y+8ZD/gfryT3X3C6TlcyZH4ogIbJmV
 t+oqTzUKGDjayeHtQ4w==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaf6632 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TtsBWXHFPUpw1A1ZD-MA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: wOzJU-1I3tWCAoUZN6_0MjXg5F-5VwPF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDA2NiBTYWx0ZWRfX4N6Ijqzl48kk
 ljNTz9Ul1xFOF44wijIUZGWug2ha93t0YsN1azBiMP15idnFSbgtLwjpStLpSf1PUy63NqzWUnm
 cIJ28OLLVoCz/ZTSppKsPcqeDXC0W88=
X-Proofpoint-GUID: wOzJU-1I3tWCAoUZN6_0MjXg5F-5VwPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200066

On Fri, Sep 04, 2026 at 04:16:14PM +0800, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  63 ++
>  arch/arm64/boot/dts/qcom/nord-ipcc.h        | 144 ++++
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 884 ++++++++++++++++++++
>  3 files changed, 1091 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h

[...]

> @@ -1518,6 +1639,103 @@ tcsr: syscon@1f60000 {
>  			reg = <0x0 0x01f60000 0x0 0xa0000>;
>  		};
>  
> +		remoteproc_adsp: remoteproc@4c00000 {
> +			compatible = "qcom,nord-adsp-pas";
> +			reg = <0x0 0x04c00000 0x0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "shutdown-ack";
> +
> +			memory-region = <&hpass_dsp0_mem>,
> +					<&hpass_dsp0_dtb_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_adsp_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc0 IPCC_MPROC_ADSP0
> +							      IPCC_MPROC_SIGNAL_GLINK_QMP
> +							      IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc0 IPCC_MPROC_ADSP0
> +						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <2>;
> +				label = "adsp";
> +
> +				fastrpc {
> +					compatible = "qcom,nord-fastrpc",
> +						     "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";

With commit 9981fbe599e8 ("misc: fastrpc: Allocate entire reserved memory
for Audio PD in probe") landed in linux-next, we are getting repeated
error messages.

  qcom,fastrpc-cb 4c00000.remoteproc:glink-edge:fastrpc:compute-cb@6: remote heap memory region is not added

Adding memory-region fixes the problem.

  memory-region = <&hpass_rpc_remote_heap_mem>;

Will send v3 for that.

Shawn

> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu_0 0x09e3 0x0000>,
> +							 <&apps_smmu_0 0x0a43 0x0020>,
> +							 <&apps_smmu_0 0x0a63 0x0020>,
> +							 <&apps_smmu_0 0x0a83 0x0000>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu_0 0x09e4 0x0000>,
> +							 <&apps_smmu_0 0x0a44 0x0020>,
> +							 <&apps_smmu_0 0x0a64 0x0020>,
> +							 <&apps_smmu_0 0x0a84 0x0000>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu_0 0x09e5 0x0000>,
> +							 <&apps_smmu_0 0x0a45 0x0020>,
> +							 <&apps_smmu_0 0x0a65 0x0020>,
> +							 <&apps_smmu_0 0x0a85 0x0000>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu_0 0x09e6 0x0000>,
> +							 <&apps_smmu_0 0x0a46 0x0020>,
> +							 <&apps_smmu_0 0x0a66 0x0020>,
> +							 <&apps_smmu_0 0x0a86 0x0000>;
> +						dma-coherent;
> +					};
> +				};
> +			};
> +		};
