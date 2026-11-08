Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100046;
	b=RlogqdkEhb4cvRGGeuffye0bXysfNXW4VgPtZ3QGLxZ4iY6gbz+7lTqzvp6V1wdgdlFE
	 /vZQ+nZ8CAHpNiCRVDz8Gmz+skN8exOcbXBw8XnZ+xn0AOYNqrKLh3BkhIgYYCTE50CGo
	 htKJaKEc0xfeUmDO/zxYn+r7+63CkJxVX+ATh470CO/T31jDl3rREZeBgIk1N9nlyaRSj
	 f6gZ43/La8EiF3pKuuz9yGqfdjKuyV03HWR2zP0OJPsCWcqqDeP+jDSCB2l8CtYitHjUI
	 uwUl2ciuNe/XS345d65miKCpEbU+tDLdlCFy9GDNNotXlqv52hsgAclmUr7V2xfVDAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
	b=r2WxM8qUdJS3T7QW+EQkea/sEX/1ylr6BD87B4fExXXJ+aZJip/bQ6KWbqALBTGmpVvY
	 nR66YM1RYombLAS0oJcFdRs2zKEq7Ld9T7Vsu5EHEFekJl0op5N+GJ6vG719oxWYAvHF9
	 3rxRjvlbadp8dn9k9gomPnqUKzrWxYv8Vs2WW4ls995bg8n/DhS/60QVLr4I7V3kGWoDC
	 CUKTQqVmk782QNdhoTKF3zvtOJE/keXwMy9pifWO190dQnRIWapRIm2lfi9NIGXu2PqCc
	 J5RroQPdK72ha0nWVl3FKMLcanU4JCgW61gim6URPdAzmPbuVMibJuV2ppWHxkk4w7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMyFd78H;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E5606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 01:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB0E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMyFd78H
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso347830eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794100045; x=1794704845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
        b=OMyFd78HssTFnnWLrccRVrdwBR8jp6gLh6pdtlOeFZ6yq/ZkZeRx166C+lgsTROppv
         dw8j1QFZpOtIJ7tTiztU4F88QAXFwfPcw1YDRv+dTTeQ2JsojR0L3quIW5G4LuTPWvzl
         IxeB1czx3AOOvax/+4BJo12uj9DiI3fuQ8KOAql9Mlp4j9l9focGESsEDbNDoC4prz7z
         twWHRtj2VkvFDmCEawkLhwe8wekupFyLFzkTJ0QNXgLhPDEeoaxgCOO+ar447ntmygaS
         SPzyjm9HQB5Lp4nsGbfeCKC+no2Snf0wgV2m9u9SbiX8fiGQkuHS3J7SjVlHR55DnmmS
         OMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794100045; x=1794704845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
        b=ihSP8tWJEQRq/dQLBvpCl7Pqhb1dqDHaN4gJ+Gkh5opQuiMo2sBy7V4t6hyX8QBGAy
         8Xr73NZ3hUdKOHUc36m5Zl5J2W4BKpRfKFs0U/UZI/CUikvkzsGk7z4vbun0N48otwKu
         O+QJxLLgLngzWZKfsk4qBhMqXgunHl0A9EFU/QVyiCjU1Cekqxa44bFkWVGULIdBs60T
         /kFVC2rmxz4jPvXeF7pwW21JOd7uUcu1T0lj4ERi1n9uzBlkKnaQWRuuljKQiStk8hzZ
         VZjro1iVQe/hwEkVGbusnRiCQzS0+Y81gYN8INxgNpKVqzIx4UIPKHwiwA0qbLaWVCoB
         TB3A==
X-Forwarded-Encrypted: i=1; AL+hErGq/xbrKSiqDHFV4p2YzF4N459AOmVa9YB7xDSJAA6HsOzbSLGrynzjBPusqa33XyJdK/lgFTVjbCwQKrsd@vger.kernel.org
X-Gm-Message-State: APuU4Z9mIi/Q1KwaqrtJfFrVooOejBLTR7uBkR2ZcdIKQGG86lgYjQ6c
	+57OiIxVGDpFRK5+DHob2rVCH8RBH0JRM6yRQZ5mKxo70dsBOkdeqJWz
X-Gm-Gg: AYBFou1gkauH5h0bJRxusx8DCS/rXs2bSTqojh0Mk4dTRGdAmHUI9dhgiOk+ErouYoT
	H9hF4p0ieDtVuoVmm6jPsbh7ewvSZqxAE2pgVrFVt4dl6YK5fzTUM+NYMdhBuIN+V2m2xiuXwcB
	RYR46Ff3SQG/4qKztZznyDEyN+Yciw/0oRmmXkSI9iTTR0dnF2Vo5bk2KXZtBfiQVnp/eauGexa
	zIRbpBalF+23tV5R526tFu268nGrOw3iJo91wQcz5updiVidO2EalbCkLso83WYaUaAgFi4YW44
	+H2K6sfOKqOpulctWwi27E00e08XdSAACrx/q6WDjEBn9xPjfbT4cKKTJqHgU/8/bidib7zohKo
	jaevAxjC4QmcGB1FrXW3zlvZX9WYM1OxvO15svupaN/kDDgDF64fb1WIAfWiUqZi8TDBA2kSxBa
	48jJrtRWJ/no0v+lCFASQnXAcwuKvk9OAbfws55gu7/biTo8k4IpZxLOr4qJa+Yy/wXnWsSqLRQ
	LDp/zE2sMTxeGgOmHKdOF1Nsw7CwcMsPj587UMW7HJ6343KBD8Yb4w4/AyfMjDD4cXV13K09CSB
	SMQGrAPKaIc6nb2a1sLys0M1ZICwqddIsG49SKquSJfr
X-Received: by 2002:a05:7300:e920:b0:36d:25e:1961 with SMTP id 5a478bee46e88-3725e240abfmr839498eec.22.1794100044508;
        Sat, 07 Nov 2026 17:07:24 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c06c61sm1344623eec.14.2026.11.07.17.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:07:24 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 32/35] drm/msm/dp: mark the SST connector disconnected when MST is enabled
Date: Sun,  8 Nov 2026 10:07:24 +0900
Message-ID: <20261108010724.4061-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929045429.A51801F00893@smtp.kernel.org>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com> <20260929-msm-dp-mst-v7-32-4b81473185e7@oss.qualcomm.com> <20260929045429.A51801F00893@smtp.kernel.org>
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

On Tue, 29 Sep 2026 04:54:29 +0000, sashiko-bot@kernel.org wrote:
> Does this introduce an AB-BA deadlock between mode_config.mutex and
> plugged_lock?

Yes, I hit it on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) when
booting with an MST monitor on the USB-C port (Linux v7.3 with Dmitry's
"drm: handle IRQ_HPD events correctly" v8 [1] and this series). The
lock order is the same in v7 as posted; nothing in my tree changes it.
The HPD worker holds plugged_lock and waits for mode_config.mutex
(msm_dp_display_mst_enable() is inlined into
msm_dp_display_process_hpd_high()), and the compositor's GETCONNECTOR
holds mode_config.mutex and waits for plugged_lock:

 INFO: task kworker/0:0:9 is blocked on a mutex likely owned by task <compositor>:2439.
 INFO: task <compositor>:2439 is blocked on a mutex likely owned by task kworker/0:0:9.

 Workqueue: events_freezable pmic_glink_altmode_worker
  mutex_lock+0x30/0x70
  msm_dp_display_process_hpd_high+0x23c/0x2c8
  msm_dp_hpd_plug_handle+0xf4/0x208
  msm_dp_bridge_hpd_notify+0x118/0x290
  drm_bridge_connector_hpd_notify+0x7c/0xf0
  drm_bridge_connector_handle_hpd+0x5c/0xc0
  drm_bridge_connector_hpd_cb+0x1c/0x30
  drm_bridge_hpd_notify_extra+0x4c/0x70
  drm_aux_hpd_bridge_notify_extra+0x4c/0x70
  pmic_glink_altmode_worker+0x274/0x520

 <compositor>:
  mutex_lock+0x30/0x70
  msm_dp_bridge_detect+0x54/0x338
  drm_bridge_connector_detect+0x40/0xc8
  drm_helper_probe_single_connector_modes+0x158/0x608
  drm_mode_getconnector+0x19c/0x448

32/35 is there to avoid a transient connected -> disconnected change
seen by polling. With 25/35, drm_bridge_connector_handle_hpd() stores
the result of detect() in connector->status right after hpd_notify()
returns, and detect() returns disconnected once mst_active is set
(29/35), so I wonder whether the write is still needed. If it is, it
could be done without holding plugged_lock.

To get past the deadlock I dropped 32/35 locally. Since then, booting
with the monitor attached has not hung (4 boots), and over 3 plugs of
the monitor with drm.debug=0x4 the SST connector never showed a status
change in the probe helper; it stays disconnected while MST is active.

[1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

Thanks,
Joonhoe Kim
