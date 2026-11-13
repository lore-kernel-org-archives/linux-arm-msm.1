Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538494;
	b=zn5qJXGkL/zNwimu3ioZLvDirwbTHtnJ1FbhQQl77B6PA4oWhWQMP4hvdeX6U5Ip/jLN
	 /PkCsMqhVOC7hfBae4Nm0SfBFBwR+7hMb6hDVqhaCbth79VgKQkWvVhIRHAf1JReDwVRD
	 +u3Pj/koNGudd1i2NHbkB0t46/u0tWAhtt0IJJ9Psc6Ig4iNTjmzMkcnJAHv/2JZcDfIk
	 xMOZGIA/hakM9p94nPJ/eYoly07rUdv8FIisMPTjE2pzfcBOIcgAptmZSQaXRT3ypR4fG
	 pchZR8B1/VbY+y7jhElLdnIOBUFtiBR+09rDM01IKEQj7vxKDwKIPsp/RhDgGXlpOVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
	b=VY3MuRltBlTQyO003NQjA4uyNESz1oE2S9J2QaUbGCiuzpSXY1JhrHdD0Z7fsyZ2TFRR
	 J4L5KiXNeXYZH/ru63Fkv8TfY3Za5eQFeS5AbjTiFcuEv3h3uA7bMu4PoteUfvOSNvLOd
	 f/S/o1vYpdo8NqUysDCNUju0xPubCoKt1y6nXYAzZd1GVUw5JcZpoQbUFcqUYhUOL04mq
	 FpaYkmqupJ0S0Jxfot1KpYX7CuWqZqZk/nEWeSVmdq2K+zCCNXRm9fhd0a3XCZtOuC1cq
	 KD+MmWnCg8wbxppZBaxdM52GP8OZkCS/am+2+UbGGiZBsXQAqFuOKO6I18zV/AI4Tvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mAeMaPNT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guDtYZxZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793B7606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mAeMaPNT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guDtYZxZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5Cj3179214
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3IFlEUS0jw9JEezJjoa+Ahcn
	wnp+ipK5GvAoLO2eIuc=; b=mAeMaPNTVcH/RfulSEEcf4Mi0l/zKk1TLAWJAtut
	+wC78LhpJPRTAQlt58ob7fzUWFONgyOCpXNUrTn56jZOeh3Gjrop6WZyyV7/G/R9
	mLEkkduNNJE+IeiZ/afjYjkQbM4X+BmS8fyBY21rQ/+UlFW1Pz6PhUIgU9sBXOOU
	X/A/pHJKgyDyzySC5gfzIRAJ15Uys/qUtmWxpYBc0XGQkukWFTHdKozsi4WvyQg4
	aRGnso0JKeArYZA8K+cd2h5kd4j+hOti4g94W6curiWoahmahS75i7hgKVPLRl4A
	+kuxpU3VuVTTxDbcclph6ghL5FH+SgYLxX2I1zFEvZucHQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ahtk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:54:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so352962eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538491; x=1795143291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
        b=guDtYZxZ64ptWGyTeSX0Z2mpOWhSvzMJ3uJMNmDuodMfYOkarOtXwZTYAQjKbLO+k1
         BXQJToSfmNJ1djhw2MwzqQkBKgcOjyLp2noskNzk/WeIvogTQHs8Wz4vFWcy2HiA956K
         +abZcaNwp6qckPxxDqx4XqrZLYjJHMLW3vlFtGHVoy8Kld3kfcjTzuud4/mBwBUc5y9R
         a89RmFDsMY4OUi3QE7NyA3UOUhp2VI0XSgKJuiKh1mux69MwIC26P7pDadG5W+ULDF9Y
         x4c+zqorS1sCeMcfx5C53RRWj7t9BxBPm/zkHG+mcRmp5vlnpA1MYjHAGM39wB6niNWm
         u/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538491; x=1795143291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
        b=zRjMG9u+nQaTBLqTFId8WTyapshkdnKyHxIB4BHmH+bMCcgdo3LNDzNc5z8A+88XjX
         V/Pnmt9OTncwC9J1TFE6m+h1Ua+QLENAWjAiIAODN5P+APobL8F2ADjM2b3wu1zQQ+qp
         2R8Se+93prAbzk3pS7OAtqnwaZpGUxDFzXAb8sUJ0Naj3o78+a6ju9AAiCJBsdO1b7D2
         saRx+3Av3I1Dlxbt1dKcQAZNUJFaGetK9XTe0VLETLFcmesSujiXRJjYmF+Unwdb2Uuv
         f9V4N5bZm7xvjjr+EYMq2A01UVxbdat9NofpZUbCGqK8aQ/Kji1SFvE9daEpSvqYxy4m
         S36w==
X-Forwarded-Encrypted: i=1; AL+hErHh8Qe/RKJ6HRQcvQVxQ3o27ISXzqU3wmoIag5wyY5kvje7DE7lRsP5Ja89gaytGd0wM6N0oUOspXiqRv+G@vger.kernel.org
X-Gm-Message-State: APuU4Z8FLZ8RXV/lNaRROtvv/B3gmUTNJ8HU/DO73b/eDl1KwNvjmQJE
	ymyMcN8cp5UPBxYTwkOWbitRkeTgWi0j4AHfWdUPRc4O0rbWPhzGRV4YSDz5JwBKdLmIyR4BZ8y
	sJM1O5s5aDp+HuiRIKDblBTpPNB5itTO9jt1KxNhux4jeT/sqqrLFSDtzMt53ISGgJmCy
X-Gm-Gg: AYBFou3XbV/nypMbXxPzAniw2n3nCkKahe7f6EA8nUz3L2pOFe8t9TBqVn/P5nR8j5Y
	hlPJhe63AQznAvvWdAAb8Qq3e/VqFKIApgDW7WRenEFoIN1Mbgdd3I1lut5YoI8gyK1jS3S+9JC
	e2+wpdYWjZuaG1oJVMzS36MlIOH9kKXlFJsqhU3oeaqe6CfRhjIGsnzWtEXyBa5pIdDEE1+imVu
	d7149IlPqAyMJ9zpfO0ekLL/Dl+UUz+et1OySsS9Cmg1ofR7lERNBHTIZA7Wih9hA9VxqITfwYa
	nNwlZKjQ6hrrtuiEZwlVSVCRdvNr+v1BQMEgDLJEVyv5ZRx27R0KhZfjpi2+V0TFQ+KhokL1uMp
	sam3aCNTBdufKCis5n4jqq8/NQIyxLNH4u6e25kaRImE6WbEUl1l0cNlzcLaXhIxOjhe5foFOfE
	XKsFt9V6EK/xTuBqwCpfOS4w==
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr3939814eec.11.1794538491192;
        Thu, 12 Nov 2026 18:54:51 -0800 (PST)
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr3939768eec.11.1794538490435;
        Thu, 12 Nov 2026 18:54:50 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm3910027eec.25.2026.11.12.18.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:54:50 -0800 (PST)
Date: Thu, 12 Nov 2026 18:54:48 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Message-ID: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXxBeHD/qsiW94
 r+rsy6je28gRERk9OMsfqjq7S+QLH7KFdXOkXfutnYVCqhyHkAiR6qM/3UsH6QTpASsPr+mvb5E
 flffA3UxFeOR0BertFrbsWz6XnipZhc=
X-Proofpoint-GUID: oZ7j5w5X3_-AZ8LD3_UsuHo9dpO46pKo
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af67bfc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=76iuuaO-dfIhFSRFSN0A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX3JvnRD93QCEm
 02qI0RHVIpTlOBOGTyL5evlALPbIgowGw6b0Vi+MNtB2CoI5IEb/NHbK3V1OfK85IXHv8b7cdRp
 xavhqXFanw3NM8hE7lAB5ZvfVHYixueSIZwhVhQKSI8NVmilBoPo18oCzsfPUmuIMVgJuUdUixK
 bayzkPEbf93GIteiWRRsc6tcP1ej3p8siugkZyCHR4VHndkLBZ3Q2j66k6mhm4WabhhYA9380YT
 zRDn+5+0aHZ2mLV4pfrm0OQYP8Xw4IkLQMGc7WoykkoC9S4zsJB0EQb09ghrb6T38SR6tEKTd+d
 ZccLy98wK7zMV11t3fs51O78sqUK3LmkitGwBWVkvCiB1Et4zirV6U+Ra/LCWYHD7H7fUg3i9+Z
 xQP95VbgbodF5qU1cuIXq6eejlnLhkCsndwz2la2GP81Bp/kKK5qzREWChJmdj/WDKTk8w2FxSc
 c0zVC5JaKHZrf6/vcPw==
X-Proofpoint-ORIG-GUID: oZ7j5w5X3_-AZ8LD3_UsuHo9dpO46pKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

On 26-11-03 22:50:54, Joonhoe Kim wrote:
> With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
> USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
> PCS powered down. The USB 2.0 pair still works. Such monitors often
> have a USB 2.0 hub. But the dwc3 controller still depends on the USB3
> PIPE clock. On Kaanapali the next xHCI reset in this state times out
> ("Host halt failed, -110"). USB stays lost until the cable is replugged.
> Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
> common") keeps the pipe clock branch enabled. That is not enough here.
> 
> This series lets the controller be a Type-C mode switch next to the PHY
> and moves it to the UTMI clock, the way "qcom,select-utmi-as-pipe-clk"
> does statically, before the PHY switches to DP-only mode.

Joonhoe, thanks for adding this generic features for Qcom platforms, it
is not only for Kaanapali, but also for platforms which have USB/DP combo
PHY.

We did an internal discussion for this use case, we may prefer the solution
that let the PHY notify the controller this PHY lane is going to change from
USB to DP (4lane) event, it could keep driver independent with dts for this
feature.

We more prefer an general solution like [1], but it seems PHY maintainer Vinod
prefers private interface between controller and PHY [2].

[1]: https://lore.kernel.org/all/20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com/
[2]: https://lore.kernel.org/all/avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com/

Peter

> 
> On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
> DisplayPort series [1]; patch 3 is the controller side for the same
> SoC. Other SoCs whose PHY is already a mode switch (e.g. SM8650,
> SM8750) may need the same property on their controller node (not
> tested).
> 
> Related fixes sent separately: "phy: qcom: qmp-combo: Leave the USB PCS
> alone in DP-only mode" (suspend in DP-only mode) [2] and "usb: typec:
> mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes" (boards with
> an FSA4480 on the USB 2.0 pair) [3].
> 
> Patch 2 conflicts with Vladyslav Tymoshchuk's "usb: dwc3: qcom: Defer
> VBUS override update during system suspend" [4] in
> dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Both add a lock
> there. Like [4], the mux callback defers the QSCRATCH write while the
> glue is suspended for system sleep. On top of [4] the two locks can
> become one.
> 
> Patches 1-2 are for the USB tree. Patch 3 must not be applied before
> patch 2: with "mode-switch" on the controller and no mux registered by
> dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.
> 
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
> backported to v7.3, plus [2] and [3]. A USB-C monitor ran over 4-lane
> HBR3. Its USB 2.0 hub worked after 10 replugs and after a plug-in during
> s2idle. In the s2idle case the mux state came after resume, so the
> deferred clock switch was not exercised. With the monitor
> unplugged, a USB 3 stick enumerated at SuperSpeed. Quick replugs (under
> a second) worked 9 times out of 10. The other time no PD contract was
> made, so no alternate mode was entered.
> 
> Changes in v2:
> - Patch 1: use the common usb-switch schema
> - Patch 2: switch back to the PIPE clock in the mux callback, when a
>   USB state follows the safe state. v1 waited for the next role change,
>   which can come before the mux state (Sashiko)
> - Patch 2: keep the UTMI clock on a change of pin assignment while
>   DisplayPort is active, as the PHY keeps its mode then
> - Patch 2: while the glue is suspended for system sleep, only record
>   the mux state and select the clock on resume
> - Patch 2: depend on TYPEC || TYPEC=n. Skip the mux without
>   CONFIG_TYPEC. The arm64 defconfig has USB_DWC3_QCOM=y and TYPEC=m,
>   which failed to link (Sashiko). It now builds the glue as a module
> - Patch 2: no change to the role notifier
> - Patch 3: note the dependency on [1] for the PHY's "mode-switch"
> - Patch 3: add Reviewed-by from Abel
> - Link to v1: https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/
> [3] https://lore.kernel.org/all/20261022165143.1327-1-26rote@gmail.com/
> [4] https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/
> 
> Joonhoe Kim (3):
>   dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
>   usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
>     modes
>   arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode
>     switch
> 
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   1 +
>  drivers/usb/dwc3/Kconfig                      |   1 +
>  drivers/usb/dwc3/dwc3-qcom.c                  | 103 +++++++++++++++---
>  4 files changed, 95 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
