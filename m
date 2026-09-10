Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F43B1EEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065197; cv=none; b=HR0BjcEIraW0PK0GHKlCvn8CZ/ywuVewx1ZS6Au+QkNLkK6J5usExkA3X5lXRaQHeYGor3VqWfXb0lgk/yNLJkKLFdOMBvhDQN/QD84EdwhhXTHwX0JfIyAPdhdsHtW+pmfu5iZzGgSdGfNyJi2oTUzugMC4RPk2z8upWYhm83w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065197; c=relaxed/simple;
	bh=RD1JdQ4ANBusO8i4TEYoR0PsbDDRPyuOySGPUMHj/vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecPLmdk2QQvx/eP6BikTuoU0xytz0J4PhKgTQ2QOqEcxOYSa3X37fc7CQcDEW61ARGbw51X51f6dOugRyJQheDTf8D7xR0TqKxScRY/d4rfSjlFF2XWQwpbn30Z502a20ntzhkDbx9i7L/e073E2WEXN5r2CfBgm34NuLPecEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Jx7X37; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Jx7X37"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso1708675e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065191; x=1789669991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECgfRQeUaZbHy1kJ8X3Qsii4ER4T141Iol6nIkF+8Yw=;
        b=Q1Jx7X37Ig+1J87o6B75Yql4oeZGe7GkfdAnU/jksSLVaZdM3x3vpp9kjJpnl6Wp4V
         z0F64f25ml8uXauMEHFFct8kDI0SC43qpIbIsCPzJ0qhd9quzgIrVHRk+kzQhy4Awjfx
         WGrABtDx0FcDybuoY5GM0IgGgCmmFzBS7JL8WReRVS0YFuAs9oJjTRrYzvjgCviM6Voc
         R/+z/DJenTK3jGooc4GHc3XBlbMoMusP0VMsXHGynjP1+2rfBIwCiWnPC/EuEBixbNKD
         2DmKXZH6zwugswms7jXUHU/4Dlr5eqzypwCym2cDe6AIDssb5UM1uW8T3xjfCP4Grtt/
         Ldog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065191; x=1789669991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECgfRQeUaZbHy1kJ8X3Qsii4ER4T141Iol6nIkF+8Yw=;
        b=mH5Y0uQvvlKoQAv54rNc169oHeKiyr/QgUxM3E2Hxx4XpyPKMR8IrjowQNrHQXd4+M
         Rjxr8R3811EdFdSeIkWz1NRG7AoZaRHeNC4rpk5Gi8y9yvejaJ6qIZoM3vshGAfUQoGG
         Pe+ODjlZ/fL/PPqW/km2tdAGZg4j1EK9RuXFn+X6dgjItpiuDadjCbIZODn3GPpq5E2J
         gUZdjOzFKkQewzzBJhmfZJqctRZ+fwLQj9HZx3scZdCw+VWvPGUI9/RNcsYaq3Iaxu4X
         gjrniBSeBHoL3fpiWIUw2LDzgntAd76JdQEypodII7X3X6wRrq5xGkrH9ZtlA7GlYYma
         uagA==
X-Forwarded-Encrypted: i=1; AKwUvByBabTA9qe8fxv8C55b1V7lA62QFmmL4XfNhjItc5Cj647hSwOw9DNmSQjDHKG/RNU2iorE6y4UuUK9QQPC@vger.kernel.org
X-Gm-Message-State: AFuF++kTJcjVpMV5ag2mmFkbYPDUGldZ9tCqMx3GrAjUxoHHAXf020Hy
	24IIrx0OkY5HxFk6uAOHiRG2rrAXoGS11xCfI2xg5zNDbaqATzDWvsed
X-Gm-Gg: AYBFou2PsqTiTbU7xIThH+ry6A1JgDVBnwzoOMLnTeAFNCpnTSgmCypOrWTsUQarVYu
	Ex6WH3JZJ65hN/xRVtVyqcGb20x3p50ym9VcfXI9M4DE0hG3Apun+Se5mdvbBrgCW7poRr/o0fI
	/WoEHVHgxI3PlkpTr1Xf3c6P9HXMQM1ItC3HDg6W0UFarM/Ha1Udrjak1Zd2eQbA4ejO0i3Rqqs
	YRQ942COWtmns6dmP+vF/oOyONZAC83H7ASCc8AM1fsjBRexDt9nEOjlpNdISnWecHZsVnkdCEL
	3OYl7qFwz4kfcpfZe6XAWvVkQUym/BrGp9+MFXjrXHdTgKeBgQM99NbuQCgLZJLMSi0khtyXZoQ
	EFiWnT+0XTOY2Erks1QpwsQqmW5r5BwGsBmOrdutX8CowmeaF/XBBXQzVKnlCVj5i36Cv6zjSiu
	d2I2Ls4WY1ds3ByVUWnl996ZMxW+1PmNEfEZNEh0GDq6qotgRYGV1z/2+2q+XvMhYbNCQBmRLUJ
	NtT5HI96bCwrVfjcmfGwi4SMM6GgiQI8RoKg10qaCPYSu1w1yYJpSF7LCGYceqhfv4OR+nPGX5h
	frzHc7xc2dI=
X-Received: by 2002:a05:600d:4453:20b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49e619c4d59mr2746015e9.23.1789065190532;
        Thu, 10 Sep 2026 11:33:10 -0700 (PDT)
Received: from localhost.localdomain ([41.90.145.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac42b9sm12541115e9.6.2026.09.10.11.33.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 11:33:10 -0700 (PDT)
From: Kenneth Kabogo <kennethkabogo2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: qcom_pd_mapper: SERVREG_LOC request handlers do not validate the QMI sender
Date: Thu, 10 Sep 2026 21:33:04 +0300
Message-ID: <20260910183304.76926-1-kennethkabogo2@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Flagging a hardening gap in the in-kernel protection-domain mapper, found
by code inspection (no proof-of-concept, and I don't have the hardware to
test on at runtime).

qcom_pdm_get_domain_list() and qcom_pdm_pfr() are the two QMI_REQUEST
handlers for the SERVREG_LOC service this driver registers. Neither
validates the sender address (struct sockaddr_qrtr *sq); it is used only
to address the response.

  - qcom_pdm_get_domain_list(): any local sender that can reach the qrtr
    socket can enumerate the registered protection-domain / service list
    for any service name.

  - qcom_pdm_pfr(): any such sender can submit a restart/crash report
    with attacker-controlled service and reason strings. The handler logs
    them via pr_warn_ratelimited() and acks QMI_RESULT_SUCCESS_V01. There
    is no check that the sender owns the domain it is reporting on, and no
    recovery action is taken, so the practical effect is an
    attacker-influenced ratelimited kernel log line.

Impact is low. On Android the qrtr socket is not reachable by untrusted
apps (SELinux neverallow on qipcrtr_socket), so this is gated to
privileged system components, and there is no memory-safety issue. But a
PFR report in particular seems like it should only be accepted from the
entity managing the domain being reported.

Two questions:

  1. Is get_domain_list intended to be an open lookup service for any
     local client, or should it be restricted? If restricted, on what
     basis?

  2. For pfr, would you take a patch that rejects reports for domains the
     sender does not provide (or checks the sender against the registered
     owner of the reported domain)?

Happy to send patches once the intended trust model is clear.

Thanks,
Kenneth Kabogo
