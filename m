Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192232;
	b=bUM9L25sGv9HPFsaN2jAFwZEucZTfVhAbHdEKDvYBWSn4eirsTRDeJ+CGwf+BVMi5Dfq
	 ey6aU0blnLwhjI7TtycUHZP91+EusIQP9+GMp1EZsOjOSXYXNcrb7R0S3M9At2bUB/E7L
	 jaskUvnuJOlcbG9AF3iSBOLsC22JNtjkw7/bd948gBOa9e4pyXbfhYpe8sS2wBv+JPqF5
	 kgNlZ43qMSu7bhYyHFBWefs5BMQTcLnDAuMTlUsEZUh2NnvJJF7Pi3timixFSJConkFA2
	 wWrmx/4Z+t0yIxymrgqJM88LUJQP0Sz+Fa7UP8Sio5burb17e9rbmS9Ej1a0Io2/ASA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192232;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	b=d9uqBQJG5Zm4APsdH0LowaTLhy5CVBxZY21CiLizsrCdsW14ayXeIZGZppF4OaSKUItf
	 3bACDX2iYstf7OKa/puylMblqe1All2UzGpkD1sUqmLJYB72C96T0BBpmlaEgYqGYfgtN
	 ihPtzbH7IJa2cIvc3niTdXPEy1Iw2ryjo6HyxzyG7pZkUTLtLwV8WXuaAGBhwHNxW3HNU
	 W7YINE0kccAi2wuI64VEiTpEglz3uRfiyqEdis4KrdnhlWTWRm3KWp40whqIolrv1M1sk
	 pNWEBUT9xRfvOOSyxUeYjW/4kV0ph7aDWME2izF8Xv8LzfSCuyblfUbBlIJrXPGcG+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOJ0zh4z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469F606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOJ0zh4z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069661F0089F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 02:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794192232;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FOJ0zh4zJXUQw4MziVD3+8dAw51F6b6lLyXVd/YcSGtZJ1UlcpBa9IuP7EEE2Ussp
	 MiD6q6N/pA+iXEZTrQi/BpeHnXOhpf9oR3xPLJuLxtonwwcUCmvpyJPNh/YVyyewap
	 87sSEPx5drY4YCIFBfMJmlEqUO7Z2v5aUEANUG5iwiqyWMHgDmdF0fiiXfcsUYRK22
	 hy+vXP5RcPIC2K26wbgfVeyImwX1pmqe57yocWa6N+7lIzQwksReCyjTSRjVhRTjFo
	 q6F3dlBIZQC/Ksbh0CM52+fKp/w9yP0ZgQ0lpA/BJuOdjF93lhrUOA4bEp5UYpHNI3
	 tKHt+PLWdZr0A==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so578003a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 18:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGxtCGSgsYo1Qb9HWI0SgHT1TmCLQ44vVkNGslDs+6OC4grZ9V9/lg9FPQE61iqU9WKwv+Lxjd9XGGS2Lrd@vger.kernel.org
X-Gm-Message-State: APuU4Z/HqonNq86iXoH2jaJ2zUgV6BGoVI1aRXnPp+pond/9oEoTDIix
	BX/QPxRS1A2OKjuKCASKl4t50b1qiI3hHiUVQx7e15FkSq1XPsRezT1SOF9mtrHjBj+buxgLCns
	AMj5FIgsjLjgLTW5qLWduECKjCEh9BDE=
X-Received: by 2002:a05:6402:4487:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b72249a189mr1729932a12.42.1794192230805; Sun, 08 Nov 2026
 18:43:50 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com> <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
In-Reply-To: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 8 Nov 2026 18:43:39 -0800
X-Gmail-Original-Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
X-Gm-Features: AclHuK83znKgPlPm3mYNg-jihIjo0y5-ZXz-onGQXWzrK1htisLXcdgRQNPmioU
Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 6:08=E2=80=AFPM Songwei.Chai
<songwei.chai@oss.qualcomm.com> wrote:
>
>
> On 11/6/2026 4:50 PM, Johan Hovold wrote:
> > [ +CC: Saravana ]
> >
> > On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
> >> fw_devlink detects and relaxes dependency cycles automatically, so thi=
s
> >> is not an error condition requiring user action. On complex DT
> >> topologies (e.g. CoreSight), this message can fire for many node
> >> pairs and adds noise to the boot log, even though it's primarily
> >> useful for debugging. Switch pr_info() to pr_debug() so it stays
> >> available via dynamic debug when actually needed, without cluttering
> >> default boot logs.
> >>
> >> For example, on sm8750 this produces 125 such lines in the boot log in
> >> total, 80 of which are CoreSight-related, e.g.:
> >>
> >> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/stm@10002000
> >> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /so=
c@0/funnel@10041000
> >> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/tpda@10004000
> >> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/funnel@10041000
> >> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /s=
oc@0/tpda@10004000
> >> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/tpdm@1000f000
> > I reported this elsewhere a while back:
> >
> >       https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com=
/
> >
> > Are you sure it's not the coresight bindings that should be fixed?
>
> No, Johan, I don't think this is a Coresight bindings issue.
>
> This is the mechanical result of the standard bidirectional graph
> binding + fw_devlink's direction-agnostic phandle scan =E2=80=94 it will =
appear
> on any SoC/CoreSight topology using the standard binding, and there's no
> alternative binding syntax that avoids it.

You can add the post-init-providers property so Linux/OSes can know
which dependency is not a probe time or initialization time
dependency.

A lot of cycles can be broken by adding just a few of these. It'll
make sure the coresight stuff gets probed in the right order, and more
importantly also does suspend/resume, etc in the right order too.

-Saravana
