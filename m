Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD352CCC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990130; cv=none; b=sW4A7FtVe+EhZVCmWhHApM10+f2FKwLtQ31sHLPGHgx+ZJcwNVZsFe3ieHi/qTq9T0KJdMk2RKgDSh/9mMsexUJ4jXlSL9ZISehG6sis+IT30PQkeEqC6Z2OI3Tb1azn602Pk/pvR5LE+bhvvELocQG4a2I7SK48az7j0JzZ02w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990130; c=relaxed/simple;
	bh=D6DSOaHcvSq0t/JVKqdCTLF4wlLhu48+ANiIihPgiqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p303+6v3vv8oxCmwq9D8U+jexRm3Jra8/My6ZoMY0RdtEQfolp+s2bCamTR2K6D6ZGqGjYTbrWEtshoKB/CBrJ1OaSq66hhRsOq7OOjlnCTk0BLhy5lxJIRgSSTQABzHURogtpEos4y9z51O8xGQp1sZSev4YT3471s494KYGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nckwyOJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGk9oaV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nckwyOJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGk9oaV1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcWpZ3209365
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VLs9L3lY/vfTjFsZ1UhtwMXv
	kTr/rNAuLor1fwi1wLY=; b=nckwyOJbBmDHevt0K852xtIcZq5G1mXGcllTXYTb
	Cnq8fF516yDCg2QhzN1Tm9RP5trjnbR8SMDii6RzLOjqj47RIzIBBgygnjTA2Ls/
	xSf317dJIuaT0db/ktl7N0c/2gBz+D8LXAGkSKjTAyi/imVDiisK6L49gfZjegbO
	/z/Fux0vxeRJN7dU3gjghXRFFosrrZJFrLz3FmDeP8G6Zf3/PPmiEj4awPJSxr/N
	eJL9+8ZOYUP2Ly9iu56xGtKH5ybukDy52dBox6fS2OinwvnwVg5nQQCU9r1JS6Vz
	Z1xIXqXBHXqQNdE8a3YPN97145FjQQttzi72kWdCJ8fcnQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6c2df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:02:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d6d5ea0757so4975064e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791990123; x=1792594923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=gGk9oaV1yWhs0foOxVGP67EWJ2JKsHKB+ykZ/zGAVPj3d+4J6rUOidKPD/VdG0Xq+O
         e59NGjwSsueDOVyoJAIKhovALdErDVGRchh/anYgeo1z7IsLs4oUwS+hYdMZ8bJ/yk6R
         qDOkC060czmDePHpY+sSsggulVR1/UczdMeGLigMbG5RBpLFgujiW4/7H/hCI76Z/yqM
         hkM+U9Y9goln2ghBDmhmD2Qysxlc+pZC0h9zIvIXI/WFg/bApT0beElB3Vk5Goh5G6p6
         Wd2ZIqh3Bd6q0MpCumdL9N6cioyshP7SaL+btCYAjh0LdKJ0N+eZemdLkE+AMpC3wwPh
         4BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990123; x=1792594923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLs9L3lY/vfTjFsZ1UhtwMXvkTr/rNAuLor1fwi1wLY=;
        b=pCga35RyRCeL07SxhzxmjTUUuZpZ6PQMzKNvbkKGISiKFhdMTEiS5aqnQ62tEqHSl5
         mxMiIR8Z+Ve5dsafktoiaB6ZSm0TYxSCXZhMMxbLiR+loa0j5soudNqnOwbmIWZpOmE+
         mswOjDBQifco4iTtUeUPLMWUHlzNr7H+YNY2eHXF/ymk3rxwKu52SmlLZOr1VOa9Rsat
         n7LzSl6vMuVMGSTEbP6Mw3ynoZyKVjtxAEzdz3t5EBmcX2LCaDNFeJuHmHvFo/cfe4jz
         trvF5lEXixwTVlsSPQwnBT+zHl8d9spSsKlcfYnHXJ6SWZ/zBcuwR5v93YEXSoCzoug1
         eACg==
X-Forwarded-Encrypted: i=1; AKwUvBwH3FAb06IJfSHxaOS7oK0InKKdnKODuEsYQXUsoeK6qsjilL/QtarQbeERJ6r3zPq3oj+KknM+Zrwqg50J@vger.kernel.org
X-Gm-Message-State: AFq9FYL/ggRwG4feVOkO1kLuT8nFOsX/5eFZgtm4f40RV3oySJe1k8JK
	JR7mIK5sGvbsLKSNtrmwghqQv7Xjx80r8cpsMwmIX/E4jjYnOwBAiU2sL7eoS7OWagIrfF0Jywl
	2TBK/FvYpsSQVNfY0OviuXYvpRkdD6O4aZSeO+MTNdwIVE08+q3wpo5JgLBy7LD0WqyUd
X-Gm-Gg: AYBFou05ToEqkzI+fYNnkgZtkyrfIMq8F+7GdmbMYhaM40j38bpk1Eq63M/DVGsj+VS
	qLE5DNTuZByLs0IXtFtJTjn00Jdz+X2nQU/KIBLwxvqGcs9DwR/9CA490E9M55vYonIsq9F/cJc
	5IiFJMZoO/W4Qd0HyW5bp6cusjHCD0MgjyVwdoMIjuSgi/B+1R7EKe/19Oc/ehiLrG0JfNVH5bX
	KnD0ug0h0RYkmUtmtDBszDtqm5D7W9bxELFqR2uZiSmK9syCA4jQfBm3glwkjuBc5N/l0gZPV7e
	9mEKH5omOSRvVDR9r6E2gcAdCBA4FSQeAXQHji08Ct9Z8mrSt/lz0J2nycT6RU8abER929k2xBl
	45OHUIAkrl7YK2dE2At985wK8qEiX5rSGw9Bqw6Xs+B+FVDzC7/t1u6x/WCqebP6RNERrNiABG/
	XpS1Ho/HfdO96y
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417836e0c.17.1791990122777;
        Wed, 14 Oct 2026 08:02:02 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr5417712e0c.17.1791990121807;
        Wed, 14 Oct 2026 08:02:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da3ab7sm703310e87.83.2026.10.14.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:01:59 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:01:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C-jPNRZn6TKwEN8X1T8tHNu7RCaFyLTF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX3LXiYuPatAtW
 DbY1Jbuwe4ipuEyD94s0K+hvoDIDOX2zrkGUCFgVDdMyqMeuOh/AFRYErSsUvMo6N/Xn3lQOQzE
 AnThFYHRvfQwJHVwDY1ZZVvXdPa/0b4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX6XvvOD2f/6Av
 2GVoZsVvc+wF/doiBUNWGqQ2HxMRJps3TDQrl8WtQl/Qr/NkOeWtqZsTG5YW08iSAgNG67+l6xe
 j2I4STQ8aARSLY5esukrCKsxXx3jFDtaQmugO6HROGlzHJUw0VIpsYZ2fKL3guwNXZkb8jDnxSu
 GehubOUDJFpKTXjriwq1z0x9Hos1VkzoZw5gYh4syb2L8S499KqPPQcBbenVFqnnyHE2mV8pRZH
 dyyRuZliXhZmDhnF5qdKPAFtv7A8GKsM3DC8WZhw9D9cg33b3/tA/MTDeAqacibgTtX+gfgxqm9
 amfwPDZmXpbe6rF3rJ4kSpY3RXQfleTfiiLL7gER5WwV9Q0bGy8q+Tb826iOd8CaeIJUO1M9oNh
 vWRayXcOeLXep3CAzRs++WTV9zOGOw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf996c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FrZRtYz5i2LrMhXnUOwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: C-jPNRZn6TKwEN8X1T8tHNu7RCaFyLTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140059

On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The SM8650 clock-controller nodes omit rails needed by their clocks and
> >>>> PLLs. Without those connections, the clock-owned DVFS implementation
> >>>> cannot attach its voters to all required domains and controller probe
> >>>> can fail before any clocks are registered.
> >>>>
> >>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> >>>> Assisted-by: LLM
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
> >>>>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>>>
> >>>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
> >>>>  				 <0>, /* dp3 */
> >>>>  				 <0>;
> >>>>  
> >>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> >>>> -			required-opps = <&rpmhpd_opp_low_svs>;
> >>>
> >>> I think this is neccessary (at least on some platforms) to keep MMCX out
> >>> of retention. Even if we can drop it here, I don't think we can drop it
> >>> for older platforms.
> >>
> >> MMCX exists precisely to let you turn it off, the clock patches
> >> retain a way to keep the clock on during the runtime-resume of
> >> the clock controller driver
> > 
> > Turning off MMCX is possible together with suspending the dispcc. If
> > dispcc is resumed, MMCX should be at least low_svs. On some platforms
> > it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
> > On other platforms MMCX lists 'RET' as a possible value, however it's
> > not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
> > exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
> > represent it.
> 
> Retention isn't a ""real"" state the OS should vote for, as the HW
> downstream of the rails generally needs some flavor of LOW_SVS to
> function, or at least I don't know of any such cases.
> 
> See also
> 
> 7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

Ack, I missed it. The price of doing OE instead of kernel for several
months :-D

-- 
With best wishes
Dmitry
