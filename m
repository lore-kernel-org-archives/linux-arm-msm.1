Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640076;
	b=oezKK5Pgf+nJNYXQhRv75PWyuoTONYxNqqD3aLp89LXaK/AvjSyzSElxF6YUU3fqVm5N
	 lIvJQNoSjpijpbQUXmGMb4YCzGoKfBUJYCQjDs1yHaOptQETit2i3AFnTjvUvSC9Ww+xf
	 Ix7/J98SjXjzgIUzxyHJSsOt6VW5eJKNxMYu025mGonYDGYaIKg0LfKoZgeKWd2JztxIU
	 tOViugioi2UHluh4Gmp6VcxhpEryfiptZpi3SgkGxSuF8EDGuLR9JTPzyS1AJA8n9nFUy
	 Yf57Hq8zho+Tbmk0afdMbHxiftuJDQQ/Upm3BDwJFLKlAcnY3ssTW23zAfEBRuFJTbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
	b=jDa9UjVmEUCmENfnuKIzxAq+rnJrHErx5l+g9zGLKOl7WHtS7c+wFUDnmIxcQpXpo+Jo
	 F8hdh3u8OaegYS9rF8XPe7dpfOTcwRWVLJm2a9Z3OVUCOg+4OTV1QXfwIHt0OGfJjNRgj
	 hijJ7v61Gb4u8O9HRtpiY3p7qUzNplolN5VcvKMB1Hl5Nz/GQmg76Vj5gccLOPIl/jt8a
	 A+sdTb5bmI+xQ+wrlsoKHN+xInNbnc5Y5zEFkg3SfrpbSLKNt5SPP9m/uEITMSdHMdVV5
	 WCfl03k477sfMxUs08g6jKq2zy6iMG7eBGY/ZEwYepxLYwiRAGClbBKg6/klOKmBppA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="XuE+/R02";
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD8606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64AD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XuE+/R02
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so501999e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640073; x=1796244873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
        b=XuE+/R02Z20PbA63OtcZhpCbYLZKc3TnXmHrajI3qhNr79zzfqDZPk5R8HX6fNoV9u
         jKZDFXmZ30Spk6z9NRVdHsWTo3Eh4Bjf13sLaAltm1du7Gsg1I+X94DjwkhG5hjEEd13
         6MM8/X1x4I4wwliWOV4CZyq7GvuKryi3HFNDiK3I//1VeXEI2fIKPJnIocsNDfHZrJ+P
         XFJaaP28+s5ENtYfsbU/FmOadeQfOYJgCWE+Nz4YS7YzN06fOYqMQMOyBJnNbo1H9vEs
         hhwxXjfA/trvWBDbjZLUwhgMwDYTI7zAwJzP3P9u04AMgia1y1JmTdryd3FJ6YXbG+DI
         Y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640073; x=1796244873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
        b=NfBa6Vxzo9NZhK1gS9tOq1+Af1zbrw8KbC4v+iAnwmKDgNZAeYgwnn2LkPZsDLrEgv
         zz6yg/+DS8DY0IRNgq4V0vGR5bEWAnJFIKw8k3uaZ+TS4UZ/Z4joOOn5wBvo0VSXrmr5
         Etro7bhxiO19oR26zDCQccmV+Bs5A9bZ4XWLar0xCfS7fpSJVMS2aAHfq8vlNOxVvh45
         IWuCNKsFb/olpyPkNqT9v3zR3BanU5RNan36DwMwuqDDDNc0EVrimT2Gl7z5XcBv5fkK
         I0CrHCaEfHzst1FDCzYrAxJeJF0SoMyw6dSEPsUzHQY0kukwfYKOSzWq0ou8Ehi0duC/
         ngyw==
X-Forwarded-Encrypted: i=1; AL+hErHSUI7W3rjzRfOkHw1h5KYQ3Fm+m6OWVEeOQo8hb/ilnZePr2HqKzy0HA5Scdyf6nXTmbsq3CV4RN5X2WaD@vger.kernel.org
X-Gm-Message-State: APuU4Z8ARX9XZKZaaxPVskwkFj2HtMdwv2l7G06gdb6Yvi4/+u94VUYk
	xOzXVoW50IbTFQ1+QqvHWOtPdvqRhGw8U2bJ1FxX9GeFNfYg9GUEV+3lkM61PIzHnKo=
X-Gm-Gg: AZFdTZd9Z33+/YsnwMKS5FIxsT7M+Tl+IIrPbup/6t7C7yBPmnNGKgIjevlxVQkyNUU
	/dqn3s27QvRkrlTrzWhMTjaxiObTPAdQkb+uECdvU6RJnWakPLq76Mys+WMX61UtCuiTuXpM4qm
	IpU6JM41oGiXOcM0iW3u6+tqvamymsA+lVwX3D9dNQiA1GzRcvfWAzGpOj40u08Ausy7vhVswHJ
	KoPCBjSLO8jxpczAyMZwJYnNrYhhIaAlvR2BoKHA7u4s8EHSMdcfWoYdm3omcWLS6SzTZ7f6Ygv
	+xu3n/wLUOJr+1MS2FDOrMnhpaEGzEGE+xx1RGZecGcPl9W8nPHXb+e1PNW6D4Paaegw5IvMUFi
	DOUrO2TsQ5pzeY/MjaR3oPHuv1dZKgbb6NZBwZUTRueLiI1cnkc/7r2sidW8kCNB8wrVjkL4RhI
	v2pX07v9puFyS4nToUW0k94Z5YOM+EI74u++stJxGO+wvxn/1GD5asmsTox2ZkRATUb43f+nkPs
	QQ/s7zGFc0WqCT3ilalZG+6qmlXpqCk0/DlxL0COUnmosKLFNElSUR9B9NV/Pm1whzl3bnX/hPB
	xGcQQd1PTVGwDkkM9xCjrpyTYdGmjyg2dttKaeLD6ATybvj1WrYSr6StNL+zStIWewIGDg==
X-Received: by 2002:a05:6512:304a:b0:5c1:57b9:90d3 with SMTP id 2adb3069b0e04-5c1bc6d29ffmr6044057e87.1.1795640073506;
        Wed, 25 Nov 2026 12:54:33 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:33 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8650: Bump SM8650 CAMCC MXC vote
Date: Wed, 25 Nov 2026 22:54:15 +0200
Message-ID: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
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

SM8650 camera clock controller PLL0 runs at 1200MHz and requires SVS_L1
level of MXC rail, but the CAMCC device tree node has no required-opps,
so the MXC rail is voted at its lowest level only. Add the vote and
make 'required-opps' property required for SM8650 CAMCC.

Vladimir Zapolskiy (2):
  dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8650
  arm64: dts: qcom: sm8650: Add camera clock controller MXC vote

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

