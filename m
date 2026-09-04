Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D7449B06
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526058; cv=none; b=dt189+ww0JJavs1xwE3wcECU+jhjv2LQa4d1Iba0rVak1OgND8982pQf4DVavytG/ujC0lHqTl7Epnp+QFInV6xeenAz0Sd098aKGjkW9+/wHAVdMdVUgO9i6Bl1SjjuPlDDwiiCK/H6DwciLFzL8HriohgLEn9MMvEz0lAz9gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526058; c=relaxed/simple;
	bh=2dgeFU4dMXanVlsum2W2x7rzNpqIqmTbXZG1r/qGXIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7R29T9hDrZXw/8IiuBtjo8M+SAgnJOEuNi3sAUVLm0zsydB+qezSTH9ulZ83Gs38KT+EZcBef1geHYABW4kTImxKkJcD7RpooGWO5LIleNAkWYCPNBbMn3J55Np8avA9Q5p8plCWHBNEwLY3pjT9OPNTMls20O1oYBTVpY+pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sd6w1H/V; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sd6w1H/V"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso737235a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526057; x=1789130857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5ZNcdofv1xmkEiwkoEej12YoH5SbNFwYgfq+H2c2UI=;
        b=sd6w1H/VKf5LBrTm5ZCvgYA2nQVnxhEmxDiPWzMiQY+4pakC2A3iq9DXypPw+UWp86
         Wy3uOKICPUgHzu/HWTAKcGoAkS65R6KcRu+Ernhul0zjx3prMQhAavSvMpCCN9snYRrA
         6aSrlYykNLQqGrQXcgXPdy31Ygx1GJPdwRN7f4ItuiP7JzTmsyidAhXO/WpwtRuWlTw0
         pw6NkejJY/2LX2UhU6C7GjP5plv0mIYKtSGxBG2Y9cF5WjMhBB3asxKoQn+Er99BJxZi
         naaGtmYylZ1YMg5I+7jxk0jwZh+xUBI7H3o/17KfUgg6AfWGkwVdH/OI72QkMB9OjlpM
         opcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526057; x=1789130857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5ZNcdofv1xmkEiwkoEej12YoH5SbNFwYgfq+H2c2UI=;
        b=hsoGKRof5ExUMSP5i8WjQpAs+JFNsuYz0MfE+qJeleJJzp3kuYUbOL6HmLab9ODvlM
         WZQ7CvK3xfCPLs0nv0r3xmlAucN3orBNXT3+VQZdlJm3e40+bvFv4bbWGTFOymKVsSaW
         /nKPeGtwnsmV2wE+6HSYnGW8T2IGpk9CLJMNBw4fhdSXilxPv48nX+412jgmeCrX8LfU
         f9uhJ4jHFGVt79Mc7ImR+nLlEcfx7YYaClMqgDRTZFaarhCsTWtYAwn5jIzhfuQknpch
         S6OVa5NlP0vmQy4c0/9Jrp/p/e67ohERWdjJWZ/XEDubL4oK4Mrn2LgLNueShZlNPG7m
         bCbg==
X-Forwarded-Encrypted: i=1; AKwUvBwOMgzFxw7Po0xd0Mn+EMmEga94N5vRKb2eZz6NCNQmJ/xb0Fpj8wDbldqGSThBYjJtmOmVEaQNZ0izmsRU@vger.kernel.org
X-Gm-Message-State: AFuF++nnzC0NpLnLfrw7tKerWIZydYNrDBc5sT3Uhz2H5C8o+4DXuBzo
	y41L9kuYdAOF6L5qF+S1Zas3FtJI4mgcHyd6JufAsKiMOem54GLaeZe7
X-Gm-Gg: AYBFou292YcawBcYqG7sEMaswGV78zv0uygrVbagv2bWbdbhVDSBBIkGhZLaCZU4rtz
	TM6OuwCcNhytT4zRUwBbs7PluYZMeN7lJj1L74YAY7/GW0wa5teS2TlgPGm3Yw6CsZGI0YTRBKU
	Jqht42kWJ4Y5Rfeg3xLiWcWiir8gVRX8YzpShm+2q8x5WCyKGMEBuNxceDVUXHQqa1wEC96LCA6
	OF2g+dE0L00F5njRt6VTYlNz9bUd1EZEIgjyC8DX5VFoCS6QnVL+Ts7JhWS/x59vOKuO4C6qGOB
	SgliCZxKA/U8twTFofZik93QFyaUv9fUa5pNqYUZ7m1mxDbAieOW8ZKDez5uP4QpU4oDj5Q8rML
	rV8KUqGtPueKjEq9so4i8yuXVImQJ1zmxx6aYHyoyEkLstZB6y7fDE2ypK+wmeXCteJNdG2qgvJ
	ThFiu9UhTG/DPS4tFZ2RQQEnEG4nN8gvUdQmT5D8wHrLhDbLLuSTXtMULQ9Qh31+nw+UARPY9Jo
	2OmVag1Lyol9bQ=
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr9681789a91.21.1788526056610;
        Fri, 04 Sep 2026 05:47:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm4553800eec.17.2026.09.04.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:47:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] mhi: fix typo "intented" in comment
Date: Fri,  4 Sep 2026 18:17:30 +0530
Message-ID: <20260904124731.9011-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "intented" to "intended", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 8616bacd8675..65e8a397cc50 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -687,7 +687,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
  * Resume the device irrespective of its MHI state. As per the MHI spec, devices
  * has to be in M3 state during resume. But some devices seem to be in a
  * different MHI state other than M3 but they continue working fine if allowed.
- * This API is intented to be used for such devices.
+ * This API is intended to be used for such devices.
  *
  * Return: 0 if the resume succeeds, a negative error code otherwise
  */
-- 
2.48.1

