Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DF2EEE85
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133450; cv=pass; b=W/vO+l1HNUMZ4CGuVwTZVjkivtNJmik+4pUorznUNYTEKAIWqVrw1/Zk7BgPZ1I+NzYeHjyzMaVl8Y6w4FUlPnRtZ+W5ojgTH7K4+GEXw8I1x27iWX8JGYhO/YOVbFOwagTCgzkdYnzNFSfPBecdd2pWVVjAf5COy/I/+y6BepY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133450; c=relaxed/simple;
	bh=4lD+fdIkCpFrkvaEllxA62fuWDDC2r/xs7a1CL8i7mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CaGGsdvmoSEXXvYQgyYSW7qryCGK1f2i6vofYIP3R4+DU60DW7d/VGLvEIF/psGoeLy4XcX8Q7g8mJp18owGTLxVwcM9/iBv3WqCXxkOyMoUivGPGizPcPpVD/VgZjPHyxeiWBfcT6vDA92NOv6YVduMghxradqKZ1+bsGVlWk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q57vn77y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsY42Gk2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q57vn77y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsY42Gk2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiqPZ328393
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=; b=Q57vn77yH7mItFiN
	HbECHovYkfHNaKUsxRSiapPrLtThlaB+VungMusAMsSE1txNsazgymFPBdWh2vaH
	KuH/nefzTW+NbE3279Ns5I9XNIArPzDiWdilKr+2+JdtX8r/mBr7gtkaxR3+cruw
	I77qF4ASJSp8IZN6HXRt31ZYrGTTOPTmZNphFwbp/y4rXaR8qNRTAefstFYs300S
	CtQwXOsC+W5/vvkiJ+JZOyzcLwbazL8GU+Va0V62KREMUQcnjN/fOIU7Z1ptwxJE
	fEy69jtv5krdtGF/J0VKRzl5RbtuZNfBF1Sm3T6cHvaySz/cn4xfonJP2FavEt3I
	Gzm7jw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q43586-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:30:46 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47cfa971c9eso1987959fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789133446; cv=none;
        d=google.com; s=arc-20260327;
        b=W1la3Th4aRIkmeCA/OC3/RT2ogVzowBMDhBc4l+f1M+ChDnpjMVuyXCRi5xPcE62W0
         tPTEQXNTjA+8dpsXnFDxcc9W90N0bUgAAgBJgAfpiHMLB6h87Yb72WG2IDC/tKBlPzEe
         5gsfhZzv5OrDqlDgqZikv11kmDIQ+lcTM2tW+vgq4Q4Acn6GND3k6+qHmyyBGn4AnX2j
         N0hUjhUs75SboKeX1TX+G0kRuOWA8atc9AOWVK2FDpGGqfmWJSYMI1mroJ/BqUgM4TNZ
         M14tnROvaPnBiNdF6r+G7efu+SqxMaOrVMNWmfIg0aPTlfb/dU/xIJrffsWGbjqPBRjn
         MuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=;
        fh=UOL6ymA8ueQRc3eOT9urdTvHMsoqNNFE8pxJb8cH64g=;
        b=mmtOfR+GNWL0/NkBx/oOk5FQtbKGSwwZr7Z20Z34YbPxzuSacpKcfPaNLP1s+omQbu
         ceFp9IYIjAbBSG59bLfnfnkK6SfhdTEyh3Fdg+/2u5DtOObKFdREMW20SuqM0bGKwaX4
         2zQFWng8ckDu3GI4B3EWjfygu4krFQQj0uDszJE6R89zjDqolQBs5q3JA9wKNq31y6o7
         phVNlNf5gR75t8Sm1tsutrBtKCDAXt3cG2zIn/mH30L2OoWgZt3Eh67iZcIKG0WSw6Gj
         v3OrbZZaBO9dGiY4QZ4lTSDvPPyhAXHzrbreLaDqzDLcBzeoFXEJw/0btNw7oXboeR+6
         FMSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133446; x=1789738246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=;
        b=KsY42Gk2UMVjMINpGxN/HbSFAmuIS3xrGe/BfTNhHfa2JPozDkFLB5JQPMuJ9SeWCx
         /twNdPwY62k9nPHhpAXSSEJzmoUSIuIJgS6G+tbkMc9WGygaq6l0gFhGduW8O3r4ZIIG
         WrQELxaEH8DxbLqHDw8djYRrJEYxPxEnxud/RSPnTXpYxCTBFTo1cBn4TzeaJVuuM2UX
         D6/9Q6sWBMgysEdt4YVV0OTCDsEE0TF1+OdnP2pc5PjmZG6vdckH9UdRvXbcY6LYoDSV
         r2ZhrOYLhyy4m3h737hG1IRpqelFBkjA7oNtlhPFQiCvCc9xzEkapyiPTmEorhYnp3DC
         y94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133446; x=1789738246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=;
        b=Wy+1CCc4yiiU7AJM2JD8Zj0UUvOJrkCJGdQ7tdZaW7j1P0M4zeaQF8qeyBx34GQjMG
         +WyvMgza2oaCBuD2FKzfnOnWIhUqlla1hTaLev8cOj7I4rLRwjDfOgM1oSqkuaRAqzlc
         7U3bfXhf1AbXbDgNXKKd4q81DJ5nCVfFVpnv1qTY4s9sUdSkZWaNvXzY3UPtWrAT53+H
         5eir3UJrMtylhDtuz+eUGXemLBPk3JuYA6oflpwQ2xFTuqOLgPdXztwt0USUOfyS68IG
         5KOLN0WLO5GLdUVIybEWRCPDq42GQ7GoTUAY0NN/QeNK8sOmHbl533SlZ7g/tz53dH5v
         X0wQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2Uh5foHm3+CP8V+iAUbiwfRUx94pnB8DLgPPaHC/C7oLkU1Qc7qBN7nRYXVRh0GJl9dJdUTqBIpY0TJ9z@vger.kernel.org
X-Gm-Message-State: AFuF++lrzDum0EtHhfGAm1rO2w9Q/HH7Zkmswp0eYstO57AXGQARghp1
	QsD5uLZMFZPmq0NqQz2jb13yirob1b7t/VT8C4yb3IUtM8dSz3B34tVmXvE9JAtxR5i7QCwC9Dr
	9MPSnsKNcPC8R/Iux6yaYrEQTqpVFbfLSC7ZINL2JnCpfhtLp9n9C82vWbsN6QxKIxeo4XW50k4
	+VbDhVHX4L5xq/5J0s2RvFdmqqi8lyQdYXYUyHMcqPHeE=
X-Gm-Gg: AYBFou1yWAaGR2OIStpOZRgSKFKw6kbmrRmvnXTU7EF0+dQ5rDEazYmuKs1STSGMhpD
	3tLnJEHTgm1aNKxLXbirzqhv0lNd0v69CwXZ4FsRVaKCcXU39NBBNb0f0CcIFbSozeFluYwZLco
	tjFzIFUKZeAEhVL3hauBedRzFV7p+34H31p8EH5zq9UswIb/Bc2J5bxpwuUUT8wrwl8fQk+/tXN
	745HFNudJTWEdaPgYKkjjkMWia8z0FsFyFHJgW9J7hkWzbZ2Sz1nKptfYryopIj+/bOU4RYlss=
X-Received: by 2002:a05:6820:811a:b0:6ba:34ea:ab69 with SMTP id 006d021491bc7-6bf47581f20mr3882175eaf.40.1789133445721;
        Fri, 11 Sep 2026 06:30:45 -0700 (PDT)
X-Received: by 2002:a05:6820:811a:b0:6ba:34ea:ab69 with SMTP id
 006d021491bc7-6bf47581f20mr3882147eaf.40.1789133445219; Fri, 11 Sep 2026
 06:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com> <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:30:33 +0200
X-Gm-Features: AcwNN1VovD7pUCq37SmPVPwwNaq8BfJG5K7uCD_DMBZqK3zJMYoKlf3viX0P7rk
Message-ID: <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BMY2d5gQ6_59zPGxgDwuE_D-WdvULdoE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OCBTYWx0ZWRfX5zBfx73qhWzG
 hWzdFZztwiKKV9OVl7WdodcXM/cgRCl6cM0wGRqHFmMXPTfy40o61SLg7HEe6OOyrUZFAOlKJm5
 KvlvpWp4JMp4efxAutiFuWMiu5aPDnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OCBTYWx0ZWRfXzUWDi+AWMrt8
 g1ctvmejSvjk5SEA5BjbGkgmTLqCn9Vnz//49QEiY74plijNzvPF94c8HXy8t4F4qiZktB1vxNM
 jc/quDaa4tSaBiuYVYw8SV2JlOfJK8yIroqcWDbTnuMjDMHpBofd+e/xx1Mf9eDqe4C6bzv06uJ
 G3mHzSyGVekqq5mEQmV4/5WCdBIQH4+0S2JduJaa7aSxDO5mPlMC4txOTqwTzsran9hFNNLqCUW
 /Vuk6NzCpydg8Y/3FNWG8nDWUR2ZdZpTXHGq8rasO3CxnPB81yeRIupH+3N+SEppsfPt5G+bedZ
 GFi2ReEEJt7JyD+YoV04GVOg2D7P305MvHs7ZSoDI5MjKKoEQUD+kiheJx6s5v4Y9jyjDmgbM4Z
 tdbugcNbbtD9Gv0LPlBg5qEk+0B3cJwW694d/LOlNUfRzQ9ETisk71d1gh1Ir6uIeJQp+21Vvey
 dNZxRdeb6TqBdkWwTdA==
X-Proofpoint-ORIG-GUID: BMY2d5gQ6_59zPGxgDwuE_D-WdvULdoE
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa40286 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=PD6HDMPEw9IjBIrcI7IA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110188

Hi Gjorgji,

On Fri, Sep 11, 2026 at 8:22=E2=80=AFAM Gjorgji Rosikopulos
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>
> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>
> __csid_configure_rdi_stream() now takes an explicit data type parameter
> instead of deriving it from the CSID source pad's format, since the
> streams API keys each stream by stream_id rather than by pad. The
> existing configure_stream() path is updated to pass its per-port format
> lookup through to this parameter, preserving current behavior.
>
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>  1 file changed, 51 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aa..2512cdb16d94 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_dev=
ice *csid, u8 enable, u8 por
>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc, u8 dt)
>  {
> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, =
Pad 2 -> RDI1, etc. */
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
> -       const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
> -                                                                  csid->=
res->formats->nformats,
> -                                                                  input_=
format->code);
>         u32 val;
>
>         /*
> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         val |=3D 1 << RDI_CFG0_TIMESTAMP_EN;
>         /* note: for non-RDI path, this should be format->decode_format *=
/
>         val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> -       val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
> +       val |=3D dt << RDI_CFG0_DATA_TYPE;
>         val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>                 if (csid->phy.en_vc & BIT(i)) {
> +                       /* Source pads match RDI channels: pad 1 -> RDI0,=
 pad 2 -> RDI1, etc. */
> +                       struct v4l2_mbus_framefmt *input_format =3D
> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
> +                       const struct csid_format_info *format =3D
> +                               csid_get_fmt_entry(csid->res->formats->fo=
rmats,
> +                                                  csid->res->formats->nf=
ormats,
> +                                                  input_format->code);
> +                       u8 vc =3D 0;
> +
>                         if (tg->enabled)
>                                 __csid_configure_testgen(csid, enable, i,=
 0);
>
> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rdi_stream(csid, enable, i, vc, =
format->data_type);
>                         __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
>
> +/*
> + * configure_rx - Configure the CSID Rx front-end
> + */
> +static void csid_configure_rx(struct csid_device *csid)
> +{
> +       __csid_configure_rx(csid, &csid->phy, 0);
> +}
> +
> +/*
> + * stream_id is used directly as the hardware RDI port index below. This
> + * assumes a 1:1 stream-to-port mapping and should be revisited once
> + * per-platform src_streams data (stream id -> hw pipe) is added.
> + */
> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, =
u8 vc, u8 dt)
> +{
> +       struct csid_testgen_config *tg =3D &csid->testgen;
> +
> +       if (tg->enabled)
> +               __csid_configure_testgen(csid, 1, stream_id, vc);
> +
> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
> +       __csid_ctrl_rdi(csid, 1, stream_id);
> +}
> +
> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
> +{
> +       struct csid_testgen_config *tg =3D &csid->testgen;
> +
> +       __csid_ctrl_rdi(csid, 0, stream_id);
> +
> +       if (tg->enabled)
> +               __csid_configure_testgen(csid, 0, stream_id, 0);
> +
> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
> +}
> +
>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 =
val)
>  {
>         if (val > 0 && val <=3D csid->testgen.nmodes)
> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid=
)
>  const struct csid_hw_ops csid_ops_gen2 =3D {
>         .configure_stream =3D csid_configure_stream,
>         .configure_testgen_pattern =3D csid_configure_testgen_pattern,
> +       .configure_rx =3D csid_configure_rx,
> +       .enable_stream =3D csid_enable_stream,
> +       .disable_stream =3D csid_disable_stream,

Would it be possible to leverage the existing CSID configure_stream()
callback to implement the stream API? This would likely require
reconfiguring all CSID ports whenever a stream is started/stopped, but
if the configuration remains unchanged, I do not think that would be
problematic. That said, we probably need to address the current
ambiguity between the concepts of "VC" and "PORT" in the existing
drivers first.

>         .hw_version =3D csid_hw_version,
>         .isr =3D csid_isr,
>         .reset =3D csid_reset,
> --
> 2.34.1
>
