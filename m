Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476D3E3D85
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275449; cv=pass; b=n9SkJBl9rnv70V4C/5HIf3W2XI+8fpVVwlfabJkqeo/vGnQcW6kALg1Kdydg6PyA7Cv+YNyRK1/xbmY07kno9S2EQ7UP6R2wRTV8qEg3teT5kFjVYWvHDBEmPsu/JWXjeQjYye6Ecl3d8wRu90nmBqnjf+AGOrbdeq9TxBjlgrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275449; c=relaxed/simple;
	bh=SZ2Cqouzf2DxnR7lhpDTzXtTUMd+wHcWoo2UCnDoWlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHvc6XuUndICRiDafXsTAgL2WiWmecw6bwdJWbYNCCD5x7ZWe8JVzqH7pWGr2//lfzJW6+Sol//CpnxfC10Wec87UCg0U1+iJdSnwPWIv5uRb0KYjLMJHgjbb6RFjcVz6W3u0GTx1JaNfl6d9ZhuAn7r6GHezPv6MKE/QsZb6/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtZJbPWm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDwgmie2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtZJbPWm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDwgmie2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e3cB3902899
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 08:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhWlzBrodTtXgnRYBtXz3K30QUfYNEEzBTba7ysaKrw=; b=WtZJbPWm6l7NKU7g
	FJT84V79FBs5oTdx+yM0TDl+LPRCsrNtXXSlKWlyw+GO7+0oB3jcfrmiy9ghVIcb
	LpxVuV2HKLM/7ydx1e5aHInj+eb7Woi6fYp/B+nxdS0aF9vJWay6cyFlcFmKiGnc
	L95F0q3gol8M5U/4nRhUQQ0Jmu1dlEqRklYidJC0qAupoAfp6yVosMtWJXE/6L2p
	IZDfwUnUicdx0B8y+mZ7pw2iRecFP0ROcyyiycIoP4Hqmp4oRL3RnaYraVE46qW2
	lNLkkoGZdVlmGysgRrFNJvj5aN7xnb1lkHG2DLSCjr53TWzKuQnXtUj7PgA4ch+f
	/T6lQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dvd8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 08:30:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so515199185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 01:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275416; cv=none;
        d=google.com; s=arc-20260327;
        b=l3mv7W55LQ28tnCotzbsdy1XxEno+MWwr595TTOz313MbRRSJJpCZCcfXCpWbxrMu8
         8TxLKUQjR8Qz0Brq2cog9pQQPPohM9kSzl2vCeIMGdHaeI+n5PIDU1vPPJcOYT+hWRFk
         o35JuaOOPG92JRYqvMmcSdc1xoobVNw7K/U+yJXKGq2F54k/VKGs5asZyIRyrNHlrcdP
         daa/wJ/5mgM7pxG7V1YfbJQMWwmOdDfq3kdRt2Zyrn6ZtUCX8YiEmZX1mt5yYjpfNAV2
         X/GBoBAXxHVfoXqlL5JhdiFn4PXLudXb2mv8fnGka8bNk3FHRFOTYRq8XQgp5cSlwTHG
         w1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhWlzBrodTtXgnRYBtXz3K30QUfYNEEzBTba7ysaKrw=;
        fh=5MTNbndVhLTVgnCrHc6jTAYtqQt9QmwJGn3KWQCuk2I=;
        b=CjQTinx9BLA2khhvIvL+9aGjlM1UI+/Mlv2cYvEN3BSWyJugwWzJCL7ubLxhV1dUcq
         11lSQWfkCvbuswwTIx7ps/Bv4Je81SgDDQ/660Vuq8L0i4DWxyRDBpFy30We2mofqbju
         k78AmFdigzMIBvq8Gb2eRHjlpy4SwQO+J6g0yxbFGR6DEAeSNrfhdeLtySIU1KXORJlB
         B8lgqbIX4N5kfonszpJZ+LBJkDzS1fz2ugmaEdgtwUeVG2+guGVSTRq3I6GxzQSu3ZCz
         LLBLqyyuM+Txq1QoOuR0QxDbzjxFjjpl8bWl4I5sHXvGjevTbU7YBvAkQqL65msHSz1c
         xuMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275416; x=1791880216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhWlzBrodTtXgnRYBtXz3K30QUfYNEEzBTba7ysaKrw=;
        b=iDwgmie2pLDOUSyvDndzV357y+fYbzeZ3WPgnaoOXGnhbBYJ4hucFpoZDgXiCNMj+1
         YmVB+Pv3S99HN752Y0bdc6GbvL1/2VTtkE3/HKNqk/GDs0vZ9ZPlbaq6XVpYxcrKy2dw
         NUkOakaqjU6/4q5fLaCS+DHQogFSRr54Wspac/k96rT00i46vNpqhq65kYHFOTCR9NAq
         i7U/mvuWDg9P7xh9TTQph+0zTbDH5xN1pWtof9s4bmaAXBKLcolS6LiWC6+8jVTTC+ZT
         fwVfOmh2VRGo9JzkveW42i6INVsTawoQBOqNKtVFKnjZoa02F2mgJLN1LFgIqVkN+xGu
         lPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275416; x=1791880216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhWlzBrodTtXgnRYBtXz3K30QUfYNEEzBTba7ysaKrw=;
        b=MIHJgfItVaq2fzrqoM0Jr2s7JNHWTT3P/zcEJUudqupgMc61VSQOCHbOUndo6TyNtP
         TyRTvNSSsjKIrU1VXwG9fJ6NRcwPpBhJuZvvkhh1GM4Mpth/iODnn3ESEjkisTbj2BOM
         0erVJWTP4Lz+iNzNn0+ug6YgyWUamgy0g4GG2dAK25d88Np/NVb4yioLKUJnu1oOUbE+
         WJs/9avFB0bZPkoSQU36gHiBj43htOcCuSkTp/6RfYZarIoHRkB5NNaPoXBFYvkQOx/n
         zz1ndLw5FCzj84c0EavBazZV0tY5LVq9HLFfZsWORIa+7mYfeCwExe+DvF69WzEY3UAD
         4G6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMlg7qJTrO/2Tb1VEH0g/8bVH4rj03n30QRbc3d15TZ47vMbgHfAqeB0QizUp97/70XHOiZblK6JkjQ+wc@vger.kernel.org
X-Gm-Message-State: AFuF++mBGoI+E3iBBI54pxzuCbLzbzJhbCNlBcRnd4CFYbMSypMAdMQe
	JjyA95E9dBJcJpZnuTdZctolJBhosUBvvIIDnXEeAmi0Hv45HEsd2lqRXcOeSSzqjMuTCv2SF6S
	faR6oINsseU75oCxVDpBLQW/4yp3QA/b6E1D6VFZZOPtDcQnTz4oUd4VwRm0NJ/xAtMQdUbAz/u
	pNFbJLO1aX5Ojd9TPBil8Bg/l0fp7ZSqScnnR+qP0GpZY=
X-Gm-Gg: AYBFou15E+RYiaWfOykFIjFYtOI4bCS/C9eB57ea4RFGdIOGDFC7+jnYbu0pyABkWB2
	9iM9Oh1HB8vXLRXDT04IBnCkhzabdr0Y0+m5M7qnYKpBGWKtrExiknpieo5V8N1HyXW2m89Bg86
	GrJ9MZ4vfXWF/0Uixiww7ZYB/ZgACSqirvNnwYYurVGnOj51Di4PcAbG1GWGc0w9cbzlEZxvty5
	cYMai+ymnVlFSo6xwixp4fVlRkNuiKgoz2ncdeGfRaGHabp6xjESApsArltaNTRhDm0zeUlX7I=
X-Received: by 2002:a05:620a:2547:b0:939:de6c:cb45 with SMTP id af79cd13be357-93e8f4e85bcmr105691085a.47.1791275416099;
        Tue, 06 Oct 2026 01:30:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:939:de6c:cb45 with SMTP id
 af79cd13be357-93e8f4e85bcmr105684885a.47.1791275415318; Tue, 06 Oct 2026
 01:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006040422.3208888-1-peter.hunt@opengear.com> <20261006040422.3208888-2-peter.hunt@opengear.com>
In-Reply-To: <20261006040422.3208888-2-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 10:30:04 +0200
X-Gm-Features: AclHuK87YvCOucsoBPBbwhveceYERw5WYT0aIkBl1ttuymaYMtJY8H6CXMeK9NM
Message-ID: <CAFEp6-16BDkenpJBDsizvb8dGddXU+QzGuTv62v-hy-qtVbxGQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, johannes@sipsolutions.net, mani@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMyBTYWx0ZWRfX4x0KQQd5ntpT
 vH1RwdrLhMjH2DuYMSFegpm+wlXH2xas+pFuLki5+O7bMMxTt/K4PC9QJxciXmGJQDRwWaL3Zcp
 TGBBgApacscdARBAo8Io4ZsrV46yVaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMyBTYWx0ZWRfX8RIXNxvuYTkk
 +SLg/VAhaZd8flUu8DZNe4Zk90pc3kPNHEcTpNtWdj0QzHJeOKC8S1EqCZeXeb2Ai8esHCxFwVf
 UeYDgtgBW8UkcdBYW2uSSLJF5tUBZxLLZZbunqi2ylU6U6L8fEbbiJc1syJQ38F/mrTxdQkC18E
 v7zuNQZ1FwKbzUB2VKd3UHSP29mo8DSJ8MOdMwSsYwECg4+0ZzCujKqjH3OOMFE+hg/DaQNkqb3
 gdnax3+SP3y6HlvX7ZBSkCytOM0NCHv9F2nUDKX70J0YqPNRppkMhjSp4UzjPTMnUko0Cwm7N1P
 XUtaLPCrM/ndGooV6eNq7Brn/pM2BzAD9OTbJYW823t2UGaDWfUulOvOBd+N5328BmHyY2jyBAj
 V007IcEyzeBfQ2JqHjeVFRBoDXvEDdh5DmKlXCgFLsdKpJAGFEHLKZDfClkuElBTaEAwCa1T88c
 Ve4DbmDVL2iHLHeEPqA==
X-Proofpoint-GUID: QyRvcvNbZd373RP44Kn2xNz6wzqiawha
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac4b198 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=t2vznHeBAAAA:8 a=-ELhO9GzngQEtxseaSAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-ORIG-GUID: QyRvcvNbZd373RP44Kn2xNz6wzqiawha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060033

Hi Peter,

On Tue, Oct 6, 2026 at 6:05=E2=80=AFAM Peter Hunt <peter.hunt@opengear.com>=
 wrote:
>
> The WWAN character device emulates the TTY modem-control ioctls
> (TIOCMGET/TIOCMSET/TIOCMBIC/TIOCMBIS) for AT and QCDM ports, but the
> result is only stored in port->at_data.mdmbits and never reaches the port
> driver. A driver therefore cannot act on the host raising or dropping
> DTR/RTS, even though some modems depend on it (e.g. they withhold
> unsolicited AT result codes until the host asserts DTR).
>
> Add an optional ->dtr_rts(port, mdmbits) operation to struct wwan_port_op=
s.
> Drivers that implement it receive the full TIOCM bitmask so they can asse=
rt
> or de-assert DTR and RTS independently. The wwan core tracks the full TIO=
CM
> bitmask in port->at_data.mdmbits and calls ->dtr_rts when it changes, gat=
ed
> on WWAN_PORT_AT to match the open/close raise/drop behaviour.
>
> Also raise DTR/RTS in wwan_port_op_start on first open of an AT port when
> the driver implements ->dtr_rts, and drop them in wwan_port_op_stop on
> last close if HUPCL is set in the port's termios. This mirrors TTY
> semantics and means individual drivers do not need to implement this
> themselves. As on a TTY, HUPCL defaults to on for AT ports, and userspace
> can clear it with TCSETS to keep DTR asserted across close, for example s=
o
> that closing the port does not end a call on a modem set to AT&D1/AT&D2.
>
> at_data.mdmbits is protected by data_lock. In the ioctl path the ->dtr_rt=
s
> call is deferred until ops_lock is held, where mdmbits is re-read under
> data_lock, so the value passed to the driver always reflects the committe=
d
> bitmask under ops_lock and is serialised against concurrent ioctls and
> against port removal (which nulls port->ops under ops_lock).
>
> wwan_remove_port() also drops DTR/RTS before ->stop() when a port is
> removed while still open, regardless of HUPCL since the device is going
> away. Both drop paths share a helper and pass the driver the resulting
> bitmask.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>
> ---
> v7: Drop DTR/RTS on last close only if HUPCL is set, and default HUPCL on
>     for AT ports. Pass the masked mdmbits rather than 0 from
>     wwan_remove_port(), via a helper shared with the close path. Both
>     from the Sashiko review of v6
> v6: Rebase onto net-next. Snapshot mdmbits under data_lock before calling
>     ->dtr_rts from wwan_port_op_start()/wwan_port_op_stop(), rather than
>     reading it after data_lock has been released
> v5: Change ->dtr_rts signature from bool to unsigned int mdmbits so DTR
>     and RTS can be driven independently; re-read mdmbits inside ops_lock
>     in the ioctl path to close a concurrent-ioctl ordering race; add
>     de-assert call to wwan_remove_port() for the hot-unplug case; update
>     kernel-doc to note the op is AT-only and describe the mdmbits argumen=
t
> v4: Protect at_data.mdmbits in wwan_port_op_start/stop under data_lock;
>     release data_lock and acquire ops_lock with a NULL check before calli=
ng
>     ->dtr_rts from the ioctl path; gate ioctl ->dtr_rts on WWAN_PORT_AT t=
o
>     match open/close behaviour; reduce boolean to TIOCM_DTR only
> v3: Replace ->tiocmget/->tiocmset with ->dtr_rts(port, bool on) modelled
>     on tty_port_operations.dtr_rts; raise/drop DTR/RTS in
>     wwan_port_op_start/stop rather than in the driver (Loic Poulain)
> ---
>  drivers/net/wwan/wwan_core.c | 61 +++++++++++++++++++++++++++++++++++-
>  include/linux/wwan.h         |  3 ++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index ffbcf11e4e68..eba4b0582b5a 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -655,6 +655,10 @@ struct wwan_port *wwan_create_port(struct device *pa=
rent,
>         init_waitqueue_head(&port->waitqueue);
>         mutex_init(&port->data_lock);
>
> +       /* AT ports hang up on last close by default, as a TTY does */
> +       if (type =3D=3D WWAN_PORT_AT)
> +               port->at_data.termios.c_cflag =3D HUPCL;
> +
>         port->dev.parent =3D &wwandev->dev;
>         port->dev.type =3D &wwan_port_dev_type;
>         dev_set_drvdata(&port->dev, drvdata);
> @@ -679,12 +683,34 @@ struct wwan_port *wwan_create_port(struct device *p=
arent,
>  }
>  EXPORT_SYMBOL_GPL(wwan_create_port);
>
> +/* Drop DTR/RTS on an AT port. Called with ops_lock held. On last close
> + * the lines are only dropped if HUPCL is set, as for a TTY, on port
> + * removal they are always dropped.
> + */
> +static void wwan_port_drop_dtr_rts(struct wwan_port *port, bool hupcl_on=
ly)
> +{
> +       unsigned int bits;
> +
> +       mutex_lock(&port->data_lock);
> +       if (hupcl_only && !(port->at_data.termios.c_cflag & HUPCL)) {
> +               mutex_unlock(&port->data_lock);

Using (scoped) guard version would be simpler:
scoped_guard(mutex, &port->data_lock) {

> +               return;
> +       }
> +       port->at_data.mdmbits &=3D ~(TIOCM_DTR | TIOCM_RTS);
> +       bits =3D port->at_data.mdmbits;
> +       mutex_unlock(&port->data_lock);
> +
> +       port->ops->dtr_rts(port, bits);
> +}
> +
>  void wwan_remove_port(struct wwan_port *port)
>  {
>         struct wwan_device *wwandev =3D to_wwan_dev(port->dev.parent);
>
>         mutex_lock(&port->ops_lock);
>         if (port->start_count) {
> +               if (port->type =3D=3D WWAN_PORT_AT && port->ops->dtr_rts)

I would recommend checking for the dtr_rts callback in
wwan_port_drop_dtr_rts() rather than here.

> +                       wwan_port_drop_dtr_rts(port, false);
>                 port->ops->stop(port);
>                 port->start_count =3D 0;
>         }
> @@ -759,8 +785,20 @@ static int wwan_port_op_start(struct wwan_port *port=
)
>         if (!port->start_count)
>                 ret =3D port->ops->start(port);
>
> -       if (!ret)
> +       if (!ret) {
>                 port->start_count++;
> +               /* Mirror TTY semantics: raise DTR/RTS on first open of a=
n AT port */
> +               if (port->start_count =3D=3D 1 && port->type =3D=3D WWAN_=
PORT_AT &&
> +                   port->ops->dtr_rts) {
> +                       unsigned int bits;
> +
> +                       mutex_lock(&port->data_lock);
> +                       port->at_data.mdmbits |=3D TIOCM_DTR | TIOCM_RTS;
> +                       bits =3D port->at_data.mdmbits;
> +                       mutex_unlock(&port->data_lock);
> +                       port->ops->dtr_rts(port, bits);

Could we add a wwan_port_raise_dtr_rts() counterpart to
wwan_port_drop_dtr_rts() and move this AT/TTY-specific handling there?

> +               }
> +       }
>
>  out_unlock:
>         mutex_unlock(&port->ops_lock);
> @@ -773,6 +811,11 @@ static void wwan_port_op_stop(struct wwan_port *port=
)
>         mutex_lock(&port->ops_lock);
>         port->start_count--;
>         if (!port->start_count) {
> +               /* Mirror TTY semantics: drop DTR/RTS on last close of an=
 AT
> +                * port if HUPCL is set
> +                */
> +               if (port->ops && port->type =3D=3D WWAN_PORT_AT && port->=
ops->dtr_rts)
> +                       wwan_port_drop_dtr_rts(port, true);
>                 if (port->ops)
>                         port->ops->stop(port);
>                 skb_queue_purge(&port->rxq);
> @@ -980,6 +1023,7 @@ static long wwan_port_fops_at_ioctl(struct wwan_port=
 *port, unsigned int cmd,
>                                     unsigned long arg)
>  {
>         int ret =3D 0;
> +       bool call_dtr_rts =3D false;
>
>         mutex_lock(&port->data_lock);
>
> @@ -1036,6 +1080,8 @@ static long wwan_port_fops_at_ioctl(struct wwan_por=
t *port, unsigned int cmd,
>                         port->at_data.mdmbits |=3D mdmbits;
>                 else
>                         port->at_data.mdmbits =3D mdmbits;
> +               if (port->type =3D=3D WWAN_PORT_AT)
> +                       call_dtr_rts =3D true;
>                 break;
>         }
>
> @@ -1061,6 +1107,19 @@ static long wwan_port_fops_at_ioctl(struct wwan_po=
rt *port, unsigned int cmd,
>
>         mutex_unlock(&port->data_lock);
>
> +       if (call_dtr_rts) {
> +               unsigned int bits;
> +
> +               mutex_lock(&port->ops_lock);
> +               if (port->ops && port->ops->dtr_rts) {
> +                       mutex_lock(&port->data_lock);
> +                       bits =3D port->at_data.mdmbits;
> +                       mutex_unlock(&port->data_lock);
> +                       port->ops->dtr_rts(port, bits);
> +               }
> +               mutex_unlock(&port->ops_lock);
> +       }
> +
>         return ret;
>  }
>
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 1e0e2cb53579..57406139304e 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -57,6 +57,8 @@ struct wwan_port;
>   * @tx_blocking: Optional blocking routine that sends WWAN port protocol=
 data
>   *               to the device.
>   * @tx_poll: Optional routine that sets additional TX poll flags.
> + * @dtr_rts: Optional routine that updates the modem control lines to ma=
tch
> + *           @mdmbits (a TIOCM_* bitmask). Only called for WWAN_PORT_AT =
ports.
>   *
>   * The wwan_port_ops structure contains a list of low-level operations
>   * that control a WWAN port device. All functions are mandatory unless s=
pecified.
> @@ -70,6 +72,7 @@ struct wwan_port_ops {
>         int (*tx_blocking)(struct wwan_port *port, struct sk_buff *skb);
>         __poll_t (*tx_poll)(struct wwan_port *port, struct file *filp,
>                             poll_table *wait);
> +       void (*dtr_rts)(struct wwan_port *port, unsigned int mdmbits);
>  };
>
>  /** struct wwan_port_caps - The WWAN port capbilities
> --
> 2.43.0
>
