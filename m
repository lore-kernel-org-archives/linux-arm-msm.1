Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA083C9EF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650758; cv=none; b=PodrY4/y/7yMz3LyfnTm17TMlaAt7+vrmOX7bFDf+dOa4EXId64XI6pnMob/4HrXp1KXptsEujjXRzAKLQvu76MdIE9AUy8yyM5374D0ml8oUYBtmIkGWjGuLRRJMrkI4MTOd8w8CJ+q8d8YwFYriU9RD6cHsbuXpL7Yac4GhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650758; c=relaxed/simple;
	bh=bZjqHPq+kKtEvRUgcS5nYdowvDTyVzF0bY4PH2YQgsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYsl8rmCMWbQL9d8EpSoQozGYzvRF6JV/wpHAHKIfyT+gWlryJU+TneDSwWWT4FyDbysEx4CWh48ZPcAhcxGrsMl6j/TuyCu0uz1Xff3YUyPA4eBBh9XFrQxpSzIjx/hCYAirFfkrfX3zPE1DPY8uD2NI6B2USsiNirtFKrRh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4qhfT3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwqU3OZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4qhfT3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwqU3OZS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jDjH3459160
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGL4i0Vh34TvmnFiOz4aEaIZ
	+3T3CWRBcD11HAYc8YU=; b=E4qhfT3C/xxxrGd59AOf9r7IbhKCgG04e2npbO99
	TjB9lnwp+RSuOdOEq3xNM2gWpYiYGQotHfVvQug8kxamM1Sn5X14C/5Oqfsy6Vv4
	L63EW0fZMJgPNU2DPvxM+l1CQO5vNiKonsM+q4RxIaPJursf/mXTcRjaktnJEufQ
	pCS3RSUZZ1zzBvQfcFalQcci2TS8rD4oZMpVEkCIaipUExNrUacR+epyQWM94WVK
	HmxJMFZ7pF1bF4hCgGYlD2x2VA/oamT09OqrWquqb9MF0UGcXu4PQ015MoG7BUzo
	eFWiMQBYZhpL5vSJuJ6u5ryY8TiFkbxpZmhLmhNv92LRPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkutr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:59:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso835380eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 19:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790650752; x=1791255552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGL4i0Vh34TvmnFiOz4aEaIZ+3T3CWRBcD11HAYc8YU=;
        b=TwqU3OZSjb77s/u0xxsIetujl1PfX0NO8kDm3rsk6gT90XnBQk8eGbPHmlCyu45A/r
         4EszBQGbIfQ5+yxx8s4upwtHpceyIRZOA6Gx0tKGzYIfw4hTIv/qd9q5zA95GV2FQ3Fx
         ra7RV116yDdfnjgBkcDqC3rapcaY6Bf3KRbXJ2JCsDCRPjZ5rTHcqhOFQ+z1pvNG9Xkj
         EH/tc1RkoFmjilgNRTPJkCoB0NY6Z6EJUcBPlh/YJe95W8uof2MgExtCE1ttDCZsyTRE
         z8TdnTZavUzEgW4/0O7GXJITUMH1RPsMEXmJO7Cy8zFrzUYUqxfDRuPGLqM6tXecLNT8
         kc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790650752; x=1791255552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGL4i0Vh34TvmnFiOz4aEaIZ+3T3CWRBcD11HAYc8YU=;
        b=Xl6HYdJNlEjoUHc/Ug24pXcZ1Cw9zXU+NX1l1vtHsVtt8A7470LNcWYsJ3tF4sPanx
         e8J5DXrCHQADFoPf3wD4yNGwp56GgJ3orSU9RAB2vUqBfWwiUmX5PzA3zPz0M6964Ac9
         uWdneuGBkqqpOxgafwaUIPgq16sptoxOqYhuzZBl0+IsdYtmRVsdjnrLo36FKKOAc1WB
         Yczv2EYyh5SdyMOMZgmoYfKRKnOrm5ZRwYO4nCMihEAqjJbfMdt4xsA9OEJjG+XKUwvG
         xZ+btjzWfMsEFlw7qROuT22RD46l8EbxriPluHGX1mT3fr07DsRXWfNF8a3t8OyaqTS4
         E/Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzSK+Fj1uZ9krMhfFwDG2AF9PJ1FgI9dpYaHOYR4qUSY6AcnsTyQ6IH0FsP87aVkSr0AfRdHNNFZiRdRrN5@vger.kernel.org
X-Gm-Message-State: AFq9FYJpAavUGJJHHmTiKMrbR1v7hzgGV91klpzVySbQYXpReyFcnUAM
	2qCmwJkK6vNFBP/IwfQAHESzri60xS4ZqgEij5iwjsPw+0eMo+n/H58OUAoDqS2oQq/qwXvmz9x
	67v4QuAC71wwrmAgUpnI0egn7eSjtGACUsZm1rPOgdydUUj9fc/P30i+CVjg8A+ttZ9Vj
X-Gm-Gg: AYBFou0geHUGFARa3dbFHYljqVjaBFineqC6M5pdjLBUs8nRF/aZkVwIOdMEdCcPk7r
	0RvwO15ghDc1UexWW15/dqo9twzUHlFhf2LrjkSM0bh/nmF6FduM6A7Co/2TPaMGxKCcvKBljrK
	AM3g0632wD74prsjObZOlcKzxiTf9KD6+cbYODC5TOtzpZtrcbotwRWWtmPkkZB9RC4Kj4nIB2h
	Otfo3x3qmJu12caCSJ2k6/ZFAitsHPrCIKIXC6s0ickMYErCpIq4DDqWC7bV8XECuux9d4WKnc9
	oCXGwVaWANtXO3i3X45QuMiIe9J0AD2ZewN0ueB6bLn41R/Bxawuz2BW7nf4EuV4gGc+VzpB+t9
	dIo+DBx+H4D1AvdPlYKkPZymM3JhePbLwAxXZWXxLFQ==
X-Received: by 2002:a05:693c:6219:b0:341:2c6b:8c97 with SMTP id 5a478bee46e88-34af8240040mr1632462eec.12.1790650752298;
        Mon, 28 Sep 2026 19:59:12 -0700 (PDT)
X-Received: by 2002:a05:693c:6219:b0:341:2c6b:8c97 with SMTP id 5a478bee46e88-34af8240040mr1632430eec.12.1790650751743;
        Mon, 28 Sep 2026 19:59:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm40861471eec.22.2026.09.28.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:59:11 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:59:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: Add initial support for Nord
 Ride Embedded board
Message-ID: <arspeToktu1dTN-0@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-7-shengchao.guo@oss.qualcomm.com>
 <arrnd5wzif1ALS_z@zenbook>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arrnd5wzif1ALS_z@zenbook>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMSBTYWx0ZWRfX/Y2LGk50ToQK
 MvkGZTpEp4QRQ7sCw6gWdgCWoXX8Tsxz1N/zqxrKm3xxIh2MqGZhHDh3g8iKEuy2AcOPF2bU+cl
 WtyrkjsNdwBzbqvW+X6FoUwSF6VuGug6Efqr8WhJppdOlHQhZsnYUfVmobN8cBTrP4CsyEBzXF2
 chJhslJZb1vmeulSVTS/4K04AS73PlG07mDj4eX92VUlzUCaqGtfQMnbnyRIvNkaXT3YnDY7thj
 WQ3Pzfj0HdF4qY/evE5xBt7LciCSuDTHTE5W3TsFT7Wo9vC+FJlfHyYkaU1eFkzAsiBpYjm6WdM
 auju6cVPile+5wdOOfyJ53ec7EH2lNOdhzAQOOnYe96lPK9HB6N9mZ4tciKi1NnFrfQ6eIuwKcg
 D2zTM1FBs6Ed5yyYlxQ/E5opm+m/glork5Joe3T548d6zlb/Fhh8jJVHWV1kaMdGzYhpLw1CniM
 sbTE0jOqeJYOGI1A36w==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb2981 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q5kkgCCaI_byO3yvwtkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: dLWOMuXil94D2wHb3PbQFbTnWMkgW6DY
X-Proofpoint-ORIG-GUID: dLWOMuXil94D2wHb3PbQFbTnWMkgW6DY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMSBTYWx0ZWRfXytQa8f43dOvB
 6b4td/XFn+QxLYeBNmUa9xDmhM4RcyvCnedm/k3e7gAhyIwWpKgTpKFQRyAC8EdQe1OVStMdw7n
 PJj/HVk7+Dwqpyu1kpOA+jt+6+vPRdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290011

On Mon, Sep 28, 2026 at 05:18:04PM -0500, Bjorn Andersson wrote:
> On Sun, Sep 20, 2026 at 04:49:20PM +0800, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > new file mode 100644
> > index 000000000000..09ee525764ef
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > @@ -0,0 +1,442 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "nord-embedded.dtsi"
> > +#include "pmau0102-nord.dtsi"
> > +#include "pmm8650au-nord.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. SA8797P Ride Embedded";
> 
> What is the actual name of this board?

Ah, I can see that "Embedded" is indeed not part of the board name.
I will drop it, so that we have the same "model" description as
nord-ride.dts.

Shawn
