Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40704A0EEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186569; cv=none; b=Vr4PFeA6CpfhnyY9kthwKVeo3z3Bj1QiPgciLnjnyRO+3vIWdu7/Pbw6YZjE1dQmi0cpD8oQ4RbY6rRQT2DlmTXQh4Ff49EMXpEqEgU+XB1SQfX0TUzMahQifP+6wq6GB2VcfpUzpj+uXFYgfqRmq60tg3kZwAKueSVy9IenBCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186569; c=relaxed/simple;
	bh=dYj69jFFjRWn7Sys/t/m3JYBC1fu8Ks5fI5qkXxrx3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cqp8Q4VEy5qekIl4VlSdeM9Yai3cCsgVdoHo/loL3soZ47xTtCzJRJ1ajrNP1Tf2fMZz56/YJU6KeS7rLG1d6HWFeS32m0Oe6KRgpW2yitqP65ScmLfG3Q8gWH8XZFOGTdBHyo3brOQitzQ9bhSY8sc8iDQvNoptwFkpzoxdbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhysf+AX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhysf+AX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso20849215e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788186566; x=1788791366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E89hI6dDsHxKquITrLVBigGlAGgfkia7MnsBoaZjOA=;
        b=hhysf+AX6SaSD38bFEwIGJuZQ3U4y1NxVqT7eg5CxU5iI74lJudY6o74QyhWVS4xqz
         BkUZAodkqHOONBJ0CDbMfLzizJAH1Zoq+bfuCCXE3UgJ9Tm8yaNoMVww+00hDqF/0Unx
         6JKeYt/4ABzaHG1S573cuEc6sS8j86r8Za/NfMpUPJgTl/srqLV6jhiL7VAzYAadNNa2
         VPBfjPZmgUP1fQqGbba75URUKqZraXfBcD4T3Gj947iCkobRKXKdaEzBwmbOap1nSAB+
         NIHGS8q1jA7r4Yvr1oDtDE9ORUPx8NNofVmuAPtsi8qSPGbCQrJ1iUGJpjrzXKhaiuKU
         rGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186566; x=1788791366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6E89hI6dDsHxKquITrLVBigGlAGgfkia7MnsBoaZjOA=;
        b=FTAuykg5rHPyAy5pgVUyYhP9RMHg11VuDLByXgfeIUE8Si3nF5CT+Ht6V8RfWw1E2X
         Mda5/3dfvXLZxKs2axw+RfG1HRzFodrE9NW+xoli+h22lodZCesmFah8VDoNuMnSEAGd
         iUp5T6Tfc+tQ4itrGLF4CdEOaFixsBlGAs9UOqzTgmcn4YLbAaHhGLIsvyyEzdf8GAi4
         WyXCNBG86Jva7T5yipdqGqtpGXA1vj97nJZBd8PJtdNssjq6Egf2ARGuyISZcuIjyD/5
         Ghe3yhtGh5nrSmD48u7dARLSXH9QafJE/pjFKGc0wsn0KPi/n8MxMN2kpC7LW7Z9n3bt
         lVFA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3KJ1G+IFhAVLC4+DTVG1PefwUjpy+sA+fRf3A8YcEqGuX4/IGt70c5chBPwFKwPzE8SmA5utREdXKIYCa@vger.kernel.org
X-Gm-Message-State: AFuF++n6dDT5SdvWnCTiEuqs2mU1vwHOWf8d7oraFDrlN8WACoaQXeXJ
	deH+TdJKoMSOYdORx9JClcuJT2COxvLa8iOmkMES9M7Je5xN1qEqGl67FiqzlwxvQ1c=
X-Gm-Gg: AR+sD11ghl+kfoYm2XbjhJyeB/h7Sw3Q0s2bdH4DQvg2EsxTYTBzRXMlXf4ZituBo98
	YEcuTShSRZr81I0uxZFh00mUQcAqphTzrPKIyyQDG9DypIQfiOT0TtBgR1SkUhvdGI3AybUPVAx
	BNV9Nx7JzLd06DWSFFpzDUeXMjAklz3nBQzDpLJ4wOFz/W09LCSlIZ2v8BmLTd2GG51ws7WaFAf
	qG94ie/3KZhYgf+HkM6VtPCROvHHoOUqQpTlfiJ3vcS5SG+sd3VgPdNbNmJ35fRrK3dm9dqDzvU
	6J+KU2cS9hrQTkQAexyq73Q2YbQ/1VVAJJg+MGioXquMfCsQhhO78AgnV5OJiQwAFqLE7iebjMN
	l0u/U/QHF5V3J6779viVLQ1lYOmVLWeM/z6X51+/je18iAuYQevrx128Xv47krTeC99lnz/P0KZ
	EeLK80LtGSM6l3STG8sshRhF6KAPkDX8MYXYBUwQrebc8F3xa39n9IViC4NhkmrmMw4kj5Hh8ue
	MU=
X-Received: by 2002:a05:600c:1d11:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49b91c25414mr366990155e9.7.1788186565847;
        Mon, 31 Aug 2026 07:29:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm145266605e9.2.2026.08.31.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:29:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Junjie Cao <junjie.cao@linux.dev>
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 mitltlatltl@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260804073419.84727-1-junjie.cao@linux.dev>
References: <20260804073419.84727-1-junjie.cao@linux.dev>
Subject: Re: [PATCH v3 0/2] drm/panel: Add support for Novatek NT36532
 panel
Message-Id: <178818656440.2615924.7721380988384497454.b4-ty@b4>
Date: Mon, 31 Aug 2026 16:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Tue, 04 Aug 2026 00:34:17 -0700, Junjie Cao wrote:
> This series adds support for panels using the Novatek NT36532 Display
> Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
> for MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT.
> 
> The first user is the CSOT PPC100HB1-1 panel found in the OnePlus Pad 2
> (OnePlus Pad Pro in China) tablet: 3000x2120, dual-DSI in bonded mode,
> DSC 1.2 with two slices per line.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT36532
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1c523f0a930107191c95d96340c69a295a086e5a
[2/2] drm/panel: Add Novatek NT36532 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47b823940e38607dad180eb2f82094ae65565a4b

-- 
Neil

