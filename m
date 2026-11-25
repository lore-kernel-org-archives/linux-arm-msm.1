Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604665;
	b=EzVYp8yofJ0l2tVFfr50SAe9srf+CsnNVCDYcOwtyjn486Un7pfWCZ5TjVPQR5fPHCgd
	 9JIMYUaDI8HCqhlYL5Ie/w6PX7BDFMUEg17zEPbdee/kV+GuduDH89yIqqhpjX2JXC319
	 lmIbYU+/bflYBetT3J2YzVBPH38dOhsI9Cj/2GivPRJicLb8vx3nGT67I03fQ0/B/WPFl
	 RRdJL5NeKjcSUQ7ZUazcGlReGszBDpOWEfzqp2Roxn03uXV9dXrT9D8MQQEu4EhbYyjq9
	 XUzsteLnUlu93h1SPf2XnvVmNJd9UWZIySxyDbMcK/zdH2PXDbFwl4EgmXYgerOxQBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mSFcBNs8DHPHeyl+tGfopsfXY6swzpYkypArWq/ZMc0=;
	b=mIrhuhIuonwXdMBfBvqMMy2ahCHZse9FJpjBVItRaNIXQrRlh8snxsQz3vy6/bdtPJbA
	 DtE62ztm9ZM0ia4zFYe4J6ggkLYEJfXpDoYBVUtGHGEpJnFO5jt840OjacRXh2DehOCDX
	 zeE/nJwZoUVjCB14nVVN27NMmgb+SSvUoBMIukylAP4W/3WU45pXukjamNmanZXpFvkam
	 IdPZKX88lv/CIxgmyTGZezvcm5yeihodkkoHlN0hCZvTzG3FRbXpGTkpEuu3KljDdm65O
	 xO589loj0NwT3RYY15xAXjaGgAg9kPL4mAPmpn5p5dtlk6f1wdsFmWvO7ayB5cvebmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IkfISk3n;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A5606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0A5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IkfISk3n
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso4256592f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604663; x=1796209463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSFcBNs8DHPHeyl+tGfopsfXY6swzpYkypArWq/ZMc0=;
        b=IkfISk3nwSiGnBLDw1q3tseq8A4bTbL/1Q0lc7VIXDjsJzfY+6fDjVkt+B01PkQ4Fj
         qqP03BQ/a0C0veKl0Bx3pMBzVeWoj2eTYFDoLyqvIuS73OqB7FhrRfRJ5AYLUbFxwdtE
         D4q3X2vnVago0fGEQhNthCX1b9QdDBiVPEeyMry44zLYgd4Q8KECW42HIBIpZPW/kZmB
         w3gOlz4NQjtgXAZJj73R/DJB+ExEXESFvoaM5jax8UKFqvBWxXkxje2qd94uo2N7bPpE
         UNXwTNYyrIa6g9bo0PLsNjn83ouCPH02vN5lTvkXKVeP4VBgFD+1cHzFL6sqTLWzgpYS
         Y6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604663; x=1796209463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSFcBNs8DHPHeyl+tGfopsfXY6swzpYkypArWq/ZMc0=;
        b=VHC0LF3XXeFQSjuEnoJGoC47HMQajvkL4k76e9b5qnEK+S3+ZjbsxRFSEVi8AuZmHX
         6ksuT8OGOQqduGV2ElqViUUCV8Z97+978ohNWA00/I2KOsT9QarM1VMsm8FxTUXbMI4l
         4kWqgq90sMGDNjJB9ZfUTqRjeQIsxmnJqX4tsi9lv+D3lM/eL0b9TjMz0Vd9QniJqdqe
         LyicNpwNJxvLZxyM8B3F7jBkx0yvUFPN+ORwyo7jD91ExNUbrEVtt5g5YnFQqjTGF1MJ
         D7O095Xfo/KadDBRjUv3Y/fhV5nNYlFHeU0qNRTJJaYTCb56cZo33UVywn33RLL6BVMh
         Oj8w==
X-Gm-Message-State: APuU4Z/tr27+yNSe9bUj+UNgMxj8szyGeujW4+7JFTTOWGImk4Fb/BoE
	KQ61WAZKz4mQLOTDbN/G2ZJySjNamaPTLXdIKzchJVIVsjpIkS/oRUn5WzNfxuYlDtw=
X-Gm-Gg: AZFdTZeK0JjEZwvgbzyI3HkhnX6cbGrugLhHx0UnjpIWk2axMDk5oda04emfYUuMAkP
	GBUWL3KLYe9z0wMirbt5liOmZPSfHZd1wRNbhu1g2BqLFBs0cU3Mds5kHicssB3XWeGA/u3PaOb
	avcGm+Y041Lhoql+ex9T54d/Qt9dC8y0vXA+GhxfPprjDkaq83l+qXrNty5bj5p2CXYC6bFyjNE
	FSvAsREQxG/xYNQSuqYYdhCuBOaQbqa1ru0fqN7Iu0cI/es18To2oyDOU/zGtSCQFiFtqcleDS6
	rbs8r9xCw8bwLnFshlWl84r0XYaT4F/p7eYS7Xb5yChm3bGNvHp6+Yh6bU3LIqGvClArDeN0dKa
	zPaRU7sPUWvOqQz0Vx03r1NuzU8PO19ER2oFRvNQcs/rzkCCgPn6TOtYd42JVOupgxLMqFmh3oC
	Ue6j2AXddk+M4YIA8nqeNW659To18HMuoeuZDVT4W/muxgNkuhWd2QWPxKYlyqruYGzjxj11Q+E
	nUY1N+sV64gZ9V+Bimxn0ZYY/2uLqOT9SEwzubU1FChZoQoGjqqgAERDQL8FYvZS7f0ecTrq5Yj
	ms+gUk9sOiY9zm2msK1u1zZgpev7mhB5LPRnHpQ9l1WuvNi3T6B9idmOyTfZJzb/+rIOK0s=
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr339382525e9.33.1795604662739;
        Wed, 25 Nov 2026 03:04:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:18 +0100
Subject: [PATCH v2 2/4] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-2-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3650;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dforkKNpD0yK7QLHc8NnG7CggtnhNk0BqYNfZez5R0k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCza04P4YMwqNfNXwkE6Dw54aUnVEbuFmPg0232
 iqH8JYeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAswAKCRB33NvayMhJ0ezeEA
 Cw7MbiTAbs4ZBGOsuGlbMuKiSW9x/Ua2xc/AyMdiiZFAL8m9sZM7opF+JcRxHA78tzG74TB76y/nGl
 fJjNnkYOzxKxNOZQq9LcEt7p5wMjIhMDbJeAZNzmT+1Pn5yoEsy6FF3seguNOvLdRuBSGWBzjX8r8b
 XGcb1g7YNTUli5HJQhy19fAPYaShyBVqqodKuErEaEeJHe1Th4DoUplkB9Y92TS4tXBlStTCFH/yJa
 8jDbV+ErGNpdxZh21e/NBgirZSbrdOtNoexrmO22AjuFq04deWNGVUgeqWvbMyiAPR7wjQRMoeuk5W
 4/JKz06FjEvI8TTX7yBVbPx94g6XN9cHK9mgQgYeFWab04nWWnfFEYjLnI/0G2WEfeS5FTWGjr1R3s
 40mSTOfzsFPJcLUTdole80yGpSwEjSFSJtFk58Oy3OItINdeYUzyp3E9xHmR1C9rLTNlU23Bnp/5AG
 p1AWK36eikSQye/jtwm0EuwLVfJ9x2xEMmk6JBIzHayf/WtAi1eZsmZuizoHxopY+X/ku2qllYkgxe
 fOTTdcV6odnVAHk58SdIzNKWiwEWKPAFdp2EiwdAHB9K61Y1ExeaR/1GpTd4mCppUz15Q7noyPcIi+
 zUQDaCht22cyXt0ZFC61qU4KbOAeqWNX00LiFZm3lHaGh55PMR/Fl4BbItvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On reboot or power off the port is left as is: a source partner keeps
the negotiated contract, possibly above 5V, and a sink partner stays
powered by the OTG boost while nothing services the port anymore.

Add a shutdown callback stopping the port and the PD PHY, unregistering
the TCPM port, which turns VBUS and VCONN off, and finally disabling the
Type-C block so the partner sees a detach. Also disable on remove.

Assisted-by: LLM
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 12 ++++++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 11 +++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 58d1e6aae637..be7508936796 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -132,6 +132,17 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
 	tcpm->port_stop(tcpm);
 	tcpm_unregister_port(tcpm->tcpm_port);
 	fwnode_handle_put(tcpm->tcpc.fwnode);
+	tcpm->port_disable(tcpm);
+}
+
+static void qcom_pmic_typec_shutdown(struct platform_device *pdev)
+{
+	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
+
+	tcpm->pdphy_stop(tcpm);
+	tcpm->port_stop(tcpm);
+	tcpm_unregister_port(tcpm->tcpm_port);
+	tcpm->port_disable(tcpm);
 }
 
 static const struct pmic_typec_resources pm8150b_typec_res = {
@@ -158,6 +169,7 @@ static struct platform_driver qcom_pmic_typec_driver = {
 	},
 	.probe = qcom_pmic_typec_probe,
 	.remove = qcom_pmic_typec_remove,
+	.shutdown = qcom_pmic_typec_shutdown,
 };
 
 module_platform_driver(qcom_pmic_typec_driver);
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
index 3c75820c9187..0818582fe850 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
@@ -20,6 +20,7 @@ struct pmic_typec {
 	int (*port_start)(struct pmic_typec *tcpm,
 			  struct tcpm_port *tcpm_port);
 	void (*port_stop)(struct pmic_typec *tcpm);
+	void (*port_disable)(struct pmic_typec *tcpm);
 };
 
 #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index d433fc3e7e56..710acdb9689b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -701,6 +701,16 @@ static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
 	disable_delayed_work_sync(&pmic_typec_port->cc_debounce_dwork);
 }
 
+static void qcom_pmic_typec_port_disable(struct pmic_typec *tcpm)
+{
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
+
+	/* Present neither Rp nor Rd, so a connected partner detects a detach */
+	regmap_write(pmic_typec_port->regmap,
+		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
+		     TYPEC_DISABLE_CMD);
+}
+
 int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 			       struct pmic_typec *tcpm,
 			       const struct pmic_typec_port_resources *res,
@@ -781,6 +791,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 
 	tcpm->port_start = qcom_pmic_typec_port_start;
 	tcpm->port_stop = qcom_pmic_typec_port_stop;
+	tcpm->port_disable = qcom_pmic_typec_port_disable;
 
 	return 0;
 }

-- 
2.34.1

