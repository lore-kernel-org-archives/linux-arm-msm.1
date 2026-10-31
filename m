Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445744;
	b=WX6S/N0QCga2OgWDihuG03m60JPdC2GrwDbjhySoDpJH0/dcwZB2pvR9PZnjncTKdHQo
	 s4zPtBSLimqolgR1X5OFkV76ITHEWXhPkyKAUpPR+QMrqzhm6zZATctp6GanO4sQ+BzQ5
	 hXDUHWvdGju3lP2OHvBVslxIoB5mj6z+hUD0Trl9mvb0uiGnPfWYJNhapwsfkfhus6azZ
	 R719/i9jIDLjCe506D6srCbsUMlE9s5eomvdA6TLeVDggaofnmi+++oBoJMXmt2XV1aNy
	 thxO2/8bYs6YdVQY77GKroc+HZtzgbTQ0+ReuCa2mMCtBIx6WkAA0CEuFRce50nvVDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
	b=CWfX2Sw3N2o+Achq4SqG69LNwXyOLRq4pfH+bOlclv77I95zOs4ghp1pn0skDE5J1l3r
	 1M/VMz8EdK2asvghkVx+nigr03JxJink125qQVSAW9fQ2SuXWRiLdGuM4I5eZxGymL1h0
	 8QooJIBR5FElYlDw/RSfr7bsEPo2dVMwrK+CRK75Kv0Xp+tvFj4n1FbmI1diWCoyhbkU5
	 QY6PjcqvGVtR7Icxo8vReX2r91MoAWuaRYkVHFzAVIf9tUe+NPongwYYMudqIxd9MgSvy
	 lcVDyVwN61eSBAkOpM1cB8IAT/r88NmmmACnTzWz3GikKmfaNgFEgTHV5pdZvTybMuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uIFEbeX9;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB627606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB627606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uIFEbeX9
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab03acca28so2583251fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445742; x=1794050542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
        b=uIFEbeX9KYrdDJbFM6EJhXmfhbfOk867XjudZFcF/TcyOPe0Qn7h/XCsLfXT+svrik
         V+dty+BAvcNKWDygTdJ3ruXIq9FfDAC2v+ZHefLofDvTyjE2Ow+RUYNQlzAcLEvTV9oJ
         QCTTso3sK2UOGHrPPhxP3JEcpiBiO0IpDkJAzD0d+8JsJ4hkcKhO7WPmMZ9nbH+bGvTw
         Z7ONptNZpKgcP00Bhl4Iul2v+3POyO67xGYptvO7qTWtB6WJPt5fBXhWUhSfBb0ty+BZ
         8+Jp995w22U6HQEs/AA6uxvGx96hNq6W4VIQu4y3UPKi/1XcU73KR8QoEcmKezhc7Mhi
         bxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445742; x=1794050542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
        b=CMcn3DmV6NY8Uz5bXBsJznFfoQ0W2N8LBRq80f37k/fqIqaegpA8Xj9z2H23vUmJEh
         6cVamBIZiHUAsGh8nN/9ZDjC5OZGU2EfAYbycHBAt5DBiPCYAtFbl40L9yW9dzPGsL+l
         8f/vyGcRZlshU+DyQ2O32tUYA5su9hTAzVwQe89iqbx3Ki1JeS1exTJpjaJNgMDRQvy5
         sWO0CJ4icbUYbM7+miUhpgc+THNhzczkeAtLu65pZMPc9gzDLyfr0Fb6JoFqYDhCuDnX
         /7/0GDG9q3kCfvfzJotMfJKLIoz0FaOO4midbwJp9H/eDtOGFXw/0R1du+/rN2Fb+qIu
         KuhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZy/p3VTglf+XtXcoCj9VpVORfvRnCjqlNYfJVW83bVR9ElSoyViDT1D85dsUOskdBV2KmEDDTPloNgLoZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJpk4x3tqFlki/8KndARKxSjMZA/b2HqI0GPXDB5wH+9Q/9Jjmq
	/pK/IXerDy+orI7HLlkLWQ7Y0vlYVzihCH9RcR+sHgNFZ0UGdTVw5xb6vQDU573AeyI=
X-Gm-Gg: AYBFou1rJPuvu4WjeO5LlwhwPtYVqvtbEInGefJHDYYxE7txl1Pb2I0nabkVywH+Cfv
	ghYf9pmhfa0o1rll+JbLjRbDG045Q/DPpv/y/UJneU8KNboWYer1kW3jWXAUMSpU0hgnzUhX9JE
	RLqO2lOrFueXFQoas8ya3l3hEPm7Hte1jEhOX3hm2wFzHOb7Pg0Q+RlgfMgh+IjWRv37NZRv/A1
	LVFY92lFGNH1wEVo3TwjWjj2X+fR9Nz89BtzYhZwpgXyPHMSKdtsX0jm17cCrjkRN4wQFt9FQNv
	xe6N5SqzRJ+okiuoA75SOW3uJj7vP1MZuqFj0Rfh6/9lMl8pyKSp5Zsk+6lba0uRy00sOTlMgjk
	wUM2bMY+3DLdsYV4pW8pQnlS0wdmSosq0JUBOKolFyYIXGYZ9ppY0oOSK9OLJyxOi7AeDB47oIh
	TPE2Ug2BoC80pg1wMC7+jTheKMq6E9dqsSpneFQXtaHTfA0zjLrW1JC0lpOcp2zYKaFnht1ww8j
	sUU6Yxwabny/nhS6wKsJvSCf/9FPhwtbH8jVQFFnWTDx7fm0lI8L+HzyuyBvqW2oj1v/ukXWG/g
	A2zI3/xRAFEZfa9wDvahSl69aKw0Hi8JPaRjBvoqXYCvIiqD8GrQG2PJsBkEoqF0e3ahfdtXssu
	HUNeWVbp3IRcDozQ=
X-Received: by 2002:a05:6512:4607:b0:5bf:ce1f:cd22 with SMTP id 2adb3069b0e04-5bfd94cc517mr1665400e87.0.1793445741887;
        Sat, 31 Oct 2026 04:22:21 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] media: qcom: camss: Add SM8650 TPG support
Date: Sat, 31 Oct 2026 13:21:57 +0200
Message-ID: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains 3 test pattern generator (TPG) blocks,
describe their register spaces and the non-real time CAMNOC AXI clock,
which is needed to be enabled to get TPG output written to VFE.

Interface to Qualcomm SM8650 CAMSS TPG v2.2.0 is similar to the ones
found on later platforms, hence the functional change to support TPG
is extracted from a change done by Hangxiang Ma for Kaanapali:

* https://patch.msgid.link/20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com

Hangxiang Ma (1):
  media: qcom: camss: tpg: Add support for v2.4.0 TPG

Vladimir Zapolskiy (5):
  dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
  media: qcom: camss: Skip TPG if its registers are not described
  media: qcom: camss: tpg: Support TPG hardware version 2.2.0
  media: qcom: camss: Add SM8650 TPG support
  arm64: dts: qcom: sm8650: Add CAMSS test pattern generators

 .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 16 +++--
 .../platform/qcom/camss/camss-tpg-gen1.c      | 24 ++++++--
 drivers/media/platform/qcom/camss/camss.c     | 60 ++++++++++++++++++-
 4 files changed, 106 insertions(+), 18 deletions(-)

-- 
2.53.0

