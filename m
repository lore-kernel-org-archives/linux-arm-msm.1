Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974573;
	b=TyisNXWZuPz1QLVcSGFo/iluXh21ZkS6mEbHprreLJvfr17kiJ2xQzehbcQWv7rjYD0c
	 PIp2AAGVdLCiqiQRW9YZsCYOvHzj4gn/kBH6Du9gNEjBqHCUy3Gwl+bD7SnGY3tAko2ZF
	 EPPy0DHCokgEVNAC1y7EpixJioxt2csucKf6uJD0xH3VzSiMnvlEjTDoXDCGHN3V8AK5J
	 wiGOjyENucDOps2RXpzDn4pxdOchM1Fq4l6xZniAmHsNqPkR59vYugzDkZnI0QczUlZf0
	 qN0/D2AMv7VvNaavZpj2FFFGPCnK2bXqbULMnEkd1C+7mftmbq2fNS1bv0Wro0Iwgog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DPqAuBS4T4u4zMA5n0n3Wuyb1m4HV99Rxc7qJYm5Ofk=;
	b=wo4RqaCK0W03iLA9J8z5kCfPkb0uWg4Ja1u4R0fQlG5p/5C7/E1ME1qwuTxJOnHYHtnH
	 uW1PEi4Mto08xdz/TJPQ46h0EES6FOuk+yUnM0NJOJU+4OiRf+ipJZHPxMRikSn+6ohXr
	 ELyGTYHv+0B2QR5eJeANUWP0O5M1GgZ8X4ZufgpdVBoXI7gSb6cNCUgA0U1XQ9XbPGI2B
	 nZ2OipjLDS6DurFqDMCPyvGiOrwdZqDrkSkrLH5glyN5QrrsTTy4CJzhc9RD61XQEVC4j
	 1MEYmXAP5N6wlmelk8KKcgptHwl8s8J8ezmqMixFAcmaUVnfazE96Ss/erlZQMOLlew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YV68Sg4Z;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B062606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 14:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B062606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YV68Sg4Z
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso261878a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974572; x=1794579372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPqAuBS4T4u4zMA5n0n3Wuyb1m4HV99Rxc7qJYm5Ofk=;
        b=YV68Sg4ZigcQlikDz3E+vtM7SUoJ5a4xGSQq4imf9/vqosq5Z/Hs0hA/JuwqoBkGJS
         FdS99OOfpBVDu69p9yOotk3pexEVK+H8JKlPLxvAWr51JUQlR7mIeZIj3lCL2v5AivUw
         w94puA56j6QszR37az4Z7r7bR0vP0O4WiVlGn5x6IxyiCojDpt3RU8oFEJ0cPCfmTeb6
         i3NOTJHcgNrkVO6zhJ4j7/54jUgNCMOm0HjpKuUlsCziLgGrGX9Yf46UBLlt4uwySWJE
         YPMyykDBbLNIuF5V7UtOv2WxFXVvZOi+AVISlwNgK1EnOfz3bnRn1NH1cDYiWbP4DoMX
         I9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974572; x=1794579372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPqAuBS4T4u4zMA5n0n3Wuyb1m4HV99Rxc7qJYm5Ofk=;
        b=kWsR5xtM72G/loEj3SHxK2LFd5DE/YJ8HKyCM7yIHLKqOJD+vGB+tVz2lZ+jVcFZes
         ffBWfEDthl5CkSCBYVpIu80iLGEQpxG6R7NywYhlo+QDZD+TQ+cHzZLExFMMJhwICq9P
         NHWaW4tC7FdMoBUGW4a5ki3QVAlAH3C66B6mtQfv+Aopd5WeBOdSjOlDz+L9yul9PhO1
         zoLH4hdCKbr4D4kIpcXms7AhVlFdCG29Y5R20CZgo0JEXKxB5Z3UyUf39Jol/iNLkTfl
         kKeP4Yp1Czgm2m3W/KBtYdb9i9Dverfv3Qzr9IMo2qAL4PkibKG4D5gpm45ZcfN6oGAR
         CxaA==
X-Forwarded-Encrypted: i=1; AL+hErGjt8e2YdJd5nGNfCvgxIHKegP3VAre6Ft+9DyAvoTvbW5KPs8l3RNHvN0tg/trdL7q7MnOmVFX2e2M7zlE@vger.kernel.org
X-Gm-Message-State: APuU4Z+ugwyFjakSOzQEjRjtAZYqYjOIJ9vXY7o47Yf55vWdn3VNWGGA
	vuq1ATrdGVUST62V8zo2u9HJsomTGFEBFvazzGFqU80J0/NWK/74KD2Z
X-Gm-Gg: AYBFou1/rNoUBo1A1wrn9YKkEMjMuVq/55mMQ+q1UZmIIIjs+JsljyNFzltYqG5mDR+
	UsWlL89/Vvd0/H6JR1d2b6cilU100+CXI497wACyRauF5u6EbDpcamcAAmM7wMVx835gzqrCGL0
	ISg7DyzSkEPgjBNBIjKx+DrftrmRofFxeIpQTIqVv/PYcJ5/J/i8lt+rIdjnJ4TDQOGm1ilJE/J
	95yXtMtIpxIVVR0UXFFfZV0Pvz5XADYl8nTX5cZyioXUlb/Nf64+G5aEUfL0nbY0125SVz72405
	rYeQJ2CRemwyloZCwdf1+oJy+KB9oIyAyKChJ2Sjp5e/aCAkXZszW6SaUXt/+TInnC/OA+BQpQz
	poCL87HVrLyIY5cH6skfgXCCkzPuP/m5OoA3ZBc6zYiACJSrW2pUCthJ6+MrhhgP2wZPKkyU66J
	AfUAP7PVa5W1vxFfI0JHtZM+m6yXq/jejOO1F+LTUEAE65TLK85zfQtUGU3zv1CliFOvVXtR83p
	K3NGVcL/VNhdIjn7z91qmzLDGz20ah2XyoxeA+1tgc3cxVSO07sOruZhEwVha4XnO2lrv5TeMKV
	aVa0I09cpiVoaMgWI8a9+yyF08Ds34v9s+NwRgkhJy+iYyitEM20y5+YELvQmxjlt/xfv/XnHOc
	eRtXDYgZrOMdX5sro0EG3Ah0XuFJZgyM+wPrX0OZe
X-Received: by 2002:a17:90b:554d:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b0db5edb73mr2783616a91.7.1793974572380;
        Fri, 06 Nov 2026 06:16:12 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm8057305a91.3.2026.11.06.06.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:16:10 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Slark Xiao <slark_xiao@163.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: bus: mhi: host: pci_generic: DW5930e does not come back from D3cold on a Latitude 9420
Date: Fri,  6 Nov 2026 23:16:05 +0900
Message-ID: <20261106141605.2918662-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Mani,

On a Dell Latitude 9420, the Foxconn DW5930e (105b:e0b0, firmware
T99W175.F0.1.0.0.9.DF.015) fails every runtime resume from D3cold. I
would like to ask which way you want it fixed before I send anything.

The modem sits under root port 00:1c.4. The modem's _PR0 and _PR3 and
the root port's _PR0 all use the same ACPI power resource
(\_SB.PC00.RP05.PXP_). When the modem runtime suspends, it goes to
D3cold. On 7.4-rc1 the first resume after boot gives this, and the
modem is gone until reboot:

[   24.704019] mhi-pci-generic 0000:a5:00.0: Unable to change power state from D3cold to D0, device inaccessible
[   24.706039] mhi-pci-generic 0000:a5:00.0: Unable to change power state from D3cold to D0, device inaccessible
[   24.706667] mhi mhi0: Resuming from non M3 state (SYS ERROR)
[   24.707418] mhi-pci-generic 0000:a5:00.0: failed to resume device: -22
[   24.707731] mhi-pci-generic 0000:a5:00.0: device recovery started
[   24.728030] mhi-pci-generic 0000:a5:00.0: Unable to change power state from D3cold to D0, device inaccessible
[   24.730020] mhi-pci-generic 0000:a5:00.0: reset
[   26.742093] pcieport 0000:00:1c.4: unlocked secondary bus reset via: pci_reset_bus_function+0x1a9/0x1d0
[   26.885444] mhi mhi0: Requested to power ON
[   26.885794] mhi mhi0: Power on setup success
[   47.157078] mhi-pci-generic 0000:a5:00.0: failed to power up MHI controller

On 7.3-rc7, Ubuntu's 7.0 and a mainline 6.15.11, the reset brings it
back to mission mode instead. The mhi_pci_status_cb() then calls
pm_runtime_allow(), the modem runtime suspends to D3cold again, and the
same failure repeats every 58 seconds (7.3-rc7) or 79 seconds (7.0,
6.15.11). After 3 to 20 rounds the reset fails with "Failed to reset
MHI due to syserr state" and the modem is gone. On 7.0, and in the
first rounds on 6.15.11, the resume fails with "Did not enter M0
state, MHI state: M3, PM state: M3->M0" and -5 instead of -22. These
kernels also log DMAR write faults from a5:00.0 in every round. 7.4-rc1
logged none.

Setting d3cold_allowed=0 on the modem from boot stops all of this.
There are no errors, runtime suspend to D3hot works, and s2idle works.
But then 00:1c.4 stays in D0, and the PCH never reaches S0ix (SLP_S0
residency 0, SPB not power gated). So disabling D3cold looks like the
wrong fix on this machine.

Is this modem expected to resume from D3cold with M3 -> M0 at all? If
not, should the driver treat a resume from D3cold as a cold start
instead of going through the recovery? Or does this look like a
platform problem with how PXP_ is turned back on, in which case I will
take it to the PCI and ACPI side.

I can test patches on this machine and send the full logs.

I found and checked this with Claude Code, on x86_64.

Best regards,
HyeongJun An
