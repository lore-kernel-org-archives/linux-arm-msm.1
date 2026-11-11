Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407126;
	b=1GPGwuSpZ/vJO52cQ1zb7lUl7JEago6I6xBguOlX5XkNTo1fxA8n9aP2Hgjr71JiofI3
	 8aZB847eTt4k2Urzdz/ZGRZXr2TSF0JlmMPOK0p+rJTMo74VbpbJJ+/aqDAwgw/aLgd0B
	 TRYpe/HFLipZx+FyijVmt7D/dINyo9a5c8FaEEws6ArKZfk4lnjLQYNtBvJ+ZX1VoiNJf
	 OiS39CkDdtBZvsgbvo9FFtJU+OZYqaeqEwckyXZ+d2qakI3x33VXDYkCDVpsGKu93R/1a
	 ZjvJNQvEE5eBS+o3nBzsB/GGpfNLWBKHQc0eUmfxw81CvrSNatotQiDNvLlormUYJ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QHCjyWnjJaKib08TgPofPSfS5d3rT38/26nHs0v//to=;
	b=R3+oqozQzLa0t3hgETu5zMbsToVHGK5ltf/upppz/K5bRa1CeQIVPMPDJSai06daaY7E
	 SzSlmbjH7O/w+OTWm/Zu9VOPJl99FPx+RSv6bRCX5rJ3diEjePlFFlCr0GapyNbxjcmS+
	 ZQzOmrmngOcXkHISYmqvLubtb/o4a/hPJ0F3dVrnbDQbjJLj4JN+NCHNM02OXrDU+JHd3
	 zVvOwq8g65ip/fFHG79I0C1rH8Z5FfpxF6BMOa7a5VLZm8KkTE3U8nrVa6Cf9TDfrFBT2
	 vDykuTUhSA0Q4Ev8EAVm3jw3z94Qg7uCiGc9UQQ6tcOL/0D2Tqi1VlcQH6gn6b3cM9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jePkFgnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9SZ9Ac5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40F606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD40F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jePkFgnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9SZ9Ac5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEKkAA530509
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QHCjyWnjJaKib08TgPofPSfS
	5d3rT38/26nHs0v//to=; b=jePkFgnEVX0RULsrw7zmearAUw+XslMLC+QTiA2O
	o60WRQj0rvP3SnpnYwb+u0ng7t7hYvWzxKPD/o+kBmTC/A9uTqERoqWqhXnaedWv
	r9vgws8gvjJ8fDVqkcyYlAdg/A57SaHbLAlitobIXU6jQwEubzovDYEb05eGTBg1
	XKEm3Pl1uSUQGtJva7dqwXd+D5syugIMtQrST3tvkxyZCeuNpB8e8r9W0q1neT6o
	4dsHbdp3vow2qJoGgko3MDouSocPSajvW7k5Lew6FoJOv5YYB3/JUviR9hkP39Ch
	IZhHMLFKeBKURT2hVkWgsxcq9/JHOBkgMRMcveJqouttlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrx19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:25:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so620158085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407124; x=1795011924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHCjyWnjJaKib08TgPofPSfS5d3rT38/26nHs0v//to=;
        b=J9SZ9Ac58rfNpyn1ILmQzOPOtrqq+BEVLDT4YvcsJjOOKRTbCgurxVQUk+5QNbukwO
         sfdsnCOWKp7aVOdSbM4TB7gtuTVO9yBiNZAkRwlVGoVk0aSL0DxU8WlLRGgxRskmIzqo
         qvQuNjlBo18gLHl9my4FUhZzgrO+NF/7QoR86xWFJDaIUf66wuEfcd45pcfo4S/m+sxh
         awM9wqSVLGXTBLaqhHBWAh4Wc3C/1bSwDvZkuIvZG62Xb5IzKVfW+9AT/WPEyNi8E3aH
         DLMgoQagDPet2c32lN4QGuJOmvKECcZ2hAK8CsnpkNHbFvzBDvdnw1hZXyZTtltaCmn0
         7GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407124; x=1795011924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHCjyWnjJaKib08TgPofPSfS5d3rT38/26nHs0v//to=;
        b=wlz6LdEOkgAWTveteqB+4SUPmmPUnjtEIq98EKd6mj2qudXAJpkrJmAf1MaTzYr2nP
         E5dWVwGFj7dR5To6BThbw4zD96hfAMa8TiPC/aYGj5eR7LkOIaHMWq1LdRqPauE3LI/x
         OIyVmxi6r2enOVw82euxiaB1yb68v0ClX4sKWsfR3qgCq7N/s2WnCWYh3ip5egy+uCdt
         DunjonhmQbRcqn26hozvO3ruScsvpRPC+NLU0ioa3oVwMrvIhQFpDeAO/9J8IAjelYfZ
         +W8xuAlDqwiv/uaxUcJyBjat4mXVMBtS6tpoIiQ0TpjrxL7r+fZIDjWMfqf1hGaTzb3c
         iasA==
X-Forwarded-Encrypted: i=1; AL+hErG/JeS20iGsus+HIFe8QUPJEwPGNQQHgsDtEkg23Ed1taDz+oQ+dPIIJpqHYyidUwCfCWrDA2SVfNeiyPRp@vger.kernel.org
X-Gm-Message-State: APuU4Z96vya26GGRaBpHgx7w+A1FJ/aGHGAn1aFGb9nn71rVr/TsAS6V
	Hh1grd8JaN3j7+z9RdDiR3NOEaIKPYvlHvNeLUWlEBx00NliO1jSc1eF/iThgkJb7r6QXidXJWk
	FwqJiwDWR3WeK3PImA71SNfp5aS8Sqc/jNxmoxpN9Nu3cNg785L2gQc6UH1gokIvLMmiT
X-Gm-Gg: AYBFou0gNUaX6r6BkF+Uus/q8PP05qmVe4LXuK5hQ7165M1EJmmzZySej3+4yewLHhL
	X2cdqH9WoRCt+APAYhJVZRUOD8ZG5HOgYK1/CcQJmuRpHiKdZFRjBoc+YPwSpAbBotCUQICqJOH
	tYjKiYJZEgYfUZTcfr4TEALqgifZPGxICDIycijwOC//cq/H6GF/VzMA65OPLsH5GtPWxW1sTXP
	1YxgtyXfDAge3SIHuae3RpRHwKDaegq4lgLmkFsCQKaZwVcA+SYuMbrtX2gqMU0Zw34rzLFSP4L
	6ScQAEmakdPMt1rW4qR50AOjZRUQzfnNiyaTa8jLDpcdWGOsF+wBboVsjEdpw2TURYkLhlQAqqs
	aJvaA4vyjBeegz/DJKQgJhbf7yPcNVg77bhtsF8SkURJSaS6a8r/1O2XOYgpGSgZID833oZtqFD
	151G36/TiLavyTgPyEPzlVq5a9ln41gU25YxF8TsFPpLsEh/pfJ89yLhOU0+oSbA==
X-Received: by 2002:a05:620a:4711:b0:93e:5daa:67a4 with SMTP id af79cd13be357-947afd6c994mr406653885a.29.1794407123544;
        Wed, 11 Nov 2026 06:25:23 -0800 (PST)
X-Received: by 2002:a05:620a:4711:b0:93e:5daa:67a4 with SMTP id af79cd13be357-947afd6c994mr406648785a.29.1794407123071;
        Wed, 11 Nov 2026 06:25:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15bc4a69fsm552820e87.84.2026.11.11.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:25:22 -0800 (PST)
Date: Wed, 11 Nov 2026 16:25:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Joonhoe Kim <26rote@gmail.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v8 01/29] drm/msm/dp: skip sink requests while the
 mainlink clocks are off
Message-ID: <ldg46pmbkt2ntfpmhdgu7hq6va7ljck7o7pua6rkkkuij5b5c7@dqhf3ozkjoom>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-1-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-1-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX5O2AlGxkanlL
 BUPY3oajTk+GXOiZ1ezQRtq8kdsTsPLjk2uHsY+2pUbFAntEI0YIOXGG2SPkDXG9iexYgAG6/b6
 za5mZoSfPHSTvtgkh7NZOjUdaagJkUa2HCD0aUItAEEEcCNgWo4PTdCq5KDx1kxdX9EF/NB3Me3
 bXkadeNEDlkqwgYnQUWEFYkzfg19qKyOw5RjYnqHJLpCX5RNTfcX4X8L2ww2J36fazoTUReERMz
 OQXordLaAtSa/8wME+wt6qrTQzQOA9bVLbjwRxIOX9EQ6t4lkH6x1X1uOVjC0wmDeswxwHrbTQv
 UFo++0U6od7gsA8EMwSc/yTUXdRDiHbO3DEshHJVq++OmSpfcAn42wPZUH6DblsVYzUQG2WSbYT
 FNdxjAponqv2CPzHsNoPZnIn4VCurCFgGwkX3XyK1ZuYQC0ZTmEVCugUoDYtytRAzk79bxg+gIr
 h79ZGxzksFkxR0Q+hGw==
X-Proofpoint-ORIG-GUID: o3Qk4uSwG06u7QU8D4_ACmZwwNREScav
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47ad4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_QjLU-fBZjFD5OgerkcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: o3Qk4uSwG06u7QU8D4_ACmZwwNREScav
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX2bCBdvL5mpjN
 MXfGfpV8Yj0rcViuFdo/eJOLZRkSr+k4+IVHpyWWB+zXY5c95FrPOtDx1898yFBR1Anpu6lkjcA
 4hgZXp7+NxCoPIIB49ZXF1KourEDhXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Tue, Nov 10, 2026 at 12:54:22PM +0800, Yongxing Mou wrote:
> msm_dp_ctrl_handle_sink_request() programs REG_DP_STATE_CTRL from all
> three of its branches:
> 
>   DP_TEST_LINK_PHY_TEST_PATTERN -> msm_dp_ctrl_process_phy_test_request()
>                                    -> msm_dp_ctrl_off_link()
>   DP_LINK_STATUS_UPDATED        -> msm_dp_ctrl_link_maintenance()
>                                    -> msm_dp_ctrl_push_idle()
>   DP_TEST_LINK_TRAINING         -> msm_dp_ctrl_link_maintenance()
>                                    -> msm_dp_ctrl_push_idle()
> 
> That register lives in the mainlink clock domain, and nothing on the
> IRQ_HPD path guarantees those clocks are running. Disabling the
> boot-time mode for the first modeset from userspace turns the link
> clocks off. The sink answers the link going down with an IRQ_HPD
> carrying DP_LINK_STATUS_UPDATED (DPCD 0x204 = 0x80), and handling it
> walks straight into a write to an unclocked register block:
> 
>   [    4.572532] [drm:msm_dp_ctrl_off_link] disable
>   [    4.573756] [drm:msm_dp_ctrl_link_clk_disable] disabled link clocks
>   [    4.823194] [drm:msm_dp_link_process_request] sink request=0x80
>   [    4.823199] [drm:msm_dp_bridge_hpd_notify] 128
> 
> The board hung on 3 of 3 boots with a 5120x2160 SST sink attached over
> USB-C. On the hung boot captured with drm.debug=0x100 the printk ring
> ends at that last line, the drm_dbg_dp() immediately before
> msm_dp_ctrl_handle_sink_request(). In the RAM dumps CPU0 is still
> running pmic_glink_altmode_worker, holding the bridge chain mutex taken
> by drm_bridge_connector_hpd_notify(), and ctrl->link_clks_on is false.
> 
> Bail out when the mainlink clocks are off. All three branches need them
> running to do anything useful, so gating the function entry costs
> nothing: the first one resets the controller, which its own comment
> notes "will need DP link related clocks to be running", and the other
> two retrain the link.
> 
> Everything else reachable from the IRQ_HPD path - the MST ESI handling,
> msm_dp_display_process_hpd_high() and the video pattern test response -
> only talks to the sink over AUX and keeps working as before.
> 
> Reported-by: Joonhoe Kim <26rote@gmail.com>
> Closes: https://lore.kernel.org/all/20261108011501.4466-1-26rote@gmail.com/
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
