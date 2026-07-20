Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF74369A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784506626; cv=pass; b=p/2hvwx8Tlh+0ebNEdlM+fsrLdFApGoWK0wRKskODZcYC4TD3b6Yfu337FS8nkf61EtzYsegvfmNobDw4KK6y43aBEQFVl2t2Uf+bFTGjSD8sDBcwUbn/4mchyPuaw6fjG5X/QlGCG7hgf/AVa7dZOMHW90lsoFe8KR5U7D5cLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784506626; c=relaxed/simple;
	bh=O9cP6nGCNqeHN2Xq8wqQS3LjGvGODOTi/nxM+kFvsiY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Wpqt2dEQS4ccE/7c5dP75GbZLq+y7PFH9Vs8Y7M/3SHwbzBl2j2I3as8JjlmLYUo6iGLS6GyYCoA5xiJNDK5+POqVBBAfWI4LVG3lUbZKcFqcEe3/ETw/055iopSt1Ne9RwluxNTzyAnxqM3bSMn6gFzcTGs0fVokX8en2lDKak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5a9s6a; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5a9s6a"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8111c0c7561so119729487b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 17:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784506624; cv=none;
        d=google.com; s=arc-20260327;
        b=CJxrxYOaa5p8U5Vb+Luy/7Ei/eCXGDiDlvuD+lP3ru05K+PB3PYRoiVFsAhIH+ir0/
         VeBwVrteVKa0D9f5nGMfk0tcBRLeNrUm0bRl7QFv3O5WYxQLFeJ67WJU55NeabGnQK3z
         UKJtsLkT1MfjU5xnlbvytUmj40YrOyOZNYULE5iAhprRtd3Oucstim7n8RTep5Qk8PVI
         6IfL0r3db6Vgon3f5AhMv6rhPKlP8bFh0YBT/87P3kGuYyLNsN7dbceVZR+GKIBO6jdC
         ilBbJGdKje4QRbAW9mWoDJ5wKtEOd0hrvsSYKJgwFo/R35ie+HiieSuhKZ2osx9mr+3E
         9nbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=S20JVaLKnRGihstk26kL2qltfogiNg0YzdjITHbQXu0=;
        fh=mPDLmM4ihM68sLFVpj1l2/mpperV/Iw1wk2tSXB+Hq0=;
        b=duyZ1+vyS72smvRIibiJd4oSWqv+UJBkCR3408t4FTmNiOi47ZRUu3KNSmo+0cw/pg
         Q14HwsJry7sWnO5JKsRlehlPbg3vxU5VmUw7qSn945WXAkADVARE+RflxCNqwvXB2Lwt
         e3vuWfioLSrTzX85AhAjH/TPcSZ1iO4xRINz90ixzqSWx+eEUKbdrUbhHAJ3AAUK7Nog
         WgmE7SdVIMVy6nto9vIPFsM1inl6QQ4LwyOqHG02LgdYSjki2hSWea/fuoIRU1x4pp+y
         EjQdUzaymHVATipIborWsJxW6tKiaWyIQ6U/ECxixddKKYEhhgqdLTAm2Wk8MWPmpnaP
         5e+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784506624; x=1785111424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S20JVaLKnRGihstk26kL2qltfogiNg0YzdjITHbQXu0=;
        b=Pr5a9s6ajjbsTsGEp1roOGYMM2xJ/4JbKUa4XMPKBK2tnBRzv/K3WvmWbEEIag1aoS
         JsdwlZfc5GyI0Gk9TroTIhm9Fg5K6mj6LlYH3F1WrTtkc7yw9XlxbYuEqn7h9l1Vt3XH
         lRVYQEzXF/atecafyK1sgb6LocTA1DsymaWuDr6UlRrsgcxkkrre7MN4OuzNImvCJpjo
         l4hnmQenQREbP8uU0VMDG25c93Hqwvd5tRFgSTv5AszbhjHBohVyJb9o4/8L1Zkpb6f5
         8MzFSjLhplMbUXA2yfdrlxxELhTF36W/ktX37n0doohE9DTXD0xf+Jo/tvQkvvQsp3qa
         asKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784506624; x=1785111424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S20JVaLKnRGihstk26kL2qltfogiNg0YzdjITHbQXu0=;
        b=olXmFkEmdBD8QmZhFbzER4I0QeQT43pCG4i+NsJQ4eF2TImVaREYzpvmh5UC3tfxVq
         Lp5niupEDBXq/cIyjfkuj0P+LwWnCZtW7xTxeLWjsSWX/ZlI7wnn0U64R2uGBbbaYMjl
         Ne5e7E1LIwB2cp8z/8oSgcMuUgYrhTebWKyfSOGq9A+NHPmAWOmBERb0AQeEm7+Cppj7
         869WxB7n+z0Z1mi8JbTL3vq0ejrhlTqxtlPy+K654a635t2NZfQWyuqSFd6ejBFC7sj5
         dFVHaiw7VixSALJjXFd7SjdMVFk8JL/fgsTC+0KagpBVEs7Sflsm4fMjgZveWSE9DdqN
         4ldQ==
X-Gm-Message-State: AOJu0YzLEWlpsv35mQ+1JVZIoBn4qaeOaQh2AfvQmuAcl97DaQKnfPu2
	L559fERCELf98yRZSiM5dZdpNRl5DasW4yqtFY5Esimk0m3alVRHHfxFqJpzOX4TK1ATkTfmfOY
	7E1zgmCTF0EXh6mhuE1M2J7NOHePTMrg=
X-Gm-Gg: AfdE7cl0pVIu+O8ZsRGzh39zJEipNQ88KAMkjbdJndk3CQEc3WcfC5c4A9HPCdlB54a
	RoxaXnRQ/iKPpVX4f7Rfrj5yHeKPM6pJzvK7yyKDO0I7xKBb2w+Qo7ud3iMp7sLdHEFE6RVHGN3
	LoEqKlVSHWO+fE3nP+UPFet0/geGsRkBAHExsk2JRe+b+84XbpVbDxKFBboJLouiK8Ti13G/RcX
	wOg1/B85gSh9Wv8sU/ngNe1yIM9MCysfudedRyW7KkpBzYR2hKB6PRJFLIJuh6VP6P918XE+Isx
	qeR9IBCOixxFtWJQ6/553IOnzXZbZA==
X-Received: by 2002:a05:690c:b9e:b0:81e:d000:b364 with SMTP id
 00721157ae682-81ef288783emr38868497b3.72.1784506623642; Sun, 19 Jul 2026
 17:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?TGFqb3Now6F6aSBMw6FzemzDsyBHZXJnZWx5?= <lajoshazilg@gmail.com>
Date: Mon, 20 Jul 2026 02:16:52 +0200
X-Gm-Features: AUfX_mznxPsRpnpalvP1z-mBxFg7xLZ6MbxIhdS_1lAqtpMcu-Hb4Vp3hyS88LU
Message-ID: <CAAD3nBebR3GPbufLyc95QVwueLBUWmGpxQhqtSt3EBEswjpdVw@mail.gmail.com>
Subject: SDM632 SLIMbus: ADSP framer never gets frame-sync under q6v5-pas
 (works under downstream pil-tz, identical firmware) - what physical
 precondition is PAS missing?
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas, all,

On the Fairphone 3 (SDM632/msm8953, WCD9326 codec) mainline SLIMbus audio
is silent: the NGD reports "capability exchange timed-out STATUS=3D0x40c
CFG=3D0x0 INT_STAT=3D0x0" and the codec never gets a logical address. Same
hardware works on the downstream 4.9 stack (A/B slots, same phone). With Cl=
aude
code I've localized it to one register-level difference and I'm stuck
on the last step.

The only variable is the ADSP boot method: downstream subsys-pil-tz vs
mainline qcom_q6v5_pas. adsp.mbn and its devcfg are byte-identical; the
AP-side QMI sequence is byte-identical and ACKed in both cases; current
mainline HEAD (including the merged qcom-ngd-ctrl fix series) reproduces
it, cold-boot retested.

Reading the SLIMbus block (0x0c140000) and LPASS-CC (0x0c000000) via
/dev/mem on both slots:

  reg (0x0c140000 +off)      downstream/PIL   mainline/PAS
  FRM_CFG   +0x400            0x000D0C83       0x000D0C83   identical
  INTF_CFG  +0x600            0x00000001       0x00000001   identical
  FRM_STAT  +0x404            0x060D1901       0x00000000
  INTF_STAT +0x604            0x00003E04       0x00000000

LPASS-CC is byte-identical over the whole aperture (SLIMbus root RCGR
CFG=3D0x509, branch CLK_OFF=3D0 on both -- the 24.576 MHz root clock runs o=
n
the dead side too). So the framer is configured and clocked identically;
only the status registers read 0 under PAS: INTF_STAT bits FS/SFS/MS
(frame/super-frame/master sync) never set -- the interface never acquires
sync on the physical bus. The stock firmware's own bring-up confirms it
waits on hardware: it polls the FS bit, times out ("Hardware failed to
enumerate ... (FS:0)(SFS:0)(MS:0)"), and its subsequent HW reset succeeds,
so ADSP register access is fine. The firmware maps no separate PHY/analog
block. On msm8953 I find no AP-side lever either: no lpasscc, nothing
SLIMbus in gcc, no LPASS GDSC (unlike msm8996, which frames the same codec
family under PAS).

Two questions:

(1) What physical precondition (rail / reset-deassert / pad / LPASS-interna=
l
enable) must hold for the SLIMbus interface to acquire frame-sync on
SDM632, and where does the pil-tz path establish it that q6v5_pas does not?

(2) Is that step AP-reachable from mainline (SCM call, reset, regulator
vote, clock, DT), or only TZ/PIL-internal -- i.e. is this fixable with a
kernel patch at all, or does it need a vendor-side change?

Full write-up, two-sided register dumps, binary diffs and the annotated
firmware disassembly: https://github.com/msm8953-mainline/linux/issues/255

Thanks for any pointer,
L=C3=A1szl=C3=B3
