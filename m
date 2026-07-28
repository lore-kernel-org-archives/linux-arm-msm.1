Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C063D410E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231123; cv=none; b=jo+4lIPF3lhyVyAyBOPRdz/3LZMO8yQZKBOo+TZ7++96E4LXLuoaTonkPj5OlDXvcSZMfihZh90HcXSpaAFgdHxHH2uFUZ9H/aPDO0HfQpB+W5/9oB8hCwadlXgmAue+lS9+f0kKedNMMcL4/rQhtcQxpxxyrAxFkwhjB9s/zAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231123; c=relaxed/simple;
	bh=Jkl2PGH7M0NPXu29zy6QxCryxwR16MztLXN3rqJ4qq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4Hc283B3w1htRNRZFy53JZAeIzF0jHjxMIofdWqkK422THE1g8EVoWCgy4Inxpemhn/zft1O54YxnOW8mBL7J6bivz6PoQuj/a4HjzlgeXjhy+vsIFOr2YMqG3DlVQk4aq82deyFQpoUWvO6skRsXbKxYoD2WFwg24uNxyW0fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xw9IFUDj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xw9IFUDj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso18358045e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231120; x=1785835920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4tdkttFSX/3BNQSdE7zE5H0DOJEurmkiijkNR+03hI=;
        b=xw9IFUDjjmeMQPkHIZHLt468AKRS+UL7VcgNX9ASN5A21sLvT136u0l26BBw9+WwxB
         Kc7Vunkmih71HNEooiO7MJB0olSJH8dH34oSmoCVMixD5H6u9i13PcbjnixsXJA3Rs4N
         TSv4UjNv0jqYcHfc+voKtbP0eXN2bi9Lt/QaXdwD+ghGhMZxDpkABaZmAeDnWiWSiPJW
         5F4GyGUKFFQnzCiKTJziOLYIEuM4xxJALXGZFJ5auHuFr6T/qsqOa1pbeS+fnsDDPnZ5
         csyiBEspXT5dw+gx78bRkt8+4V0i0Kxcsi0gzFlatYxQa8MDisnhP01Arg92g/BrF+l3
         kdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231120; x=1785835920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4tdkttFSX/3BNQSdE7zE5H0DOJEurmkiijkNR+03hI=;
        b=OJg+bRHgumdjstq067b9T9C5O5ehuqz/ScAnBVk0BsFKZF8qmuRTamkQZNpwkF/vKP
         uRdGCs8+Msc+VOtVLY+8gdefZD1T759GM3sfWb5P0/lu1kQySzb8wEhUuf2RSVQrJun1
         1YtYUZKBMJityH16cZwfGEQP4JVyWVYwi5szZZHUPeocjEOOPSIWehJW7dH36kKvr7j8
         FY9MTUPF4U3oU39bkT0IRr3+xaWAxdYwvmSuH1ncBWiVtsObjBsEOEGeRawVi6P3pos0
         U0AiL60e0m07mEcSohE4xIOm6x+fIxYMZqbFq36d6qyLFGRhatZbF5SIDluKYo6dol4V
         +ltA==
X-Gm-Message-State: AOJu0YxzM75DKAhseS191C9SL80sATLAnqCDtIxsVPb6E+BFaUKlNnyO
	VOrfSy9toYBC5mDQotHZxAZ8mDxngr7PBqKE2Fc+KFSfBExKZZ3EDvc0d7aqlJSOM+2VIpMFYce
	/3S0k
X-Gm-Gg: AR+sD137e0apM7V8AGk7KVxtISgA02eXczlBMsjOh1l/3phPPT4wuvH/F5iFaYyzxKy
	Vp9vpdTmjeSMqcTmEQkfkQQyCo2sCEuGyH7YOFBVUSWzMZmLdXzxVTbdvDl8CQqI3+qYjjqKwXj
	POFMBXUZB4IQ2+VSbyQri7yL4lqV9n8RKoyoTYJQ2oGvXS8c7cGtjh2mHcG78gTP1iO4xu27gI2
	CZRWGPI37luLvvaL2hY8W1U3Qx6XCI9RGMllf5ayezkIkLcTGqdX3mt+tK+saS99ko+I4aVoH14
	pBQ1r0zCJk1pDAA8Di/SRVgNoAitg1rk814vd+fO2S5PY5KRKD/KlsImHTkq2fnwetMxEoaBvgA
	CnPTa1vwRYaz3Y7tvEkzv3yF6KRBPnhJN0fo9WgYztkO2O2ysoH+4DhMGFpvo0qywjTtxHYBjFH
	Rwylgy3zaGGUtjFlnvg7tQons=
X-Received: by 2002:a05:600c:3114:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-496c65809b6mr18738595e9.26.1785231120327;
        Tue, 28 Jul 2026 02:32:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:31:57 +0200
Subject: [PATCH 2/3] arm64: defconfig: enable the SY7758 backlight driver
 as module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-2-49e3ac1c8ff4@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Jkl2PGH7M0NPXu29zy6QxCryxwR16MztLXN3rqJ4qq0=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcNPQpLygXthKEVC+ibQE/ftMt7r/1TDiDX/V8A
 9WiZR2GJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DQAKCRB33NvayMhJ0XfZD/
 Y3GAive8EgsBExBxrjsy8Zi1O4I2uAN1I4XpWasECY/el82ulzBz8EffKkUAlxfk/A0ZIgEWTxuSrO
 e48xShxyR2+CEVEF5FXfaw5+w1JS0bOBxz51jHL5vA+184yA4kzO+vaagdMyhmMWgXW1G3+2EYkGrw
 JOwpuMlS/QPH0wmeIxo2oUlCrdAcaweh9TR86ZdS4zW9qBvIA1AFwKAtJUkBaHt8669InfGDCR7Nso
 TaU3Ma5+Rtowvp0K22jtkGoSgmy5HGXUaABRQt9x744rPO5Ne5BKZsfHlSjI1MQ/chhWZrBHQcpWML
 0vOrbmlw0NbJcIQZ6O55f5YCUIwF7GxAFM6nRmcle86MmudOcr+aEhnM4dYJEuAAFprbXOIBxv8Bbk
 d60kxVmuIPJ1iu3cLRdnfFThJr8mVTLrwF0Gm/9IVSMivDuIaCY6gROHPqTndNyrQT4pJwjw0M9pAM
 BhsMQBjnUPki/0OgCe7Fm3Lg79FFy/jIhyKCUinU2CpmcNHHt+xtjhXvi60+s6kpCWJAGI9/xgzxbT
 4zX6aFzri50oJXG4S6k9OMroOeM9+DsrDLKFPzTi0pTKNPcI3bCwZJhvlnbeF1ySLQdn6JFtOMbhox
 a7xkDdLDQyRJGEYafaZQQbWS2hOn80j/5x+ESJhEeEOhC2g2fSbAnj3kjI
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the SY7758 backlight driver as module since it's
used by the Ayaneo Pocket S2 board as Display backlight
controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 97a51c238f55..90903bd082b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1063,6 +1063,7 @@ CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_SY7758=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m

-- 
2.34.1

