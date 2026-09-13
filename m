Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415C13E3176
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302245; cv=none; b=AGBPjsbC5c0of2RS8osxOgAhcvUFZcZz5bAHejgO2PiLJ/21vF1ASFJcLiLmo97t4GXwnssOH+XdYzgAzApKQF320jthe/yjLoS+B7aSAtNIigg4SVQ4rpJ+AJ2o5/VrlY0bwZhhDf0I/kPk+TSl7za2Rf0eRwFxdvlWAc4dvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302245; c=relaxed/simple;
	bh=sEkeSZyT1b92t4did9aLrVflRNi2rCzD7o+75wH8zs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gPIXg/JViXSK0BaiZyVQQFM0Ec4OEMmLYhIjfrpltDIfeixaO+BUv55m9hNNVBnG3VNoNaRKdAElXdJVsuLpmKiIgJvnOWzKguGxFpdas9ZtLYLVW5293URbYaadnaN8nT4jug2xIx/qIKzwsiwj05gGwSgGL2+KWSn69OwpUww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIZiX7Nh; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIZiX7Nh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so430910f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789302241; x=1789907041; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sEkeSZyT1b92t4did9aLrVflRNi2rCzD7o+75wH8zs0=;
        b=hIZiX7Nhg3Q1wDWXn2ZBBspll3KnESb1QZ5oAHTFFbdMtK+a4ZtzXJ24/9Dk8AawnW
         8FKb85mpS5F9D7ZVj/Gx1SSZTOQA+fXSAYMONqBnbB3GNvX2vfXFMyHScpIc2u9Dxrfh
         3oL60qDl3xLMEnqsrtVIyZlCupju9s5GyfFuXpnV2DNnWBqVJydsgSn2iok3+ZB1Smn1
         bpeSNG4C+9fw1nS/Xoe28C09NqEKtSmFkANwWwrJfQhsesmxWWClptlGL0+dGTWVYG1S
         DfFf9Cy/0ikdmA439cOyeT7qj7LvgEVsAJzgyvTsNmX7ettUiADCb1RzMygVnKFef951
         ddMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302241; x=1789907041;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEkeSZyT1b92t4did9aLrVflRNi2rCzD7o+75wH8zs0=;
        b=T+XoNgGSQVGBYqm+c50yXGUJAn3S7k7zgvDKAWel3BcJmVazDRUgkjib6CM1YLyBy0
         tZ3KRPaXlZfZCPO8CefdqJ5dpneRvdODalacKoR6C6IN0sG1i+IrxW9KoOrZSVPGWjSG
         x4MCDGrB7/78PCcxor/r73phAWfVsvblv4PxhFPN8x204g4vy2Fj++comxFfyWsWCKHB
         AieFZzs6cPo2xJX/o/bVJPaMElZMrH4DgYk7y+Xph3XlTYtDhxl4SQJelNLZj6gbDCZC
         CYMdNRhau1XGoqzPgbWbFjhGggsts8FbpI7n2WwGVMZSRjnLYQfhHbbIcZ/GhE0ifpu/
         PCEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxswerb0NganLjZsdr5owhbOOkANkranp2L7QHpETYje47p89XZ+pomYHAOqLSj/VXf3zdJB4lPDfwp+Rg8@vger.kernel.org
X-Gm-Message-State: AFuF++k4VgDNto8mykVwjS23s9siCkkOh10vwcn6mZ0aQjvtLKn1zbD7
	leTNk0SSit1ZuJBgTiY1dsUCP8zn6zncgPVXaLKqKFBss8DUfqEBJaoE
X-Gm-Gg: AYBFou2fWmebcGgBSNbltEQvuEHb5/UHm6gjMg7dXAwd4HtCYv93W7JenEhOqTs7rat
	x4aOOMwvEbxJT6Evqy6bsx2EirnEl+QOCFG/KIWlXX5Q0OnC9jLhu++/vveEMZgHldr+tSNi99I
	4KW5dxFKVxyIp1mCGuajNRckgxCQXyIDkqn5t2kPuvpukL+utFUYDWsgTElcOPJdePVouhCdb37
	/uQ+7pO8gl50g1Q5CN0O4CbOgUrZM0pjstwGujZLZIcupmC8wUAe1uvu+AkBG1M+zqSjMPsUSBE
	nLjd/Fg/ApnHQGfXYt5B58ZWzYvlQSZ1XNAuz6NbaRu6Z4DuehJbt5pLfDDx7SEwXuNxJPrrSH0
	QHrl3YjcC2cwNLdw6ehZfdSqrRLn9/4ONpHlLJw/HjhDxk01521gLZYdg3Aoi/6+BgmCntRy2gD
	AOv/st/zi6Gi/RRzEVzaouZRKh3oORNt+ookFBuIQAnCS1+c7XHyUAJ+ATVj4xvwgD4XKIEOhPb
	TthCTnRh566ittodUbFiRlFC5CtQ8JHXhRFalsHoq9TLYmS3BLMLodbngjo6oWLk/amRpnzKCKk
	WkCYISm7/cpCxUsSHzeFxMt5OlXhCn2YIcQtGu4PQbZWO8U=
X-Received: by 2002:a05:600c:83ce:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49e6cc2748amr57258525e9.32.1789302241246;
        Sun, 13 Sep 2026 05:24:01 -0700 (PDT)
Received: from p200300c587296833b1b3ac6b56381a47.dip0.t-ipconnect.de (p200300c587296833b1b3ac6b56381a47.dip0.t-ipconnect.de. [2003:c5:8729:6833:b1b3:ac6b:5638:1a47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm20255885f8f.37.2026.09.13.05.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:24:00 -0700 (PDT)
Message-ID: <182679ae5437916095a4b04187e350c80235c088.camel@gmail.com>
Subject: Re: [PATCH RFC] drivers/rufs: add Rust UFS host controller driver
From: Bean Huo <huobean@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>, Greg KH
	 <gregkh@linuxfoundation.org>, jaemyung.lee@samsung.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org,  linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Date: Sun, 13 Sep 2026 14:23:59 +0200
In-Reply-To: <87mrtmvioe.fsf@kernel.org>
References: <20260912-rufs-private-v1-1-716db733e655@samsung.com>
	 <YKq4TcQM0v2dXF4wTHEvZKwASII6PDd_R7_UiHWe3NRnR4JsrC_ZS-x6jA_Kl7P6ONehU0REHYk7WaLz8Xv5gA==@protonmail.internalid>
	 <2026091124-treason-trickily-bc52@gregkh> <87mrtmvioe.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-09-12 at 13:00 +0200, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
>=20
> > On Sat, Sep 12, 2026 at 12:52:55AM +0900, Jaemyung Lee via B4 Relay wro=
te:
> > > Comments on the decision to bypass the SCSI midlayer, the blk-mq mode=
l
> > > used
> > > in its place, and the proposed prerequisite API boundaries would be
> > > especially welcome.
> >=20
> > Many many years ago, the USB subsystem tried to bypass the SCSI midlaye=
r
> > for its storage driver, and while it was a "quick solution" at the time=
,
> > in the end, it didn't work out and we dropped the driver as it just mad=
e
> > no sense to keep duplicating all of the logic all the time.
> >=20
> > So I wouldn't recommend it, as long as UFS builds on top of the SCSI
> > commands and the like, you should not attempt to duplicate it in a
> > separate driver, no matter how much "simpler" it initially seems to be.
>=20
> The scsi related code in this driver is less than 300 lines and is
> mostly struct packing/unpacking. I guess we could lift the struct
> definitions from the scsi layer via bindgen. But at 280 lines I am not
> sure it is worth it, and it hardly counts as duplication.

I agree the SCSI code in this RFC is small today. But I think it is small
because the hard parts are not ready in your RFC yet, not because UFS does =
not
need them.

The SCSI logic is also not only in protocol/scsi.rs. upiu.rs decodes SAM st=
atus,
and queue.rs parses sense data and decides retries. And some things are alr=
eady
missing because the driver does not use sd and the SCSI error handling:

1, VPD block limits are not read, and a discard of 4 GiB or more fails with
EOVERFLOW
2, the cache mode page is not read, so FLUSH/FUA are likely never sent
3, the residual count is ignored, so a short transfer completes as success
4, UNIT ATTENTION and BUSY are requeued without a limit
5, LUs are found by 0..bNumberLU, not REPORT LUNS, so sparse LUs are missed
6, no START STOP UNIT at shutdown

Each of these needs more SCSI code in your RUFS. For comparison, sd.c,
scsi_error.c, scsi_lib.c and scsi_scan.c are about 15000+ lines today, and
ufshcd uses all of them. Once RUFS has error handling, power management, RP=
MB
and SG_IO, I expect the SCSI part will be large, and it will be a second co=
py of
code we already have and maintain.

I suggest you samsung first works in JEDEC, together with the other UFS ven=
dors
and host controller vendors, to remove scsi from the UFS spec as the applic=
ation
layer. As long as scsi is the UFS application layer, every UFS device must =
still
uses scsi, decode scsi in FW, and RUFS must still send SCSI commands and ha=
ndle
SCSI status and sense data, as it does today. Moving this SCSI work out of =
the
SCSI midlayer and into a new driver does not make the whole ecosystem simpl=
er.
It only means the same SCSI work is done in two places, and it can even mak=
e
things worse.

If the spec changes, then a new driver built on native UFS commands would m=
ake
much more sense. That is the first thing to do, not just post an RFC patch.=
 I
could send a Rust based UFS driver as well with AI assist, but that does no=
t
make it sensible to change the base of our current UFS ecosystem.


Kind regards,
Bean
