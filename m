Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485384;
	b=dEG76Na1L+VubCkE9Y0uiR8fKRb3FgDAORhjrHpFfZUUhudY83VkAgRj1LzTJ53a95Y8
	 bJK0zf3gFHzBlXajvp3TiCefNS+2IKX5kxyG1QGTcggxpPG3HFH5aQlKglD9yrEgXKxrF
	 GJFBo8HLFOlRMUMHULMBoXo6DjshY0cmrzZFxhb+4+T4KkeFqhN4km2Z49m1qDHeuNmyi
	 I5ESwiWrUGbZUMAP8vFks+n0QxNJ6TVxCft2VPKbrWAvFLHX9STzC7pvY0j/SrfkTc7UN
	 R+wUUXlXnTrWSEXB/2j/iEEsvBE5koLYkqRF9fNB42LmD/09HaEwjKZdmJlzmgrIapg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
	b=OuwXm6ZXuSnPINi38SmCo7371EG6OaUFUqKHUzvikz39EoyWY135KyVSw2a96NKt17ty
	 ynwUMvEVnbjOpdPUQKYy3Ok3N/MrF+5S26GQ7UFbSG65RFmnEI3BBR/5EfOFYTkO9dF/j
	 /6DcXWWKSZvXiaACwXmaPzhPnwXRy1frT5z/fqm16de+NImM6X9yZlNxB0NkfE61fe3cs
	 eeJJeHs8v5psKxOBJOcgAC01VaGCU8OoVgDEmj0GV+inv5IAAVfAn2WUtox/JM1LiBahT
	 ifVOkxzBFmD5SvY99jRAcM5Y0ogMFo1W+ljWWwMVdYeRkU0u3PvYtBNc6cLSoKV2Jjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4DfO8nm;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4AF606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4AF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4DfO8nm
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-949664ee41cso420515885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485383; x=1796090183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
        b=z4DfO8nmNbrEgFqhLcRF8JcVLCkC/ktyGqWEafsu/BnXYKGWDpkQKyjV6z/HDjK1Kq
         abYz7L0vbof+4kPv/6Qx1Y/TBUKzBvE4tImHN8gB7d9oeEioRLqsL3cyRz8NEGw9IMjf
         RU9ebb7eB7QjWkzxjz2vsQrykKsN380f4aP2M3MWdCLrbfqdUQRZkwQ07G7V9SwlRwLq
         nPzQGI1GzGLj6TJUXX763xDdMuZGfiFkJxLujZZArNEEMpxtMg2+wWr3/IqJv7q7DS3N
         OJ1rzC/wEMX0qDKS3cNd+rKKpKTcPkXvM8d8NOfEe+QUY3s/27FEwB36Whcw2FfqJ9qH
         +aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485383; x=1796090183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7yKCR40q8eUq26k3oT3KK8/EmLxrrYzaMJfF2nkc00=;
        b=Q/i1dNCz/S0cEvjkyxJK1c1PEg9AcdxHRn8PvojTXr4EBIZ3yHy9Y1Vkwjsi5kqnjX
         MsA0zybj4YKjQRdzoANlpZXr2a9J/iDvrZVxA0mO2aQHSmQQotaJTYuvOllm9GNuxJu8
         yUOK8ru15mAnRrqmHdixyNHU2NkSyEa8aK+VysNagAmRAHBF/jbtLb7FF9teOfi7Ml7x
         rcuekHxxa+l5iPsyy7GFx+lrjZNP4Y50nLR0Xr9BFSm0IMiJV7qQK8l/pL2cwy3o0zel
         FQLCnZgtvs8za/u7l97blHzU/06SUV8PbukW1uS6UHm8RZvVOs/dZTMA6TcDidarvna1
         FMWQ==
X-Forwarded-Encrypted: i=1; AL+hErH1O2gI/9ybaBBoDUsupRxEazaIMiPeFtLlawdNQXjIw08CKxtYMJvnInTDU4yLHatanlNaL0a5Y1hO01TM@vger.kernel.org
X-Gm-Message-State: APuU4Z9kmjpwue9M+Ihgv66wa9mltAo4O9YSm+clAxjpOtmIy/SHEScQ
	MnAYc1s8jsXoKN/4nknUY5Io59kJzrn5nKufGWn9D2xdAxSA6zGGRZdb
X-Gm-Gg: AZFdTZfB7R0mWyi4vWseYMjroP35S1oMkCnihnAvCeleAinIBgh0A56+oQzDbOcq7ZI
	SEjcnulixwIv3rAmMVbtxmwfE8x+79CrxbfNtjc3+v9CfVzs3RDKwUqnGFp7hpy/TxhuulzOsbP
	1baVdrY3OMC3gPZh2rvdI5p6jKVKybD0HoW//gUrzE9syTkiE1OMAgERe1xI3kS+VOAjD5LTPZI
	bmr06Al050MZc0LI4MUOI7hUc+dQusj41JVC1RPwwahn9g5Sp1CEftPr+aHY4e2ZZEIPjBlrjl4
	qX2b2fmF8arbcGULUT9wrSCF9GR1nzj6hyTz+LHjfQjuYxQJ3Acc1M0FG9FQnaLfOc07qPKfbik
	iplMsqibjmjOj1HFftJrDX05Yb67QByCNSoDYZdp8+gIGO+jAz64QtT/CeQLn4CzKFDJk1ZLiV7
	Dsc5sHMSHuB8xReeUEW4nGYT8zGhfKr1zbu+XWt+9u63ELFT65P3D/xMaeObAJbQ0dm4qsn7WAM
	v/Ng3Ea3Ny6n2aj1ZE6QHgUwYyfcpaXYahQ9sBk4zQiXCtpl1pwBXp+YPjaf8pc+pK3r72wIlQx
	IfLm8d48SKuG/NzfiNPowuxpwnJ4
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr2479954885a.29.1795485383133;
        Mon, 23 Nov 2026 17:56:23 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm941507985a.14.2026.11.23.17.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:22 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/5] ADSP for SDM670 and sound on Google Pixel 3a
Date: Mon, 23 Nov 2026 20:56:06 -0500
Message-ID: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v3 (https://lore.kernel.org/r/20261107022453.159341-1-mailingradian@gmail.com):
- remove sound-name-prefix (3-5/5)
- add newline before status (3/5)
- add review tags (3/5)
- drop applied patches (previously 1-4/9)

Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
- stop using fallback compatible and add lcx power domain (3-5/9)
- move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
  (5/9, 9/9)
- reformat q6dsp dts (5/9)
- set flags for codec interrupts (7/9)
- move "qcom,..." properties to board dtsi (7/9, 9/9)
- add review tags (6/9)

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (5):
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  37 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 139 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 198 ++++++++++++++++++
 3 files changed, 374 insertions(+)

-- 
2.56.1

