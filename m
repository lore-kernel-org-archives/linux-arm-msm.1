Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334402;
	b=LkD7h61HV1Mw+Wp/i7CMX5ia35nPPuvO+PFVapUKEFtvHEgZ27sAAvCaF+MlKOyYV+nM
	 OhKQs2S9OVAIwgK7MsRoPQZJfDjrBVnb29Rqf3xtaLo6gsRN0O3CJuFY7s3jXi/+cm0s7
	 en219zhdePy5oNuYO4oat/LsvYHNL/0WzaoRCI6UrkiKlqJOhnkX0VBEHrS7R0rAVTrfe
	 50Q0gJkLOtNJDp9WBlS+1Z627qPuUqD+TxEql8om6LX+Mg8Nzpiv5blIjXlFDF45St63r
	 Kk+TwtYn7YL1m0PIXX+HNC/quiWsUyHoJNfagTb0ln0xdakAf58yn9zxtid3IatALbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
	b=lpctVSLmQafKUjTuk040lJ6WQd8mYJLMcGFYUXRzg3N43X/u3l/jID0120Ui5GHt5VYf
	 YhZB/V2BwwLdhoLA7+4/NgDXBDPQ4e78bZ2M7Ou2Lsgf51NKH187cOR9LC7OVxbG5Y+9T
	 KX5k5pGAZHWvAKu8EtMMv8gjOZi6HxsyazF36G6gbglzZB+i+Hfx6TEOi/J6pAut3E1Y+
	 /1Szj/oOL4bUuoCrec1UgsdHvGB0G1KI7lSLTtPTM+xEO6tKX6T12E4ED7rXUcerDvJbb
	 9Mdz9fZtkqLGSkdUM9iyypJSmQRwiOU2ZjDmQQLjUSV1HCoxJVcdH/iHzSd0E8FIsGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14D606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 04:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D14D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9e53d011eso2748735ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334402; x=1793939202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=OOGfl08iTrDcSP5CRoXDmSVya4AolyQdAG5OWHgE9ofXhHL55pCqAnLRy3QOWArl7Q
         waeVAr4qZkWUShO1RmfxQqhrxoPq/ZSnc5SpnwuVgdXh4uUo3uTMWH2m3jGzBhUOoKFx
         piwI3wn6MAqmd1Jhykxn1EE4vgfRhKxFaW6GtH8BDqaTg6lhfH+PQ4OKYqKo0UaA/SHn
         G+h4ly81vQPBO+1raeS2XxMsGTShwbFSSrem/WohBifnUltiwlf2RuGeIQYnhL9m3Aq7
         m0V3jj7XEILRpMI0/2a20+1yKez2+/pkZAsbweZ62X9Oq2XkzL9wOS2u7ALkWWYDls5i
         Qy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334402; x=1793939202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=aq8XUCDoeimbjKmQjIZhun5hwXRIDqjBJan2LaJRmdwEvHjh3Fwu5B81xD9BfNixQW
         mSetRB4SoBTxicalHRRhhBqQTnAy/FUDmi8ufrgIEaQ23DGWy2vySa1rMRWPntLe5h4b
         pBfGwQIiR4MWgnXobQTGXj53D5FRbb0cXRwsZREyYcXhehCKcXLc8UfisLh6wxhIcNyp
         11CloInNi3poWruiuiSFIjc/KgcVgPkfvKYwFOCm1KPmZZ+ImVYpPzEGedEs4j/yRN+1
         PBUsOTbDomqjedC+IIGTimjiEQrKtyX9I+LeR/HOMt7Rnfalfr38nxETGIDfnHE8cfnh
         s8qg==
X-Forwarded-Encrypted: i=1; AKwUvBxuo1+PCcODqajMH3yTqLR/uVRSgkaRWq9+Gv/zLLsdhYz/JZwu2yLLU+5bUJ0J0n49zN5Ls/1B9SyC1zuN@vger.kernel.org
X-Gm-Message-State: AFq9FYLAR9y9wF0wuHQ/0j/sLLn3YkwKIiT/XTWYbFclo0F1YPRcmW5j
	40RntCLFrgxMku5TLF13dYQV0OKIs+xH/5TXUNTF7YyDB5XiP3Oq2js=
X-Gm-Gg: AYBFou2YUXpeWczY6adxUmJpTEWM4MACSfSC6gAaYkPGHI/UrfNWeTT7SHYQbggQGeB
	jdi2nUZrrSdJuhNCne+nxooqG5UsFXs2kjhMp24IsOR3ZbQZz+stSd5lKQqIK8zTzQw+jjjIvN4
	RCPDtuEyrNBLZTyjk8CwLX3sKwRvPGlxVWuvy0fPcImXePiU6ZfFVVXsep9VDjXaq96v5BphDDV
	4nAlPSmy14RfZIyVHB/74RzrRZRJ9FYSI8vSbIXPJFubLWgCkCxGXLO6+G35zt4QWEMfD+B5TFG
	fTrQCisoq3bTQeRI1ZPBJHPlitXw2crl3dXJrE3EhqC0OlnDV66JgrCT+7a05MV1cjjR8E8Wf2p
	Tfo/gaP/FVUkdE7h3JcEbR/RuyX/PN6hJ4o7qiRI/jEdom8m5uAcbz+i/vLuLhH+mhK/UFwIrvV
	KoeXlCB9WF6fuezl29pDVUFDhKMDV/VDC+u9q0BEGK6NFdbbgwWjy92rsYe8bcPlxWrf0WI8/sr
	VxubqFjQ/0AQ9hIDAwfmznR1m9BdcvYdpA+utgNP2xhw4K6hR32ILKfVM5YPtvIfUxgNJT+R6fs
	6BVH1Jx81uBOrpUx4NzWLyLODhT4AwVD9PQNto5vcDmEQquUzhcX+M2g69QF2dZheSvx
X-Received: by 2002:a17:903:faf:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb364e553fmr13990205ad.43.1793334401915;
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fbc4sm1965845ad.24.2026.10.29.21.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
Date: Thu, 29 Oct 2026 21:26:27 -0700
Message-ID: <20261030042630.2744339-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
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

On 15-Oct-26 10:55, Konrad Dybcio wrote:
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware [...] It provides keyboard backlight control,
> additional temperature sensor readouts, fan speed monitoring and a
> number of miscellaneous functions.

Tested on an ASUS Zenbook A16 (UX3607OA, BIOS UX3607OA.312), on v7.3
plus out-of-tree Glymur platform/board patches, with the v4 driver
(2/4, now db3a9dddab5f in mainline) and a local change that leaves
the keyboard backlight to the HID driver:

  - The EC driver binds from this node at boot.
  - Both fan speeds and the EC temperatures are readable via hwmon
    and follow load: under an all-core stress-ng run the fans went to
    about 5900 and 5100 rpm, and both fans and temperatures came back
    down within a few minutes after.
  - 115 s2idle suspend/resume cycles in one boot with the EC bound;
    its fan and temperature readings kept updating across them.

I didn't test the EC's keyboard backlight control, because of that
local change.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
