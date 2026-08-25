Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D29F3E008F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646481; cv=none; b=Rq7y7F8u8RGa207slKYThIADtlghtkR4ZvFU7rSkiqX2oea9bI8bK3wWsUhtS8M/OQBk45f29J1HTpVyeO9KJOV3rf28O9BgjwAvPTljcE/uShLo0VeHiOuiB7VrL6u7X8WpmHFVaqt3XQJ675ZA23WeLURFyKE0O1+AnM9+0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646481; c=relaxed/simple;
	bh=phVtok+ObHFJ1au6qUh5rNrwq/TE1QKw2vCdkhVllwA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ME8ZG1g0+ig9XtcJBYAkWAqgYTyDdGuAkVuIvWccbg32KxHlUzUCBxra3goD6lG/Lw0bPDZIF7yK6/zKMfRhUHe+laZ/c+bqoxXU+ZWWMGgGRtr/QCsEsGF45orqQkNAsculxY3IeShpI9zeXCw23/mFEatARFvuMhy6gIJzl6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjjH7AWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcWb0l8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjjH7AWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcWb0l8L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88MU81706829
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+q7F1y6fnZGUuGCnDxg2E2aPK2KeY9/J3jStlZtmz0=; b=RjjH7AWHHkMXBUQv
	1QpW7MoQLRT/Dabjx07OlOC2LEg9SCUSdvUweL4CjQhSq7c2sKkbLbaq1l+TehZQ
	tzCge/ERGQdQptiorMXQZm5JVuAt46JPBtu8y4U7f1loDG4tVleZ7WhJt/wFjJSj
	ordiMj8Xu6dAA9BobfF3fPO+G2T0PFeGYOm2fPhk+u1hSztWbNbkgZ+tGzPDAM/s
	JMNrzIZlOxJaWsyeUUrS+DzR2jULSMZDx1FAtSy6A/RvqiE8Fch+rLDGSqExi/Gf
	KCeuUR/ws8Yopy8OtKiqUGC1uW5puSMO5Udjnq3Unl2kBjIJAVShCEKysKwNSgrV
	04U1hA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvry1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:27:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so9825143a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646477; x=1788251277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+q7F1y6fnZGUuGCnDxg2E2aPK2KeY9/J3jStlZtmz0=;
        b=bcWb0l8LHSpdbz0VDjfZh/hG1eiNFOrqKCfcekwJYa9ySEy+QTq6f009bCwRpE3+UB
         jQtYLuwHXHeYXm6qHTFYoqSFz+pv21j6Wu1BZ1kjzxtJX6wdUqsL+lEFIHE2ZYw0QRtx
         qd1y4H/ldOfLuxA5R066Q1X3iIVn6KveE31cENBISBGlMUMYh2GHIfl8aNMLd7AHCVHb
         BSKtddDouFJ+BxBe5xhK0zkngiD1arz/YxfU7bU9/+qRKTQtFkjPRvSU/6C7swpFcndW
         4yCvwkBApIy90wJPKu593hM62ASzjSZr3MIXlyMSbrrrN2sJI38PLziOZLtaa9hnwK1n
         MVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646477; x=1788251277;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+q7F1y6fnZGUuGCnDxg2E2aPK2KeY9/J3jStlZtmz0=;
        b=FjKpa9trW1rGbO/FbjsHMvn8g5KcXxxgOePQrmCNSd5KI904zyYqqjmuSlg2C+4VWk
         8mrRdL+M2BMgxPgny8mBf20ioYx6JOwJrKcb3dU2KnfcvroSQR6sk11d23aLN1d+6/wW
         SgoFArEWLFumFQkClPnm6kdNUcGe9hdRTWo2r8Zm5I2Z9ACCfNPH8YhhA01FzTNyTOrY
         NpUpKg9nl0nNDNj5zk0rpyMH/gjcbn+qrdedMRqiXtn4FAA+Nu9N5Of4Dqi+zDeOMD+r
         nz/ps09pawwTAQyhWEYGpnHWiGPBJIP/p6QQPSwFJiJy53vNVGuR1cksuAULe2YgyF/u
         xMZg==
X-Gm-Message-State: AFuF++ncjOqCd6sae6iVMUCLbi9Z5cCkBAGlDE6QhuVgNirCoyNd/g8y
	VWWShPmtmLhtU4YcnIVNmMrOOW9frMx9nL5UnUWEhxFoxKBl+aWDIM7WJKWcWbnEe7ygLLr3qSF
	+NBN6zrjOcZZ2xn0F2KgCsEjsQmZoS5l7MA3OD2j0/FW7Nen11IbntHy5ZRSU/arQ4r2w
X-Gm-Gg: AR+sD10G/1sCI/Hpl/DlVDTXDfnnfSScgGycj4J55fWYvpuAaw2r9O2g50zxdNFbXIH
	9LnJLCL8HB2NcIQGqDoa+njxAr5LLIBnC5SZiTEl0t/xjc09YktmJF3GPvMaBoLkOseNxTaAQ/N
	/u+FOybcLJiY93zIBhAKU7U6hgGs2w+oFwmSwtrj4nBDBMATm+bENAcd0Dmaqcw5PSKxxZKz+/H
	cRUPRluGEGipGC59f7ukNHQ1IvaPxoSxfnEED+l8TT1GZVMbBqiNAIqV8fwT5FOTme8U34FGX6L
	iCCmWoJmSQGkD6HBkbj+UInxeKVyjKLESV1M88B9LFQvriL9PfK7cyqu32HW98X04tZjV+qS2xb
	K7zpwPlXZNCgu9sp5hLoOSt/7C0IGvzAfaQUi9PTRNj4qH7HegrC+56WPSreJPV4=
X-Received: by 2002:a17:903:230b:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d670c27184mr417203865ad.8.1787646476963;
        Tue, 25 Aug 2026 01:27:56 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d670c27184mr417203025ad.8.1787646476449;
        Tue, 25 Aug 2026 01:27:56 -0700 (PDT)
Received: from [10.133.33.92] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761bdesm25924885ad.1.2026.08.25.01.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:27:56 -0700 (PDT)
Message-ID: <e1223b8f-9a1e-4093-9dc0-299c674aec49@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 16:27:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
From: Yin Li <yin.li@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX6ImXSNipYUjF
 vpX5MIm70AQgRvDtFI0x9b6ssDYYDjO3r2HYtNAgREnWAvINEbwfM7471stke44DxNIBIpptzti
 D6EhVTs1A7/dISxySoP5GFRtcVSBVmWLqeuiVIv5zmto/GIoB/sVepSJp2Tr/ZTAOvdTaR97WtV
 9DlE/mEzNsvT0eAiMr0rZ6yueBgubpJ5hUDCe5VFExNDwWFc/6fAzK3VDOKFGmNC78JOIXbWK4y
 IhNjfludPV4dsKELDkyZAA5eSX6VlzYVwG3SdUJOqyRyCQfRKT270w+WJuVzq160//q7Jo11rVP
 LY0mPwII6Bs/5gi+94/QBGCPaJaH5wjLs0bP8P7CiyRaf//VpAeSFJx/rrLygfxp1ViMGl91KAW
 7kXRPs4XDec3RolRH0l15ZVOs78gLruPwKIKY5xscZwLooqoUw271m3eBcn5mCh7KecyCnAeZpR
 NnpYlplNlRNHxqPY3kg==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d520e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=VIS1g5ZynMs3Vg3ehMYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX1O1rB5ON0qn+
 e8rzP2Yh2rrzBZYSQ6QYaiISnWUR1RtUx7Ie3NvNtbdIOwDzexesJF+E5+XXuBwduwU7AdmCWUb
 BHzm1zv4Xx9p9zoRKU9bljbKoZA5Pa0=
X-Proofpoint-ORIG-GUID: rFBU_U0E8KPinfIV7xALmnyIYsmAojOZ
X-Proofpoint-GUID: rFBU_U0E8KPinfIV7xALmnyIYsmAojOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250071



On 8/11/2026 9:30 PM, Yin Li wrote:
> Notes for James, Shanker and Rob
> --------------------------------
> This series builds directly on your not-yet-upstream MPAM snapshot
> patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
> like your guidance on:
> 
> 1. Do you mind us picking these up and continuing to extend them? We have
>     kept the original authorship and Signed-off-by intact and documented
>     the inherited-vs-new split below. If you would prefer a different
>     attribution arrangement, or have your own plans to upstream MPAM DT
>     support, please let us know so we can avoid duplicating effort.
> 
> 2. The fixes to the inherited patches are kept as small, self-contained
>     patches on top, purely to make review easier. Since fixes to
>     not-yet-upstream patches would normally be squashed into the original
>     commit by its author, please point out which of these you would like
>     folded back, and we will reorganize accordingly.
> 
> Rob kindly provided some early off-list feedback on an earlier draft,
> which this series has tried to address.
> 
> Add Arm MPAM resctrl basic device tree support.
> 
> Arm Memory System Resource Partitioning and Monitoring (MPAM) with
> resctrl requires device tree (DT) support as a prerequisite before any
> higher-level functionality can be enabled. This series provides the
> foundational DT binding and parsing support for MPAM, laying the
> groundwork for subsequent features such as MPAM Firmware-backed
> (MPAM-FB) partitioning.
> 

Hi all,

Just a friendly ping on this RFC series.

In particular, I'd appreciate any guidance on whether this is a
reasonable direction for upstream DT support of MPAM/resctrl, before
spending more effort preparing the next revision.

Any high-level feedback would be very helpful.

Thanks for your time.



> The patches are based on earlier work by James Morse, Shanker
> Donthineni and Rob Herring, with fixes and additions on top:
> 
> Inherited (authorship preserved, with fixes noted in each patch):
> - dt-bindings: MPAM MSC binding [1]
> - cacheinfo: expose cache-id generation from a device_node [2]
> - arm_mpam: device tree support for MSC probing [3]
> - arm_mpam: memory controller MSC support on DT platforms [4]
> 
> New on top:
> - standalone fixes extracted from the inherited patches (device_node
>    refcount, cache-id sentinel/type, RIS index range checks, MSC window
>    size, accessibility return type, foundling MSC creation, cache-id
>    error path)
> - dt-bindings: schema and example fixes
> - arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace
> 
> DT affinity model
> -----------------
> An MSC node is nested under the device it partitions or monitors. For a
> cache MSC this is the cache node, so the MSC's CPU affinity is derived
> from its parent cache; for a memory-controller MSC the parent is the
> memory device, which is accessible from all CPUs. A per-RIS fallback is
> also provided: when an MSC sits under a generic container with no
> affinity-bearing parent, affinity is resolved from an explicit 'cpus'
> phandle or an 'arm,mpam-device' phandle on each RIS node.
> 
> The Kaanapali DTS patch is for local enabling and verification only and
> cannot be upstreamed: the platform is already upstream with a public
> device tree, and production firmware does not allow the OS to write the
> MSC registers, so this path only works on a local test setup. The MSC
> nodes are disabled by default, serving as a reference example for other
> platform DT authors.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
> To: James Morse <james.morse@arm.com>
> To: Rob Herring <robh@kernel.org>
> To: Shanker Donthineni <sdonthineni@nvidia.com>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Ben Horgan <ben.horgan@arm.com>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Reinette Chatre <reinette.chatre@intel.com>
> To: Fenghua Yu <fenghuay@nvidia.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: trilok.soni@oss.qualcomm.com
> Cc: aiqun.yu@oss.qualcomm.com
> Cc: ganapatrao.kulkarni@oss.qualcomm.com
> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: driver-core@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: trilok.soni@oss.qualcomm.com
> Cc: aiqun.yu@oss.qualcomm.com
> Cc: ganapatrao.kulkarni@oss.qualcomm.com
> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> 
> ---
> James Morse (2):
>        cacheinfo: Expose the code to generate a cache-id from a device_node
>        arm_mpam: Add device tree support for MSC probing
> 
> Rob Herring (1):
>        dt-bindings: arm: Add MPAM MSC binding
> 
> Shanker Donthineni (1):
>        arm_mpam: Add support for memory controller MSC on DT platforms
> 
> Yin Li (11):
>        arm_mpam: Fix device_node refcount in DT resource parsing
>        arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
>        arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
>        arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
>        arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
>        arm_mpam: Fix update_msc_accessibility() return type to void
>        arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
>        arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
>        dt-bindings: arm: Fix MPAM MSC binding schema and examples
>        arm_mpam: Support MSC accessibility derivation from RIS nodes
>        [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches
> 
>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
>   drivers/base/cacheinfo.c                           |  19 +-
>   drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h                    |   2 +-
>   include/linux/arm_mpam.h                           |   4 +-
>   include/linux/cacheinfo.h                          |   3 +
>   7 files changed, 638 insertions(+), 43 deletions(-)
> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
> 
> Best regards,
> --
> Yin Li <yin.li@oss.qualcomm.com>
> 

-- 
Thx and BRs,
Yin

