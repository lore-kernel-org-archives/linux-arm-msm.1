Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2239D40F743
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571366; cv=none; b=OO6B2g1P0OuxR7XGW3pIGQdKhe93vrWZFxjlsSx62n/uylH7oyc87sQzWuR5DqeKKFOMDo8TgJ2BliQJp97ybblIeYr0p9vD4+VMYaAqHyVOvua3PsQwMOkCOpoy3Q20nLZY0HtkUzzXRQyXVHgetlOYfgcyeR9tgKNRJmxjL6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571366; c=relaxed/simple;
	bh=QWRr8CxzXvPWaix5hGx8EX/H/lti1q7GsX2u1ipImUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBv5+CaDbuxXPzNK58wAVD8YdlMjmHPbusm7zR7kiH7oBv80k/fuvcDgoG/sgcZKb7qAfTMSrv/3R++othmSmTe1PkuRvH9SCjPUc82bj+5Lw2CJiWpFx655IaQKEC1h+3hHb4adr5t8Zy9CoDaoWJkGOaR/GZFW1M3uZ9YpQDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRILnb3Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRILnb3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787571364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Opm83gEnNsatCxFqsloP04tPydftxfYtMg5hJEhh3tc=;
	b=RRILnb3Ze5qdCA4oXDllmUwqzheGyhuMB5zlA+4t/RTIfWG04hKi0Tp5GK9OpZwOyTOL7P
	rIjkzJQXAqPlnLeQDHvvi0CWvi73r7ohzh5uU3/pSA3oJbjvsep/V9WfKEzDSCu+vFrVO3
	mr7B2IfPuhp1zoLZ5Ln/q1g8/xtsFo8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-XpYJVJ2ANXebGsLU6F0jQg-1; Mon,
 24 Aug 2026 07:35:59 -0400
X-MC-Unique: XpYJVJ2ANXebGsLU6F0jQg-1
X-Mimecast-MFC-AGG-ID: XpYJVJ2ANXebGsLU6F0jQg_1787571358
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1555D1829E0E;
	Mon, 24 Aug 2026 11:35:58 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1DBA318005B0;
	Mon, 24 Aug 2026 11:35:55 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 24 Aug 2026 13:35:40 +0200
Subject: [PATCH 2/2] firmware: qcom: scm: Allow the SMC request to freeze
 and kill
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-port-scm-patches-v1-2-1dfd69374402@redhat.com>
References: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
In-Reply-To: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787571348; l=943;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=66EbpJ8HufayhBSTL5IIV8WsQZzYH3jvBp6OX1kpJ5I=;
 b=8U3sTBaQguafzapKb8FNwNPMN5hGOeragNF5q8uWNlo/0QtgalhJNf7c8ckxXQ53+qAbm8wgM
 kcanlZLacM0BCyw31UqyxbXMenQ/OjI6ZfHPpIah2g4llVRnV7GifwX
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>

SMC requests in waitQ are put into IDLE state which is not allowing
the task to freeze/kill, adding FREEZABLE & KILLABLE flag will allow the
task to freeze and restore the waitQ state on resume and kill the task
on shutdown.

Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7a042273d6d5b..e4ebe4c0746bb 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2664,7 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion_state(wq, TASK_IDLE);
+	wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE | TASK_KILLABLE);
 
 	return 0;
 }

-- 
2.55.0

