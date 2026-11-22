Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347133;
	b=KEH1Fw9+tjhpN8wzYVBw+JX34cySBTxZqyNpobFHLxLuNKqP4rKrXcW/zuijIOE/kYGA
	 3HInCd/3xbsyVrkOBYdeIKfce+95AfgeEOyisvaKzqAXO1JzHdZRG8OWrvTKYM0TYTXzb
	 C+2mkPlfs7P51aaR6Ipv6HyXywB5Futq/5IGM7LUugadG7QQjNJZ3voPvAhiOCmdyUZ4M
	 aypAdtr+xr0IK0rBmxYrNTai5IDdbQxuI7rrmqsU17tcG7brIQKAZWAKkuW9U0lt9A72s
	 gLhhYh5zpNDVP6jLjkPPCIeWY+oEH040d7a/m6B0sbwYx8pdWrRvIgeRXySlGMb2meQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=;
	b=dehz9kw3H706vJ+vROiYU/RK5ZUK28RRPdDIforInYXwnUtKT8JTC330qLxuGUtFF+7I
	 y4N9U4v1UIRl7qoTj0k/yfW1j9o4QXNnn1I+AecKw4PinHOBqY1PHSvEnNPUEKNYvI5SR
	 0CME6YmNF8e3xYtbKWoQkEqnjrIaaIc3kTfFXmrM6fdXLl1AlftE9c855sbeWxsY7I5cN
	 BRTCf8rV7PKcPjYwa/Olt9UpWV84rYeVj1GyRPQlxJ27fSlgVeWr19rrZ7BZNvfLpncbW
	 GE1KMlpjtq6GVgi3hv9dY7x1k0WmEFsfgcy7NfII2Y9SE3V6U5kPAsQpmXbAEBVYSkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6HB5tvp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YeXrJIfs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D1606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 882D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6HB5tvp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YeXrJIfs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM86Cmc3136195
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=; b=N6HB5tvpI22mF/9K
	3aDWVY928iIdAIOgkAPKUi0obor0cDrcwU12+/uI5kl4MlyZ4CZSokWMIKWbp+eJ
	lyUMd39KB4t0xjbtMJtJXfdPtel/IMjCKy0sxidCOUFQm3iZtH1tM9Rui8Srf85A
	J07FuAkMAz76KYJv7+Fe3sAbABxlJhM1dcGk6i/5RuOGVDis7/XoNpd7LwcKDKRz
	r2qz7DEStpszv4/9YCjaDTNIMiRECGTz23p/7aIHNtUdZa5TWFFrjZSmA7GPvEjV
	unRV2o/AfREYoWwWQvIKlaG8MfwTK2K4U+mvAq0wMoEVrCcd7dNLfv1dvd5hZdTp
	plOaRQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328ruef1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:32:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so2285208c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 03:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795347131; x=1795951931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=;
        b=YeXrJIfscXzJh1Yd6W9nJtPXR30mwQhjpI2sXNI69TyNgT8RXClu8mQEybX0U5qUHE
         ajhvoRGNaQA+mzZEplG05D4SIoJurg4DblRJXI2FG22ebEPhZYKBLwoc0gcrMFeoAQr0
         9QM17GkQ1MK5CDhc9je/5DGEinYZ/9hABOuot/DGNtWh3Xx9TE2IOuYRiu6QCNFmH9RP
         7fZjB/V4NKR0cU8gf2L1NtF2HesAAR7EE4rE4hPiJhdDqUVR2Bn8MU7otMAdchzOFxpu
         SCfXz1CR05tqbmwl4u4Ur+A1EX/xtkzexn2KgJFVRRF5MVDLYdS2680hl3y5zyNzlTJR
         lNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347131; x=1795951931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=;
        b=JE+Itoc0mxMo7/0pIhaodeNJTc5zML2yW85gwdeyrgSJJXMc+C8Cs1/CjipqCb7ZQL
         zyYw0vF4+APU7CQI3fV9BH0BRSrkwcn3iVxOBcDe7SuNQX7s1mLpTfwLaza9KOha1TIR
         2uC7SeANfpnUblSabs/kuYeUANJaI+7clXXB6sBIHD8skl5IUOFQEim+M1kdEuzpixYt
         4DBiSIfhVd3IZkNe9cvB2t3j/M2LrdEFjOkXqvZZQtDfv9yt+Wfr/Jw1H2ssjZP8QqcY
         foFMwYE6Pda2Wr3F2yKNLK4ONheTueiL4J0G3na6E0rdy/to2ykO9LKxASmXQlzuYTlI
         Bnyg==
X-Forwarded-Encrypted: i=1; AL+hErG9Ai7ml8puuB90xYr4RoJP3lym4TvFpVhBenAnloxJNluuf7HgJdp25puiVabp54Ldue47uMeXxDkxG377@vger.kernel.org
X-Gm-Message-State: APuU4Z+W7S3oOQVRt/3+iBzWh/F1jwROwpGG/adrCeYjlTTYY3I0K45q
	LzpZJesh5V/N29YG/2BQywmfdhb0Lqs+IDSCb46NmUmfWE+H6+srHeh3L7f5AGnKkwO5nR+soTE
	Ig3qjLa9BIZxpEzhy1yd8hZfqJLfy6h/LF8UVJInAUAStrg37MwwrwMyl9fzW6ijS4Xyt
X-Gm-Gg: AZFdTZdN4NPe4otsm2voLPgcsXja+CzITBG81C46u43/GbISQ/O+Rl28w0TFdqq+1xM
	s2V4uAq/A2+oJvDL4pfGfmqdxDxvqVQ/l1G4m2x5cpUBflojyf+TePEr+8uVQbFFmZwiJ8Ctfhh
	wRXoJVFqFxhyLVKX3kvO7kwTt3KReXyrC0OARaSWBGtfRY/7lM55ZQE3fd5Sv/h5zFGrri3Hi7q
	PEHqL86JX/Sk3DpbJlYCLSyTmPyvuFE9gM5uv7HMKdbO8m9itPw4e9IP6GOtV/2yMXj/nPLtGNC
	d4k+SLHgSiICs6bbzWu4nf0jHDAs+RbrZWmXS8jUCrAzTnNnOrwVXPrunuILWS0YVRlDBjr3HMY
	aM7VF4iYXnajTo0VopyPb8tJTh/qvzFk4UzJP9E2zNbKepx4AwBE9cBZlg9Wemf8=
X-Received: by 2002:a05:7022:ea50:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b5567b650cmr6883677c88.1.1795347130776;
        Sun, 22 Nov 2026 03:32:10 -0800 (PST)
X-Received: by 2002:a05:7022:ea50:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b5567b650cmr6883626c88.1.1795347130105;
        Sun, 22 Nov 2026 03:32:10 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm33139384c88.9.2026.11.22.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:32:09 -0800 (PST)
Date: Sun, 22 Nov 2026 17:01:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add
 DLL-bypass for PHY-managed RGMII delays
Message-ID: <awLSryYCHGK4mNRo@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
 <179517515873.3136.13386164324921238997@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179517515873.3136.13386164324921238997@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA0NSBTYWx0ZWRfXzkbffqmY3/r7
 lYqBjLSo22HGzg8ttECHUmiKlEd6RnOPAuDhMAcDWWtehK13mhMK1no4g3+UIAJDWpmU/1s78vW
 vR2mkyyQm3XF8RlF3gN9rj+6zjaOZK4=
X-Proofpoint-GUID: 74_letKyVFg7SpUSfbllmyttgRaMc8sV
X-Proofpoint-ORIG-GUID: 74_letKyVFg7SpUSfbllmyttgRaMc8sV
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b02d2bb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ILAHPzDOMjDfJpBCQgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA0NSBTYWx0ZWRfX6AJaIwLdNwDi
 +1gJhYNIOKmO4Q0lM/a4G/mCWoFiTt3mBtNnm+BRckFGpYfaBGZDMlxR98rMHWIFmzbtRWtxP+i
 vOLMAkbe1SuWMonxtxB0v9xcCynaOAJJ10JxtysX/jwbNmXSKZFdvwQrZQPU9F7e3NeqflBvzeW
 nQjOcibN+lE9tZPGqHDgH1SjjF/7wWB69SNmcYOF1Q7XcrOeoFtKNmxuuy51oKOuV6xGI7tAcE+
 5HaIk0IkRKWmB2YfzKHaZLbxQX9ksEkyB5WgEWhhJDSXeg98pcN/uaRjz2xBvoLba019KHH+bIs
 fK/Pf8fz+WTZ0L3oQK/2efagaZcNHjHbikZ0BWWpqJTmyBsIH653yhuxBh4qK0/dvUxd19LrJd8
 qyiwlu6bmgtxTBmygjja95HXoIL/+nOXYSN8vqmJ1OpaBbCBj/IAcyknxJLRMnnqm92JgdsMvY5
 TQ4I8eA6cjjPZ77vUlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220045

On Fri, Nov 20, 2026 at 11:45:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] In ethqos_set_clk_tx_rate()
>   (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c), the new…
> - [Medium] Speculative: the new RGMII_ID DLL-bypass path returns before
>   the POR reset loop in ethqos_fix_mac_speed_rgmii().
> 
> --
> 
> net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays
> 
> This adds a DLL-bypass programming path for RGMII_ID, where the PHY
> supplies both TX and RX delays. The path is guarded by a new
> phy_managed_delays flag in the platform descriptors. It also changes
> ethqos_set_clk_tx_rate() so the link clock is not doubled at 100M/10M in
> RGMII_ID mode.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index f2428f0467bbb..99ea7e0cfb00d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 
> [ ... ]
> 
> > @@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> >  	if (rate < 0)
> >  		return rate;
> >  
> > -	return clk_set_rate(ethqos->link_clk, rate * 2);
> > +	/* Clock Rate Requirements:
> > +	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
> > +	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
> > +	 */
> > +	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
> > +	    speed == SPEED_1000)
> > +		rate *= 2;
> 
> [Severity: High]
> Should this check also look at ethqos->data->phy_managed_delays?
> 
> In ethqos_fix_mac_speed_rgmii(), the bypass programming only runs when
> both conditions are true:
> 
> 	if (ethqos->data->phy_managed_delays &&
> 	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
> 
> The existing descriptors don't set the flag. That covers emac_v2_3_0_data
> (qcs404), emac_v2_1_0_data (sm8150), emac_v3_0_0_data (sc8280xp) and
> emac_v4_0_0_data (sa8775p). With phy-mode "rgmii-id", these still take
> the legacy POR/DLL path and call ethqos_rgmii_macro_init(). That function
> always sets RGMII_CONFIG_DDR_MODE and programs the MAX_SPD_PRG_2/9
> dividers.
> 
> The comment above says the MAC-delay setup needs 50/5 MHz. After this
> patch, these boards would get 25/2.5 MHz at 100M/10M. Doesn't that
> contradict this part of the commit message?
> 
>   "This new programming is guarded by a boolean set by the platform
>   descriptors. No change intended on existing platforms."
> 
> A later patch in the series, "add QCS615 EMAC support", notes that unlike
> QCS404, the QCS615 RGMII clock source supports the 25 MHz and 2.5 MHz
> rates. So on QCS404 with rgmii-id, this could request rates the clock
> source can't produce.
> 
> Another later patch, "set initial RGMII link clock to lowest speed",
> changes the probe-time call to SPEED_10. Non-flagged rgmii-id platforms
> would then also get the halved 2.5 MHz rate at probe. The issue is still
> present at the end of the series.
> 
> Would it work to use the same predicate as the bypass path? For example:
> 
> 	if (!(ethqos->data->phy_managed_delays &&
> 	      ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) ||
> 	    speed == SPEED_1000)
> 		rate *= 2;
> 

While there are no current users of "rgmii-id", I will add this check in
the next revision just to ensure that this new patch is independent of
the legacy RGMII handling.

	Ayaan

pw-bot: cr

