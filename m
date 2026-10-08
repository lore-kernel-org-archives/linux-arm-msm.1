Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E411448BAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462126; cv=pass; b=ECe6ONGDQIkOOFYbsCoO8Z4j5NlFx2dJgz2yz0bFDWHEkWEk4Q8MC9eOgvIyI8XqstxhecWxXqBdeZP+fAt7kaA7MJ65fXU7uIr/FwRXi0z/bFhXLoKVgtYGMXAQaLmZCEeWNH4xTeknOHFQaZk6dkmIoOdJ5JIpX9rwkAcGF8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462126; c=relaxed/simple;
	bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BO1FVlW1EtcBFRsvbpcPT19QfMpsGdY2o3ujUq1uqo8VMN2LrKBnWbWKmhLv297FLQaXIxgRNWemXBBDRl9Urb5scV4vl/7VVqTKDl0AkoRZOIa3IE+/lRdNi326RPspsX/XEtup5xOBZqHu1bu8RVw7cwKmmC6ZqHArwSM24Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSlQoHnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUnCAw7v; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSlQoHnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUnCAw7v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKAYM2604090
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 12:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=; b=PSlQoHnbsoQqCE1q
	KWv2ipXNFwyawIB51ym7mtbKSWaIJ5GKoB+2wyBvbFOvEJCzuQMHCpzQZ6BQ+Tv5
	foRGsm7S/gM3eabLuAkAm+s77Cnb+Jrv/IEIRhFf+ee7PdA0fzSuzgkMLdVrII4o
	EX2pu9BeJWjEz46dxcMRmBKCgVOIsKt4DRxGHKAz7pO3WgHaXJyuU3eWHVT6xLKM
	NRHUE4bp+FXrDEaYr9LN0TNdA34spBo/xomgdbz4ZkYNu3nstT+5ir6qaY06sCFN
	pjz5MIKEBGfEycmCJMWq2xd1cW0knOJigkR2i/QD7dx4rvVdwUKP8vyQ0QmRwmN0
	pu0VLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jtjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 12:22:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e80ef3e0a3so8691815ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 05:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791462123; cv=none;
        d=google.com; s=arc-20260327;
        b=VKgL+sFlNDSNwBbFQxJRD6UnOfVNMKwo/NjHGjWlgCvsvx3R5j2F51i/rXVI3IEHi2
         j3VyQLa3TocIH1EpBj5tGPWEVYo8hpqC6j+VE6kx7f1WSIeAcUT1KYcc55bLGjinADEy
         xfBgwQ4uT3KOVYW9uSIgEa2epXYKG1EqW5Cr5Nf3SuUDfsGIy2RkqlWIJFMIhY6KplF9
         z8Ng3x6mbQB+vpe1bF4VWZlUQxXsMu6YNIg1WfD9oix5yLuTZqJzAlcGrfMPt3OlZy8A
         eSswp2zjCp/jGbvyoNrURrWWMGlYW9IMX/LkQpXglR4gLOrUUShtoEpMEKSf47XXhgdu
         AbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        fh=rwlfPRjvwSxyce+5/gyOTtdhRU8VXbs5+mhxhH947Vw=;
        b=XAba+FG9YJAN8Hzh9jiu8wbS1IrW6RFbmDgfgQaypFt5382qsxg7Y85R91sAoUQzbn
         DG1Uoub0wM51Bjac7BguckjZ46jXoZDb1MFJE7Y9RDeS7KNsRr0InXj4HKeGy8maVGEJ
         YW6OJg4wKrrH73tQTopVl9+fctPbMlyrGf4jKdJxd4WUuUANR3pwjXIifAzdLTHeIinM
         kfjnx2Lv9bzJwoLod1xHLDXzcTs9DsA/NQLw5vfVgDKNy0M78ME//gCeJgiCLIcNen5g
         /PEmBOwMJC8uXkSLKwIsI+kebeyEBhfluRTvspVVKgXlMaf9Z8CrpABvDkT/lBlOy4zE
         mm/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791462123; x=1792066923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        b=fUnCAw7v+6Y+SMXFHRJkZoWQ1iacf+BgAjuo1pB2HzuS6qDBXYjUdRapTmNVAYtsvX
         sOwkYwVYM1wAD4endgtxjUazgbsqOvhIwcdnpROUgOqSGmjv5SXmhl890tcfGWj8S+bs
         YGnoU6R1cp47fpG2TWCp/UCxJL0xweVQT6FX/Z2s6op9g15mLld4KxReRYF+p+xz4ttz
         YukBNQnyaV2p3Ppi3DyXBjcYOFcStwwbv7fRC5gfoCFF9LQRufUjhKVKFr4yc9lOlFOB
         7li63nc59LRTyF9j8sc87Zcf1/qnQ0oiPGjafe9sF5ohSs5kBXYKhCe3CpQ/3VDkcy8R
         24LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791462123; x=1792066923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        b=MwduHKHN7r3pKrlp7pkBcdNiR0tKP3qbTDrJQVVb9Lt6SSeJAl3QTc++r/4taHb73n
         SxtgqpuVfbo98eysDqpwk86QTkYGj9zwKZQVqRX0GbXuqei7Btm+fYDTe+TzikkOxvor
         oNKB1zkYyyKivNY7EqDjRh1xAjAqOSPBeJUYeq7/uPQHVbvh4wRWHkq09TbT+h6wMvjI
         HdaR/iJlE8r0VtRroa7JbjFO9yXszJtgpideqJc/NTlRLsjet3vbhSTguQuFdT8SDdxG
         3SwHbhPdXvWoz4kjbp9Dkh9nHoLwMd6GUYPhjvU5+GcxFyWgK+Hjk3yGEofGte+mjV15
         5KkA==
X-Forwarded-Encrypted: i=1; AKwUvBxuhycDcDhD9pBcLTJwV1Huoll1QXwI1a3Fc8blJE4o3+l3WH1uuw6R4izXvBxj4rhLTXzoslp3lTQVMoy7@vger.kernel.org
X-Gm-Message-State: AFq9FYLfdonGWA0UyvaVjzIWAVRikwPOe8TYZ7JonCqWQtEpvmYSuIUT
	xUiHlWUBWCYlQXkn9m1k60NO+XkCtiMrU3HIPDlxHHvd4mKzR/DTyWXiMOPl7uNBlN+hHE6vXMJ
	R3//e9XWPysgl/ux+n4GcuUuzkU2zsGmMDEgQQhd2/z5DRtjtu1HCNXzECNsbuqF9SM3zlunORa
	6JZ5/dV1ybExKnrFjabtqBS4+fgV//EmbfebWU1A1qQdk=
X-Gm-Gg: AYBFou2nQAl1XM2PFGQ0d6PRo6IiFiX1YNSXS1qsHHzo8W5RafGtDofKlK158QUf1fs
	Ww00zcOHcTMJ70iE2ZkuRXqXESs7uLTOY2HdVs6/D0tzu/rKPTxLwUpnFprn1y4cykDLubQWONL
	LDoTSy9qf7g3f8UFZ/f0TW4VglqQGYznOL+G1vukTNKbU2vNwuaJp10IlxU5+k0INR+U5kcjvZb
	CHhGe+8/9qrnHBvqg==
X-Received: by 2002:a17:902:b905:b0:2e4:a338:3658 with SMTP id d9443c01a7336-2e60051d4a0mr35952275ad.42.1791462122976;
        Thu, 08 Oct 2026 05:22:02 -0700 (PDT)
X-Received: by 2002:a17:902:b905:b0:2e4:a338:3658 with SMTP id
 d9443c01a7336-2e60051d4a0mr35952055ad.42.1791462122438; Thu, 08 Oct 2026
 05:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com> <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
In-Reply-To: <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:21:49 +0200
X-Gm-Features: AclHuK8ZT7r3xmegX1XclNDyrJeEDtHELpRcrHYyZXH39CoY5X64BysHsJ4sp3g
Message-ID: <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac78aec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=3wAzXcUKBgoAJ-C3A44A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0OSBTYWx0ZWRfX1V/cG2l+QkkW
 O3wHI5KW1ncNNrISa082T+xigSrYuMY5IumRniqQilb7BkcV5OHmJK9HckJ6n3E/bZWduGqPzRz
 hLY2T+H5yiKijjhO7FnO5stu2KIcWFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0OSBTYWx0ZWRfX3cbFqlg/k9WJ
 IYIoL8jzAQg0SRZAY06hxcs8MFmBQl0PUb7iYyfl4PlxELZmd58rLNqzRgeZoJ1XCs0VtKYbBbB
 ySgLVk8vNxnnNXKTWXVTzU+WWImkIOmuj7wDOhgsmIkkvpHtftvZFgSYM+MDs01YTl7aXMOJ4r2
 olcpPLTvdRviwlggGhvdTPzrljWgGK7O/L1kc6jj5ajdlKfn9j2kJVBRid0ZF9qGivZEd1fMDH+
 emciJi45FnoWzIQlbMPz9Zi5sgsgB18+6+mfmHiHdzXOUV44MB+CaoDFZ9yPuYF56CfRpx+E+ae
 O7t1HJ6kAonM8sK2Zwk7cXGYWbXuM1mLNHctdt/dY8O4u8MnO5Y2GGawny/AODt1ENqNp7D/g73
 IllBEhE6oyoFFbaZO43MDss/Csp6LXV+Waq2QXECa6GOBHsycZFGcpsRxPoXYkCedMpWy5kVSLo
 0w2ivnDc778li7soxng==
X-Proofpoint-ORIG-GUID: pGw4f6vZIc3IlaS_wzxpG8mqoWBJsojG
X-Proofpoint-GUID: pGw4f6vZIc3IlaS_wzxpG8mqoWBJsojG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080049

On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > Some domain idle states require system-wide coordination and should not=
 be
> > selected during regular CPU idle. However those states remain valid for
> > system-wide suspend like s2idle.
> >
> > Add a per-state system_state boolean and populate it from the system-st=
ate
> > property. Make the genpd governor skip these states during CPU idle. Le=
ave
> > the system wide suspend path unchanged so s2idle can select them.
> >
>
> Instead of this I am thinking if we can QoS cpu latency setting and block
> system level states normally. Since s2idle is user driven, it should be
> controllable via user-space and we don't have to define bindings again
> if systems that use platform-coordinated needs this too. They may not
> use domain-idle-states.

Even if we likely could make that work, it's seems not correct to rely
on userspace to make the kernel to pick the correct idle state, while
the decision should be based on the characteristics of the HW.

In regards to PSCI PC mode, I believe we should consider adding the
similar DT property for the arm,idle-state binding and make a
corresponding change for the regular CPUIdle path/governors. Although,
it doesn't necessarily need to be part of the $subject series. I would
 be fine if that is handled later on too.

Kind regards
Uffe
