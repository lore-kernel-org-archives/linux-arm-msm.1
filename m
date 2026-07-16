Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3179936215B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216768; cv=pass; b=M/rsWMBLs8ONNIqV9pZUHekQO8l3WDr1UAXDzBSVthKj6puy0rWIavRV4EgtNl3KI+AYxfiIdBASqzLRUDq2yA4DG7jk3u78hRGWyk9gDOCXdpbJM8uLSpJHT56MSK/80yrx9H9Wzni88yEXSaNt/JYz1/6zjryBnTc3YkI5vbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216768; c=relaxed/simple;
	bh=OZGEF2emtiuHK15ItQmuCRN8wNze8eKQC2CdaVRwh64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXAXbIkLAtOBvu0UtUGtmEV+BzhG1dAebq7CtPx9mzoec2wjqUaFTVIflbuADbqfA0RzoB4kJhPJ7YRzZ/EhCz8d0oybHOQhIH+0oKj/uuBTd94H0bTHIacGzQDSn6GCWEiQTUkjMfJrE2fkTq8NRkoTO0LUHJs7glInIIja4SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUIZhSGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRvQ2WxC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUIZhSGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRvQ2WxC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJdah2946554
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DaKMG7bPmKzijn8fMJPZ5Vh5EOk51mz9rGu26Crb5wY=; b=FUIZhSGNkDxiCWaM
	EJ4RUB+hfB3tOgb+1kGgQVAJciKke+hEDM0FAnLlSi604B7ccKMnjFzupW5BCQab
	kstEbZHlMgNve9ly7m0kJnB4BpvgGOM4/sy12A/WqD0p10vinVPTIKFpY0vIOTC2
	NNdR+61+OvOMn3+QBoT+H9BINQVb0XamqAC34pdHE3AFahRMBiFirPNEkorHQTV5
	gxev50CWP3yN6TgIe9P7K8TSx/UQJtxxmRNsTnsUN2LDvbAwck4pMrCVQ39uouUs
	HdKktWI4LE4c//gRH1ZfLunyhw5hJoIsfomNKXLpqjXRddb4OgTOjnMxMdiRCv2s
	CnENJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wba5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:46:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso76549501cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784216764; cv=none;
        d=google.com; s=arc-20260327;
        b=Wybtl5u1dEAKkblXoHRG78L9sl8B+OGcFLYEY29SRDI6pg7kcDZry7kegOUAyb7LRi
         bjN+JFFlxqyX7TfgnEQb7xPVDJlL7DBdJFpHhugASX+kUcYStf5zXc+tQIYpjTBy0Sf8
         tM5NlXLXG1zSQYBnCBy6s0zTYTt+Ja5418iGic9TCmNYoqfauK+PsodK/swrKi4RmwXr
         e2ebmvcdGl8dFCJNfeDUbq95uyAX5Ceqoondi0QoOyn1GfnqwJjKPj1uUBDVF31RbrgJ
         hzlqOCp3C3ihWd36QsMRtFEY821PTZm5Zn2KD9xFmZ96RvpHzQP7V7Ww/TFQihjCC59i
         n3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DaKMG7bPmKzijn8fMJPZ5Vh5EOk51mz9rGu26Crb5wY=;
        fh=O2zARDbf5iFQYOyEE0qG88qz1z+x/AdhR+KdLx5JoyU=;
        b=Cd3CzqjCKZ2kgm+8/AO0USGnnx3rVHrUutAOMZUVwyDl6/Neiziu4FLEwiYaOIungK
         VPTcpp1L9nDb6XsEmlKjIzJXQNSYprql9LTDOoQUNv7j7oWE33AWN/yRe66UGDfoNbYG
         2VnElSz10KpcjIuz5L3GuZZ//KHXaCXytWnRn7w8NuJv3jX8jvdcBERnZQ3nnaE8BSNR
         BkhZtHEXmVyCzk5o63FOoKx+xDRlZwxcAWLDAztOYMT5m48gd9WiP1iDmbdDdErKpU1s
         EpagQPK8O6E3sEYRccEhQ02bitxCUmdF6eXLkfldqBNgxd1cMRolTNUZPkGUwOhL18KM
         +xpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784216764; x=1784821564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DaKMG7bPmKzijn8fMJPZ5Vh5EOk51mz9rGu26Crb5wY=;
        b=WRvQ2WxCnJYcQTKl8IUdBrcKrMQZ03DOrh2vYolxHatvLVU82Ww/qqfsBRjVD0CLr2
         hu7MU5mwPEHU6/iky/XU282otJ3zC5wIIbWll4hzNTlTWo4mC/D2zPsooRboADRww04S
         WutMdqy1RaAgZRqj2QxPLWtBL990ZCGcvi3PzY7Q0BGR/sYEt2MRudvoKndKIJa2KsEs
         Q5841MTw/ctwiyxUb+Gd5drUA6qmfr+Yfhc/vfRYwjnYx21Mcw3uZbEuX1FVzcFF9K6x
         koQ/V7PGt0N5UvRrl8IVUWGKCmWB5olS37avSyZ3dS2D8siUSXN3zkwwcQMV6gdJQ+FV
         uyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784216764; x=1784821564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaKMG7bPmKzijn8fMJPZ5Vh5EOk51mz9rGu26Crb5wY=;
        b=K5Jp3tym1DL3jde8NhxyuJWyVYqh5BO+BxyxzOGgRiGXddonqqEUnEkxc1ycWA2jws
         IAzDDWgNG3MBnsL62+ryKBFr6RIrVj777b4ZVYn/j/yDcXg7HTmnAUixZGAcfOUqokEf
         hdmpf/zslrDrZYrs1C7fcuaiJcWJxD9awF8hhnphQq446XFvyuw8/390U171d4mAUXxU
         0iMjAvdRvNl5JjUSSaQV/J8cg4dbB+XGITuNZgR30GlSCT1sguXKcuVhBUS0JdcXLOoZ
         oGVXROI60DD37OpBFt8S8c+PFXBCI4bPQ6eWVgAdYMENv7LaDt9LLxE4OO/kYClB2Nnr
         GbJg==
X-Forwarded-Encrypted: i=1; AHgh+RqCC/MvXADpXTV0VDUnmhDnet3Ok4TZ92oVW8si0ojYKPC02N7dhmYfwc02XY9/MBIQUyjdOHkkyz1td/e7@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbuQzcTlihWnC7tJVhZ2ZAk1yeKqZU/+Ap2c9GO5gRpmt2zOh
	DyNMur//gFbaVrtQDhVwH/I0pTjEj0E2xrN8dYXMWXPhO54C0JIkiA+7cFsSmUW0I/JLelIRQh1
	P8/0BccwYghnxQC5cgX0R4d5T9Ua1/IVY0duuDp62OWHjs9cyC6J63RxEaoGvsjv5j7U7Mrjulg
	Wz+JfejSVN9o1imyvpOp8SmC9TcjojsCRnX8NWMihpvOQ=
X-Gm-Gg: AfdE7ckGDRWmHXmF1v+BRo7bkJVWKUi3WxwY5a12qrmpPOdI3bJXogNaqaW3Q0Vp1aF
	Wbd2h364AHk7BVK+3SO1cUPqoXXD9QS9BCpcyhnbQHjbrNY2+EzSiLNLC9vnq8AxDjG+wPKNtjs
	JwXwUbEaw3HDj9VuaEuhiMR8p5YgzXRaJx5jThT4UYsKsi+6tCf1rcY96Cf5uVoWKtrQOSGKP5q
	MACIBfIUiZmpwW+Rzzu5E1rjJimMWgWDvRCMb9F0oBuL/+tkJ7XmOYbLpZGZ7BC34PsdNQ33RBp
X-Received: by 2002:ac8:574c:0:b0:51b:f549:c706 with SMTP id d75a77b69052e-51e423528d7mr115571041cf.16.1784216764142;
        Thu, 16 Jul 2026 08:46:04 -0700 (PDT)
X-Received: by 2002:ac8:574c:0:b0:51b:f549:c706 with SMTP id
 d75a77b69052e-51e423528d7mr115570511cf.16.1784216763565; Thu, 16 Jul 2026
 08:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
 <20260710-monza-wireless-v3-4-46253587af64@oss.qualcomm.com> <txl2wo47ftsaqwh32x63kmhqwqjx5xpszoazccyeqdqmjzh2rv@ocev6u7vzdiq>
In-Reply-To: <txl2wo47ftsaqwh32x63kmhqwqjx5xpszoazccyeqdqmjzh2rv@ocev6u7vzdiq>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:45:51 +0200
X-Gm-Features: AUfX_mz-fKvzynmtc1c_-d4E51SyY4cnAP-WK134FPMEMzbs42O_5YCHtKpJhKI
Message-ID: <CAFEp6-02kqoDvvGSYy+2uM-gzvhrH3OTUGaxu32pEfj=kOVHPg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] power: sequencing: pcie-m2: Report power controllability
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
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
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58fcbd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4upAz5BH4U1jwP5PTYsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: okUAOZIJU026Ee8ZPf9agoER-vFce08V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2MSBTYWx0ZWRfX/FowSJYMsn/z
 /gXYYaGNPRkp9VnllDCtyKXpYn3Az3I/fZkWORbdGLNCnoyJ0cd+F0C7XIFtURXCjeL6dyyuU/Q
 TWwD4DiAVJvbiGnsAbca8HQnAnWxUQU=
X-Proofpoint-ORIG-GUID: okUAOZIJU026Ee8ZPf9agoER-vFce08V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2MSBTYWx0ZWRfXykCDsqyxvdzu
 WPdKsTEQ7vfToAHSAZ42qYCxuK8chSRr9O8moJ8BkQRXS5vRwjk9g2C0nNFJ9jJtWSuqCAMtEP9
 FG3R2vFfom/bOzz3HhShRxFZuyQeXc5knpPNkC9U+PUTSzoG3FL/i/DmILhwbIo5qYkF2PNgPji
 7QcukkYsb0TsGMAXaqu5xVjn00U0IntPd3P50WTuZLSmAYDQiltDQl73zLonyW6xBT5x2wR9VjY
 avq9oZVuRmEIwC+47mBI11/D/IJx7pqWnIVfDgaKvVZDgfLDpMjkB28CuaqmDNwUOUWgj3+vefs
 yefiPqU/aNbCSfa5q9dyfQ0phxF84nwB4RDJhjvalVYkC+S0sJ8Q9sJs902wFeedRSJqZxyX4UY
 oxlsl3gBVXd3woiBVSPVpx0r7n4l4Dh9fd0gwXlo7xii+9ONh4u9YS7pBplvOcttLW9jReFTCMV
 Lu5dNYlwPYd0ut98JHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160161

On Thu, Jul 16, 2026 at 4:27=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, Jul 10, 2026 at 11:57:30AM +0200, Loic Poulain wrote:
> > The M.2 Key E connector gates its functions through the W_DISABLE1#
> > (PCIe/WiFi) and W_DISABLE2# (Bluetooth) signals. When a signal is not
> > routed to a host GPIO, the corresponding enable/disable callbacks are
> > no-ops, so the host cannot gate that function's power on its own.
> >
>
> I think it is misleading to say that if W_DISABLE{1/2}# signals are not
> available then we cannot control the function's power. Power to the funct=
ion
> only comes from the core 3.3v regulator, and these signals only enable/di=
sable
> the radio (WLAN/BT) as per the spec.

Yes, though in reality vendors often use it as a reset/power-enable
for the functions, not only for their RF part, effectively powering
off the Bluetooth or WiFi subsystem (and the spec says that when the
Bluetooth radio is disabled it may reset the Bluetooth feature). I
guess that is why it's part of pwrseq in the first place. But right,
here the control isn't fine-grained enough to gate the Bluetooth and
WiFi functions independently, but power/3v3 can still be powered-off
as a whole when controllable.

Also, in pwrseq the targets are named 'pcie' and 'uart', but per spec
I think they should really be 'wifi' and 'bluetooth', especially as
Bluetooth can also be connected over USB while still controlled via
the same W_DISABLE2# pin, though we don't handle that case yet. But
that's another story.

Regards,
Loic



>
> - Mani
>
> > Implement the per-unit .is_controllable() callback on the "uart-enable"
> > and "pcie-enable" units so that consumers can query this per instance
> > (based on the runtime presence of the W_DISABLE2#/W_DISABLE1# GPIOs) vi=
a
> > pwrseq_power_is_controllable().
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/power/sequencing/pwrseq-pcie-m2.c | 26 +++++++++++++++++++++++=
+++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/=
sequencing/pwrseq-pcie-m2.c
> > index e3ba9169144dabbf0c553c0a4302c3b511fcaaa1..4bcd5078609da1be966ab30=
c73cffae5e578934f 100644
> > --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> > +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> > @@ -84,11 +84,24 @@ static int pwrseq_pci_m2_e_uart_disable(struct pwrs=
eq_device *pwrseq)
> >       return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
> >  }
> >
> > +static bool pwrseq_pci_m2_e_uart_is_controllable(struct pwrseq_device =
*pwrseq)
> > +{
> > +     struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> > +
> > +     /*
> > +      * The UART enable is driven through the W_DISABLE2# line. When i=
t is not
> > +      * wired up on this connector the enable/disable callbacks are no=
-ops, so
> > +      * the host cannot gate the Bluetooth function on its own.
> > +      */
> > +     return !!ctx->w_disable2_gpio;
> > +}
> > +
> >  static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data =
=3D {
> >       .name =3D "uart-enable",
> >       .deps =3D pwrseq_pcie_m2_unit_deps,
> >       .enable =3D pwrseq_pci_m2_e_uart_enable,
> >       .disable =3D pwrseq_pci_m2_e_uart_disable,
> > +     .is_controllable =3D pwrseq_pci_m2_e_uart_is_controllable,
> >  };
> >
> >  static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
> > @@ -105,11 +118,24 @@ static int pwrseq_pci_m2_e_pcie_disable(struct pw=
rseq_device *pwrseq)
> >       return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
> >  }
> >
> > +static bool pwrseq_pci_m2_e_pcie_is_controllable(struct pwrseq_device =
*pwrseq)
> > +{
> > +     struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> > +
> > +     /*
> > +      * The PCIe/WiFi enable is driven through the W_DISABLE1# line. W=
hen it
> > +      * is not wired up on this connector the enable/disable callbacks=
 are
> > +      * no-ops, so the host cannot gate the PCIe/WiFi function on its =
own.
> > +      */
> > +     return !!ctx->w_disable1_gpio;
> > +}
> > +
> >  static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data =
=3D {
> >       .name =3D "pcie-enable",
> >       .deps =3D pwrseq_pcie_m2_unit_deps,
> >       .enable =3D pwrseq_pci_m2_e_pcie_enable,
> >       .disable =3D pwrseq_pci_m2_e_pcie_disable,
> > +     .is_controllable =3D pwrseq_pci_m2_e_pcie_is_controllable,
> >  };
> >
> >  static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data =
=3D {
> >
> > --
> > 2.34.1
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
