Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292261;
	b=eu68Zs0qjYM+v9kP+oNoLFBeBcDnwiHaEStRlO8/p4FPDhm+s5rsZJ0ZfrytNHtkh2e5
	 8xnHR5Ccp6AYBbL9WFxZQfNO9/6Lo6Pw23odCkTl9zXdPAEuMeP0GOtI8nxnBwtrlNIpi
	 cdoJRsN2ZTduRgCg+TAd9Okmc5iiEjsN0mNXjxLYKfNIjGHl56Bp+XlKZwuBqkCEc/QvM
	 Shl1b1iFgfkBrMuXGV7v4HsqexrwxG6E78oTVTsXaPFvgg7VPWWLzvG4cYV5YHj5WTH0s
	 KIioNZwRyB0rvQtC5AcBO+sf1UFyvINWlak07vp11b8n/2+2p/puJVdT+F63sJMwIKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292261;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ukzCygZvukvs7xtNwXeIg6EW4nYVim1PfE4vJaFRyh4=;
	b=RaKSqZzuXeJa1q2msswQzRoVscq4dxitGa8DiTzr/vwd+5B+q+Mals+LoVzT4AbdSixW
	 /Pe0a+qThKtYHQcxtJBXYuuLcIs2yfYaRqx9cCN4h0dkSo2lWsu/1tDsIVVQUNBU/2wLr
	 AQa9MfyJVpNdFeWiUP0iyhuJWH98Vssj/lD1i7mRl8a7bkgIN0o7oO6oHCVOgHmjXiREr
	 08GUNywoqGRQz6Dx6C3YNYisXBSonxl7EVvjkXlgPErbPS1N6Z6qrIwVOGta4I2sCO50v
	 2GA3alB9Uq1PIluMEo1JQImhJi2+zYhNTN8PUV+z0sShvsYsk9DVNedPdGtxzzOkDKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RO2eNF8m;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D156606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D156606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RO2eNF8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793292260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukzCygZvukvs7xtNwXeIg6EW4nYVim1PfE4vJaFRyh4=;
	b=RO2eNF8mmJZjaalrN+KllEzd/2AUOi8UO9zO/ECMLwA9DKn5PAOewh9TQiMXgGzOyMRICt
	Zs8vMagb3Y+jC+X4jxq+2rrqiZBlXRGfRNqSjUmgaCY0gwancOBFpSsXNBLAx8Qn4UeODH
	1p/M1RwrQIuqTJBqH3vhCYuhqoTKYOU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-2S1eWF6uO1-heGXZBdtGng-1; Thu,
 29 Oct 2026 12:44:10 -0400
X-MC-Unique: 2S1eWF6uO1-heGXZBdtGng-1
X-Mimecast-MFC-AGG-ID: 2S1eWF6uO1-heGXZBdtGng_1793292247
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C6BF195FE10;
	Thu, 29 Oct 2026 16:44:07 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 704E41955F01;
	Thu, 29 Oct 2026 16:44:03 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	skolothumtho@nvidia.com,
	yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Thu, 29 Oct 2026 17:44:02 +0100
Message-ID: <20261029164402.1366695-1-jtornosm@redhat.com>
In-Reply-To: <20261014150047.GO14213@ziepe.ca>
References: <20261014150047.GO14213@ziepe.ca>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Jason,

I have studied your analysis and tried to follow your guidelines
for the KVM paravirtualization approach.
You can find the proposal in v3:
https://lore.kernel.org/all/20261029163713.1366077-1-jtornosm@redhat.com/T/#t

Thanks

Best regards
Jose Ignacio

