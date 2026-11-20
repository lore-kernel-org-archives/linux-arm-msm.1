Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167562;
	b=pWDPIffHRNWdgjb/WU0uNyPOYfRSxKSE/3WeJXHb9i69pNSJLGcjiuGnXLJw5G8SfH32
	 98McziwplppI1YhY6+USVAZvyuWJ788+C7n3F+vUlt4c+Pi4ZQ+/HFXQJ3jBkEv7iArpK
	 oK9TWwK48BOO5i/DgZHgej6YYcHQP+U6uTcPKqPa2kD5FhZPYY1sc0TWezN57o3oV7m1l
	 A5GRC67YGZpCIV4AItHTf5Ocok/KRK/2LsnWgTXkF2EhGHaW7/uHqyTFOfzjIeswucfCe
	 Uralxf46mTaJHBpXX54iBRleQymvVRp2EiU6sRVZU1UDiO3xs18bEBJ0+DgxP+LMe8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
	b=EegcSBm5xMz4nR4VEgn393Qr5Wbew83FeURZOMoROszIQVYQcRyPlL9fHKSAUKLRuCx6
	 Zd1z93FQGSNfkDTVOalOlHfx0ceP3LF4FE/cD5DTm3UjI5OvnnukXbf2W/WfbvGOt5iW5
	 VoE+Q6SmNVFDOsiUmXHTW6+q00PqbFEKIfMlTVrX2oDsTkZRQp731eU1UPuukr4dCIdZm
	 Fpu2uSZpGXDGHuLKvbbKPiRkwVZFJoM8HrrUT2xxcIvmjtwZjt/jVQNgT0A4KbsOXYmfQ
	 Is9Gv4M4ODgpGNkQLae/COzKxdka20t/d1wGPqgoRgt5VIJuOt792brJ32ALGML3FIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7bKuNcK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20306606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20306606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7bKuNcK
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-57728d87699so309047b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167561; cv=none;
        d=google.com; s=arc-20260327;
        b=GTBwRHBf8Ba+QuIvZHYZGacNOmrwUzKW8jVqfKHkcrrCITuEkDF4sDKdmqb/Wc2oLO
         3JDhhMp7f2CrRZiY2ACeez8tDUXcjg03kr13Fr+wjUybxVaM7cRZPnC+FbSboLcXDBgP
         cWvtg5f8ronXctyasfT+Jd6fpUh7lF7Rso4ztY8+wjd0KPFuAjBD2EQSngxRb4IK8e5r
         kEsaLxTK3n+LuksUF6uhNR8p76Qf+1W6wDX8ZG3OchZRWwtslxHbtm4Jx0veQh67rn/+
         weW8PG9Sl56YFK8WORTQwicztgqqMeUKKL2yxJjH1EeVCYFdlfFWEOrhhf5VMYz+Y5Qd
         9dQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
        fh=wX15Usow23lYfj0xkUTRlhQff6StfewE5ULNn9aQJsk=;
        b=C9NNcS4VLYe3hdqtpAPMDSSksxdawucXihdlppg0iXT2Jqe/dHrdSRj+ZAKFjmkHp8
         Fnx+WnaCA4D/gA4A5yBSt5XaHOLfEytF2QraayooOqZNDIJNHj/Wk1eM+PC3cfSf8xAu
         dbDrOayByeouROJpLy4lUxvwhhXEZ+ozBwYsOSfft15YyuRxgW3Df2R/lfFIYppKmplA
         Mtl5BIFCKq7M8t1a/Bp68yDnLRj5gVfhQst/DpAIcDf+YsoL8ijtwW8UED8k93GLe5/Y
         fqZTaw+S19BCaM7NOJ8lFM1zQeYmWPR2TL9SImUEDrzAxRkfy3/PLTxyRBNq/FO9OWO/
         4/IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167561; x=1795772361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
        b=U7bKuNcKsonM4dTM4PWzPN53V7izwr60AW+KBokkq0AQoPiRz0lCMsaJJYgsazleMq
         Z2J9yzUzwJlO3cQ4Vau2apkc2t0dYpMsPqz1ntDTCVjG8i4+dbXNVXpFjb4m7BwtYl+t
         ph+7ESEAeQeT/7v//5Hk6OkkWJPKgKW/rznEcaG7K76NtMR6pq03VuMf4OlmhadDzCgW
         YiuSeGcCrPZo4VN9kj1tl1KYMWRiya49hRcimRhu6RH/gShpxy4SPaFm5xBEmgjF13Dg
         POAPGiyLlb42zSwy9iJSfA/iZF18t0MKPqT8dV14NybUctaoEI2zhW3GoY+bVIhI8ZWf
         pe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167561; x=1795772361;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
        b=QHEDnlaH+4YAj8SjHFioOb7MSLo4qAQ27RC9Xelr6aSmiyQBHqnDl6qNTSsUFPTu7F
         4gvfo/RsjNEB9ypIoX0UjQ08HpdbBuPYj/s97P/GpLQYmHXNYjHz0HGH2yQ3mF6MkUzW
         Uj3s4OY8yBwhZl04aAPBVzqlhlTCyWbLWkYkNyFJJenFBLyQzIWq+76iEZyeZ1ypNyH/
         Uf1IYiw0g1Uzcqu3IyoS9lLTqANQB5SeCgZkcf32zDhlAdWvejvVwsc7JVet9R00527h
         /b3OmkxfKhibETDL6XbMlWRL9l2BM2PaZHwBTbRkmi0XBci4yQ7Dpej2WwUKEcgWouaK
         Scsg==
X-Forwarded-Encrypted: i=1; AL+hErEzyMqbpLsO3dNA5uXtqhUL+iVmHjN2mpiqFY0dLcnHWOtH9ZtthB3pjwNFLyNOR2xFHXbvy29nKEwalXd+@vger.kernel.org
X-Gm-Message-State: APuU4Z9+tbwR1EB47FwLg7brTS7eS0zLDXPupuhDeJmOgU+D9coFU30H
	wztruhBdqiU04v48zW9I5YQjqdN5POyo2LpwlEqK5r9N5hS8ATcrQyMHGafLQccgrHr5K1DHwqd
	Sy1kLvG6Ywj/mxG2VISeXgBSuvlxq7Co=
X-Gm-Gg: AYBFou2RpUE/DsfJ0umzRTwo1xTGAOTrLLY4r7/j4E4cHM4wxjuN7X9HDA2Safd0el9
	pYTStd5OFQj6eaSAHj1B8P63dPmEUu6EWhLAFB2VQ6r7wJNPde/qErgw9awHNa5ccTlKcMdEMFW
	27CMdsvYqKO5/oERdMJ5ZLuQArBkBh5MvTP1XHtS4Gsw9CQ/Tv5xyynPND27mTdPdKzXlq3/QsP
	scS3PzmQIAlJqWdosj3efkeOzNcZgZE062CrKxAjYhLERR8J/6YwC5k5HbOCdDv2v05DhAJdNdz
	BDWEzr0whpvpxBSEiLaxbJHEU3pBoRgIPNFFpzS4buJJkfQ8q1Bz+prpmCj7Xv1gj8YIAOcACXd
	3KPzWkQJuv65RserXcuwzIix235NlechNX75heGKS/qqP/u9G2fAuwLqFf+NhjrRy+N2X3hPtjd
	5HwG80DCj2UHZrUoY=
X-Received: by 2002:a05:6808:1908:b0:571:b166:3d76 with SMTP id
 5614622812f47-57a0ab2460amr3343180b6e.29.1795167561090; Fri, 20 Nov 2026
 01:39:21 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: YoungJoon Lee <getfeus@gmail.com>
Date: Fri, 20 Nov 2026 18:39:07 +0900
X-Gm-Features: AclHuK9ltT3zUqHytloj1JW7CdVlxNOQfyl-kfE2Ms_hNbPGLsz0aADkKXJ9yAg
Message-ID: <CA+m4KrAQZeEUL68dwJnVpO_ftJSS1ed86_XgnbW1g=EN=xKRcA@mail.gmail.com>
Subject: [RFC] phy: qcom: qmp-combo: Gaokun3 USB0 xHCI stops responding after
 USB3_ONLY transition
To: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Huawei MateBook E Go (Gaokun3, SC8280XP), I reproduced a USB0
xHCI controller hang after USB 2.0 storage had registered and the
QMP PHY switched from USB3DP to USB3_ONLY. Changing only the HS PHY
PLL supply reference changed the outcome in a time-matched test.

Both runs used the same local 7.3.4-gaokun3-touchtest1-pllmux1 image,
initramfs and command line. The stack is based on Linux 7.3.4 and
the Gaokun project's 7463df37160b device sources. The port was
a600000.usb, with QMP 88eb000.phy and HS PHY 88e5000.phy. Both DTBs
used L9D for QMP vdda-phy and L4D for QMP vdda-pll, and declared
mode-switch on the test QMP. The sole B/C change was vdda-pll-supply
on the HS PHY, from L6D to L9D.

I booted with AC connected and the test device unplugged. I attached
the same Patriot storage device (13fe:5200), Type-C adapter and USB
2.0 extension in the same orientation, without a DP display. First
480 Mbps enumeration was at 600.413 s in B and 602.532 s in C.
Both runs logged the same QMP mode transition.

B (HS PLL on L6D):
  601.750124  SCSI disk registered
  602.372963  QMP switched from USB3DP to USB3_ONLY
  640.995390  xHCI host not responding to stop endpoint command
  640.996749  HC died; cleaning up

The controller reported HC died 39.247 s after disk registration.
The USB device was still absent at the 114.85 s check.

C (HS PLL on L9D): no Stop Endpoint timeout or HC died in this run.
The first connection dropped 88.300 s after disk registration with
the cable still in place. The port started re-enumerating 0.336 s
later. After the disk returned, it stayed attached at 480 Mbps for
90.092 s and completed a 32 KiB direct read. An earlier L6D run with
attachment around 68 s after boot also passed the 90 s/read test.

The L9D use count before attachment was 1 in B and 2 in C. With L9D
shared, the HS PLL and QMP PHY each held one reference. In a separate
instrumented build with L6D assigned to the HS PLL, I captured RPMh
disable/enable requests to L9D (0x41104) during the transition before
the next bulk OUT stopped completing. The matched B/C runs did not
trace RPMh at the transition or measure rail voltage.

The mainline Gaokun DTS already shares L9D and leaves mode-switch
unset on this QMP node. Stock mainline reproduction is untested.
The one-line alignment for the downstream DTS is here:
https://github.com/right-0903/linux-gaokun/pull/9

For the next trace I would like to correlate the L9D RPMh requests
with the last xHCI completion. Is there a QMP or DWC3 status register
you would sample across USB3DP -> USB3_ONLY to distinguish a supply
interruption from a PIPE clock or PCS reset?

Thanks
