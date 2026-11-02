Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630855;
	b=1bfNl9aC2pqs2JB38jrrVikYkYWu+IsGJ93zanM1OwsfMqhTge55oTUS5yejiv2im71C
	 0KBeF1C9Qr+OymR2ADUDdewvR41KsbZAorGJttKmbnQEMFEFzx5HUflV90MoUFcNhNyEo
	 JmLjNAsiRZ8500Wz+Lemx+q48/pywTfwUAdMuzsJAMw4t7SG6uKvw4qg/GdWwAAK3tWir
	 3Maj6FYi5Y/obyuOGpZKZEg2E0myvpKcLKQGM4Z5BWDRPM8F1J0qZbra6pXlIFAvRteqW
	 FjjznfT8xWtKJihuZDIs4qcqCm7ts4RB54vXhXL8htmi+1aiiVOQYhjwMY0DjeNmF8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
	b=wXXqZNHoFmtXb7gPkqEDWz1X+58vzRAOnIGOYZL2+h0sMTDhnQDBD7cRXYRm14N8+Chx
	 ModdP88OIzjK3by1pkmmye2uRO23rOZpofHJC4gJBuJxQ3DcG2W4EZ6fpB+p5u/gFQnQu
	 n94StpRFerJCSThv3EumOAIb137fzyThHumURUqNf/xJmz2z5Q2mqacM2VvpWNeR+1lKS
	 7GQsoBQIftB0udlSNUWWSBmK+gsLIYIqEcsCPWqL54FC8fuGwR3rU930R4l9lxWXNDt5z
	 Hu90VWYZgwOKMLL8TlRU+5OYyDL5c6eVUdHxE73nujaKa7lG2r5a3trVHieM7kduNHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAzdOtsZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4s86SlG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8DA608557A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C8DA608557A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAzdOtsZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4s86SlG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpdM8452821
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=; b=gAzdOtsZTxgNy94h
	ZPBgktST8H9qh/HqbR7qsGEwDXgGnW/s4aJoREacb32Hcv0lUYn6IGFaLj9n00qP
	eo5nDZUHtUw3HHnqdFUXRSrxOP+0YxsjiddZ+IilytcBFLsDneMN3tTG6+msTlS5
	s3rA6gNVWchexYjtkyW0QfY3nj17B8CXWrGMaVtQZHh3AnZqrfDOEfeMt0qjTpLf
	AdLndZzmCZnvF3+BpcCVoGeVQendqaL9tkDM3tUZG0KQ68riU0W69M2nswepn+1w
	LMai++QfbuLlBzXZ27MgMMbU/z9vxkR0Hl2zbe11dhq7O2zm6Bvqk8eQdg9GIz25
	c4A16A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rt2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:47:34 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so4579637b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630853; cv=none;
        d=google.com; s=arc-20260327;
        b=QU4DOBubyHxRgpkuFlzeprOc72imFQC1Z9RLVTpE4x0oYJhftzQ6Wi9LwcnFDeHqNW
         3Kc9bwQ7M6U+A0u1cudRTS5PPfiYNiWYnjVLlTGwgo/6+VuLW+tTqu6a7Lq6FKOKjsJy
         mXzi3Rm3XAM6M0E9fPi4gtJZRTmaHnfeFoidGkX5PmR1Z1oad4mQJUAfFnf1Bg0aPMsm
         nRWNJ9iES5tpQ7y8PvNyUjFe/GI94/Z3FYQYLdkYDY4Q/L1APkQGkYqEwuqw+f8BE8s1
         5SKf3wptQcXJTcpdtKEO8VGn6CQkUp/mpsBtfUZgY7W7+72bNzVIluKkLdY06ychbcqZ
         EZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        fh=nZkILk08bQEb6L6WTkQf7VF+GPkDQrLBa5SC9lHwngE=;
        b=pDfG0jVidK9a7XTCLAbG0U4AT0vCNTXYtoaAoLMUpAQdJhTCVfOuBLorljVcvLUwyU
         o98ne3ub0KbSsexWdDAAfyTMXRHITs78nVEEnYj7CM0A1tYPk9wIxmoMRGV1FGH+qrWC
         Q3Kpy1+VkQdlV0r+mVv2vvPZpYLOBu/k03ypucA7LaEMj9uoHgOqXMj1b4Ggp92BOwTA
         7UumgRy20P/uK7E5pOgrEgnRWcb9lmLFrs70XsdMA+CkrD5j2k3YA6zABzQNYC48Fbvq
         NBD4sY1kXIik1vg4nYVQD3TcCTIENXnDNLei/tey4W/MUMDl3Mq6yAj7m35n87XDfgrG
         PVRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630853; x=1794235653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        b=G4s86SlG1mh6vfGLj+6kpzbMZsy7KTERL8W9q0XIEazSRYLKo2laW3PLxnELTjMBD1
         2BtOxo/08ezako1wwgv7MqDOid5FZuakWoZnHh+1VaRbJeKlytF1fvE08c5gUpapOSHj
         MsR5ll9mAJ5vKNNhmn5Y5uXL9K3IbZU/yOqRQ4FCG/ZSpetpJjDYae1frGP6LqvHjQDn
         dGQbIV469uCBpmTfIMePae339DVqiIl38KHMnbHD1Ic3q4hwZPD1JsE6YoSee3nHSXG1
         2IFdapWA5tqj6nen6mJ/krTN9BPMboggifiK/DaeLhN6K3lEegzrVER+9UyepzFZtjdS
         9MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630853; x=1794235653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        b=DkpClW80mZK/9NsxlhNibi7m+GjOUshlilPKOxRdCfDz056xwFaFEg40TeG+Zh2WPw
         I5/pRU8R3qftHa0PhRvA3AOsFfFGb6SdMpDL4SgoQrXhRq/m+gXKb/Zw1Vm9EtYBZqD0
         86cOSfRJ4DXOq2HLk6+nNkUrsjHwvYQL/P4m1MEwjneXZhK7P6fqYPJs2X4LdNyBLeZS
         9U//QgHg1kVZEvdlZV4oTZFRD+Vi9y8KXypJfa2gbAGHWx++SIoSXrXiq4Qz6yO90cfr
         mOzySBaxv3dZ17E+ubBo4yonVHZnWaA9hNzsYpRFaQzrcBqd98mPmvbz3LJDDPRBFigN
         m0/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpMnzGnQ36bl5hs8axCQto0jrAmCOjpCM2+Z5Q/mcrWCooCuaIt0aSGnhEHyqYD8meARrMhtUR592sG0Ky@vger.kernel.org
X-Gm-Message-State: AFq9FYJtaOa6+3vsFxyOPdMMZhfFE1KXeVe/q2NsFzFqBsSp9r/HBcyE
	Xlko1AGcl9vIZcUiGci4zGJAzbkeamGkrLpk6QYVXFl3FD8c5E8YyfdmeECeRMjEuw6LiJe9uUk
	1gM5YNEG3VP9nN6Sk2cdyjZ9av+CA6xoB0/2Xb6KSrocSsasFT/HDLLf+zRHu+4R+dbk4o2r1RU
	vmKrPdCMxGE8w58CdXb4h++GXH7IU77wTsRco3B4IlF1c=
X-Gm-Gg: AYBFou1U/TxwXHNBO/aR7ibx24ANzCEjMnP7g7nZhnqUUMHz5z1A96veYLlWwSs7YCL
	Q5UgNTSrMU7kVzgTPMJeW9xnhZr7BL0tnEAXLLgtbyHb+oFoRod3CCidQaibqyyl6Vitry9roy3
	tcfE6amXdtpwBhR89yKzUCFfCfEZ/B70Mh37O5ur8vK4xGl6Ayq6x5D0urfucpygopewgQ6ZpAA
	lTjg/+8p9d/amwRTz88w9ZyOT/pG/EQZCxliyrUhrLidk7I21qYS67stJMQh6Z0j/sdZRlX9OY=
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id 5614622812f47-5640de0fc9emr7469404b6e.48.1793630853421;
        Mon, 02 Nov 2026 06:47:33 -0800 (PST)
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-5640de0fc9emr7469389b6e.48.1793630852884; Mon, 02 Nov 2026
 06:47:32 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:47:20 +0100
X-Gm-Features: AclHuK9F-lczTho9-OOQz-6r-jj8Nij597M3yazka8tis8-xUrvn5J9xzKhwj5s
Message-ID: <CAFEp6-3LSPnYv2AV4xCc3i+NQJv13qHZ2JCX45drnx26=Z2kVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXyLxMgc0z8OZE
 0y/4IJW8R9komDoI8HewFOeL3RJqOjg5jqzWztlrRTHezIE2bCR8WwcKHxNG8znaFM1vriwJoe/
 ZwHlxM5kzaSGIM2o8TkF5FauX8IAiuwdx8uNJmzS6nBuPeebTmHC0KBLwHQTem45MD63kGVPvvj
 gbhs5U7yQu9yNjvjNyvlQG9APPc5EwSYCT5K9VzsPqc3G81FRiwKvgE1YQGXSKohlpP+E3zD1HO
 DVEN5WAvXqgTMqjpxK2xZaJkbqhUI43Mm6mbFeYkodPxghoCEn0nTOJj6EmCWZYoejh27BdF2nT
 NXBuYAf2FOcsiRHpLKo/9HciAclGz6rjxFHCWeM0ce08DFpdHwm7ZNyFoXkEdi8LvPRRjyyoZ6U
 8GVRRGIiMF9m0hCX7nHlMHNWo+J/k9uypjDaxESYmUYLNE+YYNn/aX4bVUu/vY4M65Vin+otSX2
 61r2JEK5MeAXK8Ojh4g==
X-Proofpoint-GUID: fPzfgpaumAVDv5JbhYwOs1QA3kUDR19s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXzmi/duqSNalF
 lWBJMIxzCNZJhin08QOcyfrSim/AU1Mmyl6ncWMgFN5cEE6vftndLMVCqK/uQai2/P/p9sfL+UK
 hDvlS0gywYBRK8OgKnZuDvj2cUiorKE=
X-Proofpoint-ORIG-GUID: fPzfgpaumAVDv5JbhYwOs1QA3kUDR19s
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae8a286 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=ySw4tsHwzHfE-Ekmi8kA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> In order to communicate to user-space CSI2 SOF events we will need to hoo=
k
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
>
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is fal=
se
> by default no negative enumeration of existing or in-flight CSID is
> required.
>
> Subsequent patches will enable on a per-CSID basis.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++++=
+++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..e9b399fcb9c7a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +       unsigned int i;
>         int ret;
>
>         if (enable) {
> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, in=
t enable)
>         }
>
>         if (csid->phy.need_vc_update) {
> +               for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +                       atomic_set(&csid->sof_seq[i], -1);

Should we introduce a `csid_sof_reset()` helper and only invoke it on
the enable path?
For example, on disable we currently reset the value before stopping
the CSID, so a late IRQ could still arrive and update `seq`. In
practice this is probably harmless since the value gets reset again on
the next enable...

Also, a short comment explaining why the sequence is initialized to
`-1` would be helpful.

> +
>                 csid->res->hw_ops->configure_stream(csid, enable);
>                 csid->phy.need_vc_update =3D false;
>         }
> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsign=
ed int elems)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_inc(&csid->frame_sync_users[sev->id]);
> +
> +       return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_dec(&csid->frame_sync_users[sev->id]);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D {
> +       .add =3D csid_frame_sync_add,
> +       .del =3D csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *=
fh,
> +                               struct v4l2_event_subscription *sub)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +
> +       if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> +               return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +       if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sy=
nc_en)
> +               return -EINVAL;
> +
> +       return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +       struct v4l2_event event =3D {
> +               .type =3D V4L2_EVENT_FRAME_SYNC,
> +               .id =3D id,
> +               .u.frame_sync.frame_sequence =3D
> +                       atomic_inc_return(&csid->sof_seq[id]),
> +       };
> +
> +       if (atomic_read(&csid->frame_sync_users[id]))
> +               v4l2_event_queue(csid->subdev.devnode, &event);
> +}
> +
>  static const struct v4l2_subdev_core_ops csid_core_ops =3D {
>         .s_power =3D csid_set_power,
> -       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .subscribe_event =3D csid_subscribe_event,
>         .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
>  };
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..2e48b08b93592 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -141,6 +141,7 @@ struct csid_hw_ops {
>
>  struct csid_subdev_resources {
>         bool is_lite;
> +       bool frame_sync_en;
>         const struct csid_hw_ops *hw_ops;
>         const struct parent_dev_ops *parent_dev_ops;
>         const struct csid_formats *formats;
> @@ -167,6 +168,8 @@ struct csid_device {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *testgen_mode;
>         const struct csid_subdev_resources *res;
> +       atomic_t frame_sync_users[MSM_CSID_MAX_SRC_STREAMS];
> +       atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
>  };
>
>  struct camss_subdev_resources;
> @@ -248,4 +251,13 @@ u32 csid_hw_version(struct csid_device *csid);
>  u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
>                       unsigned int match_format_idx, u32 match_code);
>
> +/*
> + * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
> + * @csid: CSID device
> + * @id: CSID src-stream ID
> + *
> + *  Called from the CSID interrupt handler on SOF of the path driving th=
e event.
> + */
> +void csid_sof_event(struct csid_device *csid, unsigned int id);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
>
> --
> 2.56.0
>
