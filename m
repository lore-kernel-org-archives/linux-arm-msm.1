Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC52EEE76
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 03:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429128; cv=none; b=WR3jO2YFGxGr8F+atP+lSGcwTrgu7by7DRt7a/Wo7x1j4EeT4pvHe0GLL2SEbqrsw4WG0UggLeA4yFtp7ulV9/xlfNlGFeZ8eCluPUXX1gaF3sGw+n/4xqqdHeiGJu5RUYJ5+WdGF/FO1DvIysQzBzL71dzD4wGTeaDp056Pves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429128; c=relaxed/simple;
	bh=tkeZ6QKECN4uRnnat8d3f1rWRCe/1IOkwR8LV4JSC8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NK2YT2cmMUXWi8l5QofnnAByd4z7R9MIsT/fzUvJcDS43EnSfBCpe7mSDYlzURyYa6DBL/BBKEZSZYf/pMEOpEAZPp36FKLnT65yBc+smXo2DAL7WYdOH0Mf+ScPEIhLY5fcMl6qhU5imbltaKFaEI/uprveAaEYoMD0t4eUsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Abzp8AzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfZPzpFs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Abzp8AzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfZPzpFs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hdOT607686
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 03:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=; b=Abzp8AzMlJ8HqrHS
	VYfpRrZ9HLQMguIYr/P9L+X89UScB4PEiua6NADStsqmDAQXNtFXeuOLs8cnZG0U
	Ai99UjvuASNO8FRrb0jFobuICsJdghp7sI5Jpr4TqtdyMPAwVY+wbbRih0hKz1XS
	ZyUEMr5pPQ2PDbI9Jq2QVUSFN0vSAZElCB5v7kefROYozxT136GAoZl5GGvm7ime
	ZcViKFZ7SCeZumYB1zw8lFBMqVSOb89jqbyF1imMR8u8wAb6xjjr88Mrp19i0Dcj
	AiGkqT3+UsnKZGrswrhqCtw59H+tTdu1vPgOGyipyLMDgJ/1uNcUcKBsFd05TnuK
	aQR89A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rv2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:12:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3517ee4b01cso101032eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 20:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791429125; x=1792033925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=;
        b=dfZPzpFslAd3o4h3WoxQk2EAy18hgmpgWGYQE5ICRpIwY3hkerXq25PyH626rUt4bU
         aE29hJHa26pdiKJQTe6kTW9oGEzxat4HdhQRGIcCiplnZ1vQLhw85EYHoy7z20/kY/1z
         kjjMLwT5aJTogQ9H0HZk95cta3KACIWEcEBVJOhU7phvLyPT/XtvYRsKGCtRdk8MR2Rw
         vNJ2ubLVfJGp9tZ9dMYnlu9iV39b260IkkyPmtn8gaMu+S77C+5hOHK6JKrU5pKl0XJv
         9BPsZeL5GtfKw+lUNNP3yra9mWXKQl7nHdIdUj9VX7lAAcXP9aVZbp36+GdGMEKdn39p
         RMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429125; x=1792033925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=;
        b=uxbpH0g3ptZCD01JGseApOErjw1B7Ap4HgiJT/Nbfg9GmAI0o27fAf17szraYA7DPD
         enL35QyX4A/BaAZZfc9tto1vML21ksrPn06/7rMIzrW7dOKqGkjwo5yCse571Jja92wd
         RVTSzApPA4Z/R9o099hhJ8BUkTfgSY2/tig0yDR2/rhEj/Vxui6lI9gk3z6YuWUjrp0U
         ncTuwYm6x/JGYeFTux1fgb3PCVLIXNArajHn/roOppCDBBhnBKiuvyBg0miYQt7K6kUy
         6rccz122JyPojFSOoOPbIsCW7UlefYhPkSx/ioyH7AGR3FWGVBLOkMu5VAQbZkDSTGfZ
         hz1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwmyopYXjXx3ou0SHGNmnII9cjnnPBuCoR7tO8eaZ+uL2aDoz9lWVqZ3Ni0QPGyCUQd8Y0SZaAaUMgqBef@vger.kernel.org
X-Gm-Message-State: AFuF++kAPnRJ0yby3G6hfZRIdEmr93wyYrn/iQzyATiymdnUUzRmisKL
	xbUD3oVc108t0qO+jH7hirXvL2hnwvkaHWOm9mlgge/P9l1p1akoHkmieR7uBLo2Xz0wulBUMhn
	LJNynNSUymAXgZYK+OlHse705SqiphMoPdc/tIuaAYDIvzqzosWqNtrJnxNZKHttF9oZo
X-Gm-Gg: AYBFou0eUeKhEeuGTsKTnGZugnGjsWx6C3Va85RxNVrLTnhVgGi4jha31GfU37ftFVH
	65/eu4yrpI4L1Lfn73xu9u0NtutsxQV9Bt00hh7WiRQqcEPSWLlhIfkBn9NpDzBnkeIRfpoXMaP
	1GNUEm/kyugOFrXhjWD14dqUuSfN/0QKOQwOAkP62xXHByYCqkDxAHcDPkFZAmOu5rZ5D/ZszGz
	bxftCEj3qq+N4zIVuMv8JqJxNgVCOF4mvNJ0v/fZuGQuJDgU33tp5COhnMSiqcyT0fQbVvVoS1M
	i9L+KC5kZCDqLywswMNDgLgqGaOiPmmgxh7sN4hmdQFlWDaCxIeYV9WCfDRPKxKQ8HgqeG0i2oA
	Rqt8szZxhXszPrK4Z3p0LLhPCw5x+WUwuZqELTh0d6UJGrbBmTYTyUfE/nb65rz+Dc2RC0N8+To
	epPr09Py12mwbreqiX1xM=
X-Received: by 2002:a05:7022:4381:b0:149:f2b3:efcb with SMTP id a92af1059eb24-165a602bc41mr2109320c88.14.1791429124317;
        Wed, 07 Oct 2026 20:12:04 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:149:f2b3:efcb with SMTP id a92af1059eb24-165a602bc41mr2109240c88.14.1791429123253;
        Wed, 07 Oct 2026 20:12:03 -0700 (PDT)
Received: from [10.79.117.82] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm5057986c88.7.2026.10.07.20.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 20:12:02 -0700 (PDT)
Message-ID: <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:41:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfX/DuLMDoZ9+ZU
 dASpb/puCjnyVnvk01RTpFvdGhunW85Xto4vZ6wcuLRfqElcJXMXQol8tLvS9E4NRUpvihkR5Kf
 D/ltwo0AuL8KFz0ceETduixqkfcm2NI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfX2gdEQekUIVnM
 /p6KNHmutOp7EaJtSXimdV+n6D1JKYYOocEir2i3dU1Br2wnlwfH+5M2zgxWaysabMj6Eom9Z9u
 DSeBVIORENYHjfYmy3cdTpgFiwjgReCwO64cpI9D0kplMBLglMyZZlaReH9vPGaLE+ZcEVriTT1
 jGIZC0KMLoA8SxCOtf8s/98ao3Xp0DciBvnhC6cZyzU1t6gOv6Sj0Gfv/RzNMKBgMASMt0zqH1e
 L4azwg5g5Q5zRpk4C2lr+fd0lsOOPuWAVf6wrN1/7P5H4vTwtdDq7EB4RGnWlW+t9/bmhXxJv2g
 YbEPwg+LReydmnjcIC65i3Ynu5tUo5B96izLB0uHFy8MvhxfBjtOpme76W3Ogum1MoplHrBGrtZ
 79a+fW73UYPhoe1znAMclxW75y0reWbYaEGpxFOACU2tUin4KvOC724DrVoEF8emtWFNfVkVv0x
 sno1XMz0khRRgKEY6Qg==
X-Proofpoint-ORIG-GUID: 8NTDXAfICgRP8_AJlveG0reOx3QUiOfn
X-Proofpoint-GUID: 8NTDXAfICgRP8_AJlveG0reOx3QUiOfn
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70a05 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gpu_kyyjuvhznk9Z_CEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080012


On 9/29/2026 3:18 PM, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
> series (bindings, GCC, RPMh clocks and power domains, interconnect,
> pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
> only the SoC and IDP board devicetree, plus a small geni-se binding
> update that lets the QUP wrapper use one address/size cell on 32-bit
> SoCs.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v7:
> - Addressed v6 review feedback:
>    - New patch: allow 1 or 2 #address-cells/#size-cells in the geni-se
>      QUP wrapper binding.
>    - Switched the QUP wrapper to one address/size cell with an empty
>      ranges, instead of the explicit 32-bit window.
> - Link to v6: https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/
>
> Changes in v6:
> - Rebased on next-20260928. The rest of the series has been applied,
>    so only the devicetree patch remains.
> - Addressed v5 review feedback:
>    - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
>      that all PDC-routed wakeup GPIOs can wake the system.
>    - Added wakeup-parent = <&pdc> to the TLMM node.
>    - Replaced the explicit soc ranges with an empty ranges and named the
>      node soc, matching the other 32-bit Qualcomm SoCs.
>    - Widened the QUP wrapper ranges to cover the whole 32-bit address
>      space instead of a 16 MiB window.
> - Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/
>
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>    (added in v4), so like the other Qualcomm GCC drivers it must select
>    QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>    (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
>    -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/
>
> Changes in v4:
> - Addressed v3 review feedback:
>    - Registered the interconnect NoC provider from an explicit
>      core_initcall() instead of module_platform_driver(), matching the
>      established qcom interconnect driver convention.
>    - Replaced the NA mux-slot placeholder with _ across the pinctrl
>      PINGROUP table, matching the upstream qcom pinctrl convention.
>    - Added minItems: 1 to the interconnect binding clocks property so a
>      single clock is valid (system-noc), and aligned the binding
>      examples with the sdx75 labelled-node style.
>    - Added GDSC power-domain support to the Kuno GCC: the binding now
>      defines GDSC macros and the driver registers the EMAC0, PCIe and
>      USB20 GDSCs, so #power-domain-cells has real backing providers.
>    - Split the cpu-idle-states phandle list so each phandle is on its
>      own line.
>    - Collected Acked-by / Reviewed-by tags from v3.
> - Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/
>
> Changes in v3:
> - Addressed v2 review feedback:
>    - Reworked the interconnect binding clocks: dropped clock-names and
>      replaced the flexible min/maxItems list with fixed per-compatible
>      clocks (aggre-noc: 2, system-noc: 1), required where present and
>      disallowed otherwise, matching the sdx75/glymur shape.
>    - Made #power-domain-cells required on the Kuno GCC binding and
>      declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
>      is a power-domain provider (following qcom,sdx75-gcc); the driver's
>      GDSC support will follow separately.
>    - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
>      a distinct qdss_cti_trig1_mire pin function (and allowed it in the
>      TLMM binding enum), as the duplicate funcsel-2/3 entry left
>      funcsel-3 unreachable.
>    - Collected Acked-by / Reviewed-by tags from v2.
> - Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/
>
> Changes in v2:
> - Addressed v1 review feedback:
>    - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
>    - Reworded dt-bindings commit messages to the "Document X for the
>      Qualcomm Kuno SoC" one-liner form.
>    - Canonicalized copyright headers on interconnect binding / driver /
>      NoC ID header to the single-line Qualcomm Technologies form.
>    - Dropped unused <linux/mod_devicetable.h> from the interconnect
>      driver.
>    - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
>      driver.
>    - Extended interconnect binding to optionally allow up to four QoS AHB
>      clocks (matches sdx75/glymur shape).
>    - Cleaned up brace/space style in gcc-kuno.c to match peer clock
>      drivers.
>    - Reworked initial DTS: moved idle-states / domain-idle-states inside
>      cpus{}, wrapped fixed clocks in a clocks{} container with peer node
>      names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
>      stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
>      idiom; the YAML example uses a named placeholder), dropped the
>      RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
>      no corner votes / no pm_runtime, so the reference was inert), and
>      added a bootloader hand-off comment on the memory node.
>    - Collected Acked-by / Reviewed-by tags from v1.
> - Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/
>
> ---
> Hardeep Sharma (2):
>        dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and size cells
>        ARM: dts: qcom: Add initial device tree for Kuno SoC
>
>   .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   4 +-
>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
>   4 files changed, 472 insertions(+), 2 deletions(-)
> ---
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> change-id: 20260809-kuno-soc-support-1dab826de0bf
>
> Best regards,
> --
> Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Hello All,

Both of the following patches are ready to be picked:

[PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and 
size cells
[PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC

Could you please pick them ?

Thank you for your review and support.

Best Wishes

Hardeep Sharma

