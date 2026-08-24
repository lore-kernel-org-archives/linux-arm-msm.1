Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852543F12E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562881; cv=pass; b=fQ7XkxtZaAs8I810HIG31QAkVoCCV5EesuLFn5tgnr/DmRdhYtWYKlg4TjIHDeGM++XIVeL4wf6Upv5pYq7wsMEk1o3ATYWGOsZ9/kFVJmDwqtkNK0qEPH8BffDx5xN/mAjL34TXAJxIIahSS197Wgslx4iLAGidG2vYDzp99NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562881; c=relaxed/simple;
	bh=K8j+qC5sBVeIB0di1b6yfJ6CIicUq5BKlp6j8EN6/6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hkw/JUuc4gLZv1a72r+mDt08O6Bp1cmMOxkJq9aiVBM7qAGpLNv69bL4ddmPkWYNSxNxOW10YUZI0zgZ8e08vTKEv9rXNKMfjCPs9Y1gfYgGtq9HeRTLddPz9ZHaayJ65mNlL6IqhmVb6zM/77UURWBXDxtNr3+3x3fsV1wOWqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ6fVi6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+HvcuVg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ6fVi6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+HvcuVg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O993oD1377941
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=; b=jQ6fVi6o4gesVS8R
	GAtMEjAf92/imkQ9nIq7QKNikOYjpBXmvU9n5RBn+9USmrgAhCaHM1siITXm+q+1
	WNvOxrtk2so9DLtaoIa8mRTj0jKi+0iomJiHKWOgK6LL6eVXmMQjxqZ0Of63nshb
	Baw59FlIGh9wZvghh2dUeiTGQAqfiLEt2W5fJCCsflsrYiRGTUfgioxrOaIs4Dgz
	KkCcPcn6TmoE+PFUuLqz/c/WyTfOCzFcmIPjHPIqGrhcsYASbMVym4qCM4M+kkNK
	fkaafPnfT3cdxC8T9FazQiTD7DIxul5MS98J7c86xbBX45l5pL7ZOazwop773ZoO
	6H37cQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0cgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:14:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8200c815489so120803607b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562877; cv=none;
        d=google.com; s=arc-20260327;
        b=HDMuO7LFhbE5i9A9SIDgHr7DlyltilKCc0nu3DhaID+fyXE9HpsH6Wc8MiP3uKp3Qn
         pn8phlWzwXkI1I9H7xaZEaFElyQ8URNsWV0WXVCSA4A7skp4GJ1A6cOpeEImNALL7+OL
         x79AQTmsYTUyj7ufX5nzWF5mcnvxofOK7lQt4ptdQIwnBLl1nzSsY4GuEs3L5Sojpomc
         PWUJGK1R27GYPk65nyYoFWPLQxrA9m63nzv5b9/SDnFL4cbrOAr80QQn05R31XtZtNTH
         XYCJJ55LyGaXIoLXktaqSswvaceWvrr+6csfDtC8Th6EbmVevvbzXlrxP/F4Xa59eXds
         /ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        fh=gAsPKGBPT8Y/LmoUDZ1wDcd8TxzSOcT3oO3JjXmDzVI=;
        b=OwUmlU1JILWDyL+gW55kXVW+b05L+QbYcTir/WGlbohb1+aXJ2kpRyVUlUD90ux6RS
         D/BU3FbR92bI1G1ugkcAaeU22xlMhOWZI5itsXjZ4K78NBtgrgiL7OkwyCySXl3xsYiM
         0M14A6z+iZYaWce3iMEjV7JQoygsXlvjTgPb0e9qUSkIz3Cz1mppKeetif53tPok8Yuu
         d19fJ82+XbmGLGopu4FcOk9NhEU7yOgvtbYhyW+vgzyG1X3+IjybJ5R0NKn/NU4Liuom
         lfXSHpve/JcGCsf9sOuXD8bWKzqSdrUac9CnagwEqKH5xpo3Z4CHW9U1inPVEsFS7UVQ
         ev0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562877; x=1788167677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        b=G+HvcuVgO33qZWmGU5uXummWGx4TWU0umGaYogzTkGI6wY7xDqozd2Ftf1YdlzSKDT
         DJxMpajJxl20H496D1fcSwV6G/F9p7nZSauiiXGYZyOBg6UNgayap4YH1cvzn5hm/gBg
         95FpuRamgrdznV4K2AJGfpOrhR1JxuCFPIkWVPpGhaPPPpsOqCOszW/d60nZtLqdPiiY
         exJEUh6tfDKSs2jRcRtS0RvikyqUv5Z5PfJlw2adnaFH0bH4cQcelP2+SvvSOloP9JWL
         BzUL29eVyngJ4HbepxOsFVwdI/BqShLMZtoNcPB74WUnfj0lyJQOTiUWN4oCa+01aSfr
         OP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562877; x=1788167677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        b=IopVymwE5eBtjku2iu5PuhbTRT7fWrV3iqLt8/NSdkGic9ktQho8f4cBtM7VQl+ori
         6/WK2QTVgj/QXL9bRX6LAfFU2fO5NEYvXcGk8CeO+mFL83RbOPJISR64XXxxvzVyRc6H
         X/NQm2KZw5oMHc4h/ql9uPaEYMlZMJbyE8+CTp8ueEUw02xzRMIApX8AidGxNcnhN2Cz
         v9B1T0qA7R1qpCn7optcyFjjXcMxS2I4RGPOjTVOC+ILIRzon+kBZHrV5z9jW3ByWMeR
         NqCn4ZwD+zfJsTgEYD1DcdhiQAMLyfFDdHJRmzjDlkVzP1NQfK16M+R1BJp/G2Zh4O0I
         ruXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9W40LBPAZUi0z5IupKDlpHs4uAOz3EV09o1WDQuby0N4IiQwx+A06Wg7y3glscV4KMwAaGVAMIIsDKYWB@vger.kernel.org
X-Gm-Message-State: AFuF++lp1U8jqe4f9f20reGLKqn7WNQr1WNOpu7Kejuiqwfq3A7G5oPW
	+0GpZKA2EKRnPZck4G53MXgGrUqck2RCv/bE7adnyP1Xd28vcQwuSpyf3qImfiBfYUB2CWvz1g2
	jh47Bcj5QdV/16vo0cJrd3GuYDr42d47zEY01ldCN3Y+aED98bnKyq7zu5dd7rEr8wv7QOK0Pso
	vxnBHY/HjhUjmT8DL/6UBdCyB5kr1XvaAFnBGDbUYDhbw=
X-Gm-Gg: AR+sD126xQhvg2KUHnF8Pyw/J+GKQbO1SDiLkviI6CeToRzT+s2Z+f191fG2RCa9TFa
	KI3LhFnndh6nQ3piWIG9CQQnIzujsoA2FeKxYd59rSXxz85G+maK/EvXwkwH5y/Mdg9KR2E3Uca
	3jqH1dwwEm31Pt03/6yjb9XV9BPAQXVETpR5T0LekeBsZkLlJ+jP8/uTCFAwY=
X-Received: by 2002:a05:690c:a648:b0:80c:d342:955c with SMTP id 00721157ae682-849ef49ad1fmr76365847b3.3.1787562877522;
        Mon, 24 Aug 2026 02:14:37 -0700 (PDT)
X-Received: by 2002:a05:690c:a648:b0:80c:d342:955c with SMTP id
 00721157ae682-849ef49ad1fmr76365667b3.3.1787562877007; Mon, 24 Aug 2026
 02:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
In-Reply-To: <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:44:24 +0530
X-Gm-Features: AcwNN1VyeWTTevjYtkyJU8B1OqqLSNiUH8LEUOVIm93k3AQStOqmTeqdsZFxI2U
Message-ID: <CAC-tS8CnvdmhRrZd58rDeEmtxbzR3W4g+85UW8Nse-L4J-31JQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX2SqQXSOk1pon
 bW7QpJCejuIuDWuYyhQNybj7QPqp+l/XnefJWL5fQ0CMOnrDwQo8em81TO53+2etTrhrGhxiVZY
 Jwqgy8I1xrHOF/5h7k4o/2y15hSd3QY=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c0b7e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=iiTjsVZ8Xzyo1PsM3MwA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: eBYiKhm3-ADGX8ZPqenbfywfqOIkAwEb
X-Proofpoint-GUID: eBYiKhm3-ADGX8ZPqenbfywfqOIkAwEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX5HBBrJ8iUusF
 n0T1vmEfbDIuD5qwWMBFksweMmxD3RnGvO2rfQk3ySyMbqVq5wF2UwP9gQ7GzalH76V1HIWgDdL
 6zJxaO2IP7kLUaUCg2cLSGP21e7Giqth1puSRXezZXdGjykwRClCjrFSRzs//XC8TPqDO79zXog
 w7XVpJ+Zl/TfVYmqJyS3PMarPo2OMsqAKO8FKeRUQkFpFbE9ksFFS6jUXAkiT34ZPfFO2RspQFv
 95h0/wq9jMrEaHZYtCQ+Yuaaz/Iq98gRMw6zLdf1R62SffATJRXFA0VprQttbicM2LQxpbex0Vn
 +ACHKTLVbL5tgaapEPVXc/KY9qL6IwekgwvY9fmCCd7DX7iLhmgC1IoB3DKO0DD+HqMk4NI/JtN
 X26CyemiWmByxlyanRrmNzWe5VOb/+zVfNHOO7+gt0GhE2VyadTKFBxmQ1xe1Ip5+wNdeKhF+iu
 83QyjV++tVBwhpUUT8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On Mon, Aug 24, 2026 at 2:09=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> Hi
>
> On Mon, 2026-08-24 at 12:06 +0530, Harendra Gautam wrote:
> > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> > need a binding to describe the controller resources, DAI cells and per-
> > interface AIF configuration, and named constants to avoid raw numeric I=
Ds
> > in sound-dai references and child-node reg values.
> >
> > Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> > aif-interface child nodes required by the controller.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
> >  include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
> >  2 files changed, 404 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-c=
pu.yaml
> >  create mode 100644 include/dt-bindings/sound/qcom,qaif.h
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml=
 b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > new file mode 100644
> > index 000000000000..134356114733
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > @@ -0,0 +1,307 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> Both of the links redirect to https://www.devicetree.org/
Thanks for the note. This follows the same convention used across all
other DT bindings in the kernel tree.
-Harendra
>
> >
> > ...
> >
> > diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-binding=
s/sound/qcom,qaif.h
> > new file mode 100644
> > index 000000000000..24706efd07d1
> > --- /dev/null
> > +++ b/include/dt-bindings/sound/qcom,qaif.h
> > @@ -0,0 +1,97 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
> > + * QAIF_MI2S_AIF* and QAIF_TDM_AIF* values are used in sound-dai
> > + * references and as the reg value of aif@N child nodes.
> > + * QAIF_CDC_DMA_* values are for sound-dai references only and must
> > + * not be used as aif@N child node reg values.
> > + */
> > +#ifndef __DT_QCOM_QAIF_H
> > +#define __DT_QCOM_QAIF_H
> > +
> > +/*
> > + * MI2S DAI IDs -- one per physical AIF port in MI2S mode.
> > + * Each port supports up to 2 channels (stereo I2S) over a single
> > + * data lane sharing a bit clock and frame sync.
> > + */
> > +#define QAIF_MI2S_AIF0               200
> > +#define QAIF_MI2S_AIF1               201
> > +#define QAIF_MI2S_AIF2               202
> > +#define QAIF_MI2S_AIF3               203
> > +#define QAIF_MI2S_AIF4               204
> > +#define QAIF_MI2S_AIF5               205
> > +#define QAIF_MI2S_AIF6               206
> > +#define QAIF_MI2S_AIF7               207
> > +#define QAIF_MI2S_AIF8               208
> > +#define QAIF_MI2S_AIF9               209
> > +#define QAIF_MI2S_AIF10              210
> > +#define QAIF_MI2S_AIF11              211
> > +#define QAIF_MI2S_AIF12              212
> > +
> > +/*
> > + * TDM DAI IDs -- one per physical AIF port in TDM mode.
>
> Is this sentence complete?
Comment is written in fragments. Please let me know if it is not
conveying the intent and needs to be rewritten.
-Harendra
>
> > + * Each port supports up to 8 channels over up to 8 independent data
> > + * lanes sharing a single bit clock and frame sync.
> > + */
> >
> > ...
>
> Thanks
>  Manuel
