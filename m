Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E13AD511
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155051; cv=none; b=FvphaNahZz0ReO9cAi6ORsI/pJyE+80PHfeELvA5FdqHjymfCXUK6HtJdyZkpIiYKzlOK7EGAfHBPMWk4NXtMhCshOaQ7x3e3m8JOUbsW+AIL7FKENcbz0TpXq28IF8p5H0wo8+IU33R64PSsGtffCX7OOgghnAo/Xh90scBEoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155051; c=relaxed/simple;
	bh=s4rcpm684AbbWFl9WuUkuu3EtJDM/Esqd6+a5JxGRSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To1UNi3spH383Tsrkpddye5YY4KXf98PHlYThpFqcOTVb2UFJ+BwrH0gh/c5fUIiuNuz2WG/kVWqZmr1t8wSe3CDn7iSUWuy6fbG9VDDPApfUC0CO4SI0JQgEQ/EiQ5iD7M8MxBSa4zdMxCaWyU2sDBzsDKko3ZdpLd9PUzy01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbeUr00P; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbeUr00P"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso5117565a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155049; x=1792759849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ogy/UTo3Vu0INpL0C1Y6pZtlcOAen6uVXSl1ntl6vTo=;
        b=SbeUr00PMKD3O7+Oyo5zHisGWnIRtUdMHDQ7eHQOK6EMsM4SJl+svyy3B3TU1RvgCS
         0kdqb+RHIqNgr+L7lZdVp1rmvHw7MCKn+QrTNHeTyn/kLhJZBeeJmOpCRUYTh4rufhaf
         eLSsZ32ihbKind6a60iQVbjco2HgaIrHR/0CMOR0kBsqSaEnrfQU7PwHJTuEg9yxpodl
         zzTNdy8Z9C8sxs1OZMoUDZ8WxfIf4YhHAkIOKCzgs2eQRSJY+xjrst8MaAbl/i+ZKHWg
         9ru5DZYRsF+RgiQzEr++eDABcleJXpJce7NAXS0jGMhpYRl3T4RKLdRfNGYs3EbELISM
         ItcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155049; x=1792759849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ogy/UTo3Vu0INpL0C1Y6pZtlcOAen6uVXSl1ntl6vTo=;
        b=Wh1EHLoeR5R5DbFSrqmKw6+AZ3oqmWDWoHshlHHma7k/P4+DAJKc+/J6VBJJgvgzZz
         mq3yjVYSSS+F7EreAmALGBNE+mCvJ8duPvdpiO5YJ3bbXXzMOfJIfPMfL3bkXQcn5oeR
         PlR1wDL4bPUE8BRTIimblkY4YGLQ21R2IbMbKxsg289LhArH7UzXfCtnSr90JoSZibO5
         QHQrTIfWdn1vgIa24KO7RUbUzQp+3cO+LHTSUznQJzRejAz+8Y5E9ig1Geer8A3wCRKL
         5N0cpjepOE11a46E5M+y280YiMSu/p0HNhHeYR6tHzTVKfLZFHJdlyoTTcQwpZbrXaml
         3SGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx+GdJtpsPC5kTdcsNiuI5PZi5BOSGP6xbsKIcsT8aA11/7bd07jmreccH5HYYlEu2sRnq6gyAMJCMsddG@vger.kernel.org
X-Gm-Message-State: AFq9FYJNz2LfpZwgQX55ur5gUly+RFMziEVnSSuVEClYKVrsXavfsB9C
	n4KK+EhAOB81W+VXhD4ceyWdYIf0CNr2VdAFRPAg/d4gnuVfuA4atAN5
X-Gm-Gg: AYBFou0aI06H4SyLRodwZsnX9QsOhV75TWNzjw5U0gOmGpRAiZcPmRAto2p+lMlKrru
	7KrU6l0TitA3lH0xEV9aHa1rA3wVTlO4TH4J6WZl/W1FdbqFjPF4D6mB0mzX8USNngANiuzkLCw
	VdqDfnekzh1KChVopimGpX+gShOGinJqq/pXO3HuK4zV4zSwIwKQ4MwT6RZlLGouZI3adbu8Zjr
	p7ISOSUAIENY5FfJpDfJubnlwprIZ2o4Ct2tjWYOxq1ASM9JCX0GA9sFwllH31g/1u7fW85xu+f
	btH8iMMUkPlEgXdzD8i3vaARQeH3rqwKb0umrorgASSvVAK7C4puru83v6sHadg9xY1LueLhPBt
	ScKzoKStTGXNaHl28CJL1ksVKlqTyWKTwyG+uVUFSLY+ReNlOlh4pQ4mosQjonYYVe7dMwSYtw8
	pEjV8xnTEqzXTqfEw/D0R1RYPYDtr+zv5ejfThKuoDbkoJKRRibl4b5y+Ej2pze8dkv70cTwxCV
	whV2bpqOce5/20=
X-Received: by 2002:a17:90a:4c82:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3aba3ee3e2fmr11173340a91.22.1792155049139;
        Fri, 16 Oct 2026 05:50:49 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm9106546a91.8.2026.10.16.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:50:48 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Fri, 16 Oct 2026 21:50:44 +0900
Message-ID: <20261016125044.1085-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending with the lists on Cc; my earlier reply only went to Abel.)

On Wed, Feb 05, 2025 at 01:45:05PM +0200, Abel Vesa wrote:
> Scheduling the USCI connector worker on the freezable system workqueue
> instead will ensure the devices are resumed by the time the worker is
> scheduled to run.

Hi Abel,

You mentioned respinning this together with the altmode change (now
7d0767c5cd87). Are you still planning to? I hit the same problem on a
Kaanapali tablet (Lenovo Legion Tab Y700 Gen 5) with an FSA4480
orientation switch. Unplugging a USB-C to HDMI adapter during s2idle,
with the altmode change applied:

  i2c i2c-2: Transfer while suspended
  Workqueue: events ucsi_handle_connector_change
   fsa4480_set
   typec_switch_set
   typec_set_orientation
   pmic_glink_ucsi_connector_status
   ucsi_handle_connector_change

and the system never resumes. With this patch on v7.3-rc4 it resumes
normally (2 of 2) and the change is handled after thaw.

On Dmitry's question: freezing the ucsi_glink notify_work instead would
also hold back command completions (ucsi_notify_common() ->
complete()), so a command in flight at freeze time would wait for
UCSI_TIMEOUT_MS. That is from reading the code, not tested.

If you respin it, I can reply with a Tested-by. If you'd rather I send
it, I have it rebased on next-20260928; just tell me how to credit you.

Thanks,
Joonhoe Kim
