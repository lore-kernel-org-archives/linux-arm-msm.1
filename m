Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795721392;
	b=PxZMSVqNjFEHbyDrvXZToIxuMRAQ0SKFY8dVd8CivDipeqCsTcuHfJ3YKY7KAYxZ6EbO
	 1LAhqGa/MmFN1RsueSJS4r4TIDBBQnxm14VgrEoqBzw5g2TGEfrgLDjG59YVsJukUJ9x/
	 0BbOpa5OU4ybhpp9FCEcFKwdPLN56+AFEpSF0Ve+IRfuPrIVaRsYBlc00ot83iYKISMM+
	 lpJitUH1j/6CRwOjEd/6UrCsCLLdSxZIrRBKitHbFNHvGBr7bqyt+6vHYZvy9lLg1TgMG
	 OQn0UWFlSV5/8wKy/syvht5QIpcnlhhXxdKW/baz4G4hq7X6SlhrC19B0NA85HCRxew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
	b=CrsLg43uf7pxNWj/MYlKCLZqin/QCCEIfgqcQX3NdwdbAvdYPK3iLZ7aV7HFq1y+dvJo
	 0s8AGaFI6Zh9BBeLLkCm49CRx5iOMIcKL2x+J9uzXFP9UAoQqOam+8sOODWpJYrvQMtr6
	 xU5isYMaowqwPdS95lgT+RypgayHZE9NtBvEAPHjSYgzzr4tMx+Y3CRqMlQfpoEH/yR0v
	 hIC7FIqfuHVlMFWM0yJ4975BXC3xhNl3vJWUUGmkvxG9RahzEARzeMJ+g3J+wb3Wui5N+
	 A2lXwW4UeF6oP6RjkJq1yROCwarT4jZPDk/tmiAX1wNCd5PdELszmp2j6rz+hRxTwFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNT3AXDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98251606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98251606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNT3AXDh
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso9907003c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795721391; cv=none;
        d=google.com; s=arc-20260327;
        b=g4XPgO2tvX+nL/pAPgE7ZXMpJwA6KJTRLYM4H3JB0BTmz7fnKgaPCBtuKGobXviuED
         cqUJF62qjZwoxOQopDA+3YOFIdQAi2G63GFvdGHnWg/kkDZT6frKwl+bXk0j0zYgzcW9
         ZICzXMcFMCG/atzAac1+7QzMJOhBHaK6yPkVYOMkkSv8D3ipHfCs2jN47/WzaRHz9wGL
         WtxXRwfuHBnuee3/A3o75lEB4yNb7xbNYO+A+xhQH0FEaurX+ZbaZrjk8Z3izswmmC1y
         VK8gGtnB7TIFcfhdJlzaFm0pRTyCruuVGn7cqrduf+txwhP0JGW0N4u+65/anJCkDs+p
         mo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
        fh=Qgt8gjGhrGeqh+dMyVx4+IjDAbll5D7Av+j77ClETJg=;
        b=KbGhvd+NroVOFifYfpLryfXHxmt2ztd5uIxxpiUocWcx/WZ1jz9ZFC/cPS32CpYKox
         DFpfp6d1CbM/r0RiL7QRgVOO543iw395FHxG5tjzDLl1S5gMxCWgiphf6tH3h3VfMRYw
         L+pbQGZXPSb4eO+6MaqNF1EYJOvrIMlNuo0755CVvmdx2BwxjGj2L2eiEgehCIxBf7+y
         NJxaXENgkHcQ9gO4YyLlR0uIr09lB5hdPYc+zBjoKozQcduO4SYuFL0K4WIUxsMcWU11
         ywJFNa9XEBjLNPE1bRnV+F63cxSkpeGEnCtY6LyhpiTjctHuVjxh4UXCahnnvIEP1Y4t
         FLiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721391; x=1796326191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
        b=DNT3AXDhr+/PgmWoOHFhBXQfA565r4uhmCzR+Y45pGz9EtlMCKp8SKC9MsMbPvFYD1
         x7EpkbAe6op1k34NxF8tVXc+8ApreKk1nm8Tc8OWXY993z1YPteatq/gNVLRaMge56wz
         5q4/YQhVLkRB6Zl9xTaR1jjKJFhSx5EBgf0gei9xTp6VckO5AMv4PIVdNFfkOMTjCIM+
         uBRyEv//wgpEvYT4XQq5GfOuoKNchD3clGZrGmZa7CDluNK5ccAKCmQJkLSHmPB04S30
         hW9yojSG4qF2tpH9xax5SjJTFizxVjWXpr306vd7I2KRfYvvhffcr78mPNhnOPUVgGt1
         XFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721391; x=1796326191;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
        b=feskTXvO0b9VZzCiWSdjK0RqE0SOaPrTJ/iuiAhKpuxv7ifc/2BJPkdDPbxPitQia1
         rQlw3QQ7zlKohQ2ebqgKRwYORtoo0G8121bF7ejRW5q9vlQpFswd88vuPrq1KghxLC42
         TDhQwJ7cgP8e3d607VqdN/Kpo7HF8L76CzeL5ynfVCD1HjFQeX6ITCE01e5TPlcsg891
         sgYNlNhcJv7BIGLIsvtR4sLmdljfP+uN/gPPmoZ0zsQLGWNhfcOxrKqSypneQeDJhPwk
         uC4NYwv/VaXrXCwAwgfmGpIiL7JEsRAiJf8QUTbe1OsDoFhIPqjNfLyLqlvwQErWaBcj
         VlDQ==
X-Forwarded-Encrypted: i=1; AL+hErEGGuilWlivbOrWyHE0sMME47oGk88Q81rRKaHiYozKaeoDuKpsPaCjaTjFS7LXegdG/nLqJjH0eh2gRhFk@vger.kernel.org
X-Gm-Message-State: APuU4Z+zQr6SBAHNh/4beOSzq1lXAoZdA3ATEqgKUoJJbLs7YyXvgWDv
	qGo1VhMc9jD17Z/uBIjd0IRfO62lVaFuZONGFuGRU9BAq4nS64j82r60qASYulQWZUWlGO2wOoD
	2H/OF3ciN5Fo/MgNdkUwJ/jytjR+01Ng=
X-Gm-Gg: AZFdTZd3Mu8Lpr2v6wEMu9b7lZEfOvH1TPvhjjbE95qA9zplAOOjA0Ao5UGWtOxlbCu
	T0Dpsh2D4uMf7DB63dILw18cOV/W5seCa4duX02WYsz/wvNjnOVlt8iwCNyrcl15VB6oHqGztNn
	ZakM/cVY7Z1lDv1YpXZEGQA6P4n6Xk7MVdEKhvHy22dMqKT7DlslgWuA1H0cQpWfDoN6VPLYCtR
	dZJ2E49sa+QQu53pZ1l5K6bT0bm/Uuadikk9W650X6vfsbvnECzkG7tHJF23UAORQ+mGo84lCpj
	Q3V7rLB8W+s+ufCKaQfoSAeJ4fGoTXeyoF+blAJElTGlgINqqteqXs/2RCA8FfBpU0XCadP9De8
	H1SPZtTcyPIl8nOnhjmx97gRQHl44tqkocyrokb2q7MpjWvfk7KA6P0iWPUtv4P4f66XR
X-Received: by 2002:a05:701b:4502:10b0:1b5:3616:5968 with SMTP id
 a92af1059eb24-1b556898b59mr22458833c88.14.1795721390498; Thu, 26 Nov 2026
 11:29:50 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Thu, 26 Nov 2026 14:29:38 -0500
X-Gm-Features: Aa3M54o0o2qXZKaoa-MmzOYZbFi-gSbmMr04qjyvfTsxEmzaTFsxa9G6bpc80xE
Message-ID: <CADy1qsYCggH1S=yVEQ44mj0WVr=WimiXLDMk-zyr5KZXVG8SLQ@mail.gmail.com>
Subject: [PATCH] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types on unbind
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000993c3e066132f7e9"

--000000000000993c3e066132f7e9
Content-Type: text/plain; charset="UTF-8"

Hi,

The patch is attached as a file rather than inline, because my mail
client cannot send it inline without wrapping lines and converting
tabs. Apologies for that. The commit message is repeated below for
review.

On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM
high-speed PHY interrupts to a single edge, chosen from the speed of
the attached device. The IRQ mapping outlives the driver, so after an
unbind the mapping keeps that single-edge type.

On the next probe the interrupt is looked up again from the device
tree, which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with
a trigger type mismatch against the existing mapping. Because the wake
interrupts are optional, probe still succeeds, but without the DP/DM
wake handlers, and USB wakeup is lost until the next boot.

The patch records the trigger type of each DP/DM interrupt when it is
requested and restores it from a devres action. The action is
registered after the interrupts, so it runs while the driver still
owns them. Unmapped interrupts, unspecified types and types that
already match are left alone.

Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on
a 7.3 kernel: after unbinding and rebinding a controller the
dp_hs_phy_irq and dm_hs_phy_irq handlers were absent from
/proc/interrupts. With the patch, a runtime suspend and resume
followed by an unbind and rebind kept all three wake handlers, with no
trigger mismatch in the log. The patch is against mainline; it was run
on 7.3 and build-tested on 7.3.6 with W=1, not on mainline itself.

Thanks,
Felipe

--000000000000993c3e066132f7e9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-usb-dwc3-qcom-Restore-DP-DM-wake-IRQ-trigger-types-o.patch"
Content-Disposition: attachment; 
	filename="0001-usb-dwc3-qcom-Restore-DP-DM-wake-IRQ-trigger-types-o.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwxy4zwk0>
X-Attachment-Id: f_mwxy4zwk0

RnJvbSBlYmQ1MDZhODRkM2MyMmIzZmYyNmFhMjY5NjBhNDYzNTE5ZjliMWNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0cm8gPGZlbGlwZS5pbmZh
bnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMTM6NTQ6MDEg
LTA1MDAKU3ViamVjdDogW1BBVENIXSB1c2I6IGR3YzM6IHFjb206IFJlc3RvcmUgRFAvRE0gd2Fr
ZSBJUlEgdHJpZ2dlciB0eXBlcyBvbgogdW5iaW5kCgpPbiBzdXNwZW5kLCBkd2MzX3Fjb21fZW5h
YmxlX3dha2V1cF9pcnEoKSBzZXRzIHRoZSBEUCBhbmQgRE0gaGlnaC1zcGVlZApQSFkgaW50ZXJy
dXB0cyB0byBhIHNpbmdsZSBlZGdlLCBjaG9zZW4gZnJvbSB0aGUgc3BlZWQgb2YgdGhlIGF0dGFj
aGVkCmRldmljZS4gVGhlIElSUSBtYXBwaW5nIG91dGxpdmVzIHRoZSBkcml2ZXIsIHNvIGFmdGVy
IGFuIHVuYmluZCB0aGUKbWFwcGluZyBrZWVwcyB0aGF0IHNpbmdsZS1lZGdlIHR5cGUuCgpPbiB0
aGUgbmV4dCBwcm9iZSB0aGUgaW50ZXJydXB0IGlzIGxvb2tlZCB1cCBhZ2FpbiBmcm9tIHRoZSBk
ZXZpY2UgdHJlZSwKd2hpY2ggZGVzY3JpYmVzIGl0IGFzIElSUV9UWVBFX0VER0VfQk9USC4gVGhl
IGxvb2t1cCBmYWlscyB3aXRoIGEKdHJpZ2dlciB0eXBlIG1pc21hdGNoIGFnYWluc3QgdGhlIGV4
aXN0aW5nIG1hcHBpbmcuIEJlY2F1c2UgdGhlIHdha2UKaW50ZXJydXB0cyBhcmUgb3B0aW9uYWws
IHByb2JlIHN0aWxsIHN1Y2NlZWRzLCBidXQgd2l0aG91dCB0aGUgRFAvRE0Kd2FrZSBoYW5kbGVy
cywgYW5kIFVTQiB3YWtldXAgaXMgbG9zdCB1bnRpbCB0aGUgbmV4dCBib290LgoKUmVjb3JkIHRo
ZSB0cmlnZ2VyIHR5cGUgb2YgZWFjaCBEUC9ETSBpbnRlcnJ1cHQgd2hlbiBpdCBpcyByZXF1ZXN0
ZWQgYW5kCnJlc3RvcmUgaXQgZnJvbSBhIGRldnJlcyBhY3Rpb24uIFRoZSBhY3Rpb24gaXMgcmVn
aXN0ZXJlZCBhZnRlciB0aGUKaW50ZXJydXB0cywgc28gaXQgcnVucyB3aGlsZSB0aGUgZHJpdmVy
IHN0aWxsIG93bnMgdGhlbS4gVW5tYXBwZWQKaW50ZXJydXB0cywgdW5zcGVjaWZpZWQgdHlwZXMg
YW5kIHR5cGVzIHRoYXQgYWxyZWFkeSBtYXRjaCBhcmUgbGVmdAphbG9uZS4KClNlZW4gb24gYSBN
aWNyb3NvZnQgU3VyZmFjZSBMYXB0b3AgNyAoeDFlODAxMDAtbWljcm9zb2Z0LXJvbXVsdXMxNSkg
b24gYQo3LjMga2VybmVsOiBhZnRlciB1bmJpbmRpbmcgYW5kIHJlYmluZGluZyBhIGNvbnRyb2xs
ZXIgdGhlIGRwX2hzX3BoeV9pcnEKYW5kIGRtX2hzX3BoeV9pcnEgaGFuZGxlcnMgd2VyZSBhYnNl
bnQgZnJvbSAvcHJvYy9pbnRlcnJ1cHRzLiBXaXRoIHRoaXMKY2hhbmdlIHRoZXkgcmV0dXJuIG9u
IGV2ZXJ5IHJlYmluZC4KCkFzc2lzdGVkLWJ5OiBPcGVuQUkgQ29kZXgKQXNzaXN0ZWQtYnk6IENs
YXVkZSBGYWJsZSA1LjIKU2lnbmVkLW9mZi1ieTogRmVsaXBlIEluZmFudGUgZGUgQ2FzdHJvIDxm
ZWxpcGUuaW5mYW50ZS5kZS5jYXN0cm9AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1xY29tLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1x
Y29tLmMKaW5kZXggYTI2MDg0MS4uMzM5MmE1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvZHdj
My9kd2MzLXFjb20uYworKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jCkBAIC02NSw2
ICs2NSw4IEBAIHN0cnVjdCBkd2MzX3Fjb21fcG9ydCB7CiAJaW50CQkJZHBfaHNfcGh5X2lycTsK
IAlpbnQJCQlkbV9oc19waHlfaXJxOwogCWludAkJCXNzX3BoeV9pcnE7CisJdW5zaWduZWQgaW50
CQlkcF9oc19pcnFfdHlwZTsKKwl1bnNpZ25lZCBpbnQJCWRtX2hzX2lycV90eXBlOwogCWVudW0g
dXNiX2RldmljZV9zcGVlZAl1c2IyX3NwZWVkOwogfTsKIApAQCAtNDczLDYgKzQ3NSw3IEBAIHN0
YXRpYyBpbnQgZHdjM19xY29tX3NldHVwX3BvcnRfaXJxKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20s
CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCQlxY29tLT5wb3J0c1twb3J0X2luZGV4XS5k
cF9oc19waHlfaXJxID0gaXJxOworCQlxY29tLT5wb3J0c1twb3J0X2luZGV4XS5kcF9oc19pcnFf
dHlwZSA9IGlycV9nZXRfdHJpZ2dlcl90eXBlKGlycSk7CiAJfQogCiAJaWYgKGlzX211bHRpcG9y
dCkKQEAgLTQ4OCw2ICs0OTEsNyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9wb3J0X2ly
cShzdHJ1Y3QgZHdjM19xY29tICpxY29tLAogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAkJ
cWNvbS0+cG9ydHNbcG9ydF9pbmRleF0uZG1faHNfcGh5X2lycSA9IGlycTsKKwkJcWNvbS0+cG9y
dHNbcG9ydF9pbmRleF0uZG1faHNfaXJxX3R5cGUgPSBpcnFfZ2V0X3RyaWdnZXJfdHlwZShpcnEp
OwogCX0KIAogCWlmIChpc19tdWx0aXBvcnQpCkBAIC01NDAsNiArNTQ0LDM4IEBAIHN0YXRpYyBp
bnQgZHdjM19xY29tX2ZpbmRfbnVtX3BvcnRzKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcmV0dXJuIERXQzNfUUNPTV9NQVhfUE9SVFM7CiB9CiAKK3N0YXRpYyB2b2lkIGR3YzNfcWNv
bV9yZXN0b3JlX2lycV90eXBlKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSwgdW5zaWduZWQg
aW50IHR5cGUpCit7CisJaW50IHJldDsKKworCWlmICghaXJxIHx8ICF0eXBlIHx8IGlycV9nZXRf
dHJpZ2dlcl90eXBlKGlycSkgPT0gdHlwZSkKKwkJcmV0dXJuOworCisJcmV0ID0gaXJxX3NldF9p
cnFfdHlwZShpcnEsIHR5cGUpOworCWlmIChyZXQpCisJCWRldl93YXJuKGRldiwgImZhaWxlZCB0
byByZXN0b3JlIElSUSAlZCB0cmlnZ2VyIHR5cGUgJSN4OiAlZFxuIiwKKwkJCSBpcnEsIHR5cGUs
IHJldCk7Cit9CisKK3N0YXRpYyB2b2lkIGR3YzNfcWNvbV9yZXN0b3JlX3dha2VfaXJxX3R5cGVz
KHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IGRhdGE7CisJaW50IGk7
CisKKwkvKgorCSAqIFRoZSBJUlEgbWFwcGluZ3Mgc3Vydml2ZSB1bmJpbmQuIFB1dCB0aGVpciBm
aXJtd2FyZSB0cmlnZ2VycyBiYWNrCisJICogYmVmb3JlIGRldnJlcyBmcmVlcyB0aGUgaGFuZGxl
cnMgb3IgdGhlIG5leHQgcHJvYmUgY2FuIGxvc2UgdGhlbS4KKwkgKi8KKwlmb3IgKGkgPSAwOyBp
IDwgcWNvbS0+bnVtX3BvcnRzOyBpKyspIHsKKwkJc3RydWN0IGR3YzNfcWNvbV9wb3J0ICpwb3J0
ID0gJnFjb20tPnBvcnRzW2ldOworCisJCWR3YzNfcWNvbV9yZXN0b3JlX2lycV90eXBlKHFjb20t
PmRldiwgcG9ydC0+ZHBfaHNfcGh5X2lycSwKKwkJCQkJICAgcG9ydC0+ZHBfaHNfaXJxX3R5cGUp
OworCQlkd2MzX3Fjb21fcmVzdG9yZV9pcnFfdHlwZShxY29tLT5kZXYsIHBvcnQtPmRtX2hzX3Bo
eV9pcnEsCisJCQkJCSAgIHBvcnQtPmRtX2hzX2lycV90eXBlKTsKKwl9Cit9CisKIHN0YXRpYyBp
bnQgZHdjM19xY29tX3NldHVwX2lycShzdHJ1Y3QgZHdjM19xY29tICpxY29tLCBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCWJvb2wgaXNfbXVsdGlwb3J0OwpAQCAtNTU1LDcgKzU5
MSw3IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3NldHVwX2lycShzdHJ1Y3QgZHdjM19xY29tICpx
Y29tLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCXJl
dHVybiAwOworCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQocWNvbS0+ZGV2LCBkd2Mz
X3Fjb21fcmVzdG9yZV93YWtlX2lycV90eXBlcywgcWNvbSk7CiB9CiAKIHN0YXRpYyB2b2lkIGR3
YzNfcWNvbV9zZXRfcm9sZV9ub3RpZmllcihzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xl
IG5leHRfcm9sZSkKLS0gCjIuNTYuMQoK
--000000000000993c3e066132f7e9--
