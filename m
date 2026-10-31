Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793459674;
	b=AbmzJV+lVxO2f4FOYlWZMIXpiNf7egCIRDXYn0yRg4aLBChsVeXhzm2PY+bEeG48XHu9
	 NX0LMuPB0x9GoizWubl4H/WhS6sqdIRGP2szClGivOAhPL3Vvee3UCWnHB9XXJmziMsZt
	 QgTUGQJm+rdkXG/VD7pBtaBwWaxFSmlkqpLo1rDIr9DSgBFglMrjTA+KllcfxoUjOFyHr
	 QgPoftrTTt22FKcK9gBBIlE/l415b/r/PVBs2/XdUX/3B60GaroPN/NKjpZtEnlvXsj69
	 pObrcS6ee3PM7QkbUlcHddBiFbMOiokSHQhgnJT051DlFpX0CvtK/og+biMkiiBuQ/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
	b=LFeiNDmGEUN/KdVihQBTjbJWZz6TL8CwePgWbJpKmWCjAbR0XISR6z+duURnCsNyYv3t
	 ndcaxz4KFCFhcmHDbnwNWMGcEZxZiffSabJTpUv3gdkEtFdDuOP63esNmT0dz8Ot8SCKM
	 S8JssJX70obdIiz/6niWwwbYxXIuUYxVjAHFkPdUgC+WL3tPcrV2TJgUuY/ncXNu+KHye
	 +rWqUfdInpStBImauNbqgtvIooZ/XPb4eZICnqIgcVBLug6l8EhgRXIf9zK3Fk0AzrWRE
	 L7YeffdYNIN0eTeYLNzl1mXJzYrKgIAfUk7RWWgbXamLf9cTbXODKNZ8IKqUi9n4oiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmRcFMjy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icrygu4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F2B606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmRcFMjy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icrygu4b
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD01uN1848193
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=; b=KmRcFMjyc09Fr1mV
	R2JSZmSE1JACLEUT0r5i6anZ39bgy4cdQ19Gny8Kk1gs4ICBLnRy8Pe+NJ3rNJ1K
	SKV8/JWZGw8iz4L4muMlk9EXC6zlNq5CkkkPTPMyBvjXU5ULFXfY+Y/3AjnM6eZn
	gjFFze8o2IpVs7BVUaT8eTDZvP2+apCBt4rlHypzXGL+2J6mdE323xL+UgNHAo1F
	XBBa/+olVNQZMwh6Jf8b/8BS+0qlYdJ7X1poxUsTwBxMj2r30qe5pTBCTmv8/SIJ
	V+Sm473iQEgzh++hD4cUyt9SDQhwcrY5dA1VQT7dFoK++NJPdHx4zkH2QX41p8yB
	/s0wAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfseyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:14:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b92acedd9so50427376d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459672; cv=none;
        d=google.com; s=arc-20260327;
        b=YX9mAwWti1Bj03085DvWL1/7hZiYWruGDQ3d0/CBvXnMnayVfnzvMdyQjDw051FhkJ
         2SJQQfo+tdH/+ROaQlV/2wxCwDo74qo2hMcjyf0nqJs3ilb7w9eI581fCVXUdRIjqsvt
         hSKqJ7OvenieX4Ke9qXdRZCGamRhHV201NAXgGsjN1Ne8uPi7uZBt4jfD5GE93OXw0Yc
         PHR34PPRkfTQu5gLs2Ofh1cfWDYl8HJDhY6JgvVqROaa6/vYGQapn/J8cOkOtmdQ/vTW
         Iri4tPKEfn3GgCDHVj1HSovvKRySrD2l7ln+3AY8BE2bklSK963qpm9tUCwfe9Cl+XW9
         V70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        fh=H1hvczQ2p1K6Dd0NhQp5k4JaknQK+dhJrwDULvPWhUs=;
        b=iGFTNUNYFvACE8HdeZBIOh6MhDJNr8ddRwTwcvi/P2vY1fFRHdr1f2v9CkAuwXGVtZ
         yhsnjbRtDw9yWKDsbrT5g9XNj7qRiiSNvR5TioMnPE3rDqjW+5/uRq/poTd6MCnZsZ+O
         ZYujyNgCAvblqzpoISMY+Mt+Q1f5eDG8+r+J2xvAMV1w5EYpriLjAVw9Ohar+pM/xW1T
         fVIqFdxD4c3BGpIZ8sflDE5jgqZ/JtrIoJx16W/4/t/yUV4jxa6Dt9TMwErBeR8vr4Ws
         uRrZZR/zYb+wfTkq60Rc9FFM/YwCQsxQfGGkaLymYI11mkwD8dC5GVrzsi2lXEXk6mSD
         Gsxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793459672; x=1794064472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        b=Icrygu4bBIsC743hEnKOye9lPLOFl8OG1nYpZlSUtnfYzxnGdMKvlJOxwR2UBb2DwS
         NdcCW93Q/MTOYxqDR4WFGBvP96+VSErHppCA5LMHOMBlY/2n8VzbBn5QxmVzf5GxY9lp
         3XvCSRbHAPsynBgxaq1blrmV8XJGao+mw/cUNInqgtQ/SFNyDhDlM/4A7pvGVG9j91uD
         3owvMMN2Ii1a0VF0V6BiK2lQZyGoY8w2rmtyHVnn3qasKCUr56wMv8n6yfoPYUOSuJfM
         JB60zjM05at/Qg2WfCuyDV/F+qi1ebImVPD5ALTC+tqMXQcy+6jB2TqkRQzg1IKXMWrh
         rqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459672; x=1794064472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        b=KRkpQzXJWl2J2PsyU/2tUcU7l1Gw6vi+3NXCXRCl118JEgtXbo2iQVw1UTGwpHCFjy
         6k3ELdMQwS9ZKR4JJ+DYjaIrwhLqfwQN3GQeGtTTBf83lt09clvUKql6Pv3GriUQ8ZkF
         T9+DA4MzYtNT6q6eMbEdlQ9IqO+jlJiXcWOMKgHQ33lnnPAAGMl9aVQk/TTUOeH8v0oJ
         PZk+rRSJzfINtwfdkPRc5CtYt8jq7rpORSbSYoK7iepZTGyzstlBtPMcav/7WJz1aNYY
         /OVRaWe4iiKz3viTQhky2jmQqGPQMAzcKrXsAMbDelFP+qdc94/mjdeQ66S63aNeX7Em
         /3+g==
X-Forwarded-Encrypted: i=1; AKwUvBw6SfKJTtQ8nhOmgRns+Abrc7ys1Y1h32RxGd+B/lft5ZcRTRmbbncGkpTmM/VUvYjjqFvetgnC0Ij3Fbvv@vger.kernel.org
X-Gm-Message-State: AFq9FYLTkjnskQu0T+4UCKgCFBeS4v0jhr3zE83nEI5pxDTjTBZRrGjm
	UKxj6S7l5CuWpWE2babC2yjj+ZDN4LKhmvIvYMey+Llj20YQe08oye+hvwgkSfY2hOTMokZXe+Z
	PwdsNHmV/HWQ7FgCvzEZ0KHbepZEK7HenZvGulq2lEQBybIkJ9FrWpssfY5AjYrSrZDr4Tjyld7
	SFYlfTm+SgDdPC/P7BKQLg5AB7QWr1Gz3KlVOdDJIEWHI=
X-Gm-Gg: AYBFou1Xv/KikyloXap9ROemgo0sOzP/R2ooLC4hTwU4gBOR3hgvbQrOPeKT3gjdNre
	fz12+iogfZ7j4W9XxdalHVlteIYOOXXwCcCS31SEG5n/tZLNzESRrmavnJD+uLiZ+/806vpZ+cm
	HsCBUbnA27e8SMBlrFzr6tQcdvIu35ypDjLJEimXh35LY3Ol5cre3B49PMia5oGPvr9Fq5bGBqr
	eDXKPIP4LoVe256CGMFG0grMjGSs5TlyUoOdOjjfSlnMGeggAJe/2FdgWpZV9Bv45mD6kFXHYsa
	qLhS2A1l/4Mrk57bivppsxYSfCbb
X-Received: by 2002:a05:620a:6ccd:b0:93e:9292:1b96 with SMTP id af79cd13be357-94421585b68mr926452485a.3.1793459671802;
        Sat, 31 Oct 2026 08:14:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93e:9292:1b96 with SMTP id
 af79cd13be357-94421585b68mr926448885a.3.1793459671340; Sat, 31 Oct 2026
 08:14:31 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026224957.1115370-1-vz@kernel.org> <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org> <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
In-Reply-To: <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 16:14:19 +0100
X-Gm-Features: AclHuK-O47xt6538FuV-XMWFTsdZCSR3ExRvh49zm5hewMSlbd2irNFZ3_KkfeA
Message-ID: <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MCBTYWx0ZWRfXwgg0JOYuN/aM
 g8g8unLc9K3VaTDTZG7dSDYevzUrVygehbG+869XruBSCzRPtwsEJKiAAI3sSux6sImHSanhyCu
 p9Fv5nidfpR4Iol5kNVQcZCKrXvWnmA=
X-Proofpoint-GUID: uTTgGHovj_vdB1D5IqoPVuSM-IXo-Q3A
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae605d8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J-ewYRROhU9zWjNAoAIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: uTTgGHovj_vdB1D5IqoPVuSM-IXo-Q3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MCBTYWx0ZWRfX+UtdJNXcLasP
 djNCkueGrACclzyqL9ntggx1UcaP1bnRnHXMw7xBp0t0r0b0NK7EbAXJ534uo1yatGFfPwnofza
 XxVrv0yBBrOuXZqoby8lqDG9l4UynK87uGBOLOugEKbqTuaPUD8sTW8e3TltKqLtQHe98YAbR30
 mAflOSLGIp/QUXA5s9e5/MdXjuRf+ZpaAlsQhmwOW+TS65bRmfPq3ZXodkI1njNycUKd/ueItNo
 2+LLUvQPSdep2mO82vqXTBaaRXHSMn5lWOeAga8gtLvMoUrL2MYFb6ilHTz6wUvMWsxpMtTc+gy
 LCdYuWtDOrexS3AQY3Ts4v8LRw06F8EvPg+YDu+ZSb4ofIAvgkK9p2Yi4IeTAng4fBR5PyZNjwE
 V1Svgk8BevA9XPsi9ztX+eJrswMvxodztJa+oqIFu1wtbyQ6kRWhTebVQ2NkJtiQL+9xPr6SCt3
 41jwgsKVDhIcF+veOHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310060

On Sat, Oct 31, 2026 at 3:14=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 27-10-2026 22:30, Vladimir Zapolskiy wrote:
> > Please note that 'csiphy_res_phy' was introduced a few lines above
> > by this change, it's only purpose is to provide the needed supported
> > media formats, and this is unavoidable.
> >
>
> Right, agreed. Glymur uses the non-legacy path, but that path still uses
> camss->res->csiphy_res in msm_csiphy_subdev_init(), at least to get the
> CSIPHY id and supported media formats. That is why Glymur currently has
> a non-NULL csiphy_res even though the actual PHY programming is handled
> by the standalone CSI2 PHY driver.
>
> > This change follows the assumption that pixel formats from all
> > non-legacy PHYs are SDM845 compatible, that's true for this platform,
> > it is expected to be true for the most of approaching non-legacy
> > platforms, and on demand it may be changed later on.
> >
> > The current form likely is the most compact and the least invasive
> > change, which gets to the point of supporting CAMSS on platforms
> > with no CSIPHY resources given in the CAMSS driver.
> >
> > For instance, note, the recently proposed Glymur CAMSS [1] references
> > X1E CSIPHY resources, which is actually incorrect, since there is
> > no "csiphyX" I/O resources anymore for Glymur. This change can be
> > reused for Glymur as well, and its reference to X1E CSIPHYs can be
> > dropped, but any better proposal or improvement are welcome.
>
> The intention was not to describe CAMSS-owned CSIPHY I/O resources for
> Glymur. This also follows the earlier suggestion to reuse/fall back
> to the Hamoa/X1E CAMSS description where possible:
>
> https://lore.kernel.org/all/lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s3=
3rogi@ndnf7zrtu5ex/
>
> Moving Glymur to .csiphy_res =3D NULL is possible, but with this fallback
> the CSIPHY id comes from the CAMSS port number. Since Glymur uses
> CSIPHY ids 0, 1 and 4, that would also require Glymur-specific driver
> data and DT/binding updates to describe CSIPHY4 as CAMSS port 4.
>
> Bryan, Loic, do you think we need that change now, or should Glymur keep
> the current approach for this DTS series?

I see in the following in your Glymur series:
port@3 {
   reg =3D <3>;
   camss_csiphy4_inep: endpoint {
   remote-endpoint =3D <&csiphy4_out_ep>;
};

Which CAMSS pipeline interface index/instance is CSIPHY4 connected to?
If it is connected to interface 4 on CAMSS side, then we should use
port@4.

Regards,
Loic
