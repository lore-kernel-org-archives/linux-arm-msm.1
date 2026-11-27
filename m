Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811213;
	b=Z9FBW9NhwMNHr7w4OAuFWr4xHx22LnVDX2HlsMbD+mtcK8Si3avRrE1aIZ6YNLe9oGCq
	 vBzDusBVhJizY0eBF3V2a0OAZey9JMG9RRu8HLHROf5nAvQkuIRjOYaUo677cQIgmr1WV
	 87aO/0BM1i3Up1+A93gpWcGKhlE9B1g4REr6qoUHtB+UUzr3ymiI6fonlkTbzDsQ6BMT6
	 2BXdibtGdpluu5jnSrXbsJZWsfJXQCZUpnwEQhLAE8upuLo+HwYTyF/WIQTOFlvb/Jdeg
	 /yUkrbKqzOuxn1LtlXCi/+C6wh0pfqZJwqdEudFGZK731QVo3vd3NA0Bfz8KmEy5YfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U+MQls5F39eaWPhjl5MOMa9YQrhfhFVoRGXfaTrSITQ=;
	b=VwDDFS4P2rY9HI5cwbGUD1S/1qiDZS1Bx6pmPZz4bWAm0DP8ptrIWr5bXzkrCMFG5bkZ
	 QlUP9tQDZvccxI9wVOo1OGOaYMRKr6o6jhwYjFdybV/D5P+4KErMxlDimrrSkY5AB1d4a
	 BlGUiIwwrlZeli05nuyMp4KjNg3oUAiSUitxtkKy/+8fwHf5amTG5BoNPmd61PerT48Qe
	 u98RKa+dR82ZC4wbcHPXvxVdlS6IvWaBWq9hPuf5skUivyKzq88EzUJp1M76fMnXZabpD
	 fPbaxSaMdXrrHrWC+j/aJ6NnteTpiOTfwxGHnHpLl/v/7JG+iqav2SkNORo/ANo1/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQF1KC4P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N9PmG/wg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E3606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQF1KC4P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9PmG/wg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB0U72455036
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+MQls5F39eaWPhjl5MOMa9Y
	QrhfhFVoRGXfaTrSITQ=; b=GQF1KC4PbWynR9CJFchk9/7bYAyxHQue4mwXHVsF
	vRzaJlreZErl4vt0XczOpaRgow+JUL/76U8iCfJp5YetHXnfJQZvOEWB0D0CVJbU
	1/4d12SPitQLg1XhKvSCyxKVqSlXDfKJdVctW0WmmcKuG0KA/JTXWxbhzZypc4fU
	8sjN6JHCqHYvKqoj1RDou0WzTHtFOCh6wIdri2ZeCivWu6G7rKDuu5+U7oeoua3v
	QP9q5v3OG/r9r2OcTDqkfgolF/rXtrINenLV/7utOVDWBYyBBdRKYhhrimvkP0W6
	Xc9+RxLIKGsxJfj/amHeAooG04zXWMxunBIDuENFNOUj2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3bycq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:26:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso1125667685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811210; x=1796416010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+MQls5F39eaWPhjl5MOMa9YQrhfhFVoRGXfaTrSITQ=;
        b=N9PmG/wg9Dierrk474jvYJCorYV9x7dQl+5BNO/bzXJ3tiU6t08ibET7rGQE49+9l+
         w54rA5a6POcILHzuDA83Y2NfW2rgyHAa0jbugRhjciJ8sBHLJ6TkMSJ2okSffXhMmyp2
         jVjssoy8fCijw9B3Vyug1AXCjjz8v0bR5Wiv4Erku89bgIQLAsHKeq/xv9VO90scmXjz
         k/vlzRVk58sEv7F5VnM+9DJXOalywbB8lF3xflPZ4ebrnvkzQ/OLTI4cZW3Gcv8D3rwI
         dSu7ghavTEj9mRYCe9cJDmuDIV3s+F2FpxKZkF8RzdSY2XbGYss91puIWDE7peyYwQFc
         E8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811210; x=1796416010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+MQls5F39eaWPhjl5MOMa9YQrhfhFVoRGXfaTrSITQ=;
        b=DLIUrLs8FKq9+8+G8FKzRzI0e0qCmaa6XOKNnRmCsz8ScoPx5/yO2E1hq5Pw/sETwp
         wQdT4saIBoSs5cqELcy0/SR0EaaIjwOgzlRosiVWO6l90xU05sjNM8I3PvM+/5EKRWLZ
         ANeI3IQiwjEH1KYsNfBN3Ox1Po5ojfnc/90kz5kqJ+NFQpxq1YWhwIh6FqoqmYurldyK
         KjWlNXbPrrme/n7rQMViMoZVY7lFbVmG1m4N+f1n5Z+0Ed8l7b5ibwboqRZF5MsRaru3
         w+nG7yV8vzCZ/vgDYNSNOPR0nFVGuKXGQJ2ZKJIUbbr6yxvgntcQzAZ7D/pAkaA86qSg
         cPxQ==
X-Forwarded-Encrypted: i=1; AL+hErGLr+RM0J+o07kOVG51rUJXulgZgTPZLgHFRCZYaN3JpWd6t497JTYdBsA4+UCDE3LSR6Q5Jogj7EJ6nKDl@vger.kernel.org
X-Gm-Message-State: APuU4Z+nGjhp7jrCdGHJTnPAumSxSBN6H5aa4VGEqms+jk9oCgOtWymZ
	zQ+/8/cgGQNwtm9VUFHn9Gu8FCTb6TSdOK1j2qI8L4pbWDEiCnXWueWrR6swzABzkPeqiFsp9js
	VJIR/hF8/pExcl7TrmrATwweLlFfC2LVOuUx2q8SbEA5Rrh8Pj8e/WCqNIVWKjcaw6jEW
X-Gm-Gg: AZFdTZcFWTAk33bi9JiEcuhJZUVCSZF5PgWImAcZ5Eq51pBh3uNXai6555A5kEmdlzp
	WM170t09UMjOSCNOfLtMF+UGWC7iEmfkQf+E8Ko1Zo8KDLQqfyC4rjJVlIhKTC1l5l2VcVqTckF
	N3l8gZLYTeK4F/TnxfsL77AxfYcX58Z6yLJ+aNLBLzu19QhnVJb1Dt5IzW9Qaueg6T17+WeGSyq
	yRBwfmcfi0QkkNg2lb/fPDGweBY3ICDXD1ty6CflTV/Jz1u74/i1Ol712ejKRK1hUDBlmxGW+xE
	R4TO4d8ChNw50GhnQOs9NMYm8CDBi9I4gi2aFX6eshdlCXxY0JeEFCHQnT53wEyB//djnTq+Om0
	DGQ6vZO8mSi1QgYk3McNDuAlVBMjGXjKHhaz6/giK1kKoEkXfvAuiYYInvI6ZUqQMrSA+mh1Rh3
	aKoo9OB6WS7TnI6jPWAXBTUNGdc4x9qhzSj3/3Lio8T95mnioM36K1Ortk1a8gJA==
X-Received: by 2002:a05:620a:8386:b0:945:d22a:e82 with SMTP id af79cd13be357-949ba96e395mr4809348885a.27.1795811210459;
        Fri, 27 Nov 2026 12:26:50 -0800 (PST)
X-Received: by 2002:a05:620a:8386:b0:945:d22a:e82 with SMTP id af79cd13be357-949ba96e395mr4809343285a.27.1795811209895;
        Fri, 27 Nov 2026 12:26:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e00dsm69683951fa.3.2026.11.27.12.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:26:48 -0800 (PST)
Date: Fri, 27 Nov 2026 22:26:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, liujianfeng1994@gmail.com
Subject: Re: [PATCH v3] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the
 first PHY enable
Message-ID: <oj34ljpmxdycfa6igp7bw7ruk6fuukyxmpnneir66eagrm7itl@czqpnm3r66d4>
References: <20261126052049.1544229-1-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261126052049.1544229-1-xiaqinghuan@mail.ustc.edu.cn>
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09e78b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JdZ7eC64QEHxXyYvkNAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fNT8RHtQlPDhYxuKCDiDkWGTZRqLON95
X-Proofpoint-ORIG-GUID: fNT8RHtQlPDhYxuKCDiDkWGTZRqLON95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX40z+fKIEATP9
 gO+kzfeRQRtFECmvn5FQ+eqHfHl7I2GL+FdG0oJ77B3xHKyhEWW3uutVAFjLFuMjcXrH6MTo15t
 N7mIHVPfdz7V2/6MzD/kj36MYFhBZWc8rNfNtc+GYo8tCT2ydWOZJdFE0wEls9mKm96csp4xdz/
 AWbZi7U9fKe6nJj7ZtgEcXONeHsTcLFY19qc7uLJiq1c/HcstEUsGU6RPCqYv8RS5yGG7pIfvMe
 EWp13r4dRhgbTchAu7MEU060ACejubgXtHp6Cf4UCzOf0rfnGjjtc1BWyzREXqgRgvK5n3I8z1n
 ma/IjhU8NsJGgjnndzj1WTvOU2YStxkKIbMGCM+nG19GnLgmgn6ASoAhroAMgQ7Ylyyg7GYnzG1
 aHodwmX0MUBLVNS0/HcTUwDGmIXXf1Xt7m3z48Su06oZlJOop5YzVpXyE3hLFhiZGPrLyza2GCO
 TBsM5+lo3ZK9VDfamlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfXykHU+IqGswfp
 Lfy+UcrDMIspeMevTELpKO5Zxq9QHHLLkrZtUa8WN+YLkiKcyOzZUa1rTJDg5RKTpCt/TGj7J0P
 qf0E0QZ2C62rtf3oXLflWnsGn4IDTNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Thu, Nov 26, 2026 at 01:20:49PM +0800, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> dsi_7nm_phy_enable() pre-seeds pll_enable_cnt to 1 while de-asserting
> DIGTOP_PWRDN_B and PLL_SHUTDOWNB, and dsi_pll_enable_pll_bias() returns
> early whenever the counter is already non-zero.  On the first PHY
> bring-up the bias helper therefore never reaches its
> PLL_SYSTEM_MUXES = 0xc0 write, and nothing else programs that register
> before the panel is powered up: PLL_SYSTEM_MUXES keeps 0x0, the locked
> PLL outputs are not routed to the lanes, and a panel wired for bonded
> DSI comes up with the backlight on and no image.
> 
> The combination is old.  commit cb55f39bf7b1 ("drm/msm/dsi/phy: Fix
> reading zero as PLL rates when unprepared") introduced both the counter
> and the pre-seed.  commit 93c97bc8d85d ("drm/msm: dsi: fix PLL init in
> bonded mode") briefly dropped the pre-seed, which made the write
> reachable again.  Its revert,
> 
> commit 44784327815b ("Revert "drm/msm: dsi: fix PLL init in bonded mode"")
> 
> restored both sides, so on current master the muxes are once more never
> programmed during the first bring-up.
> 
> Program PLL_SYSTEM_MUXES in dsi_7nm_phy_enable() next to the CTRL_0
> write that powers the PHY up, while the same lock is held.  This only
> adds a register write to a path that already programs CTRL_0: no
> existing write moves, and the counter, the locking and the order of the
> rest of the PHY programming are untouched, so the byte-clock regression
> that led to the revert cannot come back through this path.  The bias
> helper keeps its own write for the paths that raise the counter from
> zero.
> 
> Measured on a Lenovo Y700 Gen4 tablet (SM8750P, bonded dual-DSI CSOT
> PP8807HB1-1 panel, "novatek,nt36536"): without this change
> PLL_SYSTEM_MUXES reads 0x0 at panel bring-up and the panel stays dark;
> with it the register reads back 0xc0, the panel initialises and the DSI
> host starts receiving interrupts (41 in /proc/interrupts, 0 before).
> 
> Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---

Cc: <stable@vger.kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
