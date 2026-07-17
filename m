Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7E53F58C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295253; cv=none; b=IjKC3wepyBRrcpsOI3kXHCr7ajWbBqLMP7ZGvRs3mLhpYG+xFMRAN9hyPi4th34iavdOPQUq1JzlNXsDon8CSY4mfQci4y/tWo+a3zkewxauVHZdI0RmmumffLu1s/RxLjEQeHR1JrK9m9v6a2dvhhiqUbOTV2NWnQfVq7QBV+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295253; c=relaxed/simple;
	bh=DXXh0GJHE8ur+1dO1nCpSy/JskzK6PWckuD1ZB0l9cQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZHauVdcp9cZxJXUtllLrYclLnB6z7juBOdUFqVMYedQ+vmSvDlxfvifugMtTXkL67rAcLnNWTvVwp+L9OmHIS/5eFZxjlm4mutOXeWTcjY255SqLUbygvqvdt0bsDHfhUZmnK8TMsZE305k2engCTPext+ltk0sV/N26JKRNjlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=m2rc9AI1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="m2rc9AI1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474560436c3so3307702f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784295250; x=1784900050; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KSVT86jwC5nyb5SerhE6T35ZLSgx4GxTVi5D3yHG51o=;
        b=m2rc9AI1tZROXhbsnjBg3IkKftwrRLzJc30owGyDwE7uUc7KLs8R3EkJpl8dWRkHws
         xLaLRguMeYUYyQ0s+DsLURbEeAxGBCPzCjN/BLNaix5wPOt6w3CVxLO8AilWGGcI9BEo
         Tgm+1CZv2HtAjrwzCLd80O4+euWLFHZ00YHNooUboDyQY03cn983gQpAWmaGQ2XfCnIL
         3erYaPqxanQsIXstzkGGphxfYV2tG7t1u75XDboFBcvP3mcz/G5QJ5r92RkYf1jfokDd
         yrtWt+1MD/vbX2YkRhXowdRTkKprxKG5SosoveuFwK5bvupK2blkekeOmFA/Pp0SXWUs
         V+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295250; x=1784900050;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSVT86jwC5nyb5SerhE6T35ZLSgx4GxTVi5D3yHG51o=;
        b=EBwxTHBMc0tpX484EpAus1ncO/uGTzynqIuvn/zYKC7dqw80UqJoUl8fVRjcuPAZBh
         eOm2KmPdN8WNVt3XxWsy5nVJoc5WyPS7OR1WMvp9SqdD9BV2IzifIjP6GwoAjBamiA6z
         2i7aZS/HRho/QXM6hM62w7mO/At0VtfoNqxSi0iHngZFBCwwoQdRUFUSuk7EpSrMaFlo
         3DsXpZWebu5rD5iTPIgmImZtjnsIKfAbHjn32F7sdatvIYK6nW7mnpfP7IKSLZH0aymB
         m34PjQXJ2tpxts9cAF3ybcW8NLAB2lvZJq2bqF3zUtehtBQRROkYdx3XSOm9ynOKZlC2
         WNfg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9wv9qXSWbMLYFm5BpaWi6rtUcaTIFChMPp2VAUbGJvQowdzc8ZK5J04B1GXGYREhDnJNFCb7uUtJoaCgl@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/awJIYL1cPOY+CMm3L+jfl10OeIwy5+oBR3NsLnbXtSVlFGN
	/9I4ssJcsHT3MhpZEZBQEyKKigDg/3UUVPsT6DBVM6Xpx6B1mPwpODXoyShOIpCuLJY=
X-Gm-Gg: AfdE7ckWO4UGDdoGtEMC0HRfMABK9j6uOav0TFjziE9KaZveYB0BwpcWrktHuoF8C9s
	WXmQcHj1iaFdMy87wCO1CubjP0OlE/G/DdCK8+vN4yiqq2cgzYPB2UYKfBZZiwIpR2Yh+8e4cDH
	STBgztcwaIx9ILbC8ycZnj6qz8Bs7NpVTR53cZK3KUaelMc7/qJN89GH+1FBNUnhgWoQbOsEkrB
	f1vuBzRqmObx+p2jEGkYR0QoMV+UjftFqT8f0OUMoqr4ZJWRVOmLXQvZgAJB/sB83xttU7qnhWU
	Tj/ORg6B+vEwXW8zpUime8cdyZYQ6ukkQuv7/OlQ2kRw1ylK+YQ7frpfMc5DFEguv66ELROoI5z
	ybwD31BKKTCddv7IS+gQE6l9a3QfdQbKVzq0PkK1c9C8/nlUP0DJ8ADuX1g93S3uItq/69mBh3H
	wmHFfhoHCCSthM3Zq9XWucwewFaw==
X-Received: by 2002:a05:6000:4702:b0:47d:fc20:e7b4 with SMTP id ffacd0b85a97d-47f622f2c4amr3719847f8f.10.1784295249579;
        Fri, 17 Jul 2026 06:34:09 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4361547f8f.5.2026.07.17.06.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Add Milos CPU OPP table for DDR & L3 bandwidth
 scaling
Date: Fri, 17 Jul 2026 15:33:02 +0200
Message-Id: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ7CIBBFr9KwdhqKBqIr72G6AJzaMbYgUKJpe
 ndpu3b5Mv+/PzOLGAgju1QzC5gpkhsLiEPFbK/HBwLdCzPBheSq4TDQy0WwfgLnPQjZGWmP0qD
 krHR8wI4+m+/W7hwn80SbVsma6CkmF77bYG7W3D93boCDRtWdDD8bq9S10xR870asrRtYu+wDA
 d9T+Tvtq8zoiFDuA6VLlVUtIFhRwssPDA/AEewAAAA=
X-Change-ID: 20260710-milos-cpu-opp-26fb6c36be60
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784295239; l=1554;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DXXh0GJHE8ur+1dO1nCpSy/JskzK6PWckuD1ZB0l9cQ=;
 b=VjKsALIT2Lckvq6HraKgzl8M6gMe1at9iKNQMLqAWalW7m0MptW3ptDBRU3bKX2SWOeWF/uOK
 3t4a1YkJqXwD4XOOo8qQmEJfvK7eOGs58FGcw9K3Ic1MLKrCeT4wWeg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the OSM L3 on the Milos SoC and define the CPU OPP tables
to scale DDR & L3 bandwidths when CPU cores change frequency.

Tested with 7zip benchmark ("7z b") and membw [0] showing very close
results compared to disabling .sync_state and thus keeping all
interconnect bandwidths on maximum vote.

[0] https://github.com/doug65536/membw

Unfortunately there's no support upstream yet to have different
opp-peak-kBps values depending on whether the device is running on DDR4
or DDR5 RAM, which is where Milos should use different DDR votes. For
now the DDR5 values are used which are (usually) higher, but should
hopefully not cause any issues on devices with DDR4. TODO comments are
placed where they differ.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Squash the three dts patches into one, some patches along would result
  in performance degradation.
- Pick up tags
- Link to v1: https://patch.msgid.link/20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com

---
Luca Weiss (2):
      dt-bindings: interconnect: OSM L3: Document Milos OSM L3 compatible
      arm64: dts: qcom: milos: add CPU OPP table with DDR & L3 bandwidths

 .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 344 +++++++++++++++++++++
 2 files changed, 345 insertions(+)
---
base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
change-id: 20260710-milos-cpu-opp-26fb6c36be60

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

