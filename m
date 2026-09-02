Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5F415F06
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342165; cv=pass; b=fn+vdXvKwwwgX3S/eYfMY1sDzsR1SIAUyGdCBNOZOcNIWbpwo8J3yji2Y/wsJctrkpnLYHIOhn/kHfg6svC30YYmAvpIIhw98be7vIvmO5HgQLm7y/GUbLwXO9MgVL1TMfVKkdJgMP/rJPqMUMl6Q6sU0fYno8uKbPCogbanlS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342165; c=relaxed/simple;
	bh=aWe+No8ZS19hz230sh2JorbsRWoGkguobu79Z1ROYkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9db9r0S1ww0Bluc0Okqm8apkXkpkP+3PIDYrHhCiD4touPF2ZSW6/fNUT5jqdCwYtBfQVU/0rbRAXnXVtp/Ol8diV+YQ17qK86cjOGoG5MH/0kAr/ze6oh55j48U0E6kBof4ijtJgGtCGD1sVieIEjGSs1/2Dd4XEKvTgPVDRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEL+W6so; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iej2BrSP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEL+W6so";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iej2BrSP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MuVN1589989
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 09:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=; b=VEL+W6soir8eJes1
	BA69BHOtVllqXafA8ynp5/KFX/T7Gl3xJhtBesDN81kWMiizTe3IuDjE7mlvKU0K
	tWoH2QbZsGPyZmufhtS2WyrZqkGEp0kG0Ltfs9BPyOQvF32ukpmm6sD2SL1hCgjn
	WxckySLu1VMFbvmXXpCFdIbyAoblaC5CQg4UYvVaBVphVBJoZWNMVb3P3rAwKKlv
	xsaCWQVi+PyjsLUXFUT71R/ZEGOma3Inoxgout/EA9uFAP9ThFoadCtTB9qzzwok
	NcrcctZDzrdznAwRW/mfNjnyYenz1jUXNtIvchEz4KvaEd4gos8boScikaiYclpP
	RJWO0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy04pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:42:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso865395a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788342161; cv=none;
        d=google.com; s=arc-20260327;
        b=oTbZKa+lmKILwTdXEey+rECuzx1zVmDQFFZtuwkK7LZne7EhPxfJsWKri72TNbYz70
         uyCiur7V4vEmneckwdVbOm0W3vEnfynNT+JliCOtHSivGd80Xg4GYGN4CHFM7xoRijOD
         q89pVJhCYeKlCaDYRBCCyGO5tM2YO3y3Dn7HPyP8101BiJ7CZEHa2php/GxI9l5WtoA4
         8Fp0iQpWylbKQGifSsxOg1CyOBpBfM0+pKV/IlUhmd6L+Q/PJ6Z3BiscvPF3A7428rLq
         olUhfH38NqdiLUtLo+c2Ql0sWzJ3gjNDNU9Ldncct4vUiuSz2LZFLAc3ktf+TmqPdWF2
         kPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        fh=PG5Rg37RtZAO1ZtdVyrhJM6J8HlCkIcNgh+0Cl9uu9g=;
        b=IIgT730VzXELCnmp1R6xqA9TW/gOE2ztZxVXpQjGQKMY2fqmrqj2Tvkyw0RYlpk6UA
         n628RIXjIjONdfFgp/4vm2DLduaa8cQMJDQt4Hw3FmujJikP0ebwIbyIU/2Yrb+Excid
         ZmsF9PAG9rniWP5/E9zRbUxKiKQsAgsmEPg/lNSXqIlYg0DWsxUMi4vpIVj7iJqwlmwH
         rfIBFok/v2nVeFJuL2+ZxXccPRY5bR4RcGYUd6fZ75IvU5waiaPMdsGpG0Qxya71ECWr
         a6Dat96Dd9bm3QnKhYEKSVt64xYH+1sz1RTfibFwE7n7EsI2gUv2rHkSWBOafjwJT8PU
         RN5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788342161; x=1788946961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        b=iej2BrSPfzwdDczZYyfvqajQHFziNWg6vsepYlEEyTgoFTzuyz6M0ecyhq6OQg/7uu
         l0IRZeZ+h8U4IwVcG5yWWt9yc3cSsOstQaTOhuTGDkWMamiGeVc2EWzxUuM3W3DJBaal
         CH/+gZW6abrvbnhS5TGt7ILyFDuPbggJxzlw2LNRS7SW9Xbqm5FZZPzdBWGDMi0VJlp0
         P/yIHVBRKt1IJQvosIBs5CHl+uOZWGQW7+MtxyDrPzjGElRkLYhmvpz3uWCkEZIGgxUW
         HIEd3a1yb4MfO5b64/V18G183oK9+tg9H+FM/npecIrJygYA2KA+Y62aoEXTbj/kXDq4
         otqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342161; x=1788946961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIiOD0i6oZiqqv8K6peO0dyYUtMjzpeC8vLsBM0LYpk=;
        b=p5oDHzn8dSQDKUMpE7xWlqeXkzVY6+F2mvUisbW8mD7QjRwjOEymr4b67GhVgqBDXm
         XPjEK4wDVPsojj3ZimXkUfx+Tx3v+PufjFh1tWtXUltNpqURmsfO+KnZALNbJwD3jDUi
         9w6S8puTB957i9Q5VgQGwYAoDiCp9NpI3xtPWnHoAG0yooWF6L/bPEYe8gbuILLul+oS
         HYaMaOMFqHCvwrcGFZWmb3Va3Q7t8VXJlLpo85Pjdy/1Ay+Uadq96aywoPmmMcOWIXRA
         1o+4woURLOUfVgobfQy+sxsKiG7WfEWHQwXhHSl9bhSzlGgkHOk63lvds0NzjWGsf1AC
         wEyw==
X-Forwarded-Encrypted: i=1; AHgh+RqRPIY78PFfWbgkb226ucUmgPptr1aE2Wxt3bEWxBGO7KWwxUmmLSCQPHgxjb20L1c5x8UI01dzVQ8JT+pV@vger.kernel.org
X-Gm-Message-State: AFuF++lfiAZkBw5KHi8HCsRxgWf9611Fq7iYYwoa+FTQETROLzOmlakM
	d7Gd84XoxdVTYFbVbfxLZK+O7aQ5TXveCRSd6fLnEsRMalcDX1Zv+p/ro8bqZhEk97TBaSYyJWK
	a5st9Y0c8Yr6u38fUJVbLNB9vIJheMlyyqXDVrKIxDPQ9YrmE6FaarJLyi9psBrWrXeZRXnCuPz
	qYMaU3sEZsZQl9ZqNYp+cYmvStXxT5AuY55/ujKrHV2ts=
X-Gm-Gg: AR+sD11XWaMX6Zv0L209ChiB3lIFB21stBYdrzcf8/ZRtORJFJJrepNQVwKpRjYgPSq
	GwniVCYgM+l4Zg0GVY1IwkvPrT2s+ei+OSMHc4F/Q++qu8iQr3yv+V7WzzsCWhWUBPuIxBJb4aT
	JBym4fdKY8C3c30OVnPZgagtLKaJvMFc571yOHw+LvXclEmwQgxp/qUqZfuw==
X-Received: by 2002:a05:6a20:2451:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3d9ad268503mr5043422637.2.1788342161545;
        Wed, 02 Sep 2026 02:42:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:2451:b0:3cc:c7cf:5a44 with SMTP id
 adf61e73a8af0-3d9ad268503mr5043383637.2.1788342161086; Wed, 02 Sep 2026
 02:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com> <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
In-Reply-To: <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:42:29 +0200
X-Gm-Features: AcwNN1WALDMALJ5RAAfaqSF_k5ijpG9fT0E4A-HNX6PvS4KOXseUtPzRxqcGeEM
Message-ID: <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a97ef92 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VllaWavPb-a1161Ruz0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 51yapijxyBd6ONVyT1I5jQYpFgSakCpB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX87icAIOhlDBe
 AV+VE7DJTeIfDw6GZfqF7SHL7CvEfiIJbrAl+ooN77vh5KHNMbi/5UQCqPhR6QHlI/1zZs0lgVc
 1km4I3BTp0j5FYZtbhpoABiqW9KKf6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX7lfDxiVtB9W/
 UheMfrs5IDtXmnXjiw6YYKF12cGL6wzfkCaiQUkrLAywcmA57qq1IqxKv4qd+qUPS4LBa3z/mLE
 Dy+bjseZf/P3cBrpQXUTjASZGs9uyq4S6RfYVUK0QBsrD4XYIRYVZGigoOuOSpyznnFIeMfYiai
 uFAHUriZxgACZD72m2hTfGPFU7Mx9n7d5Is3ZOOvxwnI0/e4x9RFHEPrB3PxsiXFy3/p6kgrmiF
 WoHKoHR9zem7gyEf6FiqFEz/trN1PIGZVn92G/+N6VrHhTupuYQ/sLmbtP6Wx/Xi9tAY1ia0gOL
 RXo1OkvKWwcyGjH1Hew4aCmJys6oAuXbl5LMTQxt/yTl2k9eVO4z/258lgFacGSeMB/amHuLzoT
 LN2pvuI4hkChflT9UKOkjfBYegZjksUYV5LxSW8bL5i4UZysT8lES6BP985QMa5TnMe0vxOH+ZD
 Ji9l3kWL6U3rhuy0vIA==
X-Proofpoint-ORIG-GUID: 51yapijxyBd6ONVyT1I5jQYpFgSakCpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020085

On Wed, Sep 2, 2026 at 9:52=E2=80=AFAM Shawn Guo <shengchao.guo@oss.qualcom=
m.com> wrote:
>
> On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> > On Wed, Aug 26, 2026 at 3:55=E2=80=AFPM Shawn Guo
> > <shengchao.guo@oss.qualcomm.com> wrote:
> > >
> > > The Nord CDSP subsystems do not take their memory rail from the share=
d
> > > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > > power domain table.
> > >
> > > Changes for v2:
> > > - Drop remoteproc changes since "mx" of remoteproc is just the name o=
f
> > >   memory rail input which can be wired up to NMXC power domain in DT
> > > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-she=
ngchao.guo@oss.qualcomm.com/
> > >
> > > Anurag Pateriya (2):
> > >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> > >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> > >
> > >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> > >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> > >  2 files changed, 7 insertions(+)
> > >
> >
> > Applied for next, thanks!
>
> Thank you, Ulf!
>
> Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
> dependant DTS patches planned, so an immutable branch would help Bjorn
> to resolve the dependency.

I am always applying the updated dt bindings to an immutable branch
called dt. Allowing SoC maintainers to pull it in, for the purpose
that you just described.

Kind regards
Uffe
