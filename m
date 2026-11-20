Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168758;
	b=rF7spYy1A2lZkO8bGVnYQBZF/IYU+PaA1wHJUViSnGldOxg+LpNduYmRGJ8qu/6TrXSx
	 IR/REmVFeGhi6HmuPiw2iTpMZdT84bBNWE479vHRib9huEYXporveKKG/HvSy0vFq2YLb
	 RatBz3zZUKrIyJ4X+ZSfcVF70zr64wOi12q6+p6T6+O8v8miPLzJU177Ykgv/9xTupQUf
	 OxkCcL82Oj2czKhTdAXCDMiIFGqzUcJbzTt99EX23KwcaCh3j9x+lXl8NWeemk/zvF6Rq
	 mtnqaezGq8FOsQafnQRdA0MBEJxBl8CYdl51qgO0+Bpr2Uv35qcPQxYyVW3q82c1dPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=EsX/I2j/ckEWABjyjh0CiURx+c1ahl3Dggu7o90Iyg8=;
	b=QXFP4PF4RXrHWUbGvfhvfcBEaBWRPF3/BwFNKHH8cOsRXcK1WOWrH3/QJiM5dn3v89NK
	 ZDQC/bAGg9XSBusFRuoXS9UPMZEATAD/rCdrXY2jLxKJ8a8Q/4DWqSvqUeo52Rc9gQ6IN
	 dEJDl6uDr1yn+F2xWYYUs6yrzmYz4Z6OcPPwhIFdChVrhewi5l12tgxXFS5m+B45GpfIg
	 s9HLn9hM4C7chVoYkBhTiro1G7rrd8lmGG46XuzgH5UhHjYjp2bAZdUWZL4DhgTId6b9M
	 vcPopHtjl52phKDhoW6M9GgGOKlo3btdY9QdShpMMo7pC7cc1S16/1l5dJfRIrnslfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O8V0pYA8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA3606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFA3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O8V0pYA8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso7474375e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168757; x=1795773557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EsX/I2j/ckEWABjyjh0CiURx+c1ahl3Dggu7o90Iyg8=;
        b=O8V0pYA8LuctVmSZmJESeCLmGX6vN46pbUAwPQt1/GQ6dQOtrAZc1oxUAEIYJDqfaD
         76AS7vV6EZJq8eBKBSyyJxoPL8uKL/CSZ6YnEFzjtBniVkotmx18TIPfEt7eVvR2Jw7j
         OLo3OPqUr5naz+Z+FrkdtYb2g/nJKRCM17M7p/fBk5ylklgqcrfIRn59MvCAYojz+ydd
         1cmvAF204ZKksSqjJ+1nqCgH243DZq83+/ZaF3cJcWgLg3rng+LK7qKkIVL35/kVt2cI
         u805BPzF1lWGNjG1ZPqkTHnIxvPkT5cIxmhlTj5pJuY8f0bBzj8W8Dvh65ApfMUXy3/D
         /D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168757; x=1795773557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EsX/I2j/ckEWABjyjh0CiURx+c1ahl3Dggu7o90Iyg8=;
        b=xgQ09zVgMH1RYnpy8TMx49cy5BjG17jWXWefOCChc6z7nNJQNHJR5UmGvYlGZ6zgDw
         C3RBM+9yJ2vTd+1nz+37wOvQS7Y22WiITLwZ/DdzMV4P/m022QB5loqYlBw8rS6oQg02
         SEmkpWRyfSqvSID703xV4zRIo4r+jqghBkCgktTGK6O0B3ZO2hDty+JBt0+9yxjo3BAM
         kPNc6k7rYHg8yAe8z/ZTMjKe5cge1D9KjsVUEcEMsTZvyLdiZDMq39tFAgz+JXodTlpK
         THFMjJ/J2Y5qHYgHuD8gG2Kc9q84qsO76Fr2C+5/nUZSCq+nvFMpH/2e9TKMg+m0BiCS
         A94Q==
X-Gm-Message-State: APuU4Z+W4lM7z6Hv/iifeZYvTxO/R9lJcrv+5nvxcrr8gO2BKwAdqkjH
	kiHkCzE/b/P2AV23K1FzevHSCJ/9dJ2ux5vaWVNe7nKSPNScu1lbRQWMMVRpwT7t+AE=
X-Gm-Gg: AYBFou0j9BEm+LYXCTKk78dq7dKhnCQBgnJEVrWuMMsNQ/ZuRCnAz02PmxcfCfJkHW4
	vSf0z+qRv38am1c6v/JdXF/lKNqm6geyoFczFBRaUIaSlsSJI6KAgEg3oTjibYatfxxASamKm6W
	ICW4ULkBaQzoQz457ECRNy5GC3keydqLXqOAyzQlXSGNT5Ey4yKA8Oi6O6po7MSzExX5S2bsBfE
	BwLXX44jVG/5tz+2CxDMP1sdzvZs9TjNDqrHkzdmE6n0FydmS6AbP2+alx6F7GaUzQKfhLl6qTD
	B42BmwY90mMiuM3uUWF/UcRdYEQ97JaEaCO+Xy1KcCakhMf1Q5nkxTe7mx/71epvBERqa+YqVP4
	i6nmx2D+rJbqzSMV87KhKKpahGAvrHFPbyiKrYSfYyzgrtqr3tqbwuRj/gsPdvVDxHvsxJwHEue
	BksG8NzZ5Z+lMDq60vXsW729f0BtLvS48LXVTLdTeHo/pK35AlNPTOi1HXFgef4zQ28K7Sk92qQ
	5QGZ+FRtuH5giYuu8jWcTidT3Y2d6QHW5jJdkO47YLILsFuyMBHIcZUwkSVMV0kU7PlvkGyMwTw
	h60G46cxfP1tAf4QNQXLYqkdmVN92Iid0dk8LHttbSbAZqhuYNE=
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr57491685e9.32.1795168756717;
        Fri, 20 Nov 2026 01:59:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm70741515e9.5.2026.11.20.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:59:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] usb: typec: qcom-pmic-typec: properly tear down port
 on remove and shutdown
Date: Fri, 20 Nov 2026 10:59:12 +0100
Message-Id: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPAZAGsC/yXMUQrCMBCE4auUfXYhCbRSryI+2HW0K7SJ2bQIp
 Xc36uPH8M9GhqwwOjUbZaxqGucKf2hIxuv8AOutmoILnffBcYlJhYukiV8SJ77rG8bSCzy6Vtq
 jo9qmjN9Q0/Plb1uGJ6R8z2jfP7uVT0Z5AAAA
X-Change-ID: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0UY4gCGqKYjt3tE3u8/yCjAdtc7MwcQrPEW6TweYBF8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABnyuxrATGM7KT/33vRAPKPR0GHgU/NIFn6krKxr
 O8+EnmaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZ8gAKCRB33NvayMhJ0eArD/
 9OcsaajjUkfmLLOzSOLWuIIwLJ7cb65esc6UQXdvAbKklFODZcjK873qoWySAdFlHJRsj16B68IEgS
 duZ2nE71TbuAEUqVQ0qEdBDjC0aqLi3w0+JHP/csIV2fy5vATaw0nGGqUQ2VsgC50pxcR3TYoRpjMm
 tg7xI2Gd7ovxmdtQLG0CqAZb0NDV78DG+VuijuWaCXXABZguFnACJAfuLsS7Mm21FzEofW5yHHgJ9h
 nPOa32wHhbtRUsUoN7FQTPG70LmdaXI+DAxEhimTnsstMYNlnAbk2Q3DobSP7hzMe2oCSW3faUzb2J
 Pz5ZFfctpsPs4oS4sKThAgfoiQlhJcncIeKZjOShXrn1DCbpMv7BDdpGOP9f3Fxj9GFxYYrVu7fCAR
 nd/DKMowBocBO6LNkP4CnMPPzaYRc7XQ/vSbY+js9m2ZpPRnaYl7T7RN/2x9y3agb8Cw4BpZSOprs/
 wNFvaJjXrnaAaHuyOPg6HR1p8zfjghGwD7ISQq4G6zvrZk3CMbTQVKJUwhzBxGLOXhhoYuoUba3geJ
 gh7aqzjeMH8bNjIy5Yt3zNwFCl720TqW0WJbR6Jxzp+mrWEWfnQYF3ybNxdnuk3YMVzrLcX0IjAXPO
 sNSUfrkvkwHNIN4r85kb156E+CCAFT3DK17BRauxjWBZuKBwWkGRnyugB5Kg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The current driver doesn't leave the port in the same
state as found when probing, and leaves the port enabled
on system shutdown.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY on stop
      usb: typec: qcom-pmic-typec: detach the port on shutdown

 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c       | 11 +++++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h       |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c |  2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 11 +++++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

