Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D53F39E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291562; cv=pass; b=hZJoyFm+iCsl5S/lJSD1mB8GdcxWKx1+YTHs9E8lFeIDc8uqLJRR/8vV8xQhy2lZM/id0DR35jFVDCB0mshv/wHNeQvH9lpwFZvPN326aISnmnmp5irZfga7tOK0tdb42qLArPK+w+cVx8P3e53bFx9d0SW2w/IgR2rMJgLKubU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291562; c=relaxed/simple;
	bh=MPABVIseIAARqC0xTK2wPjOUE3zSSruLj96y+D7TprQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e07uxKARYrN4MJ0DDbvaOIbO0/m+df2GNqzfRXmMCCGy9BZCUUO08dXHbRIAf5PPjcpmQCQouio6+niMqXXETJofMgBLkYc+MrSx9j3vZajVOyyQ/+FiOuDNCl5Ab7nb0DfINeTsHiRTTXmU1dpIvvlTDv/KdtktSswGkCdT9Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQXyu1uE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8b83URd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQXyu1uE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8b83URd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSxXU1823645
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NaTFv12UGcSuXmAqV/BU6fGEBThcyQSKm65R3Df0vI=; b=fQXyu1uERHc0IDdS
	ahKg7bHNYPNjfLGUFhhkpH4pHfO08LCR62P/qdYTghFG/q+S5xnheedQ0Bw+/maa
	ZulIXUGTy2NOJEqKS2ruZKW1/QsPaWXZtTM8ibVefzdWcbdW1RyYTMQY4Q5VIzZK
	vU7Yz5QjabDn2H+/sA0qADDLgE5HCkJ815QOYJ9ipAJM9sc5nYI2ALh+6KyxaamN
	lnNFHfEDSRlrQQDQ1s7tyRE2Vl4iHPjij+03B5drpnfyiGsIBiiueLrmVY3zzAAD
	kTzeg9ucIBX4KjVV0pLqqnDdJHGKJH150ElVJ42f0UdVF8Fya6z1TDfR0yLJOG7d
	mfoZJQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff811a0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:32:39 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-49ab6a82cd5so11657939b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784291559; cv=none;
        d=google.com; s=arc-20260327;
        b=F9jl6rIJ/WhlVE8YW4E7cZwCNg00u8nBv920vrW+9nfAZw82IvIJ1dYSv0EBQssjib
         weYb5zi45K6elAYzo7joRKQm1l2wqHNw5jSbDwhgpyn1gjgBHfL+3Ne8/8RXgSDsIS98
         eFKy6Wa0oXebCsCmhyGvlkt1698Blbt7BdPIYw3UU6hjSfErSNDUBcW2hgNRfah+9Sbc
         b9PEwe9Wa6GNxOtdPynuCZPXxBjvcNE/vFk/H4wsS4H5UdzV6f6iNHqtG3KXZ7FIQxHL
         4CCvfVK02t57MfDOQz7rcf327H2MkihChPPjXll00fK8+QkZosNDPNNYe6IZoqleMo19
         xSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NaTFv12UGcSuXmAqV/BU6fGEBThcyQSKm65R3Df0vI=;
        fh=BReQFOjhD7tLMhfBDtkmcu+vmx468MT7+zncOQ7MWOE=;
        b=TlH7XsTU0EJDTCqvNNt1gvI6hQ84ae0k/aq5dAz3EuyWqEH3tIECwzITrczHn9bSf2
         HYBaegKHkJBlbH8m2aAhkZ3uHZ50qIsQL3b5cK7Eto4b7LY9WT6cj411mmfJesfDTJVu
         gJdpsGCnwyCGkeXbY2QaareamxTydAYS52/TE7f/wxEtSnrrpEmcma2xgI4NJIv0CMya
         kDVePUvRnGRG4aYyeYcdeeEcjXMWFRQZsnezeqHN5NOuYSpDEuSJvQr7coD4CpCTk4Iy
         Mqw8dxPA0c0Tj+xSmApQgNjUfnUM/sKeIlYVRRsoLkWdbFRRE3selnSRScmPgQ5hu69o
         AbDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784291559; x=1784896359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NaTFv12UGcSuXmAqV/BU6fGEBThcyQSKm65R3Df0vI=;
        b=h8b83URd+yVWtkKPgcK/1NuWxcaG6vDPCCMzS6d2UYPiQiXLsZRqOtQAGRRFjICf37
         jr6/I8CqFbVj9f4pUsIo8N9qYdJ6Qr+RIoZMY+Su00+80Mlloe0JsDt3wNqYOxYghW6n
         Zy5G3znOHPdzl6eHG50F1IhxlmE8sGO/HtMi6WJtTnexEJSvV9S3OiOASE9R9n/7oqdd
         VdUgWM8nH/NVbcLFAVU6yWk+rvSoYhVEd3HNtfoYiKaiN6OikkGK20WEkFK9b8VfB1Tg
         9pyQixvGoglvt7jAPw03eTyBVJHIXNSwp9Nf5M2yMp2XUNwXqni6OiHYGt9BxPOAkySa
         3a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784291559; x=1784896359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NaTFv12UGcSuXmAqV/BU6fGEBThcyQSKm65R3Df0vI=;
        b=gPsbvRh7xmZtnuAWypU3o9PNgXdkU/LqR0NXyB48YpqQdBpF5tXNAOuraW4ns0YNv4
         YWZDurfwEzFeOu9U05KlMxpj95n3JB7px9tSP/bjdwPBpCUEFcX9SXF3B2DKXwZcIhZ1
         DnZT6trpcvLH89PtIP4i5pQvACWKyTwweY2hG/K/Dtu8duSpOb39qohiUhOaMOufSq+f
         QYvZz1NWKJjwKJvzJo/3L/g7t8MSnh73yPICFpgGJXWi6l/TzCst/oRvM9+E0MGcJCDm
         fQNQm9EVmxeF2+EUPjhtYTB/O4NhluojRi4mh7hi1XJ29vgk2yPrby9Ylm4mhN02gNRn
         F4Pw==
X-Forwarded-Encrypted: i=1; AHgh+RoIgpmwWN0KjynUYFhW5Y1PHao4zQtq2LICsZ6sxE5icXz7r5wu+o5x0+B8asKuKbgdH22ebsP+En1UtxCb@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsyaYgnciQLcCpYTh+5z+f3YkBgJjo6Azd2jqvXcJPF0lvsKL
	eTkJkQmyIdCdTETfrHbi3+kk4++7wHfHGkBKhxNmJxdUTNIu8O3sCEOAq20pLKwXsxyg51muOnI
	9CrEey0OEHSSUPvSDz9o23JCdRm3UbZfHOsoTuuW68KBxOv6LbHTjHUQNWw7GnM5gHdLbCr9gsy
	fYDol9swPuSLxfGyRwvUaoy/RAt9wBEhkHjWEnsrPZTvk=
X-Gm-Gg: AfdE7cm+LPN/+R5ckaMkR0hG5E2UoS86VhN0TGJkN82Ec5PLl2YgZESV7Mwvk4kbS51
	Q5n/+EyS4Ykv8Xd10IYnwf2CfkMpGuFRhZInoW/gQ2SyyHXWAe2VfuJaMXp40R0+1BDD89sLuXF
	1COni8zZkquS0ZXQ+8NxGi63BfrwCdj+ai843ENKL9tUi5bDF5+px2lydfCbjDcKWcBMvcTIWUp
	bD1C8Idnfgb+4DEE+1uKmgY8Z6r9zgTLluy4B14ewczbMBRpOGTQkWz3qlTgwcUyJZUW40Ka0hm
X-Received: by 2002:a05:6808:170b:b0:49a:7714:ed10 with SMTP id 5614622812f47-4a4d04fea31mr1048160b6e.32.1784291558993;
        Fri, 17 Jul 2026 05:32:38 -0700 (PDT)
X-Received: by 2002:a05:6808:170b:b0:49a:7714:ed10 with SMTP id
 5614622812f47-4a4d04fea31mr1048137b6e.32.1784291558532; Fri, 17 Jul 2026
 05:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
 <20260716-monza-wireless-v4-8-9b02e6f549d7@oss.qualcomm.com> <CAMRc=Mc3gt_uruVmUmqsOsvKX=52V4TBVC0hbo69KgjEGhch3A@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3gt_uruVmUmqsOsvKX=52V4TBVC0hbo69KgjEGhch3A@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 14:32:27 +0200
X-Gm-Features: AUfX_mxkpI4yt4A36hrtr3osmFBxHBcaHoAN8sUcij4FaV2PIUA1eDj0SRabmkE
Message-ID: <CAFEp6-0HnYOboVWc3GUG5qMN_phP4ryJp=T=LgZs2ujyX1isMg@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5a20e7 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=vEpM0QAct-e1nrr4oykA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: U8gTTfLSUjImjYUPU91zImSJ_YaTVJTB
X-Proofpoint-ORIG-GUID: U8gTTfLSUjImjYUPU91zImSJ_YaTVJTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyNyBTYWx0ZWRfX7LpelbO/rrXj
 kekkb4h3HyEzsvPq91v61HhrCYqcAmY/x7dEpTExI6wUXKrwmNraPicfPxFLqM5tQXCqVAIJz3e
 B9VsYiGm35AvOW/Mxt7xsGtiy7vrnaaawJyqK1I+so4e2qd/kGXQQPzPKel/Do8I/To5QCk0I6P
 MP7TJ1HrlipYVV+yZxaiV+aNY8+Q6YBVo9u7yTC+lsqiWiClt3yxidY6wEuFCLHQvO7g+y2LeRV
 V0Pf5kId6tFnFdCYx7Yl7KU+sBgObaGpvHIquZSGJw6b1+s8MzaC8SyysZdR6uZ5po2/wggoxCE
 k4AnnZ66upbKU8Ypw9s/TYayQkSrlZLKccYGvPnCxiN1G3cV3vZXwETuwsPRhhh05vCrq53CnRo
 D+ZKRAxgk6nYKkzZSgV9HOMl40IrHVU1WZUyNVMErbKSK4nrDVXxOm3mDL2BBOLROkPhae1gTJj
 dfdwV9krRcXEphnMvoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyNyBTYWx0ZWRfX8Okc/Z6Qq6E+
 cpp9BWD8ZS8KjkwVZSBalfro70aNifWYUnNUvKF5epqr3A0cPJdfCFsvjz2NqrDnYKeISXFl7jA
 gbGSZ+dVWlgpaCK/AVVYegkL7+k6iqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170127

Hi Bartosz,

On Fri, Jul 17, 2026 at 11:35=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Thu, 16 Jul 2026 18:18:25 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> > controlled by the W_DISABLE2# signal managed by the pcie-m2 power seque=
ncer
> > rather than a dedicated BT enable GPIO.
> >
> > When the serdev controller has an OF graph (indicating it is connected =
to
> > an M.2 connector), acquire the 'uart' pwrseq target from the connector'=
s
> > power sequencer and use it to control BT power instead of the bt-enable
> > GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
> >
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/hci_qca.c | 41 +++++++++++++++++++++++++++++++------=
----
> >  1 file changed, 31 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 25c4387136245fca25e375951f960d7240116781..22f6185a946ef04c45e41b2=
b34126e3f58d603ca 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
> >                       /* Controller needs time to bootup. */
> >                       msleep(150);
> >               }
> > +
> > +             if (qcadev->bt_power.pwrseq)
> > +                     pwrseq_power_on(qcadev->bt_power.pwrseq);
> >       }
> >
> >       clear_bit(QCA_BT_OFF, &qca->flags);
> > @@ -2387,6 +2390,28 @@ static int qca_init_regulators(struct qca_power =
*qca,
> >       return 0;
> >  }
> >
> > +static void qca_serdev_put_pwrseq(void *data)
> > +{
> > +     pwrseq_put(data);
> > +}
> > +
> > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> > +{
> > +     struct serdev_device *serdev =3D qcadev->serdev_hu.serdev;
> > +     struct pwrseq_desc *pwrseq;
> > +
> > +     if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > +             return 0;
> > +
> > +     pwrseq =3D pwrseq_get(&serdev->ctrl->dev, "uart");
>
> There's devm_pwrseq_get() you can use instead of scheduling your own acti=
on.

The reason is discussed here:
https://lore.kernel.org/all/20260716083141.GA4101439@google.com/

We want the lifetime of the pwrseq descriptor to be tied to the serdev
consumer device rather than the underlying serdev controller.
Maybe a short comment explaining this relationship would be helpful.

Regards,
Loic

>
> > +     if (IS_ERR(pwrseq))
> > +             return PTR_ERR(pwrseq);
> > +
> > +     qcadev->bt_power.pwrseq =3D pwrseq;
> > +
> > +     return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrs=
eq, pwrseq);
> > +}
> > +
> >  static int qca_serdev_probe(struct serdev_device *serdev)
> >  {
> >       struct qca_serdev *qcadev;
> > @@ -2417,6 +2442,10 @@ static int qca_serdev_probe(struct serdev_device=
 *serdev)
> >       else
> >               qcadev->btsoc_type =3D QCA_ROME;
> >
> > +     err =3D qca_serdev_get_m2_pwrseq(qcadev);
> > +     if (err)
> > +             return err;
> > +
> >       switch (qcadev->btsoc_type) {
> >       case QCA_WCN3950:
> >       case QCA_WCN3988:
> > @@ -2426,17 +2455,9 @@ static int qca_serdev_probe(struct serdev_device=
 *serdev)
> >       case QCA_WCN6750:
> >       case QCA_WCN6855:
> >       case QCA_WCN7850:
> > -             /*
> > -              * OF graph link is only present for BT devices attached =
through
> > -              * the M.2 Key E connector.
> > -              */
> > -             if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))=
 {
> > -                     qcadev->bt_power.pwrseq =3D devm_pwrseq_get(&serd=
ev->ctrl->dev,
> > -                                                               "uart")=
;
> > -                     if (IS_ERR(qcadev->bt_power.pwrseq))
> > -                             return PTR_ERR(qcadev->bt_power.pwrseq);
> > +             /* M.2 connector modules are powered by the pwrseq acquir=
ed above. */
> > +             if (qcadev->bt_power.pwrseq)
> >                       break;
> > -             }
> >
> >               if (!device_property_present(&serdev->dev, "enable-gpios"=
)) {
> >                       /*
> >
> > --
> > 2.34.1
> >
> >
>
> Bart
