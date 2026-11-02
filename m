Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591579;
	b=lfFxDbCIT5RCM29LcPwch3V31QXUBIPJna8OtPYWdniN7uXHWPrrY106UjUYFRYJ1hRf
	 uIrIUNDvREFuWvUQU5KqH3pO2aQkpPunTr3j/5YJ9LYnc8Y+mfParLquTMqJLWuxFztVn
	 Apclye7FU3rlyWHp5wzUA8ev1pC+0eY/J4PuyVRpoEMGrf9WiIoyu7M9WyxIiUHG/HbYU
	 Y7r8g5JUCpvBWfAeTE0+2qC5F/Yw9OGty8N8RypyYurL/SK4jSveAjWeRmC9122M6W899
	 V4G0HIToWxuq0Vvfz2VjdA+KHo1yYJYTUP44JCpJ6Qqzy9xBL6d1c3CWKgnacxuA09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
	b=j0ECokwr3bo974R2mAbMoq3RY9X1z+4X7znGiUrw07W3vY0FJrJ4xN0uvFyU4c3+03DC
	 Xl4AnH1gIKLmmJUurc1XOZWsdot9yCB7dd311U461jKZz9meDnddLAa38AB8/Zc98L7bD
	 MiVNFkNe9xwd2N4agr+xczO0QFHZlM3dUkxE7k7q2UQkyFhodWxNv3RCj5weKXj1swl8r
	 67O1E76Y5XOw4vtc1CKMTdeTtFE19x1it9MzCUtrihC4iFw+lC2k3xoKwzhEZi/W1pyoF
	 hOkEVwpaR5t78eIQZR4Cwre45cfNinK6mn7Qgi8x4JTEA5tQvY/xKHUWUbKHq7eVkFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MWK818G;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0A606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 03:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C0A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MWK818G
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso946187a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 19:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591578; x=1794196378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
        b=0MWK818Gv28nmlTZO12RnNRMhWyi8fhmOjVscQpXx2kRVjMDCPCCYP3SdiYSpuC5nS
         TdyNkGi10iE0/mH9ZaUN7V9IC+2sGF92ZZn2ClOlgB3IwitEfOVVu6Wq+Brh8QW35R15
         iEObQv7eQbKWb/IhUaQ7/TPyavQJodNOn1emrXPgD1XL1P7vJcD8ZQSyhlgH7mOJtwrq
         7ukFqIHqtIzvhT1GN+a3/5yefuvLScma8vNQV9B9X7FrWItWXfdYc+Y1nvDTSVvUKQgz
         JPNZrPZAGwZqavUPdIbenu0Oc33XFW9s4PVxNkmDxWrT2vhnI24F8iRPWdg+DOhMYZVs
         EcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591578; x=1794196378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
        b=Yw+9EGAG3+YwFrZE8eyFwn76y+Pc+xDrkzdNtcaZfc2tn2ZVENMXcbYuKs1IizXhpM
         GgkH1vuIeDfocUWV4vkX+eUfj0v5Ljo20cfOyNpqupFilMnEp+9auXTYiECir+zbFSZS
         cmHFGnSVrHITN/IVu7eo8610L4hdr3wf6gUy8tNdoP4/qh+AevWwwLf4Xt96WB3xfQIG
         XxYDt1b9eWLO0P7s6IMndlQrePP3r9DmL4cZu8tUCmZRpkc0XhQKXYj1csZcRsaXw6z0
         njHqzVG4eSx9SnNXXLuhCVteW/YjYS4h5oOvrPuO3gHjy+ohY2C8767+I6wB7cyoAdKp
         EDgQ==
X-Forwarded-Encrypted: i=1; AKwUvByCiHP5u0MA0kwBDmEL7hLRN0qB3OU9TqKXTpSJ7rBGbopR+V1Cjk1u6iD9NwH8rSbZHQ5ErD5UqBu2IJ5m@vger.kernel.org
X-Gm-Message-State: APuU4Z8tDoKmkmiRQaF304lO6cBCKjG2bhw89h/Fky3fgHVaSEuvFQRm
	AR+kxLe66Eks38oSZR/GCCUTXjFxOs5dPkYKq81uPsj1Esk/wL+3/dZg
X-Gm-Gg: AYBFou2zL6QrP2yI7MNneCO1JRc/y0tYeWvWRBTQyNmbCKTDO16E2+4VUAfBRzpUC7k
	zOy6Um8Iw6YHdaekPsFqlZ0EITTC755fNYuJCf+W/+IY4MtITp9MK5dpg69U1m2wpyesP0bgaxM
	bMQzrN52IKA2wuHHn73NNM2lCZ5ZP7TFRfvYGGNpxOBvwyjiEKMyadqf5W0CsrNVhwhwvfkiE7P
	yew6aKWTc5Pah3EaBw2TviYNiE09F025PjgQdueWj26aJ2OZ/o30jCWDirKKz6cHji5JWl3BR3F
	jSrGgYNKH9XlsgJbCfCY7zFFJ+ul0/UMxim48SJTAS0U+V0RApoidyUEUJL1mxVbdTXWyclz8Hg
	0QecaTqz2AeyKLysyT9m4eH0nK7znKQOEeopD7Okvu2h6K3wedv3VyOjOj1Q0KlubBVJikIWQiG
	3HbgdAOqlptWN+l8IWGZ/LmXQ0AKBgLY4RkRereKN6YkPRr0dQYnW8tebEPXWn+ATOdTKDUwGVU
	61kmntdKkflzF2XYqDQW0FilO3iV+3ljDG0tIzY14vCrGTYmoxXnfzV9TFLGCMrNjeP8jJ+jmTp
	M9eIyiy3ch/mADrCPEkx/+HQ7S2MRA+Nr5DeKAaHQl499b1e1q/BKf2Z3LDksvvQxmw=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr6935025a91.11.1793591577770;
        Sun, 01 Nov 2026 19:52:57 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:50b9:9b10:1e19:1f0a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm6998814a91.4.2026.11.01.19.52.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 19:52:57 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: wesley.cheng@oss.qualcomm.com,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: Check the return value of qmi_handle_init()
Date: Mon,  2 Nov 2026 11:52:37 +0800
Message-ID: <20261102035237.56253-1-izaiahsun@gmail.com>
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

qc_usb_audio_probe() overwrites the return value of qmi_handle_init()
with that of qmi_add_server() without checking it. When
qmi_handle_init() fails, it has already freed the receive buffer and
destroyed the workqueue, and qmi->sock may hold an error pointer. If
QRTR is not available, qmi_handle_init() returns -EPROBE_DEFER and
qmi->sock is ERR_PTR(-EAFNOSUPPORT), so qmi_add_server() passes it to
kernel_sendmsg():

  BUG: unable to handle page fault for address: ffffffffffffffb7
  RIP: 0010:selinux_socket_sendmsg+0xa0/0x590
  Call Trace:
   security_socket_sendmsg+0x29/0x50
   __sock_sendmsg+0x43/0x150
   kernel_sendmsg+0xd6/0x180
   qmi_send_new_server+0x1b8/0x2b0
   qmi_add_server+0x165/0x200
   qc_usb_audio_probe+0xf4/0x2e0
   really_probe+0x2b4/0x850

Had the probe gone on, the error and remove paths would call
qmi_handle_release() on the half-initialized handle, which destroys the
workqueue and frees the receive buffer a second time.

Return the error from qmi_handle_init(), so that -EPROBE_DEFER defers
the probe, and check qmi_add_server() as well.

The bug was found with kbound, a static analysis prototype for
ownership mismatches at kernel interfaces, on v7.2.12; it is present in
mainline.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings. Run-tested on QEMU (x86_64, KVM) with KASAN and kmemleak, with
the driver built in and a test module that registers the
q6usb.qc-usb-audio-offload auxiliary device. Without QRTR, the probe
crashes as above without this patch; with it the device is deferred and
removing it again reports nothing. With QRTR the probe succeeds, and
removal reports nothing either.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    The runs were on mainline d135ab453a74; the code this patch touches is
    the same there and in sound for-linus, which it is based on.

 sound/usb/qcom/qc_audio_offload.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..5ee568e0454c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1969,8 +1969,13 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
+	if (ret)
+		goto free_qmi_hdl;
+
 	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
+	if (ret)
+		goto release_qmi_hdl;
 
 	uaudio_svc = svc;
 
@@ -1987,7 +1992,9 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 
 release_qmi:
 	qc_usb_audio_cleanup_qmi_dev();
+release_qmi_hdl:
 	qmi_handle_release(svc->uaudio_svc_hdl);
+free_qmi_hdl:
 	kfree(svc->uaudio_svc_hdl);
 free_svc:
 	kfree(svc);

base-commit: 56abaa599bbbee5500e166ddb0b5241a00c1f763
-- 
2.53.0

