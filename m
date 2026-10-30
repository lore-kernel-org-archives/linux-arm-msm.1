Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342619;
	b=Y+BEgBVK3UTz/TW7ZSM9p7O1siUtEL0JH3QEQd5AeFt/mnQNjZca3tdiKsgK4Uz6JYeJ
	 61/D9ZW7P3pNrUEoh9zbtoHOFm0yL6QhfcTkfPmQN2n4JxQog/UqNuls+5WcqjfqScjC+
	 R77RiuUbHkyPMpNXjhTN8QwpnHrMiyxNAdJ+h0sL13Zl9VE3npbxP0wcKhUedcSKpS1HQ
	 jQBBUOgKLt8DxMIbVibbkxhK8krScHP9bnSppV11l0z9NaLcWTMhjOZtghuQ6V0nWGpvX
	 E6KwNWb/kF9g7IjqH8kzFRgDMkbdpAWKXd8kjtXJwFiRqUZA0ijssEHiQKOKJpScZvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wfLLxpJEhdYyeLU8/2J/rixOwuZVAkQRAF29JFAwSZo=;
	b=IZhdX/lDV/48myWk8/wjLKpa+anyijkh0zOjZHYS7D81rXdL7k/yF1TpKiTidZQAsrxV
	 XHk+wFmJMPLvWOmZYK17Iib9BD3zA9wRcgbUp+Pk3IPo4BE3ufaO8Huhg0g4ck+ZZoytW
	 59Fq/spuDBbz0A97jC2gVBxuUfU4as3Z0YJBQ6mPyKHH38AbxDDKpi2XIWwoZWLBfsjEn
	 jtxFE9D+c8yWs3klBqs7z5o8/wlD/OrVDRM4MsCswrOCBLHxd6V3zdZiOkbAKIuPMeKj6
	 zBLUgYezTdhm9Ve2WsjO5DtzdjWeAgUYt3FcRl4P3T0n86NxWrt9KyVsOP8mbquy9TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVZKgSWg;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF30606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF30606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVZKgSWg
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so460871c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342618; x=1793947418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfLLxpJEhdYyeLU8/2J/rixOwuZVAkQRAF29JFAwSZo=;
        b=WVZKgSWg29WUI4vvLEcCsTVBsKeM/SKWh+D8nQjXB2/qhKd5FQj7kn7ptcVN5LqJmv
         NvOObdvjoZ2agwcpCjw129XSb49A1yybCOVw0FXujKK3hVro4iC/5uI8hvHox2nFGDEI
         rbqeEL1oCOyQnb37nAUknWVsFp8XoN7RPGeYUGP8tbMea6ixvvsM6u32JV7rs1ElK2pU
         vyneib3CIKiRpdx/L9U5yenyst0Bh4QEwGil6CobmxOUWwhkFP1+Twy3+3IcixRQNvsG
         0SRjG8s0BHgpUqo//jVm1Lh7DrgDQJdjsMHL1ec0Yckdfax8z8mJPlqsK6aFTIoy3fSr
         4ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342618; x=1793947418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfLLxpJEhdYyeLU8/2J/rixOwuZVAkQRAF29JFAwSZo=;
        b=NJwpMl9UiKRExXICbkAdm+1BANo7HaauCyyL6iIpoYYammW9+beLujz4I+YOlBRmF3
         RsBNukphX0VLWG5HPmdsgTa6f+ikew2xZYCk7r4dxdixHcA4jP63baFEduU9zD5tDkTD
         lWJeRPPVBPe4NWvmHfs6yZy+l2bhDzhH40Vivw3B18b0CPejFo3YARSHJLSJ5oDI1pPW
         czyxGwISS2uR6XVUzxGjkotzeFljP0q+mLH13Fq40Nev2GEzjBAyNJWTLES1/7my/mur
         D3aMPCOAR7tSYXnhAhkX3NpHOPLYjowhb+YdEOB2ZKHL3SGvMC2us9ztUcgUdRZCwqPU
         v63Q==
X-Gm-Message-State: AFq9FYKOhFNbWC93X0Yitz1i2lMRBxSrwXbzN3CXdFoKgS0Ji30TuMsp
	XA5P8I9TNOOmSiVRmMDAVfoYeXgtwTkAyXyGcAUJTHZOdLwWMFNK+wwFgFH1WTMaiqQ=
X-Gm-Gg: AYBFou19koRVFpG5LAKHNq5nIHDNRm9izZP9ZRIA+66vQxNIm2hKxAIeKtQuzzYHfNO
	XhHSreK/Q5h7cB1tkQ3G48x4hHVwLryZnXbB/lFSNsRjL2eRoZkbo3jx7slhBHD28ch2jaJvH80
	Dmlda9aewVcONu1kUyVdvTTDXwRBEIQFmGEsM1O25bCDlDnZ/R60oXdzySj58arc7MFI8EhHJt7
	zvouZHpD4yqw4eBd3FlX7KBEQXoT/snHTfQmyWCUdtsQL4EGJLvYrCo5vvgrzQHjwAfG2DJzQgB
	S9UMK3R1CFfREKnNaTJwlFfSKEpif1LFsi8Jd/qk462vq3OUzQKhthVdT0J+EiRQZu06Y5j/XPc
	WbVnMyIVMULp8k+kFymHeIIekcOn/h9555VRUt61MJoB3K0NQsqBBnfk6bv/x83TYHnOFZlJrZU
	vfv1ER4wMi8lKu+RaQoeqX5BfYg7nPMmRnyTouTkt11w+Qjfu3lP8WuNYaARqgeP4ix19qZOpZ4
	x8W5ZlWmm5Zd8BE/zwjNA3lQYe6h2qKRypZ0TKr64devHYYXmnVa9CYat96YImU85cBmXnnbuJF
	Hj9d7YXQx3zySr3Z9dWjUEFP2dx6dVr9/K/FVnksoP8Tu96By0bO80FDew==
X-Received: by 2002:a05:701b:4189:20b0:182:6c6c:d876 with SMTP id a92af1059eb24-1ac5cb1a331mr2023312c88.8.1793342617792;
        Thu, 29 Oct 2026 23:43:37 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm4173902c88.23.2026.10.29.23.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:43:37 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v6 0/3] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Fri, 30 Oct 2026 14:41:46 +0800
Message-ID: <20261030064149.14736-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next (next-20261027: 151a134a) / Ubuntu 26.04 LTS.

Tested and working devices:
 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display (with audio)
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU
 - Audio: speaker (partial), mic, headphone.

Known issues:
- Four internal speakers are detected, but only three work. I use Ratizux's tplg [3] and
  alsa configuration [4] on my desktop. I also use amixer & speaker-test to verify them.
- The system fails to resume after closing and reopening the lid, but resumes successfully
  when suspended using systemctl suspend.
- EL2-mode:
  - EL2-mode can only work with kernel parameter: "iommu.passthrough=1".
  - Audio and Battery status are broken under EL2 mode.
  - Bluetooth is broken under EL2 mode.

Also, some notes about eusb*_repeater and EC; hopefully, this can help others understand
why I configured these nodes this way:
- eusb*_repeater conflict between the DSDT and my testing:
  By using `i2ctransfer` to sequentially set the modes of 'eusb3/5/6_repeater', I can
  observe the corresponding connection or disconnection state changes for the
  right-side USB-A port ('usb_mp_hsphy0'), the left-side USB-A port ('usb_mp_hsphy1'),
  and the webcam ('usb_2'). Using `gpioset`, it can be verified that 'eusb6_repeater'
  is affected by tlmm's GPIO 184, while setting GPIO 6/7 has no effect. And webcam
  can be shut down and reset by toggling GPIO 184. The DSDT places GPIO 6/184 as a
  'ResourceTemplate' under 'USB3'(usb_mp), GPIO 7 under USB4(usb_2), and webcam is
  under USB4. This conflicts with my testing. So, I didn't add the unverified GPIO,
  and the connection between USB and repeater follows my testing rather than DSDT.
- There is an EC device under i2c5 at address 0x76, with driver probe failed.
  But using i2ctransfer I can observe some data changes related to fan.
  The EC driver appears to require additional work, and it couldn't be included in
  this patch. So, I didn't add that node.

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git
[3] https://github.com/Ratizux/audioreach-topology/
[4] https://github.com/Ratizux/alsa-ucm-conf

---
Changelog:

V6:
- Add 'output-low' to 'edp_bl_pwm' and remove the descending brightness levels. (Sashiko)
- Add panel and backlight control GPIOs to fix corrupted display after resume.
- Correct the pwm period.
- Add SFA14-11 to QSEECOM allowlist. (Jianfeng Liu)

V5:
- Rebase to next-20261021, pick up the following upstream changes:
    arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved (099cd579).
    arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies (d9d07e23).
    arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies (4458dcd3).
- Add 'eusb*_repeater'. (Jianfeng Liu)
- Add 'displayport-2-dai-link'. (Jianfeng Liu)
- Remove 'usb_1_ss1' and 'mdss_dp1'. (Jianfeng Liu)
- Remove unused 'audio-routing'. (Jianfeng Liu)
- Remove 'kypd_vol_up_n'. (Jianfeng Liu)
- Link to V5: https://lore.kernel.org/linux-devicetree/20261023180513.36417-1-kaipeng94@gmail.com/

V4:
- Add -el2-dtbs. (Sashiko)
- The "audio-routing" of "sound" is from x1-crd.dtsi, audio doesn't totally work,
  and I didn't see any improvements when I followed Sashiko's advice,
  so I just kept it the same as x1-crd.dtsi. (Sashiko)
- Tested in EL2 mode:
  Successfully boots with the kernel parameter: "iommu.passthrough=1",
  The above features work as in EL1 mode except battery status.
- Fix missing newline before "wsa-dai-link". (Val Packett)
- Link to V4: https://lore.kernel.org/linux-devicetree/20261006085425.40450-1-kaipeng94@gmail.com/

V3:
- Re-sort *-link and its sub-nodes. (Konrad Dybcio)
- Keep a '\n' before 'status'. (Konrad Dybcio)
- Remove 'output-low' from wcd_default. (Konrad Dybcio)
- Link to V3: https://lore.kernel.org/linux-devicetree/20260729064538.19564-1-kaipeng94@gmail.com/

V2:
- Fix Makefile entry ordering. (Krzysztof Kozlowski)
- Use readable compatible string. (Krzysztof Kozlowski)
- Fix sound card model name for this device. (Krzysztof Kozlowski & Konrad Dybcio)
- Re-sort nodes, pinctrl-*. (Krzysztof Kozlowski & Konrad Dybcio)
- Remove those regulators without consumer and lack of a required value in DSDT. (Konrad Dybcio)
- Remove ADSP/CDSP fastrpc memory. (Konrad Dybcio)
- Add iris firmware path. (Konrad Dybcio)
- Delete usb_1_ss1_qmpphy/usb_1_ss2_qmpphy properties of Type-C. (Sashiko)
- Delete usb_1_ss2_hsphy. (Sashiko)
- Remove unused pmic-glink orientation-gpio. (Sashiko)
- Remove node related to WWAN.

- The Webcam is a USB device, can be probed without any additional
  node. (Sashiko)
- Using reset-gpios in swr* seems common in X1E devices, like Lenovo
  Yoga Slim7x, ThinkPad t14s and Microsoft Romulus.
  Because speakers do not completely work and I could not see any
  effect of changing it, just retain it. (Sashiko)
- Also, the HDMI audio is the same reason as above. (Sashiko)
- Link to V2: https://lore.kernel.org/linux-devicetree/20260721082410.18275-1-kaipeng94@gmail.com/

V1:
- Link to V1: https://lore.kernel.org/linux-devicetree/20260702063156.35169-1-kaipeng94@gmail.com/

Kaipeng Zeng (3):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)
  firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1565 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1569 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
-- 
2.53.0

