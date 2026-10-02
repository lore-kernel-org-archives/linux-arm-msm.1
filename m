Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64368499F09
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946482; cv=none; b=K0w556WSrNItV62e7121mYvPhFiszV4K+5JAbHEDD8Pc4pBDhplKyBf2usfZSTcaHP/f2JiKS7v/Km87EtcQuLgyrbXvwZw67mmVSMPu7rRGhai43qJgcrz7MuRMPfH3tYNgG6ek7VT9ksBIGQRhFno3SoZukqHFQv6zSyzNO7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946482; c=relaxed/simple;
	bh=rxlktV5QmP9O8gmeTAM7mahiIUPXqUp0GbzhOcDZy1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NF1+pBNGWuXi6KfL0KyCZc+xrOUGciaMjCTLsmHMYKg+pgtDmdSiu5SO5dZ+JQFnTO4a0ywJd+Iz2FqEUzMIwKbZNxonM9XQ0FIKWOZKRdw58a9v04Lph4fkBTZIkXbbUEEl6xplH+FssYyYenxvPUPZx2ORZsT4r/AGIX72oM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4jOzodI; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4jOzodI"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8686f46e4adso4878600b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946465; x=1791551265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxlktV5QmP9O8gmeTAM7mahiIUPXqUp0GbzhOcDZy1M=;
        b=a4jOzodIf7AbdHcFGOXqNHnXfBkIMk1Fh4DSxcbF51/IIUocJ4c/CVh3qlk5zCmLqR
         tylaHylzgUOlthkPWCEQhMdOUDDl+Tf+jcTXDVkQNhpRyq7irrC06D5Yfnp0Gdr6RHD1
         GAnjfY3m39rRgSX3/tOYKPVvULhjWeLncyH//MPBjd+h9jc29J5SenYtbKK7dngS9lZX
         rGDrT/aFbtenkHBYBqM3hQWYlz43hyCgaLSqy4feGmecrpmeNSqHaPsCvX13kzaSasPZ
         tI+AsnLgwlxjtj9vCpk+8HjqR+quMwyuUQJAUa6jGaU4DY0H6vfz9ougQfGPUmjqsSZX
         venA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946465; x=1791551265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxlktV5QmP9O8gmeTAM7mahiIUPXqUp0GbzhOcDZy1M=;
        b=GcGk6Yy8ytkrgfDmCiIo+EWICKYGWYcaUoDseDJUC6LwuOLoELhQ5rIgSdUsR6Ceye
         OeyLc1X9Jv6MjM7GLkNJCDCYwiLUSo14X17p0vGaHG2oO0O3bhJnRUJ4JmuiGKFhb7d+
         UshofXd0pT+ryiYZpsIEN3WvcMoLCsXf1XVxNSE5r2ZNEYILUB8JfQGhTGhFOXpbJsSD
         SHCvmzF49rl60m0Ez7oaJapJKkcD3oDbyKsxEOmYSfn0t99BU2FUrPxfQGqaV+CNePwG
         dmRj3w23paTP2Sp80CVeI8wPh6CjHcW/lLr8nf+6DYPJzTlpxDz6zvdcXEo9pa49dSmE
         hDHA==
X-Forwarded-Encrypted: i=1; AKwUvBwJnLce+r+f0pbzV8NLQ2McuN6wKq7y/PlsEMUmW0JHuzrb6DRgIAOT1ivAXKTzsEmeQJducclrzTVX6CFA@vger.kernel.org
X-Gm-Message-State: AFuF++lFWS5biQl+PkUpU/WsZ4Tvq4kOA2w0mZgIkPi8+4wkw6Ul+BeB
	xUdek+8FZDAL6kmQdIYvtZf35wGRZ87n1rWKNc+tPiNkW6mRKdjITzUT
X-Gm-Gg: AYBFou2FKYjtkeHOarERvkQDTCzXo+AdNdYCgIqNe3cREikb4Po5z2E6XOLNnfVc/Po
	8tW9YxVxk/6XCWapgWSFXlQOj04NiuIkBmZBS+NKD/Qn0haK4MF2f0xNUY4b//AN9OcqhCl0Ifr
	ROoqAXtRdoxcmJZdKm73qMDL1eL6mvdELl5qMdoQfCoXlPVyhITHXzBZGZtjpkt3VTPu5gQoFLq
	P+VmL7lCFsaB8zNzavT6pkzRqRAyhkk/SC7B0wn9pP3FOohf1lLZ6LosXgfNJhv6Rf3EmeBVBDR
	9yB5Lapn3gpZZc88TkiiYNUd4WPE9HZcY8phfNyOTYhbyH6dQpe/rkYvc7XpYwAtQ27TLEdU9lv
	jXPRfD/y+mSVODIkfLTpvWTuRhSxbrUEKyXF0+uZvzxeD3Xv9redqFicXqKrj4BM2L5tdh2XbSe
	za1PRubjXb94PAC1zEF69wbkk5szjkAoTSwR1cM7E+x5GIdeOtyQYJs8PaN7xZsP24g8Y6buc7w
	XovLWYeUt5wt8c=
X-Received: by 2002:a05:6a00:9285:b0:874:706d:856a with SMTP id d2e1a72fcca58-88af7aade2bmr2356719b3a.27.1790946464816;
        Fri, 02 Oct 2026 06:07:44 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a4862sm853157b3a.32.2026.10.02.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:07:44 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	dri-devel@lists.freedesktop.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/msm/dpu: stop all video interfaces before cleaning up a split encoder
Date: Fri,  2 Oct 2026 22:07:41 +0900
Message-ID: <20261002130741.50757-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929131840.DF20C1F0089E@smtp.kernel.org>
References: <20260929130621.943-1-26rote@gmail.com> <20260929131840.DF20C1F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 13:18:40 +0000, sashiko-bot@kernel.org wrote:
> Could this result in the vsync being permanently missed, causing the wait
> to timeout?

Yes, the window is real; I did not hit it in 13 cycles, but nothing
prevents it. v2 stopped only the slave interfaces up front, and v3
follows Dmitry's suggestion and disables the slave before the master,
so no timing engine is stopped outside its own disable path:
https://lore.kernel.org/all/20261002130712.50612-1-26rote@gmail.com/

Thanks,
Joonhoe
