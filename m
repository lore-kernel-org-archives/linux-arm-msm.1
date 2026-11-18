Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986641;
	b=1zMex3GEGmPTiNpJ8cn6s2UX9fAluWyHWc0hxzT1s6k0I0HIOHoAa+vf3102wApZzXng
	 1+9hFlN0IM9duonddWz6iV8KnCAREN+A1I88/i1RFyk0xuXad8N6Meq9YDh8+gViwP9Ji
	 WBsFvW8W+b+boVAxh6kFcNu5/NHYv7gW5Y00vQhiuX9abW3KZ8CoYLNpalRs44LrFYNZE
	 r7KpIj+EvDWIWqEVk+cetcY51z1wgR2RXSaLjEv5XCHjykxcY7rRXerHqjsQPRsogWhUH
	 HrxwFAk/tRHezzDd9n+NDNKYLhUHgS1mdUxx5CzOYrJvOjugNDMrWVfFz2vBaG5Nkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vSJzI8GBb8ZaTH+tAugZ/R1HgxYHhFd5lsw8P9UM59c=;
	b=Z9FFcxns4wpCBD0a2/Io9LHsnpYVEYc3tOBAvJJORlDIjoDSfp3U1TC2kNEjW54Epagg
	 V1xmn/Iz6wefLQe3WW8jQuZieJ2e9ecqD/ywQnzVXji3J4p56/QsFNhpPO+nNYm5nzcoR
	 U5sSO3+W9wyDUAagdsaSLl+iRgUdXyfPZZPTxUKZdHpjk0LH3ujshMjAwb5Ui2M7O0gyi
	 StdKG1+WfIV0R3uUc+0XUMhTxDIvvDPXXcjDSJvCsS629tCcEt/QwJTAqp78Ud50uXDV1
	 6svUhJ5g8Gy6Ze4GbkGXCmStEmKnAxvYJakGuwyWobiaEmEZgDPuZKfgf5Gp+Vavs8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zcR1nlVL;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE5E606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zcR1nlVL
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-382f4710a17so522252eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986640; x=1795591440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vSJzI8GBb8ZaTH+tAugZ/R1HgxYHhFd5lsw8P9UM59c=;
        b=zcR1nlVL3ZvmA2Wm7UMtZQVq6XfeYG6VFCmt6nMaThUGUOvyeBIn7QuPm4OQ0endMj
         qNpJKc9A1oBr5YXXiMIX7kqPvGJnYkqTgViYcJ4XcZjd9JCgb5d+QrNpEjnf9khaR0G7
         rxQ/8KVV6irgNMXXIM2ZQ75K6UiBEYHsCjIzBORZ43tesxfy8OYzKO2BQvDwPjq/3ZpT
         XqbIu1BZw+ELuMdJeUWGxS4VGBqJlo8PIt9lNDk7t3gOU9A/YLO7y3/+bWI3MWf36A5Q
         7u5cgJYDwi46c9JB0BjLAZnSueM2O5Dx+SyUIYXLWmHJvucfdckDRXdudrKp/Ejl6tV4
         YP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986640; x=1795591440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSJzI8GBb8ZaTH+tAugZ/R1HgxYHhFd5lsw8P9UM59c=;
        b=O/6tE/3TDNUDEmM29qNn5JfI+h56vtT8vMZ5yOe6fpYeSHeUQy7DNY95v5toGXIq60
         n0aydE3jxyixRf3yME3QXLad8F7axvmVr3ZDnHGWWWbdWU5IMlxT/BGFY6NSpkjMMRH9
         UUUc7F3MYI2c2edDQXoaSNoVVtbZTBZnepRys002Kjt24QSLmu5lJUZsFo0m09v5KaBa
         P/iJ26spSCNZKqwXGXUA5miMojtNOqZpX3SIoKZoVKtSWSLVJkxX2iAf6i7+stZJiUIh
         I0VyjacD21DxtADQnDPxmomFILiHru7v60cOtrXlmZ7VQQu9HqUVCqWxu+9LVro6DdA9
         vw+w==
X-Gm-Message-State: APuU4Z8LBIKSGJOOVwX/tmdZ0e+46+qQErYqx6C0CqlGjHmTIKjJBjxw
	Q2ys1mSJayC2bU9wXsL21KLnZaKkMcOaN/TvilC/7GRNmmqkEdtYXGaP
X-Gm-Gg: AYBFou3yYOhbIIW7nPS5E/cMv5wQdLw9Vx3YtX4rpEKDWYlh2RGI39zhPM3zaHqy+Wj
	ENEpBFIS/PgrUEV3sDVfXXRTGJjRgXpEgB8iVhRx2+Tv38uwCzjSCWUk4wbg2Ek+0N72CFLdyS2
	AvPx1KJQ/aIpMNoP3NCjAivPGlwrxLC+bP1TPHSj6HMe0SigYk0xNKPKmoHktou/uUkJpFnAZBw
	f4d+yJG2/XeBbvZT6sLrVMTzq7HP/Lab3GkYLYPunjGb5DdCoBL+MZCrlWzyWSY6cZjF+Y51Hm3
	477qMTlIswnnWECHT4uQSSYG2yC8aLBfKy5tdS8CuEeTtqfZImglLDI7yCjnL+O1NDlO6x1jw6m
	0HlfRMqR9dcUtJWXIW/q40MU5ltMBpiIvdncJuMi6K3aEH2x/K7ErpKOpeUhAKWZCdbP8shYumr
	goGdLF2XYfpmp/LtaF28aR5VU2CWvO/39GCw7dGVE10tId74/Jm+OG+9/2VNYU1klYmFdkP5jYp
	E81Fc06dgdyNDjH8IS2Bu+rQejcxKsFj7RKv5P/F4EM0Vt/xvOYTul0o0ncAOX3yufGutpF2isv
	6uz6cBUF+7Gn+FBTsih+q6d4PjPt9XTbtpPkhVMYZqx9zNfDDPE8Y4C/Vl+QvzvRYOrSakZ8VwM
	Q0/ab3S/cV3TUHlvAb7pkeUlOhJFmqHlg5WLRMKTa
X-Received: by 2002:a05:7023:d0d:b0:1b2:60b2:96ff with SMTP id a92af1059eb24-1b543d0ce1fmr1925170c88.38.1794986639490;
        Tue, 17 Nov 2026 23:23:59 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm6185847c88.9.2026.11.17.23.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:23:59 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumit.semwal@linaro.org
Subject: [PATCH] regulator: qcom-labibb: stop the recovery workers on teardown
Date: Wed, 18 Nov 2026 15:23:53 +0800
Message-Id: <20261118072353.1259751-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The driver never stops sc_recovery_work or ocp_recovery_work.  Both are
queued from the interrupt handlers and reschedule themselves from their
recovery paths, so they outlive the driver data that devres frees once
the probe or the removal is over.  A short-circuit or over-current event
followed by an unbind leaves a pending work item that runs against a
freed labibb_regulator.

A ->remove() callback would cover the unbind but not a probe that fails
after the interrupt was requested: the driver core does not call
->remove() for a failed probe, while devres still releases the
interrupts and the private data.

Register one devres action in ->probe() instead, after the short-circuit
interrupt, and let that action own every resource that has no devres
release of its own: it stops both workers and it releases the
over-current interrupt.  disable_delayed_work_sync() is used rather than
cancel_delayed_work_sync() because both workers reschedule themselves.

The over-current interrupt cannot be requested from
->set_over_current_protection(): the regulator core calls that op from
set_machine_constraints(), inside regulator_register(), so a devres node
created there is released after the regulator itself and the recovery
worker would still be runnable while vreg->rdev is gone.  That op now
only programs the interrupt registers and records the request; ->probe()
installs the interrupt once devm_regulator_register() has returned, and
a runtime first enable goes through the same helper.  Both requests stay
after the regulator node, so the teardown order becomes: stop the works,
release the interrupts, unregister the regulator.

The interrupt is requested with request_threaded_irq() rather than with
the devres helper so that the same action can release it; its name comes
from vreg->desc.name, which outlives the interrupt, while a name
allocated with devres would be released before the action runs.  This
also keeps the cleanup to a single devres action: a second one
registered from the helper would be released by devm_add_action_or_reset()
from under ocp_lock on allocation failure, and would then re-enter
itself through that lock.

The op and the probe side share a per-device mutex, and the probe
publishes the registration only after the deferred cleanup action
exists, so a runtime enable cannot request an interrupt that has no
teardown paired with it.  The hardware source is enabled only after the
handler has been installed, and turned back off when that fails, so a
retry can be attempted without leaving the source running on its own.

The teardown action publishes a shutdown flag before it drains anything:
an over-current request that runs while devres is releasing the actions
is refused instead of installing an interrupt whose cleanup action has
already gone, and the hardware source is turned off once the handlers
are stopped.  The interrupt may still be left disabled by a handler that
called disable_irq_nosync(), with no recovery worker left to re-enable
it; that depth is left alone on purpose, because free_irq() shuts the
line down regardless of it while an enable_irq() racing with a handler
that is still running would unmask a line whose thread has not
finished.

Fixes: 498ab2fdf855 ("regulator: qcom: Add labibb driver")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No PMI8998 hardware was
available, so no over-current or short-circuit event was run.
 drivers/regulator/qcom-labibb-regulator.c | 195 ++++++++++++++++++++--
 1 file changed, 177 insertions(+), 18 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 8641e69b55c3..49aaa31a539d 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -96,6 +96,12 @@ struct labibb_regulator {
 	int				ocp_irq;
 	int				ocp_irq_count;
 	int				fatal_count;
+	bool				registered;
+	bool				ocp_requested;
+	bool				ocp_irq_done;
+	bool				shutting_down;
+	/* serialises the over-current request between set_ocp() and probe */
+	struct mutex			ocp_lock;
 };
 
 struct labibb_regulator_data {
@@ -307,12 +313,141 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Stop the recovery workers and release the over-current interrupt.  A
+ * devres action is used instead of ->remove() so that a probe which fails
+ * after the resources were set up goes through the same teardown: the
+ * driver core does not call ->remove() for a failed probe, but devres
+ * still releases what was registered.
+ *
+ * This is the only cleanup entry, and the over-current interrupt is
+ * requested without devres so that it can be released here: registering a
+ * second action from a path that runs under ocp_lock would also make
+ * devm_add_action_or_reset() run this function from under that lock on
+ * allocation failure.
+ */
+static void qcom_labibb_stop_works(void *data)
+{
+	struct labibb_regulator *vreg = data;
+	int irq = 0;
+
+	/*
+	 * Announce the shutdown before anything is drained: a set_ocp()
+	 * that runs from here on must not request the over-current
+	 * interrupt while devres is releasing the action that would stop
+	 * its worker.
+	 */
+	mutex_lock(&vreg->ocp_lock);
+	vreg->shutting_down = true;
+	mutex_unlock(&vreg->ocp_lock);
+
+	/*
+	 * Both recovery workers reschedule themselves, so a plain cancel
+	 * would leave them queued again: disable_delayed_work_sync() also
+	 * blocks the requeue.
+	 */
+	disable_delayed_work_sync(&vreg->sc_recovery_work);
+	if (vreg->ocp_irq > 0) {
+		disable_delayed_work_sync(&vreg->ocp_recovery_work);
+
+		/*
+		 * The over-current handler turns the source off before it
+		 * queues the worker, but a handler that was stopped above
+		 * may have done so after the worker was drained: leave the
+		 * source off now that nobody would turn it back on.
+		 */
+		qcom_labibb_ocp_hw_disable(vreg->rdev);
+
+		mutex_lock(&vreg->ocp_lock);
+		if (vreg->ocp_irq_done) {
+			vreg->ocp_irq_done = false;
+			irq = vreg->ocp_irq;
+		}
+		mutex_unlock(&vreg->ocp_lock);
+
+		/*
+		 * A stopped handler can also have left the interrupt
+		 * disabled with disable_irq_nosync(), while the recovery
+		 * worker - the only caller of enable_irq() - is gone.  The
+		 * depth is deliberately not unwound here: free_irq() shuts
+		 * the line down regardless of it, whereas an enable_irq()
+		 * racing with a handler that is still running would unmask
+		 * a line whose thread has not finished.
+		 *
+		 * free_irq() waits for a running handler, so it is called
+		 * without ocp_lock held.
+		 */
+		if (irq)
+			free_irq(irq, vreg);
+	}
+}
+
+/*
+ * Request the over-current interrupt once the regulator is registered.
+ * Requesting it from ->set_over_current_protection() is not possible: the
+ * regulator core calls that op from set_machine_constraints(), inside
+ * regulator_register(), and a devres node created there is released after
+ * the regulator itself.  The recovery worker would then still be runnable
+ * while vreg->rdev is already gone.
+ */
+static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
+{
+	u32 irq_flags = IRQF_ONESHOT;
+	int ret;
+
+	lockdep_assert_held(&vreg->ocp_lock);
+
+	if (vreg->shutting_down)
+		return -ESHUTDOWN;
+
+	if (!vreg->ocp_requested)
+		return 0;
+
+	if (!vreg->ocp_irq_done) {
+		/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
+		switch (vreg->type) {
+		case QCOM_LAB_TYPE:
+			irq_flags |= IRQF_TRIGGER_LOW;
+			break;
+		case QCOM_IBB_TYPE:
+			irq_flags |= IRQF_TRIGGER_HIGH;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/*
+		 * The interrupt is owned and released by the cleanup
+		 * action, so its name has to outlive the interrupt:
+		 * devres would release a name allocated here before the
+		 * action runs, while vreg->desc.name is owned by the
+		 * driver data.
+		 */
+		ret = request_threaded_irq(vreg->ocp_irq, NULL,
+					   qcom_labibb_ocp_isr, irq_flags,
+					   vreg->desc.name, vreg);
+		if (ret)
+			return ret;
+
+		vreg->ocp_irq_done = true;
+	}
+
+	/*
+	 * Enable the hardware source only once a handler exists, and turn
+	 * it back off if that failed, so that a later attempt can retry
+	 * without leaving the source enabled on its own.
+	 */
+	ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
+	if (ret)
+		qcom_labibb_ocp_hw_disable(vreg->rdev);
+
+	return ret;
+}
+
 static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
 			       int severity, bool enable)
 {
 	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
-	char *ocp_irq_name;
-	u32 irq_flags = IRQF_ONESHOT;
 	int irq_trig_low, ret;
 
 	/*
@@ -326,52 +461,58 @@ static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
 	if (vreg->ocp_irq <= 0)
 		return -EINVAL;
 
-	ocp_irq_name = devm_kasprintf(vreg->dev, GFP_KERNEL, "%s-over-current",
-				      vreg->desc.name);
-	if (!ocp_irq_name)
-		return -ENOMEM;
-
 	/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
 	switch (vreg->type) {
 	case QCOM_LAB_TYPE:
-		irq_flags |= IRQF_TRIGGER_LOW;
 		irq_trig_low = 1;
 		break;
 	case QCOM_IBB_TYPE:
-		irq_flags |= IRQF_TRIGGER_HIGH;
 		irq_trig_low = 0;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	mutex_lock(&vreg->ocp_lock);
+
+	if (vreg->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto unlock;
+	}
+
 	/* Activate OCP HW level interrupt */
 	ret = regmap_update_bits(rdev->regmap,
 				 vreg->base + REG_LABIBB_INT_SET_TYPE,
 				 LABIBB_INT_VREG_OK,
 				 LABIBB_INT_VREG_TYPE_LEVEL);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	/* Set OCP interrupt polarity */
 	ret = regmap_update_bits(rdev->regmap,
 				 vreg->base + REG_LABIBB_INT_POLARITY_HIGH,
 				 LABIBB_INT_VREG_OK, !irq_trig_low);
 	if (ret)
-		return ret;
+		goto unlock;
 	ret = regmap_update_bits(rdev->regmap,
 				 vreg->base + REG_LABIBB_INT_POLARITY_LOW,
 				 LABIBB_INT_VREG_OK, irq_trig_low);
 	if (ret)
-		return ret;
+		goto unlock;
 
-	ret = qcom_labibb_ocp_hw_enable(rdev);
-	if (ret)
-		return ret;
+	vreg->ocp_requested = true;
+
+	/*
+	 * During regulator_register() there is no interrupt yet and no
+	 * cleanup action to pair with it; the probe finishes the job once
+	 * the regulator and its devres nodes exist.
+	 */
+	if (vreg->registered)
+		ret = qcom_labibb_setup_ocp_irq(vreg);
 
-	return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
-					 qcom_labibb_ocp_isr, irq_flags,
-					 ocp_irq_name, vreg);
+unlock:
+	mutex_unlock(&vreg->ocp_lock);
+	return ret;
 }
 
 /**
@@ -836,6 +977,7 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 		vreg->dev = dev;
 		vreg->base = reg_data->base;
 		vreg->type = reg_data->type;
+		mutex_init(&vreg->ocp_lock);
 		INIT_DELAYED_WORK(&vreg->sc_recovery_work,
 				  qcom_labibb_sc_recovery_worker);
 
@@ -884,6 +1026,23 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 						sc_irq_name, vreg);
 		if (ret)
 			return ret;
+
+		ret = devm_add_action_or_reset(vreg->dev,
+					       qcom_labibb_stop_works, vreg);
+		if (ret)
+			return ret;
+
+		/*
+		 * Publish the registration only now: a concurrent
+		 * set_ocp() must not be able to request the over-current
+		 * interrupt before the action that stops its worker exists.
+		 */
+		mutex_lock(&vreg->ocp_lock);
+		vreg->registered = true;
+		ret = qcom_labibb_setup_ocp_irq(vreg);
+		mutex_unlock(&vreg->ocp_lock);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.34.1

