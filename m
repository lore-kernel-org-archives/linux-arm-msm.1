Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864245;
	b=suDlpQLpfC0cvYOvD9A/3+Xfm/L6eGAnYfFU1wHnssDutxAmitwZtTZrgdBLu/xfEvu1
	 XhTpBI/Sv0cuWJ5KcUQRtIU0NcMGH1xgCjbXaqAvZ12h+e6VAgH9NzKAiCdEK31d7o843
	 x11skgysLRrKMApLLRCZoTiXeSh2RthJizv0Luuyn3JKBkA6aatDnmei8opKJuCQSZT7V
	 vFijFg74IsHx3gG8f5TMtb7ZU4t11LfZZeVGwjh7sw7ZBz/pMzY2SgSgriqJnZuSBhPt0
	 FtsvreqVLT+fp0eICplGmzjI2HiL/pkjo37Xig9oAGwtk+Km4L9o3XBrzmXXkXnVovA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
	b=W9c43n2k3NmSIVWlUpxvX0SQaJgbeN6c2MEedkUDNGoekRrMStHeUNEpZZlU77cTk8IJ
	 UnmVjtMcNNnYky6emad/9TZregLzk0zC9vPgch0c+JrojXp9yfmUIk+Vv6gzdFjPU7M7T
	 +yhS302TWg42PuijlH94+RCUvUo5E37FJ0Q8FlNCeLs8+cvEYR2nzVW5UPNlbIIBwLAAR
	 ogOWuJHBpFzswlCfwSwuuON3NxeR5bmNi/sk9sZKqAiPVjqhFTLwVBPW23aeKXy8GMoG4
	 wOwJzXRJ1kLCt+HA2JzbVLUaXVNMfUNQ+wubYYCaycC0+KcHq40dzyfFh3v3ABGUaLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FrVzVN/7";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32628606A884
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32628606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FrVzVN/7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so11287235e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864244; x=1795469044; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=FrVzVN/7M8VJOf7RTuhHp8/yRHlOH+DRPTKtOhVt6u/fag+es6Esis6pYgs8iyLlvX
         Bj919y9GSQ3QC/2irvSwLiP9evSGkV8f/Q2ZT5ZaCPq6cvFC94YMDMTzE+1y+oc9xM+3
         ACmHgTLgInBx71qLZTLRe34YZUmhkGF9m0uktlQx3fIBG+Pr6AlPQ0vliGMG8svdkafT
         7gSjrkg0OI3JDU7Ob70hj9KnVK74R49PXhnNYiIv2mqivf8Bjn9iH3i/f5TOyL+9tMT5
         DN7TXmHLJa4bgPfpWmLU8UFWkD0Qj4ZrNo/pZdAsaqQXxgWltVY3AEcWs88TlOddR+Tg
         atZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864244; x=1795469044;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=jV0GqdO0Rr5QbJpgBo6fERTs7Rz143dJkQOT+Cl+wEpncqWGm7jqkJOaNm9wuNqeGh
         PQacm0EfwQNbVhTm45G4KJvnZuF0fiw3TtFTDSFbUg9qsKATOdIs6M7Wbe04Ndaht6z8
         6yHahVeJ6iVbtOEVcTUO9co1qGIJkwcjCojYAt/zIO83imaUUVUZvRF2KMRUepNFXX5y
         xuTCnHGR3mqnFZ1sfAkujMNQLXswnA0JhlM72Bmy8reZ0TSu27scbnKwWY4Vd/XtDiCW
         z0vtd9W8WxIFoC66VKPJ7d7O6tfZ+wn3vKUVcSbqarGp1kF6JcF7UD00eW2DJmCmftgt
         sKHA==
X-Forwarded-Encrypted: i=1; AL+hErHYf7/nRwK+tnZmmYsFiiTq6zCfUN6+Op1fX3TiUGKiCuMT31HxNKZHNn2ZuZ1wyXihYG5znUx46nplM0mS@vger.kernel.org
X-Gm-Message-State: APuU4Z+k6/HCZr0zk/MlLG6MLpQiYNaiKm3MaOTsj0zMAtMflz1vCxRU
	5dlwfkBctcla1d8y/+iAWFR3jj+UERAShPa/TS8qZZwLu824HW9Gxoel
X-Gm-Gg: AYBFou1TN4M1Yt5JxpKuRTReF0T2GoaO2Eeg4oNynbQDvvZsguy7d/5AZ1hgB1xUoa/
	aIW+NF7XMCrYSMGYVPdAwmwf+puVQFj5yGvDqI6HP8O+cuxwYRS+qjKAlCJLsyl+sWp0pyPsd6n
	PSgnNZfHwz64Loo2k+edYBVDfrMfHNI8AFt0vkAvcY5M20JOY/nIOi6RNscJshYGChWslxGh4c2
	QPYzhe+vrDrGYMpEfuIuKq8l44OxXhPs7+q7zoS421Xjh7VfUAR7CkbwzQyGIw1eSWCP7LxSwfh
	68QHG3k0/p3l057Y6PSojm/ILaPEh6CheFyFMdbs/RVp9AJ/DIHKZvdjxg27GB8u+P+sZgzwwsc
	JvBF/cWRQwhIVLDPWUVRBmnqhHXo7dDjMZtkirMdZCRuPq4W7pJuL7eO91Ow0lg+VsKVsxjIEVU
	BbKFEx/JtrVtXg6cN988LtS3nwZHpNqilFFWkXxQ346Ke29CZHoR13k7/4yf163r0pYDglqxlnm
	tzSqAg1dJvhekaIG2nRbruQaVzJgZFDwmmkptcP66QZMomG60hzJnFwdj2EPuXxy82cMRFpPH5W
	iGrbhksZHMmLjnpFPtBB3qSqi7IjlBOLzdYk+dHl
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb55abdc18mr258614455e9.33.1794864243814;
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839c5c3sm16520325e9.12.2026.11.16.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:23:57 +0000
Message-Id: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG10+2oC/12NwQ6CMBBEf4Xs2ZpuBUVP/ofhUNsF1rRgWiQSw
 r9bMF48vszMmxkiBaYIl2yGQCNH7rsEapeBaXXXkGCbGJRUR0RZilY7x1ZPYnDei1oV8nDKU0I
 S0uYZqOb35rtVX46v+4PMsErWRstx6MO0HY649n7u8597RCGFxhJtkSvMjb02XrPbm95DtSzLB
 6nbTti8AAAA
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864241; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=xrLm+TfVvJoEp6IAVQCzFe0JVQwue5fgBOr1usvJ8nI=;
 b=7vzILpl8qrChpgALa3GHPPZN0zVDnay00lup4/uriiZw4XmAw75/hxuRsKAUVN+Q6+CVi4jHQ
 3dxYYOry4UtB0I+DDwkGBFfhcdaDos1AwtoUo4281yfyuVXiNDXDLWU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- dt-bindings: Add the tlmm label that gpio-ranges refers to in the
  example (Bartosz)
- Link to v1: https://patch.msgid.link/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

