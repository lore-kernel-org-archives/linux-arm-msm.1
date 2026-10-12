Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C54F4736
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841660; cv=none; b=rhMunM8RlgvFQ0oRWlGPn/1CRLOaJKQg/ZzapqVjKUjL8BHHqre3NdlyBxGrTMAov50Y8XVoDE4ah2bwzDFGVGVbNBxSOz9yTBo7QXI9TQObZ9k2WsOoyDYXbiTRk2zi0RtmUvZ9zNiEDaALNolrXOglu9cJ0grBXFc2nMCFiz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841660; c=relaxed/simple;
	bh=gBFBxLm8HkrP6Q8DthyOwtOjSWDTaFoDbTRkrYjC0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csK3D+mpNCzko2cpbs12jf5cv/S6vXH9GG74/osm3WPeBlavSfexfXlVxeWCR4VqwUtjWeZo/ThDjYh9Bx66nCXPUqwY6dLut/kPNz2lnFVf4sgnxfbYmy2V37ox2x26HfL4cZPKMVnyh2UQhMH73WMhnIfEf8mb1U+1Q+znckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp3fjWl+; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp3fjWl+"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso696487a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841658; x=1792446458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=Wp3fjWl+JaP9/5sMmj4HaTG4AWArX95YjxrxwjLkpb9imY30dUvc9ST+Eg0slPPuZG
         QBGzVEsA8TY663YMpP0M0JpM+wFR+y/TVbmh1p319HogyJtzLqyO17GU0RFjWGlYLlqk
         bONZOrDUZjIa8X3g9GDTWuwgI4t98o7Xx5VpPc+jELtck4u1OC/3ChWxdx6g2F0XMeyM
         S0eYCOnD4aJJr0iUmlfk93JF+DLs4Kep0EYdw8aqaKVyb6+rlw+VXNXnQFqgswmawzdJ
         wIjSz69B/v0J0LXNJUcanCOYDHf2zWZBPalbRubZBmxRVyzFj03oiNZkUyT7F1VgF45R
         GkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841658; x=1792446458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=ywRYUYTNxhdA90XKz1P8n6ue3GUU9imC4mgqWbQ0mSZ2BHmnCRRHwKTHW55870S4jo
         XlcufLgmTHFoSAJtIzLiKt8xQYxKljF0gbQfRnckcwcelQWv8f58LkbihGcmNqjs9HZF
         9nX100m/y4jCo1gQTduGq1X03UV5vIN1tcPb1AOnRfLLmetyM7jeRLuaK+Wh0ilIk1Xc
         1y3sUc1TKSnKINsP5B3G++PRk3kCcoqx6VqgMctsQjT0YKrI3dJenoEn+QXesbNoyPAe
         CvlCLAcc4jxyxCRivfy3u9b2I4iJq8HEgHWs3oK0PSZ0/NEa/sWBA0lbgfG6G4Oo/vpU
         ZRuA==
X-Forwarded-Encrypted: i=1; AKwUvBzgRRVM2Ah0BIO4zx7OtQcxK5FV9qJ9OUBNXMA6pb9YgAH8VXKyD7O0uj5Foh7yv3YiO/AK2lY++KZ8V3yD@vger.kernel.org
X-Gm-Message-State: AFq9FYKkNUXOeaqYort+C6V4AftLoHntWia3+vNxFIyS+Y1Is+Qyvvph
	301KxdmgBdq8xX34XD3WWzIUATNmJ7l1EUsLMIu7dF0/Ku+fR6MUQtcq
X-Gm-Gg: AYBFou01UCRTfrLn9cO9RoFXtY3+7trmqFIpLYKP9m3AegvSPOUK1GaZPIVv9OwsT56
	Aao+14wSgF5hNUMbrVqd0kXJFYITLPFjk/Po0N9yJqCEwszekUsLNiVLPOroJLYIpLg7lcVL1L/
	e/7bwojCe5uZbfXvGkB0iFTp9ARPtgRJdustXy5rIY95v3dp1WNIeyNKUCcVAg33bOoovpvLwb7
	fcpUsPj1b7PtHSPWJwS7CdEGfate3n8CZJseSqQP4h3IpK5anj5vOouLTUo3KtNOfniwqW8tEHw
	PDCkxoNQzmY1iJ1MT1NFowBMkDiLl/3Nc50RckNeuL76IyvJsMGLktYL1EPCflLb82ZQeeV6n5X
	j5ag0IvhU0yF/vWthWFkWIxOXgQiO6C5GaFY4VTxzVBBUN5V8rgNEwkMThNrLuw6IV6QWnlZ9Qr
	kh2QgIe5X/Z+Ie7M9If5NCH5DmSEzVa6UKSADYCEgGvUDTKytIv+7Wn2fNhJ5N+c62kr90CvQTG
	QPJLNWOp13u5j9v7k5A7Kdxbuh9uyXmb/nZYtLHO3Tk1WLc+BC+He4z5n3eZw==
X-Received: by 2002:a17:90b:3b84:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3ab3a4871e5mr8322337a91.7.1791841657487;
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5adaadsm7208435a91.0.2026.10.12.14.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Date: Tue, 13 Oct 2026 08:46:57 +1100
Message-ID: <20261012214658.357133-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The sensor is reached over CCI1 rather than a GENI controller, so these
nodes are what make it addressable at all. It binds as ov02c10 11-0036 on
a Qualcomm-CCI adapter, and libcamera enumerates it by the path the node
gives it:

  /base/soc@0/cci@ac16000/i2c-bus@1/camera@36

Both directions of the bus work, not just discovery: the sensor's
auto-exposure writes take effect, with analogue_gain moving from 96 to 199
between captures as the scene changes.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
