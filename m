Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606319;
	b=Bm6kRBIQMbgqAHqO8bq6iKB2/tbv4/6ohhaf4nTDAngjFAhnLN+OLKa2loCGR8sybr9J
	 ANglKkAG/aXyPIeBovdT1pQc/9glcFWQr9cm838q0YB7N/nQAuJWLbvuuRbINcZGSBLmC
	 vQ5ERsOc09ejA5dMmXLS0fcQMlG2cue+ADHk7XfJ73A1rLDs/LgUxmqahfp/EDAVKg42q
	 IV1+l03t7TX1v3HXSyylyXuFzQyEGLJ4RCYWpiLy8aGjlozyWbVeRfQJPALwFEA3ge/IZ
	 NM+ioo/4AQhu//mLnRmdABcGCXmyOE2Zu6B9TtxB8QlFmXPIyCEmgjNw3bSvrbGRS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=n7PzzPHa/4mCBK10OYpFHdY2nQ0SUiiLZ/8MiqaUUMw=;
	b=Y4iFsaJPsP+bNMQZ04D5+HZKVVWNWYZAAfX5he5Yg9lYwl3kyzfJRMoF/nzNpkARFJfE
	 XVQRR1m2Ttagztf0X1W7g3GYV9f7CmSYWKU8zRiJNS1iD5TtbkEZEB7h7HvIoqjJZAkmj
	 3FA8hadTJymmGiYPiB5lLrJfH5Wx/Bj2bAf3c4eqsWpAZxM/LURIegWNFa+KRj+GAjosS
	 AGlFy8n5I+xIwaucSGUjy0IItjHP0MKupixaP07ia//PzOpADYsLl1sfwgqjQ1t3oATRj
	 18AdwXJOIjIwddXLnx5TNeI7OCQPo/pI6HrCx4DlWwulOF6HIFWXxG3k9wjcz29ST4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2kmQ9jA;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2192606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2192606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2kmQ9jA
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso12456235e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606317; x=1795211117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7PzzPHa/4mCBK10OYpFHdY2nQ0SUiiLZ/8MiqaUUMw=;
        b=X2kmQ9jAZauNlJWXZXIdL+UMkH2O8fV3yqTUNDTPDhKVBRW0TF6c4k1+ZQocEwvhdH
         Jrf+A/+QlSk5RuBXHyEm+zSGeP96jNBIfB7PmBzJ/7qgPiW6sWmK0fjDqV3qoEPbRWyZ
         vGlV3gyAwFMLminwBDLQbbPj+6eH5nn+rsYAu3FfVavkPK9u3XXqNItOCt2WrEPF/Toa
         hsVEM4cgbhjcbiBO+Yg3Orp+faF++rAoMORfiAI49C8d9QgQ7Sd9BdcXQLIT6WTf03kN
         v230k1OGSQCXq+4lnUUfLGh7eDR+wJsdH4bt6jDAyD2kFm2NnswR2hhHELywQsqKfNk9
         ywJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606317; x=1795211117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7PzzPHa/4mCBK10OYpFHdY2nQ0SUiiLZ/8MiqaUUMw=;
        b=JQ3GX3uJgZ6gbHqLBUTayo19nlr7R/bm7yPtbRFvZTox3J4WPYaLTX5Va5FiKhSrNV
         i+wHuLcgro98UK6dwKiqBdMd2r/AdPtMhFRwzfI+6HTsJK8/c9bhRF/SaI6lTZCLEaFc
         zZeHtc5VTDBKJsdXzNnbdymdLLJM5eWuovk3r1hUpOKO2nyEMxvxOtAZClE/MxuK+siV
         YGKDIawwZZvg9UK91eEp+BFk0fBJIMO1WF8fFkq40Dk8VLt8s4X3T1D5HcIwqynwgPH/
         /tod+5foDZWpTKBexeYzVmKK7Qx4CqrJ/yAM0tRttgOWxvq9FjCMkE6jYRJCaedCV5qK
         SASA==
X-Gm-Message-State: APuU4Z+8Zo0AXnTKFnYwmvKo8CpRzK+T3O/jqvu1o/m6GD6oGOJaVlOV
	A6H5n2rRAZ180ZnEAjHfxzNtKPTvIP79qr4GW+oaWtBcmmiU+MtOVgQ+e6XZTqwT77U=
X-Gm-Gg: AYBFou0mU6CdqtJz+Gtp6zAJNX5s5NUDVQS4mayx6obMKAPZra6Ss3ppQFurk5f2P6S
	050QPpd2YAmthOw4yIGEVcOfQDLJRf9UZVoDNp5AlEjwOtPqO90w3bhz4iDuSIsukaYQuNsoeky
	M6J+2eZPmatkQYZkpeqlscMJDuvHccoomK513A67Pcwgk5oDFiBEjAC8kMbiq7fzofX9VAnMUZW
	OLY86zkmiuhe/gpZ1e0DJpLDFYQRPtxhs5cW4I+QNBX6PYGKmSzOoSM7A50MOl4q8NvtjLKai/J
	lH1YTPZ+ZAUSuFSR5AQYPH5inmvzkVfxs1nJYTOb2GiCh/gC+HvItcnoTszVd5w/kGEB4NWSecR
	MOoSij5pbValQBvFoXYyJVo3seKbaaKwlYGV4RSVS6PP4ua+RIZWDS/kThGxFfgGntHH7NwDFuM
	jCivkaIwobxPvl7WvkJtt8FG4Tia0a3HBgYb9QTlrQkG+yL/VFE/WmoOgOmRW+mvcc8+AAs9xon
	ByqM85I2qOxf+UTP13WQgGZ1NG+NrRmUSxctbrk2Y2pnYM8jRJoYZfNcmwqAISG4nxYE1yRAPr8
	gay0I4HsLTu/Wb/cvrXoVLbonl7xZ+W2IK6n6ycqep9p/BD9nA==
X-Received: by 2002:a05:600c:1daa:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb55a4ea8emr79392275e9.18.1794606317190;
        Fri, 13 Nov 2026 13:45:17 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdccfsm96131245e9.8.2026.11.13.13.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:45:16 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] firmware: qcom: scm: allow QSEECOM on ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:45:04 +0100
Message-ID: <20261113214514.229363-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Enables the uefisecapp client (EFI variables, efibootmgr, RTC offset).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..8dd0d38291b4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2228,6 +2228,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "acer,swift-go-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
+	{ .compatible = "asus,vivobook-s16-s3607qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
-- 
2.47.3

