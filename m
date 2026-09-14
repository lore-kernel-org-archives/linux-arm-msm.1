Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB4C422E2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379220; cv=none; b=s/g85vZymTCSIhoV0TIo6Ua/QO2gjQsKxmykhoOc1Rqw+2wJCcQU8SOP6+SsjIMmdaIbTBrqHrdCnQ/hDnRGpCmMRKgi5EsgfayUUM9IIqwuFnIq28i7NScOEsLrmHPC4aV8X3Jki6AbPOz1AsirUb5JOUMH2+XHMiM5e5SCO2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379220; c=relaxed/simple;
	bh=DzgWUJuiNQ6WuYHH3oo31SmlYZ7/cR4pcxcWhooAFj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nf0Yvrg6t1xqxwmWVFPBK1Ncvf8PeU+gTIwxbOD7qWPbyFLNv0t2ktTcyZuAcveYYVpJuzlH3b+OJWp2xyyPIzqd4rpD9e5qWRqJR6PljN3dAkK0qCkfh33rB4nqB8BvOqTyRxInilu7FlYFqMhkCQiYsCa2ay0Wfb/SETfp9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhsQIvhf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhsQIvhf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so9266995e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789379217; x=1789984017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vkw7JGyPZhE+fsyhZVYt1uhb9l0aiaOQEEvbh4klHbs=;
        b=MhsQIvhfd6YobZCbGa07QSbRUaE85/92WJ/T35bUh9LfZXyXGDl0+g1SHoWyfji52E
         5Gp5jn8aaG373HpigteInFPEtVZFYdoayFN3dGdT/3SFqz4XWGUGL9MkQCPEh1qJN+N+
         BhyCLMPbCQswUlwWQj4LCYkhSB5KJPQ+eBh/dKmTdPZ38AffFYaB1hvEHX4p1sIvcLjr
         zXw+Fa5IXtKFbfUbKDEzYT0xNEKkJTitLSc+zcnDd7qUVp303KW/o3uVAE84CTfjMU3o
         Cozc4Pm6RRdOaJNuxT6gu27SUhxWnOGZWdoITBm3Mpicc1n8e/daXi9ncni1ZhbhdGZ/
         4Www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379217; x=1789984017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vkw7JGyPZhE+fsyhZVYt1uhb9l0aiaOQEEvbh4klHbs=;
        b=R1WMtYlRhYJqtQKDXN8436K/au0zAqdrx3mKsLbM6XhmJP5oS0t1ICsjdyt2HuOYCg
         lv7QsNw31nogtd4b0C5r1o3l1eGiKmwa8xd3kcnfpbHxNiiJjdNAFwh3DWF/hIv808fj
         q1QuRdLJDavrmC/jWKgQ0M9S8JXjGvthXd+6524APEwTUHLQt69vdx/sAjJozJ1SgK49
         ZOqmtx49+VK+Uwm7GJR2SJ+zELt/N3zjaz80hY/EfsEUl8lp48fTWrcYbYtJq+X+gOsC
         5Sc34Eh/rpjh9FCAYP442ISMg53OdGDd46dQEOv/8piL+7B//Wyzy4T2NMghtd9sclWa
         Z/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+gBFgxuJkq12R5WMlM9VgUf5UfyfLLYL941YOhojYUENJsm3pjQ2Q/lBe2kSjhqlTjK0o2ZDKzsu05DDl@vger.kernel.org
X-Gm-Message-State: AFuF++mlECplWNChGqaZUHvUVXiZe/g2g0qymz/qImji89dnn7zjQ3EH
	A7ZlBBLYkEwNtPEbvlMfxY4G9pLTsfNbn4drQJ9XBofyuPUX49hIlFmJ
X-Gm-Gg: AYBFou33sy37H9iM5GMWPnYivFkoJfDo5CTmnA5juBob8t36DxaOSlsuoRnA07MTRXy
	JSg3r0w0a0lRi9FsT/Bo8uOklK+MjLazEu+qahwXjS4QmB3DXyT2GRqri83xpxVcof75Por+Kvd
	8nTznIHd1c5VhNpXwKNdXHYrSLQXy+EPLiGYudEYquxGF2xbGAyQuc/A5WWkt+p+O5cpSa5+9Di
	iGucX80DpPCBplcg/en6ZmfBbxak25j2/xECWRghXdtohj2nSB3sXF+eJHPnLr1fcbfA8VQSelW
	YgmfSBUJwA6O7RML5Un/x/btDUQipRkYRMzvMyasPz2LJN0jcu/uNSEeFkMg+1ml4rO95xzyewk
	wOegS9vXUPZmRzNlmm4JrwrqqltWUpGI6KVwSebmXBfQnT6K9M7LscD5HkoxqBOaWRK2xK6qLaa
	kWK92LlR7LzzVBvub48/Y8/QdK5IWddTcSrvccV3Xr3KK86Aqy4nEpMnt797pNoldWdWwQL2R+z
	/hJX2bi
X-Received: by 2002:a05:600c:1547:b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49e7a67cae4mr20839695e9.32.1789379217223;
        Mon, 14 Sep 2026 02:46:57 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm378964285e9.2.2026.09.14.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:46:56 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
	ds.heine@posteo.de,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: glymur: hard reset on the first system-domain idle entry (SS3, 0x0200c354) after a heavy load - Lenovo Yoga Slim 7x Gen 11
Date: Mon, 14 Sep 2026 11:46:47 +0200
Message-ID: <20260914094648.14502-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Lenovo Yoga Slim 7x Gen 11 (Glymur / Snapdragon X2 Elite), linux-next
next-20260908 with Konrad's board DTS (now in next) [1], OSI mode ("Initialized CPU
PM domain topology using OSI mode"), Ulf's "pmdomain/cpuidle-psci: Fix
behaviours for CPU PM domains" v3 applied.

Symptom: after any full-speed all-core load - a kernel build (~85 s
here), `stress --cpu 18 --timeout 90`, rust-analyzer indexing - the
machine hard-resets once it goes idle: about one second of freeze, then
the firmware splash.  Nothing is logged, the APSS watchdog's bootstatus
reads 0 afterwards, no pstore.  5 out of 5 attempts, 15 s to 3 min after
the load ends.  Steady idle without a preceding load never resets, for
hours.

What isolates it to SS3:

- Deleting domain-idle-states from power-domain-system in the board DTS
  (so 0x0200c354 is never requested; CL5 untouched) survives the same
  trigger 3 out of 3, through tens of thousands of cluster collapses.
- On a quiet machine SS3 is entered hundreds of times right after boot
  and survives every time.  Only the first SS3 entry after a load kills.
  psci_domain_idle_enter filtered on state==0x200c354 shows no earlier
  request in the post-load window; the fatal one is the first.
- The state's latencies are not the variable: it resets with
  glymur.dtsi's entry 2800 / exit 4400 / residency 10150, with the vendor
  DSDT _LPI figures (entry 0 / exit 5000 / residency 9000, a local
  change I carry), and with entry 5000 / exit 5000 / residency 9000.

Ruled out by direct test, each with the same trigger:

- NoC QoS programming (reg removed from all 19 interconnect providers so
  icc-rpmh skips it): still resets.
- cpufreq transitions (all policies pinned with the performance
  governor): still resets.
- NVMe/PCIe I/O: `stress --cpu 18` with no I/O resets too.
- PDC secondary mode: the PDC config register named in the vendor DSDT
  (\_SB_.GIO0.PDCC = 0x0b220110, mask PDCM = 0x35430) reads 0x4, i.e. 0
  under the mask.

So the question: is SS3/CxPC expected to be usable as a runtime idle
state on Glymur?  x1e80100 only got domain_ss3 in DT once the PDC
pass-through configuration landed (95f827ceb21e), while glymur.dtsi has
carried it since the base dtsi.  Is there a firmware or PDC prerequisite
this board does not meet, or should glymur drop domain_ss3 from
power-domain-system the way x1e did until then?

What I run meanwhile: min-residency-us = <4000000000> on domain_ss3.
cpu_power_down_ok() then never admits SS3 at runtime, while the s2idle
path (cpu_system_power_down_ok() checks latency only) still takes it.
Three hours, a rebuild, three suspends and a stress cycle: zero runtime SS3
entries, s2idle entered SS3 every time, no reset, and s2idle draw is
unchanged at ~300 mW.  I am not proposing
that as a patch - a residency value is a hint, not a switch - but it
does say SS3 is fine as a suspend state here and only fatal at runtime.

Happy to test patches or collect anything else; the reproducer takes
three minutes.

Thanks,
Oleg

[1] https://lore.kernel.org/all/20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com/
