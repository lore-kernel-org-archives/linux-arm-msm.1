Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413337;
	b=lz7AV4Iy/xA0sURATECHUBnKQiifPneJ7p77gZXVEfqsd7R6EZ8A8GvtDeCJ5hD+hCOE
	 w8V+Khy3Bcd9vr8q9BLW3ic+Qy8NQiLLkH4OQB4P8OCneusyfpEcFHYBJ7pYzu3cwY8Xl
	 5GgMdnUUT1b6hvqgWGDWbmusadMu4XXulzNoYS8CVke4d2n1Z/39Xrn/qQPyuZhabXT5d
	 DRAJYOEmehwwZwq/JtmlK5fe+edzf4wJpoHt/fs57PpkyLZhGVB0MD4IZ1+NfvxK9v+0m
	 OimAmtjurAsA8zkE2W8c/myI20exOBNkKnNUjrRC9dY58Zix//pQFs4y+oIMzlwAkwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413337;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RO865FpgI8SUnM8VBsvjl2ol1ZFGSrSMCGa3F96x8cU=;
	b=BI+0twsadVaEP3winA7mbnKm5rvjp7tlJ1G3lvedYdVXOlfTEbcLmtQeVy4mua8vJgzI
	 IxDtxVnT8hYyISDRzPhoOcJiHnnRhCf6OonKNNTtnO3v1Om5vwA4xln3mSqPvjg77pcSC
	 Y7Sxlz1ZT2B2HjV0qOdYWqjLXoX8gkkZQeWzqBf+FtPscyjNGAcB1xXrvW4svGjKF9qDD
	 MAuWikfTpwm2FKh4d1Jyjxbt2xJPy8VzrICgjpFID+1BPi788DgvaqQsIpHGtpdk7lOJ5
	 xh27d1TT/3MGztghkKfKCOaQse34Ty87yEqQScqudUtqtXCLt3tTM0ADSf/qMeHbyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=eP+wKo1D;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A48606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A48606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=eP+wKo1D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=RO865FpgI8SUnM8VBsvjl2ol1ZFGSrSMCGa3F96x8cU=;
	t=1794413335; x=2109773335; b=eP+wKo1DezipytxhcA9waUslC78pol0esc6EM8eb4axkoM8
	0SAtM/wuwMddX+X9HbljOP4JGKIDwlnEpxH7VMga9smsdDhzG2zQrmFUUfB4N9SZyD7O5CCcS1YZ6
	QGyUmAdKHgksE/+GOcy+V9q7o5/901xFBahQ31gotsYLZXHhU1fGbm7u1O7+IGAQ0r0cs/UNl88E4
	Oqq/SA7Kj/OLbs40empZiFEQRFpXbETt7uRZMJmp5bSaJrtowbLn9Hh8gCnmRAvEkU4jc87yt94Pd
	wjmrGqnr4XBwCpozuhfqYYruFEy6Vw3R2JVqHKqO/W3uMr73h8zuwVcq3vLCSyLw==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRArz-008u8Y-RS; Wed, 11 Nov 2026 17:08:19 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	alex.hung@amd.com,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	contact@emersion.fr,
	daniels@collabora.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	mwen@igalia.com,
	sebastian.wick@redhat.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	louis.chauvet@bootlin.com,
	John Harrison <John.Harrison@igalia.com>
Subject: [PATCH v5 00/15] drm/atomic: only add states of active or transient active colorops 
Date: Wed, 11 Nov 2026 17:05:13 +0100
Message-ID: <20261111160814.21326-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow-up of what was discussed in [1] and on #wayland
IRC channel regarding policy and userspace expectations on changes in
colorop properties and the current status of the color pipeline in which
the colorop is part of. In short, we agreed that userspace can change
properties of colorops that are currently part of an active color
pipeline or when the pipeline is switching status in the same commit.
However, userspace cannot change colorop properties of inactive color
pipeline in the expactation that it will be activated at some point in
the future.

Userspace also expects persistence of color pipeline already set, even
if it becomes inactive for a while, when activated, colorop settings
previouly set should be preserved.

This series uncovered some bugs on IGT tests that were already fixed [2]
and applied. The bad merge conflict resolution mentioned in the previous
version [v3] is already resolved. On the other hand, when rebasing this
series on drm-misc, other issues on AMD KUnit tests appeared due to the
introduction of the new FIXED_MATRIX colorop type. As a result, the
first two new patches address them.

I also tried to address some Sashiko's complaints on pre-existent issues
that affects the stability of this series, but not all since I want to
keep a healthy scope for reviews. Now some AMD fixes in this series are
attached to the DRM changes, so better apply the whole serie in a single
branch and hope that this doesn't get deleted in the event of a merge
conflict.

[v1] https://lore.kernel.org/dri-devel/20260526142940.504911-1-mwen@igalia.com/
Changes:
- define a macro to walk in the color pipeline (Alex H.)
- fix checkpatch warning (Alex H.)

[v2] https://lore.kernel.org/dri-devel/20260604180457.1110110-1-mwen@igalia.com/
Changes:
- [Drop] drm/atomic: duplicate state of all colorops
  If inactive colorops state are duplicated on resume, the commit will be
  rejected. 
- [New] Four new patches to make AMD driver match the policy of colorop
  updates only for colorops in active color pipelines plus individual
  colorop updates. It also tries to untangle COLOR_PIPELINE = Bypass from
  colorop BYPASS prop = true. I think patches 3-5 can be cherry-picked and
  applied if it looks correct for AMD, I just included them here for
  context (for example, Sashiko reported an issue in the previous version
  of this series).

[v3] https://lore.kernel.org/dri-devel/20260609121230.1358786-1-mwen@igalia.com/
Changes:
- make drm_atomic_add_affected_colorops static and move to
  drm_atomic_helper.c (John H.)
- skip check when just duplicating state for suspend/resume persistence.
- [re-add] drm/atomic: duplicate state of all colorops to preserve all
  colorop status in a suspend/resume
- rewite commit message and better explain what's considered an active
  colorop (John H.)
- [new] drm/atomic: check if an active colorop has a blob if its type
  requires one
- drop the ternary and add just a warn_on since both current callers
  iterate planes already in the atomic state in AMD's active pipeline
  check (John H.)
- explain the reason to use commited colorop in AMD's active pipeline
  check (John H.)
- [new] drm/amd/display: don't ignore failure on blend colorop setup
- [new] drm/amd/display: distinguish colorop setup error from no colorop support

[v4] https://lore.kernel.org/dri-devel/20260811171011.184964-1-mwen@igalia.com/
Changes:
- Fixes for Kunit tests related to FIXED_MATRIX type
  - [new] drm/amd/display: Update colorop pipeline tests for new fixed matrix op
  - [new] drm/amd/display: add missing FIXED_MATRIX colorop to AMD KUnit tests
- Fixes for KUnit tests with the new policy in place:
  - [new] drm/amd/display: add plane to commit on KUnit cursor mode tests
- post-pone making drm_atomic_add_affected_colorops static to a point in this
  series in which this is not needed by AMD anymore (Harry):
  - In drm/amd/display: allow individual colorop change, drop the
    drm_atomic_add_affected_colorops() call from dm_update_plane_state(),
    since the colorop helpers now fall back to the committed state
  - [new] drm/atomic: make drm_atomic_add_affected_colorops() static
- check colorop type when allowing individual changes (Harry)
- update __set_dm_plane_colorop_fixed_matrix to get the commited state if no
  new state as for other colorop individual changes (Harry)
- update KUnit tests accordingly (Harry)
- [moved] drm/amd/display: only check colorops of an active color pipeline

[1] https://lore.kernel.org/dri-devel/20260519211111.228303-1-mwen@igalia.com/
[2] https://lore.kernel.org/igt-dev/20261021151929.62529-1-mwen@igalia.com/

Best Regards,

Melissa

John Harrison (1):
  drm/amd/display: Update colorop pipeline tests for new fixed matrix op

Melissa Wen (14):
  drm/amd/display: add missing FIXED_MATRIX colorop to AMD KUnit tests
  drm/atomic: only add states of active or transient active colorops
  drm/amd/display: add plane to commit on KUnit cursor mode tests
  drm/amd/display: only check colorops of an active color pipeline
  drm/atomic: reject colorop update from inactive color pipeline
  drm/atomic: duplicate state of all colorops
  drm/atomic: check if an active colorop has a blob if its type requires
    one
  drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
  drm/amd/display: make shaper bypass mode cleaner
  drm/amd/display: make blnd bypass mode clearer
  drm/amd/display: don't ignore failure on blend colorop setup
  drm/amd/display: allow individual colorop changes
  drm/atomic: make drm_atomic_add_affected_colorops() static
  drm/amd/display: distinguish colorop setup error from no colorop
    support

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  13 -
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 236 ++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_cursor.c  |  26 +-
 .../amdgpu_dm/tests/amdgpu_dm_color_test.c    | 118 +++++----
 .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c  |   4 +
 .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c   |  49 ++++
 drivers/gpu/drm/drm_atomic.c                  | 199 +++++++++++----
 drivers/gpu/drm/drm_atomic_helper.c           |  59 ++++-
 drivers/gpu/drm/drm_colorop.c                 |   5 +-
 include/drm/drm_atomic.h                      |   4 -
 include/drm/drm_colorop.h                     |   9 +-
 11 files changed, 456 insertions(+), 266 deletions(-)

-- 
2.53.0

