Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C12549390
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704228; cv=none; b=ep/x+G+iV4jNV0pnUAFG3/1R7cAv8Py74uDFXiBdjdJR3Kdhg9FL+dU31oE/wOVGUmlaHj5GRRZGWGwNrwwnimWuPbCEurC4A1xSFLj6ayMdQXP9IaMQnDWN1UWG4Dlc1uCXUm/yOWUC2YjoMaBDc5w9gspKqbc/IwfJxVdJTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704228; c=relaxed/simple;
	bh=JXImq5c8d89U/m2D0Uk/1rvyc4z0Deo/xtJ4+3h15+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCvsZfRKXO/tAYCM5ID+MCu5B7ha9UlN7KG66pgejDIKm1Plk53HVvrrOZCqnjmTRX+ARDQJ56ZBh/T1mhJpWTWk/CzmakLupB8cjgQbP/CEHu0f8vihE4vmpkmWXwo5Bsq4MEidWbA8d2bcmDX5o7TAfq6lTgQlFts+7QqBMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwZK7k/p; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwZK7k/p"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so34993565ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790704227; x=1791309027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DurJlfglRtxfoYGfZICWlyKpb6JqelzUeYbLyKTge0E=;
        b=nwZK7k/pi5wpfmk0Dv1JRUxyqmycxpgCyyjjphmtXnyjhbO8L+v4BWcGuBKKSuCo+S
         8esrjbQYRMB4q6+ZP+hl/9xF6zfwQiKrGP22++XbKa5rTWJcNYEeOqWONwTgqY5804tu
         U+3oI3TDd7lycXPq8b23LYH558Gqplrbkyo2KeMgW95FeqXwl0+gg5xoORUsHVYzyafC
         ghvhZKKNe/RI7EyaR5Sk7ww20CgDSA1Yu5Ps53qsF/lWH9LKHtbAWl9/mfBXzM3qopkO
         91H21ohpWOltvc2DUwR4IzBdPZZxDw2cF/+MMNKAhjLWaZqWzfL9C3ogY4xPDfHX2006
         NJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704227; x=1791309027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DurJlfglRtxfoYGfZICWlyKpb6JqelzUeYbLyKTge0E=;
        b=IaxAtKZqdeMhrE86epvr5pZwUvWOWeNiRq+QEhA8pItZr8XHSIYhlwA8AsbFjAb72Z
         4uP9K8lmCDrlzRjYm7us8hi92qd2RxYhUHzS8/RR0/nSCwBgImr35wKNmNri4CJE+cL8
         Dhihzsyl+ZRIK96Zr/9f9RY1b+UaaqB43i/emz8Ht65FIcKujX7ubdytsvuFwqOXwIGe
         WMM+EUuAFsu22Cly+h2gwbXVeMVIgmUvmDUjwodmn//oUrA9L5ALkM6k3aySrrArYok9
         XbgljBIoOfD9CQP8Ui4rftxKKp53KM6zrIE5cfsBzwhg3P2jB8Pgm4Ntsg9f4xGL4NGr
         T5vw==
X-Forwarded-Encrypted: i=1; AKwUvBx7UC9PbG0ve37MMK/VdPc0qmmAg8+lpA7sTRtt/BpDg6+FCUB9vZI7B2LZNrJyVxaxZdO+B+eANbQVg/g6@vger.kernel.org
X-Gm-Message-State: AFq9FYJFuZ95i+yx8uMBNKgydPd8yg4Ya53I9X2HkHz3hC8uvfuDFBFY
	Wp2zUI+/7mkdZZXS/Pdjk15E3ZfuXsLTrYv1on8sH47+TWq6Jbib7+em
X-Gm-Gg: AYBFou1u9FE4Bb5rvx8KZ5fsmK/oDK43zXK8mGjmgP8z2awT7Q1VW69/srJMvici/Fj
	bYrNZh6xhnRhXfIcroSL9izoTIgURubBD/S/daAZcs7QdX7Wr5NZolvU43NG6DnXqqb7UBYVidP
	IE4nSBKgBrBmLOTJs0VEy2mKFUwaLp6wAA/FGYION9a/S+5MweNAnhrQKk5hOln1AU5GPBbki3w
	/Hjxqy0JKW2oatGVSnUzDtpWhKV0ZrLrzzHVpIR+cJ8xjrR/QYGdJa0N+RwP9jCv+vgBj0UTKS7
	DfJxikaSwyvLDg48ByfauR1ADJxqnpdGvSylLhhavPn9Gh4hV6s8laLl21ONLJ9FI7TMUAyQxxf
	Tcz7QVN3TlsVx7rvk4bi/r68d7rbwUo6fro6DlvVcf8fAeBEpd8zVdO/vXTMI4sQsGRn4i+/ijC
	k5SQpEemwOpIRPf/tZNIh7h3A9MNGJdmv4G7DgNHtVpJ6n8IPRa4Qx4kKpuJ2GYtCPAx6XZzRWE
	D4iaz+o8LN/cw==
X-Received: by 2002:a17:902:c406:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2df7da5e366mr158748795ad.1.1790704226719;
        Tue, 29 Sep 2026 10:50:26 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c794166fsm15247035ad.21.2026.09.29.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:50:26 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	sashiko-bot@kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Wed, 30 Sep 2026 02:50:19 +0900
Message-ID: <20260929175019.3899-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929132029.911491F000FF@smtp.kernel.org>
References: <20260929130627.959-1-26rote@gmail.com> <20260929132029.911491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 13:20:29 +0000, sashiko-bot@kernel.org wrote:
> Then, on the next plug, msm_dp_display_host_phy_init() will silently skip
> PHY initialization because dp->phy_initialized was never reset to false:
[...]
> Can this sequence leave the hardware PHY uninitialized on replug, causing
> link training to fail and the display to remain broken until reboot?

I tried it on the device (Lenovo TB323FU, a DP monitor over USB-C) by
delaying the unplug handler by 5 s and forcing a detect in that window.

- A normal unplug already leaves the PHY initialized across the
  controller's runtime suspend: msm_dp_hpd_unplug_handle() only calls
  msm_dp_display_host_phy_exit() when sink_count == 0, which it was not
  here, and msm_dp_pm_runtime_suspend() does not touch the PHY for DP.
  With this patch the controller suspended after the unplug, and a
  replug 20 s later trained the link with phy_init=1 and brought the
  picture back. The controller's runtime suspend does not power the PHY
  down, so the flag still describes the PHY correctly.

- Tearing the PHY down in detect() when the sink is gone (the natural
  fix for the scenario in the review) made it worse: the next detect()
  initialized the PHY again and hit

    phy phy-88e8000.phy.3: phy_power_on was called before phy_init

  and the SoC reset shortly after.

So I would keep this patch as it is. detect() clearing plugged so that
the unplug handler returns early is older than this change and is not
affected by it.

Thanks,
Joonhoe
