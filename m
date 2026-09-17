Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD4501F5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649252; cv=none; b=kiwVVW6KbVdfMRi/7DzBBS4Qz5psZmsSkDhLPUwHZ8xYRQuKLMgY+/1jG+i3TZOpD6dJDHNSCpG/WpNGlJSHOLoN5FS4QnRzwoAgAKmU5+1w1wNFjeq786apY81qFrYiYKXYAe7jgMgeB97jSZs0geTfMKsUcOAJeZ5XC4wchng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649252; c=relaxed/simple;
	bh=XLbtsIJ0DCxTOUv5XKkHKfVXn3fWlNTkshqaBhP6s+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWXiJAcM8BkgOLFtFAfVXJ36d5jPcmd0qgvL4v1NGk7f2XinPYRHO46QI5W6TJ4HWX4Pj4hVJbV+umj8TfKpCzG4cc5RVypBWw/Rm7wkcqntNChoCIFjygMiot0EugKmSmgb7IX0YtvaYak8fg5rd+kqKR8P1CTuMWvecNadaYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNPujPhj; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNPujPhj"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so575289a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649244; x=1790254044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbfultDs2OD6410ViT9useBSnVgsUPIPJqHZwqlPlSs=;
        b=dNPujPhj6JaUbWKDw/UEoCeZ25st9A/3gJTjqkOkxapYT3me12xGddc8gZwFtXra7t
         xiliBjbr6gnec8Hbwy/pQ4qpyuxno9wedC351xui5jQu5GfVgj493lckieEgACYxlTvZ
         894PpHuQth86XcdPPT64nOR3Xe30Mwzpy2Ja4JdS+P6NX/8iaQkQp9iVtwg4HYSKFKJN
         C6PSyT4Iy79gvLlZLfLk//L4fSBeyxi44Ad8mqONHmjAkFumj68nRj6u/Rc3MVQ2Mjph
         fioOvSDeqsKmDsDLTNsmflrTPJQIusiKYfdPgXAGsSur060tDaVV2dQap+XZOVNEi20F
         gycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649244; x=1790254044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbfultDs2OD6410ViT9useBSnVgsUPIPJqHZwqlPlSs=;
        b=Ycjz7shr34+EynAe/ZxVGoNIlcKHe3wiEivVc1aQ5qUIsv54k/qe4Cqjomj9AOUZ+A
         XKlK0+8CC1YjSfAmE0YClELNntSGzdcZylYYLHjGIf0GOautnPjsQMEhn+OA2v1o3dJ6
         KIdTYu8CeO5nR49bsFCyz5SnbBGnKz1mqIZaDlSWERXnE5Skp6k3WZi12MPYviw5QoAD
         QL7uvKxNqp50puRBE80PSOVUpOmainB6iu0DlUct+m6Pl74QtGUh0X7FIlmT0p+qWP+V
         IXxDEJUj6j+tiCmYnE9qLg5VHJZUPugCM/Bojj7HagW+q1r2FoGdnazotEhr6IhLaNmP
         Wikg==
X-Forwarded-Encrypted: i=1; AKwUvBwPH34xgDMt5m7EB2QBZvlL49GYwewrezPqgnlWUhHY7+Og8x8HDb1wU2SYKV9Hodq5QKUlvjjhwBS1NRtj@vger.kernel.org
X-Gm-Message-State: AFuF++lh3rZ7e7z5edPDqkcebYtfBTg9HppykJkkywA09JeZmopJTo58
	/vUffNC+5hmvigZ6a0j1HCcQ/gjQet9X6Gd/nvotbp5sUlqTZfv5Ix87
X-Gm-Gg: AYBFou2KJQdKM/6J2KQToXLtA1WfESisfCs7irbApF9kwYT4Qakb9gvqDiiTaGqDVMf
	nnr6GwBd9BqsUf0vRtPUwehZ6G/b23VPqKY3+q6/nmLeFAW7ukjV9CH81jPl+fdUUkXOxQw5hEo
	qDSxTaPybpOak9gyuDCXqTpK/A3BTapKYhzi9CvdgNBhnxiXPr5N3wX1W1bAneMTV616aC4QN/4
	Kq4mKrrEaCVqG2AkRgACmUfzKX5khMOeHR0Qe3cFnZTBn3qEtqajfCeeM5RgnTD2UAxuuPhCqd0
	E3layVl/x1myZLYz0YFtAfXELzmzmTdewTABNxTS0jexKF66fvfALRXyOTvSV7aE39qn0yefFVw
	wRhTyALq1OuQ7uVboDaE8b7BEw3RzTsJD3etN3/Mdtt7ZB7iGMSi3dHc0RcTkc7RTc7DxO16KsE
	QR60sNO4hwUGXwFzF11u+BPPkzq+31CmPlElq+OUFFxSvprSILSSZvqAhGB3axLCRPXoWAxWfxX
	fV7jvsD3CxZvmVTBhsTbe8ek5jLnoA=
X-Received: by 2002:a17:90a:d16:b0:39e:3554:4d0e with SMTP id 98e67ed59e1d1-39e35545939mr9663298a91.1.1789649244173;
        Thu, 17 Sep 2026 05:47:24 -0700 (PDT)
Received: from flyingfox ([2402:a00:163:2ce9:6c87:7904:21fa:8675])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm12349328c88.5.2026.09.17.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:47:23 -0700 (PDT)
From: Vivek Kumar <vk092kumar@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Vivek Kumar <vk092kumar@gmail.com>
Subject: [PATCH v3] drm/msm/dp: allow eDP sinks without DP_SINK_COUNT
Date: Thu, 17 Sep 2026 18:17:06 +0530
Message-ID: <20260917124706.421107-1-vk092kumar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some eDP sinks, especially fixed-format eDP-to-HDMI bridge chips with
no downstream AUX-capable panel behind them, do not report a non-zero
DP_SINK_COUNT even though they participate normally in DPCD capability
exchange and link training.

Treating sink_count == 0 as a permanent disconnect is valid for external
DisplayPort, but it breaks eDP probe/enable paths in
msm_dp_display_prepare_link().

Use the same eDP exemption as drm_dp_read_sink_count_cap() for the raw
sink_count checks in this driver, via a small shared helper, so valid eDP
outputs are not rejected as disconnected just because the downstream sink
does not expose a usable DP_SINK_COUNT.

Tested on a Qualcomm QCS6490-based board driving a fixed-format
eDP-to-HDMI bridge IC (chrontel,ch7218a).

Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c  |  8 ++++++++
 drivers/gpu/drm/msm/dp/dp_aux.h  |  1 +
 drivers/gpu/drm/msm/dp/dp_link.c | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 3825a2fb48e2..3b5a4da93122 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -679,6 +679,14 @@ u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux)
 	return status;
 }
 
+bool msm_dp_aux_is_edp(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+
+	return aux->is_edp;
+}
+
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
 			      struct phy *phy,
 			      bool is_edp,
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 4be02e8b4d0b..9ab401c8526f 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -22,6 +22,7 @@ void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux);
 u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
 u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
+bool msm_dp_aux_is_edp(struct drm_dp_aux *msm_dp_aux);
 
 struct phy;
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 34a91e194a12..bf08b5b18097 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -725,6 +725,16 @@ static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 		DRM_ERROR("DP parse sink count failed\n");
 		return ret;
 	}
+
+	/*
+	 * Some eDP sinks do not report a valid sink count, even though they
+	 * otherwise participate in link training and DPCD capability exchange.
+	 * Treat a zero raw count as a valid non-zero placeholder so we do not
+	 * misclassify the link as disconnected on eDP.
+	 */
+	if (msm_dp_aux_is_edp(link->aux) && ret == 0)
+		ret = 1;
+
 	link->msm_dp_link.sink_count = ret;
 
 	ret = drm_dp_dpcd_read_link_status(link->aux,
-- 
2.55.0

