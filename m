Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192268;
	b=c8OUCqjryL16WTJh4ojFHaD2AjbXA5w0jjqWYVli/m6PF6IErG2BgDGdPN22jdoR5syS
	 Qz0lc77OvhGtU2mlg+pZMHtzh8Oatk6o1gqzpf0Rju1i7UJYBNQoQD8Q+WImLzcZQDvyH
	 gcp1b8v4pgup3ArcD+nsWC1f/CDroVKr9Sa8RuhDPee0CvdRTewfDWikfS8yewIl7DPhC
	 ci6gd1Ek6UIkUZTKAw+k25EcTqg/i1YFUB+feISz/03kfMKtaqmePC8e5ztKKoCE72PQR
	 TjxDEdow26lOAN6G7QdSURffdz324/sN4d8bWUxuuBPXC1YLABFws4lfbabbxkYcqJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
	b=05YMJQuGXF/ZgKI7fv9mCL6UFRBl0U+gYYnQ/y5E9laOiseJGBQ8lt+UuHfPf7BYCaMJ
	 oDBmZDiAwkUYV7Ss5CpA7ZjHQ1mTgWoCaJyw4QucudUW+3S3oeOgLyt4ZjYjU4bqLsLd7
	 hUsf6zcQu0PTKPnYzVOnp/F0a4zJLs+O2tTZTDRrcFqYTweQ9UVC6+7ENofFGaNRNqkzB
	 qa4ykFXtMFlTEQEQYojBQcbr/ysxiVBK5qJlxcB/G5L/ibUjTu6BB6pTVL9q2WjtGTanC
	 ZTKISgGLGfkbxoD2iki+eT7H+hOfmP5yf79Bd0nmN3EKKNURCooAx8jA5HJgiFouczA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+kwyYZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46B606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 02:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB46B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+kwyYZE
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so812592c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 18:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192267; cv=none;
        d=google.com; s=arc-20260327;
        b=WCZz+Ng5H5jPbtUe+uU7bhEKaH+cIQy/S4Z8LuDv2j1OR1NVt//mId+E5cG1SSmhAl
         Nq91BVp4/icELHYlY39P0L6cmKsEvbj2ZJxzZ/XNd2t1atK0Yq++PMQ9boB8yeYcTk0Q
         8nZK+G9HREGEEkXx70hXByl1l58F27X1i3BlSHTPs13lQXV31iSBFTngJrd6FTJPtr77
         jt4L5ekaV8nC6SLoxpEDTzTURvNNeX8MmLyL9a6GpUaTmdqn3SSHj8JwxQzWPuvT9YJ0
         Br2/Hrs/nxbWh1+iBE5p41mgH+e5FMPpPRVHyqm/5ImVERdmlCVTHNe/x85dk66tP1Bz
         T5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        fh=3OtZUuOJ/gzM16JLDxlgmZrJPHoB1rRoD8J/09QXzUY=;
        b=kWeNgFuZ6hyB/ciV30kHT629Hazl8mzsKHc9l7SI24w0z76IYuRIFcUaMU7x0+sMAy
         zLGElBhcdgobJB08VlR2+7W+cwae0RO7AKmCbz6W2XAfk0tUH541L4LyJhclyING6gSj
         h9DBC/BuFE5r5sTLuTW4vDMx8g+6nKVLvNB2CufttDXY/j4dzo1JJZD/JuXqKOcIxawX
         3FNMb8efxwd98B+34EB8NDFxWyjNcfTaA72/cN75nm4mAShkhamrIcaHN8PNXLl7TpGn
         uGaUQYGeYu8oTbjPPdZfi1MVeRaZlLzeIrbX9fuPDeyBsvELsrHVcOQWcYQponctqNWv
         Kq9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192267; x=1794797067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=H+kwyYZEDd0R4A0FTkVD3QYfw31uPv8dnVBZ+nh7D3zue5lQXWlApwrN2t+qKvMO5X
         fosgAAv/Ifq3+tVChuvpbuxpExpKsio1+YJch0/8Z04kTStr1ucu4edsg9igk5Dn457P
         7empY6zGNQ92virgcqoWC7E30OTFchyuOBibYsJjx+oYXRRCP+9tKQyyFqdxCWicxT8H
         rPocIhDVNE2NPXXgM7mjHyytT9R0+bs/xEulfCq5iA19tOwiwOVtTElJbNUoHlgf3fy/
         rtbvX8kbhobLvbBzEFhBY+Eomy6OI2ZFLIfJl95SXChKq0pPhutZE/WaoHTKW0CHj+7X
         MqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192267; x=1794797067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=2O4LTMl+zlTU/9WEnAnwvz7/9f6zOl8oqaqbfG0+E8AHN02jvO75VsR1cHYceL+8Vb
         f8A/tRnFGyVxS8gzgwxNtN98bic7EZTXazCArgzY9/KDpnY1/qcBZAYqIPWQRTzwHQno
         EDLy/LBChMDlNcFBTv9aC+OZAqLfkyK4R1QrQkQsYcuWMrzaL8YHSLktzmgBM16Qy821
         cAomsJJCwXK3dqMFiDqgnueTj+gu0iDGlK1xQq4JjkVVu/epo+Fw7cBTx12g1cdM2nJK
         iyxmhrXOPcbI/2/nxBMWs6VZQrwoJoXuGwgO0d9VJ9Lt86F8pIR7KUiabuOW3+Jet7oa
         o1xQ==
X-Forwarded-Encrypted: i=1; AL+hErFpIUKQyFeHV58M3sG72xntryCjj+0SvHoL1fVP2HbfopOLzIwlZzOMauhA7qExBhHuQ/nPsFw4Wp3HOjRy@vger.kernel.org
X-Gm-Message-State: APuU4Z/qqUgWxZSakcwLDffk6tjiNRjcae8D5MtRhN+RHfAZqw7lAso3
	F+XPmZnfNJl4jzJYpmoEIVIfGMjwrGDN4fuIEg95R+xp9cW2WeUml+RXoXnXF4HFZEK41lHP45J
	E9lC0C/9n4FyzeBXJEadPCM7H2/2cQlo=
X-Gm-Gg: AYBFou2EXr7YhZbHFUkheAtj5yVZ9RWAwAzgAX5U99KE+uJqy/9NCLIsDwvabNqmyXl
	jlmM2qROhrX5ddlGew9KYQTEcsTEvH0mMO0dmlGWJVMLvW2txZbAT1B0bk11tstq++y6Atvlm0H
	SQWc+qnTnlSmXgwJxHyAmcdyk/le2of3wLUCaRbo4GkG3cqc6tPUo7lGAcq1PdmCgB/S1MTpe3q
	sBh1CByMsXhHsq4RcL8QpF8hWVg/Pqu3QfmLVK3L0SCIFz7dm43+YMsbwFA/TrM11UpWYNw1Lrd
	g2t9/Yl6k+IZYY1iXlfOqm+rUzIgdbtYjweEjt7RWmLme+sukLkws3pg+riqHwWDQCoefOhryrU
	sX/CM50q8xiSVuo8p3ubM2W0xf3WnuagKvBChFkg=
X-Received: by 2002:a05:701b:2616:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b39fe291d2mr3839870c88.5.1794192266580; Sun, 08 Nov 2026
 18:44:26 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <20261106212939.GA1814035-robh@kernel.org>
In-Reply-To: <20261106212939.GA1814035-robh@kernel.org>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Mon, 9 Nov 2026 09:44:14 +0700
X-Gm-Features: AclHuK-MtGA26JxVmDU8vwHD7H1Dr6pcTzIJGZiqmr_2gGFPDRoc8BRW2dGJq-o
Message-ID: <CAAq9HC7Fk-duB0LKaDDKeEmLYvZuvWTBab-YpjS9x9QHm0z+7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Val Packett <val@packett.cool>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The failure isn't fatal on MSM8917/MSM8937, so a runtime fallback
would work there. My concern is other platforms. Today, a rejected
PSCI_SET_SUSPEND_MODE makes the driver stop, which is the safe
outcome when firmware misbehaves in a way we can't diagnose (PSCI
has no call to read back the current mode, so we can't tell what
state it's in).

A generic "try, and avoid on failure" would turn that into
"continue", for every platform, including ones we haven't verified,
unexpected things could happen after that. The property lets a
platform that is known to be safe opt in explicitly.

Best regards,
Reza

On Sat, Nov 7, 2026 at 4:29=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 09:41:10AM +0000, Reza Kurniawan wrote:
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
>
> Is that call fatal? Why can't you just try the call and if it fails,
> avoid it. Then you don't require a DTB change to fix the issue.
>
> Rob
