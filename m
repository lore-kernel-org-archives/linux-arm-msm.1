Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4743F4BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433441; cv=none; b=JfFEcd7oFeJJMA7/fnjFc/h4k9SQ9tXAMwrDw1+a+YJPxky7oMIlRBULf8fxVcR4j3AMPfzA2HVucFIN7XLEx2B6LUs2+vROBuGllDnGTDv1ZL3yDM5aATxIPBMBvb710z+INhJmr11jZ7ACPw7Cx5bytkRcQ42cFWxH54zBsfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433441; c=relaxed/simple;
	bh=eZ2VdMNGvLr/e9cJRpuWW4lW97u67G3BAx3dA5XzMQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTB/OexGl3p+vJYh4CLqqi5WQJAKmmeX6eVMl6S5qM66ARzgTAEqxca/UztOPUePoTuLnKPIr90EINr1+MGIhr2t0NY3w7VlrDIa26Ji2c/H2ihk8XoXsOWpH8BlvY7QbBQIdb3yvyOxf6SJn2j8w/KumJowOyo9iPMyzapiFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHFE6kav; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHFE6kav"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e55b62640so7776985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433438; x=1786038238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKwR1+iwHoGPtyiGupDBuhusrAtW97W1M7h9bkSZgZ0=;
        b=qHFE6kavt8ZkKeUnYpf3U9ItWAw2KGhfwGHqo63i7pMy5paNMmzHV++pSxbxCNKhiV
         0eHbByp3CKfOUgU2elE9Wg9Db19Rxfe/9DVRwuIJCqWNRaXnzQ82NDVMxYwA1UwtcG33
         YEYiGGl9OR6fJvpuacCwIqWmx0s6lT44xVg8hYTQnuJVGRPNN9azXOgj2+2Bmu7Lvaxs
         tbDSu42xeFyybwbhRbVLzI6k+sunCxKWocC8c+MlmjF4oWAilScU4YSjfb8760H4R8/2
         HEucw4uF4Mtu+kb2WVtvsiHIZbWvKIJPqilfsuqnjfVkSogA5/8Pt+dCFI87MlOdtKru
         SFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433438; x=1786038238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKwR1+iwHoGPtyiGupDBuhusrAtW97W1M7h9bkSZgZ0=;
        b=KnJTD4M/PoIQEKHfJP5n8M31pAgfgaob3A28w8y4aLD1D21rJbtG75iydC5tPzaFA8
         RK5RGpJQYygdBpim3RD1+XFy459KCQoDkdokEtVI1MMiwP5sSYeyXS+hdOebjGvz5olr
         ad1tKnOxbuIZxlS4nFodayxN0+T6JiKEpL7IWCnKde25OhrYGHCpp8b9g31ZmELktuQF
         2ODJgPWoFrgnqVCygZ2gpvEhAN4lcDqK6NMAGaymq+WWy79JZoAVCfRwTwPbWj5vYoDA
         PNnPKVjfp+As4u9SwwaqdQo4ftP0OxcjflR4eWE9YgEMmAhfJr4s0QRKmLBn9cTbIClb
         UeSg==
X-Forwarded-Encrypted: i=1; AHgh+RrR60MBSbc+31F1DriQPWa1mOMWPaixa0OMeupC/myEBtzSEK4B1mDbPR/BRftb+hDTVpR+cSutUJuxMLR8@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWX7m3K5cQOlgxgaUXgc41eGGRkjbBjheKreuI24WRacuOc71
	9+CP8yJtJNNBZ5KPzjC1iGjXeqzUyt2v72xn0eJoXmElLY2HwLkef3W/
X-Gm-Gg: AR+sD126p7eitR1awLkSDNF0kdTFnbcQBpWtNO07ByWi4SgSCmYX2EH7uy1Y3brrFyC
	2dvgvbSxD5BKRacxPV/4jgLAd4QlnWIC0pm/gxHForJDOAtQPVZMehUmxqWjyzrCOs2wOR/u91u
	8Cv7g3Qub5UwBGtjQMOT+TyE5OphlYTM6BXVYuA/TGONZ0Uo9fSNwH//xhd2BagBetfHSZgH60a
	kc5RUSwdu0lwJQSHyqwQ4wbGW18iyyam3A7ohRF5A8A74WAzHiZVQQUjPwzz6q0iRJB4PoY57Sr
	TU5Cu4GDs+OTCgo9j/ofwk5kP8snWOtU1gp41FhF/nIMk4A5O386nuCQjHFVqqV0FhXsBzyu9yZ
	gzpWqENKMdscfIqiu9SzSUL6E7C15qjbLq7CmPgxzDrhbLF4+6PsaiMHIGDvkus2YJWRkeqRQ4C
	o8RclTat4bbtbymNiIneJKeRXJaw6sSnUwBpgrnxhUGOIKeB9BvGI1OW3HJG4=
X-Received: by 2002:a05:620a:700b:b0:92e:c116:bf11 with SMTP id af79cd13be357-9348701aadbmr378538985a.90.1785433437812;
        Thu, 30 Jul 2026 10:43:57 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733e17csm466012485a.36.2026.07.30.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:43:57 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 00/15] SDM660 sound card and internal MI2S support
Date: Thu, 30 Jul 2026 13:43:38 -0400
Message-ID: <20260730174353.108023-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 (formerly "SDM660 internal") sound card
and support for WCD codecs over internal MI2S (represented in APIs as
LPI MI2S).

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

Changes since v5 (https://lore.kernel.org/r/20260609162255.31074-1-mailingradian@gmail.com):
- add reviewed-by for LPASS ports patch (2/15)

Changes since v4 (https://lore.kernel.org/r/20260501153128.8152-1-mailingradian@gmail.com):
- name internal MI2S ports as LPI for public API (2/15, 6/15, 7/15, 8/15, 9/15, 10/15, 11/15, 12/15)
- fix capture stream macro (11/15)
- fix is_rx in q6afe port map (7/15)
- use NULL pointer in place of "NULL" string (8/15)
- change fallback compatible for WCD analog codec to pm8953 (4/15)
- add ack tags (1/15, 3/15)

Changes since v3 (https://lore.kernel.org/r/20260331193939.40636-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v2 (https://lore.kernel.org/r/20260304195815.52347-1-mailingradian@gmail.com):
- add missing sign-off (1/15)
- use definition of last dt-bindings dai cell for LPASS_MAX_PORT (6/15)
- move sdm660 support to existing sm8250 driver (11-12/15)
- import WCD codec patches for MSM8953 (3/15, 13-14/15)
	Changes from original (https://lore.kernel.org/r/20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com):
	- add back empty line in WCD dt-bindings patch (3/15)
	- add Dmitry's review tags (13-14/15)
	- rebase onto q6dsp fixes
- rebase onto q6dsp fixes

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Adam Skladowski (2):
  ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
  ASoC: msm8916-wcd-analog: add pm8950 codec

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (11):
  ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add lpi mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
  ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |   4 +
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 +++++++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  48 ++++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   5 +
 sound/soc/qcom/qdsp6/q6routing.c              |  78 +++++++++-
 sound/soc/qcom/sm8250.c                       |  17 +++
 13 files changed, 367 insertions(+), 12 deletions(-)

-- 
2.55.0

