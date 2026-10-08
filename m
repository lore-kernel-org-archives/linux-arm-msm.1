Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169263A5445
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472809; cv=pass; b=H2311psj5KHAw7XG9ZDekvKnHsu+sUsMDvroNmTpHbkXHRoWfYmQBmt0ho48Zq55+tuxWhtYOzZnKZqMi1U6+aszjkitytMdwrMWNG6v7iGrgJQfDGUrdXC5SXG/529hYJMD7jMdK0OHtQgM/anIfwdLgEpNZG8QEHKiSGcAJjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472809; c=relaxed/simple;
	bh=Mtp5bsaUmX/s+WnZtwrAzzfDrBqtRRb5bfY+/bnQkEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFWCTmrseiHVAskmn2hkTRqCH0GdC2uXW6i0QkJfZbaracBgkR4ufJpR9+rbD9tCDo6j6DO5nlTfB8MIPbZFtKfmOa7SBfj9jQ9fW0+92s3HQGy7tuNiXBBdDQgmKzKpy89TfneVfokRjtnU/zZlf1/nbX7pOR7XIfp+kXzCujE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fs+5CIuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGjK06ob; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fs+5CIuL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGjK06ob"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVNG53121364
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 15:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=; b=fs+5CIuLFcpDjBzR
	at7VKHOxnae6JNHFqwD5XCNkJK7k72fyz7iYFNVpbSzZnKRkZw1iJMG+Yk/OEsNZ
	JusLXG/w5fQvrDfmW5xef1Cqf+zQmNAn+nzaH0Ezxj46mWENKiSQvBvg8ieJd+YZ
	8k+Pj1Quvgp3xTThwa0Mbw5vITg5VdzW1BoS3h1Y3tPsO91AUiKeXV837Q3BOpxI
	8fVCDHWrrehFgx03nm8/PsFV4lfywEZdNOb3MQCyna/a8meaVF4p0gl5el6DoDgY
	/N7XhXWpUIaLV+OdwRsirlE54/hzZb98jjVnk8kYQ3aX/+fyQyiBYNF2Edlz/GE4
	MiAhAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2ukvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 15:20:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104eedb5b0so155944336d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791472800; cv=none;
        d=google.com; s=arc-20260327;
        b=DjgiottOYjJvejEIO65rGmVlwKML9gPtdLL9E7uSVYdvt1Ne6q//pBD81UN6WXl5wy
         /BFTDk4WC0jGrKGK4VLFmzK5j1fEmECCUmkcAvobzhU3/q99pUzuR4yGVR58KcB+zll6
         eFwVUAgoa/3PkEPTkcqH1qL6j4YfhpBLQMwMODUx6tSKrVF30cCAEpQXdSmrLcoQJ2Sk
         vjZ5Mp18/t4zWEViqp5Vx4I8B7nMiX8ySd49i3SN4+1hon4Gh/scg/cFYmWThLCS0D2d
         ZHWVODnHMvgcOducLOddycoRedIpFNnH5CsNgb8CwG+9LRReeCE7jvLxF0hI8/bpDH2K
         GYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=;
        fh=HVpV2o4iL591bBXSKsFvLYK8ME3lMWb6epBQ0w2MI+Q=;
        b=FLGSLc7dm4lTP5sYU/8eQkB78dfUzvI5uXEgbrhVneEhqQ9GwZfRvtuV0th/XpLWn2
         pgSZz4HYEvfBY31ZF9RWm+PJM82PJ5OOR1a+qyHaH1XYm4sfll0bxun86uYTSd3aadoQ
         xfx+UtzvfLeIFBi3SLgFN3fU/v6yJrmI0YlWkOmWOd6mpiKh4RSC8n+Yw5zFeDcyoUJu
         BLDP2utNZx7a7MatnerJCvnrB+QhFxQjFZctfM9XkdiFGULvob2ZnT/AgRQQdt0J7VMn
         IrA34N6+6mQYHs81Yb8tU4gmrPOcdF1g2hrGm/norYq8ORGmFD0sPFNiZDVjoni+FtOm
         oPOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791472800; x=1792077600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=;
        b=JGjK06obGWcsx/dxGV2QE2EhozdlxEohmpjAq4G//d9XpliLh6dSSXoxHuqtv9Xsh/
         8gkIlCtOTu6zWYKIrW1Wc0GJaREGqudibPIctjLGKIFFGHb6SxamRM0B88EHAArc3uvW
         LgQwrYeWSe5MiQ4wDVb8oBUbemt0NS1OjVL/Qy87hB8yXXd/OhpdZlJjbJPmY9IpEvIk
         B9Exp4tW9MMUFCN15wF2or4m2u2qXlZ52EJL46PC+ssx9R/0hZ803V8V3PGVjMyqLOLz
         qGxuEAJ9s1aLGp+5gouuEsX0noxZQh6j6GyThl8eJtvX3l9xyLGVcsuwMSUYWuLJfdcq
         q8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472800; x=1792077600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=;
        b=KuuZppYyrVmO9wEJcEm8m7W6NTjj9MYc0WM25wJJV7daapJesHVnRopHKgbfOCHlgz
         PwZ+uPK7z+Gfb1NL8Rm8U2jNUztAcrUSKkYl1GJ5IlvX5La4wGeTHy9G2A4Rm/A497my
         ufexkkB05PTYkrfNH0n9SRC8GBfvpBkO6oQ2eI9gadcZa9W5Hd3Y1ZPtp8CYcO4SGFrL
         Z1wrkdn5bmZ9pHgbAcIAiwWL7Bp3FM1TVyUc9zMTeVY+db8E5Q7YdVcuFL2z0BhRTue5
         FyhADQLuDohT+jta43L8fzxvGtjJ0N9UEJllVUt44vkNwh2+dw8Vn5VZm6Htc9rcZp50
         EctA==
X-Forwarded-Encrypted: i=1; AKwUvBx1qlpOyG0oBe2Eqxvt4x7ivU7f1MRTLnwKhr/ga3ob4xshCtdBzZpIA7Uit9rwGZeMVQdoP50fBaoU8Ze0@vger.kernel.org
X-Gm-Message-State: AFuF++kHiNGuzdLn6822mXHt+TRkMHwkShDTDEGD5foloWIdsCj1jFeB
	Bl0honV6sMUN8rySkp5AghSnApHyutBx+Eq3vYEYL6Of0/0Ohe+sp9ynhDIx/lZvOSEJbssIVpa
	gSrLF2mp9des0dme/a1n0oc2wMaGnIpFN4JvGA1SFFQwQYCY+/gHr8YJUVfrSab03dEjhr++y/i
	1mp3OGuWaAe8L/+77nx7tLivOjkocJxOo+cc5lJaH8SKA=
X-Gm-Gg: AYBFou2LMp0/Dd9tt5h1+FaUfyzlt2RzfbLxdF2/kiBk4JaXeNr+6orfwmbFhZc7NPj
	AdT1rbo63uBawMA359sxZqQcRW3q1BOtioZcqNeubwuAANZ2qdHywCZTeYwgjmXH6ayzQHvOTJv
	mfZ+p/SSPeEf3mxHGdGebyqHCqjzn6CCdoE35S8I7A+5n7TUfxVNW+WgfsXyOKLBbjN7t8JZSV+
	rIRWOxnVY6xqHRXi99MGCFeeAgx+y+g962HVIakhOTlbTcV6ni3HylTQO1w098KM4J+u7VgGrU=
X-Received: by 2002:a05:6214:5d13:b0:912:488d:33ac with SMTP id 6a1803df08f44-919979319efmr107076306d6.17.1791472799617;
        Thu, 08 Oct 2026 08:19:59 -0700 (PDT)
X-Received: by 2002:a05:6214:5d13:b0:912:488d:33ac with SMTP id
 6a1803df08f44-919979319efmr107075616d6.17.1791472798756; Thu, 08 Oct 2026
 08:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007182238.1154851-1-peter.hunt@opengear.com> <20261007182238.1154851-2-peter.hunt@opengear.com>
In-Reply-To: <20261007182238.1154851-2-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:19:45 +0200
X-Gm-Features: AclHuK93Uq-IFjmeH-9lFHtazJbB-UGdgh5WgvVUomru_SE4CNqvEhX_yndO9b8
Message-ID: <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, johannes@sipsolutions.net, mani@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7b4a0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=t2vznHeBAAAA:8 a=yR1rUuH2P9_sZCukppcA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-GUID: -VY9a8Fwfcwb5nDU662MVnjuponPsEML
X-Proofpoint-ORIG-GUID: -VY9a8Fwfcwb5nDU662MVnjuponPsEML
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MSBTYWx0ZWRfX0UUc2fuhU+bO
 vvK0UDryPX8UcBNb4iYr312kc9ZmnqIqPYiXDSQzSvONUmZM5uV/jLBbmFCcq5ekYq/LGAqUno5
 5f0JqWHPR42VpRLtfw4sYWBAtFjJA+w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MSBTYWx0ZWRfX/kMEZPJTA4pg
 nPvdzvbl18xIfhN0ynH6uf89U1mJTahR7Q5Acj5VzFbdCLy4Y9lBQoINjofAHkSZeLY5hKoxZgJ
 3bjbI0T81Fr1qVnm19QqF/9HTa92KJKj2bSFfISRL745reEES4F1jGJ3Dhq4UeSmbqYlXzye2LX
 Jf9+bTkZY++YGspn88mt6FvG14w5hTN4Ny1nFtXRzANSeZih8fIiZel9V9C8DZnGiGjTVkcwMWT
 75UpYuslHnp3+XwNdV4SuCYrP7BLpJ5HaNmKUHB71RwrbjMpXW5MCCIpoX3zrmQ2e464GkjLXMK
 c1PdBEdvkYCWRZK/TPBGUULcu39RPwf63ORjHNJ+ID9StZU99omt27LHlrPO5c+JCGQaB1uMzBy
 j6xMBu+izcodCcwMVIK/SlinMONzYGrU4qhXt3OCERuPfyGSNXBiqp5yFl/5IH6lgcZsUylSAFK
 vPTtd8iHc/m54Wyc73w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080061

Hi Peter,

On Wed, Oct 7, 2026 at 8:23=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com>=
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
> away. The raise and drop paths go through two small helpers, which do
> the AT port and ->dtr_rts checks and pass the driver the resulting
> bitmask.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>
> ---
> v8: Add wwan_port_raise_dtr_rts() as the counterpart of
>     wwan_port_drop_dtr_rts() and move the open-path handling there, move
>     the AT port and ->dtr_rts checks into both helpers, use
>     scoped_guard() for data_lock (Loic Poulain)
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
>  drivers/net/wwan/wwan_core.c | 69 ++++++++++++++++++++++++++++++++++--
>  include/linux/wwan.h         |  3 ++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index ffbcf11e4e68..4206649d4b45 100644
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
> @@ -679,12 +683,52 @@ struct wwan_port *wwan_create_port(struct device *p=
arent,
>  }
>  EXPORT_SYMBOL_GPL(wwan_create_port);
>
> +/* Raise DTR/RTS on first open of an AT port, as a TTY does. Called with
> + * ops_lock held.
> + */
> +static void wwan_port_raise_dtr_rts(struct wwan_port *port)
> +{
> +       unsigned int bits;
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +
> +       scoped_guard(mutex, &port->data_lock) {
> +               port->at_data.mdmbits |=3D TIOCM_DTR | TIOCM_RTS;
> +               bits =3D port->at_data.mdmbits;
> +       }
> +
> +       port->ops->dtr_rts(port, bits);
> +}
> +
> +/* Drop DTR/RTS on an AT port. Called with ops_lock held. On last close
> + * the lines are only dropped if HUPCL is set, as for a TTY, on port
> + * removal they are always dropped.
> + */
> +static void wwan_port_drop_dtr_rts(struct wwan_port *port, bool hupcl_on=
ly)
> +{
> +       unsigned int bits;
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +
> +       scoped_guard(mutex, &port->data_lock) {
> +               if (hupcl_only && !(port->at_data.termios.c_cflag & HUPCL=
))
> +                       return;
> +               port->at_data.mdmbits &=3D ~(TIOCM_DTR | TIOCM_RTS);
> +               bits =3D port->at_data.mdmbits;
> +       }
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
> +               wwan_port_drop_dtr_rts(port, false);
>                 port->ops->stop(port);
>                 port->start_count =3D 0;
>         }
> @@ -759,8 +803,11 @@ static int wwan_port_op_start(struct wwan_port *port=
)
>         if (!port->start_count)
>                 ret =3D port->ops->start(port);
>
> -       if (!ret)
> +       if (!ret) {
>                 port->start_count++;
> +               if (port->start_count =3D=3D 1)

You basically have the same check above
> +                       wwan_port_raise_dtr_rts(port);
> +       }
>
>  out_unlock:
>         mutex_unlock(&port->ops_lock);
> @@ -773,8 +820,10 @@ static void wwan_port_op_stop(struct wwan_port *port=
)
>         mutex_lock(&port->ops_lock);
>         port->start_count--;
>         if (!port->start_count) {
> -               if (port->ops)
> +               if (port->ops) {
> +                       wwan_port_drop_dtr_rts(port, true);
>                         port->ops->stop(port);
> +               }
>                 skb_queue_purge(&port->rxq);
>                 clear_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
>         }
> @@ -980,6 +1029,7 @@ static long wwan_port_fops_at_ioctl(struct wwan_port=
 *port, unsigned int cmd,
>                                     unsigned long arg)
>  {
>         int ret =3D 0;
> +       bool call_dtr_rts =3D false;
>
>         mutex_lock(&port->data_lock);
>
> @@ -1036,6 +1086,8 @@ static long wwan_port_fops_at_ioctl(struct wwan_por=
t *port, unsigned int cmd,
>                         port->at_data.mdmbits |=3D mdmbits;
>                 else
>                         port->at_data.mdmbits =3D mdmbits;
> +               if (port->type =3D=3D WWAN_PORT_AT)
> +                       call_dtr_rts =3D true;

Any reason not to just call dtr_rts() whenever the callback is implemented?

>                 break;
>         }
>
> @@ -1061,6 +1113,19 @@ static long wwan_port_fops_at_ioctl(struct wwan_po=
rt *port, unsigned int cmd,
>
>         mutex_unlock(&port->data_lock);
>
> +       if (call_dtr_rts) {
> +               unsigned int bits;
> +
> +               mutex_lock(&port->ops_lock);

So now we end up with two mutexes essentially protecting the same
state. Since dtr_rts() is always called under ops_lock, and the ioctl
path acquires both ops_lock and data_lock, would it make sense to drop
data_lock altogether and rely solely on ops_lock? That would also
allow the ioctl handling to be fully covered by guarded ops_lock
mutex, simplifying the locking scheme.

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
