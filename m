Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258FE30C160
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729023; cv=pass; b=iEeR/obsbmd4ehf8HQAn/XpOJBWjeUAPec16E+hjFF93R8s4Tv9HCdRj4EmKzrtyCaGbjzWgXBJkukDkvMQAA9uOqXpyatx1gSJh+UxjF61I8FXdcWTcVofV/MyalQE+Ma5iVTBABI1BszsxqmclIharOVBZsptabziYM27L2kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729023; c=relaxed/simple;
	bh=9BXUcoy3CAeMSxcvCAPOfPkEc4i39QOOqpzCKSbVSoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HR4tyBts77od6cRN3MmAsKkdSZvrjaRjCqfklPO1KT5CQ467DelBnd4FBTdUnLzqs/ie5hPh2jYGKPnYTfPdADAwaXjIyOJwaRzXtfcjZ5Luc08Uz+Id7jiwiRFVbXFHnr1SYdGHCxTe4shH2wB7C+tGpzmKqeywj9DSHp1yYrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYm9xBcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+EiTHEq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYm9xBcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+EiTHEq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWsE12030955
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRFQr63ZSylPso/HNP+U2b8fPiMqqyDzBwofu8YbHAM=; b=dYm9xBcG8kVwxrky
	/bur/aKqjVfS0RYCmkdMA92gzwoWHtMB3+dfmWF+0449iVJo6Xzt9+OPidVPjQwR
	qlOQeL1+aD7HFoOYHVZyHd7hBddQ2rCN+q7Kt1qcXMrd8JCH575c4AOpqrPv4W64
	+55Wxx5YEYiccsjZPZY8jUh43n/nPAR5HzVnmP1Lsv2rm5zHKem2qAjSGZXFxGgB
	3m44lcZ8bLTTt48tdRhi5Cg0tiNh6hIvh3W8fxtn5BzbcWdq06cxx22SOtorBN+c
	dd1EH/t3dHT95y5qhRVQ1FcTwQDJs/485WRooEDavLzNJlFwGnWI1pfqrb6dF1GQ
	nyu6kQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr839x8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:03:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so2153356285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784729020; cv=none;
        d=google.com; s=arc-20260327;
        b=Oi+1fCOeLhroIxChacwI5YTDfuwhTjcEBpxhmYr4ZJv78gpnI9TuO58UQRBZY2SIkH
         imcjbRgM5DPi+4h/xIyTnTmhuzYuryUjOsa1Er088mfhx6A/7Dz45Jlm/trWtSk83hhB
         AKIkWYkZxYBxnrE2k/gVAbf8XlUXCvvAZatp3UhdwO8AT/CjRbh0DNRnfJdTZAX06ga5
         6GuF6NJajP6sbq3yMLpeFOxpyhlO+LAdP1B1/2Q6/WfT6l++BrSuN/hzvu/U3+ELln0f
         8SYeKSnZWR/Ja4EPcHSNkpYvRlQEztcdOSgMCp/FaLk9h3i8gh/PIDRUTo+kMb+UC1d4
         EHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SRFQr63ZSylPso/HNP+U2b8fPiMqqyDzBwofu8YbHAM=;
        fh=AKVHulbpx62E/gB4NNAjSvmfxOqoNvZc1a/dHp0g9w0=;
        b=gKGlGxxChySnJwXRHzPaE8UP5qQoI8839UZF3OoxQh4DymWsZCl8vVRTRXk+gAgtCH
         ooTSPTCDi6yUwSprFKo+ZY0zXyLmHLlITLOW4dPgI7Cf1IPFWwyedhpfx+zD1didHyM9
         0bbPiwvSygwoOeb26JLQKjSQk3FWf9mqxQvhMnF8m0cl5Qn8NOx/foIT0PC94XR0P0fi
         9dPf4angLPojTsrYkycTQalK2kciN7j1HhXEW+2jtNA7ZTseF77vagMPFMlU1lkT6EIc
         +eZA7NKmNuv71AWgOOgJ7YcblolLeVg1RlRXHSPpKzLGhSKu5HoFaRDtXtxRAInp6jih
         2zPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729020; x=1785333820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRFQr63ZSylPso/HNP+U2b8fPiMqqyDzBwofu8YbHAM=;
        b=K+EiTHEq4bGq7B7wQS2xXTUsD2Rziwlc9qlY3WyQvkUfo+C1Crki3AmQZXcb2NB08X
         ANh76zXyUEv+6N7WC3umVwG8TpUlyBxQt4bGmt4l2E6QzJTdTKfyxiHRxjoyBi2/dJQJ
         g0eE2c+L6k0/Yo2xJrqn2mUmORUorktWR2eUCulwODL1ERiYNGga99DTSP94f0eCopCj
         OCUdQDBPHVhPfO600Hbvcy3Iq2CJafpxl4XMgQJk4BkPxknJ0serTF+m9Tu04INsWHdN
         M6zk6cNCSwf8nxKjtdJhI69XA40gas3Orfvsiygxjac0W78iyA30D8zza8SMq+vRW39/
         tjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729020; x=1785333820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRFQr63ZSylPso/HNP+U2b8fPiMqqyDzBwofu8YbHAM=;
        b=Zo7H62XEeMBFLrLz/QJ+8Q5DAW0VOtnQQAxXhiANjk/SPA5rQ6ABcZufsiu726kmaL
         VYM2SaRDKC8glRuPxpuxqWndt0EIgfbR7HjRczh+3gqbwWP1rtND7GE9FgB8eyx0kK/y
         GXL5NRUKK7e9M1Jex2W8TPB3FTJaCOE8Bn17inzZiN1JGZ4drayErNKt5Grmh6IC8EUi
         tooZv0SIKQeJ6GpOcNKQbKCM0z1KG08JhWYuPA6ZcYSR3YNTIhJKFxRoHQCSyaSOCS0K
         /ifA/8LBlrNIGYmKqagMvKKQlEHxo+BfRmKgnBFW8EklygcUZ4bWCab1NpW8h32EjEMh
         sRaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj8XvmYwSAvZZT7EEug2L/htrE92wDG0W9x8RX8oTI/6FGKJLMXNnccehnGYngCCj1P1vmvt9EmTP86SsN@vger.kernel.org
X-Gm-Message-State: AOJu0YwN47xZzJYMDGQvy6sfurp1w3s0g8JL/rcFHA4GP3GiMUmGWhfC
	leOio0mc9KFtO/biu8LphcZuksK8UlykjexMk1m0VXqN61vP0kzp5gW8P3sdEs06twgF8bNpfpS
	V4xMla101fZq/YK55fkVQjKuFMXj/oqMhCxgR/rsg68/pvl3p1yNZWZVvxB4kY+Ij8um81IH0U5
	ePjzg7+jyOm0GxXvXv+1uAYaXiIj/T6u09Ph9JgDrtyRo=
X-Gm-Gg: AR+sD12HTtOrC0E+qbfgszZIDFG4uoPAg6tfxAPMqEWbn+E1B9jdHVu/skx1Oxwbxf2
	94+qYEKt+8iplfGQof0qV2d5HUszicYGDPSkwaYS6DWxPYIKMEQsnhvAhCMlys3wWEZ/ms7msee
	r0/gNfgEwIvp4eUyE4KCseASfHXKK55yj1Tit57Tm2eeBpcpoqb3PfXBoe8DSSGh2QQI7NQ9Upl
	FWsHr7sVUXvvPEOlubTYpwQkTB6Pl3zM+3m0/EDcRzgM/QMtR8p++EMdoLTwBysS+wiSKGWUuA=
X-Received: by 2002:a05:620a:4514:b0:915:a953:4b9c with SMTP id af79cd13be357-930b3e9c3d7mr2246944185a.3.1784729020179;
        Wed, 22 Jul 2026 07:03:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:915:a953:4b9c with SMTP id
 af79cd13be357-930b3e9c3d7mr2246936485a.3.1784729019587; Wed, 22 Jul 2026
 07:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
 <20260720-monza-wireless-v5-7-69ec6743543c@oss.qualcomm.com> <oha2k2z4gts52xjrmjsquqbhikbyfrequxuuwpqx4pjcdiwuqj@3u3wvmkeivkp>
In-Reply-To: <oha2k2z4gts52xjrmjsquqbhikbyfrequxuuwpqx4pjcdiwuqj@3u3wvmkeivkp>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:03:28 +0200
X-Gm-Features: AUfX_mzfczekzqEbUNlANz527n61RHWYJ2fg8CBXx6C2Qs9MbAYmlEYmPQ31HQs
Message-ID: <CAFEp6-2_ah4D2ZvkvwN2hYaJ9adYT7i3Rr9WPMLUXtzk984Htg@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] Bluetooth: hci_qca: Embed bt_power in struct qca_serdev
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mVrQSrgz00tOwT68Mrf7v0D1GWIxP5BR
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60cdbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=Z-KoOJIlDxAInEDke3kA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mVrQSrgz00tOwT68Mrf7v0D1GWIxP5BR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfX2KwukygqvObS
 1+TH464cI2p8b/W9HqPW5irbs+K8gM4lvpS6VXnWULy1R5ddl9a2Sw2lTHOPgU8cSEsd04jErX0
 D+zvO3viRcWQ61Qp8/Bp1hw2fW0xdMF906lTZAKo5yMGA2aDIw72VSWqldXG4Yj3nEcnpuQcuX0
 tSoZpxRT3mZEa9FqCbhq7yhit+CrxBVSdsf48yut4qpmOfmN5wCWy/KAHYcswQShdFA8Dti9UPJ
 LxenGmsqHDhh4V2pbzbSQNX5C7u4Iz+kmvxMvhMjw601XQJWwgZqY7fkzHVv4+6uhtnrPyxlwDx
 j7Xykx2uSNczMmBM+3ES4rO/PieLgZg8dAvafsItOP4tyfSwmErwaFm4Jun5q2gOYbgO41cMVip
 CoElC9KfDoKLV6VKXIen6802oI2AWHFoslOKZvlHjsFqEe2S+0KT6uguKt/orHIVbmbIU3/DCbP
 83nAerveMYkiKVpgytQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfX5Q9AaMJ9+aq0
 Rcb3nvXHfYw+nen75qmeF+PuKlcYlAmY0WOPha528n3zZ+l9C9Vz9/2Jx34b0OBHtWZ//JvBZfk
 kzdyueCXp/abV7jzRENx11Vv5YXEnhY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220137

On Wed, Jul 22, 2026 at 3:19=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Jul 20, 2026 at 10:04:09AM +0200, Loic Poulain wrote:
> > 'bt_power' is allocated dynamically only for a subset of SOC types, usi=
ng a
> > switch on the SOC type that mirrors the one that follows it. This is ab=
out
> > to become pointless as the power sequencer path (used by M.2 modules) i=
s
> > independent of the SOC type and needs 'bt_power' populated for any type=
.
> >
> > Embed 'struct qca_power' directly in 'struct qca_serdev' instead of
> > allocating it separately. This drops the extra allocation and its dedic=
ated
> > SOC-type switch, and removes the need for NULL checks on the pointer.
> >
> > No functional change intended.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/hci_qca.c | 72 ++++++++++++++++---------------------=
--------
> >  1 file changed, 26 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 81fa41915363ce577ad7c6f25fe1b0a69536d462..7e4cb03d3db0722e5f9fa2e=
7a5a9a0894bf4f18c 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -226,7 +226,7 @@ struct qca_serdev {
> >       struct gpio_desc *sw_ctrl;
> >       struct clk       *susclk;
> >       enum qca_btsoc_type btsoc_type;
> > -     struct qca_power *bt_power;
> > +     struct qca_power bt_power;
>
> Can we drop it completely, putting necessary fields directly to
> qca_serdev?

qca_power groups the power-related resources together which makes some
sense I think. I don't mind moving the fields into struct qca_serdev,
and that's a straightforward change, but I'd prefer to address that in
a follow-up cleanup rather than here, unless you see it as a
requirement for this series.

Regards,
Loic
