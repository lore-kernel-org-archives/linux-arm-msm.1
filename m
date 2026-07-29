Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C45485CEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329844; cv=none; b=uQfPqn1kEwWe4PyuocVFk89rKyYKt02B2WaMUIu4qfyBtJDZRmAR+ViKg3oNZDX0iOW95RJdWbw6MNA4UxMXgKpuIoU0NYPNskJcuQXE8JQ6Qaa+7eEidj8PTeOxyewSgzWhC7cYZgWVwhc0mW613Hi4M9ylpecbUj8bPnthbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329844; c=relaxed/simple;
	bh=mo7dw6vB6ggaGv3tG31AMRQAwPc45eB7mu19dYsk22E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6O4W4se9VFIRsKQlLtkq2/m1CvUpfXPEl5YKncskh6+wwboUE4WP+IOHFtKUfBs3hmC6d+7tdTSZAF5kFKIu1PtCnpTaAcy8wKYx9SniZYP+F22u3tKjeSo4Z6EkdXfVzOkAKrflA+dviFJjlG/Mix7wE9HSsj3lmSHC8rT8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnG7mCtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4Cuafgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnG7mCtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4Cuafgh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBsvrW1766501
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ermkCfz6no91BoabcO2VpBECJ7Kl0yCB6REaLfSQZWk=; b=WnG7mCtOH9Nv9NcM
	/6sUgodwUdr8GGfG9MJGFvKXDluZWv4niLQsKnJTYPXCXsuiyfksx0tgHDRI3YBh
	MHAA6Bv/dQvA2DL9lPkaLhhV3M8oi7FEMRp6zFj96ajhtPS/Fye2+QkjO8ngRb+L
	Gy2NlCYxoORKUtscEfMZjFeblKrK2HShyluC7tyxjhFETulxhfZzc06X3FTveMRN
	h1wwb+txYP8sDvPc4o325B8+F5PwJD4xMBWFEmkVCKMCOK2Rbt5JcQMPIjaySMC/
	KdpyJj/HaMHic+WYuqhFsct2wjTQoNSx3JAy8RMRcZTkTq07E2I3v6vZyJ2llE14
	PSIkEw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2kg7b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:57:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso996021a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785329826; x=1785934626; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ermkCfz6no91BoabcO2VpBECJ7Kl0yCB6REaLfSQZWk=;
        b=V4Cuafghb1EM0zBZNMYjHKqf6NCygLZj1o2c/dkolqfU/5pZeSIrUOCumiVmYwRWKZ
         4j5cbFmSNh9HktSlBu/T5e44VLTlRaQXd8FvNozgEsle75qYdHXyvEJTVZm9BqBebuXJ
         t5G5oFAC+nL0K6DKA0y668NkGC6GftQHXrkFJPqu3jGhRCwMBYjsG4qBChuJZ/TBh5nH
         ltl9YoCh2QKIjup14qDUBvNQlK10sq3W8vVvPUWnIvK3NYmN45yyQcYy01PPMYAlOd9c
         tuImLp/bWOfGerv5SNdvr0a7JNVZ3hWUVYMDDFiizTsOnIt4uA4i1VI4iy9VMK7cmGwT
         OCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329826; x=1785934626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ermkCfz6no91BoabcO2VpBECJ7Kl0yCB6REaLfSQZWk=;
        b=kZskP1V5/vLFYOifgYvEIByQ10keqMlQzK5P/nEc9fL7FTA6QhBYoDHn1gPNS6DoGb
         ACFenX8MaeYtPVb6XJTWEisUtujH3Zg0HpYIOsr5PlsxG6HDrDntxrPhr65FZE9MPCnS
         tU4HnmixIooCcVdzG+Dk+7loPHOBv4RDVtB1ui8uvCwHx+O+sgFOPLMGZ0WzaCGMfaXr
         r54lpbHhK483brGIGVrXS6CwovIymQZmaRvg4HjZtltgJW1ifcoeE1IOA1ODHREBDjBg
         Dtm0EX5LxSou90sYJNU/bPB5oLkCzNu4qzmL8tTNdKFWy+jJ67Rq2vdnH59e8vW5tZVG
         mw5A==
X-Forwarded-Encrypted: i=1; AHgh+RoJv5QPzAoRybHP87lVgCL6V7foeCK9pXbC2uK0Rhd8Kp/grw1hUK1L5bLVfFaYOrNALiN8VXeg5mlvQDXq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6VoDus3rGLaV+IQ3hluIGYORZ8dHko/k8x4NY9NrHmNiyhB0
	+ely9RMWBTQUm9ZSSJ8KaNhB0AQqlvfS/bx8QyDzXKrCsyAY2wdkiGStu1hpBEBO08CcGFkdlne
	f3p3kcBbIjHRB8IlQM23If+eYh+nWH1Dg82b+S1bqWTa0rXU1B9TWUXee1rdIYHvPcObj
X-Gm-Gg: AR+sD11VAEXnNik9LGUZrYJz7FntIiurEbD0pHfz8hDp1RchFXuJa7+k2QccuEOo07k
	XhxyvB4bgpwUyM3VpX0pngDzKMtj6BYFfXjzGju3gZO6N8jCVmKyk+4EAAc3pGtyVJGD9cYa+s6
	XzZwecQbolIfB3OA8hij2HTogNeFPfKyr1cQWFr4GyH5CXiPo/4JV1ARMVPa60g4nqYQk6O/28e
	jICDYIa1ivRTMpZBThFvvrSfsVy3YbyUOobqLUdNMwjzaDq8fhWpklWOQp2b+OVgi1cC8sX1UXB
	bZGd63LKUkvl12tsF5buq/5jgo2b8M7IL1LJJyZuSEZSc01mYODzFtz7Zp5CSU8IhSnQfMcJmkt
	a/v1jPq9YUwvr/C0J50WjEGi9wEQ=
X-Received: by 2002:a17:90b:47:b0:38f:5828:857e with SMTP id 98e67ed59e1d1-38f6a33f520mr7120393a91.16.1785329825832;
        Wed, 29 Jul 2026 05:57:05 -0700 (PDT)
X-Received: by 2002:a17:90b:47:b0:38f:5828:857e with SMTP id 98e67ed59e1d1-38f6a33f520mr7120354a91.16.1785329825298;
        Wed, 29 Jul 2026 05:57:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm8809912c88.15.2026.07.29.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:57:04 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:26:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        spatakok@qti.qualcomm.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, ravi.hothi@oss.qualcomm.com
Subject: Re: [DISCUSSION] fw_devlink: incorrect ancestor fallback for
 intermediate bus topologies breaks audio dependency resolution
Message-ID: <20260729125657.phrqwyigwuljezoc@hu-mojha-hyd.qualcomm.com>
References: <20260701131733.870079-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701131733.870079-1-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfX/ywx7oc3ORnt
 z4ZUevxgIDjs83aXTToVfDEuKxPZAEcDPyQ3OtdiuPn6Tt8ovnuUhTkxbEGWrbsyKpWo09mvC6V
 GaSwIw1Aty9vxg7AOC1QUKdVTgipICkSUOP2KDg0/E3OMUeDKdahBP1tfkLg3fiTESijqL3znZR
 xCysJXTWZQ+3/MxJ+4iygKERyyjrCwBZpcl/UK6fo+t8XzmQNR/hlm6KdKJadNLdWiwUkWR1pn0
 Gp3IFqsydigAoY7qReJmYTQ/Sxirg6vavOHVTFY+7DMsRCJ1uhgPcpZXhHywoHTnEj9rhm3qXRb
 Yj1QnuSGI60SQZ80Sp4PPbZfnA4RKTaiBGf0vDo86HA0vUbF7jxN2OSGP5mE2nWR2wAvnb6T2B2
 gXVmS0kr4DjimtEIj4RbasAat2m1+TE7snfXH072ytcnRI48/GaKDTSRF9T2/KhKu1/mQBwhh6/
 vTI45C0HOTI+gCtIOjw==
X-Proofpoint-GUID: S4KDPfSsadfodcgMNEi4C4h6fu7cygMl
X-Authority-Analysis: v=2.4 cv=Q4biJY2a c=1 sm=1 tr=0 ts=6a69f8a2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=jljjzdZnxhpnBLCvp84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfX+7SlghSu7ngK
 5k7w0eHPzJ0pM8hTfpdjxedG1vrMcc87pWzurvR2c5XdL2RrpyI1dLGEo6Ijs1QAmwMnVRY+f8C
 NpulQ3KMM/rzldSNd0KVo/3L8K8shdA=
X-Proofpoint-ORIG-GUID: S4KDPfSsadfodcgMNEi4C4h6fu7cygMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290107

On Wed, Jul 01, 2026 at 06:47:33PM +0530, Ajay Kumar Nandam wrote:
> Hi Saravana Kannan,
> 
> I am Ajay from Qualcomm, and I am working together with Ravi on ADSP
> Subsystem Restart (SSR) support for Qualcomm LPASS audio. During our
> SSR work Ravi observed that restart does not behave as expected — when
> the ADSP restarts, all child nodes of the remoteproc should detach and
> re-attach cleanly once the remoteproc is up. While investigating
> this, Ravi identified an incorrect assumption in fw_devlink's dependency
> resolution logic that causes wrong device links to be created when a
> supplier device lives behind intermediate bus nodes that are populated
> asynchronously. We observed this on a Qualcomm qcs6490-rb3gen2 board
> with LPASS audio drivers, but the assumption is generic and can affect
> any similar topology.
> 
> Problem Summary:
> 
> fw_devlink appears to incorrectly collapse pending dependencies to
> an ancestor device when supplier devices exist behind asynchronously
> created intermediate bus nodes.
> 
> In our topology, q6prmcc is instantiated as a descendant of the ADSP
> remoteproc through asynchronously created glink/gpr bus devices.
> When the remoteproc device binds earlier, fw_devlink appears to assume
> that these intermediate nodes will never become devices, collapses the
> dependency to the remoteproc ancestor, and deletes the pending links.
> As a result, the intended dependency:
>     lpass_va_macro -> q6prmcc
> is replaced by:
>     lpass_va_macro -> remoteproc
> 
> This results in incorrect teardown ordering during ADSP SSR because
> codec drivers are no longer linked to their actual clock supplier.
> 
> Could you please suggest how we can resolve this issue? Is there
> a specific reason for this assumption, as it looks incorrect in our case?
> 
> 
> -------------------------------------------
> 1. AUDIO SYSTEM TOPOLOGY ON qcs6490-rb3gen2
> 
> On qcs6490-rb3gen2 the LPASS audio clock supply chain spans a
> four-level device hierarchy rooted at the ADSP remoteproc. The
> intermediate nodes (glink-edge, gpr) only get their struct devices
> after the ADSP firmware has booted, which happens well after the
> remoteproc driver's own probe() returns.
> 
> The Device Tree hierarchy (from qcs6490-audioreach.dtsi / kodiak.dtsi):
> https://elixir.bootlin.com/linux/v7.1/source/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi#L113
> 
>   remoteproc_adsp                         (ADSP remoteproc)
>       └── remoteproc_adsp_glink           (GLink transport edge)
>               └── gpr                     (GPR bus, compatible="qcom,gpr")
>                       └── service@2       (PRM service, compatible="qcom,q6prm")
>                               └── clock-controller  (q6prmcc)
>                                       compatible = "qcom,q6prm-lpass-clocks"
> 
> The LPASS codec drivers (VA macro, WSA macro, RX macro, TX macro) are
> platform devices under soc@0 that reference q6prmcc as their clock
> supplier via DT phandles:
> 
>   From qcs6490-audioreach.dtsi:
>   ------------------------------
>   &lpass_va_macro {
>       clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK ...>,
>                <&q6prmcc LPASS_HW_MACRO_VOTE ...>,
>                <&q6prmcc LPASS_HW_DCODEC_VOTE ...>;
>       clock-names = "mclk", "macro", "dcodec";
>   };
> 
>   &lpass_wsa_macro {
>       clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK ...>,
>                ...;
>   };
> 
>   (similarly for lpass_rx_macro and lpass_tx_macro)
> 
> The intended fw_devlink dependency is therefore:
> 
>   lpass_va_macro  (consumer)  ──►  q6prmcc / clock-controller (supplier)
>   lpass_wsa_macro (consumer)  ──►  q6prmcc / clock-controller (supplier)
> 
> This dependency is critical for correct ADSP SSR (Subsystem Restart)
> teardown: all codec drivers must be torn down BEFORE q6prmcc is
> removed, so that no driver calls into a clock controller that no longer
> exists.
> 
> -----------------------------------------
> 2. THE INCORRECT ASSUMPTION IN fw_devlink
> 
> fw_devlink correctly identifies the intended supplier at boot time via
> fwnode links. However, the links are never converted to device links.
> Instead, fallback device links to the remoteproc device are created.
> 
> The sequence of events:
> 
>   1. At boot (~t=0.085s), fw_devlink resolves the DT clock phandles
>      and creates fwnode links:
>        lpass_va_macro  ──fwnode──►  gpr/service@2/clock-controller
>        lpass_wsa_macro ──fwnode──►  gpr/service@2/clock-controller
>      q6prmcc does not exist yet → EAGAIN → fwnode links kept pending.
>      This is correct.
> 
>   2. At ~t=7.597s, remoteproc_adsp probe() completes. This triggers
>      device_links_driver_bound() which calls
>      fw_devlink_pickup_dangling_consumers(remoteproc_dev).
> 
>   3. fw_devlink_pickup_dangling_consumers() walks remoteproc's child
>      fwnodes. It finds the gpr fwnode with no struct device attached.
> 
>   4. Here is the incorrect assumption:
>      __fw_devlink_pickup_dangling_consumers() concludes that because
>      gpr has no struct device at this moment, it will never get one.
>      It marks gpr as FWNODE_FLAG_NOT_DEVICE and moves all of gpr's
>      consumers (including the codec → q6prmcc fwnode links) up to
>      remoteproc.
> 
>   5. The correct fwnode links (codec → q6prmcc) are permanently
>      deleted. Wrong device links (codec → remoteproc) are created.
> 
>   6. At ~t=8.364s, the GPR bus probes and q6prmcc eventually appears.
>      But there are no pending fwnode links left for it — the correct
>      dependency is lost forever.
> 
> The assumption that is wrong:
> 
>   "If a child fwnode has no struct device when its ancestor device
>    binds, it will never get one."
> 
> This assumption does not hold when intermediate bus nodes (glink-edge,
> gpr) are populated asynchronously after their parent device boots remote
> firmware. At the time remoteproc binds, glink-edge and gpr have no
> struct device not because they will never exist, but because they are
> waiting for the ADSP firmware to load — which only happens after
> remoteproc's own probe() returns.

The issue is in __fw_devlink_pickup_dangling_consumers(). When remoteproc
binds, it walks its child fwnodes and collapses any that have no struct
device at that moment, assuming they will never have one. That assumption
is wrong for nodes behind a remoteproc that are populated only after 
firmware boots

The fix is to skip collapsing a fwnode if it has pending supplier links,
since that is a direct signal from the DT that the node is intended to
become a device.

Could you test the patch ? Will send the format patch upon
getting ack from you.

--------------------------------0<---------------------------------------

diff --git a/drivers/base/core.c b/drivers/base/core.c
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -228,6 +228,9 @@ static void __fw_devlink_pickup_dangling_consumers(...)
        if (fwnode->dev && fwnode->dev->bus)
                return;

+       if (!list_empty(&fwnode->consumers))
+               return;
+
        fwnode_set_flag(fwnode, FWNODE_FLAG_NOT_DEVICE);
        __fwnode_links_move_consumers(fwnode, new_sup);


-- 
-Mukesh Ojha
