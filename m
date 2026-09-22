Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269837F8B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042296; cv=none; b=qjHI1nuQHo2ggrrqpqu7jkSjhBq7jfBDoQqNHhi1moBsv/+Cgp8EbB1Fg7laSLTu19MPUS7kQ2EDHH/D1PA4oJcCD1k56urWYb2A+tDZbEqurEcdR5zr3igtHhwC0UyeuBaCh+9gjFsjeSTSRbMLdrZscgvv6v/A0FP6ksoQEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042296; c=relaxed/simple;
	bh=gctHxb5CeHNe2axULrIQ/z9ntCHsYPv+bbIZgiI2ems=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnPKsZPNJgcc32ADxysmpfny00ujuQw3p1cxrZlUgg8OoSyFY/HoO2KzlVTuz7JhptQA3PrpAdLlQiyOlU0GyAna6l8jDFZwmnUwSCCEStQLoL3Qt3X/ISTLPw+M49zzUI93GWA2RaWuV4TNZFiG9exom1o1Fby4Q2aG8lpkhrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmyeQz1V; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmyeQz1V"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso31750476d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 18:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042294; x=1790647094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbYQNJJ7cs6bqg+2N1+H5xlgpLBT5L5nS/rdjvSWGlU=;
        b=DmyeQz1VPf2BBo5XyyQApUfvfUnoXlVoLx9+Du+PtnuUDEojmvxtvq/4T2XlmW5vXo
         pviMAdwXipyYxyjS3Jco65kiAijHkXAireY3FqECb7D/Hs0kZfSbgftDNgOozw7IYZmT
         Hw7BQ0eLkxK9Pac7KRwerg+65r324X+XfzBSxUDr27DH3xLOMG5GxQbtUIGRSIbRN/8L
         Pwo5kwpzkoxmDEeiohlBh+VVOpV5wjCi5oYSG+Q+rT7x6Y803bM/Zu952oYX3XYAOCK8
         Prk7sJ8HvSblh00jAQM6d7S5zMJSzGq0w5pwB1xB00nl0opuS3fIvJekBwOc7dCj7j6j
         QqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042294; x=1790647094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbYQNJJ7cs6bqg+2N1+H5xlgpLBT5L5nS/rdjvSWGlU=;
        b=u0KcxyZ8R4sDNlfP2mY2vppg0Rb03R0dP/kg9z3YaMiUIWqrslUaRoASC4XGAFAJpJ
         iUizgK0t0WkeHF7GXrk7UVPfND9seNMLD2god+yGKxE1gp3KE7JT/eHiU6eknn8P7QBx
         xEkNO9+2ik6J2x7NWUW/Q0HLSNXf084x1cjvJ60fJcb8CNKf213+Js4b+WOkbVhxhKCZ
         8NixkI4QlYjQ3QmBNUjtHwFFfqcg3igAd/H7mSS/ncIEfOAcyAYF1Ink4EqLMpIURDi7
         UR02iuPnG46+LM3EaMXTF+ZrIg8WWbJWaddM5WZq3pt3kRtoy/6KW9ceL1LGB1q3WcM9
         C9nA==
X-Forwarded-Encrypted: i=1; AKwUvBw2dsBR4wKRtEiY2GVL7R3uL2rZnl4cRkIESJFSofFf++h4FrvFJGgQA+w5hAfpNQcRY3rAQxoftR+gHQTX@vger.kernel.org
X-Gm-Message-State: AFuF++mRgRLiI5bZ3kxKQf/ONFerrpfNwLuCPVY5w0JZSV0oPYnvrHv4
	Mi9ovr3N1lAnivdvdW+cZ0dD6wjmaU3RW7ecI+TnPWru8cBKwKgzMX+W
X-Gm-Gg: AYBFou1q5EXmcZ9kWJYPNoQ5LCLfnByEmyk9VQ1+KSB2a16ees30GpuLFFWnjS5/cRC
	MgzeM5mmX+iJKzRXV7qPZujIlZMcXWoAaJmUdA4Nq9T//8JLCGPmXw0Erw4WBYrBIaN6hEIljP2
	X0pHxBfNM0jMUbXDMCw5qlKquIhAAz/14JrcFA/qSQBFkdPWeLYrPDp29dHQ+8q/EIZIxYHUGpt
	LEHhqlVDYif4fbFY2/XMLx0NPVw6f66Y5LkgZx886C3D63pcoYgK5AZr5ZdAv9E9/P64AA6JiEB
	1XpMarilWUHnymWY0CbrEJj7ZvLJNc4mxet75q5v5cKtCZQBBcAfLlgnunAq3YnmvhWwJoTTdD9
	mHbin3lxaoW/UvETfR8hXoCkY1iq/dGXt3UYmS5n6foOptyqp+XmkG5A8/Mm9j7UOzqDestbl5B
	baoVxWiF57lIgpEvDgVaAuy42S7N1xIy3lr0AGSQfT/9eE/7c9OPjS2yYjSz/eC1FBKRgkoOfAP
	A==
X-Received: by 2002:a05:6214:19c7:b0:912:517b:8f5 with SMTP id 6a1803df08f44-913fc95111dmr35899676d6.39.1790042293778;
        Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250a43asm3952866d6.38.2026.09.21.18.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Mon, 21 Sep 2026 21:57:55 -0400
Message-ID: <20260922015801.32373-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 since the driver
requires the load_state.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5272a462fc49 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.55.0

