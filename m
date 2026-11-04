Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800675;
	b=oiYK2w5tad0PKIA/vS9uTj214yCBlbKWlrkiThVLvFXWRrjJzWEzOuBVxZGmMRt/bPwd
	 4Sd3r2tB0tjgCAzRkhGo2RY/IG653GQV448NnEv1R7hnUmr8cyNl+t06L8R/gqbSTyuRf
	 sElK3F7e0kEhAp0Y+eIU1XzpuNQuIAVDzKWIHYbI2CcGgC4ZyrGwZkVpL3KnTBwj/RJ6X
	 YTzFepbPJEnY1pur6KoKjzSa2/L0VVwCRbXUiBzgpe+k5R8Gc8lMstsR8Wa4jlREpBXQt
	 jHu9H0NyIq8SHtcvxwxHBcPE71CdB/FED4E39UcgvV60OjehO2LnuWM2lLDxpBDAlwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
	b=VK/uaQRGdv9okMDLBeaLJfByECs0/daEWRW4xmz71zYcYxTsBsxnKp0ywE8/n3/m7CLn
	 oCBz9bGMD9hoAzuT/ggR3QECvScZ9M9rrXQ177nt+rBBNK5jTsCou6xChUPlUBYhgrwCm
	 zCyrgEfZCCBO+GDYZb2OtYJQViuaoQIXFTqPEig+M0Yqo4iV9YuZ2TJEwxzY9PS+5nfVR
	 9k6xyDowt1fkkE0v0yp44JzUOawlypXSF08iyQyWYi89lXW1ZyVbUA2pqRu88kI6lKQE+
	 ncCg5erq7fEIqG3D5FjcC+NkCYp+RIdHO+x7lZTDtyI/F8JYLVtLYyqg4gbdfe+eB7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ouSU9uHv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl5XKwUe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34A606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD34A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ouSU9uHv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl5XKwUe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaGIg2310652
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 13:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=; b=ouSU9uHvNZjQS1Jr
	sQUCLJFq6u+PlZrMTmWeVKcsBBmt5x2KuhKwsToZG6Wt4Cq/tzQNdKH9pSb/2t3k
	//eo32LQ7PnKeMo5ujtTz+NmICBt/b3mCmC4h8KYd62dY7xQHhozPjvG3/zPsd3c
	hxG7jW0kCWhNLLRRQ8ifJxMmnBn+K9KgmNffr48IHrciMRQCNWmOCoB+rqsbXI2y
	ZKriq66QRAwIcEUIHiDOJf8pZtn/qPJ5Innx5hQOn7Tz1DPJEobd6Z/zr6IawIhl
	M+GOzVeNdpPhYCA7v2oYGhu/VwoFx+YEqwCnEDAQ7UjUGSkgf4Ir2EWInwWtJcE5
	8KOSOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mv51v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:57:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so195769985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800673; cv=none;
        d=google.com; s=arc-20260327;
        b=CBjXVwUUAgpF4NxqikwApuDDgTFmB9L9zryQlEtyH4nR9fyHHvbPmSy5FfrTzJr4//
         1sD7zJ5G+gSNOYF5BKf1/VTcjFCRZJ9A37HGHgOfoudyLvbjKQ+9Uz2VZsQ2SfIh2W+U
         IAoAusXNVX6z/NdCKUqfHhyH9DEPEAliYCV25KXY0U02va//U5RGf2cJAHqm3ZZn6eMG
         VnTJ+3V7qvFYElbSqRCFfdTV+uWL08EipGNiW5tkbBPDz14GLIHSHy48caMfXhrJXtxK
         ZN8trrl/gz1D1DGFDXwAWz8iAU88zZoJPFPPnKEKmx7woi1T3tVnDcvM5f4je2RNFsdR
         esOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
        fh=dCZRj2KF7lhNPXKqGH6jTQaMaAi5ksYNwTP/lJbhWbs=;
        b=AvAWKXzzVKwV+2i3wttxWS3sdDSgAFyrXI1ihIEXN24GUsqnpPuj2OK9cakJ7O/MbI
         kuSG2h1ee0LFMlIw8XBPbd4dpOQiGddRi4ZZun8iAmEH4DiL4t+0RI/+PLmtR+8eFXZD
         hiXx6IrpG7CWx2uQ4JyxULXLwb0XJYe024IPRAPPL6vepea4omFktTRpf1uiuP1B/4hK
         RdrKLBkRXv2H0dw8iu6d/3Mqla2zu5t1c4cTUoWHlUHBNpjOVZkm6xUzEgm/p+uBEJnF
         ovWQv4FVY8RrAOTeIt6zioWI+BBUo9gmkmq//lFFRgQZ+J1RqXMGOf+30Ako0xXd2uvm
         SbHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793800673; x=1794405473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
        b=Kl5XKwUeAgK4qYtKwpTiCjS3fGGMAyYG0PTFruvZka7Kt0rw0anIgdV7tVeUk1a+Eb
         fEhMMypBubv+nbeMFBarsNJnnmhpYauv0clVN8KreitxBMrdXPFg/1QODE5QqgiTJrmi
         ImzDrogK9RyWDgSmMvIxQWC00kyfnsR3SHz4XyQACEPcJAT08C9XESFBxfn2403vAqH2
         DK4kRDeGN2h4N00EupZ3Ed8RM+7UmdjYuVAfmMSJa6J+6kyc/Kz8CbFltEnJZXLhsO4i
         K/nXhrgkuLP4EyaCv2OQMzWW2BODhPyS5SINvVcVxkgWMpuIZF+eguE28VophWqSae2j
         cNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800673; x=1794405473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
        b=cp7rmOGI8ISsDR/5i50ldbc3lMMVQEFTfFMf5YjFCvGOonBivXWA5kzUuo69+4iads
         oWx07cjDHpJAvx6HxhoRLw79EOwlOTZxcn2La0fdob8+JWB1w20n3f1wg7HRuR4JLZZo
         /KvqmQuejhpZWKzrZ7qGvgmlACbITFiZSZmOEuec1jGIOM4a5L9T8AOxoysRSag1El5Y
         BchDwJgW9uc7G7kKaYgM5qwcRkPK+kObNUGzj+saPR66pvQsa380BFbEQmjAvDhwceZG
         FNHJXWHD+x3VLV2hYrdMrzO7E4tE+WrHxRYnDh0/DObo4mCr4I9pCER3TWO5VDUKfjCb
         LHUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8hSmPkXfye3L5fDf1R4iYdxvNDZRMCwYzXM3w215V7fk4qm0rdUnJt7t7yBdKL4OMeW40b+9Nviw2rLNW@vger.kernel.org
X-Gm-Message-State: APuU4Z+h0XoyRiqjX7RkEvV+wnQ83psjz7PoB8rLlfkWKSQ3L5gRLUvc
	jFiQMdEJ60ug1CYRlACxZrfxcCjYysWIKHpw01r2OcHN/mdARATf8YKWms2//JCTG+LOIR8llAt
	v3fsPNpa0xu4dvW30PzjLFjCWpThhqMIsKTk+qqyvMi77vYMK0kOItl9aFdwKUCy2CKk35pVtrA
	uHzQRZM1OESfZvoaYxdCm8Dr+uOf2hP2TybyGlvdktTD4=
X-Gm-Gg: AYBFou13/1JAY7rKfu7RyQGr/geqcvfYLMScF0WgatItFvFFyP+6vsLce1vppGvWAgT
	cIj3A0BnQ3d6SVeaARGUa2mGl9Lp+teEix31oWEbbxR9mTCn/FaVpiM9swcEogK+nXlW0ENhb2D
	tyVC9u3qyF0RiISumrComp6Ur7vDdeNGofsga3OMwHz/hVpFh9lqJLr7sWhwu+FezXrH4ldyi5n
	zxPUZZzo7gWXT1QK2rXv3piUkxczVR3lejcmrIYy/4okV72ioMybAU7hbQtU9h/ucVB/WeVj30=
X-Received: by 2002:a05:620a:2a01:b0:93e:c12c:f136 with SMTP id af79cd13be357-94421824e76mr2728033985a.81.1793800672807;
        Wed, 04 Nov 2026 05:57:52 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:93e:c12c:f136 with SMTP id
 af79cd13be357-94421824e76mr2728029385a.81.1793800672357; Wed, 04 Nov 2026
 05:57:52 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org> <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
In-Reply-To: <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:57:40 +0100
X-Gm-Features: AclHuK-mOnSyKW92DZCotO3CUp-jOUZ6ay6K91i6pN1VBE85x3DMOn0QvWx972Y
Message-ID: <CAFEp6-0-PzDSgXykYaZzUocLkRyw8e0e4=jMu-aoodsJJ7UC9g@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Frank Li <Frank.Li@oss.nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gB0FB1RI9l6wltNyXSkK9LGASKRDKdJq
X-Proofpoint-ORIG-GUID: gB0FB1RI9l6wltNyXSkK9LGASKRDKdJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX5LxgaQBEPAg3
 gjoGIJ5I0tlp8EzBbHSwFxGmekL2wUwLPb/50C4NjOqh3jR0QN5pog2lohp1KCTNj44nIB1srRp
 PpwqeS/x0Agk9XgjzWzQgnEpLhJiClVty07RIAsY7tAdQiHvZ5YS+/m90/Cl9dhhi38eJ96KHeP
 mpGzDzJLuwPdJdJyk5ruTsaWJQe5FUqPeh97nPg2ks15In4rwVCMbHBEosRqpnFPaQSl4p7Z6h+
 LsmikO6t1qfU1Nh4Wd+GyocG6F6zD30+hJHHS/mX/g2KqPxb8QxK61qPPxWyKgaQ3cfV9LMbhmf
 8KykWGOiHrBNNezHGcLGYCHHF7w6JfzWB7voOda7U4yVujyyIhC5pdD5tU89fbbFShwUDpTHAVX
 vs9MwIwr6ALWbebbQORjPzBpjOreHA6/ImK16w58zgzdUO6ko+WV13fNwJKlMWGQ66ACSZKaSxA
 Nre2uUWfAOePxmxhq+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXzKRucBx0hdUu
 PNeTEc2OiT12Y79mkw7X2T0Dno5EYGr67rMRLRNCMlPRPwPZwK2/ej/z+Dwc0YNW0nPGxzlayB4
 jYDQk45q3IXgKkpZFH6URa31I4PsW+M=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb39e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=d51twBc9FUXZIZCEJ00A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

On Wed, Nov 4, 2026 at 2:46=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers=
/media/platform/qcom/camss/camss-csiphy.c
> > index f99eea2ef228..dcc005674d8a 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 =
port)
> >       csiphy->id =3D res->csiphy.id;
> >       csiphy->res =3D &res->csiphy;
> >
> > -     snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> > +     snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csip=
hy->id);
> >
> >       return 0;
> >
> > -- 2.53.0
>
> I'm 99% sure this is a change that was made @ Frank Li's behest i.e.
> that csi0 is how most other systems do it (true afair) instead of csiphy0=
.

But we're still using msm_csiphyX as the subdev name, AFAIK. Is
csiphy->name used anywhere in our case besides internal debug/log
messages?
