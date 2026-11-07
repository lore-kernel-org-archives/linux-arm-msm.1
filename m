Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013233;
	b=ZXygSiGs5KDWtwbOmsQSrtnKSKNz1gdI3owUTo1FisuXTtSrXDr8y21KsVRs/3ftc8lc
	 vMaan13O/s2mdg90bWjZcLCjMngFCwOz9P8DmdLBYcXL6CCUyNK40IK5qwXbZHnd+Um1b
	 TA5c9m/Ly4tsnT6w59y0hwpL8laeVXZiCA/CtzzTL+KmGUJElSGwbXDBVl9CL8cNbMJPu
	 V/d6EXFZufjYfAfOyeCqE0Hm1Rxht9R+7TGfjwaVbKPtj6uvHXn6rbRkO2GiOXcyH9w5g
	 C7UWzdfMvHBN5K8BGzQmyy52z4j2gaggJXtkBFwsAJvwD+WFPvPX0haMqFV06DvBT/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013233;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
	b=izWpfluqiZOUpue7xrkv386z5XJBuEdyv8cLQGBLWnFd4NscvwiSn2oKy/R33mLQfxks
	 t46lufFJyxI/0E9Qfday2w4B8XDC/9Uh+gjq/R340ruJMDigwXpY9+EGbV4gYoneKaB5N
	 RVTED+dsSg373XqVEyH5qSqEnboanJk+Kd98rJq02ME0CcGDjoTzvIAphLfgJChpQhf/b
	 HkjppDDHAlQSaZG7Y5VrBDAj31GIu6LcYPkSAlCZ6e1BjrTnl7vpx9Bfv0GEanj7s9LRB
	 dVQgRrASEqexkqklYQ1nJYJjTUwngTVrubdaipu+feJucclwhh/lr3cOpUJnHdvNXxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WRs+idO1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="H1o1rsr/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E2606A339
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534E2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WRs+idO1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H1o1rsr/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794013232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
	b=WRs+idO1Vg1+9/cIcz58RKTS16tfOmXdzq7aFKTSgJMFwocUP/scsJOujHiy4kXf4xuOou
	txaGLEftgfjl3D7Sdlz6LRB5bhnVcKijZbUyAlCRD0CGhqKblQrI02ojgJztGcYAwZxc9N
	+UxQSIzxCNn/po6WJd9avSyMwWGMGSk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-yRgLROSKOkO8YvTMcbiSEw-1; Fri, 06 Nov 2026 20:00:28 -0500
X-MC-Unique: yRgLROSKOkO8YvTMcbiSEw-1
X-Mimecast-MFC-AGG-ID: yRgLROSKOkO8YvTMcbiSEw_1794013228
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso41818185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794013228; x=1794618028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
        b=H1o1rsr/2mqMrxPsgD491WDG1WDzWaeymjA/zevZ0pM+5Z3soifg5kXw4qHmmF+FoU
         QKoDgO7IC2fMauxGX3VRulFpYCtvMsGND2wTDVUVIcHlrdhSyqWtYOhhItRJchITPpSx
         Lq5RvILUV7waSY/lFJ42/ANlhUYUOUPau7bNbg85LZLZINpKwjHwrKsB90NT2FUrTknb
         79pqRgsnUt0Yuwf6utDQSla4RgyfWvettSDu9DrwzPq8r8wjTSeJsFeQpZuJXmayQeU+
         7ec1mg5bnyXnX/zVrAdHhm/kaD1vFvs20D8V+1D/oDNG4Nk1cI7I3Z5sHXY1XE9UQZn8
         j+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013228; x=1794618028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
        b=NX87Tc3eJnFZjuRMpSjYxt/5keHK363PG1mgNJsNk3jqjhZoTlADlg655ZnNpMlnL1
         1W169z9o88L/aX649qbf5hIuQAocUuy+LS3SvYn+YTR+OfkPGNG2WzfAvsF97qDQ4+jV
         F9pfYrhjudzXXIB7Qz/VFrZ6Bq8JHYVBdPzVT1jjXzMsxBuNirAzEWmNMfU9qn2WBJnv
         2czVO6f0DfBlWFWPZxDY+fUwJ9GEZVoF8oQcT5BQADHdhDLzLMu6LbhZr7keNtSUBTEw
         IDoW2+Y9RnHA+YGNK9JjAwSA7dt//mZm9MI57fEc7lpeV46KlvVDz+EOy3HPnJ0LwcPO
         tAnw==
X-Gm-Message-State: APuU4Z8YSvM3ftRr/9+wO+7NkowQGqlyROTX89x7OA0gej2BzRu0Pb7Z
	xHvIMMZbJHFuF1ksRX2bPjGRfPEUT7btf9rHDkjGp9tdAyQnPIlU+m/jwiI0YlFh+V/I24aWL8b
	EP9dR9YGGs/g0SJtYyrERMUchlh4UKKuaCZA7oKrOa+/x52dp2B9vm0aKxXOiKruc0pc=
X-Gm-Gg: AYBFou2nSDY1frWvOy6caKUchTDr87btnXYHm2QEiGppOvsxUt9C5y8WM8O26fBhwmO
	S8v2que+FXcXl9BrrtibC7Ich8pTKxyC9rH8mozDWucGO954JFAcGmj5RlHnEmLPsiNHSfzl936
	t7lG7nzaVi77YyAhqc44yXv87c021Mtr0RJU9CIUlONL9JnAlLDZsNpr7orZsbS/mGXmrCy5bpJ
	6qbmSkde2MpaIisqFZZgYnRbCtwX0VuS45x+KY2Q5wbX4dOFruT5ahOwXh47NiCixIopY09IMG8
	R4BpCJvBypp+303g7Qzr1SoRFbIwjL0BxaQ+UZvmRaGPTEuFxXVKq71G1tI6JLxGZdmRyvYqb6K
	y9S30YdvcndcrG9ExubwOXhlPwbaeRKNAtF8lJzxaq1TfN6f8Z7zk30DzQeTSxzHuh3pkMAPfxg
	LKB4UbD/9AtiRSutPq
X-Received: by 2002:a05:620a:258b:b0:944:4e6:85d8 with SMTP id af79cd13be357-94604b8bb36mr113028285a.5.1794013228298;
        Fri, 06 Nov 2026 17:00:28 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:944:4e6:85d8 with SMTP id af79cd13be357-94604b8bb36mr113021485a.5.1794013227544;
        Fri, 06 Nov 2026 17:00:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm258908585a.8.2026.11.06.17.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:00:27 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 20:00:18 -0500
Subject: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
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
Message-Id: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3ZTcRN30gkzd4tKk4spiXVNLk8TkZCPDZCPTJCWgpoKi1LTMCrC
 B0bEQPlBlVmpyCcgUpdpaAIShc+dyAAAA
X-Change-ID: 20261106-dma-gpi-subsys-594acc21c25b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jmAzhr4h6GEVM+4TElleiQn0m9dCBbcSbMe6/5AUMZU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeVajvYHvCrcZnfVhup7ZbVD/jQymBBFPzLpMpT6rOT
 NCwenq6o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIksS2Fk2CdjtdZB7cIq7daS
 rSkXf0ju6Lrx+d2f5guVLB8/qCeXrGRk2G00j3+l2+FX5xUaTlVI/VNSZuI5/v9s5qyHDMpldzt
 2MgEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver is configured in the Kconfig to be a tristate,
the driver doesn't have suppress_bind_attrs set, and there is no __exit
function defined. This change will add an __exit function that
unregisters the platform driver.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/qcom/gpi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..d6c76ce1846e 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2325,11 +2325,7 @@ static struct platform_driver gpi_driver = {
 	},
 };
 
-static int __init gpi_init(void)
-{
-	return platform_driver_register(&gpi_driver);
-}
-subsys_initcall(gpi_init)
+subsys_platform_driver(gpi_driver);
 
 MODULE_DESCRIPTION("QCOM GPI DMA engine driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-dma-gpi-subsys-594acc21c25b

Best regards,
--  
Brian Masney <bmasney@redhat.com>

