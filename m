Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD82486406
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164412; cv=pass; b=BpXXR0gsJu0ODA41/WumSFUnx8JYpKV77/y9inZUfByuBfrPMec9byGIrwArGB70Dgxqm5xDAjbKwgl5mnX/+4MHeXPmGaZu/xkMhQWxSPQ3ZoNKR1djlNbpq68aR+tESC/qmXmS06s+rhUDQMpeb5id7v0FfdGFclinZ/GuRz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164412; c=relaxed/simple;
	bh=uhwITbsuBN1QyKKZ8uqQq/5/QXmUcyaikOFf8kDkoJc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VUFFc8T0ULL/Scz85j/BLG5OvvqsCqq6qvBSNQAbHXT5YyAynIYDHd1udycqLehu0dS9c2JcaTgLwS5hlZ+aBVZkh9LEH7oH05wbZKZ9M/D9SCl6uUtFWjxPq+WGWJcF4s+BWNjLGeeGnlPtPNJTiwL+YWhraloGT1CxJqL75J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=est.una.ac.cr; spf=pass smtp.mailfrom=est.una.ac.cr; dkim=pass (1024-bit key) header.d=est.una.ac.cr header.i=@est.una.ac.cr header.b=bP6A/RXV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=est.una.ac.cr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.una.ac.cr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=est.una.ac.cr header.i=@est.una.ac.cr header.b="bP6A/RXV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c25b661d37dso232050866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789164408; cv=none;
        d=google.com; s=arc-20260327;
        b=CRJyc8L5WteJ6I+TbF6eZsPMyjxorPYQ08YtOj7gjrk78JwGbyn9Ot3NNrm1NtwSLt
         obPVZ3qmJ1ZHMgrNcjLmskt0GlNcnOP5RvvbrS9yFgu9AimEi4bNjKa1lGu4B5hA4/oh
         mtoy5/M6y6ZXDXXBhEpsL8nLWE5StAyDvGKqgYqosa4WkcgZlBy9QKxoBZlFatyAoGda
         9oqw9o5vBaBkt/RU9noCrvxI6t4HKb4ldsv+JaDpG4Vy/7SqKnLsCeB6YPk6cjddDL3r
         Xob0HqHnZVFVtchEwus34HfDU/Lnr0NzTENXm4xxt3QBJIsrOw0gfCJr/uy/a7RAawdf
         TZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wQjMKqS7oeVmIMa2lPbwdzd52T317NKfkckf6Z3yXCU=;
        fh=CKEbU6IoLN2kOfpAEEoYKzmWTQ6uEAwjb1lfPmt27PQ=;
        b=SdT0Kqo5wLFLGU5FnKKShksDMtAkkvsQdvCy8FMnckpNEq6swiwa6LMHPyd8mL6NJX
         Qo01IsVGwcEmA1s1r+ypm5A3he6qfV4rq+Y/ksnjjHWCNslh434IYfFPJssmal1pigBl
         YXgzYBGinyI4PbL/ZgfBCA/32JPvObJTmkDsfmxJaPKJgJErCrwiuMi5P3NG/1R0Ylhh
         ywbhkwHVk331mjwUueSnlqsozVs6jPbAsJcn5feLzETSSDdxjUffIPusiuEi2KXY4uYB
         IH2GGBydnoYxEGEoCH9UnoeUfN0vU1B485gHthTKvflgUbsQYk8+TCRzETjWZOWSgDEX
         eudQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=est.una.ac.cr; s=google; t=1789164408; x=1789769208; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQjMKqS7oeVmIMa2lPbwdzd52T317NKfkckf6Z3yXCU=;
        b=bP6A/RXVpOY2dbDIzqUl1gC7qnWBzja7BOFuXJhtdFA5fxFtHLHrvIwb4e+9VPb4WE
         TBS/wh9spDmKDW5VjpfMiLIQY2rBAFWHZ7U692HjkMsLikDKH04mf+CxEq9zNlajZXK+
         QQuPrdBbxHGx4RfgxRBmtVBj/uP3v3TVhQctg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164408; x=1789769208;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wQjMKqS7oeVmIMa2lPbwdzd52T317NKfkckf6Z3yXCU=;
        b=U8jQ74Uu4Pte5S49o8AJH3COtcz60+6WO3+sIvKeOiJQfYr5Iosjpi8GFLU3RyfRa+
         zmHbTmE6KlOKrDeS50eXuO93RKLKys9PO4pbz4X494dWHJpJMoYVKufaBN20yqFhgXLS
         kSqzPufnQRrcWJqAla03++J+gvSo1oTZpeLqjy1kFNt6fzKY6zZFwxInaccff58QjGW7
         4LIZHVKYcT2g9+eoebsdn0Xy6UZomtuPqrDQZBwuIKkBWFs2qfV+7baZ9qppaTbZ3xZP
         bRGcQADHTxnN5OWIv8FHgm9Q70Td3DWk589OBzph/Cdj5CjX4faIR9HWaGIurpCqFpQk
         k27Q==
X-Gm-Message-State: AFuF++kYE0f/zifOQOs9oROYam+6/tHfuyFBFUNu1oo619KQlSq0DZXV
	ED2HF8x6qxVTtf5JsU/40kTBBc1sj9XqnKaNwlXkYpsZBjQv9gIAfDRxPhsN6wRH0cIcL1kkHP7
	ZvT5nesQtO9SbZ8Gz1iafvWMuCePwsdGMEqST9WbTQhLQzbdZdA+uZFdGCA==
X-Gm-Gg: AYBFou3hL3PoKa+aIlG3w5KrX1OuI7lOUTQV4kE+r2ei+Idc0zgi5fxzppGoL8JEWCx
	3TRca1oEhayCaIEfKobtDk3C0o+aggOgdGNUMV2WaTfMYrhC9vesFob7Rg317P/fqFdQ4YDoKNx
	A5k+CNB5/PPvEXJaYIRpleDNEb7X1Azpze0REpTJgLqDz3le59IXZhpXzuWuBMor0Utzwtjuxwt
	q7cZAFBmYq88seRIEymMI5Qg5PISbQiDJUMkCGYuzATMObKW3qZE2veealL/feomxDeO5fv6ked
	Fkpmn2jQOOB+Pcoxz27KQ0JGbwGybwCrb8RfCYjMZRT8QhSzxeBtlNVVrdubaae5rAOmf59Wwdc
	GfSW6++Xr/4xgM9Smfsgn
X-Received: by 2002:a17:907:944d:b0:c16:4e5:944a with SMTP id
 a640c23a62f3a-c29666725d4mr279453966b.21.1789164408354; Fri, 11 Sep 2026
 15:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Avalon Vargas Centeno <avalon.vargas.centeno@est.una.ac.cr>
Date: Fri, 11 Sep 2026 16:06:37 -0600
X-Gm-Features: AcwNN1U_2tuG8X_alxZ80QmSpMmOxpgoLvfHOPditQ4IaFjBhDDT2dZzYtdfpE0
Message-ID: <CAGXpr56LDenxF5hM-_gdc7suckR9P7sgC8vY4T7dcHtLK0OwVA@mail.gmail.com>
Subject: [RFC] arm64: dts: qcom: Dell Inspiron 7441 LXST2021 touchscreen at 0x09
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

My Dell Inspiron 14 Plus 7441 has an LXST2021 touchscreen that works in
Windows and BIOS but it was not detected with the Linux Inspiron
device tree found upstream. After working on it i found that
changing the touchscreen address from 0x10 to 0x09 fixes the
touchscreen on this unit.

Hardware/software:
- Dell Inspiron 14 Plus 7441, Snapdragon X Elite, BIOS 2.16.0
- AUO B140QAX01.H internal panel (AUO0BA4)
- NixOS, aarch64 Linux 7.2.4
- Windows ACPI ID: LXST2021
- Working Linux HID ID: 29BD:1103, I2C device 0-0009

The Inspiron DTS declares touchscreen@10, reg = <0x10>. A targeted reprobe
on the original configuration logged:

  i2c_hid_of 0-0010: nothing at this address: -6

No touchscreen input device was created. The corresponding LXST2021 node
in x1e80100-dell-latitude-7455.dts instead uses address 0x09, with the same
I2C8 controller, descriptor address 1, GPIO51 level-low IRQ and ts0_default
pinctrl state.

I tested a local device-tree overlay disabling touchscreen@10 and adding
touchscreen@9 with that upstream Latitude configuration. Linux now reports:

  hid-multitouch 0018:29BD:1103.0003: input,hidraw2: I2C HID v1.00
Device [hid-over-i2c 29BD:1103] on 0-0009

Touch interaction works after reboot. The full NixOS configuration built
successfully and the compiled DTB was inspected. Touch operation after
suspend/resume has also been tested successfully.
Other Inspiron touchscreen variants have not been tested. This was tested on
7.2.4 with an overlay, not by building the proposed diff on current mainline.

The successful address fix uses the original upstream ts0_default state;
no reset-pin change or new HID driver is needed for this result.

Would replacing the Inspiron's 0x10 node with the existing LXST2021 setup
be appropriate, or are there known Inspiron variants that genuinely use
0x10 and need to remain supported? The original board submission described
touch as working, so I would like to confirm variant handling before
submitting this as an unconditional fix.

The minimal proposed change against the currently inspected upstream file
is below. My tested overlay is equivalent for the enabled touchscreen node.

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
@@ -25,9 +25,10 @@
 };

 &i2c8 {
- touchscreen@10 {
+ /* LXST2021 */
+ touchscreen@9 {
  compatible = "hid-over-i2c";
- reg = <0x10>;
+ reg = <0x09>;

  hid-descr-addr = <0x1>;
  interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
