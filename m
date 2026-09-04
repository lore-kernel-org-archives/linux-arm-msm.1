Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6B4CC293
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555973; cv=none; b=KRVmlaXlmqO9JClqLXUl1m+RIpvzh9EcnizHCKfIGnJgCwdo1KgW6qbD7qPX4Ay5Va/UD27eaM4bci8wB1fb11C8PhYDmc2Cd8mnkjHNHPM+biv9+uKDa5xr1pI+cN2y1JrwwrhN+bQZy8nCR+PjDqHRk7F69TA4dhpRh3kqVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555973; c=relaxed/simple;
	bh=FAC+Zj7qwKqYw7fFM0u215FoV5ND4YX8fjub2SpnxsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko0aoL4XYcDe+hwkZjdwe+QOOGbpsx4TCNzCT1tJPJ+N+doYY+IZYJe8u+fnSCOeBtMZldDwPx73BX+EBl4fX3wBopNnCLIskuGhiT6+e65f7sf6F18Gx+lmTyrvtR7Ltf+EbyMWe4wbn3hy3VkQZ3yXnQERtUp5LGT4H53dYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6tqP/YF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfFUcfXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6tqP/YF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfFUcfXD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KbaBk1225801
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 21:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pmKN2/HQZks0tpmHaapx54nu
	pIE8cyQNKHSbzgNzJiQ=; b=f6tqP/YFyo1lXLN2qbefS6WAXA3eHAq623fvow1m
	GSNGrPJZg5nEgTLReHGhb2yx4uLZTnrbVXNl0kXlLZMhTuhA5yJ9hvnDZplw7nXj
	Kz4i8xIo3AGWJhWSEFIoDJNio5RbhzAFoBCnAXJQep6LcAClfkDmd3i3ZSAmXg1F
	qSpPZv42f5QJ2mLUzoa3mQyMvAy2c35UCAG12UgfnfGGFuQ0s34wvxW4rUCGiKfr
	ajgOY+nOGJvkz44ft2VqlxQtvdPf6QkZvjuuMybFBebozZfh37kVd4XrNPDe4L4g
	4p+ZPYHvsfN9QKUhKNqkGWuPklMZI+r7Y5pkwjoAL8EzVQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0109p40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 21:06:04 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b361b477f1so1049746eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788555964; x=1789160764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=LfFUcfXDFJwi+5YkT4M52caniwHL/bYpQlNdu0PsAVz3e4/1W/XhsIJYAOSUBOZrw2
         Nn0gYT1Dc64DlYR5WK2N2tdI/hWPyvPultb/+KtMmKvQdjscArhy9dLPXdlsBMxaiaxH
         xfoNL3Gway+KKGIaL4E4G1YaDrv+QlkNuxNr0s1SCxV/IMtG3xfzGJusnF4i6NroTSwF
         /HsXxs+bnM+MLaDWTWP9RdC2k0OdCKlzSvw89+kXdFKqIQnyPh/2Ma3PU8cmF1Uiqdgk
         UhSCL09wfFNMu4wVzak1s0GJkBzQaH0r1tUGDN67v3oWbN+47Kp48B+dYNcizhHk651V
         Ealw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555964; x=1789160764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=LWcWv94NZeaq+zDFUbW0y9S3vJZZjZGhLRhCMQOQEfZX/etSjTljHHL7/0PjlBQd8c
         QDkchlLfIjQ8L0NR4E9T4JfzSoZtG0Ekl8K0s0ME+eLy3jKpBquvdORTPbVaUDKn8hnW
         vUtNVcUml3Gq0xDMvWT0dv8H2ttxfCokJEhSU8t/cFqGW5TZUrR4rncfZKDOldqQFI/w
         TexhbcaHytfXtbYABgeYNdbwT6esFfUhqy4XDHc7y1rP65RIiH5qyouzslYCEHS7THeq
         rAWSgIl07m+Hj+BuoBtMfmQ4x9fCJG3bFHQ+/IuMUEgcsSj5uYSIayoPh3+RGIfHvpEI
         0YZg==
X-Forwarded-Encrypted: i=1; AKwUvBx1ohkrD7/wCTJIWyJotNqpZ6sAA8VtGRPf/h8dSZjHYovkWSGXkcBhR8t4r1+DfOJfdDY98EkcSg3OUPee@vger.kernel.org
X-Gm-Message-State: AFuF++khVo+a1GFRo1vzpZYuK9kQ7sSANn10A8r366+bsve1kaj72KJH
	nndAaLi9PpQOEYEoNwEzFTEnn6GCVGk5URMuT3oqXwJJnqCbgtnpjsA8tzYy1y9bFS/sJU9zAvg
	xfndXg9K3wL64cbCBY6+S3n/c78rMXzKc+e+Sc8BskRmTSomPDyqkbKDvVW8/JTjOGRCo
X-Gm-Gg: AYBFou3u1T0m+ajAemQviJ/Dy1S7HT1iFzyO3Zj5xHH/UjSUpuzXUw81zPaLffrJvlv
	9d6AHUowgfTFtSXXdTap3ajOUbLfib4ns6+LLfnyNj3eQcatOzNUBsLGws5y4Hb8NPB3QrLG+o3
	Ovm55ubfgOu5xKF8CsShUpgMxUt4D7jb+hnp26GeHU4hDF81Q6zgRnYRvjhIi62+SeaYM6089iL
	ciE3OC+Z9sBkc0bm5LmCSiQKXFZxDP9XY4EC1O514y8kZ5YeXul5kbLV4krM9TgCicrsv2iulat
	zUUAC/viZnbgNY3886wQoPzs7GkujD9RjIV4XVcRGYBJ7XluF8aNmOpC8PkirJZ7hq67IhVgYp+
	C+6P5tD82qxixZw==
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403503eaf.14.1788555964101;
        Fri, 04 Sep 2026 14:06:04 -0700 (PDT)
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403371eaf.14.1788555962494;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm8692399c88.13.2026.09.04.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:06:01 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:35:52 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Message-ID: <apsysH9ia4x96a2g@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OCahd7y9dPKhZV0kfb-lj5zI0lWUkbI1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE5NSBTYWx0ZWRfX8Gp6+YpdNPu+
 nex2X/GGxUNHpmoJjLgFFLyHNFiJWh0jRUim32Z5J7gA+fGOjZtU2PClnoJYz3zZj3TgVFZi9rj
 4/Xg+y7/dC3MEANcPiGRyYsAC4+wL5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE5NSBTYWx0ZWRfX3FKBq1lUOzx8
 JzVocp+kDEaXQG+Ssi8gPmfa4IrzjGkxnkCIKs9KPVzZOtqyxP1+nWxSei1Dh8HWAPZeM5ncfqF
 CeE4Eua1aXqz7KmqIrCDW0SZNO388w7k2oBQG9wHvYLAB1qn8Lj5G8OVDfZMFIj/bMQq9NdwbVN
 i1gkIBILLGc4mMTgMJ9s+vTQiExR5DfSDLdd/QVAiYHUvsgBn0P1JinC/R6eAU39Y07/YFp67dJ
 /kJrBPLY75rUJtn8pVsFyjFcddXAuglopaZ5sNIXKE5nHc+nAhPXDdzXWJhFuncmn3Bm7BZpcQO
 vLuphS/G3sRZNZLtkjtDPmoBdhd6S0IQNvTX7xEl0ILHRRTDIBV23JW53Xv9QbsYKnmg5JLi7Av
 99U8XPXmgoKOnuyon4yLHj+BwV4nwyA6slPF6PzNGdhze9RW1UrdG++aDGkcRjP1mrxQ9vEv/0e
 CAOeurk0YY0woh86NVg==
X-Authority-Analysis: v=2.4 cv=Zp7d7d7G c=1 sm=1 tr=0 ts=6a9b32bc cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=T3LL355Ksxp6dEOEn3QA:9
 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: OCahd7y9dPKhZV0kfb-lj5zI0lWUkbI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040195

On Fri, Sep 04, 2026 at 12:13:42AM +0530, Mohd Ayaan Anwar wrote:
> This series incorporates feedback from the RFC and adds the dt-bindings
> and driver changes required to enable Gigabit Ethernet support on the
> Qualcomm Shikra SoC. DTS changes will be sent out separately.
> 
> The series has grown from the RFC and can be broadly divided into three
> areas: PHY power supply management, proper support for RGMII ID mode in
> the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
> required for NOC access.
> 
> 1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
> power supply. Patches 1 and 2 add supply management to the DP83867
> driver so the PHY driver holds the regulator vote at probe. These
> changes are largely inspired by similar work done for the QCA8081 PHY:
> https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/
> 
> 2. The generic RGMII fixes from the RFC remain. As suggested, an
> additional patch now emits a warning (patch 6) when the legacy "rgmii"
> or "rgmii-txid" modes are detected. A new change (patch 7) now
> initialises the RGMII link clock at SPEED_10 on probe instead of
> SPEED_1000, dropping the unnecessary 250 MHz source before link up.
> 
> 3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
> required VDD_CX performance state can be propagated through the clock
> controller. The Shikra binding (patch 3) is updated accordingly: an
> if/else block constrains Shikra to exactly six clocks and requires
> operating-points-v2.
> 
> Testing:
> The following boards have been tested with this new (proper) handling
> for RGMII ID:
>   - Shikra CQ/IQ variants (with the TI DP83867 PHY)
>   - QCS615 Ride (with the Micrel KSZ9031 PHY)
>   - Talos EVK (again with the Micrel KSZ9031 PHY)
>   - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
>     regulator for the PHY power supply)
> 
> Changes since RFC:
>   - Two new patches add supply management for the DP83867, replacing
>     the gpio-hog approach for PHY power -- Konrad, Andrew.
>   - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
>     operating-points-v2 for Shikra -- Konrad.
>   - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
>     Andrew, Maxime.
>   - Updated binding document for qcom,ethqos and snps,dwmac.
>   - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
>     "pcie-tile-axi-noc" as the only additional clock-names.
>   - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
>     probe.
>   - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Sashiko raised some valid concerns, I will update the series and send
out v2 shortly.

	Ayaan
