Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01C511E93
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677928; cv=none; b=rVS3UFucUSZcD8P3tRKN9v5Y3mzX71xTgWRrxRRMEDPgoCcCElUikCZPW6fLwGcpVgZN8aGXG5BudCSq2exdxl5kzV+fK5lvmdgwD4z+NnCE8eEriyzBXmVGpW7X1i8w9FGom1DLnULs+FcQe/4hotnJSRLOvddOVbHw5SRgzH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677928; c=relaxed/simple;
	bh=4qopj4ITR6b3lFeSA46Ud1bcZg3mBy1B8KlT9LXGIVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBQSLy4NRjqa2Kz/USHpBgh3hhNif0roNUj77MgjIsRAlOZaSIDQh7511rdRsm4l6b8gFmsZbMp9RXEFtfQxkUooGHl1aLPfCCFImyGhc9w3oB33IyQXf9yB2ED4fU7nKaY5yZtj/IttXpi37uWPhEaPqOgcoYJTA3gq7ShwYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5EuV84Q; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5EuV84Q"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b3e7bc3so149917a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677909; x=1791282709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drVHWhle8VBZ46Gnqfrb8FAL5dCpUZourJung9rgM3E=;
        b=A5EuV84QJygCYxUJ1pXGotI44H/C2QGR7Nh6/7UipC0ufpskXDhiDw4tS8osgougy+
         N4FY5L0wYBMuWr/HBsQH+wQLQOL8Z1p09vjg+ZJMqaG09Vn+ZTwUI83x0rKPYskv9hQj
         Xz98dRZlPPn1+zBYTzEu9+hRLsykxsdKqCAyP8ap3SCfeqZmCFW4qn+iI15m3f1+20Lq
         5gRRtqbyrrfCbw5XcqiyyFhDWp/UR4+B1ey7RWHQIGXobyONMqzqZKbnh5IOJ3MxQNmS
         VtdU8my0eTxnbO5vlbbEwRboEE65xJWDovm56Gx9PyCCqjq5Ggcu3iavOLO8HfE6oPP/
         Q6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677909; x=1791282709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drVHWhle8VBZ46Gnqfrb8FAL5dCpUZourJung9rgM3E=;
        b=cQ7eFMBk9Qbwo81zHZ1bpEQ5k1A5xxGLqu9TZ+8GrEvyN5tjxvqXxgjuj2XjivaFmX
         C/XGzV1n1BsS9HZ7Sf+jnJw4joP958yeWr5kaSDpGrDLEkn3YIHyvwlZNk4VVC4bK77U
         NkIi+TluCsyi63OIeNP98zzDX7m/kjOoqRrhsfA+osMMfX5jwJhv4I7198dpJ2ZvgTEJ
         S+vKA89WEV+xxaSdxfya7yUZvMRFy7v8MpBMb8rdseexwXtVnrSv/nQh1myFWWDx6gWk
         3wr6LFUbC/O5oJCftTvdvsnD9R6XXMoRzJbsPt7JimrAIJfd/lopRtADthLOFx7OpDNh
         iP9g==
X-Gm-Message-State: AFuF++m8QuSABkxvBhOy//93K9tU6N8ovvXwFhjarF/qGScZaSXhj5Oa
	+WNkF0G/rV1YAwvWZ4rL5ic5P8kMr4s8eEHqDPcjTTH5CNXt9jxq94xNg6HT4w==
X-Gm-Gg: AYBFou2RRTEee3weoZ29kNoU4JVNI2cDqmKpWrM+Pi8+0DnszTFhLa+g7pYUcLJ7PG4
	Z5gSRCsnrJfncEiZItw0XioKTpzn6MTVtJ34gqVsqiD6e6CblepDcbz3iqfsR9sbhmcAYboGDNs
	bv3TxP1D9eSSsDxbLgPAkyiDpgh0BG6qPtQQ7wrD7XKTKblP47Bc7l3lobSNb6Lu2GZJ7pP3uIp
	LoGZEzmqUrLqAO8ydhnjhYNx53oNiBR/rp8Y53MC50WxMI8xRbzHkG4pdhK+vTS6Ctp3UuW6sA1
	pToG8fS8pXWfHzzuQZRGYHWczhew+xJlE+D+zcmfFUJkbFx4hYt4fOu9pW78Gfkstnfvi9jPcWB
	FzJ0A9j2Ue1CUDZtb4pKuUuky8S+u3tCrS4mThfujBnn6vv7t3NfnsNscD7GacwpUE+fZyaqf0i
	EzuCiGqWojnKgb4GYV9PencW00GL3m/h68u7OJVRbnlGmtagFVfmhacfF5USw3lYcE9wOjc6E6x
	NPjijtmqBV0gA==
X-Received: by 2002:a05:6a21:4ea9:b0:3c4:3538:d8c with SMTP id adf61e73a8af0-3de22dbee41mr17588321637.2.1790677909397;
        Tue, 29 Sep 2026 03:31:49 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:48 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:28 +0800
Message-ID: <20260929103053.10241-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929103053.10241-1-liujianfeng1994@gmail.com>
References: <20260929103053.10241-1-liujianfeng1994@gmail.com>
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

Changes in v4:
- Update patch mail with commit changelog

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

