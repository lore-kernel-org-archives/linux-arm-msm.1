Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334374;
	b=tbia3PxeTTTvfYg6bm/Yv1glc0IoA9k8CBpbmWvsNvCnu0hSFqNFbhDJ+Di7ZgNjgaDM
	 mI+4p8vRO4HWT5O5pzU+QQgvHIF+YEyvEDi3Fq854mCzw2z2TrWkhyrbvFiM4tAndlt81
	 jRYnFybYLnzdWBTga9WBndqDC75jMHX4xMI4B/lHOoVhl0tZUOMZNfx5zvR/Iyj8agDNB
	 Lt9sPILaP+YJNzJ0396oE4rXLieoiRE3PR7P5NGcHYxnlqofR7hMJye3PGLe9hz8ox35N
	 FP5Ux9lvd1FYXVHcJtKxuHWX+FpRmPlsxPB3brUyjMyOD6LE6ezyCTbVq4NLvGVOjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
	b=xUoFe0WgTt3Tcn9pHfs8YB4B6CyGOh3ZUMHqePcjWzj4CTjyjVl0HLQMl50k6NziFa9C
	 Nkx/A4ajzwqIjsZxqEvblS1HKmjvsI1iNxJLqppkymu8QW6cLrhP4ztAibccv3hzzDxPq
	 QjOtUsWKo6aFIuAxAm1VXjzJSbVAjHj7n7/G9c34DvSHIWtDXrxTIe9fr8sKBBpIIYBUF
	 UxlNcwnalh/y/rJqjCMYp/G8VBImeWRiEyfACrX2jj3D42cdwhMPZBw68QvO/fEQSKxq9
	 9lzFyZfxL7Xut2nVu3Mu8g6R2KTx/tMLJHVWYse8xjszILAXq3Y4iJC90f3eEDTJOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tS5pn8Yi;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D9606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 18:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tS5pn8Yi
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ec08f71daso17846796d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334373; x=1794939173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
        b=tS5pn8YiT64Zd9lexBBZTQYgUn0ddUenE2ATM8vMaZ1MPspNzyROAIXQHAXOUwIrac
         5FpzRX+iTDtkR0zhccjnG59AFXZKzj5UpgnP1iJEC7nuuC0xu4MQ+0Bd9LfClbfc7uzf
         IMovpPts3lyTygm2Ue1nDT7LhW2xyvsJBoT9t1XlD7OD9gf8XGs245NMk6TLlfaA5Cmu
         xwKxenpVK3Xr4KOyt6vXpwBuiKn6psxaZ0Y+AZf8RVc611D6x4COmbVGw6l62uSOxQp/
         i9Vg/iUhtOmE+rJlBiF/9c4q7ZO9RzeqsPBF0emRYoDIN83Wcx0wOJAbsg56/bI0AvQ0
         j5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334373; x=1794939173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
        b=ccUWZHNrFAHf1pdM5VR0Oah5kg6rjgg/zvEo+YsC8b40uFgsmLEWU0M5CTIb4gD7R7
         ++VTHLH+A1QO2Qsb9LW/bbpcA/GsrdBHCc9GjdUh77MUFRVviEXcihqCfpifg4hjQCSp
         3MDLn0gykaWs5F+yWXCGirWRhvqeijwmH866de05MKpU6qia3ArS2CW3jLhVrtc3+qXz
         BwjyMFpLLset0S1RHeAF11XAzaHGJ1ZHO8D3/hpPAzNrPr31/h6ea4+T6YOphdtXT5i+
         7nLxed2h+5HjhgDxe905dF2+2z4cgkhO8eRdvdOH7JG0/TPEuRJWHyc9dOtXyywCQM38
         RXww==
X-Forwarded-Encrypted: i=1; AL+hErFnGX7s47nVHD8j30fkDItn3YpoKSo7irHt4BmbLq5rmyAFUsXtRN8gDQd+4eDF25leghepbTM7rfST8sq/@vger.kernel.org
X-Gm-Message-State: APuU4Z/7/OrrWSCnWVinNDHlCV41mcYQmINdhcDYnYu7ZXavgxJvhKh/
	Bj9gL66zCDDiKuFdJZyRQOOdhBwqYe65xNOAPNZTa+5h+BZENE2eCVPf
X-Gm-Gg: AYBFou2ve0WtQq4Gg3GC+BaX1MctZX1nREV0ZpsLAzBP8eWCPviggz02r8yAbnxoLt/
	QviXBxtP24cMlGaUnhxe3UFsZn0xwiLy1T5Gp/BNjxofTwMwdj3x8QldJBUae1O/8x4e2h+V19z
	LSh8TQpva2u6vQWQuZb3I8QS1X0JP9IIpUgvRgghByDpHRCmztlUTHUDzy+g1vIqa6FmF/VQUEv
	sBAoV4BLaxsaywUJ1KuneZ3dwjTL+cT27wo85/cTMaN1A3kImfp7gbTEC/buJrLeBDJMQse4vVr
	S2rIegLzFRey/4xOJqvR7olJDxNlclOog1CgTWHBYEL2SOT7mk/VNsoHLxtNyzVe4xPLgA/ifr7
	LU1/HbLpadKoqz5Mow2yELxbFc0kDAZdQo56VIGecEjkc4PUMHuV11+BBib/56Oqix43tBU3h6M
	5KVoSxKNZD+ccZoWLNMbI7UiMJGc88MasOFhrdIyOx7aQO4WP7o729B6jytErY3GCWFbbYIH4Vk
	pPNzNvUf5DSN4l39ZUlXsoWimfc/1vPXnPsU3whR1jxPdQfWhGHLC8VfIXxwsv/F0+M20QrpfP4
	ctClCKGoig8MGTouJge1czbjcHElSTWSGVQzj3W4aUYUIDEhxK2D6siReoI7n5Wiym8K8F5zcrV
	SkibbOinNXvBm80QggY2HvDHfFHnoQ7U40B4kba3KorSmZfseteWS8d8bq61jd5xlDnwHQytASC
	4ccutKlVogJVtVOE8HTm1klnmsdqxDmR87V6ZzcsZFLIZBE6rcbqIG5UNDypzQgNISGe2alZoJL
	Vr4ENsAIFoeZ7cf1u+9QAcv97Gw9NnPkd1fq4Rgd9VqiA==
X-Received: by 2002:a05:6214:238e:b0:91e:9db6:c324 with SMTP id 6a1803df08f44-91f041351bfmr1113006d6.40.1794334372476;
        Tue, 10 Nov 2026 10:12:52 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f017737a3sm4800156d6.8.2026.11.10.10.12.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 10:12:51 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com,
	quic_anubhavg@quicinc.com,
	Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
	Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] Bluetooth: qca: add QCC2072 support
Date: Tue, 10 Nov 2026 13:12:50 -0500
Message-ID: <20261110181250.47751-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
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

Tested patches 1-3 on an ASUS Zenbook A16 (UX3607OA, X2 Elite), 7.4-rc1
based. The controller (product 0x20, ROM 0x0101, board ID 0x17) now
loads ornbtfw11.tlv, ornnv11.bin and ornbcscal11.bin instead of falling
back to ROM firmware, and a phone pairs and plays A2DP audio.

With the mainline A16 DT (M.2 E connector, no Bluetooth node), patch 3
creates the BT node, but the card only powers on with Manivannan's
"Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq" [1]
applied too. Without it, hci_qca asks for a "bluetooth" pwrseq target
the connector doesn't provide, W_DISABLE2# stays asserted and reading
the version times out (-110).

One of five boots failed: the rampatch download timed out
("command 0xfc00 tx timeout", "Failed to send TLV segment (-110)") and
the "Retry BT power ON" never completed, leaving BT down until
userspace powered it on. ath12k was bringing up WLAN on the same chip
during the download in every boot, so I suspect contention there.

[1] https://lore.kernel.org/r/20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com

Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
