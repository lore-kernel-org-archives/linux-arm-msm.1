Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD04E36DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564021; cv=pass; b=tJU38HZ2LpxXAtuvKE5Poz/7gsBqL/ryPsA+d1BKW8mEI8o9Jv1kg9bYL8HOGMvK0/NlCdsO++P9Hzm8XF907tnyQksK0Ne/+v7I21af5huPn2sKzbhDj75jYGJDoFx6pfZ0oQuqkRCOFBslTcgNuRlPbzuddRtjfsaWdvz5JIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564021; c=relaxed/simple;
	bh=O8BZgU9vbT9VzKGigoj0YhIQo4ixHDL264tHQrF7gDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB6CDUHTg7sLwn25zseJSgQbLTyilIFr0qUaeNl+2yImyPPLxWZEa25Xk+red2H7ZuGmYVo9DbeRVzOoDNRNagCF1U9M5jWVBB9XPtj/TF4JeDkw5l0a2Xh/bmbFPBN/QhJ7Rkn30GejV2J48wh78oxEKjjQni3XrFx4hEf2LV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzVoZ3gE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBs2swyv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzVoZ3gE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBs2swyv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbCsq2841287
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 16:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=; b=BzVoZ3gENy1gF6ye
	qYehjQ26tYEkKPZmjWraQwf4erIChnc9V+zoKmw5bLBu/exRPi7Q4fQrYx3ftdoI
	K41uJG5h4TUThUzDcLqOKWXAZRWXwdyxHqyKdtPeGgIVQxaUQwckq2o981X/uk2P
	QMvc/NRZdN2sNRQIqMu8j4KW6cwuGjwHBGdUi9xWWEK47GmlC/04OS94KmujDl68
	iH6EB+Ce1KfP0MgEASzew9nXIUkc2wFJsB/uRNB50GfOwmEsXqfgSgZ4/uku8L/w
	x3X6Yb+LnS4+2cNJR5+V/SpJgJwA4Wlr/PtgkwG7jY4hYmBeF3Rc2nYg0s4dRhAk
	35WfOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h72ty0b3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 16:40:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9199a63b9d3so196346d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 09:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791564019; cv=none;
        d=google.com; s=arc-20260327;
        b=dseCkGccI9hdQRnql92Ni16kbRR5azBRJg/wO8B9BoRcjpd3RT5U+e4oZLgdculz0O
         Bm+i8wx+cua8Bl9mcLIX1idfDhVqKlpgZtP3bVnkezx1eW+NT4GJiWrdDAZqzZSz/yrU
         totsoWPoDG/19A7na98tOT6OFiU85XIOF6GqlQTUpBtQ7q1oattRSMagco3MuQhLEQSR
         MHd5Vu4og68XVKPelyS1jCTjlN5BtFvT9gxUbpN/4HtQTU25YXuQTl8DSTfGuEZQg5Dr
         Lx4RylyQaMN1QWz6GNKplGvZQJU5Plv4TPU7ySUSwAGComrsiw9I/r/QWlIn2vZTehoc
         YRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=;
        fh=ugY6nlMw36UDLy9EMTXQeVsBira52y1QLwca7M6I2gM=;
        b=KCukDYy63MY2z0U2o0dnapUutPlRkuLFQThH5s7vVTquekQajZ6aTBJBqm/ynqaBkm
         mhws2d7VwgowNK3zG6o3AXYVfGwdZayonHAHGjit7A1NeSdW2Ahr0uLc8qTvojpHhAWe
         TGi7sU+LpcV6H23pIXK97YtvhSG9n8RmS8E0PYD9/0P9T8hzO100VCHhqJI0iP3G/Mhf
         UaC6+t7WnGOim2Era4IGjdSKVcdVA+56Iy8ozAznaQtrBOsJUXw4ZhawTEbXFQsMg+OO
         6OS6P40H1LkYSj6KQp0BXQ9wdvG9nPD9MSJrkhp+UTmpVTV/THs3zWqnWwI30EM7HmnU
         VKNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791564019; x=1792168819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=;
        b=fBs2swyvZBOfk2KVO5FEc04xYgLuhAZMmXCuuPsSJu9J0LoO1mXm+ZSW/ovI6u/zmD
         NeHYZrYGip/ndFzhL3P7Wh1nTOAjaRQ/aYrzrMpUBQMmHJYdekLLzFBkUQz1YO20dyLR
         ACK2jkA1gg8UJc1d0JFdFAKSYHui4ICO4aHWYjcqdvr35QdJlCji6o94e/Dl0oBizIeu
         2uJYW2swCJcxv4o+fi+prOewV1nTP/ErPYml8l26JmmvKLoTyhHmblZXuIMeDaRF+Aw+
         4wTM1HxkgegNyl7wZF5hU+0xHPKINBQr966bKVbFCD1M7tTfWIykR1iKPW8tjczMgdpF
         s+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564019; x=1792168819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=;
        b=10GwYTiafAAmPi1BQq7v6BBEy8oFGC3dI1hBv/aDI+W3p/uB9cmZJ1hMSqva1enPNO
         njHrwH1sReJ/StYlP7UoH5VlJPNJvia9eDQJhaRwURl5nyvC9KcmAxe6ZPJIOr+mOMeM
         ZAqVbr+NpgcBDKTStHvrTf/esB9nfD5qAQGxoMF5oYBf8rvSlZYwVWzf4SuyUGjvuT9T
         2oanTQwfE1LtDZ9KO+r1i6QbGqUN4odtAsZVZNhqZgpnNirPUDf0x6BMlHg/Y5vpegAo
         egRLNgJ5tmjl6OWHm1CF74Uux07cRpT/8IVnIeL7IqSiaJvBxs7MI7oG0DovUGHifcXY
         xfNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyEBBvvTfpRGt6qfqPIkUp6hyvuQ+11XZGg38OIWRUEVwMa3oEQIIcl+z5Hgl1brRBzA0NdgoVpmt0b0OU@vger.kernel.org
X-Gm-Message-State: AFuF++mN5MHbwTRaXPGDjMgVKHpMvbApY0DN1j5VCfP4iA8ErObmMlAH
	+ez0K6M4uuFqMsWNFLJbd7AxB5Nk+CRZqE3Ah4fTAFUxYP4J6K/7EQZOcWyoLLG37x5M++psXgP
	EAYm0uJDsDAb7AbJoJeEZajWfb3F63FAOxgAfSzRm7umsHXNuXP9z7kX1+q6N1AFRQJssJBmi2T
	WKqUF/A4Mk3lOMdOhE/RcKVs6FSkVZHfKXkLX6aKluY58=
X-Gm-Gg: AYBFou1awd2DM4qeyw7giks7EmF2PWoeK8M1byQ24HCN033JEFAHo8HaPdRDF6Pt6WA
	tq1/LHZyagZ2c1My7D+HM1V8A9spQIkeA3Ag+5prxVv5tCQFspixT8KwsfcKfy7zIdjeQ8Wm9o4
	wj/px2I+8BrOVX0oUi0HLl4zJFh6Z+KipeXpo9jfElJMyroEN4kgeCAHZsvgdxEf9QhzA3Duw6X
	mJi92GCP3bpmc7OXHZNYohIjW+eYDrQbkoHUiVjSx4XZ8/qzvrSry/l3yrA2xxRsvDwNvTT3g1F
X-Received: by 2002:a05:620a:269a:b0:939:13a7:70f0 with SMTP id af79cd13be357-93ebd0c260amr388805685a.5.1791564018702;
        Fri, 09 Oct 2026 09:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:939:13a7:70f0 with SMTP id
 af79cd13be357-93ebd0c260amr388800385a.5.1791564018141; Fri, 09 Oct 2026
 09:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
 <20261005-monza-wireless-v7-5-5a6de7662dcb@oss.qualcomm.com> <bc7730e4-8b47-4c2b-84ef-277749f2aab8@packett.cool>
In-Reply-To: <bc7730e4-8b47-4c2b-84ef-277749f2aab8@packett.cool>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 18:40:06 +0200
X-Gm-Features: AclHuK9ldJgKtc_xURMW1e6eF51wDo8WFdbnPxmGKItG6GLqTwM1Bp8vW5CtXNc
Message-ID: <CAFEp6-3Mt-CCJEz=RAJUh6pxH-Ssgkqfx3QQfyzvS9HwzFp9QQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Val Packett <val@packett.cool>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: StgWoDZSTboAKwm5nAdCjEjyqPmXTz8H
X-Authority-Analysis: v=2.4 cv=Zvd4uN7G c=1 sm=1 tr=0 ts=6ac918f3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Zz9X-WFLHu0qX2yPYA4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfX7q/arwdvZMGH
 bHORUCiPCKEPWX6ZXRn08oXLoFNkt/BitUo0kvSGp5KM6jUDwIf/T4ldXwybuGJ8iaAZNiFguZC
 msTtlSSbL0DrjOr6IP53m0tR+yt4Lpo=
X-Proofpoint-GUID: StgWoDZSTboAKwm5nAdCjEjyqPmXTz8H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfX0h71IvFAELK3
 XZlPGQCpOoCkcrdL8nj4dH2pb0qApDpGiN48nXc63qpcXpsWipAKEZEqv3YcPvWBeUEFWlRedQS
 6JFHc55UGILss4+OwkpkY5ZSWAFAf0qjaiMLMEIi9+3lBprMNhOtqcRpX3QNnXXnkL2K+Ku7uGy
 HdMAiih8rK03PLqfZX1v5w8xRp3f6Zf2/IzR61BimAQQOImhfy0vRmTI/uVZpzxdfa4+lDAmnG6
 76bWP32iz2JcXAafcTcUH3Dvtst3/SGr52fKPQOFheOx1JfrfMenQpAkxnB+m142twVcWBeN8l6
 RSSA8IHoubyayUP1KG/9eSlQQOE35fUUg5lMWg+Z/gCDxVGT30tvras0rhTSAtzqySBeWdlEM8K
 FelNKJSC6oTtLXUkKQeHdwFDtlvECep7skdWN+VFWbasAsj5ZAkDpAYLnlI3WeU6QRzfWnXLL82
 eZVk5qVCqGhuy/Bg+Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090066

Hi Val,

On Thu, Oct 8, 2026 at 12:58=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 10/5/26 9:21 AM, Loic Poulain wrote:
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
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++-=
---------
> >   1 file changed, 37 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 1d27ff98034ba99d0783e48db5c605f3b31117ea..b6ec1a57248e2cf4bd13889=
8ffc5cad45b1b4a8b 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1875,6 +1875,9 @@ static int qca_power_on(struct hci_dev *hdev)
> >                       /* Controller needs time to bootup. */
> >                       msleep(150);
> >               }
> > +
> > +             if (qcadev->bt_power.pwrseq)
> > +                     pwrseq_power_on(qcadev->bt_power.pwrseq);
> >       }
> >
> >       clear_bit(QCA_BT_OFF, &qca->flags);
> > @@ -2396,6 +2399,34 @@ static int qca_init_regulators(struct qca_power =
*qca,
> >       return 0;
> >   }
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
> Seems like of_graph_is_present does *not* return false for the existing
> (non-connector) setup which is currently used in all the laptop device
> trees..

If I understand the issue correctly, this can only occur when a UART
'port' is left unconnected, in which case the failure is legitimate.
The laptop device trees should be fixed accordingly, either by
connecting the port to the corresponding M.2 device or by using the
usual Bluetooth UART child-node approach. I don't see this issue in
mainline.

Regards,
Loic


> > +
> > +     /* The pwrseq is looked up on the serdev controller (which holds =
the
> > +      * OF graph to the M.2 connector), but its lifetime must follow t=
his
> > +      * serdev consumer device, not the controller. So acquire it with=
 the
> > +      * non-devres pwrseq_get() and release it via a devres action bou=
nd to
> > +      * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->d=
ev).
> > +      */
> > +     pwrseq =3D pwrseq_get(&serdev->ctrl->dev, "uart");
> > +     if (IS_ERR(pwrseq))
> > +             return PTR_ERR(pwrseq);
> > [..]
>
> So this returns EPROBE_DEFER and bluetooth gets deferred forever :(
>
> ~val
>
