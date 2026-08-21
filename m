Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322DA488D92
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312406; cv=none; b=U/spv8bDuWSc3manUpqH4lthbtBtq8AIjYkE8RltwSb7p/tZtuoOL/G/URvbosWXRMy7EGPFV5ED7gu0yTtk/qiB3n7Sc0mR/RNeDfvrrrNOw2w58v7yFyJYMxV6eEYLEPBq3j075F+LjdLljMs85bNI9dVnuWc3tGALlk1Pt8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312406; c=relaxed/simple;
	bh=KCYuvQq0jPJQHOiJa2q+PvHghOT9g5DhGN3VcWy+t/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy5OfDN6LDXoqnwvKvAGqGlJkQPCiLqono24x4yZoQ+9fCQ5CSQYqzNBYK/PoBX0Ilw/AZHcJqw1rSbOx6ffTIn/NuQfwfsY6k9HQPo5K+hL36+tMvvx7f6h4rVItDYjHJckGGrOXpUuYhdi/4FtZJ8O0PRABIXsPhX0clT9QJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av1Xw4Ip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYueVwyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av1Xw4Ip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYueVwyN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LrVn1570825
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DyqjuBsp+SzIbVc21yNsTsvr
	T6fTKh4Kr2nkvCI+gYU=; b=Av1Xw4Ipo6vijxSuKxEct1VNSsFBjio+xYYAmNb3
	hP7yh6rl2bS4HOl7u97jn1xkOr+iqDB/OfTwClWoM0CQRzoWkHC81rN79ErMlHAP
	KXv0ViOpUpMa5dyq7/yzgz+saS0S+dwW+SX2Z19LCc1XkBhIsL7DvQBdEHouc2aT
	vPctz8RTtcq8xRfjN4iz8fhG/BGNoItxL3EE1/f0QdLmhtubKcsgLCoUhOWUccqE
	kRdJEOHmFSyCF3AjcWVX5bDyURPFI95MNNzfEM7VrUvled0KJSfLMe43mGyiBZ3F
	Jld/9RmPMLQSri9vXJvXGkg2tSMxdIjYKqpOTDYDMy2e1w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue1e06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:40:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e7c36621so282922137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312401; x=1787917201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyqjuBsp+SzIbVc21yNsTsvrT6fTKh4Kr2nkvCI+gYU=;
        b=WYueVwyNYQoymKpP58n6yC9d+NFzKygPA0wk0eEwiL6mGKfDWOZto6fI5PNXdzeJyQ
         N2O13wwqAj3R3a43Mxb1N/vmZgEO0UiI+dnTGc7zk7FCMUzR3ciQi0FCUTRDyW3XcmRl
         Sv/TDqpVK83nVaTiQilYOoORYbQYw0hpebpLMwQZOMkIfT66FVW/+jNpohWcuwSglBuF
         NWSXaTAocbZTE3S2Sn784L4oCf/ygsVhoHPd61tUeesw2G+dyL66VJSj7lYPct1T2Nvd
         ivFroLtAiU2kw7zHa8ZdfMCrgVEIuFCeieNEGHknSxGrDjEJNcH+1s6my2L42uaX71kJ
         FKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312401; x=1787917201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyqjuBsp+SzIbVc21yNsTsvrT6fTKh4Kr2nkvCI+gYU=;
        b=BY4x5g6trZOKeumDDOT+Ioo64qEG+sQ8ug93T5ZtPMWCywj+m/MoORBXIdoV3M3OvC
         TFgqGteRHhPRM5giQ5Xjj1zP8mjELuuPVCwHqp8oedQWx6aiGl2Uy1bfLIKaYtQS2vqB
         Jw25mKE0cato9k8eyXdztM64FRhN6BIwjTl+XqBaXaSAxU2JcpW1PpOQvkKoPnyugsQ3
         +FbTY4117asrbLUpbH4rh2oixNrtMj5JlWyHOTr6oHQoag66Ij0jEhs2Jt3TTqFffSbx
         hNxO6O8NdIo99wJjIpYUFMGE1IAdedzS9bjSnUFqGSMiF3lUa8uVl+11g9roQ/vEjsiO
         a/Xg==
X-Forwarded-Encrypted: i=1; AHgh+RpqetcNUugqgdzG4CL7FNC8mIbKmxsIg89VDumP8f88x12x7v9mgxtnUYegPh4U44lb9HUvy00gJZdwyO/n@vger.kernel.org
X-Gm-Message-State: AFuF++l1qbl4X6kUrS19SlIDCVz8CVPyIjfogL63zZ/cxPe6Yw+tjMp9
	kjkXe4X43BNIGNnV7UwlWUFlyuSbUfKk91ueuReGDIb3g9UXV9/pAn6qb0ObMfnbjaCJRPGygrg
	BfmtI/sEGD74xfFSSey1W0+sk6oTQnd18s0eKKeYku0Hs+YH3q+OObcHrHGveYHIIjMD8
X-Gm-Gg: AR+sD13a4CLl/VGLNI4NUFWiBnW8d0U9HaJZAmPl0s/VbdIvWOz4hADqAyl4TseOP8T
	exRvvhI7my6maGw9fp350KMyB4etigP9lpbBJ/k3hSxNzkbYxrv298F1+vci8QPTQpdDdaM9eim
	MEVNPVco6bUVZB280/A8QG5PXGFSd6akMpiu1/B4/7eZbaaPFPtyOXuawl65tDaII/ZMbJWNFzG
	BDdcTC/KBLvOH73vviATcreaPir8sMKOymgzyo2LFm71TdKvvQxvvwT0xwC4X49oaPXkNoL/Ukf
	ikHGKtfJzsOst800TEp/HhCpFEw8Oz9iNe5woyLNewbnPiis0Ke0ifh+keGNLeXc+ZkiGfnNDKO
	AfFXYVCSYr2SZSDA=
X-Received: by 2002:a05:6102:5f07:b0:779:5049:87b2 with SMTP id ada2fe7eead31-77a5f7f88aamr1872131137.0.1787312400890;
        Fri, 21 Aug 2026 04:40:00 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:779:5049:87b2 with SMTP id ada2fe7eead31-77a5f7f88aamr1872116137.0.1787312400306;
        Fri, 21 Aug 2026 04:40:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm5961196a12.7.2026.08.21.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:39:59 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:39:57 +0300
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
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229
 Type-C controller support
Message-ID: <s2ktdbck6jsb7eb2axjofhhxc57pqeslybqbgjuwmbjzjlt23s@rwkqmyfeqh2v>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OCBTYWx0ZWRfX8pr9LVsnSm4D
 /axpnz3ZvgOLaDxP/0QZloeIwydQEoHg+A1TYZqRKpCQT3eqHVLF3SUU6jkGWohC3H2K11rJ1Dd
 OkUAMtwahGtbxa30SxYeWZSMd/PSKnI=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a883911 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=diHLKiv1CRy_QSkn2kYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Fwq6_DtEmNQlx7sy9j91X9Qi3RCgFJ4o
X-Proofpoint-ORIG-GUID: Fwq6_DtEmNQlx7sy9j91X9Qi3RCgFJ4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OCBTYWx0ZWRfX2PIQhy0WhMxX
 IhKujUxT6hMvfCkq6zRxjgDyY1ZuyBO8avJ2J7G3o0nbnFNG6Si1u4FxzZKWPmMvLyd/xwwmnVW
 iTWrxRbSKqekf3/Ve19FIhQ7X2mAx7g1C7RMRx8+jpTMdNJ1CeF1h8RUUQumt09z+FBX/P5iyMI
 OAYcz6vdNB84oKielJrVi+cvcAt4QdxUOR/ZQMI1TP/C5tbRTS48EcAP1j7SP9eDYYi6G4/yfQb
 1nEB6WZBgOumdXSTuGEJftbyJ/sJOEobzoWUl0QhvlyIjXN+mYCel875Om9RF7p3HLZJtkKdjmG
 +sqRHmDNXh+Al8UiLyLrOGQZbZZYi6CfTS7tW4PDhovUUNRaeYAQeR40f9s9XHQF6z0ludy6TKs
 QgPu3rAHYtGVkgVBGfIW38Q/NqKltcxSj0IwnnjiS8OIQYOtYEmrBUApZ1o6c1MnoeO2qhbM8aq
 PzPIrhZtpAX8rDC/yrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210088

On 26-08-21 15:56:49, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.
> 
> Changes in v2:
> - dt-bindings: add a top-level "wakeup-source" property on the
>   controller node (matching richtek,rt1719.yaml/ti,tps6598x.yaml) and
>   move "wakeup-source;" in the example out of "connector@0" onto the
>   parent node, since usb-connector.yaml ends in
>   "unevaluatedProperties: false" and does not itself declare
>   "wakeup-source" -- placing it inside the connector node fails
>   dtbs_check. Also fixed related whitespace nitpicks in the example.
> - dts: apply the same wakeup-source relocation to all three affected
>   boards (shikra-cqm-evk, shikra-cqs-evk, shikra-iqs-evk).
> - dts: fix shikra-iqs-evk's cypd6229 node to use the
>   "cypress,cypd6229", "cypress,cypd6129" fallback compatible string
>   pair required by the binding, instead of "cypress,cypd6229" alone.
> - dts: fix shikra-cqm-evk/shikra-cqs-evk wiring so CYPD6129 connects
>   to usb_2_dwc3_hs (secondary port) and PM4125's built-in typec
>   connects to usb_1_dwc3_hs/pm4125_hs_in (primary port), and add the
>   missing reverse remote-endpoint links on pm4125_hs_in/pm4125_ss_in.
> - No changes to patch 2/3 (driver match table).
> 
> Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Please do not send as reply to earlier revisions.
