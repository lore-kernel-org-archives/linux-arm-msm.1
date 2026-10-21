Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570670;
	b=keDNW/a5M1psheHgF4VehgGCM7dr2xaoNnhCNwtZT6SVIy7+q0QZSBixJa/cQjy5JCOB
	 jN0LJfX9JgPX9XQuEDm6JdJvA6CP7/ayyU79XieFwehnQbKK+rv0w13E4h7tZelGOBNuo
	 HgiQXqdqudqcIbPja2mSflJlsY+zV6noxzs9wiwBzqVnFao4vhG/yDsB4s5el22p94dN/
	 1AkTgoa2RL97oHVKfJgnlL9NeKXBn5gP0Hgc7QYEsICCVnmH2mj3yhuMqPRhIoPv16goZ
	 3RQV1hzr0PD+KQ8RlCNFeZKJIx2re9P8fYuMQkCj+Ih7UowW9wgN0bC7/PwQ46Yj/Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
	b=o9HLc/WLNsvcAPJZP0XaEWqFS3MbUUx99hRdtYARfIfGWNF9VR9HkttCddBetNoM7jOh
	 Fhz1VXnF+MDhWD2z9UlOhpv+UfiUNJbHMLnmOSgBGmaL7tzuzBs/7UBSNpeIp5UF4fFt0
	 qhp0geN1WAk3g8W7VXTuVk8aNWvGdhmk039QbncC13rBYOxXMsZ6aKTyvsVJql+bxmMyh
	 ECXnlOOKvzUwXdU9iJSDlXfUgliQxcsMrJLUYFXC87K4Ozt5tpKzJ+xEYUBbfsrZwsQr4
	 jIeCJo7o1x6XBX35YDRXUXypATQd+Q4i/fktc1WzJFE+N7tPTe4mKSqSzKDOVkE4g2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mirI7PiO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2391606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2391606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mirI7PiO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2720465e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792570668; x=1793175468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
        b=mirI7PiO+XQCnRE9N2++lqKfbCgF4FIihHTTB/M7TrBWGcq3wpgYpoMSN3hceX3LnG
         JDZCnd0E3kMB3z0yDlgrC56wFFPJn5UjWEDFE8xkymQg2ayJkFx4exex8WjtScOXf1Al
         J3ZmveV+/R2sTIqs+9cDwbpclvCL1xxyzyBXYXrPFEvqNY22nf8iU+gHd/k185UE7jDm
         xewVjy9zqdK9bhcAcLxjdWVWVu7Z0uvxnJdqTIKFRgDALg7hBs5SfMS30GabrjjW6mZf
         M6RWANTW3NZ64pI7VxNMBo7el1tQT1o29hbR2RjduNHDsEc3N2xJgpNPqkie1I6Znsh3
         Cs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570668; x=1793175468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
        b=BCSy01+QUTOxrTMqfQUwW3xSV2iFI+3R8WWn6XQdFlubmQZ8qUWnf4EddOUZ9AjLSe
         r+vkPoaNPqvihYd0f7Ji2h0FyvWpjCzZ6lJvYHPGpZH/A5sdJdRp7EKsHm213R6fOPdP
         OzuyoYfoWVS1rQ69KARQKazt7nZ2JmDPaEolY85txdn1ov5q51RhgOXoln0dgkIWgucZ
         yJgrrautc/ALwQ63UsG1Wlx4LL0xlML9eO+lc5stqVfsAlhuJpm16fK6dIyQjHa9+HL4
         eODbux/oLVN+06J7jYxOqtNVQxaLiIQjC8aasdZ3qhFwsCVcB1Jxj1hHzWbVpV/ypF0f
         2rZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBg9rlHjQ9aHiw+Qb2rNTbo953thjMlQ1iOYFI1mvCB6UCN9wjhEFQwRnIJF2CQO5sgbifACOy9wWgt52S@vger.kernel.org
X-Gm-Message-State: AFq9FYKmq8FivT5DKY5b06jSfSHEBCIr7Bb33vRssiKFJFG/Wb16PPrE
	5yx4HduYHqewUpWVwKdRDGOOEuFaP7u7dNdqFwGdxqm3gI+CrxodlX5b
X-Gm-Gg: AYBFou3ZbEpuGS4CXcU+S3dLrrQQy+jZtEIeVO6o8FWKsXV70q7SMixOeRTz/kmKFoF
	Z4OKiKxviv67Fq7vKr0WPk5t7H9bqWkSK1QEdcNtE9cX24Wyj7ymWBFc/YM7FA3n1enCuxgMR17
	UhdiKVUbOr5BUaYjLy0cNv9HPlNDDSiq/oLlJjnSlTPg7MzClBIHD+8CWN+O9NTi9fFSL16slVF
	TifhtoIS+3iXBeB7VjfI3E23C2OS/10rKyCF9TmVBjzNAcw4p+M6WShQYFJG3qXktvLMIljdCU7
	7bC7Zy/Zu27FlcbmFhjMHzNPJK14Xg6TgR4o7zH/W3BdZDVfrgDzE6CRMiZMNAJRzpmAlMv/SZf
	NDasPm2A0/+RI7IaafaKpZtDcfPSmDLqC5z9zSWlHjV9mn49dSNKzDXQ8K00vMSoTWrE2Du8SFg
	qbPtYTLaGxVmd2nm1mp/M16v7Y5mBCvPCS2qqwjdHQIPBvVc66/9pQ1HKAolzpzvvSt5AE899RI
	/1YYiwwgK4c9dCPosfUb+GkT0k65vV4X2/sc6UKbjWuUb7M7lWyuHYyRiPisDZvqA==
X-Received: by 2002:a05:600c:c8c:b0:4a1:e489:f8a1 with SMTP id 5b1f17b1804b1-4a1fd89d90cmr22391725e9.2.1792570667667;
        Wed, 21 Oct 2026 01:17:47 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.12])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828c98sm3848877f8f.28.2026.10.21.01.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:17:47 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Wed, 21 Oct 2026 10:17:37 +0200
Message-ID: <179257065767.2798.872990041874023890@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
References: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sent: https://lore.kernel.org/r/20261021080517.2161-1-okerixx@gmail.com

Narrowed it down meanwhile, with the clamp corner selectable on the
command line: gmxc pinned at max is harmless. gfx pinned at level 11
(0x1c4, the top of the perf table), 12 or 13 fails every time, level 10
and below boots fine. So it isn't "the rail can't follow", it's the gfx
rail sitting at or above the highest level in the table while the
firmware calibrates. CLX being a current limiter, a limit entry would be
my guess, but that's firmware territory.

If the CRD still fails after sync_state, gfx.lvl being held at the top
level by something else would be the first thing I'd check there.

Oleg
