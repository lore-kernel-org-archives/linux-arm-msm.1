Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236770;
	b=0hUuWctlbLw9jRttI9zv51nFgkNoKZy0hO1CYm+/fbtW0xLVZ4JRmh7UP2s/tqIHoSEn
	 eOZDrQ3xUC327Bc9iTDwv0kJL0WyqOiI/3fnL2b7GsWdB5qALvnMnJxw0K4Vsd4BDO0LG
	 8t1EJEK2stXVvi9nDnnWzkAbIM86Abpgpyuu38bgFZ9BdOpxopo0bbPA0y1wjKnUZnMv8
	 EwageEKHf8wzU/aLXcsVO4HnQE1ykUrZXUuqdiOMdUo4N6E6cx7xwQvFPDodrZL1SuU9I
	 VO9x/pP5gHmEZ6QZh2SCraCwRVCxgnORvsiXFGfD21Sg2ZE/xn53CVk9RMREPG65LNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
	b=LJ8brFXWK6fYBORCq3SzfRRsTnOjxW60IhtdmkRdLbsSrKddrdhGng0TzJLnzNSdVfGc
	 0FMaiNkmmr/kt/TlTA78V1WgvY/nT8aHNRt2NmyXj71YpRGPCGILlKQEc5nxWGu5CXEqN
	 Yq9bRC2Ge+lpCm7WjYEWLCunnJoRfoTDEcL359DbCIh4IWFTCD1LBZXi6PJUTkSXN4WV7
	 HpnEiWgAPuj8P6ZxiZcw4CWJzXdfUKpysz/iIELl5NloZDwksFdMLScjeVZ81HSx8wMTS
	 8xGxVXArBxJKDqFWI43OMS44PwO6hFEN46SZgPiZTGMk1Q0x3uewBrvXb9cSrrAKqgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTuBisDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFPP7ujN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A21B606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 15:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A21B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTuBisDp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFPP7ujN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFTV5023155
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 15:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=; b=mTuBisDpOzs/Pqni
	WxP8gaoajYwRE8TXaHfk1KU1nwzlAlbBKnoKLKw+p5iynqnJ8O5WCk3eFZzB37pz
	KCl4Gn+XmIcIioE+D2koa6f75VEqliU2VEoSwD7nzxCoWzsAxTZSfmBks65GF6L/
	7mk3N5SO+YWrv2MZch5sWt+/82q1tHCBtsLSrkIA3gjWzsVL0ESBPKgk+Nc5UD8t
	SRmJRnkaQfASQa8mUNX9lvEhKtJpGnosNe4+eDCn6CbVJgi5fk1VOlg9OP2UVh3m
	T5X2KcMG9fYTD1A7FoNheWHcqJNNWt8CJsFVrK9AU+qExEpbNWritCf8R2sLNXS7
	QU5RMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgv2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 15:06:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so1017855a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794236768; cv=none;
        d=google.com; s=arc-20260327;
        b=GDbMqT99t3qgp3oMuGkeW/oo5gcriAsWy6usLOSonW/LEd9e16Fe+m8YPlrWqPb00v
         8sW3NmRuoGIm078PPSsQQd8R5ug2H/4frHF+z76352KitdD93nIGxXWjPrPTJkxZWzUb
         6Sg7FSuOeJ6+K5l/1SHPPD5c0sTx2HaV3HjESJwFQ+fJkMQXSZZTJqG4w/L+BKXHARCE
         CBY8gyUqD73loHCRuwY+np10afRvHwx2vI3dZkM4630i180gq80wGxeUEhTZqhNcHdx0
         LdApElfMHDJVu9DSHGr2fVDVE7OA1U/as38CKlaKLc7dYij1EyEwdZP1DP4QQ08VS4Oy
         cpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        fh=mug3M6k07DUhwpBqVOoi3JlkafRuAuQurUzuhivd9/M=;
        b=rtu2M/nqusSXysgW1F99z6T9HDwN8s54ZnVPSmTuC8PSO7oeSzamTYITjyQQ+M+Nnn
         sAE0H8aR2+U2LztV/lPjBOakJCZHUAh4tA26km8dUBHv+T7smDmAPaCgCNl08f2HLLcS
         3iwehlX38vw23Xeog9cr8r05n6UVFchji8B4H3C1lg9CMUppxmFCbbskTJLLPE2MV0z3
         6oicvHUDJCKgKkQtmcirx0KdLjwQAyZZyeqhvLXXQERf/x8u/LQZz1jjZ9o7ud+BPzfr
         AGTEiGWoLxpyT4kPd95nCMaOo6Q+pChjQNKp8kcnQOgoygDaYNg+I8pdxI7JpeRKAWZR
         e7fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236768; x=1794841568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        b=MFPP7ujNg/vMpIHHh51wPKSs7Nf2d5v3fTZd49lDI3A7uXPRuU7eyga0QO/fEexKlu
         p7PXE3pRqjpoYWGH9TEuKLp5hGShyVT3mi2NuHPDJmbQ7MsQXcsG4urybz4iyN02lfdi
         1Oqz7L5oABFFfVyw3hko3FAIwwL8qH18CsMll9kvP2P9tvW662Xz0ERvhF2asGBot7hH
         bWUztO3eP8EnymbdrIecB9At6aGLejM2d433vUv1Ek10iwRT36XEhha+2+g2oVIbRYjP
         sK8wIAogiBUOrMgrRRP8ggonQNFpXU7lM/JvNP6MouQ7VK5yWdf5az3Q+FbOCuAPcVXh
         DKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236768; x=1794841568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        b=XeXMqPwGhwny2eYOBsa4DmmEdJzKAlv1+XFbe/ZS3AarevDcx63hE9aYwGbFLMkY8u
         372OteW/RqBAM7Kewx4aqw9oI2R66c3Aj1+0/8xv/5Ks4f7X5nAmINQ/J9hrRrmSX2Nk
         auhkmkaz+5TvaFIPjpLyYF1IKAIaTtxhTxFS8UM4+yUtI3LYBxYrznkrPRim/tFgzGQx
         7DG5vvJwvNhy8v/E9n+DKrlUZY9z3YmYP2bkRSiYeiCPNJehNyo7NLJXkZRFJxKY6Pdy
         Ft6lD/qlEXiJMy0c5iZw7eWZ9Sk0mineJ3Fakw1qCC3JBsOGrHw7km2j4lsC1z6Hj2qp
         pBMA==
X-Forwarded-Encrypted: i=1; AL+hErFwAVLLkiN75KeGofJwEljS69uISZdUmX+2CT8SvtDRoqMkLVdfrqJWssro/kNrLjy9Eo3RKL+8yzMfAYPI@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ice74EG5RryyfealT7bwm4XrgfJ/oK7z0aZByaF3Ar+FfjSkC
	0iNtHUUDrMIjSVUSMNQcZ3EAonXb0RMnu0IjsxEOAOw9m92XL3SdEwT0NXrCZQUGaHdrrTNYOPv
	kBy4oTScgE+aVUajoL+z0FfKx0loTL+CUM32MJa/eh5xhqOsaO9+d4pUB1dfK+aTzPlh7T56Dmu
	RzmAZKyHUv2ZXfzvKbVp6bVCT08TiFb9U8LTEbylWTNbw=
X-Gm-Gg: AYBFou04qFOi9ND4n3pY/BUc11/f7P1dUg6eEVYW5a00VHoUcrO6PHAThhp4J3iP0Le
	r9gWlLSYvE5mq53wGyzuwLo6bGkv0horC4VKiDDMOG254Bswkz7RCopbpKO0ksU3K4j1AE17bJ/
	AdorQDEEETUZDRizUsb/y2cB189p5tjsOi30C3JSr3r0NBJBIkjwy4H0YsRQ==
X-Received: by 2002:a05:6a21:e081:b0:3de:456a:6e07 with SMTP id adf61e73a8af0-3eed36563c1mr4958025637.46.1794236767709;
        Mon, 09 Nov 2026 07:06:07 -0800 (PST)
X-Received: by 2002:a05:6a21:e081:b0:3de:456a:6e07 with SMTP id
 adf61e73a8af0-3eed36563c1mr4957967637.46.1794236767237; Mon, 09 Nov 2026
 07:06:07 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
 <20261009-skilled-mature-bittern-2206fc@sudeepholla> <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
 <20261014-prudent-mini-duck-377cb6@sudeepholla> <CAPx+jO_BOwbKeRytBezm+piLhb8Z5N2eQO=LRwBQoSZ3kXOpwQ@mail.gmail.com>
 <20261028-imported-pistachio-unicorn-2ecfec@sudeepholla>
In-Reply-To: <20261028-imported-pistachio-unicorn-2ecfec@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:05:56 +0100
X-Gm-Features: AclHuK8jpxK3ADXusNa2gKWHm_wiTVU05IoTbWbQE5kB1SpSxHfIgN3YPGrgsMc
Message-ID: <CAPx+jO-0Vmah=2mewp-kspV7Nqr+Ay_nnO9fTFB_TMbOoHJp5Q@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX4Jm5MZsuhA+Z
 m9XQusnNJG8OHh2WZVY/8UaTLTcWg5X2329DhXV6BUS6Wpwg4aASJiQDqDQSGI/1RYm+W/v0bPo
 uyInfp+fEk6Ky75UcZ0dcvIfRY2TUoc=
X-Proofpoint-GUID: rbvH6HdJzATpFJMUHP4FB0Aghdn1Jc9J
X-Proofpoint-ORIG-GUID: rbvH6HdJzATpFJMUHP4FB0Aghdn1Jc9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX6jvedwm1oZdm
 btZhH4jLFHmEk6tD4Sos9fQEWeeKCgXz9oySDDwaDD0NIltsYnu55Irs/9AiQazcNjePkT8BFhh
 A5JNa8IWRvjNbA0lE2QI3sTewVS0mTGE/sgPkXNUnCUbTtR2e6XArqFDbD4q6TU7+PjN/rBzB6Q
 WwkWgKWI7N8xDBqh6I07K37R1qBJsf2r1J5CCMKUfkIISj9DUZsUvuXsFmcsUKrKBNODQYsqOFk
 bnP5i60tmcwI6Ste67aWDN18ifNaeDh16ogxUAJxFbIdtT+TvyEGBeV8Nh8rND9iqFR0SDEf2C5
 8dpGUYb4Q6k9SmWj8B5KWHlNrhAFraXVT1Y8G4rhf0tRH++RMaKm2BbXlkPCR7+9bz+7DQt4zSW
 daYw662A1fle12fmoAwtTB/oz+nD1pFeids4vuj4xLlELhZ2M5Ixsncz+JnykAWHATeNbRjEKAc
 U4s+V8p2Y02S+ehMoJA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1e160 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=dNvpDo67dldnF-GfnbgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090060

On Wed, Oct 28, 2026 at 12:48=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.=
org> wrote:
>
> On Wed, Oct 28, 2026 at 11:59:58AM +0100, Ulf Hansson wrote:
> > On Wed, Oct 14, 2026 at 9:12=E2=80=AFPM Sudeep Holla <sudeep.holla@kern=
el.org> wrote:
> > >
> > > On Tue, Oct 13, 2026 at 12:11:36PM +0200, Ulf Hansson wrote:
> > > > On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@k=
ernel.org> wrote:
> > > > >
> > > > > On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
> > >
> > > [...]
> > >
> > > > > > If that's the case, besides that the cluster PM domain topology=
 must
> > > > > > be modelled accordingly, the display device should be hooked up=
 to the
> > > > > > cluster PM domain it belongs to.
> > > > > >
> > > > >
> > > > > Ah, I thought that's the way the whole domain-idle was modelled a=
s we
> > > > > started this OSI discussion a decade ago with an example of CPU c=
lusters
> > > > > sharing power domains with some other devices. I am surprised if =
that is
> > > > > not the case already =F0=9F=99=81.
> > > >
> > > > It works fine today, I was just trying to explain how it works,
> > > > considering the use case that you brought up.
> > > >
> > >
> > > Ah OK, good to hear. For once, it sounded like that's not the case. M=
y bad.
> > >
> > > > >
> > > > > > Beyond that, it's the corresponding display driver that becomes
> > > > > > responsible for what should happen during system suspend. If th=
e
> > > > > > screen needs to stay on it may need to call device_set_awake_pa=
th()
> > > > > > for the display device - unless it's a decision for user space =
that
> > > > > > can control the behaviour for the display device via its sysfs =
node.
> > > > > > If things are managed accordingly, genpd_finish_suspend() may d=
ecide
> > > > > > to keep the corresponding PM domain powered on during system su=
spend.
> > > > > >
> > > > >
> > > > > But the s2idle and s2ram anyways suspends all the devices, so the=
y need
> > > > > to vote in for the power domains to be turned off. If they are su=
pposed
> > > > > to stay on, the system enters the state it can based on the other=
 votes.
> > > > >
> > > > > > The above said, $subject patch doesn't change any of this. It o=
nly
> > > > > > allows us to use more states (deeper), which are limited to sys=
tem
> > > > > > suspend (s2idle).
> > > > > >
> > > > >
> > > > > Still not convinced, if all devices are plugged in to the power d=
omain
> > > > > hierarchy correctly and the domain-idle states represent or carri=
es
> > > > > the entire system power domain topology, we shouldn't need this e=
xtra
> > > > > information. Having it make cause issues when it conflicts with t=
he
> > > > > topology information IMO.
> > > >
> > > > No, it's still not sufficient to model the power domain hierarchy c=
orrectly.
> > > >
> > > > These "system states" are special since they require additional
> > > > coordination in FW/HW, to take into account votes not directly
> > > > controlled by Linux.
> > > >
> > >
> > > But if Linux doesn't control, some other entity would vote and until =
then
> > > the system shouldn't enter that state. Without knowing that it is sys=
tem
> > > state, will the kernel be unable to choose that state as it hidden vo=
te
> > > is invisible/not tracked ? I trying to understand why if Linux choose=
s
> > > that system level state as part of idle loop, the platform can't down=
grade
> > > if all the voting requirements are not met. I am struggling with that
> > > and want to make sure we are not working around a broken firmware.
> >
> > For OSI, all the FW would be able to do is to return an error. But
> > that doesn't prevent Linux from trying the same idle state again and
> > again.
> >
>
> Now I understood the requirement much better. The core issue with OSI is
> that it fails unless the platform downgrades special system states to
> non-system states during routine CPUIdle paths.
>
> This leaves us with two directions for OSI:
> 1. Firmware Resolution: Handle state transitions entirely in firmware.
> 2. OS Intervention: Enforce the handling via the OS.
>
> Though I personally prefer (1), I don't have strong arguments against (2)
> now that you made me understand the requirement. Sorry for taking time,
> but mentally I was assuming (1) even for OSI until your above response.
>
> Since PC mode relies on the firmware to manage these states natively, thi=
s
> binding isn't required for it. Therefore, Could we restrict this specific
> binding exclusively to OSI implementations ?

I guess we could, but that seems rather messy. According to earlier
discussions, if I recall correctly, we deliberately avoided OSI
specific DT bindings/properties, since support for OSI mode should be
detected through the FW.

Also note that the domain-idle-state DT bindings
(Documentation/devicetree/bindings/power/domain-idle-state.yaml) are
generic and used by RISC-V SBI as well.

Kind regards
Uffe
