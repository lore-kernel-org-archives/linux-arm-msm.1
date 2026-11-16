Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862531;
	b=NxfnLpvbhkdTSYnzWAfYI4XsQKHYz9PCNW2C5ViNQY9GhAq2ikJT78LH8ldGFU1CarhD
	 Q84KaAHO8grfPjImd0vQjohNgSqYZgX4LHj1QiEDcCHg5nRs1QMWCgKJMi+rIs7X28lih
	 +J19Vq2VX75swDsoYx3eHlawucgOog5Y8vvy18f8dg8286vOMaK8qJ7/em/qHwPxxd0CB
	 HTBrfhBi0hDPj1c6cMRrefGT/aStSVcyaOHznYJIPmFpwpv4CjyKsvaASkjvOukGx0OcT
	 ul2vgExicTkigfYKaWD6mvEcCqzHiHVDTmYPo9hWgeINjKURTVPxKSRJufmAEXIwbzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
	b=RCcyK4gwNBIf71lSpUPuq/nGf6170DpFjcjeRjpoObue3mEtfmeKp+woz1PBUACOSAR0
	 gt1IwSR8LlT2DiseOsvzrFYXPmBgfvPAXHHICZkTVdlDg7J1KQgt5LRWL2Iq2eWw7vNHB
	 nMMls+UT7cXKgJ9tPKcZG29sIE4aCjRvkp91fNV4VQ+V5UUhbbDteBhgd+3V69wQmfPcJ
	 kAoF9sQg1n5qK5pqWkfTIARDxtNoS2hXRoidXXr3Wkj6yCuhenY3teR9bxvkmCt584ep2
	 WpEcHVaCl/CVfkTZ2qLcXtrRCIVhdfAaVs86n+E7qSU3JxUlG7C6ujdosQMOiyxprVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70925606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70925606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so15764625e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862530; x=1795467330; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=lyXw+tAuRY+vzAmb5MLt7oV6TqjlqADVYJGL7Dcck4tDxKf0rDDD0HWaQ5FO2qsHLU
         ruxqmh4TQqmB+ehVIyshPNidpYHwCmYvdsEdr3bs0UuAVpGX1PHqZUG18BR5bp475wIi
         sKYkHCDCRKb8gBPOGVPa6xFHB83xVOGf1dpupqGVdKsauTnBd6kMUhGOoZiXQHzf01RT
         Qc2+sXyf4eMTGjeDR9J7DjqAiTkUkvYYti0mQRl2av7RtIdgMhXBRgTxMhUGsRZuzlpB
         uaRRtiPONL0x36Rcy21ELLbqQ4CA2xHOI094hGRgEosaAWZChyZjYB65JtOafYWEDR33
         w8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862530; x=1795467330;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=sGpUabOmH9dqIp0KN+atSvPsIn68WoRkbkcsvFg7Zios7iQnqrRa/YJkBON0hoXjBH
         /4/h2wzIkQDVNORXgDtBVCdPAeJvOdd6+SWtJ/iKCua78vekZVH4OGitrXOszFPAJJeh
         IfPXP3gOTu4oxUuZ9DiCO5Q/kXp8MNuU/e2byEPDqCpSpXUTOtAY81QFVSyIP6vnGg84
         UA70aa1e/FeCzvf+Tf+cv3yeqCBiKgaa3kFGh3n8v27u6szLCBeicIygVjPRiCbAZGpO
         jV6MH6lUBpuFwhdGNNMVppI4YMSuac5Sdx+clopl3gepbUMiBmwqXcsi3Mphw4bC8sye
         07zA==
X-Forwarded-Encrypted: i=1; AL+hErEuV6dKXi0qEyXjZeKuQSSGnOqVBuo6p+blWGOQfFLBr2E0RvFMj3iuKZhRFGJmLuk+qVJzLQNADcSgvHEk@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCFbAfK7IOgJr5G4uRfFqSceQCykNCkNGguZtUeZRmXa8MDf7
	SEmWup9E6ZGtLMcSrZeQUJ6SNEgSPEVUU97p5J2pE5S6uoWnkdW3C3cS
X-Gm-Gg: AYBFou173EvuO270n1yaCN8gfYMndv7lL3TyKw82YWMJ82JX3g/6Bu8HUHVKImGXxXw
	q6JlNgJRYPTVCWr3F2Ur53KrhFf9o3BFgVOAXgFqfxW1birgTXlAOOWoLCmOPG6ekZET7NH/W4e
	jefD8nfmfXklB+ei3Tj0yuvsh4s3QQbqQc1QbZaqATAWjx46R0WsXWttvdvKUYOfNHQPjYTqR8z
	kWo1d7tzXbwsV/Vt9ufR0Vb/gzpesD/mi6DoCm7fBvrnwamNYFbVMZ0DqO4BkJp4NIuk4EdA6HW
	UtEqcnvp7gbtjOzjocYtNrFzr49AYEicZosvBaaSEgLaLbAzZudvvSPIQutOAZIvfxczd6Fr5EH
	RmHCrA2s24jHdPU3zUk6okU0pcAVkLTwpI7TmdoPw3c2W8w6twfI/O+YAhaheILRozVc4H6Cm05
	HKA6j1VFK3kF1qADIxav066z30S50P4p8NOFgbUYhARqjJ8IOov6CaS/7O0jDNwW9Nz0kfPPg7M
	YhADYEVHvcdBRMRE+4gPDn9mrOB4ieJvn1zXTt1SVBYSOMzJ8kwlJ04
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr187492355e9.15.1794862529784;
        Mon, 16 Nov 2026 12:55:29 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:27 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBTcmluaSwgaGkgYWxsLAoKdjUgb2YgdGhlIHNlcmllcywgY29sbGVj
dGluZyB0aGUgdGFncyByZWNlaXZlZCBvbiB2NCBhbmQgYWRkaW5nIHRoZQpDYzogc3RhYmxlIHRo
YXQgU3JpbmkgcmVxdWVzdGVkOgoKQ2hhbmdlcyBzaW5jZSB2NDoKCi0gZHQtYmluZGluZ3MgcGF0
Y2ggMS8zOiBjb2xsZWN0ZWQgS3J6eXN6dG9mJ3MgQWNrZWQtYnkuCi0gc291bmR3aXJlIHBhdGNo
IDMvMzogYWRkZWQgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgKGFzIHJlcXVlc3RlZAogIGZv
ciBzdGFibGUgYmFja3BvcnRpbmcgZ2l2ZW4gdGhlIEZpeGVzOiB0YWdzKSBhbmQgY29sbGVjdGVk
IFNyaW5pJ3MKICBSZXZpZXdlZC1ieS4gTm8gY29kZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2guCi0g
cGF0Y2ggMi8zIGlzIHVuY2hhbmdlZC4KLSBUaGUgc2VyaWVzIGlzIHJlYmFzZWQgb250byB2Ny40
LXJjMi4gUGF0Y2ggMy8zIGlzIGZ1bmN0aW9uYWxseQogIGlkZW50aWNhbCB0byB2NCAodmVyaWZp
ZWQgaHVuay1mb3ItaHVuayk7IG9ubHkgaXRzIGRpZmYgY29udGV4dAogIHNoaWZ0ZWQsIGZyb20g
dGhlIHRyZWV3aWRlIGRldm1fa21hbGxvY19vYmogY29udmVyc2lvbiB0aGF0IGxhbmRlZAogIGlu
IHY3LjQtcmMyIGZvciBkcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMuCgpTZXJpZXM6ClsxLzNdIGR0
LWJpbmRpbmdzOiBhcm06IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpb
Mi8zXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sg
MTYgWDE2MDdRQQpbMy8zXSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVwYXJlX2VuYWJs
ZSgpIHJldHVybiB2YWx1ZXMKCkJlc3QgcmVnYXJkcywKRGFuaWVsIENhcnRlcgo=
