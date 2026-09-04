Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680653F2101
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525572; cv=pass; b=ac6xEFpFvZuAnHVK2uMQuGP/0/f3P5vnaAD/JeNBfbfdnFFaPNPOR0s8UYUWXQw1W+oJ5vfsyyNzC01QMwWywQc/29j/K14f64euCRl9jv7Q/24Fk307/ewljXwtDsn/6OxaHBnXuxSNm31biAoxCLmaf7pa7GidVzGx12Ccn0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525572; c=relaxed/simple;
	bh=VUcBB0vOW6MkjtjLDRFaCy6FaOEhAXU/YjiYrkHQqRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkKjdPQyCe0uxcNwDJngiErMQcnuU4k+x3ai4jKy7vW0GJuZPv2FX2nAlOdtxpdD6H0bMA3AzcCFLsYqwhRcmuKnLS44mg0Sq2THMfQbA+uw2J1JSvyn/aubGKQniKAaxmbF9R2h1p7alHkewEF5QCE1Ofhl5U4D4QKQDY+v3gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0XJ4tXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QysLBsvW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0XJ4tXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QysLBsvW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIDWc3168564
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 12:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=; b=K0XJ4tXGEidqOsXZ
	b032oR5V1rqvQce0EcA9gAHTKUvpdP1vfUI2NvqJy9w/gP6XHjbadQgX9dOh+sH2
	U0udof4CD8CAWQvCHepl4wCV5X3ApQBfEkUitnWsclRsnOxoVB+V5GMzJ++6e2Re
	3mQUMOjyswcZbavDWSMq4x329nxo9nfG2K4bI5NTW7pUROmGarJHDQX5Yx6XXn7A
	hGQSNZhHyd7cmP+Qf4qbuxe1qskxzB/YsHswpsfOspQ1rDXbM/FcVJ62NSaVpeAJ
	azWw3CIV/wasFEdMSeRe759zAFUe/X8vfVoeVM2jXo/U5ZMfaNS//ACUzGzVRc9P
	rLTDZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtscha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 12:39:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104417215aso7099806d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 05:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525568; cv=none;
        d=google.com; s=arc-20260327;
        b=PeDnB6StgeiGT1hIVjqnZELOnqfvydulDzh6t9gHSEpD1MJk0WpsfGEPE9hLx0uaOD
         6NZzXxaVFt3J81g+uXVAY7Hl9vzIXhWFjUCjr/plOpwaykVjSau8QvgR2c2Uzrw6u+Wb
         u3rPN6KVtgYhy0Urz4Wv9UjTWUQq4eJqxop5/ED9+KVNskY5pb4Z7tDK6mPVA9zL+KwA
         o6dgetEszLBGDgqcLDngGkfATsPxeGmuDQudsKg9007LYy7DAxQ3U9gazBVwNNFZCOvi
         HYdohLLVoIaR11Qpyk+TFVrSA9BG+LPaOuZZ1SDhN8bcEMgpRyplhs7PxUoWZdYBjy2v
         E+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        fh=jEmxUrW76CtulfeQeycleAMVMmHsv1gvqPkgor9qXZ4=;
        b=A1lMYvv7bi5MvvrZ7oZLRx6Wy39+NmLw+rzoMr5TKbaladRWGpRgERerjnJ3vTCfeK
         sWx+htR6e7UTNb7LHz/kZkwMxrSn/hfrm0mU+qkHnOP3/oCRAABCC7F1hY8oOht+fxS3
         n1AoQOkzFJxV7LZ0mc0gJFSq/X0wwyziqJlf7e+jRkmll1ibhTaYW4q21yYTwSU/+V9s
         Q97EPxw6EjPxPbkOA7N0OHDT6mzT3SBtml1Rmd7gyA/hhZGMy8KYBuk6g0fEz+PKe5Kn
         t4ac5irf8P3PMkdo7JkRV0n7w6UqVbsYraverWqez3vfEJaSRhoz0mUhJ0FSTeU8Poa0
         IwkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525568; x=1789130368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=QysLBsvWmtMu8FeIMraaRFl0IB8LV6zfrGwAOj4e6iJhVE6eCyt9onKeXOBBmfcrsp
         U234/KdjNRuz++FJKuBhkBd0uVRmTsYjd1fJpZrVS+vMgkH8/f5Goc5WbxwxtqoMQ9YX
         4BiNmiIQsFXKxSZp4YIAWETDzxfNGVGcu+2othRB/rTFOD9pLJSuIqIburnhMqMDwbW5
         ATWwPVzJ2latEcUETvbegTTtaB90ZkgWn6BeIdjjGnNF9DtM5VgjD0etXiJtGrFH7DYG
         t5HJoKOV0OpoKs2u4L9MTrE0OnPDpDE3cPH3zPlfeH7LhsEKjS80/XyYfLodhGDJ2WvJ
         QJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525568; x=1789130368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=LMdGvBbJtAucNDQq5snAKUOVPBkyk7e5C2odEPA46k6vaMcsNWq96uc0l5pJtekSzE
         gN1QKK7AwcvpkMch79xCAOttGyGxd6QW8jiTUmpjGS8YWn91UhEoxJnx5nviHUzNgJhU
         AKSuCWEUIIvnnyQIbDvzk3gK1mpILf55ivmY19Stj1PvnCkaaQmsML1l+IvR4zr7Ga36
         27pfjMaSYv19Mf3RIQYpzKsChMLOSlFdc87ONhn6BG+AqnHm/80WyLAk+BjiqSroe/F2
         kKPqcuNdPLmU1P3raCSst+KwLSPYlNo9cn6fkWUL59xBL86FgOkU4HmVv5pvWCWfLb1i
         5UYg==
X-Forwarded-Encrypted: i=1; AKwUvBw11kYPV5fcTmrAPUTVmkQ8dLoKe499nvLZJGYfuWBeT79TkZ/KhwlO1dopnLEuBAdgYdIZJocLc1I2ZNWN@vger.kernel.org
X-Gm-Message-State: AFuF++kO4zgmMisp59YuZlrwmU7MMXSzdkXhFjV196nQqfxPv3k/pHBS
	GSZRZbn4TO+J+f1nsh3Ku6zexP4D+8GONRHp5hs12uoV2C453nSEPmMvSU8y85J02+UBVaf107E
	ShrRO1ng3dZpTgRlhu5knEsMHAFFDKryKz/AdGhrRX2IgGGvucH8hosrsLGrW5fClEdJalLFgVb
	7Tvogk/in09Dz9lR1fFr2gvrmdQ3/FM+xchmOyACNBKEI=
X-Gm-Gg: AYBFou3a6KCl7q9QEcpsd4AnpmhpC2V/mqNBUQgm9O6epT9BVByTud8nQW2yGbkMEHn
	IUOyZexHxBeXQIxFgqYT7L15wYrC1dOCfsWCH11VvTf1XNCoIzFcq4cg4HGZZguudsulGcG93Ou
	RYe0BS/vnZMyf+/FHH5zo79fIC0nY07sR75bRqDkoo96hZdlWA1Gj9Bo1r19YCQpUP5Us2CHVOr
	sQsQ5niZfx/+DsHCqO1UidDEywFMQh0goFD9iHdb5e6llaQzOelfLjX14ZhXEwpNKKZnvvBIGMj
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-530549fd6c2mr61921361cf.36.1788525563490;
        Fri, 04 Sep 2026 05:39:23 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-530549fd6c2mr61915361cf.36.1788525558050; Fri, 04 Sep 2026
 05:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
 <2aXo5I_5YqQ6uikqbIOWs7L__EwJV2oTs24Jqa-YRqGIU2FOT1O4bixGBbTzbaiBuENyW0XkWbqAJJQnxgSnWQ==@protonmail.internalid>
 <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com> <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
In-Reply-To: <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:39:04 +0200
X-Gm-Features: AcwNN1Xi0ZnbHcNu1xFGVtcHdZiZF7hrQekcNJq1YSDgANQhTlSn5NmxIbSBScw
Message-ID: <CAFEp6-2_XTMnxqcoNFwu=BfWki2U7U=iuQL8n6QcR-CZSMsX-Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9abc01 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=4B6qI-Qak-9ifnyKK3wA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: qrpMjOsTYiIlyyExUpqTm_R6w6FQ2Uov
X-Proofpoint-GUID: qrpMjOsTYiIlyyExUpqTm_R6w6FQ2Uov
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX9EmpAxaP8RBO
 vKefWw2X4fzgouAKaMp3BWgpZWNQhK2EGUOhRlnnji1lqPL3oTJe1o3VuZ8/109UpjisJPWhKcI
 mLgHL2Nj3dqtZ28UKFn/XR7DOrTzjcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX9/7DSXQHnfyz
 ItXByCBUCmZurLd/aq0zIAPSUF9mDvIZ2xozBxEBlm0GlMQyr2AbkKrlk5V0GPGDmjfvj8LbdXL
 x5MG8WNsW4nOl5DcWqAGpWEuLxcEauYohTmVU2XEjJwv9Oku8nWKVyI7czjgQZZl1Ohf127Bjwc
 VTNvGbf7uBXB3ksk+ijEVvoII8zVlqRPzrvnkImVfE4L+5EZRcy9SIDCJj8MkdO2ggkX9Y57bE2
 rrZyDkNZxtbuZtgUyz3I+iKWlDiK5rXQPgglXi0ha3YLLRspCTYs31Nha4kJG8QUYB95XFyZFs4
 T811fXrJkMBsueVyNKRQ/+33dqGgCNgI/4Sobljg0+LzVvoiYpnhRY8awHxyhsfWJ5qbGRi4IrP
 P8bD4WdaG9hbvMaZgBtJsdlec62Q80yEDbU+gNntTawXWyL9ic0auMX/J7UV5uZ9Q+DWVxyd7jD
 0i6dyjAVziP4aat+f2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040114

On Fri, Sep 4, 2026 at 11:41=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 04/09/2026 08:45, Loic Poulain wrote:
> >> -       mutex_lock(&phy_provider_mutex);
> > Then, now we're moving the responsibility to the callers, maybe we shou=
ld have:
> >      lockdep_assert_held(&phy_provider_mutex)
>
> An LLM suggested the same thing to me but, I thought the resulting patch
> "looked messy".
>
> Do you want it added, its only three additional callsites.

It's only a minor suggestion, but if you end up submitting a new
version, it might be worth including.

I would also probably use a scoped/guarded locking pattern for the
mutex, as it tends to simplify the error paths. That said, it's mostly
a matter of personal preference, and some maintainers prefer explicit
lock/unlock pairs for clarity.

Regards,
Loic
