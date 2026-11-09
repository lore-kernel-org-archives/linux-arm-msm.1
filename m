Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207158;
	b=HJOdk0XgWCsf/kd18qS3Oa2nhcsm+fdXrNBCROaXaaeHumevJRp0iTjGPQymIJXqCpLh
	 1i1Xg6oRe8iMJp1jiG3lZbxJXY4rEO8jq60uCqCqUXsz/uSGBUo+yDFLbsvnP1bmnDns/
	 hovgf08MA5KIPTjJ/9f4gN5wpi9SBTEb6TK0mOULJof5nkx+nE5sHl1op48O9+k3DIScf
	 EatsWPDlWOpoT+5dxQHAKZBW/SGqDOYawo+1wf9tUcpr+kIY4kYadxcrshst0YBrr37rg
	 6LCdf6pdFsTMHAw25UjWbuep+Xhy/4lZxohZNj3/ulMuPMPg/huIAJYBQuNma/VFMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
	b=GKIZ+uF1Vg2Cjcw31ClZ51IEwvNqMuAS5fswdT6dlc84iGmq/cLJPtj134PlBxoQCzpH
	 oBf312cdZNOagSV0YeIFlu0msaUE2UBjzdUGuvM/xfX+q5XrjS2jZ5PM3CP8uujqnSf4E
	 pW1Xhc3ec8ATQhOCaoNVZdP2gh9+4S27RRyIiBvm2eUPxDDctM1foKXUfjzBCq/FUslR0
	 ShRGFYfEaOMU0Y4gjOFfnmLwiQS9WvRaq7qfpMzOIqmS0l1qQb+5rXAk5KHalCu55YoYJ
	 F6TbLktNPrEjXLGzkMB4iSYEQvzG8gHAaCHrk3gcuGpLKmFncQ8gAE41sRG8j8Jjf4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV6BVpdz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1A4606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 06:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F1A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV6BVpdz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wUN2668052
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 06:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pYBX0T5CKcwvZAIN9tNQTOFk
	9tmHNlr1/FpalyNCLYA=; b=gINNI1pHW9CSMWKrDmmWyRmeTudBSCkqi6vz95iH
	CRika5aaeka7jG5OOoGFPXtdQFmIcC5vYetU2L4Aj8gwCYWVkt9r3QWMlza+b4mn
	xUJcHJxK4om9TzDnULvhndId7yWE50tfZo0famGN0tZUQIyjqe82BHN9rXW5Epd3
	0XlFslXaen/RANdzKp2kcaj7oo3fjemoQj+aNXgvUGItUmSBokbB6+za/REnINHD
	npfpBU9CW212d4OC3H65KSYhZmFlAsFr24dK3dwNpU4vGTgE6aBVBS1ixrmGwZqn
	RKEugSn4HljBltNWyJKO/fMQUqSh0FPMrO0j7yHCh2P9+g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99mwct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:52:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so703950eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794207156; x=1794811956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=YV6BVpdzL0JyzulYm7zHFxWlCRmqRXo/fpz2ShEk9FF6LFYppayzZpa7NU0YTxX0Qg
         Zy9yCwk+rJulKxoeX++JUpp2YXXehiW+NJ29xgI30dbyj761PgdxbC3oID0EJkgUPXK+
         ITiZ2HyuAOQNNZ9e1bUzIW37OKuCyfmFk5V6cbQteNWgHdBnVSXrt/lJDVWyqqdbZ2Dh
         VJB7wek9yr7/yCxKr8zjUV3aeZSj5nIJLlhydAOA/gsey32e+Y9uYmNOvBjOWEsnKRzi
         tH8nbrkkxoboRWCNkcONZgBF1h3v1vkXdqyCerjI/nvZ/dBCAQflCaVAANRWkduUDx6/
         inUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207156; x=1794811956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=uHcvoMKxlmmGD73Ri63T4iJ8U4ts5mluGF0p4MaXlzj9VYJjZ1QGmDcVxbJIMBspIi
         OLefoOXv8vNSjaMVeXojIUrv6as7h/8JUx1zY+aXT+9juyOrFJkUwtxd8mg4pfyYOVv5
         diYOiDW55DtYNKkWiW2rBlyu8T2yZZuxzizUjUfGRL3utJNUKVc7nyiUE3OJ6YsG3rB7
         ALb6HvZg/DzLdrO10Q98GcSW9LIeOXHZkATvMFKy7DlSaRHbSyllzwfM9UJJ48/eHzof
         GZv83sfOmL1KotRe5xXcyow4g51V16OjBddVHsvVvvQS2RVjBg6gDmOiPzvSaKOorVYD
         ecZg==
X-Forwarded-Encrypted: i=1; AL+hErGdY7NC4LNNFRyhV2rm+am1vtB/P7nOjxxS6X3ojt68C4JfecJsO/d9Q1uIVpYvcCTX3/LbfZeZAGuHr4z3@vger.kernel.org
X-Gm-Message-State: APuU4Z9XiR+02afylYM/K52m9gOv9L3D0UJP2RfVf1z9AZaZmeI2jaWx
	wf7UuBGpGJAfbOU9TD483UlFtpam8Kx1Ej09o2thlyq8rkFK3QgOMcM+QrPPUXI4XqamVmZ9gK3
	fIV6r/hMn+Nwjd055RwUxoGzjvK7yGl7CGKmyXpv6JXtT6MZ74Sj+SyMW4LQQprexZ68Y
X-Gm-Gg: AYBFou2x8+UeSty5i38KJyL8Huyk1F/77GboDYv5UHeMQm4A3ytQvU8daTG0ryDs+C5
	iVfVOmHJXR27u5uI0IGLhB95OXm6purd8OukFFEz5jyAqRURnDaDUf9Y8QxKepYHdt4b8rS/GS3
	RJdjT1tW9SbaCP/TKrpclYCMm2KU9R83VmlGL7Zcs1+2vsUvsn6BV5uF9d3XZVTPtUQMCtcMBdz
	bTkLtWR+yatCc3q2q/HfMwX2uak7d5KwksWZEf8SIoCej6A8pe1uH5FkjLRptyBUPxmF9pvK+oN
	sWj+fugf8JiupjOov72mpFj2HXhX8mBmAcXapwtTWpo8INa1V8Ve2tcjEYV2Jq8u3FIBWmgrBpI
	U331XV2uoinfYAhfu0142iW3HtAycgXXZYqDfwvaMLSxRwEv73vEk1+pOX0S6beXBEcc7e63mp3
	ApxBI=
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850922eec.18.1794207155678;
        Sun, 08 Nov 2026 22:52:35 -0800 (PST)
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850874eec.18.1794207154898;
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm10502754eec.17.2026.11.08.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Date: Mon, 9 Nov 2026 12:22:27 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Message-ID: <avFtq61Hwzjk2f7n@hu-anantiwa-hyd.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
 <au_BvH0rEKpgTpc3@zenbook>
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
In-Reply-To: <au_BvH0rEKpgTpc3@zenbook>
X-Proofpoint-ORIG-GUID: Ly_OyFpskrusBqR94dYsdzohgYsHSPbK
X-Proofpoint-GUID: Ly_OyFpskrusBqR94dYsdzohgYsHSPbK
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af16db4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=YaO7I9Z_RSUIAtd64XYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX4vTUXm0Ujc9u
 s2fxF/rP2jUWubPfg75iz3e8KW3sAaUiR3pex4EgqMiJnqHkvCGvEjTy+qhhJ1iDPtKpvvXu3Iy
 8ckZMmwdK3Qi/rGGt4MW0F7Jo+5hpLPeJ74J7jjLiDi7KDdDQ/4pxHRbsc9wz3ewlF/dqZ9ndHY
 AejO0giKTFq3dKBL8iy6LOemaegGJgNy7B7IPFWDpBkMQyL+siyvxSdfdyuz9G/+NCGyvFOX+KM
 odDqmZfQ5DOW4Vl+yvyu/p/FyIYHEQvxKvltrdX6RH/3zbt9qU/v12HjaKBZ792llQE5xIG0HbT
 NkoCj7zzgd0Jk7nSVwuPUOT90DYpKCirGJNRCFbXqfL/LfQqDgav3PJmeFdp2N3yw7M92BTzaIP
 vwzFUZB6PpiFe9Dp9Fy+CDdKB2pLwMBgSFnJH3WQVXUMwmz9tK9sQ8e/iQ/QELtjFAxzj9JrgWE
 5RFaPVLr7afQDZQKaig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX+hxM+CmSAYHu
 vc5/0u98Hzkmu84XocZ3A03N9R/jmH89vS8VJIM6YVr/znEPsSL2TqNp4o6NvWT+mjmgdsLy5dK
 ZXs8qJCACGX/8dOoEtzBZjhVvJVailE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090027

On Sat, Nov 07, 2026 at 06:29:41PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 02, 2026 at 01:01:30PM +0530, anand.tiwari@oss.qualcomm.com wrote:
> > Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
> > The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
> > connector, through a MUX which can be selected by a hardware DIP
> > switch. There are multiple daughter cards designed that can be
> > connected to this B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> >   - DSI-to-HDMI using the LT9611UXD daughter card
> > 
> > Below overlay DTs are added for additional display configurations:
> >   - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
> >     daughter card
> >   - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
> >     panel with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
> >     with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
> >     Lyra with LVDS daughter card
> > 
> > These overlays are applied on top of the corresponding base board
> > DTBs.
> > Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/
> > 
> > Dependencies:
> > https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
> 
> This was rejected 3 weeks ago, so sending this series wasted both your
> and my time.
> 
> Regards,
> Bjorn

Thanks Bjorn for letting me know. I missed that the dependency had been 
rejected. I will resend this series after acceptance of dependencies

> 
> > https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
> > https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
> > 
> > DT bindings:
> > https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/
> > 
> > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Added GP CLK Frequency Dependencies
> > - Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
> > to ascending GPIO number.
> > - Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fold in the hdmi_connector port remote-endpoint indentation fix.
> > - Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
> >   patch; the dt-bindings dependency is now declared as a series
> >   prerequisite (see base-commit/prerequisite info below).
> > - Drop default-on from the DLC0697 backlight node.
> > - Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
> >   panel overlay to fix a dtbs_check "too short" binding failure.
> > - Reword the PWM_CLK defconfig commit message to name Qualcomm as
> >   the SoC vendor.
> > - Remove a stray blank line and non-ASCII characters from the AUO
> >   LVDS panel overlay.
> > - Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com
> > 
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Abel Vesa <abelvesa@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Anand Tiwari (2):
> >       arm64: defconfig: Enable PWM_CLK for backlight PWM support
> >       arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> > 
> > Mohit Dsor (1):
> >       arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> > 
> > Shashank Maurya (3):
> >       arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
> >  .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
> >  .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
> >  .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
> >  .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
> >  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
> >  arch/arm64/configs/defconfig                       |   1 +
> >  7 files changed, 493 insertions(+)
> > ---
> > base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
> > change-id: 20261019-lyra-display-upstream-post-24656268a902
> > prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
> > prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
> > prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
> > prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
> > prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
> > prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
> > prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
> > prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
> > prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061
> > 
> > Best regards,
> > --  
> > Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > 
