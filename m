Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18933B6F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789708700; cv=none; b=b1/prCtAIauzv2vsxXUrSIef1aHh3iG7JWEHMQj3F49tZIgPpNw6HqHFa2G37oa+nF8CCBfbCAub0Fn7knUAZ4QrfqCDRLBcOPGbGk+XrWGUhzlY0Bh4Xid5xMCmtCpjFWPvuZRSHfsaUHyKo6Df8qLC1dfQ+twd0tZ6vp1+T6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789708700; c=relaxed/simple;
	bh=KpCOGBtg1kn7vEKf3x1UtZtSMIts6JSL1bQ3R6nvIMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVd/iM+K54SfykngGQ/L1UXtl3s2xD87IR8uRuBkTeCgwGdOYgBHhUMMfHEdF3+DgSp29RhsH/S0oZrHLRxzkf5UVXZM9tH/y+gTpMOAs9ymM4LxJB9u+q7SGZXRd/b+qyD9bHOgsdmLCjQNcw+ARrprarGrTEdGhFVm86+/n7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INqJ3+Oa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuiiAUNy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INqJ3+Oa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuiiAUNy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UUqP2972503
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsKz2/5LlR7nT+hESyfXy9LutazAFBvD636fITNFVss=; b=INqJ3+OaRZXqNIYA
	n6WQvl7GM6ZXVB7ZmEAT9qRWU5sq911XCkwihzWGZs9FTioZJwhN1OeUc+WEt8T4
	jTYUi+0NzQ2erJ3GkPeUVMSTNuvecWq2xh9zV0Td0jpD50Le3mQyVkIo9py94O6l
	uFar4yzNvwwVfSu078qqGINrmsvyTqLw4Dfsx5l1U8zi5ROY/uHgMkP4AEB0s7Mq
	z1znaSbAQ9oEpnO1d1zdsK9nmf5DMPrtVqmt1Dn4tXPrZbiN2TF/AbGLHjY/njmm
	0rQtqN6RyD0Z7WHJt65ZsGWEke5q0Cs9LPWuF2lrRTprzYMsLnHA/n2OQg10ednG
	fZ83ww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdsf9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:18:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1386121a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 22:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789708698; x=1790313498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsKz2/5LlR7nT+hESyfXy9LutazAFBvD636fITNFVss=;
        b=fuiiAUNyu9rnmV64fRFgGZ6Zo0Ar4Cpm+/bHQIsfi1rktH4WuiZwql2NobCPwqINlV
         2aOyE0FyjlM4aMPR42lSdnT+k+IxhrFLYyCXQnQjpR9qRiNJ5V2C3s+2fOYKupixQyrT
         XbaNp5x0ChZ4LdkTIPs9T28IwHGS7LNyON8MGyLLHtzntbpFehE3RAxQFMibJlKHjPMH
         d8Kf5k/dCajVNivxxbo/mphzudrSMcPJhYv6xmMXwOAtNff6SW8zdk/nxCQfhCo51XB6
         ktpzvTo4ZQggjIYa/vrNIU5BuZxUgjvis5O42qQxBYqb/aB9MdJVPwtOBo3NqqZFPo9f
         ZCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789708698; x=1790313498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HsKz2/5LlR7nT+hESyfXy9LutazAFBvD636fITNFVss=;
        b=oAC0XmxY5pNeaWLKi9OLzuLZ8lkJlNBWEsFgZn4c1aQBCHJt9E0XgoniDYM1LF2Fb7
         cVFmQimKGCJNfKEwoV3+Rt/GvtyKwCyTk3k+2mON2lNTKkx6WFvlvxuYyTypnwGTBMGl
         tbV5Ftbau+YeXrM90hCYZCUWsNwCKpqmFZNDniNuCP9lPMlSCNfiJNQZ2MNNALegThtf
         iN0g/xiGBwyO1z5I0u9Jxr5k/jG/ujWyKgHqd72L/mpkgxyNJvnsdYNOR/TkpSBGa+Yr
         s+lhZiP1xtbYwm2SSkGxxpWmktKZhgqDZ1U9digS98NNG56eXofCzAL82A5Ohe3mx+R3
         eO0A==
X-Forwarded-Encrypted: i=1; AKwUvBxRS6PGFXQssi5BQ514HJaJmBpGb/0LFGE7fxgK7bUQFrdOToutnAKHXP/XWzIDUuYut5ibzBuU8Yfy2WwO@vger.kernel.org
X-Gm-Message-State: AFuF++kg8DM4sWOoL8GbWupq7xqhgAle70QvKl07FRJL1oMRsWXDV/d9
	YIJ+L8OW1TE1C/szXfNuNymEyru+JBuX2wDOj21KkQDLd/Fn4/Ixri8SiUrSYkzUIOw4EpKvV62
	iMMD5TRPRu6QWgq5Rj+QA8eWfVlWpNwGgJFvj0pfo+/ejHBTQEsEOTlEzTuv4vhYeSsrG
X-Gm-Gg: AYBFou2oHD5vnjt+q9/xG+S6bH3rssmSj2gpmvIKMEMoXDg7ptu9EUW3SIgDJCRKg0y
	UcHJXWXsDAYqf7Db0O+r4sMCeiy+V3Hd8jJapnzDmICWI3QEq0pj5suNc8bHbTAOdSQmVZgtzc4
	SFghKwoUXUIxuI9XX0OrKKtnmzoPOgsMYit4aHmzVu3yXN04PKJH14c/WmSg/MQdI/Ao9oEonFL
	fuaKI+ztX6Gb1TAFR5gztzBISmDXsJclEsdf4zp0LIBmYdEZVdrW8jOqOYqqo3T30QUma8rlBwC
	j+nGnfqHkyYK7WrldqfN+9WrMJzaaeNOBdpfdtAD8EDHqR4SNZkeEjM6dSOuC8OFq/goE/v5yy6
	Sp/CUi0q21QG5eA==
X-Received: by 2002:a17:902:f68b:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dd9c6b9174mr80332935ad.1.1789708697643;
        Thu, 17 Sep 2026 22:18:17 -0700 (PDT)
X-Received: by 2002:a17:902:f68b:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dd9c6b9174mr80332495ad.1.1789708697155;
        Thu, 17 Sep 2026 22:18:17 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98c6sm1220454eec.5.2026.09.17.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:18:16 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:48:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Thomas Karpiniec <tom.karpiniec@outlook.com>
Cc: Coia Prant <coiaprant@gmail.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: stmmac: qcom-ethqos: advertise supported
 SerDes interfaces
Message-ID: <aqzJkYqRgpBTOB9N@oss.qualcomm.com>
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <aqqI9wOnradk9d7K@oss.qualcomm.com>
 <97924d2f-45f9-44d5-b482-97fcbb70abdc@bootlin.com>
 <CH3PR11MB8413131D50175690DF9FDAB0E4B82@CH3PR11MB8413.namprd11.prod.outlook.com>
 <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
 <CALj3r0gXP0+bwsPVtuw=9RRQ6gpmuHzGc5PzF_a3XXXTTZYcqQ@mail.gmail.com>
 <SJ2PR11MB840156009D655CB83CD04EF8E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ2PR11MB840156009D655CB83CD04EF8E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2NyBTYWx0ZWRfX/0U0UZ7h8HT+
 F7G1msAZ7G6OxmtsYKsROgcvLc8nFCTw48jFfIuass9Nax0SjoDxtiy08c2NwUAjdEt/jksL8om
 f3p7zpZRUdM36ofySDvHgpUtCmulgsUnEC7d5OZnwO+wBoOaDLNOAhsQ654Wg4C32fA3nx9K3LE
 CeOQ1mZL50QAKqz6LGW5mZScZ/2+ZA3I3UbgCitOMfZ18YsMXbfgzhoSQw1qPNR8BYfgjigAFk5
 rWmuYnOyKclV6mZLSy68PT2od0A/glCwDPz2OP94cKwUGaDcVZ/EXYnb1WI41BJtYFCx3xEkq/m
 nIztCJMW6AlyctBEhi/ya69mC2dAsP0E2icAhCxRwe6Clf4WusB/SgDoz7rNZsx1tE3vsqh+NQJ
 5WhFTzj96NbYgomMn0rVFxsAQ7IxzZuOwlCqmkbrRA3JHS/5YgafHflfuhPz0FjjRwztaiflS35
 dTROl4/ghnDI4XE0isw==
X-Proofpoint-ORIG-GUID: FxkR_1kaO7nLmQSSWNXUussZiOCHaor3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2NyBTYWx0ZWRfX2wlDMjAan0JU
 bS4cmQ7LEWAmAeyUcYsNFqV1eIIAfWJ2wFpgbwdH+u9TdZ4FXbeB5kDF8WDk44ZutOcbAx0s3pj
 2eHxkkpVbBm6ILG0MDgtCYpTidGRTy8=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aacc99a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=zWtJOzQAR9QYW-IJ8IAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: FxkR_1kaO7nLmQSSWNXUussZiOCHaor3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180067

On Fri, Sep 18, 2026 at 02:36:04PM +1000, Thomas Karpiniec wrote:
> On 17/09/2026 6:21 pm, Coia Prant wrote:
> > Maxime Chevallier <maxime.chevallier@bootlin.com> 于2026年9月17日周四 13:36写道：
> > > On 9/17/26 06:29, Thomas Karpiniec wrote:
> > > > I tested setting STMMAC_FLAG_SERDES_SUPPORTS_2500M on hardware and unfortunately the flag alone doesn't solve the problem.
> > > 
> > > Yeah, but it's still the right first move. Russell planned to do that as well
> 
> > > > I think there are a couple of things missing. stmmac_phylink_setup doesn't use the integrated PCS bitmap to populate config->supported_interfaces, so SGMII is still not advertised to phylink as a usable host interface. Also stmmac_integrated_pcs_init is adding 1000BASE-X unconditionally, which wouldn't be appropriate here.
> > > 
> > > Ok so, the missing bit seems to be that priv->integrated_pcs isn't taken
> > > into account in stmmac_phylink_setup(). This needs to be added then :)
> > > 
> > > Looks like there's also the inband support that needs addressing
> 
> > On the qcom issue: the missing bit seems to be that
> > stmmac_phylink_setup() only looks at priv->hw->xpcs and
> > priv->hw->phylink_pcs, not priv->integrated_pcs. Extending the existing
> > OR to cover the integrated PCS would let qcom-ethqos work without a
> > new get_interfaces() callback.
> Thanks all for the feedback! Including the integrated PCS in
> stmmac_phylink_setup makes sense and I've now confirmed that this works
> end-to-end on my QCA8081 board.
> 
> I've prepared a v2 that replaces the get_interfaces change with two commits:
> one to set STMMAC_FLAG_SERDES_SUPPORTS_2500M in qcom-ethqos, and one to
> include the integrated PCS in config->supported_interfaces
> 
> I reviewed the work that Russell was doing and I see the problem. Both the
> integrated PCS and the ethqos code are configuring in-band negotiation. On
> SGMII this occurs twice - both turn it on - and on 2500BASE-X the PCS
> briefly turns it on before ethqos turns it off. On my board, it finishes in
> the correct state.

Right, I think that was the primary concern at the time. Ideally, ethqos
shouldn't have to touch any PCS setting.

> 
> I have tested cold boot connected at both 1 Gbps and 2.5 Gbps, and
> transitions in both directions. However, this is a slow transition where I
> am physically unplugging the cable.
> 
> I attached kprobes to dwmac_integrated_pcs_config and
> ethqos_fix_mac_speed_sgmii, which are the generic and Qualcomm functions
> leading to ANE configuration. We see this on 1 -> 2.5 Gbps:
> 
> 464.233469 integrated_pcs_config interface=2500BASE-X neg_mode=OUTBAND
> 464.234778 fix_speed interface=2500BASE-X speed=2500
> 
> 2.5 Gbps -> 1 Gbps:
> 
> 279.018122 integrated_pcs_config interface=SGMII neg_mode=OUTBAND
> 279.019708 fix_speed interface=SGMII speed=1000
> 
> During the cable swaps, Linux briefly reasserted carrier at the previous
> speed before the link went down again and came up at the new speed. The log
> contained several PCS Link Down/Up and ANE-complete interrupts. I'm not
> seeing any evidence of churn or link instability once connected.
> 
> Russell's wider change is compelling but affects a much wider range of
> hardware. I believe this targeted fix can work separately.
> 
> I'll post the updated version shortly. Thanks for your time.
> 

Sure, I will share some test results of my own (with v2) in a couple of
days.

	Ayaan
