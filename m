Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325649B45D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591411; cv=none; b=tql+E8f+/k4fteCsh73PJdD5nsJ/wK/PysGrQn1PyXw/7nYzrErkGqmbpIG6AOoFF70TtTj+fyQZzN3PrcxNH+zXKA3g8V2+S+vTUR1JYbFMtpz5Bv067xQF+SrEkobQsZGFrlBDcCLsGtunrmcS/IRIUMcSwRZUtw2QT928ObE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591411; c=relaxed/simple;
	bh=7ElspGVGTSSLssoWG5anEWcOuqzB+d9ZPuu2zqwQF5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=linYXYyoTzriAqYYcmYO+aEAUMbZnGANuIL8jO7OWAVx4AfOFeu5iybOA7HetA6QC5J5QRU8Qw8bDRD9ffEtr+1yJ0k9sM/o5Bgp4RJdOVMyCr1ngr0maB8nzjB1MdyrK2Pt39KuOxpeTLtPnYfAxsl1JK1VjNJfDdEaj/Hn9to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMDYg6kZ; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMDYg6kZ"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfac63cc40so1554225ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591409; x=1791196209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCn04+uUjc4Puwo2X+70SQYBQteH/fiUqqjHU13FJ6U=;
        b=gMDYg6kZEF+2Ytmk3RL05EuK1VN9XZk6Sb9fD33MgeqjVmdKJ1/gAZVBVBC7YF05kR
         MmBUHV+mUQ8LTcu/HDzHzMrySqzyyAsvai34MrhePvtNWuuro51ZZEMccXeVja4E/aGJ
         LPFFYl5QFtoPJuOqx73QL3NbqWkKqa4fG4bbhbY394xSSt0mYL/l5dO+gdNUnurqzEFu
         ORhOpOU59zPBb9ArsANfYyCB/k28IuUkeuJ6ylV57tkr4YZ+7kgMxRGt9rJYb7nphvd5
         s2tjm2ZmXL2ziJeeVGB1xnGXUUx8VIP7Wtc/HzY0Fw8k488pZeYQni5MI6kPU7QNbVP8
         2Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591409; x=1791196209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCn04+uUjc4Puwo2X+70SQYBQteH/fiUqqjHU13FJ6U=;
        b=HTaCai8ghasIq9RLIqoBm5kIL1im0rylVMyZs3a0vxpAwcB9wg5ZVhrQu07xClU6jF
         4rMCYGCNNyxqSDBBlqwGjk1/aWpboGtmd9C6kHz4d7vJPk5Uv83NT5Iwn8I87rVCeJvL
         M75Auc/M3CcayQbHbs6qmbjQGjA38YS7hRL1qcL/1Fxp9HHPR7L3wn1NCCw/d7yJxk7F
         Lu3za+zgCWPUteMTTToqp6tPlxlz0ei8zyvRM30z2S8Shc4B5D0N/JelHwkTE3dIu3zs
         gb3jSz8WuXEEu1Rzf58kSaBR3N+aYhJhBPJ9amad8zyzlbfp3sghwUwCfhmFkUKdXH4w
         dSQw==
X-Gm-Message-State: AFq9FYIkTJYfYHo+8Voxgv8lQZVgG4wVhpOL5nR6vNCn7cAVIw0OYu/3
	7/opBH8UYorHFa25n+UXsDAaHWqhGjCkcwAcIH1FE6NDtrEEO+crNs1vlKdA1c/o
X-Gm-Gg: AYBFou126nKt7S9W4FrA8mbCSfpY5K9bXsJM15ckF/5PBpRjLTuNZX3yqH0pSeM4FDC
	3kO+7Ij7D2+Eb7ePJGQsaZrAowFZrYAAvZdC23kKx895W/4D7zj7p7y5grHJeJ13M4WEz4UVXos
	+JWpy5uqRrRRSrgWNmApyVEu3KPKz18KsUJLpKee56C5IkhFe4GG1vcbAenXN/BzbI876GQfeVd
	V8KX7iDO3EkKsxO1B4tinTTg6kNs63hqc+CRu3kPYNMbhP9ONFmx5KDPONUfnI2tOnZmhIEn2Cn
	4qTm0Ov/2OScWmROxm36+6ioyR7be9Q1XZ83FHHlHNiGpDllvpF6f//l8MKZjm6L9U2LTepRCFS
	y11kJhfxEJzsDGjZaaUzXLUlg1rTjtUfc2GlErPty0GaUKxifrEupYs2K0wzN0WgoxQVjEJVXWt
	gzsLabISNa9iunujnLvvZwJ9Gm04TpABnuGsIVWDXMPyW4fPquYFH+h50He4hajsoqKu9xL7P6x
	gtxjmZf95fCiA==
X-Received: by 2002:a17:90b:39ad:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a0b21d2233mr13678139a91.0.1790591409045;
        Mon, 28 Sep 2026 03:30:09 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20234282a91.4.2026.09.28.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:30:08 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 18:29:43 +0800
Message-ID: <20260928102951.18369-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928102951.18369-1-liujianfeng1994@gmail.com>
References: <20260928102951.18369-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hamoa-based Acer Swift SFA14-11 provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd7541..f2d2a05c910ce 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2215,6 +2215,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,swift-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.47.3

