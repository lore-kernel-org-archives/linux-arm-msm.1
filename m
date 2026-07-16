Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4E73DA7F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193215; cv=pass; b=PhjvMTFCRnq9PwfFXdjNhJIJBCH8xdK8/tl8+WbSdSx/hiTuF7Pe9DpKrfq37zZBY6JOes1dGEZzHvVkMEHcWLyKYCnPowJoWHc0F1eaWnTzjL2cStX2V757WN4q0ZpTNIMUHYGGo+7SGOaAGVQ156BA268XgoHbsx4lZagq8YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193215; c=relaxed/simple;
	bh=uCqDdKgSE05wWFAXOn24NCojvJkTjvFV4xaFhIaDAx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uK2zf1Sd+7Nvdqcvu5sYcoDqBAlWvPFO/fjWQ+hsgCv/YG3WaXux83Qa25U8Zda2uSm5+lMzxszLdi4CCvp0AKd8wYIojnQq63dwHA+J+cTOgkb9TgXebMyAtWZOD+rMqS4aMM3HQBFgKxMP37PaB6saZy8P31E4Phzgnb3pwmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7+5EgcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwLzV0hW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7+5EgcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwLzV0hW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DUkP1994805
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=; b=d7+5EgcKohigk/Rr
	f50a0z/LZV72FFBzPnB6iROcFhInecWl+0+L0nY99Z41rukIuVSOycIuzUr8v6u1
	YzjXctSOPfKgBVAOxptCXH+HqIPNSsAgSdenpQm/tzJXy3Z1mQiyoNsvWNe8nHQY
	qy5rsaM3RL1ctlWQLte+ZhcU4mIkDF3clW0nMB+E8GgpBhPQbyffYyS9Od0w88w4
	4x91VBZjg2haPe8dxW5CjnJ29A/PJoExvtdKA9LKvcFb3XmtFjoioxot6lUajnLk
	r4i+E2BmY425n4WZEI6Zyx1MEPY/a+j7WCdKMeMa9TqBRbj8+KnLAAcMWUDu85Rv
	0PMEeg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjy05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:13:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-904dac0f77fso104412356d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193209; cv=none;
        d=google.com; s=arc-20260327;
        b=Ma+Po+AIvuwal82o8NHwjeise4dtXGDzhmZBS3cPWCARz/yFnko7vB2g9foenTkpYV
         OIuJ+DpU0eq8i7tARfNakavR3SlloT9YlYoxw5XdHeTDMIYOvKYVsyYWCygHgy/Kt1sZ
         1gHh7PRQMT0dwOeuyAm/HnnJ7FXZEhy7hKI04GQcm5fwLtr0+aGCWEp39ujKkICZygaO
         IbLFv7368tKDvRqjOyAIB99mMw2Wbgi6tFuDogIjOdTeCCmrZledhdnXfNgexNqJC6ZF
         ml3KHsVEna4e35/YUREC+Syu1OrZVDGNHzShIv01rOFzzPiACNcRHHfuTL4wQYBcHFYL
         3k1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=;
        fh=l39HP6iFvpk1qw1cLundsHdD8ZrkcFDkAQT+IGRJo3k=;
        b=J+9E6LyXbb0WYiCVrWG70+TIbphPqbQxnxCcq5USkXBDqlitu57YVmG32eHDH+SNdX
         ozhGTuAWDvxOZki2xchCy68fHvQYfHRgG+KMgxrHBWcV3v2w3YVQT9MG8G7pe34WB/g4
         qWIVkm5IKkJDSsgNlfeaTMbNjlmveWf1TyZMmL/r7g46xxhEvXYe9cEFkXtmI8kPJVwU
         LuGjdLo2ewaNjZx75liGx+nhYL3KLxUumq19wmwgjkfZYXhXCBwoKR16VAE85wbrAef+
         2nRbI0vPaWj/Z0cf52SOI+Vem9ucQpHSMAZKhRBmHMJQJ17Ogr/hajVZPZGM6xnVIqe0
         x2RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784193209; x=1784798009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=;
        b=TwLzV0hW33RYt8nI0/zpwTi7ztoge/roka6KcZ0Jcdz9gRd2W0DHuaLsVUVXZdz4fm
         LOZ0smBTI+KUX5b5koWhpGqvy5jO14cE+INR+8QkJUYK5ujgKWhnulvLTp9IhdcXdj4V
         +a0h2sg33nJu1QJuQDW/bT9U1uej3ZaTLCjbV9runbis7DrI6v7WSmXs15Cc0vtupRbt
         PAaTzIlB0Q0RFJ4l+rnZcOb59NkdFkXe8p0VAjhH+AbtEdRsKkERuFRvcZxt4mVpk8Q2
         XapZGn3a3bgZ9+xnIlzdHyk2uTmuY4LmQiAHPGj3z93FRJDT8pHnvpD3iAtWfIEH+WG3
         Qgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193209; x=1784798009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFVa49Pt2B8c2YYrLGC9UiUElbNn58UHEJ43nuRf8mM=;
        b=hRe4liRSulYjEcJsNb7iaLAp2Z7uNv7nkHUvQzGHbmmIo0dOjkcGGTHbjartd8s+cK
         UUSrP3c87uptr3yY6xxK5LNPeYWK3LxBv7pYShl6WMsPXBH4CExTWX3uDmX0LyVewNaL
         ra40p8uRDmjxONQBAjwH/P0h/fYLj/dT/jZrsaleXy85J+OYJW6aURExIrznTmmqhK+3
         spVHD9gq6XoCdIbWSgLh4JzAMzEQlzQeXkwZTNUvrXh4X3w1BZkE/wJSUBsLOmLCvI/B
         QdD3jEg5uetCrsNx0bFzaqs4i6/1GeOy68YQpx/kWBP2ywKOH2YUx3+waoyWL7gtIJIW
         iDBw==
X-Forwarded-Encrypted: i=1; AHgh+RrXpor47F44TTzrZ7SGIsgiaFabOIM3A8j62DLwI60LqbMBsjWtTztfuV/MHio8MLXx5/ibzVftTACikT3o@vger.kernel.org
X-Gm-Message-State: AOJu0YxdoTk0YeY9WwEuydzkcYelHNdrK+9jveBMwBV27LeNh/kTfcjH
	+2FWDyum0XJvrATaFAdFqjRXlayCd0JrKYtLV5NMRxYymkhhSjSonRY5kUYje5CQ6E10aovsinx
	ZZ4UMMraIQsnvg+ClD1uM1cPeFJ+eycsA4Y8avbLkKeB3pppdQAuuCTlrOQNSGOZttWlANnWhUl
	yQt3oXf+Gb9fa0s5g2ej3JGcor1RKjpX8CAujt49SG+Qo=
X-Gm-Gg: AfdE7clkGLKERcQaT3IXp6UXZLZTtdGLRj5drbb+JWZZkow+XlzZbwPHRmsHCOvVcPP
	Lnjq0TIrNgnHpJSLsAQxg764sGa0i2sIkNx3KiAQthNDZ4lrIrQBgAcZANMffHfTaZBMDB7/brA
	Unf8Ah9nA9KbM7puH1ismnj+KewF7ezAkvyqyRCZ+MlGDqkxPpgildWbXwgmKI/CalzoLwOL9vv
	p/htxuQqoTXe5zPXwSmtW/5NZTzvYjjpt58kaP7ipBZ2zLtVnMpEuVwNoGRJYwKgxIff3vn/u/S
X-Received: by 2002:a05:6214:428d:b0:8ea:fb8c:2e0a with SMTP id 6a1803df08f44-9074c766c6cmr114860146d6.28.1784193209371;
        Thu, 16 Jul 2026 02:13:29 -0700 (PDT)
X-Received: by 2002:a05:6214:428d:b0:8ea:fb8c:2e0a with SMTP id
 6a1803df08f44-9074c766c6cmr114859886d6.28.1784193208701; Thu, 16 Jul 2026
 02:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
 <20260710-monza-wireless-v3-8-46253587af64@oss.qualcomm.com> <20260716083141.GA4101439@google.com>
In-Reply-To: <20260716083141.GA4101439@google.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:13:15 +0200
X-Gm-Features: AUfX_mz2l-ruyrBEqJdkcXUQ_DW7F-Cm1EuP-VtmhPBeabFSDhnP6vsS9Wv2wFM
Message-ID: <CAFEp6-0UJyekA7zE74=CgneqvxDbea0Xw+u8O14bpcHX8Yb57w@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Chen-Yu Tsai <wenst@chromium.org>
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
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58a0ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UD6jFWV5_MqAamJTNaQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5NCBTYWx0ZWRfXwJgI2pKvTiY5
 Uc+WnlYlEUvqoBPrCqOfuJJzzoVXNIOc85yLFuKEbiJrr/ct9XqjOy6o6OeL/j2Y66+vJi5qbq5
 ZFiKf7j4zatWAmvPcDrfXqj/YdhgwMM=
X-Proofpoint-ORIG-GUID: FpdqW1qtfLzRsREU30k-8RuDnxCm_5Vc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5NCBTYWx0ZWRfX5ibKVBZmlAys
 u+D+DW8vSJ5iEVSC3QLpVPe2ofRPmAmh9WydRWzTO2uZ2QGtqvU147ff0vs2t+IkqrK5Muoh/T2
 fZsg7+XjVcmEtMMDEHxxh2b06eGkSyKX07K18Ad+fbve0oDvyEF6rwk0TWs9Nn8B2V5EKAD3eRc
 TpQYZoAwu5MtxICi0zmbESL5sRHP8SNJCXh+JhDZKpS9BJWs28ZDq7FHDin7ryl6+gj6S/RmS5o
 MZnPei1LsgMAIumIpJgevEUTahF5w6Lgs+dKuRi6MclxZOhXekk0cyxRAhsjrssah79kpMu9qMb
 m3magrTqKxGjbixsGdLdwq/Kcb7fxIx3ffTZwijoSGC9ZfteOYoaI98x/HuJ6yyETEUe4YH2Th+
 c5dBTM5orSkDZq4n4Vd2mPmpVwuRG5ixLy6eJ1mjyk8Ed+cmatdirQ8FvyVaYlHZTxg0KJ4zU/W
 YkhCpLELWSzU+BzM5hQ==
X-Proofpoint-GUID: FpdqW1qtfLzRsREU30k-8RuDnxCm_5Vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160094

Hi ChenYu,

On Thu, Jul 16, 2026 at 10:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Fri, Jul 10, 2026 at 11:57:34AM +0200, Loic Poulain wrote:
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
> >  drivers/bluetooth/hci_qca.c | 35 ++++++++++++++++++++++++-----------
> >  1 file changed, 24 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 24dc5bf6d192be7e1d500df6bdf36e6184f9eaf7..f6529d359ffbd97f8a3c4c0=
593680ab200215b36 100644
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
> > @@ -2387,6 +2390,20 @@ static int qca_init_regulators(struct qca_power =
*qca,
> >       return 0;
> >  }
> >
> > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> > +{
> > +     struct serdev_device *serdev =3D qcadev->serdev_hu.serdev;
> > +
> > +     if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > +             return 0;
> > +
> > +     qcadev->bt_power.pwrseq =3D devm_pwrseq_get(&serdev->ctrl->dev, "=
uart");
>
> Note that this ultimately ties the lifecycle of the returned pwrseq
> descriptor to the uart, which is probably not what you want.
>
> I ended up manually doing pwrseq_get() with devm_add_action_or_reset()
> so that the descriptor is released when the serdev driver is unbound.
> This was for the Realtek driver. I haven't sent patches yet.

Thanks for pointing this out. I'll fix it in v4 via devm/action.

Regards,
Loic
