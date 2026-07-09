Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80C40961B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597976; cv=none; b=EHPoJEWgStPfSnjk9mPaWwHgMRWNNlwoHMOrHUd17Nzn4y+ThU8C6GoPEfZ6Iab4EmdU3R5yb21Em0Uq1t1IIgd0oPnHpy+zs4e8UnKShbucPZQr4ZUhpw+spDnaUSAaoDrLv3qagJDlmxbuJuX37wLlGW6Tk4C9rMli4NS1LV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597976; c=relaxed/simple;
	bh=v3Td+lBvK17/ewydQKC8jnaj1OxCKD33h7VPkR/Cf1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGmDhA71E4Vu9X9dysT3bBTsJMMOpL6p5QAi4mONBAjTvQzMDQ58r5LgL9aNW12BH2v1B7RKo8MeX5iUx6TZwA8dZWDC6tPo5msaS+t9+9tfVnZm+zvt0L1y8VKdApmrBuhk9+6A3iM+Fuz4v9sEGSG5glBmi6OrS/Ri2ifFYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZ3QOuf5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ3QOuf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA5A1F00A3D;
	Thu,  9 Jul 2026 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597974;
	bh=UC3o81qxOOCQEyPwPoT2MULwgUN4vFYhaKVuFT3u4N4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cZ3QOuf5tjHaG3QCtfw3uZUlG8KXj+DhHirN6yL5q571npPD8Mo3QRwAEn1oWe5+R
	 RfB4h7LKR2C21snXyuzPwMWgsnp4evHwwAUsN3AlpralajuMvQV6qxOdztrSB8MQOU
	 jaL33nbXWEuqZbstxn2PkFpMyd0KtwgeN9tRYpH3zEDAenxN3V7brXbMS2V1A5f9NN
	 dwJhRdBKVqlL3I5hzS2XtS2J/eOmMadp6j+W0gO7J1CtG+cVRwgF+JjqLB/5ztY18s
	 sfnKoY3RkLhcY/GX6dPS+93pxntCXKdS8XFMCNjumVaDbqVrRuYrc9s2V0aRSS9LxO
	 9qfgCCvZ+E38g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 09 Jul 2026 13:51:13 +0200
Subject: [PATCH 47/60] drm/msm/dpu1: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-drm-no-more-plane-reset-v1-47-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 abhinav.kumar@linux.dev, freedreno@lists.freedesktop.org, 
 jesszhan0024@gmail.com, linux-arm-msm@vger.kernel.org, lumag@kernel.org, 
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com, 
 sean@poorly.run
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7341; i=mripard@kernel.org;
 h=from:subject:message-id; bh=v3Td+lBvK17/ewydQKC8jnaj1OxCKD33h7VPkR/Cf1Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3XJ9Dy4pHP3WaCHedbkiSkJN4vne3NMLXjxZk6I80
 di1PMWiYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkvxBjrcDRRCEJL+5vbvz1
 DjYeB9yy5uYrsu74pBV5Uuj4M9Vdj45JLAj5HB6gesKC4+cNvrB1jA0npZ/7qxQIWFncUBfQ+8l
 izRcVonJpyndLj7x+4Zkcxvr/7C/77Xzq8KHeJrNa/v2nTQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: abhinav.kumar@linux.dev
Cc: freedreno@lists.freedesktop.org
Cc: jesszhan0024@gmail.com
Cc: linux-arm-msm@vger.kernel.org
Cc: lumag@kernel.org
Cc: marijn.suijten@somainline.org
Cc: robin.clark@oss.qualcomm.com
Cc: sean@poorly.run
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7b92082d35a6..1a471cdf767b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1726,36 +1726,32 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		drm_printf(p, "\tdst[%d]=" DRM_RECT_FMT "\n", i,
 			   DRM_RECT_ARG(&pipe_cfg->dst_rect));
 	}
 }
 
-static void dpu_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *dpu_plane_create_state(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
-		return;
+		return ERR_PTR(-EINVAL);
 	}
 
 	pdpu = to_dpu_plane(plane);
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
-	/* remove previous state, if present */
-	if (plane->state) {
-		dpu_plane_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
 	pstate = kzalloc_obj(*pstate);
 	if (!pstate) {
 		DPU_ERROR_PLANE(pdpu, "failed to allocate state\n");
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
 
-	__drm_atomic_helper_plane_reset(plane, &pstate->base);
+	__drm_atomic_helper_plane_state_init(&pstate->base, plane);
+
+	return &pstate->base;
 }
 
 #ifdef CONFIG_DEBUG_FS
 void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 {
@@ -1794,11 +1790,11 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 }
 
 static const struct drm_plane_funcs dpu_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.reset = dpu_plane_reset,
+		.atomic_create_state = dpu_plane_create_state,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
 		.atomic_print_state = dpu_plane_atomic_print_state,
 		.format_mod_supported = dpu_plane_format_mod_supported,
 };

-- 
2.54.0

