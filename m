Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776883;
	b=jJlxO4gLlXsISaIMOpa8POggtabRDHmxQGPyqgTBkZ7AfS2tfXRwqHW+SHZuQyOS32qj
	 dnz6ZJMVFj5KTrrsCja21rXkzyydv84K6rRGkYCc11BBS56Up3zuMIrEXzNlb9+rbhDWm
	 3fFMG44LtpOGqDAgIefisbr2bF3dsamkJnpBKkewqXv69DTu78RrxsZjVkaOmG7Kk898U
	 n9GRrXcteYIblPM9b2h95lGrSD03W46RPrbbfjEZvur6Ik5yhG6dnWuHGMe7Yzkv1zNtO
	 nrHOGb1YM36OVVWWYyj0o8HqbGegPxGeEi2MBVg8KqdYeMNIRpupH1DltBaM3NVoQIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
	b=ChsPa83C0kVgpJEDJsp7T+mr3Mk6a9CwFmdssE8GnV3BAkFknTUED7dNfWVPB5SFLizs
	 zUsQLbIoI8l8ICuo1JpLFx/dMFGzNEa9SXgJClRAC2OS51YJwEPSSBeRNwBdzFyKzNalG
	 aKn81ALYRm0DLdNLT9RyfTnRQm2caM4dNWWnklgSwOf+Bkaj+NNQ2JVBMiMg4q7H7iygd
	 C9kgThnKA1IbekYTkbrPuB555qaefDRN8NJPUePLUKi/0HkWdzOM8QmH7fzuDYOQW9M9f
	 a3ndvaFJ/FMnSflVy9FjFgyP3xUyeIJVzrKuKfzqb1XTONulIhdSGx6LnQDD3uPhgFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s04muIap;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781C2606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781C2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s04muIap
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e942864693so2120805ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793776883; x=1794381683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
        b=s04muIapcZ9Piy2/cGVdXuDKZlGwmNqHIPw+ja53Na+IyW+ZcXoh8Ae75YcX4BgZgj
         YaEGSPcLeAruFsHyeaV4PUYw/pKZ4iKUuL7iyUHI3N8fi2HfAy63ylDz9BBkOcGDTdgd
         5y7JagsYeyCU4x+ifhC0TgesXSH9fXZ7H4CY0Se79aF+aiwKFKRQpXdjVHzZ03+5+rDP
         KEyIVv6+V3tcjXU1qdJynCrq8uQh00T7nEo1qrStmt0xMufkkb2lVwsLzmyrQt0rSlu5
         h+myLa/Bt+Rkv/ZsmGjKEJWG96NnkJ4Y8e3ZkfXcy59ve+04qJZO6eIXj2LApM1wG7vD
         KlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776883; x=1794381683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
        b=reXHkQ1UizC5dWOuXypimmerr/SP+YxpeRSiD+9iZFoq+FgA1lu0mDLDWhrMRNKSCk
         +iNfHXmcTiOuEcVXQHkKfF4/qtPSwM46VbqMFjCUY36mlP6TwhOSDRLCUymsz2zWEDbQ
         y2aXnIK/IogP/grOPYrVIr23jB+h9Maz8j3bZYuZG4Js2OqwVmoBnpnXV+H5AxMlifHz
         0XPa5iZuT8WynqJUqqtyK3QYDBE2lWbE9l76MkstPNShxCtKP13vxU+Nglu8s0xBoVvU
         HAvGGQjCIF6Gu5zbfybYPgVPZazA9e2sktolBtLDms8ei0gHdEzmsND2qibGAFs+uiiV
         obqQ==
X-Forwarded-Encrypted: i=1; AKwUvBypLwJJBSsIHyUFd2GtyzrsqrjtNnolTe0091g3ddEBIS1JkrZMLIjoxynhlV4UQ+jnH6rqxKyGTO1CFK25@vger.kernel.org
X-Gm-Message-State: APuU4Z8RX0QRFoKvK1znwY/sJ0TGmUvTX/2ZxI+2DsxxmPkkY3Xug84b
	mYy+0AIr8esPxWe8NoXpiXyvYxiAqnSG4vnrZlcLE0c9f8EamQqEhtE=
X-Gm-Gg: AYBFou1g4c0TK3yTNSrGZyWsFWPczJEF/yLrO9jdvcy6qUD2HZr+STgvNmX00/xR5pU
	Uol+LiYK/m9PTobRBxSxZvHEt0HeqaQlINBUu8nSa2bgLpztqty7EKO4sTF1O35hBKbxUspRXKi
	bjTN6Rss/PygNBEBWHTEIEDpAgtmvE0EUuBblNzCZd714BKY8x/WgtT1bbGpip8EeaOvj2Nb55d
	mKQ1iR7IxZEzB5pFuC1jykBIT58/fjibmxAkZHGVaMCuBYL5B8ZzGu3R510dYW8EOW4gSbx2Wz0
	1TfYKyqP0YHJ90RMahs1OAxZdlE57H9OV8uH1eFXTrKnlmxo+Zd1BQNXoGeN8WsXC7ofKld5uEK
	hgHgXOeNXVNRN7sXoGVAdJTwu5lAAXVLzax8+MEcylxt/dQz5RnccIHx7Ju93Now13dlL/n/9bz
	9lKL0MQ6c9twyDqOnkgfcSP4SRLRhUimifVNVvtmQb7XM9BtcB1Zs1JQZSOneMtKS2o332J5hRe
	y8Gr0v+HNuMY58ifd4W54cafK3ZvS4oEzXZPofLoVIYLj/pahmMrKP7XKaKykoivGG4XeZgMPVc
	LQdInlmkD+hMyWqfkwdrIXd/DNX5sPcCXeVyQSC2csyBXFKWk4OeCOKhVbd7O0TUbR6Y
X-Received: by 2002:a17:902:d2cd:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2eb364f8fe2mr149925825ad.51.1793776882756;
        Tue, 03 Nov 2026 23:21:22 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0906c514sm3950345ad.29.2026.11.03.23.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:21:22 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: robin.clark@oss.qualcomm.com,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Xilin Wu <sophon@radxa.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
Date: Tue,  3 Nov 2026 23:20:48 -0800
Message-ID: <20261104072048.3486286-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Commit 1bda647ce61b ("drm/msm/dp: move link-level teardown from
display_disable to display_unprepare") moved msm_dp_ctrl_off_link() and
the PHY exit into msm_dp_display_unprepare(). Unlike
msm_dp_display_disable(), that function does not check power_on.

When link training fails, msm_dp_ctrl_on_link() has already turned the
link clocks and the PHY off, and .atomic_enable() returns with power_on
still false. The next disable now runs msm_dp_ctrl_off_link() anyway,
which writes REG_DP_MAINLINK_CTRL and pulses DP_SW_RESET with the link
clocks off. On an ASUS Zenbook A16 (Glymur, eDP) the SoC then resets.

Skip the link teardown when power_on is false, as before that commit,
but still drop the runtime PM reference.

Tested on the A16 by forcing link training to fail and then blanking
the display: the SoC reset 2/2 times without this patch and 0/3 with
it.

Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Burke Cates <burke.cates@gmail.com>
---

Notes:
    Test base: v7.4-rc1 with out-of-tree Glymur platform, board and eDP
    PHY patches; drivers/gpu/drm/msm/dp as in v7.4-rc1 plus a local
    knob that fails every training attempt. The reset is silent (no
    pstore), so which of the two accesses triggers it is not known.
    
    As before 1bda647ce61b, a failure after successful training still
    leaves the link up. Xilin Wu's hdr10 v2 09/20 handles these paths
    more generally; this is the minimal fix for -rc. Happy to test his
    approach instead.
    https://lore.kernel.org/all/20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com/
    
    The bug was found and this patch drafted with an AI coding
    assistant (Claude Code, Claude Opus 5.5); I reviewed it and ran the
    tests.

 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..76784cc45228 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1528,6 +1528,14 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	/*
+	 * Failed link training leaves the link clocks off. Avoid accessing
+	 * link registers after a failed enable, but still release the
+	 * runtime-PM reference below.
+	 */
+	if (!msm_dp_display->power_on)
+		goto out;
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1542,6 +1550,7 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 
 	msm_dp_display->power_on = false;
 
+out:
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

