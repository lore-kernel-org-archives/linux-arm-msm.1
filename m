Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088502;
	b=BUM4ciic9rrSPpgOyITLp7a9Suim+zikqxGh/cu8kkyJGHvZ5p20zOEZs8lh3t61pFBQ
	 pvHv0eHkAsl9hd2iDoZ3RwGfqy0NmiTpekZc/WbyldeUVuFvF53t0lCIj8ru3Pt/O066M
	 ADfo8uwx0Guy85vesRbiDuaHW9VpeTptu/YwR0hzEGFBU+jo+AfjYu8y8/lNvOGWtXHBc
	 tjlRAkyAlDRBF8nK+zkh6QOpUQkUFpDMpDjR8jqOCeMZINecQR7WjY+dWlNDe9t8CYhAa
	 FftSbNWbDtv7DAKnNQt9AhzT+UtfF4iP1fDeVH8yX8VZN8R7+etZ6Wkx3Q6pKWR0QJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oH3t2Rln9lAG8QVTX7NHWxknnMos7I8hROhH39XVhKQ=;
	b=Lji8e9F+2F5iZgzi2mfGYyRzcJJ4lbjVXqE5T527WnUD5aDyej0PuEoaPgTrQzKboP2Y
	 +6vLmIHot43VAgKgmngjNFMo5yIS0IRZPa/bzH8FBi84BEXc0qnHk0I8pGuWCC9K32LNf
	 H20gGPCGhnpDHZ3EfR9ZuIb8Z3tvakZcCruCreYzhh+wBLwqoAZmlDEV6Utebg9c0u6zD
	 yrxGY4LtVTQEvM47Ao8FobiHjjyDme7n7PT5aJKz3LKWxneuSuFqj/QbwKuMx4X9TFUe6
	 Vd2qrbQvGmuTmZxEqzkFEi8T3zIEa6yE9bhFIj+eOh4GsGHEcrQcyicytUUuURj2FSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Js2LINKy;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA6E606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA6E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Js2LINKy
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2148728a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088501; x=1793693301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oH3t2Rln9lAG8QVTX7NHWxknnMos7I8hROhH39XVhKQ=;
        b=Js2LINKyeLEHge29xodbyTUySolxzK+A33g8sNVIAhUROllTEdGB+KyrFR0ytFC0Ep
         2K2lRKGeLe3gjnFWdpswAXBkYz3kv7SH4j0flK2JDIgr3iUw7R4cFUN5r5VQQ/8gyVZU
         EAeCEIHa6GA7hRcyQ3trFXVDKxzYW1+O6t40K6kxYb3VlsV3owdiHaRraC6csdrTD6FO
         KgacCCDT9izfVnRAMJtdlo3pNkuK5yroN2js0qAHjQbju6lM4Y1mjo2WE+HYgCw8s+0L
         RQQDiYfPxsNcjpUH6G+x4+SjiLtjJGB2CKSvKQsr9OYJK7GWrIPogr3Ehav0by7vng/d
         DYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088501; x=1793693301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oH3t2Rln9lAG8QVTX7NHWxknnMos7I8hROhH39XVhKQ=;
        b=FcY1eeWbSWyVn2OObtZfdvaJAHvo/vXuqsKby6lBp3kODmO3iLpOrDG9YUxHYcGBsC
         i0CZeqIeLLecS2mjVrkNKHleIzGqEXDvUvSmU7lblzGhTxblgNY1HPyjlhpR3CDJ2MSz
         W5QXQObde0XWzWPpl+kxbWUH5XW53jby+IJyhvmwMOvCDJ/SLBMCNE8zwbbLttAIz/Na
         Y5O7yH+U0Cbg0NjATt7luVE2nUX3iJ8nEO/a9cKLlWXz+6wyCma6Odv8ChZubborpVK0
         /82TRUroZGnusSdAwawg/Dr3rYys/db0NVVMjl3kpzv2LxoupI2und/8nlHDvIlTHa2c
         1POg==
X-Gm-Message-State: AFq9FYKLMjSnfV+p54fcTrrFfy6QLBBXYWiVO4Tgngs5PWmVrRoPXAH7
	9lOCg5XRdzCVFW+EECR0FjzAWJXLKJ2WtjhYscrqZppp5QbHINS2hBkZ
X-Gm-Gg: AYBFou3HygV1KGXnOt5fctwQPTkLiTDliqpZOFmaXMfTLfx5SKOx5/kSrDIixu5Cak+
	P7rdP9B5Gi0LmnqWS9z5X0p14BLJ68CPRjj5Xv0dwZHtuY9EctEE1wrVTPYrKuAxtRwInkMgL8K
	Cl/VsCdAbrrCdegAThFVKNIuJtMY+uC01A6oDF6vWUhjX7Xemjk6HtZE5bcUnwSPDiXuECtVXDe
	eMLKoog6qmlwleuoKH2eMat7av3ZpUGRwkT96ToaWmnm5vynCj6JIZuKMVLNgSmio81AtRBd3tH
	3T5Fob6OlFsnNF1fCAO4xQrgXAwGbc3FBav8NMkmZ1R6/DQ2zoc2Vmy/W+WebvOcxVtDlfG5Uui
	kwJzCH76+eRA+CodLYHgQEyBCVPQVDM0l+uYPwcOaXqLi2CipcxhXxYkYnABrUMWpNlXWpFIuUv
	mhlwIWZS97r9anGYg35Ul4EoGsEkUKKPtNQVXkb2ddFfAFzSlei4yFfZ+eOekBj0HAuT9w/E9vZ
	bzON3UfmwGjt/vmZ6aQGfydHKijGvxSblcCvkbBSCIV3q+HM3sBucM8ucu0mad0Cxh5hU7GHQ==
X-Received: by 2002:a17:90a:e7c7:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3adeb1064d5mr7698392a91.60.1793088501007;
        Tue, 27 Oct 2026 01:08:21 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:08:20 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
Date: Tue, 27 Oct 2026 16:07:52 +0800
Message-ID: <20261027080758.3990418-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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

This series enables additional peripherals on the Qualcomm SM8250 HDK.

It wires up the SDHC2 controller, the LT9611UXC HDMI bridge, the FSA4480
USB-C protocol chip, the PCIe ports, QCA6390 Wi-Fi/BT support, and the
PM8150B LEDs in the SM8250 HDK device tree.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
Changes in v2:
- Add a cover letter to the patch series.
- Reordered nodes alphabetically
- Drop `output-low` and `output-high` properties of the LT9611UXC pinctrl node.
- Move the `status` properties to the end of the nodes.

Link to v1: https://lore.kernel.org/all/20261023072832.2642647-6-dc_redstone@outlook.com/
---

ShiTou Hong (6):
  arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
  arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
  arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
  arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
  arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
  arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs

 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 456 +++++++++++++++++++++++-
 1 file changed, 440 insertions(+), 16 deletions(-)

-- 
2.47.3

