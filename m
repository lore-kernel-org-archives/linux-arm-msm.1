Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA20429037
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099495; cv=none; b=U+Xmvg5TLXdMCpBOWFvAGyJO5aav9jMlUN8nOhkVxsHuMsqgeFsnoFNeeVY0h1gEs/brCmcW2wPTEVMBCgD2vpurr7Ixhq69QAez1VNJjpBDpd4wwy3rJqRg6QbrPObEqL53+HvzA+XzI44CqurH4cSHKEsJuenw8KIFu737HOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099495; c=relaxed/simple;
	bh=mhp15rEr10af4+RWrkbjJfk18xdB/RokTRf2nziVRmg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=eOV0KxLxEi05NyCLptoZawpG9g48vbLQPqP1+FyIrXlaPXAA4RweYahr8gkJZkDbSi5/TwWLipAuQdJE+HdvfyDlIvhi1mie0mgWT9lWoM4dghczDFrbjUgChPifDV54YnachbYlpeSyMCp42rgWKQZRO7QwdLbAAgCig4ntDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHw/st4Q; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHw/st4Q"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so8344266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099492; x=1790704292; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5GVayik6vqH9GZ7KjscgegMSEf/PjlQ21+zvo7CKvs=;
        b=hHw/st4QGvjBW/YipD8UpSd8e0QwthVR/1FvroDAS72pJgXg9fQbyR/e1zXmUAcwyE
         Iwpjl4cKP2vOQbeiBJrPYgi/JeuFhjLlXWxnVkqmuSKMQzAgfsMnQ9yPaEsYZ2Yxg4WG
         gD6JN/+61dDYZHqERrvjau9+f5LTftLWx7WycYaM4vi6aahu+I9AvCF5IkVvHxF49zHR
         C9grdP28xmZrC2ZRVnrbhd8YzSk8vhFFOUa1U71+QhhgwV1LlaNiW9+p+TOj/Xc4hCZL
         jYYCAhsnPAIS6y6KubDQ45ABkGiDfkgaA/7gKbiE3Zpg+UwxsQFLXItF0wYUs3EsCF6w
         7Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099492; x=1790704292;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5GVayik6vqH9GZ7KjscgegMSEf/PjlQ21+zvo7CKvs=;
        b=Umg3rz17iW13jJwSn70hPf4F8nnlg6nPlWZ8OuNdK5lWYVDBEufTRHgEuWmTtgId16
         s3KbCVsmh73+mhLaTOTKgBIfjhSCp58g1ZTBZ9Bw2O8CmvCKxyYRFYxld7r169/xiLCl
         B+797euVW1Mard8AbB5sOSIjiot3uQGV/6dHKYA6IGR7UjmJLdQKFRNYwLwP/3Tmrwp3
         Y7Q8kF3WuoHx3Ey6EeR0yOWp8kK65uf1a2Ucicq1XZ+BZj+t2K6jwymZIVNZoUotZ9IH
         PcBhhPU+HP1qoVgCxp5Iv6qYZBWVt/KhHsWGFRs02GWDCtLYflQXSkP2CuO9zOfMIV1Z
         XRTg==
X-Gm-Message-State: AFuF++lHTU6vpQE1QyeBkQB8BfTvH7aB/7ShL4CVLYOg9xLeP/yRdcYt
	+PGAxq7MROhdXrelyPTKktqCebTJ+VaZa/SekBIE3+g6POMwUi4oNR3JnXQBd6ta
X-Gm-Gg: AYBFou0IfBnkU2U/2kaPoTwEFZfr5np/xhATNeSJWb7DCazjjJKm2u5FPvTpjiIUdYA
	z2tos9ZLdkYjB1ynt7Yv5YNxflGLj7wjnOPNMOD2LGBJlQD1WtST7QOayO/stvvKESBnivYt3Im
	i+iZX02B4Emx3uKeL4O99hB2t+wmdTAib0pL9kglUgU9dLewmoSObKBQfe23t50hBJ7sfna8g+E
	wcXdaxIhYGG7p5AghuJety8bURZfATk1PyfII/b8Cl3Op9nQB+2rkGJl/7Jk2R0EfXXvnpJPBWJ
	2lZsk7HN2xA3DlBXQKwxWQui+FZTGYD5VqKPySfSWQslEDW0KqU0p7+6m8Mzec3BUsTMkp1umFF
	MI+1E/d/x0Q3NiGlQmTAUHMUlAYGlRrlotfVBEFzYipgzI0FFQaXyK0u+uaZIuKWVCDokm78RJQ
	moDpLT0V5XwsfKCvEp7/OwKZV9OFJ0YSto6hOFG2M54nuf0+ApSeaHWCYNc8PO4tVOUIucrcmN3
	X8zoORSkxKTZXfgvQaV1uvnlh8MuvrEkXv7vIC8e0lgKahWGeKagAXb
X-Received: by 2002:a17:907:7b9f:b0:c29:d0a8:79dd with SMTP id a640c23a62f3a-c2a15e515eemr1301061666b.34.1790099492155;
        Tue, 22 Sep 2026 10:51:32 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aad6eb947sm2279366b.57.2026.09.22.10.51.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:51:31 -0700 (PDT)
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: 7.3 boot hangs on qcs6490 / sc8280xp boards. Bisecting points to
 ga5218c6474df.
Message-Id: <3EE7DAD2-F428-4233-86B1-7A79F013A074@gmail.com>
Date: Tue, 22 Sep 2026 19:51:20 +0200
Cc: bartosz.golaszewski@oss.qualcomm.com
To: linux-arm-msm@vger.kernel.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Hi,

At moving from well working 7.2.6 -> 7.3 I started to getting hangs like =
https://gist.github.com/warpme/4d414d708a107532d6ae960173308013 =20

It is on both my radxa boards: qcs6490 (dragon q6a) and sc8280xp (dragon =
q8b).

Bisecting 7.3 points to commit: ga5218c6474df. =20

Looking (via git show) what this commit is changing makes no sense to =
explain hangs. =20

So i run diff on: bad commit -1 and bad commit (git diff =
9642a5e84375...a5218c6474df > diff.diff). =20

Diff it huge (50M).  So many changes may explain problem.

I looked over ga5218c6474df to understand why =
pwrseq-updates-for-v7.3-rc1-part2 is 50M of changed files.

It looks to me because of merging: =
https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/log/?h=3Dpw=
rseq-updates-for-v7.3-rc1-part2

So why merge is changing 50M of files. =20

I looked on this brach and i see it is based on 7.2-rc1 (isn=E2=80=99t =
should be on 7.3-rc1)? =20

Maybe this can explain why this commit breaks boot on mine both qcom =
boards?

May somebody look on this?


