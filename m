Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C846D569
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656580; cv=none; b=YaM1KrmXvO2xOK5NEuxENoVk2NxpzEUqtvNp+Q3r8jRx5OXlXkR/wmAC0Au3/9slvf7aquQkfe2cNFstvJAvAyGe3DZqToBYSoQ3CyJD7fL1jEKFSJxGTiBVzq0IZUPN7Dalmr52JXGsIrwSV/IjUOFyN0ABk5aPNy34vNoz06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656580; c=relaxed/simple;
	bh=nAYdB1BXpU18ExENVnsjLrICrFCWoYpEKbTg0eDMBp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsMcWLjHX4As652Ow6UwM5hiyB0hz6gtyVWkEdJ6pSrbYvtATajORNfxf+Wj2kjbVTN5Wl2BOGTJasGo0RPkWhlX3QqChI/wiz6Pf4CyUqM/52lKc0bFsYgoapSJ11eVllu56g03VBWTAPPKz0Gj4/oIYFI+OLubT3rRw7uhL2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPjRcGln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TgsVtPbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPjRcGln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TgsVtPbL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2V9H2548700
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uVfHG4Z6VlHbFGnD1uElHp/y
	AsA55AKlMuQsS+gV6dg=; b=dPjRcGlnb55AYDNgk7ShwyZR5b/k6sBWSu+IQMxP
	fdZ8wjguW41y+F9zzM77ZeqMVxz4xgLtjTr1LEkhssr7rj6Uc2ZHcoD3rAjcP4yw
	jLQyRv6RRigXDvkxsLPn5OpnUKjQel6Uhkd7MqPhCEL9DTIsxAerKHf7GMngrY8d
	+4mOgqQTxesTRX18cBXtmSedsp5EoXRA4MPbvFEiZooZJL5kZcEbHT9cCeZchkiv
	y+DriIvYPknU6npQ6N6GkmTk4rYBHlEfBpD/4GkssR9yDVE07cZETy016/spa0Jg
	v1Lzf20kwfOL8vmPi27bqPqrzIzqEbn2x0hjzE5aqqzpDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3j86p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:56:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso122509991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656577; x=1785261377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uVfHG4Z6VlHbFGnD1uElHp/yAsA55AKlMuQsS+gV6dg=;
        b=TgsVtPbLRsvkqyqiLLxD6QkGLSzXWYxaAX9DZkBUWfh5e+ccsAnSmIaeErc8zd8voJ
         j2V0nZn7XGVRMj11ekRMJpQ5d0CoOFMMtoVf69WzM/6k7Dvb8NVgYTbBupLe6RLGAWsq
         OVhXG6lDZYJCymorsb1+QKH7t/t3WOtNavMp7HbX/i0c+q5KomBhCQzTQzoiZUmEqff9
         Hoayho70SPzms2IYDNYgjAGOm5JnhuOlrPfAHBP2cVRdqvADrYUwyxTjqrTicXZagwts
         22uMK9MpZM5UeqR8irFFf99MfTTcdkntsuvbpI03F/MYDOfUNUyKCUpF0NOYFugaK+nP
         CQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656577; x=1785261377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVfHG4Z6VlHbFGnD1uElHp/yAsA55AKlMuQsS+gV6dg=;
        b=XY6NxaU5C6y1LzLzIUDVIGTyA884WNYHN1AhEdhT3mm1BTYMQ9HyP4cqHZvrhP9lKH
         MlHBZi4/TAiWQZrYO/uSZ6hPEK/NXX9x1mA7CoDE3sjnLt8+KIV432Zkq1rgdZGtEuhW
         +hOTBEZgmuLnIbmc4j8rbQyottyHp6DSUA1v/YQkNYds9mfwWn/DP7bcubmJzVz7WHHB
         CxeoJaaNi7doAGe0dRxurvQz5yEie9qmt+Tv1XAdPMOjES19Vvse8/voh+zY+jXmh/Qo
         0fhXE8FwsEMJ5sp88sTqTUT6LXja7BiFXPUjLnJP/OEbnnWghMY5QjWQ9N5LBFIvJnY1
         M06w==
X-Forwarded-Encrypted: i=1; AHgh+Rodeqf05zqvIRg+MKa5IyPW1cfTpc375qS+lkfV717U97f3u99Ne2hlLouEvGAGCNZFwAdC7XiLaMSxG5q8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iQnitQEDV5GYS5mPI2UpKax7Ws7QuU77Eok1U1Vw7pcvp5cT
	xs0OIvR9QJrVsR/oB0ixkqzYxoFvytPni1ekR08CjyxddhkWQIC4FcuwgKvOToQxT2ZRmRaIzCy
	E/LGuuoyMq+Fcf7h2SvqCOH/jyF64PqeO//Zz93RfeaaNiNCrRt9WFG6n4HynX6AZp1t1
X-Gm-Gg: AfdE7cnEL42jDZi05uqR5bcPgXXmzJpLxR2hAx0oDW58SCAnsw1PYpfLwIm1zoWZDnz
	/b4sG6q0kHmmAD8nNQ1e4tQOlNVXAnHVVF4KJ0JlD89SGP4DMGFffXqEtqD927Rj/+6fZt9EfRR
	dHIrTTJcYFEQC7FLPErhT3KYfz14rMIN8dQs4bmEEqk/f/eGgu/MicVEByfYoUySbF9oPIvDDPk
	Md92oJsFBT5V3bjBUiIS1dUsHGlxM0lFElF79rGKDIwAQPtlMtcgXgjeSpRHEibwaTbBT0lp6ux
	2s9C1ByxAUHC7OdxOkMzB6xKqh+Mmc5PzaRQHedsEDF/vq+KVcOJDvAXLXbi2Trf5ZYS9mf1QW1
	h/6uQODEMF2EhxtyxrpGiLiMCnG8CT/tQSVhczGn79kPkgt94TmctXMaI3IUNhhwmW7FhqPKttW
	dM2ohCuXT4XeOtpw==
X-Received: by 2002:a05:622a:2295:b0:517:b68a:8d84 with SMTP id d75a77b69052e-5213c8e0efemr188590711cf.56.1784656577028;
        Tue, 21 Jul 2026 10:56:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2295:b0:517:b68a:8d84 with SMTP id d75a77b69052e-5213c8e0efemr188590221cf.56.1784656576518;
        Tue, 21 Jul 2026 10:56:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e49195sm52580e87.70.2026.07.21.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:56:15 -0700 (PDT)
Date: Tue, 21 Jul 2026 20:56:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 0/5] usb: typec: ps883x: fixes for older Thunderbolt 4 /
 USB4 docks
Message-ID: <rmckncb6oimniwd6venptbzaidxh4v6ffhbkebztqcuxg67ixy@u3bi5tclfon7>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4OCBTYWx0ZWRfX/4kS5l7ntWsH
 Y0WKmjLXytsTAYkDm98vyjw6g3G9QG6nz+6+vhtZto7js1pcGsdPW0I+1KWiHZK4PzeMX/Wkl3O
 CwdiLUouFqtQk/NxbMYe8/yHxl0CWkPOn2G4pDXcRoovdYRxPM8COPdbuok7MvoSRXMvF0EjSsE
 +E661dzVu6ubcgRjAOxzoSSCarCnmeU3of0pjto+8NO7D4KnpCbr/4wQ7rfUfXy+iIAwqiZrJ5S
 JlDqtxGSSw6Rh3QHtw30Ycin06mMc1kHbf+YBwYQ8aMH7YeyHORGiZnPRuS8P/767F6sPYCLPpX
 6hh8G7LQb6o/IiK+4JAy622cIpSQmAowi2tq6aaNSN6sGW08P4CJSV9kxFdoqTFCdK/E8KorIcC
 yiVHVk9cV8DLDMHfRiIwSChrShlkzRT/WILEj4tBespZgePzFJgv0Ck18uC4R1xMMoQFbi8+m+s
 154RpMIuMQH3odYQ2+w==
X-Proofpoint-ORIG-GUID: PALPeDBxNfNq85SrF1Jr9wqob3rQF0TV
X-Proofpoint-GUID: PALPeDBxNfNq85SrF1Jr9wqob3rQF0TV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4OCBTYWx0ZWRfXxJdYg9qjAaH4
 DQCFIuQBmFII1Sro/11uc+nkfWnu8JPK2tL8KnYoPqICAf2N7TPawsktVMgRk+/3vpZtDRtdOsl
 aa/PyJZif3yvIShsBGwb2SIdBiN1Hxg=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fb2c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gxl3bz0cAAAA:8
 a=ub-gN-1gDvpdvdnh1gUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210188

On Sat, Jul 18, 2026 at 07:06:28PM +0200, Jens Glathe via B4 Relay wrote:
> On Qualcomm X1E80100 platforms (e.g. Lenovo ThinkPad T14s Gen 6)
> using the Parade PS883x retimer, connecting USB4-capable docks such
> as the Lenovo 40B0 via a regular Type-C cable (which forces the dock
> into Type-C fallback mode) often results in working USB but no
> DisplayPort output.

Just for my understanding, here you mean a Type-C cable with all 4 lanes
and the SBU lines?

> 
> This series addresses the issue with two main changes:
> 
> - Add a new optional DT property "parade,disable-usb4". When present,
>   the PS883x driver rejects USB4 mode (-EOPNOTSUPP). This forces the
>   Type-C stack to fall back to USB3 + DP Alt Mode, which works
>   reliably with the 40B0.
> 
> - Refactor DP altmode handling to also support the legacy
>   TYPEC_DP_STATE_F request (deprecated since DP Alt Mode 1.0b) sent by
>   the 40B0 and other docks (e.g. SSK SC220).
> 
> - Add a short delay after writing configuration registers, which
>   improves hotplug reliability.
> 
> This is a temporary workaround until full USB4 DP tunneling support is
> available in the X1E USB4 controller and qmp-combo PHY stack.
> 
> Note: The DT patch adds the new property to all currently upstream
> boards using the PS883x retimer (15 files). Happy to split it on v2
> if requested.
> 
> As an additional observation, the same dock with type-c cable works well
> on Thinkpad X13s, Thinkbook 16 G7 QOY, Ideapad 5 14Q8X9, but doesn't need
> the ps883x changes (naturally). 
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Jens Glathe (5):
>       dt-bindings: usb: parade,ps8830: Add parade,disable-usb4 property
>       usb: typec: ps883x: Return -EOPNOTSUPP for USB4 when parade,disable-usb4 is set
>       usb: typec: mux: ps883x: refactor DP altmode handling and support TYPEC_DP_STATE_F
>       usb: typec: mux: ps883x: add a delay after writing config regs
>       arm64: dts: qcom: x1: disable ps883x USB4 capability
> 
>  .../devicetree/bindings/usb/parade,ps8830.yaml     |  6 +++
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  4 ++
>  .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  2 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |  6 +++
>  arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  4 ++
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  4 ++
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  6 +++
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  4 ++
>  arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  2 +
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  4 ++
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  6 +++
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  4 ++
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  4 ++
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 +++
>  .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  2 +
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  4 ++
>  drivers/usb/typec/mux/ps883x.c                     | 47 +++++++++++++++-------
>  17 files changed, 100 insertions(+), 15 deletions(-)
> ---
> base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
> change-id: 20260718-ps883x-disable-usb4-19b0fc13b5ab
> 
> Best regards,
> -- 
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> 

-- 
With best wishes
Dmitry
