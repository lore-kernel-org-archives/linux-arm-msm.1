Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793100812;
	b=IrMK6Wif5N85Sgmgg7k1TXSNi7BgdRx5JUqPVXpydBJwY7I3Y3VGXjgQAs2dSLYB1SwC
	 EC3xyBjwNfzUB+h/jEQ4trfa05oLyhaoPfargcbLTZ+kVroZGmKIjGnrTR1yNwrWCJmex
	 3yVOA5266chE+BhmKplfnJYep4Iy/lfrsAoya7VY2jrvl+Ynn4KiPnzFY25Z70lgS//TJ
	 KS9c36WMdjmtUZaJnwZ1nl66WePeoXKI8mvTQHYBeT/EcmIk3tl15pVD2IR5DvVal+eh7
	 o5pidmwoWEBKPS0DA7+81b78L9A4ZNDPOsbIJ77SzT2FASNy8loF01B8g38X51Kqeiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
	b=k2d0+fmr3PxnxX6ZkqYOXqt8R4lSicidIAd4OnFblZyNp9XEU1tTyFJvtnXHFyECyIJk
	 G4Oo+UJ+Tz1F1PivE+j83LrJQnpcq74vhM/nmpqUM8/FMVcjWiIe+lQgPtdlEqmya4mBF
	 yey3lcFXTer0mTfKABdV63UmlB1ciKRc914mowJ8fbr/MtBQ6kA000YaD0xy5mehaPTXK
	 qiTamwPj73I6Ct8p49Ls1Lyws1k8zHsOhOKMwpyAvxhaOQ4hDJ1BfXmNyWxL3Jj+4h5Ua
	 gPwInGv6XLf0PiXHh0AJzoRqgc6IZNuqiv8A6j9hutfNbczD/E+5RlB9dwhbas7Sb7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL4KCtdl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B99606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL4KCtdl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso182713e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793100811; cv=none;
        d=google.com; s=arc-20260327;
        b=ggyjqmkvAjGvjxQB3VcBWuQMhQSMRcSbw1FDEW34SgLKg9VbJ60RShFPrBSMQT2HRT
         QNccb6pDK1uEtEb8yuNNHtN12MifALaCOlmphykTzeFlTqBxdYJbolxhVtEA7nrGEIpH
         Lq8MlKrbKr+BIBD3xwcAxZyEFvI0/WeHjf1wkHnJSoI/ygIRzGFu41hYYcuD6VNWJk6H
         JAIEfS4BlaYSPvMXDDcpbjRVCiInLRKqo3Up6S2tFMEJfeAjcwB5dXxlpbFMUkCrbJ+2
         OuGvFmwok2qysehAzrKMKsrZwn0O0bQQdHTaaf7SYet7cxjs7bUh+cCq+0nD3dfURuHc
         byIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
        fh=ZHrtuXMGszimjr7vf22wyEJ58ulwupfcEMo3uadtxn4=;
        b=Y2hvxJH7GwHmWpRnpAJntXmAUNSsQKD8LssfL0EQOhx6e7+vJAVXi7WPkd2KvLOjA4
         AxJ8oqZjbtnCvtCWVn8FMnotR8YunI6SP+ZgSqjn1XIGhbh8rFu2VihrPD2S2k3pFWkQ
         ualntenwIKBxcv/VRid8XcBGqhZh5dFWOnWrAQ1Lh8aM026GuCGMxl+2frL2hS+pCjJd
         G/+y4IsWQbTh3YBqeOtcj8Hg4tX6O7WYulth4haqb6sw2N2XIV4kkog839m6Qs2mPh72
         RXmfbC6qk9NM3yV9M5wCkR+NZknoc6KVigXozQQKNyyBXoarpOzYE1iw9etkdprztPta
         zdSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100811; x=1793705611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
        b=YL4KCtdllCf6rJ/xz59xWZFaDc9zt6xWgrmgu8NukuDGGVuFrdXkgd4jRuJ0bFwMT9
         WZiVelxmhXrfqz+t/DQtVpOwn5ObRVNV0WcXXyScr99Bfl63h6PiJnjEH22dbY7LSiBx
         bI486/6hhQcMMS/QDQkeCLlKH3H7mdO0PLHZxExCUUibYXd+JUR/tX91uNctSchhxmgR
         5SIl/ftGbeVy2Cao4F0iPQqyBh1OjBAJzM6AwLiS4XWrIhqMfckZ9OiWN+R1leZeUupj
         fvGP3V4CToa/VCBuvQ55sQmuZXRtyw1WYJf8Ck3CocxeLFpropiJ57qg0jNjqv1mLoEd
         YvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100811; x=1793705611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpExfa5+EdYVQhWZBFhx1n4JPsMDYFeJfTGAenIwYVI=;
        b=KlkaayjZOjLcGi3kQoCeaYFZx2yE0hoaTmiVDYCnD5FJLBFI4+KDdnbWaKaj3UZyCo
         +dmzTvcCAuJ3MIFruJZdcG/l2UmstJkEbLJwMuz1HIeD7uR950HOxekePLq+YxESm+6c
         XYITxiTej/X5IO8hVRqHIUOfn+yweq7wrRkUEHiaXLlK1eZR7wlJUSLGzm8AkSzonk6F
         H9YlSa4ZDd4VrdgBgajfHBVQ4pmtU/JURYQhw/rlsysGaJXCTMB7WzbY6sBjTAD3vVgB
         kV8Lk3BqzWHKfy/XfodYWtoZ2pmuhYfkl33obqq2Bh8C6dOHpH9HRfLVQuqYhdCU/tf5
         Kgaw==
X-Forwarded-Encrypted: i=1; AKwUvBzB1klsXRZGLJVpucGElHMmVv4bKF5V5n1/1IDqWw2MbGgQ2WeKnWFwM6Z4xp0VJla8CEOutEiXItDV9p5d@vger.kernel.org
X-Gm-Message-State: AFq9FYKcSrF+M8VlA6cV5vcUfrHI6qPPAuiL0cBI6TyTj15wtW3wCeDX
	V/4EvoQyRexWWHf0IaL93SuMPk/r20kieonnewlJlYt0zUHRQCyRUSK9kELrZcFPyV9sgI0VOcw
	7ZYdBlklHu8rbPUtzW5UOeWMQ5ieP70OPa7iKmqE=
X-Gm-Gg: AYBFou1jka5925R2R6RXo1Ii7ZDLnPfdpZZWUh/RcQlkaiSXyRPkpnsDXwySyDMW0ZD
	MwWh2AypocwDoD7vzuovoorA8Bbkk5zz5ezjRH0AVDkrx8EjcY0PyRx40AmT9Rz9FhvE2H58kuk
	SJouJ3tBYV6YjIILgQB/yd+3F463bay7jhcJ2JawZlu5mPNJp5aOCfJfDnGhTt8BkGkis15dMbk
	H5kgP8Ee1wefyKsQysixX4i/lxOHK36GhqfMtKNnZcdAjRGOX0ua1Gwiyl3Jer44ekMCfQSnI46
	Bo5dnUEvbrSB5p3WKFhUmTWZbRRWVic+maxaVSM4MLWo9m3drUKPytxgFlVJHLlzbK40wqRCbq9
	JyO4omz6hYLIB4KyH2r74TvI6essveJNbGw==
X-Received: by 2002:a05:6512:b85:b0:5be:4323:3d02 with SMTP id
 2adb3069b0e04-5bfb71d0a84mr3034339e87.12.1793100810512; Tue, 27 Oct 2026
 04:33:30 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-3-dc_redstone@outlook.com> <dd999250-9b3d-4176-974d-97f0cf2fc19d@oss.qualcomm.com>
 <CALkEBsyQCJwoDiR_dnqfVynEUGBi-qNenE+1oAFADPC-6OOBZQ@mail.gmail.com> <b971335b-e7ff-48a0-a1c7-9f369a3ca75c@oss.qualcomm.com>
In-Reply-To: <b971335b-e7ff-48a0-a1c7-9f369a3ca75c@oss.qualcomm.com>
From: Stone Red <redstone.dcity@gmail.com>
Date: Tue, 27 Oct 2026 19:33:17 +0800
X-Gm-Features: AclHuK9uUZ5SH4H8JQ86BJ3eF9SERpKIB2isWpx_i340EjnAIfFER6iMdaoElI0
Message-ID: <CALkEBsw55zuA-dPjUc-MR1S7cJ330+nkHSi5MD5MkHFG1T_+7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	ShiTou Hong <dc_redstone@outlook.com>, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks! I may probably update it in a following patch.

Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 18:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/27/26 9:56 AM, Stone Red wrote:
> > Btw, there are some misplaced `status` properties in the original dts f=
ile,
> > am I supposed to fix them together?
>
> I think it's good to keep the new style for new nodes. If you wish to
> do it manually (or maybe ask an LLM), updating the file itself would
> be a good improvement too
>
> Konrad
