Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23FE535FBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074612; cv=none; b=GWWyhtv8gTCLs59H2TOACHgvEZP6e/KSGmNUGxbNs6ElSQVXkqVFdig7SgsROQzLp0dm+B7+C2yoFOJjUJRYB6IbGUEg1llzvfAMLRVq+VOE8VIXrddcpt7JObEsvpFf0BRSPGcVgxu8F0LOVwRK7y3l4EJOXkfHerwRHg7CqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074612; c=relaxed/simple;
	bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CR4X5FVELncHHl272s0ecEhsxIk9O3KJhdNcvsnujSUrzBJQe8i9wHa7adbc5ISVio98kXOLBYRyzoFo2ucv4tIxT7YNf3yBE/6n5n+o5LKVNsLIG/+vBVfZGzg9ARZIStpifPU2V+jPEDGe2VOdeOduw0mYqbZ4GdEOguatpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc5zusmJ; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc5zusmJ"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35611so2593696b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074604; x=1790679404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
        b=Xc5zusmJ1eWaGLIjBC2u9R9gwo0INyOkC3WgJhsX25ETi0brFfnUbVvClI5XbqTJ1X
         sZ8RtTrcdiENGehZOawo6b3Do8CPG7cJUTEsrlyNYEpurdXXVjg/6nSi/SVc2rpj+2uo
         rKmVp1JaYLzmCg021O7GkcoOFHKjKsWgNRm2LEW0uVdgQWWv49Ov3R/Y3vIO+yGZE+to
         Si3c+OMlWJ99apZqQFOq/JZP1Uoa5ffJUj7uPUSCWImiAgiZvQdUrF/mz/DEcslod/cY
         QeEYS8JQNBs21uY9NRqS46YyZf+YAQSTCxZH4BIClIgcOHMtOplIW1T2OmY+iFVvO10v
         aSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074604; x=1790679404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
        b=POQR3xEDokbZvXytwAnnokjkxU7/X0m13rQ0QGCZ8FMRyYm4gW8TFAd8QQPcl1FZ7M
         Pd3ysdmA2ExRmCwOCsWr9LyFcUGiX3AD228RjAULSjltevlYOL1zM2uP+2kTyO3oPi3e
         osbkmL2Cimzt7eF835FD7tWkB8ICG8sJ+QXCaCiwHFrz3u929IIUHkkpcp+6+giCbsuJ
         uBNO2/c1DzdVgutzI1XZO4ZPUm8DoxtxLSGVnhujRXb7ztDmerKlt9EKkE5MdcHaWj9O
         fQagQZPSHG6b58TjXkg929q7wN4ROIrlTOvw6l6CLs+szs4ITrs+DbLzg0ToRObbB7u3
         N5lw==
X-Forwarded-Encrypted: i=1; AKwUvBzlLfH5sWaFlL76OmEBrjRFE9MRBzRuOZZVV/cX7Ew4EX0qG+5tIl1ulaeEEN3386H7unEZ+NuR39FMxXz1@vger.kernel.org
X-Gm-Message-State: AFuF++m6JzbHAHdoiF5QGyH2M0KflC8Kk5vaCLkpPQQD0v8xclRT0QOc
	qTij9eMVP08W1KoUf7azEAVENWzm0VsJRYJzCYErieGCV3X/0RWL9ZyR
X-Gm-Gg: AYBFou3/dEWkWuVnKVbrht7UlyyfQPRI+7ls5Q1uiGETvsH7cvAF7x8i9tE0JkX7Vl6
	HXuL2BQ0ZFSFa7YT6qN4pHyal5lVAuvW4HWClWXye7MmOjKjKsjO15VmnLNMVlT80aZKwK1N32H
	/STaxEZcWvlQP95EolqFI2YOKYK8WfocGnUUfqdGOYPRR3QnFpSWU6POzbGFtUPZbPYfM8lCjIU
	2oesIJuN0uryV2sAoUd8gzUuXpj9Fqx/Cfmc5r0w8nYleDLKZNKpBs9LwkVIYwFhFAzk+Y+yqM3
	e6nmaPcgkyqoHLdKED5RLFuQnTdYGWvC31ERqL7rXTbsoGD62EcVFE9vq/sml0sYuVtYffQ/sIW
	/hW67mDOB0QT2r/1lcGaGi6Q5VPV/5G18Z0FocmB0OdMUZ8MA7D08qJI1y5fyZvSjA/8RkdJ1ZU
	teWqhjayTULweUfgx+EPnzzjzc7A2KaVODXWirjjcuVKx+49CuI7Y0ohqInEDSDz6KSe8Lby5eh
	9oNLTHPaMt7+fm9cUAym9kjd2Y=
X-Received: by 2002:a05:6a00:3001:b0:872:cadc:bdf2 with SMTP id d2e1a72fcca58-87c81ec0039mr736727b3a.14.1790074603769;
        Tue, 22 Sep 2026 03:56:43 -0700 (PDT)
Received: from urmom ([1.54.70.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c2fc4baf1sm653791b3a.6.2026.09.22.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:56:42 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix error check after devm_ioremap_wc() switch
Date: Tue, 22 Sep 2026 17:56:36 +0700
Message-ID: <20260922105637.1684691-1-lucas.sproule.42@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
References: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Gentle ping on this one. It's a small regression fix and already has
Konrad's R-b. Happy to resend if that's easier.

Thanks,
Lucas
