Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519EA40F73C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728192; cv=none; b=tcRB4r0dqwK9uji4dZSDv/tqsmnHUDgNa6z6TeRws6tPmiSZ5xwz5JWArpSjvfb1YSPvwYaM1SPp3T+m/H7CwDi/AS6DRdd/cq+FdZHT6zQFu5XEs9oG0M2iEF+piE9J6S88d6kQywAJXq5WUtjJVBdLil4MNR9v+xF1ScykubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728192; c=relaxed/simple;
	bh=0RsMLv0O1tmrJZtAg5LMqmzKOUq6x7mTc0BWDJmg7/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6hC+Nl0SBOiOVIXlhMFAUg5txhXDqR7ylV2oY4JuIBnzTBpKC7KA8JUMubQjesvod7N7SfGZyKkuQ22bo6AZmB6QZlwA0vfKJixqA0oYlQQK6sh2rphxCip0h0JiMpH4ECCZEBRlT9wRKKxvHTh0bd3qu6NViEiUfgJmnYO9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr5fgvDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ8iMuez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr5fgvDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZ8iMuez"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWjv3891992
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQC1jvB8zOlwlP030LDDWgAW
	3PkP4UID3AkRSP2t4JU=; b=Hr5fgvDUlKu8VaWUzKKUPtnoMkrD5UDqJjN3uqsm
	4LCZZHoFy+Ke7D9inNjlgdfoZeBHRgPPQj/mpqYdQCBZCHp5Ds5F9Y05QUq+oTja
	XyL4/OnK/PZy0SsVaOtTpebc83L3QmTisS38UHOtIzbmSZvR9GpZt5wjRkAb1RJK
	5P8miUOeR3ApkH3kW5PQAvYrGn+kc7A4VheF9ol4GIABagzmC6HEUFNN9hMPlRxm
	rk3yXpL5wDhYYD5uUe+CDGRtgmJ7pxyMr8k/irwJ2tLBzRauOfw8NQei92RFIN3e
	ZaFmFjrsZGLGtJDpek9eUcbulDSmIjzX4VnQB8QBgEV8ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm104t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:49:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso159822991cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728189; x=1785332989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQC1jvB8zOlwlP030LDDWgAW3PkP4UID3AkRSP2t4JU=;
        b=BZ8iMuez6T+1Og2czCtkctUZS+hh0qObmkCoSx/7HeNAZKXuIE5HhgKQqwnQIxi0Hf
         iLkKL8kohWhdSuUGjnPTUc6HUzvYmd58kWMfgr+aAnHGz+LZ2winf1jhqqywvcJxkNt8
         xUHWq9NBLygER4NQd3u/tKRArM8Q5/TAx/cStnj98EQBZcuQJ6f5RxRiHjaWO0dnwyyb
         5GQuFubla33G9zEGmB1M5sFKebaD4xjiL75LMPlZ03OzaDUTa8eLfRWcXwMmblSwpTXw
         qAQJMHcnB0YU9rK4VwBQN2eD5+JQIt1KaXNQf3PMOrqjBkauvh2AGHIwhVUwViIHDLs5
         1q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728189; x=1785332989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQC1jvB8zOlwlP030LDDWgAW3PkP4UID3AkRSP2t4JU=;
        b=pdWRbVrsqD0K3mgBkN8k+rCfRh3yqZu4XWIJLx0sBGht/Mt1P225oOqA8gDyjfZRkD
         l1ru0GLaHpyWrs1Fz3O/9Yx0dzyWrUgS7fYdVUWABEf27aksPPxnam1AotIICS8F+i31
         rauX1SpajRiPuD7yGqbHKF6X84AeNkX0oWu7Vn6LZka/JxtM2FRoLcdpuB12fV+r8sLo
         5YfiZkFw5MUGO0f0V7Cr7+Mu6az99uZwwRR/Wfk/27n/v6B/R1rs3uQG3MWhcQg1W40L
         I0mcFlIPtLZDmQHQIeWHjFWz5Dombw+YwCz3CKk2fGXSyyp9rNdsgpY8M/gi9tIUAL5h
         lgjw==
X-Forwarded-Encrypted: i=1; AHgh+RplWK7uYYA+xR/3uB2y0fi6fUByIXeYSreqg6q4bttFRtzNVouUbywLBduYcSn4r4v+zxhsEXTLEVP8N8oS@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9D/2TrLpgZVuHl7BWH3GPAGD9rXvj+Xhi7EL+u7Pp0BS0Wf1
	jNRzRh8W+fRxXy+jxp4od0/mfWdqU0uJFuKpYGVy5CUaLJ4yochfckSczt1NKXa9+tkvFeVh+15
	DGVDCf4X8BImt6ibDF85Ki5nslrciMqn59usBNCvTwI4efI2jPX2fqCuwHXEy2+odBV51
X-Gm-Gg: AR+sD12yaQykGcmLyEe/ypBr5gpV61Hc7HrP+qhDps/FipPq/IzFzn98Cp8/46saRgh
	3LtKWX+h6MYHHqE5WxM4EgU9NcOubQYbRfXp51N3HXdsnrJmoA2/njS6ks8t3tXtu7ejTRdBnSz
	MpBeurh/tG6nxVBCuAIDMlJnmzcalW/D/uJXbNZs8w8HIgqb0252gtU1/xHW6f8nCxZBkkPY2z1
	XE0TOXU1KI55log1G1X0jBSg7NSQPP4flqGIWbP/tXWwHS09vau4plZQXSYbVhFhWtKgzO+rLB3
	F2mBwx4ctPaHfUz0Fu79NqRthNwnvGsGiBWudx2KYKxU5q1qPiKV6ADpWMzOwdPOQgzk3qmlFwv
	KxGpinnd5UimFb0qXW5wQejddfCJ/8x8B7sS/wJRIss6ahtS4i9+1dnroJDFxAwHung2NdKu4t1
	lTV40zI+tN+yX7ZA==
X-Received: by 2002:a05:622a:48a:b0:519:efea:cf41 with SMTP id d75a77b69052e-5213c20521cmr216204081cf.28.1784728189201;
        Wed, 22 Jul 2026 06:49:49 -0700 (PDT)
X-Received: by 2002:a05:622a:48a:b0:519:efea:cf41 with SMTP id d75a77b69052e-5213c20521cmr216203731cf.28.1784728188742;
        Wed, 22 Jul 2026 06:49:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9ac98sm518677e87.22.2026.07.22.06.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:49:47 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:49:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <hmqt3rwlcx23lndkeky3ykk6or6ibfm7si7gh27utexeonxzqj@67yvhyey6oje>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
 <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
 <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfX0Yst4rIEJj7k
 9paP/IpkFVZLJ+jadk1wWv8YnVgLmoiUGjv7SjN3DjkWJQSFW6N+Be4wwREtqCEYSj44H+iZS1N
 WkSFTEkRdYBkb3+hxwWOZZacl07Um40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfXwCrhNKa2m8+p
 INxFl34wHfwaW6dX81wB9Uoi3PqqobPI5iJczEhI7/2zxCnslUXw17wBbBZ2hTWFNdfKFX7mEPv
 EGM8Mt1Aln+7n70TF1gacQIjTasesMcutz7XtJE+lWZE6wLkfosoxcM7fGsuZ+rx93Y3BeqvMg6
 eFR8EnhKC/D6AVC4WSq4Hg896UHrM/TJw4tANRiNyymE/xCuHJCBpdCKMH2/LR7AgEa8k/oM7os
 JD/xkgZkptADgntbYjT50/Kb6P+EAJ+mqcsYy0MOKhm0ZXEsb9GJYjQvqKzpeewHl7DlB+Chaym
 0tJ2slpTE7KV4pALYQ77Z33smIsLfQlW34G96gQXpoHhQz0lqykBaemL5THfmiwkyXECzqYw0zy
 Kw1GfPiJH7cZWkhdtvEk2euuKA61czL0FC/XYsgTAVQkt2kHQToIPAGWsgCA2ua/QvRVKfMEx05
 wWzuPHxZ2rzkX+Iu+Rw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60ca7e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3YUFb16USFhe2vDX2WEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: h5jpj5O7jNLvXzDlpBMqUacgLYXSG7Ff
X-Proofpoint-ORIG-GUID: h5jpj5O7jNLvXzDlpBMqUacgLYXSG7Ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220135

On Sat, Jul 18, 2026 at 04:54:07PM +0530, Mohit Dsor wrote:
> On Fri, Jul 17, 2026 at 11:17:10AM +0200, Konrad Dybcio wrote:
> > On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> > > From: Mohit Dsor <mdsor@oss.qualcomm.com>
> > > 
> > > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > > 
> > > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > > 
> > > The bridge receives DSI output from MDSS and drives an HDMI-A
> > > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > > 
> > > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > > ---
> > 
> > Does the other EVK not have this same hardware?
> Yes other variants have this hardware but only IQS variant has
> DS-HDMI as default, others have DLC panel as default.

By 'default' do you mean some DIP switches? If so, please consider
providing overlays for the bridge to be used on other variants of the
EVK.

> > 
> > [...]
> > 
> > > +&pm8150_l11 {
> > > +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> > 
> > This comment is superfluous
> This comment will be removed in next revision.
> > 
> > Konrad

-- 
With best wishes
Dmitry
