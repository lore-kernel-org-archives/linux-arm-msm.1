Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089247;
	b=VxOJpzyKSXEE/8C/Wd8Mlscj/56Xwpm8jfcmCgSksTxNxDUIGLmVxF1vwb43xwW8qVQ/
	 Um3auVdvyJvypWJe4t/D0xWGZejhUaMQWpYFzLRvwf9h0iTTNXdDDWDO3y/Urxq/7yy+4
	 6RLALnNYGfd7/u3Evi+Pd0o909SjU4t5t5oHaVQAeKZOlk6x6kTuYeO9ZO2wLEY3nZSZF
	 t9OM5G+aUw9XijnQdWEt0PaLJUhsn8l8WTEzoUbyxxBk8FnDWQd3O5ckSKj2qg8Ts9Tie
	 tfkyk63MeItN8/k9MlaOw0817dqqf9+TddZQRO0N5nNLRXzCOFHWtZ90ClVmImMmYJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bLOCauCwZS8/D6IGzsWIvkfLxH3srbuFeiLhXgqvy6U=;
	b=boUGr7UoYyCIcyUpE4es/0Iic/co/e9a2z9ErLWsSmR/GfWisVMehwD5TmA/7ZTXgMXs
	 7qXc+6sTrTiwSmScmUfQWbxrcg0/ouonePm0RXYITxt1azOi5idM5id8XZ9S+wCP044rf
	 giTduv1A8sqJVxmz9gYzlchFq6wNz69olZ8dMZWMjo3fPppR/4DOG1KmhgyCE+8t1Lj9h
	 Urs/G9GWFHGYbYHGWZdyRpYpqlbSIFBAFeLudQnwYeUXttpYfVaGeojXcqlNxWWN3lZTD
	 lBNPcM+8TwUNGX2azLuDlWGtUnTPrRWev+dqRcgnVE7EqP4htVO0kKSF6g4A6fNiLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNYaOTjn;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552EB606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552EB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNYaOTjn
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38431138772so1007849eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089246; x=1795694046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLOCauCwZS8/D6IGzsWIvkfLxH3srbuFeiLhXgqvy6U=;
        b=cNYaOTjnvzS1pEK0uRVMoCyx28ithK4lvHu9jpiNgASRoorUYcaPa1ce7CBliZzUvi
         ENvJADmySvn1nE3O1xTJpr1IW+0qmLVGDwZktIYtiGp2H1eVMfBvxDcKsAeprfR1eXV8
         DQI8YDy/JC1bqEWBO7Hlr56Wn4m9Eqw+vwy3vQNXLGLXSa25PYIdIgl2XEl0k6Pq+U9I
         rKrYxp12LhiIH20QdtGLkXb2TYXLyyr3pwo0khnu15YotGCVJCGzVphRUSJsqPHSCfRi
         Gl17jPX5MWEGtpPSgGmdB5d/RvguH8uwjhy+5ut0N6M6sw+RvsV4wbi/gm83GXbZ8ZiN
         TvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089246; x=1795694046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLOCauCwZS8/D6IGzsWIvkfLxH3srbuFeiLhXgqvy6U=;
        b=xlxREydE307pEVf+8Gkgr44Adztnn0dh8vA57A5LQI8wrhz2dIj6J86Z2fD71aoP7Q
         cD+RYbJwMVudlFtTbPyO6R7lSX7k9FviXW4+eRkE9Uoow7Ijlupw6i45XgLXRRLjX8bG
         ATnvS+Bdu2CLSYjK223P22gvt/jxGeeKIvZopIynzh+c1oTXmE0jG3/g2g9w256d+nAp
         p9A9+HXgd15Bm1P0nVjMGLjum07KkluHaBD0HGCj1yQVrHI3Y6d9xu255LYSbrnuvtSy
         EGRsTnnGcoo2Nw3ZFo4xH4dmA3MQDFmvuo1VukHkE66dxAbjLspgdz2RyN6mIKw1BMeu
         XV5g==
X-Forwarded-Encrypted: i=1; AL+hErGq0DAw+iJ/gzOc4PWLprOoM9rksTcwUQidoBLXbZ7Tckc3vfRVv1Pn0wmvy3NIVFN/3bFtOL6N8AQtqi5K@vger.kernel.org
X-Gm-Message-State: APuU4Z8/BCb6swhh8ZoRdWm1AXVjI+HiWOWutTMUzXnu4Faudu+srvSm
	O297n/6gTcxUc+sinTpDhrVpmaR0CBy5blx2r8xPhJoerTUxGiq2Uy/E
X-Gm-Gg: AZFdTZfw0xY/bES4AfymVZlSXsYX3VQXYS80VmLHSWt9zFt3mmQBwXrZ8k5nobUg4Qe
	R4O7lKftVntB9akDa64a2RvSreT1picx9yjCILxnfTgbXO+3BPfBJBJwskgHEn6E+u6EuWunCpY
	xHi7cJ+zX7GXqlTXuTPkGo9mRZwJZ07jDVIK70Fb4z00TSirJTSublOxmwr+uNZuoOchIjLBHj5
	ptLtmlIV+g/DsBceVahHBLtHUZx79n7UdSaM69Oftja2sABDpBqnWQQ5z0dnMCn86cMtiYpGq5L
	QYiUlzByzB5FJ1iPmVG7VVB/VrJBieX/FtYx+KH2T1dysj9lcbxFY1jci7jBqpMdYLW8bklMLrQ
	VW1pjtS9rqvGRHE5W8YwKPeY/zuIh7XEtu6sUZi2Hvr2IgdVvN3NZPNHYF2lmhoa1uc70DC4Eoc
	454h8OptiKcSedc4/E5+NnHyZqpN0fCI00hH6OjWdUPkUsG3L3YUlx3wrW0kA1q+L36j0RRDrlZ
	jqykHZi61CObnSE2egVrb6/fdnTYBWCcV7+7RS+MF4GNB53n+hvH4sBC8zJ/YdKivcvPImjYqyG
	1cybKdO2O0u/B8ttVuDltfNR55HdyZNmlw4=
X-Received: by 2002:a05:7300:d117:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38281a0669amr5299111eec.33.1795089246055;
        Thu, 19 Nov 2026 03:54:06 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm17199286eec.6.2026.11.19.03.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:54:05 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/29] drm/msm/dp: Add MST support for MSM chipsets
Date: Thu, 19 Nov 2026 20:54:05 +0900
Message-ID: <20261119115405.162-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
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

On Thu, 19 Nov 2026, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams.

Hi Yongxing,

On v7 I reported that s2idle hangs on resume with MST active, and you
said I could send the fix. I will not have time to follow it up as a
separate patch, so here it is for you to take into the series if it is
useful.

The series never calls drm_dp_mst_topology_mgr_suspend() or
drm_dp_mst_topology_mgr_resume(). While MST is active the link is kept
up after the last stream is disabled, so system suspend powers the
controller down with link_ready still set; on resume the first stream
enable skips link training, and the payload table write hangs retrying
AUX over a link that is down.

The fix suspends the topology manager and takes the link down before the
controller is suspended, and on resume initializes the PHY again and
resumes the topology manager (turning MST off with a hotplug event if
the branch device is gone). The version on top of v7 of this series is
here:

https://github.com/joonhoekim/tb323fu-linux/blob/0e73bc96d65386bee31cc003f2e76a2e9623f631/kernel/patches/0202-drm-msm-dp-suspend-and-resume-the-MST-topology-acros.patch

With it, a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two displays on
an MST hub resumed from s2idle 3 times out of 3. On v9,
msm_dp_display_unprepare() should move into the patch's
msm_dp_mst_suspend() and run under mst_lock, as
msm_dp_mst_stream_post_disable() holds that lock when it calls it. If
post_disable starts taking the link down after the last stream
(Sashiko's comment on 18/29), only the topology manager suspend/resume
part is still needed. Feel free to take it under your own name or keep
my authorship.

Thanks,
Joonhoe Kim
