Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23EB418A52
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225687; cv=none; b=q0jcvDxYMsaldJsPcFlFtGTqR3InN0MKD2jA5zJDAkOn5JBiaC8AAwllJ0i6ZjHwWPtFbeehDkaBRBgv8UfguZEFkP8a9oGpaXbAZHVuvS/reMm7/hJenIEPfSQMXk3WYaNUd+iD9gZRvzR/58rS4f6JIuu5bBuybpO5TY47wUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225687; c=relaxed/simple;
	bh=kX1NI3IJs+H8PMIDsWFquDf6o4/8e6qxJaO1HumCajI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHBueC6UC8BlFpJsagalMOsSieYtH8hWgwu3CDfgc0l98Q71Ci8ZycFpwPLhXPF7B8TjVy3nzhG02LsxopjKE9D9dpStHLpzMjtezkUL/rIea0gtpy6PVngizhAj/s4JMuzKCKGNL4lKu2ibVk4xOXlSx1JJ3xGe5FzxsS36QHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyZ7KwPJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyZ7KwPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787225684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzOCJ3AfRCP7qYMKcW4P8MbxSZzj4hLVHXlSzZIvKQk=;
	b=KyZ7KwPJfVZvuvzzknNyRfW+Qi9Eu4LoMyhHN9wxmPBc2gFD4nl5iMkXBeHvKHFKBQ0kq8
	Vw4G01jQG4rnM4HIHgl1YfwRZNDhpZzpGv5QoP7VbkYrHOebR7dwLPmzWwcHbpuUIpkiXn
	4LzOqV6pc7/ZgGq101anc6Wa7iBNkkc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-I1LY6QWIOjGPzDivnyFHSw-1; Thu,
 20 Aug 2026 07:34:36 -0400
X-MC-Unique: I1LY6QWIOjGPzDivnyFHSw-1
X-Mimecast-MFC-AGG-ID: I1LY6QWIOjGPzDivnyFHSw_1787225674
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 265A61956089;
	Thu, 20 Aug 2026 11:34:34 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C35721955F03;
	Thu, 20 Aug 2026 11:34:32 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 20 Aug 2026 13:34:19 +0200
Subject: [PATCH 2/2] soc: qcom: smem: ignore multi remote host partitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-port-smem-v1-2-d19a45f583bf@redhat.com>
References: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
In-Reply-To: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, Tony Truong <quic_truong@quicinc.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787225667; l=1293;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=dO3Zm1S4WzpzCMukgmobRRLX4j14YUeoBXAnjCHoIKs=;
 b=JHEV7CY0eN3KrcnrNYIizBi6haEzIebxv1vKyodvlCMTjRRIAF1LyT/D4opc9GudGZ/uMdOz1
 4a6rWDFO13HDMRNjM4tweaj2AkbbyNroF7sYLZvGEx+ZNDQ+gnJ7kxf
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Tony Truong <quic_truong@quicinc.com>

SMEM now supports more than just 1-to-1 partitions. It is possible for
a partition to have multiple remote host and the logic to handle that
does not exist. For now, skip all partitions which has multiple remote
hosts.

Signed-off-by: Tony Truong <quic_truong@quicinc.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 194ffb2ac010f..8e079d2381535 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -86,6 +86,9 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Processor/host identifier for multi host partition */
+#define SMEM_MULTI_HOST		0xfffc
+
 /* Entry range check
  * ptr >= start : Checks if ptr is greater than the start of access region
  * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
@@ -1081,6 +1084,9 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		else
 			continue;
 
+		if (remote_host == SMEM_MULTI_HOST)
+			continue;
+
 		if (xa_load(&smem->partitions, remote_host)) {
 			dev_err(smem->dev, "duplicate host %u\n", remote_host);
 			return -EINVAL;

-- 
2.55.0

