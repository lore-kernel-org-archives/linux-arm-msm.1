Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940C4CF49B
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792272250; cv=none; b=uIIMc1g+WS8VVYgqj0Wrtd4nkhTTgqYt357FBLipWsysH85wXqDa3oDtoLOZU9HvmCDLjk/pLPGeurIyMu9OHW9oKmP3WyEl5H9wQ/g89IY29HgrV+rdyTV0itJ9KkWuAv5tTPqnS4zWKdrh3NeG6r65NPOb90m12Io/5Ti26ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792272250; c=relaxed/simple;
	bh=gXqe9EzoxzGQlQ1bWfrO4Xne4tPmdxnZw7VRB2mY7cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LX6CLK9H68zbndBc2HPRM1J3yZHavyYAjkPGfEEyqkyDde20YGHJjpqfAxLbJ7mlj3Vvgg1zLyddvsfAHmcKPjjv9Hlfvf+QE1gUouXJZaCOMmMu8VCoj2/b4jLyFYgOHGib8OK1deHio0IMIKjQkpIuISamsmh0CZ9ABEB1g4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+MRfz1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+MRfz1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0A01F000C4;
	Sat, 17 Oct 2026 21:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792272248;
	bh=AkackGthM0ACztfHQSKlksjMmW/YOmqa5GxN172PZr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z+MRfz1nwEoFPZ3U5jurBA7bwERP+PxbMzn8j8QdZYxqMpQmjuP3q6IDPEedDMo4r
	 K6QeZfdAhlB3nwVbmtkKmDnZbtcfgjaPvwJ61v+SQcYcnHUA4zVLsMv9eVJ36MS9va
	 02e2RCCxNwr3nDUFjw/9FmfoiXiJbZ11tVns42P3ikyFx5zaWjh1rasBW2ZpmPtmsq
	 bzjVFiB1bYW0VrR95PAgslIqLnH2SGspGfFLSsS3/14meEwiqjDajBewJZS92prF2Y
	 ZjPoLNYgNt8ImEw/zNjxllVJHVzlKtBkRQzc5w02hFHsS2l2qsl6vtwrPuWLSmWr9c
	 ze8g4rQxC8e9w==
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alice Ryhl <aliceryhl@google.com>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lyude Paul <lyude@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sean Paul <sean@poorly.run>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH v3 0/8] drm/gpuvm: two pass locking for exec
Date: Sat, 17 Oct 2026 23:23:57 +0200
Message-ID: <20261017212357.99295-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001220632.3190896-1-matthew.brost@intel.com>
References: <20261001220632.3190896-1-matthew.brost@intel.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  1 Oct 2026 15:06:24 -0700, Matthew Brost wrote:
> [PATCH v3 0/8] drm/gpuvm: two pass locking for exec

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/8] drm/gpuvm: allow locking external objects in two passes
      commit: bdb1dfac34bd
[2/8] drm/xe: lock the resident BOs of an exec last
      commit: d420ec95e4b8
[3/8] drm/panthor: lock the resident BOs of a submit last
      commit: 13b7dc3f89ca
[4/8] drm/msm: reject a submit_bo table on VM_BIND contexts
      commit: 222f78f461cb
[5/8] drm/msm: use DRM_GPUVM_RESV_PROTECTED for VM_BIND VMs
      commit: 872403c67851
[6/8] drm/msm: lock the resident BOs of a VM_BIND submit last
      commit: f3473658eda3

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
