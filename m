Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584893;
	b=DgUTJtyKiHWvHiRtrwARPEV+6FJ+8u7SJ939+m2ZtGXGYbQjXBkpjE/oZzpF59p9dDZF
	 W1JTgSxuffGM3uouRU2AyGugb9bkYeWeW0b27q2abp5uRvRcPP8hX2HLz7ZTeem4447FI
	 9tilk2XIQvgylL5IOB+gzXLyLsvH3X+kAkc0yGW6fg3HYlWesmhPi7cDVAvtMLq2/NtAd
	 HuhvZsUYcSLq5yb/8mQnMaPOgZ0j5ejFjGgEsHph6tRcEENvS4Vu8TQm/OKU7mO24l9wl
	 xwtbtXR1opEg5oME2c5SYA9+YDwO7aTSWaA4s8OlQVswekvGTbwZY/8+kwgI1shMEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=;
	b=IEFMp1d75xPdZI+WrdfGAZHqCdcGpKq8QhcrN8kvX+R5U9cJp8BBKdTjg2aTK2mjxdHx
	 /LeyUOBF2UPxFhLQoZyBOHgsxaKG+x0UWQ2dqMkrtayWhMOQqHJcWpCIejqNHDJhjnTYb
	 2/mQJifuwKlFQIq7Gi0XjiJZ5UWev2Tksqv33v3bZh/9K9KsFBg8mIph2pkwwwVngjARH
	 siH67xnP4LZZem4vln5Z/mbcM0vt8oCCP4N3xRDhFg231eUUl6Mcvd5MGABXSjHfmneQf
	 ymJ9EqtYp5GaetMO6lBAgNW6sUADxvchSnZogk5irUgUHR47cieo7f3SR3o1QiBquGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CTICO5AK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H8uMcr5f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E3606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 144E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CTICO5AK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H8uMcr5f
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgJdb184041
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=; b=CTICO5AKc1/23NHj
	vRylIXMNZ2hJb7CG+7eP3MPlqN/vX2eOrIjmVYJZJe0/AV+6BWGUVaaV1qOy5Gn6
	P7hcaUCeFrXgZHOH1YJesgPwhD6B14b5vSMJbJeBoxY8tpXWTRRgMTGXUTkf37+u
	vgCRKGTFOZnDADPkmxN0qed4QtX7/9jtMGjVC17A/umLYGzZbYHVoAEhfWCCAYur
	VTTbzOejGz85bF4XCql73A0isRJEuri4JvY7Eaf6s+blmoUf9iUBC9cRSF7ibOfY
	Mx0ukPqGSQAWMjO1k1UaEGG1iDYe4npfQDzvUta9Ebg+/23F0n41M1kiD/TxVddW
	tc7rKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9husw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:14:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so19307685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584891; x=1793189691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=;
        b=H8uMcr5ftPh1U27LaZPyXlMpj2hLGenVMSQ4tWzNBdE3AqwMiaZjVsIlyKY5eIOVR2
         5GzE5LdQddXD8jxPVR0TeSCliESdqSnKtskgv7EjSHNBGI7slPiDp7X+4AmI6qCe/9Xr
         b32DdGopt1BQyxMIwNi255rLNRtE9n9raGmjIwuYN19UXaomyo/6FyPosd/sEphAxAC7
         9dodSnyKGu8/G6sS5QGGMvqSYOpGWPLaXUx6p6GFsO4zKnr9xLr2PEA07nFw4fECuPCf
         6ElD66gB3Fx/A2p0fasI9sWWisc/W+7VHeawUGU9buUl1T8aFk8OzYmOMmKre+OyY/df
         X8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584891; x=1793189691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=;
        b=bhJPICZSBvSg1wfUxkzbWswff3+1vJqQR1WPptwCc7Ko0xmdlDr0uGoR7Qpyp2kFJO
         KSZt6If+BDwdq8rVD8Hg2IsZ/Pw2MOAfgTCF4bJ1DgtYcDlLaHlHnC04G5k4F7CDZLIO
         ki4loaftZexlJc6zym+lMto0oT4KHy+KH/S+nROdSu+ORbiz8vWJbnX1jqt0QMnDi8kO
         CipOBwsDu5FmjKYXbTOm+Uudv8oTnrMxq+8KhTC6DQ4HMy5M77o0PTc8Bdh0SHgfAX0D
         cY5enniT5aqkxVRIBfJ41opC64GR+LHZyet+6gy0z2KZPvNRuoF7/xFcoHIE7vIBOhj8
         7iRA==
X-Forwarded-Encrypted: i=1; AKwUvBx6ygFRkB5cUGK41wenWIupRLlRW5VT4PHiWqhoYOMcomC0Wlq0vzgx7pM+7M9L6YqnqBjz2aBn9WqRg8lP@vger.kernel.org
X-Gm-Message-State: AFq9FYIfKQ+zLXLACEFsA3uIZ7Dxh/vi3dkFCK1rSrQt2XKkH51Hrto0
	7Aww4sf92QvGH9U9JlCoqk1W1tTbpGosAKG8yRJeGUu+beIr0g7yIimgijt5gohD0v6bMPFFXnZ
	er3/D9EoO4LLy31fjUw8KqmmcKlhzseftctw4UDnTo1jkuTJTgv+4NgVQLn49dKbMECRD
X-Gm-Gg: AYBFou2DWtM5hUglHPbZrblmlW456YUsASIac14LGihgtQ9L4B/BP1psIdvQqoXCU5W
	RlMH+uqOHd8DnS/vrX/tDj+rH+HVA4TVIgSKYphIxr5LCE6bcOB0nqbA5akFqaXyPvt9KyPXLqX
	e77dLaX/ZsMV0WNVJVtuMzCt1DnpzRp71Ker3/PfL8bgOl3EYksJzEhGdPMGmHyoJvjI03haex+
	6UifD7PA9kTtmPdoyNOnnIXjt6tNBnzOh6OBlzwDGo12PCOlYCB7VdDfveufNLoxRLBYDOCtsDx
	QLr1XVdpMDPABeDVzBf/3+csYERQGzMTqPUmTJXuPGn1ILsXEDEwnZuzBnnkJ/1Hl0KuQsSc1//
	Q4PrMqyqLfeVEL7iPJNSjTg==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr440953885a.3.1792584890849;
        Wed, 21 Oct 2026 05:14:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr440949885a.3.1792584890411;
        Wed, 21 Oct 2026 05:14:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db05esm796300a12.10.2026.10.21.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:14:49 -0700 (PDT)
Message-ID: <5cee2997-1192-44dd-95f7-b495bd360b9a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:14:47 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: don't disable display PLLs in
 the unused-clock sweep
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: abelvesa@kernel.org, andersson@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, quic_rjendra@quicinc.com, sboyd@kernel.org
References: <801e79b4-f45c-4f23-8b8d-5ac301d77e9d@oss.qualcomm.com>
 <20261003140257.3790-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003140257.3790-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8acbb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=277PlhdCLaeriRsjFVwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX7TQmxsQ9rhpB
 WVbAxWDFAGmKM7BJowJu95VFwneysaVfG0q+3X+PKVGIXm1yfW1Uja2TUJy+5uFre4i6Pi48mrT
 Nho1ZDAgZH2y6p90PML229Iz7SOP3VU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX0z/tQNH09bcH
 0kS+hcNbfHL4xPL3/my1l2Dgg+xaD9iNJlLsTdY5NqYz/C+RTUEHtorrs4N1eF1GiJRLboIHhej
 U3XQ9vewPmU57pGdGPf/aT0gaH/9GKGODZkDWKUFznX22GCjz0LWOTMM6bFq1hG0tUModU9z3cK
 YGd6/T3BNbUF2HTAYBUdqPFsB9VY485TPR2iGk1eYwGwAUc/oj42hb18hd15Go6EELIJ2uvP81D
 Sog0qo3oNYX8zjqK0xLOeqdrQgqKcNU13EzV4lJY8CuMtaYAXwa4VcLd9JR1waz0XI9DWfoMbXL
 VC1oaovHWbe0Uny+JnVxLN/pvnN3MroGkc7Cnwt2BUXJ6ChORQbHM//MGd3o54x46XYI0hS8OVV
 lR4JcxA41o1Fz0O8DLGmFeiMtx4sLAoyhF24zGYU4X51tMCvImIY0SdPHA8PYuDjOZ/PZHfBxJ7
 OcEjYv9H2uYY8bSKU7Q==
X-Proofpoint-GUID: wyILstojU6CNKgAqaiXgWW4cySHYs7Nl
X-Proofpoint-ORIG-GUID: wyILstojU6CNKgAqaiXgWW4cySHYs7Nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 10/3/26 4:02 PM, Jianfeng Liu wrote:
> Hi Konrad,
> 
> Thanks for the pointer! I gave Brian's series [1] a shot on a
> 7.3-rc4 based tree with my pll0 patch reverted (the trivial
> conflict in the pmdomain hunk resolved by hand), and on this
> platform it does not solve the issue - it actually makes things
> worse.
> 
> With the series applied, the unused-clock sweeps for the display
> providers fire at 1.4-1.5s, which lands *inside* the display
> bring-up sequence instead of before it:
> 
>     [    1.381597] tcsrcc-x1e80100 1fc0000.clock-controller: clk: Disabling unused clocks
>     [    1.468038] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
>     [    1.468194] dispcc-x1e80100 af00000.clock-controller: clk: Disabling unused clocks
>     [    1.807670] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
>     [    1.808271] msm_dpu ae01000.display-controller: bound aea0000.displayport-controller (ops msm_dp_display_comp_ops [msm])
>     [    1.810010] msm_dpu ae01000.display-controller: bound ae9a000.displayport-controller (ops msm_dp_display_comp_ops [msm])
>     [    1.860460] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0x90020000
>     [    2.002334] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb frame buffer device
> 
> The reason is that the mdss device's probe returns early; the
> actual display bring-up happens later through the component
> framework (controllers binding at 1.8s, first modeset after
> that). The driver core only sees "probed", so sync_state fires
> before any of the display clocks have been claimed:

Oh hmm.. perhaps fw_devlink doesn't handle that case..
+Dmitry do you think we can make it?

Konrad

> 
>   - tcsrcc's sweep at 1.381s disables tcsr_edp_clkref_en while
>     the eDP PHY is still mid-probe (the PHY is about to claim it
>     as its "ref" clock)
>   - the eDP PHY provider's own sweep at 1.468s disables its
>     link/pixel output clocks
>   - dispcc's sweep at 1.468s disables all of
>     disp_cc_mdss_dptx3_{aux,link,pixel0}*, whose consumer (the
>     DP controller) only binds at 1.8s
>   - disp_cc_pll0 is still swept at 1.468s, so the reset-relock
>     lottery from my patch's commit message remains as well
> 
> The outcome is again a ~50% per-boot lottery, just with a
> different and harsher failure mode. In 2 out of 4 boots the eDP
> panel came up broken: the top third of the screen shows fine
> green/black striping and the lower two thirds stay black. On
> the broken boots the final clk_summary shows the whole eDP link
> clock chain disabled and unclaimed (disp_cc_mdss_dptx3_{aux,
> link,pixel0}*, tcsr_edp_clkref_en, and even the eDP PHY's own
> link/vco_div clocks), i.e. the bring-up failed right where the
> sweeps had just fired. On the good boots the same clocks are all
> claimed and enabled. The per-boot variable is simply whether the
> sweeps at 1.38-1.47s happen to land before or after the DP
> controller and the PHY claim their clocks.
> 
> So for this class of problems - firmware handover state, where
> the hardware consumes clocks that the CCF does not know about
> yet, and whose drivers enable them later than probe() - sync_state
> trades the old race for a new one: the trigger ("all consumers
> probed") still precedes the moment the clocks actually get
> enabled, and the decision (enable_count == 0) still cannot see
> the firmware-provided state. The original relock lottery remains
> as well, since disp_cc_pll0 is still swept at 1.468s, before
> mdp_clk is first enabled at ~1.86s.
> 
> I do think the series is valuable for the module / late-probe
> cases it targets, and I'm happy to help testing it further. But
> the pll0 fix still seems needed, not least because it can be
> backported to stable branches while the sync_state work lands.
> 
> Full dmesg and clk_summary captures from both the good and broken
> boots are available on request.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> 
> Jianfeng
