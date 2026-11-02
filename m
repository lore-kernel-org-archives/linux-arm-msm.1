Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579664;
	b=AYCsP1MZ04Fng2hb/BtqiXA9/tf0KfPsb5okwNqLGFWRmwN2K+OEQfgoZEkdU2D+76bK
	 9ZW0hiYfptRYDaMjTJQHqqTyOB0BZdg44P9dhdtMQn66b8QctWcczW5UNZzpYRkbeQGGR
	 XCzt1rajyWYv7E5tTQFwZGzhMj+QC0g1LkUJ28P0UG83ThujFffWqv7e0mV9HSFUJSwJH
	 qEkrnN2Ej4SVoVWrI3Dr78BaFeXGN7F3pa7iUxYrfSBQR51QxGf0RnoiDev2h1ncmpspj
	 nkZOQJWMHmF+NssZw4Az3NJpsyvP9VI7sWD6Af1qoNJRJBS5/EgYzlXytTDM+874pKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t6BgGV0l/xNQelfhYb/Yd8iY7WjY6xtp0Q45DsnSYHE=;
	b=xSZ8e9Os1vlGYBkbPixQhn8ZatnXxSXzrcA24P5x1ilS1HxJ0hpcFi6kao9/uUH5KDxM
	 YwVzISpgtTzBnsNWT/HONXsrQEbxVB9Q/pOQUGGqiDtaugcwlNNM14xcX/AojyjJQhlqP
	 1c0fNBidGpAhufnPhwa90nqxZ13icXU/UsbQXTjiB+3Fky1CeUVCU3LVFepCqqdcPbuL4
	 I/412VsOGbPQpfLpPUc7xq7EkDBC1iZQlrpAOVq2D83Hqdc0WUE7b/y+w+mMO9y/5Jmah
	 2TB3y8zgBkHVoPozHqMss17skLnCKOXh+SmgaEPpEsspx4XOeaX4aSjSMq8kAwlH6yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nV1PMwl4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 00:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nV1PMwl4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so18416245e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 16:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793579662; x=1794184462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6BgGV0l/xNQelfhYb/Yd8iY7WjY6xtp0Q45DsnSYHE=;
        b=nV1PMwl4VHAHqIOl+VOqC5R1iPcDuyTrt0MB4SB3sTi+Ly/Yt9pfuUyCCbx+Jlan7M
         NnlKwdJIYpcAS9cyPKnFhPWGIDoxcXwyeKOOYKn2k+DGnyTNslTSxub2Dro1ZTn0h4xO
         SVNX8ISsy/VlInSqRUVhEN2vEdT3RYAjzDc/6am1hOa+fiWe+brneZJum50JT4q/Ttip
         x+NRpWiv95FZ0azw0Hxt+58YJE1lf5V8xjc3a6ksMuiXpAoQZXfYTjQ7bZlbCL0Y4hjz
         7zwCb4bEUNSzN0cM0W0lLXLxev9SkjMQ/hzcCSP+jOX5onvsFuvUwvfzYcIF7zifFd+5
         YMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579662; x=1794184462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6BgGV0l/xNQelfhYb/Yd8iY7WjY6xtp0Q45DsnSYHE=;
        b=GbZMNrdW1Or3sQjwE4SVTb2Z4XzLEIZPf21izytvQ6cxfZi2p4NxT7NRD2ySa1OcXQ
         Q+gj9hheSki47NOaRPK4SUsUPdThhVeeAapCBrnt/qgxXDRVc4qLecTJoxlshA+0hM/T
         s2i+JwYLHzzz6/M325+P4133Sp2XFUUmYgMHNB80P7AphC5PMawO4HdOTd5VjHgnbKTa
         4fzRsShsgf11CpAbszM/Md37CwrMzeDZ5WWlSlvOV70kbdAyLQUGtUlOxQTZjP8fTOni
         VPmi7Oum9CUf/zIvt1usGq+pfzqMTblPV2NM6am58m5gI/sAOQLP9teA1D+4CmxCJxFY
         oMiw==
X-Forwarded-Encrypted: i=1; AKwUvBxhRw6SOo5qDlkml4WAt7zIpIWQd/fx4ON7+STH3C9cnaXg9qjJkMPNspyHuV0k7dVDbJOwAYBU6AGHT2Uo@vger.kernel.org
X-Gm-Message-State: AFq9FYKu3Z/oP15fbM/rHK6NhbNdIUUlYx/CvMfOwXsifbxG7uu1sDG1
	og8IpgiuLhgp54pgs6J5zVHkXQhNNcP2hQcOjAb5PTYjlaSHnJQYNw4=
X-Gm-Gg: AYBFou34w0fKtOkNfJ/auJ5/Ma05F/gy72bGYxSSdPbGBYyWGPee/5E8h49qt81SbOm
	Tg/Ys5dXVi/ZvnU4U05Y4YODd+NCGmfbFj2K6RJ8PpkpVfFjUipDfpe9ndhFHEyfv95A+TGKwUu
	ox65oTf1shi5sfneJ1naQXZOLd4cPovfGgujU28Tctvz4kOnXu2/kbER00ZxA9ipTSl8s3uXPjf
	FV64J8ChZU6e8Xe5fJcCdPSGNFrVtJ6qtp15jNufCyM+o7IH+9or+VPo1o0rWqH42NfCnLvj1NG
	1TfHcuEbXNxr+I2taGRTIwuo7k4t/ZRH9Tm3JCF5WwOAULWOJ/FkMWWdeA2aB3BxZ/IoMrUFwv7
	/cUy3foSEdTkhQEBuvmdozW7o9OwfW314DLbtWQTJ+u5KkWKnHSDPdg+zRmB/D/BuFTg4dPuY8A
	/q03XFPEZ0Ctr9y4OaacsipgmzlOuATgWBhput6ROsItOm+Ubq3zi+vAnBRB51g0aIJzZVV34Dh
	BqrePHDT4wRhJ3ktsKlhIKiaOXnNhpsnSggplqdS7jSlmldKhvCv71nDW6x7ajtU6knh2PYRb7g
	zt6F78sECx7jniWJWI0IlVDBkJ5nG0d0OP3K
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr205930655e9.9.1793579662262;
        Sun, 01 Nov 2026 16:34:22 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm16739755f8f.10.2026.11.01.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:34:20 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Fix printing of a fwnode with %pOFn
Date: Mon,  2 Nov 2026 02:33:24 +0200
Message-Id: <20261102003324.340577-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
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

pmic_glink_altmode_probe() walks the child nodes with
device_for_each_child_node(), which yields a struct fwnode_handle, but
prints it with %pOFn, which expects a struct device_node. vsprintf then
treats the fwnode_handle as a device_node and passes &dn->fwnode to
fwnode_get_name(), i.e. a pointer into the middle of the handle, and
calls through a garbage fwnode->ops. The error path ("missing reg
property") therefore oopses instead of printing the message:

  lr : fwnode_get_name+0x34/0x50
  ...
  device_node_string
  pointer
  vsnprintf
  ...
  pmic_glink_altmode_probe

It was hit on a Samsung Galaxy M52 5G (SM7325) whose vendor device tree
has an extra "qcom,pmic-glink" compatible node without a reg property.

Use %pfwP, the specifier for the name of a fwnode.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..6f3737b096cf 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -596,7 +596,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 	device_for_each_child_node(dev, fwnode) {
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
-			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
 			fwnode_handle_put(fwnode);
 			return ret;
 		}
-- 
2.25.1

