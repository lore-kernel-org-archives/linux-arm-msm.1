Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B83F4DF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192202; cv=pass; b=HeLTvuU5M91stVw7mHwUdykAaHel9DfFgmC0RUcqR6z7XC2HrrGj9rDOWeHelfnori0ayBmh2pDgcQohXOQQGMbQmaVwjrU6LF0IjbvPvtBNIxhwS24pQiXpTKbUZQXVhAnfI2oFDi4T4BdGIq5MNOpV3w8eVYc/+6t7GIaqDd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192202; c=relaxed/simple;
	bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emUeQP+xxjOJhifJvruX3tlPzitQT49GYq0HDFHbZbqluh8VPOunsLH2ICF+c0Cw6Gw8d0U2uspmeypnXkPQQLEemccE84EZw3XTwh7eK4tBLe4eM80C5I6yj2eSxNOw+4FhFR9DyeIRL3VpeT+kfD0Qrr+TCWgKMFWT26DaRPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6/qtwKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+1w100m; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6/qtwKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+1w100m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7Dbxi1995611
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=; b=S6/qtwKV/SiAF+th
	7VAQiiWcHyBk94yMfL5ag7dWZ1HPNssi/K1bKCbuy4AGVnoMbrHSh3I4Y1iO4GGd
	8CU0NwbA2Iy8C1HSe9riD/CgdmcXWAJFvJY+WSmNgF0z8XButdmM9Bvr8yuIfhgx
	YLH3e2r9gpiDJD3dZSbLrolni1ub9fToFdcyexRyvPBb51zQpsq4sgQhhgAm+nEX
	NqAaT5J6t/m5Hns/2BycD3ZbaHQos59JLzoG6h/YHbMre0kcFaFCqfHOExK0KHXm
	vreHDOjOh92sBZ/S+8BPLIvg6WmzFwD1Bf9xedWUTqT8rCE1ekwpTTmNGaohtkJd
	vRFnSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjvth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:56:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so84942996d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 01:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784192194; cv=none;
        d=google.com; s=arc-20260327;
        b=mQUusKNwsLnMDt0qWoZmQ0Ja9NQmF9gcwC8k81u1P4ky9xV7+HKUp23CJ4TdDZMGfe
         At1otspTbzbM5HKBYwFYE6u3q+EJ/cKPzw7Ukae8fF0Pi8+xbp97Otb186XfmEf4DqRz
         QR7ShcOB5idzo8XpTxiwWf5aXL4ctkTrk4BWhlU9CqnOTx3e7wmu5dtruYBi/uQCfs3n
         Ie79fesz+Z87nqYjOFAP+ZJUmviAZvDa6Z+9YNvBr8y34BUPHxd+odvAfhuQ7PuFpkNZ
         ocX3xIw9TpRmQ6Fb/nSVE2RbW2WqAI3Xh7Id41f+6LVkS33PcwIMQYkpGjse8pQgCnDT
         ZCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        fh=DsP3g3SxnI0TwOwO8td++Vtn8MChG8VBAYzTdD3fLo4=;
        b=mg0ASbt3LDdPQP5ZvOuVec7XIGs9sHw2Pm++8tknktjC0R3fhmLvMxT5APYM/noPSQ
         3apjcUBAK2bQbC+CZL5pbthk0af5DLXu7iokmYNybccO8s2AHULJ1wU3Wg2nbP0wScIk
         wKjenG0PAuSwoXNdtdQFQnu2+Njt7lQjtC4zaMpyE8V69SkZuq8uFk+Se/Q3uzgfa05G
         BZWiHSjHsPytFntWyfh3izk/jiEozhsUm7Z77S/BUTPyGoAMuXxzGANOCZvYCbNflqnC
         67tx35Q+T8H4Apzn9XjzCwxvOTMVb9FRIH+XIZyYkDJ4ZIKHrU0INTDBtbV89xrnAawU
         5RXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192194; x=1784796994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        b=f+1w100m0fzW7oDt/8U0FFRx5vS87p7xKKN4qjrhm4hgr+YaAob+DAfWFzlXesz0zB
         MBhnDQDM6h8ungvuZoDeJoQD7I/ENfr4Mfv5S9VugvDQ0NLkSiMjud/3o7QNIo4VyzzZ
         zhb4d+JnaLFfXohYFs/Qt6b2ppT7y9KQK9s4s1+b+Oz7Cz3au1RWF6zYNdjxovgqfMvr
         ta4m+0eU50c1CUOxrnc7MhRfLRRrGYUh0CDLcLz/29zE3UUqqQzVAog7g6ihfys4KOkw
         eWk4RSLOoObL1jZQFKO/b8TmgGG1Cl1OKshrFqCJ/Mvw+1eG/BUJkhR1F15xk5JkxRGF
         aNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192194; x=1784796994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        b=VhhgsBPQHcftsb02FSJ0pLLvrPqEjEv/T3mWoaM5yMeGN5KJCkdeEW4ErwzOHKefHp
         oAc2EJunzOq/p5LUnoVAxrRgR5Utlb03ufksAemMRnQwVTwyjBBNB3Mpfp/8s6FxI8gI
         NsijMnHZd37qZXNJwQfib7sSikMTRJjRHZAvLtLOUYEWrOu60WQcmErNHqSbp2lDgYWo
         byUm9nOVi+0cqPPnXA8nKKwRi9c1fLgT0iVCMP9le25alUlDHdTGqO/Y+umBoci3N4aw
         EBSEwJonCsdq2Ay416sYd8DoKFbRx7xRUWLD5Loa9hxg49em87dI5dzE82aNnP/Kq/bg
         fEnw==
X-Forwarded-Encrypted: i=1; AHgh+RrALBWw/152G8rdZyiFkZtHt8RU920taQEHJohdZsYANq411XS20euDuDJ4A6MtGghN3txbR5swaxz4+u84@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4+G3EWzY7yTIqZNQeNw3UTWXN2hAm4En9vk/F4xHdSK7tWKY
	yJGI6LFG0X8HwopYGi80Lthk26ftSa9cYnbdZcdxZEUUNaGY4ZnKYIN9s1SsBEtou4MSPgZOaRV
	mSlnsHn+OiQ8gVWRfeGyw75lVtWCAvtjskeg03p69r/FwVQTa1bNH8RnonkJQBcaZJX8+Qff4vK
	FrSGEB/JygF3Mv8M48mgOMaHqkwPEh5gajlVZZy64J1Ow=
X-Gm-Gg: AfdE7cnduZKMket8wKtwNoeRWO2GINiGPCTycAVCTCbHfUGwHVl764ez991u/O6G/We
	ydNRy3vojrMXp3A3/Wbd7KZ+NH91XFh+6aGphWON0dlE4TpwxVorCFZJh00QtXNKeh/ZdrChVOO
	rDZ5KYYRekKw29IqcDwRmRjLiscJr4wiHsWByWXz+TuPMxMDeS8BTGsKjmLHKF1XGvhN5F/AyU7
	MwHCdhG0IQlmOykeCMlmrsWgOhZIR8iiFwNAgf+RR1aYi1/czSrh/LLKdwXuseF+oEBVgeDjyRz
X-Received: by 2002:a05:6214:1c82:b0:902:e628:90f1 with SMTP id 6a1803df08f44-9074c6e5fa8mr121652616d6.1.1784192193665;
        Thu, 16 Jul 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:6214:1c82:b0:902:e628:90f1 with SMTP id
 6a1803df08f44-9074c6e5fa8mr121652286d6.1.1784192193157; Thu, 16 Jul 2026
 01:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org> <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org> <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org> <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
In-Reply-To: <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:56:21 +0200
X-Gm-Features: AUfX_my6CyfzbDCMixZ0ybaN2jQ8NmSLcHdbJCbKOIU7FiBcCg8_5mqZ43YRmKw
Message-ID: <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a589cc2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=IjkT-cPiO-FOTv-BaOsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfXw+zGD77LfSwb
 sG09oKU/S7LYC/q2KL8XFB1ATliijoeGkR+hIyFHXv4OHXD+HIRZFLZlBgxIu/o9wmOgngvf8ef
 SlR+5G3/OI90AIvlnY42Iej26j+cE5s=
X-Proofpoint-ORIG-GUID: Pk4d7-w5mgnPawMNTSCX9aMiXNHDLVJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX8gwXkvOWxR9K
 Z8owO2wzbzebVpnnMuupn7VJXuaSgMaBZq+dzVfFnq8CRgp4hRlTFgiBLn+XsXio9EFYMHNjhwW
 diW+HQrlb9ME2I7N0Ej4DR0/toG4JtVGIr3lJvp1L7SNMbEDblFYUjitYSsc0/fHtoFD+9TzWNo
 rfuAXuBLDmGuLkQheyacqsGcIGEkdww7Yu5TtRicvzRi4QIt1lAoTEixTDsCfsUuvJcCsLexsPS
 e/l3sGgAkv2JXKNiNkG/yHwVlbdi20Drr26C7oH/DY7p3mxNeR/P1pTZs4cgBXQdzEW5bWxVfJc
 2eb5uI0NLlBKSyWnFCclqV+F22Br7bGFuiRPXsQeSRgTRxuxFgEPjggTAqI81wF2hAjr88U/Gov
 gwQFro9T17qXa1vY1eHXQI3wztwILqyhTAkZdqibzVY5UywYG0y4Lntf8R78GcJBla2Yvoz/HVm
 W79YNMq46Ou1oMvQEzw==
X-Proofpoint-GUID: Pk4d7-w5mgnPawMNTSCX9aMiXNHDLVJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160090

On Mon, Jul 13, 2026 at 1:18=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 09/07/2026 08:40, Vladimir Zapolskiy wrote:
> >> As explained in the cover letter: I'm following guidance from Rob on t=
hat.
> > Pehaps you've misread a given review comment, because Rob's guidance is
> > to remove 'phy-type' property,
>
> I'll just quote verbatim "Perhaps putting this in phy cells would be
> better because the consumer decides on the mode."
>
> That is not "remove phy-type" - it's "move the mode into the cell". I'm
> shifting this back to the DT schema maintainers since, I take their
> feedback literally, seriously and canonically.
>
> Any of the triumvirate will do, Rob, Krzysztof or Conor.
>
> Absent a different answer from the DT schema guys, v10 ships with the
> consumer deciding the mode as per Rob's original guidance.

On the #phy-cells question, IMO we should drop #phy-cells to 0 and
derive the C-PHY/D-PHY mode from the endpoint bus-type. The operating
mode is really a configuration of the link rather than a hardware
description/limitation of the PHY block itself,and the sensor endpoint
is conventionally where the bus type originates. I guess this costs us
nothing on the driver side today, we only support D-PHY, so the
mode-check just moves into the endpoint parsing we already do in
phy_qcom_mipi_csi2_parse_routing(). It can be a minimal
fwnode_property_read_u32(ep, "bus-type", ...) sanity check and adding
C-PHY later is then a one-line case MEDIA_BUS_TYPE_CSI2_CPHY
with no DT ABI change.

On data-lanes numbering, I don't have a strong opinion here. Keeping
the current 0-based values is defensible, in this driver the value is
used as a physical lane index and it selects the per-lane register
bank (0x200 * n), so 0 maps to physical LN0. In that sense 0-based is
a faithful representation of the physical lane position on the SoC.

Regards,
Loic
