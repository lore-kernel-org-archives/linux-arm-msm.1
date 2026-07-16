Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BB3BE156
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201298; cv=pass; b=SDPB3XBdlPjrIn8F8YrsYw0J0hSgi45Cz1cpDYS3exMYVfEtzhefUAVzO4eI3krYhI4rcllnjdmgV0GNbbC9FMwAbYqXpnxaCcUvpYUfghcGp/rApvrv1eaVLY7WCnCrTYFrbuyvebdJjjWlePmgf/U7GwzPjn9wtFm+ZRgvnA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201298; c=relaxed/simple;
	bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/xoQ3b/q5T4xVhb2atD2qe5VpEBGI/YY8+GMnC6v7Ik5yadCKkvQSXXBQma0J3uQi6nob6IJ1XxGhyzY/GS1zO+Q3kMGI77lIs2a7uk+o9tg8G0oXxTfWVD9CehlNO5KKwCohx7Bp4gku7jmgTCQLGRjSH7pLeryHLC1CsWQ1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxAzmjIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXno1JSR; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxAzmjIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXno1JSR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rYQ12260445
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=; b=VxAzmjIzetTRzrYq
	bXw61k0o2iYTG3bB0y52Rgt1UGDnFcfVE/yJ+V7MO/u9RvreUYYfNfGir7uBrqFt
	Yc5No1o/Dq2AAZo26WlhTGGFKmFEcDIgI6Aqy2U879taTA8+Tly43ITAPzjfjB4d
	2lRMpQEeARS8e5gPflo+21O2I8olK+t68e4rrBk3iwJgVFr0S/Rg8a6azLnLIChL
	ISVoNRxQN4/KC4GGqT0ISqZ0J7ld311RJ5jk4BBarosegULZ4/ioHVU2qrRqYFNF
	SzOFFpRPWNZszxRha2OiATSINKtdGz5mPttWjpOsJZUYgyfYpL8EP3SsO/cZzBCu
	4lbo1g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0j5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:28:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e97889ac8aso83080296d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784201296; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMs7aYc0858d7DoQeyrcpkgHOZI0Ak9NJjq0c0rOjMTHhEI6gI0TvX2KQqb3+dlIBh
         6G0+oGAril/9EODMXc+1uqlh4yXzSvQpPp2VAmTuiRJVhyRpWzcHYl+u2cUzjaVwuQD3
         NpRMNbb0VlIq9D+BI5c8lT+y7pat597edMmavx95RrvjGTLdutUTtPCpiB5kVIj8AwaE
         0iq8j2XR1lz0KfGNHwC/DB+QyX4gEM1hSx2GYuxYeRpGKOcjeXsi4tK9598Xa7luAxrP
         l4HomKRoZ9x699zZNoxB4QA/8+E8dertq5ea04x9FQK81zVXUm88tbWJo2711llxzyCg
         4V+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
        fh=IM/Cf2CQ3vopNGnDKCwhXDTySleDTiBeYHx+Wahq70k=;
        b=hITSHEMaEZQ71TEWxXCzIhQEVBJl2nPSw/KjAZ9ORdZ2pftgoLqYGYIVStfay/Qui5
         wpn+EijaTQ6aaf1itwpqEPX6VboBrIy1MRFeOfQNRkXPWb1jx4FXHpRBv1uVeKEmlz6S
         B4A44i50wwSzME6UdnceAvP+k7vRMomfVWss3AmG3w61nIvt0eGjDMRdH07wUUFpLCkn
         YFKnO10j0wadFuFqtnG/JzrCpvgX1A4roCH9SBxYRkKCQZ/1FiOMYo7XrlAfp0rqXGTR
         ZuHTZA5SB51afce6Y9no2/pFheW4pyjHFLh9P5iaTj4sAck08rQPoc13JfhnmN8RgeYp
         yLEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784201296; x=1784806096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
        b=QXno1JSR/Ej8o5stpSEj8HsErAfQUTGjSokYQmYsbxEkWnK0JEJf7mA1LSOWFJcMhW
         2UToe4210EuUBCY8CSj9ox52tcwKXxS+kzIg2r7jqhsw8iJqXYaWkCs/zAZpTGDp3Z4w
         q8Awxc6cKUeqaZ+mU3uT6ujinBMgUOdF8AelMPXBOJbK+WQ2kPHFgUvISsiDUM/mu5cf
         PNqmJEfaOHj4SsT+t67i045zKSKVno4X4niDSxEwLgWU6yNRCWfdO0J6pUXXK3s0oUiW
         kS4sb6GkR7O7irnwL8zD4N2vjax36Aff4989d/JnJTiT5wZtDxcqaX6RmhyQliI6Hema
         IKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201296; x=1784806096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg3EOuAb4No755sn9yN0PY5sz3j7P8zitmFGHuFMk+o=;
        b=LbLH9WgK6S06E9aa0i7gTiLxC7iQEEpAKKXG19UWSTbT49QsNnfVUU86sqdTcuvkCH
         /jetvZ9HA9ZwWMuG9vloZ5MMmY9omjYTg92PHZIEEU196dZqTn/bigUP+5vKRoYUSJbr
         Zw03tUCs35iOgOC6KQaS5+Uu3jblnMzxUrcVcy3ycNjPUha/ZmOP3ISBOik2Cr/1pHQM
         rvJ74exQorTTzieVaQvRrmolkVeHwWgnGgAUXhq7/bMWvTwPE9HBVqnqFZqIwrX9XzEH
         YrqU+BEda+D0qrktX/I3pRq/kcorpAfWdShm4w59DQbmZDX55hHmq3Dsq4R90nu4D26X
         UUfA==
X-Forwarded-Encrypted: i=1; AHgh+RqZfxxW7WAnFJ/ujH/xS3GuZNj9J8N9KNnKBIGvYioTDHyokBtrHavars/DF7+iFiOEvDkmGIqzB5gzs55C@vger.kernel.org
X-Gm-Message-State: AOJu0YziEk9s6r013CTuCCX0DCv3oRaIrVokXcaagkxC/totZHotN1tk
	Ty2cgvZhSlAqxzNLt4i1b327N/RDaGsYemDqEfOejt1egn5f8UaNHAZJ2HIXvYlV7NKP1KFZaKa
	67vPJUg8D+s1Q/obXzXfuHg+kpUnn2eI4/8PRFHv6tOMNslRft9I9SjFXoYe8qpc6u/jvkWpPGV
	EYkPKp3cE3tifzbW2nzywBNMMlgZudQybzKMOGkESGC1w=
X-Gm-Gg: AfdE7cnFDmRg+vuGzyGQ2Yetk2mLKQxyCnDOA7iB+ALEciB+nUt8piRFH4Ou4Iq9SvY
	p0pLIGB8jADIjR5kzmHJhKWsKOQnDIA2mcMWTbmk/1FpCFVQtQe6LdOBqwx8kpPcg3zOh2S8QC4
	MAWYoevsEyQYAIcuZbIcGhYVNscXt1utkAa2DMrcB92GiTdSQ5gKeRvdGaMr8rnSunCZrcooE3a
	Rwlz9AqTOuGnfjeny2LpG5+uk2JxdQoybC3BJUkhMxXGkRRURvB9FfWCCQEhEaiOxgqIQdVowC5
X-Received: by 2002:a05:6214:5a0b:b0:8ee:ff2e:c2f4 with SMTP id 6a1803df08f44-9074c70b5e6mr114234266d6.17.1784201295749;
        Thu, 16 Jul 2026 04:28:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5a0b:b0:8ee:ff2e:c2f4 with SMTP id
 6a1803df08f44-9074c70b5e6mr114233906d6.17.1784201295334; Thu, 16 Jul 2026
 04:28:15 -0700 (PDT)
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
 <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com> <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
In-Reply-To: <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:28:04 +0200
X-Gm-Features: AUfX_mzCUaE-2PIDQyd_wAhNS8c7YA5-o4bK-e6AcG3qbxAKGuc-Fck3JEyVR3s
Message-ID: <CAFEp6-3U66hvi0iZrtRbyY3B-uwEap6xDFHFkVoaEBwWhV74Uw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfX8WAv/6Dde6z2
 hxNxWHwsKDtW/67L+F4krltZtQbNOt/y91JKl9diJCAS3ggolw3+RZf3+e7Yjtd2EmgXygkkUVQ
 aJChTsbA3DHeH61J4q3QQMhpT6CP9nfFHZZfQl49znAuHdPthStuOJZ5fxPeYnnOWaP7mWxB1wM
 OxXLgET4z8L3YuDiRcnREqZOVLe/6BTmZqMTg4+U1ocBB8JSGPrf+Tgh50Qpc3c56fkpSEdwrCz
 FOFmXek84kpiNOn98/2Axm89QDdGk291HIC/Lj31F3t2pXnA7mk2SjdXQyNnrVSJRKHrYAu6rt9
 UkDDuqxuVc61udkZKclS9azCGPqfeMg6FCwjFlcQDAzMVTlD1lNF3qElMf/wrJqUUMbgAMUVScO
 01ws1srj6GUnbsD7vZeOYK0FwBRWQOirmEI/pmVh376RU+8nd9q+7FE34SZwcb/4OGnYo59Zvro
 E0ie9RcapfR0CwdfzIg==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58c050 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=64qUk99jZ6gqxPINBu8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aOdHfGR3ZbqSIiEiu3KwFgllgkx22g8h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfX/digAIGAuWmq
 kcIR87cpPCZsiSkdpXgckgr3Jo1kZCn16yrZ41j2k9mkZqdLk0rnnvMYpMVrSrM6pH9RvnAFdvz
 VBeXpkQjgUutdTkk9vI5qKBD64yXIlI=
X-Proofpoint-ORIG-GUID: aOdHfGR3ZbqSIiEiu3KwFgllgkx22g8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160118

Hi Bryan,

On Thu, Jul 16, 2026 at 11:42=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 16/07/2026 09:56, Loic Poulain wrote:
> > On Mon, Jul 13, 2026 at 1:18=E2=80=AFAM Bryan O'Donoghue <bod@kernel.or=
g> wrote:
> >>
> >> On 09/07/2026 08:40, Vladimir Zapolskiy wrote:
> >>>> As explained in the cover letter: I'm following guidance from Rob on=
 that.
> >>> Pehaps you've misread a given review comment, because Rob's guidance =
is
> >>> to remove 'phy-type' property,
> >>
> >> I'll just quote verbatim "Perhaps putting this in phy cells would be
> >> better because the consumer decides on the mode."
> >>
> >> That is not "remove phy-type" - it's "move the mode into the cell". I'=
m
> >> shifting this back to the DT schema maintainers since, I take their
> >> feedback literally, seriously and canonically.
> >>
> >> Any of the triumvirate will do, Rob, Krzysztof or Conor.
> >>
> >> Absent a different answer from the DT schema guys, v10 ships with the
> >> consumer deciding the mode as per Rob's original guidance.
> >
> > On the #phy-cells question, IMO we should drop #phy-cells to 0 and
> > derive the C-PHY/D-PHY mode from the endpoint bus-type. The operating
> > mode is really a configuration of the link rather than a hardware
> > description/limitation of the PHY block itself,and the sensor endpoint
> > is conventionally where the bus type originates. I guess this costs us
> > nothing on the driver side today, we only support D-PHY, so the
> > mode-check just moves into the endpoint parsing we already do in
> > phy_qcom_mipi_csi2_parse_routing(). It can be a minimal
> > fwnode_property_read_u32(ep, "bus-type", ...) sanity check and adding
> > C-PHY later is then a one-line case MEDIA_BUS_TYPE_CSI2_CPHY
> > with no DT ABI change.
>
> So I take your point on link-type - in theory you can select the mode
> from the sensor @ config time. The established practice is that the
> consumer decides the PHY mode, so if we wanted to make this a _runtime_
> configuration - then that should be information that is passed to the
> PHY via configure() not via DT because we've said its a link-mode
> abstracted from the DT entirely.
>
> In the extreme case I have a user-space utility selecting sensor mode,
> which the CSI controller parses and then signals the PHY to switch modes.
>
> If its a run-time config, then its a run-time config and DT should be
> excluded from the mode selection tree.
>
> I'm in fact willing to entertain this idea - but it will require passing
> the PHY mode to configure() not consuming - DT data from the endpoint.
>
> My core point here is both acknowleding Rob's point the consumer decides
> the mode - and _if_ we go the runtime configuration route, then actually
> making the selection @ configure not at probe/dt parse time.

I agree this is/could-be a runtime configuration/negotiation.

> I just wonder if there's any real upside to all that additional work and
> delay/churn.

There is no really need to support runtime configuration as of now
since we only support D-PHY, so the delta for v10 *should* be tiny,
either a bus-type sanity read in parse_routing(), or even nothing at
DT parse and a future configure() branch when C-PHY lands.

Regards,
Loic
