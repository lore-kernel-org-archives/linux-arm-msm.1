Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795064218;
	b=s+IlydEiSZHpPCQOcYMzImm0dPeVxIJ/xmYNq0+ey9fCPkIESQvQ0QY55CrSYX0cJd+U
	 ZLim5V69RhYzj01D1paFg2OdJJKc+eaeEgIo/U9isOanrYM6qpoIY+zZcrfQDk6gvLvOI
	 V7j1/+d9CYJKhQadGLChhBg2XnGksF8A5XqeFFHnoydkifYRmnwCGTItCEXSK5dvNlAzV
	 JabbkZJ4Zxm4uGX69t2icMzVxARGZBMsCOtl2eaViElOxd2pw+DhTqlDfGId7Ob4dVrdD
	 3hQDK+GdY4ESXlwuGne7DddezJ88J6A5Ut1ChLF5g2m410O7uFUNqhX6pmGm5OcrXgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=H97Yafe+qfLRTj+Xdu0qeVeL8ndfUVxADnYesGu6zn0=;
	b=EBvRG8jp29VtQMhMpTkbKfpzR5MQhzzSsRfC6hg/EEDHGZRDjMCkG93XJysbQ0yMYZm6
	 FUQfIVFMCCuu0JzeGmXPxO69PKWGPgtbuH/q9+WybHkZRJN5ieFo+0H8rMXABdMqKiaEH
	 UViT8D3o7/pE4B68sGmW0P14BDAAsQUYMU/oqF4gWr0FHQIdWPupeZ/wapjk9qa3LD8cB
	 R9NW0avikypY+iYQlN2lo/HxHqt9JNGs4aIfKV5htSdPr1wRF6orBOshvr02TEGUo+OxH
	 KW+bzczj7Mgdd/izZHW+8P4oH9Ld6QtdmwYyfuw1p71w27yWS2+tImX1FhitjUqXXFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s76J7PX1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FB606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850FB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s76J7PX1
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b24f4b15c4so180580c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795064218; cv=none;
        d=google.com; s=arc-20260327;
        b=UFhkHyrzMC/T6AUAKq636d57CHKIY15wRy4hHQwudtn2+LbKuexmJofGVeqeMeFJk/
         n0vdXxSR03h0GQxAIP3AQJxbuS+14N1K4o/BDi2ga5v4QQ5R2J+eNDPAKBREz8z3aBVb
         z8v1ZHBjc7WG8DczCaUtcT91pgjMj5JkcpCsr6yzpmm34OKuFyTJv7N9iZHKnzEdvLg8
         q7t4AW4v9+3JH/7HROuAemCa41p+rWIZ8rc51joYRmR7Cx5mxaYbNLOAm4e/1M6KPm2o
         U7907ifbq4jFlVn4DVOQTtrltseF4m1Bl4qp+gZdk0+wfoqMhaqIcuh1GObZUrMD/Y1x
         V4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=H97Yafe+qfLRTj+Xdu0qeVeL8ndfUVxADnYesGu6zn0=;
        fh=EMfBHm0Y3Mve/9m6eJkj0t4ZsYDIVtocFeK/RqXd7js=;
        b=AvFJbp/ae1i4ZOgZzX+4d/rqk5jIUflf4uIanQBjq4zqXXWTSGwPRUe/Rkzl2jqDKP
         OLPW8KTsx5kICx1pnkB+7xqU7XPV8mkNXBvGNXgXHRurixl0E8u5iRMikxeitLOojDQe
         YXswgzepON809he32KMPhj1cjSKKLEQMCslpkaWBMt5U0yGAH/89p2/9EihZ0KgbbkB3
         ZYweHDwV4qdExhBqSYePfQ9u8go+U2L9O7VJIzOWOVhIPI69TGEjKlf6OG6ubN3Xz7xv
         1H/nG+e8an9hDvw8MdApGz9hkfr9FUoGvRAIxFSEF3jc6v8v1hhqCktrScJrzsLbshE4
         B91A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795064218; x=1795669018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H97Yafe+qfLRTj+Xdu0qeVeL8ndfUVxADnYesGu6zn0=;
        b=s76J7PX1Kqxb57Ih3mmB0gklosQ92jIK503a1IyEgWhdz6MX/Ym+Him4m5C/uHrnFG
         dBERtwhNC6bSUeuTpSGUOR52TE0HBIpgtcwMSiuBQFbW+T5+suT4e97rcXQ7EXIQzF3T
         eweSwazaz91rcJW+VOT9WNziOA8hXRHqkdCXN7eVLZ40028TyPXtiKse9GoHxk98o7tT
         tMKxdC+Rpij0LcmAQ01tqX2HSC6ORWppL+mDB10IkcenR2+/Vvajzp4qzTM3pq5TItcP
         x/r5lztMWLhN/A0lkH+jL+s+G3BpxLEr3/QUzUBciUBTyWJEaVf3d5EJEjH38S0QUD7H
         NpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795064218; x=1795669018;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H97Yafe+qfLRTj+Xdu0qeVeL8ndfUVxADnYesGu6zn0=;
        b=2rL1XgjyZwwYrvk3yvxCPI9AC0wtTEuHMPcgKpInlMoLyd7/JK5KJp5WsEko1eZ02h
         vuFSUORL6attfyMimyCM4YSb0pwjF56Jc9RkT7jq5roWqIgBdBC3dVClgVfC2gOF6Tt0
         HaTRvu99GJAoCqFxRfFGdndAJcyTIy8xq1rCROcUpoK05NT7O3MGAjCqQbYmsPY6pTD6
         HW5fHVmO2E9UZvKLP8BF+cs4F6ZWLFkTni6yBBNjR0mJdiFAuiqmM2+vN90ibai9hn+v
         cK0AKeQOVBEDhMW7adbUzJ8aStoSCL4Mq5B5U1CXNjUdahHWZO3Q/pA74Kst0sMWi1q6
         ldBA==
X-Gm-Message-State: APuU4Z+b9vJ08ojH8xMZ7qo44II85Ec/GJ3bTHKO4YXe2dYsxNUe64P5
	hYyd+OQcK0ZjkQIIHmtTvGD+ulMFoc7gNeN7aQysJWvu+qaFYGrX54Tp2UTyBThd3vBELEcVLHf
	zQfeqBuaPX3EIYwWfAnbr/Op8hMY63dRMjzAvixI=
X-Gm-Gg: AYBFou0N/9RNG9x6JhAVlSDKif0cBA1OnZIstaJ5aH+ipwyfEKYpGolHMOG46RFnPxS
	sDLobQYNMLpPpKtR4Z7ixJEnKnJp39c8Bdt18G/JMfz/H4j8WN/KdveTkfSsDa2BdZQfocFsLEL
	n0cdSMNdFl5CD3291tBh4qsBZiyr3aJHbEKjdQk4QbN+IirHIk2TtN65M7KU06G5lUQ8vN2bIRB
	BB9AVEh5/l5iyK2/Ru262jtldwogCJNI3MwV5EOIeEm4ZNVKb2Y0L7Sd9YUJ4SA18hZI1yif3U4
	HW4j94g+N9xj/7rV3paEg9nBg8m4w13tUCLJilgbAdynSXBExaHyTtDl6tXsSHhKYLsUZkEzjhl
	qJ8QcIHpqdNHsJ1/IPN1H0P2VsBjsbiI4UoSU7A==
X-Received: by 2002:a05:7300:5610:b0:384:707e:8319 with SMTP id
 5a478bee46e88-384ae057163mr28875eec.0.1795064217428; Wed, 18 Nov 2026
 20:56:57 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Varenik Commander <varenikcommander@gmail.com>
Date: Thu, 19 Nov 2026 05:56:46 +0100
X-Gm-Features: Aa3M54ojEPCyzku6txcWGGZ2LJikkQ8gHzHAZsS1LepNUcQT8bRLmK7GndEjtCk
Message-ID: <CAAR1zVJhtJR7=apLzKWWKuuPW00ueUS0kWt2=n1_-YpoV4eFzw@mail.gmail.com>
Subject: [BUG] pinctrl: qcom: x1e80100: lid gpio misses falling edge on
 x1p42100 (Zenbook A14)
To: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On the ASUS Zenbook A14 UX3407QA (x1p42100) the lid switch interrupt
only fires on the rising edge. The falling edge (lid closed) is lost,
so gpio-keys never reports SW_LID closed and the laptop does not
suspend on lid close.

Hardware: ASUS Zenbook A14 UX3407QA (OLED), Snapdragon X1-26-100 (x1p42100)
DT compatible: asus,zenbook-a14-ux3407qa-oled
asus,zenbook-a14-ux3407qa qcom,x1p42100
Kernel: 7.3.4-300.fc45.aarch64 (Fedora 45), also 7.2.11

The DT switch-lid uses TLMM gpio92, active-low. The pin level is
correct: /sys/kernel/debug/gpio shows gpio92 high -> low on close and
low -> high on open.

Interrupt count test:

  130: 20 0 0 0 0 0 0 0 msmgpio 92 Edge lid

  start=19, after closing lid=19, after opening lid=20

evtest on the gpio-keys device shows no SW_LID events at all, because
gpio-keys only ever sees the "open" state.

This matches the PDC dual-edge issue previously fixed for sc7180,
sdm845, qcs615 and (recently) sc8180x by setting
.wakeirq_dual_edge_errata = true. pinctrl-x1e80100.c does not seem
to set it. Is the X1 PDC also missing dual-edge support, and should
the errata flag be enabled for x1e80100/x1p42100?

I am happy to test patches and provide a Tested-by.

Fedora bug: https://bugzilla.redhat.com/show_bug.cgi?id=2576167

Thanks,
Varenikum
