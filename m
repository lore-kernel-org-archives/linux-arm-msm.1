Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793872442;
	b=fVnXJ+8pbbhCfmoZI6k+fP29w2enfxXSUFrzXniKI9RTh80OjIanqEy2fksOCMnn2tES
	 pJnHwHB4laXAVThmHWk3eL13jbzcGcznPVbsYBM79yYLfOSlCX1N4hoqaHGev5CQ/QUoV
	 A6Pl1TKf61ocindZ4BcsrulCbAAHLcgwrtrPmRHyGEsTzzWadawVrtZ8Yu6N5vJe5qnwB
	 efGMexzfV03kMeJgO6Tu8CBrEIfeuiln86UeH1oiIPcxp2DsxPjoz5/WLiwZxPfkftKOO
	 iouTFZiIaHwVhGace8ERVPpo7hEpxvupqNxDAhtD/50urcW1jjaY6oyeYgcDgqqDQ2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
	b=RREtjqOn71jqnNm91KSkOobV+rj/f6e/Y69U40G2VEAtp7j2JRslBI+lTZ8oGXBKdxzs
	 MHOhPnl54VIN9sHmDIwiBxnDTFeB/OCRejuGLu2oo5daHItbGmCKzoiGfu/WT+P4cwlo0
	 jVuFD9RxpXjDcayEVa13W67jbcMfWXUohiziPm6nv86r/dVR/Xo2/AHggRuSGe44eiKAw
	 Kb3jfrytNOmjYeVL5L/e+06XEeihBkFU/qIgOXZIk2dc7N0rhVUu1lKIjJTNbMvVtuQvw
	 6fuuQl3qJze85vOTgsr4KNgkxz2Pfxheubi4367hCE3gM4vtpy9cfaR7OXmfzKXNZMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96A606D802
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A96A606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56TuGq3073301
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 09:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=; b=PdS93n0NNgqXZtEt
	R57dBU/Xr1B99fPEJdtDFmIU0VEwhIhsMe9LL9F1xyNed5u37biEgI7O1Xv+9542
	mtaPlbXp+PhrtKqdh8Wf9I62/m1pdaIUoPcpoB47n009CjqpwnzuNDr5idqiKaxX
	EEnFtRDdw27M7UlyyBgr5wd2DLhNb+KlPJqTuAMVf6MKkDhxYSEcWS1lq6bITnhu
	/fOfD0roldZjH4WsIl4d2BO8R7lnZIlDcOggr5g8CcktrZjFR8Q6ofgU9/1AFquB
	hwtr04M67SU4ZItU+DnKIDjlRtVqXYOuPzns7acCvaovHbdrhk+dJ02JtIa8j9eT
	1AfF9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq90ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 09:54:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso344863285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793872440; cv=none;
        d=google.com; s=arc-20260327;
        b=Wlq9zPcU/qB8MTC2ZYedIMnxWTz0nUrRnekX72TLm90w/4XydqGH0qZUZI0lZlR2yA
         OdYCJt2E3qSI2uVvS4Z73ADkHbNyRK8TZDLWk1tTDp99mTYb+U3uYF85PuIpSsnZSlkA
         0Gim+OPJDnFT+vsuHvnbNczy08tTyo0zDD7bWrJ0ZMJw947OfJHTKQGlQ4LRGVIbUHgn
         EulYwsM1S3XQUcoT0/mv9cUT/t5nm1UMOT3hfGpOMhFOP4dxE57SIXEeZ/vpSjcHT9Z/
         anm2hnK2DpNnBx1asv8Z+sBhtjNTAYZNlSWI9s7B/sIU++L7m9fKbKkwgLno9XGFpnDn
         oHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        fh=1Ppw2HwVNoviAuS8TSO7n5uR9pcABZfiBXqe9/Ljb8M=;
        b=H/VN0ZoUd3Cf0KwnoDFJn5HGUg2XzL6R57T+H0AM3KXjVwutgAhiPhKukS6NtNXwNd
         HT1wMg8zZz4WRJToZ/3TQ9ebhHpirpv3IqBXxNhE6xP7sVbLNTTBzRbAiOTg6gx/X0UP
         G+9TDnOlwh0vpfBLxVDTxAiwbawR8EjA9U/cX2lm9TSLjhKl3J77T4yJmJMg3XdlQdZc
         QjYBrPHEXEerzJadSiTngYdtDgj8vrUgQB0sxWDp+8BYuJlUjB1gLmczp+7bXpy7jnS+
         7uQok/UVzesi4SFsyUg/b1BCWwIfXYGnZHg7dtUmVVar5ECtJRta4dBVnZXbP5EDJGmT
         F0Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793872440; x=1794477240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=BwVxTQ+P1kukm4ZK5AN8CpaHVyt0nkzFV21eOEUi1UdmI1cnfPrRf2Dus/7xz+/5wn
         l0aUh3/IPg+UT6m7LAnh22DL3XNlj0FJieUFCFQRlF0UzNI8EvWo40M0ITejx3PfDuMh
         nLTSmPSC3Mm2T3Q2fi8LPkdlefer6BL14Fp9OlbzQaWIucSmzyRzJIBIkh8rwfRpiRQs
         VP6d413BRPvH0ZhANSo4i/1fmafzxfR+ZRyU+ybruG9F4DIKw+NVkpM0VfLrPMy3Mqu1
         0OFeB2BHCUq/lv6El4uqJiHFcnUaebQNK7HxwD7HhTTT5OqrHjIqAQRvHmelGJ6hLkQf
         1Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872440; x=1794477240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=Y+P4quH+CqFgU7hf6Y/Jbsjq5+xgsmQeSNPW+UZ0OEpkBh3W0iNCfveWvy3y0LzKEK
         6WlIPCYEpIuOi8E2qDL7b0DLmHlbb4LLy/fawDByROgTZqRLQUB6SS//S5vYQEOoa9Ob
         fPhDL+X9YuJgcsPRP38+a3GuSA36Ob5KaMC2hddEQVQIQHtyK7SDWbvalfNWbZN6N7S4
         U81sFzMJP+iMM1iQPXrA2JtI+ezDwbjuvx+ML0bXFlPzapbjvUeePWB6P36ZCue33HOa
         3XiE8WaWbPmHAM07cbUYfDlDIiOupfG7NgQwyXXM0Q5HIaqIPWPa+GneFLoYs8wbJsw7
         m/tg==
X-Forwarded-Encrypted: i=1; AKwUvBxbX9NwYz6jOe02v90n5P5Bq408aUA0TuvKw8vbAKur3EixA9hAKFMadXypyX5uJikAyaDu6zrDO4FfPrRM@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xa2YoqY0/CE+a0aI+aNkgQofahMD4WNGwrIfTucmMLbZ0TPqn
	A7rp0QCZMy9X7UNFTh3FLjEljPi0KVmh9FnEj9ZtvHlZhUw8uTPcikqSXtiIlgwUKyiRZk3MAYi
	yi5JaljumEWN14mUp2N28jTBaSifkpWKbtN5/FDLHes21NHSBzX/xhMqOgBcWSvoIVTr0iz76bv
	Fs8r61e4MUAKKoW6JHbI7Ppy3g5fdvkxhvIopm3hC+iqg=
X-Gm-Gg: AYBFou0GCQyIayCE+guZBC2u4UvUHbixxCpe3HXNy/2FXqCLXwQgGhPXMjzokf/YCH5
	J/p0FqFeQ7CZXij/rPWi3phcc3pUOqcxV8Dv18R3tgvGP7QGmR3sQurr9LO260d9Q/l4QYZOTlE
	8jw4A4O4qXI6WJ8uyCoR6h2sGcX9/E8+9Zytas7Mh9H6bIrLoEQD8wXfsEXL6qdXNAPK5PR10AS
	wzl3rrdujoDHz5us6YNAXxR2DYXRyMkef0BsIoWVP0xrwAAdhtjNQtoxDRmr30MqrvISDF3DOg=
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id af79cd13be357-944217ef445mr2800703285a.54.1793872439951;
        Thu, 05 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id
 af79cd13be357-944217ef445mr2800700985a.54.1793872439407; Thu, 05 Nov 2026
 01:53:59 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
In-Reply-To: <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:53:47 +0100
X-Gm-Features: AclHuK-5GKF2Bn_LCpwzmtoIhVOQ6DcYBmDOLa-YjfFfGok3ouqIdaX7kcvwdAM
Message-ID: <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX4RQ/phbqB2f0
 XhBiOcChkIPnpQiJv6Rg3u2BWYs8aXIOAflVx1Hrl8pCaAj1Hhj7/Nfw0oGHkvCvDunevct0OTf
 8gu3hfM1OZU7UU9z2HsNP7qdz8ZGXSjroIO3HoFj0jtaw4XGuUkHF6o5ozB75fylaEjqzcwDQgY
 LWVrE4VnlH+6AuJj2dkfhUu4JGitLVHfQpSPI+Ee6r5JrB5kmtlFfPUW7hYQt+1eUt85diDfReP
 qZs67jCOT5/dCLFepcvwpkraxO41QtFQ8S6wOaeln2mvHabs9jlNVUBH6AfbpvupVtYZ7eq0AJa
 6SDKyE6RFswvrcdUya5n3rkE3RELE715zlxmzWQUCWRcmgkKJXmd8Jvbbohy3PX21bjHpzVMbui
 IV/oxq7IT+muBzFf3Ua6yxJRC7HjH4RTGMiOuMhCBM4sjM4tK4nkbiGJnJf/lI+4JJsdQr57n7h
 P3W2Gpp+f0lqrztHFcA==
X-Proofpoint-ORIG-GUID: HCwCmypc4cY6-SmWh4GruyI7sJkBoSmT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX3mUHRs4t45i1
 yL5M35+rKj2lVEkWAookEWlZfxUT+5xop6m2Oxq4XdwdfbWdHaubN/krSS0PnkLaHemNiXiwCwV
 CCNo2xrbVbGYqxF4n7gxjYP1hHMM5QY=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec5238 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=pbMnnzsb4hIrvCsJLMwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HCwCmypc4cY6-SmWh4GruyI7sJkBoSmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050039

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:18, Nihal Kumar Gupta wrote:
> >
> >
> > On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
> >>>> What is the problem exactly you are solving?
> >>>>
> >>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
> >>> graph should describe it as port@4, not port@2.
> >> Nothing like this is explained in commit msg.
> >>
> > I will update commit message to explain it better.
> >
> >>> The previous port@3 description only worked through the X1E80100 reso=
urce
> >>> table indirection:
> >>>
> >>>   port@3 -> csiphy_res[3] -> .csiphy.id =3D 4 -> CSID selects CSIPHY4
> >>>
> >>> New standalone PHY path:
> >>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID sel=
ects CSIPHY4
> >> Then this breaks existing users, no? Anyway, what stops you from havin=
g
> >> there proper mapping?
> >>
> > No existing upstream user should break here; this is still part of the =
Glymur
> > CAMSS enablement.
> >
> > This follows the earlier discussion that CSIPHY4 should use the
> > CAMSS-side interface index as its graph port number:
> >
> > https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+=
gBT67AdQ@mail.gmail.com/
>
> Should use? Since when? Do you have DT maintainers ack on that?
>
> >
> >> Did you find any existing practice of numbering ports logical numberin=
g
> >> in this device, but some other logic coming from datasheet? Where?
> >>
> >
> > Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are n=
ot
> > present on the SoC.
>
> Then CSIPHY4 is basically the third (so @2 counting from 0) input port,
> no? Not fifth.
> >
> > Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY=
 mapping.
> > port@4 describes the CAMSS input directly and avoids introducing separa=
te logical
> > numbering for Glymur.
>
> Seems you opened a new can of worms, so this needs proper justification.
> Again, do you see any recent preexisting DT review which would help to
> convince me? I know I usually ask not to use poor existing code as
> reason to do the same, but here I actually want to see proofs of current
> accepted practice.

So some chipsets share the same IP blocks, with some block/phy
instances disabled. As a result, we need to decide whether we're
numbering based on active instances or on the actual hardware instance
index/offset. If we use active-instance numbering, then yes, it should
be @2 (CSIPHY4 being the third active instance). Alternatively, if the
port numbering is intended to reflect the hardware instance offset,
matching the register prop, then @4 would be more appropriate. It also
has the advantage of directly identifying the underlying hardware
instance, without requiring any additional driver-side mapping. In any
case, @3 is incorrect.

That said, since the bindings have already been merged in its current
form, we'll need to preserve backward compatibility when addressing
this.

Regards,
Loic
