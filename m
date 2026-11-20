Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171084;
	b=EB5bZ5UmUqesgd/P82sej4lAxvf/DehxYEGMJZU0d8ZdZYtCo1ZW0RAcPET0rYyIsSRf
	 Ya2sj8r0Eg/dPIuaswlgz8YSP3r2j3ApQGdJ4XeQe6GBFchJQBCWkVGX2YXemznksFPFG
	 MYPVhGPYKXGD8taIQcAYPhoqGnsUm8OR4POvzRVC2+G4wnx2zIA34zyJeMUjsSuTtm0T2
	 q/9ksKd+xOnHeZ/0qSu+mZeTsnVaq5SqzA5P2OAuMJX3ALSZ8MxNiNuWNroR0eLzeMl2J
	 F2aRUxPgtQ20XTNtyZeyifYEVi4gNLiINH3fodVpk01Vf9nAI572b4ss1AzJ2mGubuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
	b=H2bcveToCekZWK+w07jAs2Tf3r3h9++JtvOriJq4v0b0h4RPNUdgnyc6frdUry2ZIEfM
	 kmYLs5AvI5jwikL6MJYhbA8sDZSiGTaHkQtzgqBWWRAtFOa0M7SteVwvT1o/h7aTT3GPE
	 7cT+8g2FUdnXpmMtEEEhMH9IVFEDldtkmZ5ptgaFO++GU5ALnyvfdyWhvWCG2LS8ettph
	 HWnYRu4VYU2EQ0J3DCO6thLqHs6WfJlo1x4+xUJz4LqhTUcXQTFgxvzWjJvFwFauQFab0
	 MCZg3Yqg/eM4R0od6pil8o4tnhB2E3Zmqg7Wz7RJWbiJi991f/LJibygNKDX7Aje/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+Igg2Ib;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B36606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+Igg2Ib
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-143255db95bso5767c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171082; x=1795775882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=T+Igg2IbHSXbk3lUJ3V7ipg4dr2b5O7bN74Mb7eoJ2RwD+IFN4q++noFuV/aBDbbk+
         wrR91TFXQuk9t/ZR5OcttYIIZP2iNUlFqwzRJS8cyEmGQd+Toz5FJgNllcei/BI3T1r6
         JuVE4A2kVAFcdSeDPoimS1OVOCqe6MSlkDXB/Aelb0zStu4lK+ZckOSLM/3eXe6nNZRs
         zTBTX9qfRMZ2VYPwgasXqBdT+f5ydRoQQ1l3vAxUAzg9e2pwi+rZW+tqIBujrgi1a/v+
         Dpimv1Ic0DFUbO0ij24mK5miKyTtw3pGWj85fUtbOxTWRIFiWFxPu3L+gAYHV2zZ78Y3
         gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171082; x=1795775882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=ICdDONMtOfhxzPI/TH8kAKB8CBQrWi/IjPSm2NKee3kqnm5rkz6K40r8pmyV19Fo4Q
         +fcwJFV1cPPE0EmNZbQv+Slt/93PDU0ySPmSRfG7TuqQfddyEDGdHyDVjML7XsgEQFpO
         qDJj6SRmjcZqqJdDXFPOFeG6XvypuJ4JdiTas15BlI1ZlBdHr7mDcGb8jZDwMt0kVeg0
         Km49ZMLEFp7srldlzLJtqz3xqIIRooAiiOxMsQmxWw/W04DDZWX9aiyaT1XjjtnoaMRY
         zKEFhNXHNPN821K6eUr6dXOP2muvTF0w1jru02xYUvmyXIIdvuA/Z4UkV75WE6GeSrwa
         74wQ==
X-Forwarded-Encrypted: i=1; AL+hErEiEv4ic954CVlKx7MOX2hZbL1+DewuXLa8vwQeiZGzI3+0RQKDu3MIzldFs/7HldozBR2kzfuhVA13o3tF@vger.kernel.org
X-Gm-Message-State: APuU4Z9ccNyjmA521RWIYyUIo/gndFMREAy3IC2Rvx/IEdoJJ9rTLHOA
	s9L7rz+IS4GIT39kaMW10gTXrUf1PN3UF52KjvHdeEiO7Q5PLo5a9edQ
X-Gm-Gg: AYBFou16navvnkZ4s0ya+sA1GiXfKbc5WQKq1qt76knXzNTObd+2k7CFqQTGnqIotTz
	4g0vhW8CNz2qITzEEAIw0YAfkCsEQm92BuINBo+PIMlQ2nlyDB06j1QVe5Om8kjoYVhSeaUHlxU
	AACw7isCcWo/DCB0O3sGP6Oc7a2OjFNbyUjm+S5Quv+FE0h7+6qZdVxyQchvJGHoQdTioYBjXwa
	c63ENTHRncnxZKFqxdd+6APXPj0LVgJetH9Hzu2DJ0qetK7eIja8GcTrNAvr7qhVkDWgxhRM4ut
	JDvMsJNVp7l/T4JgGyelbxoHBXFYvdtC5auRfbANF3+27VqG22rTpuevrtj0bQZI6f+x4wg7ZX4
	HRvSnNQmRoMsQdfHh4aygeC5F4GrcdcexPFfn0/Fw96MIKq+LYpnvHyS4MKUzx6x+uJOswWAdbI
	VTBHRwaUFWAXm0SznTCl8eofV1AXOupu7/0m/HrHqYe8gUWGuNkYYlH4u2G1kraRdq1gZX2+RZe
	ZbQVEg03fZPmtEAMHonY+uq+tqFPuAN4XTT23goCXTnbe+E0Su0PdNVtaHSEGW4XPBzwAIK0WjF
	/FZlowbNHAcnNplzhDYpvuCCRY5N70VImiom/1rhfakykRX0fnD0wpD7WngXzqM69Ykpu4yZa8m
	t78c+ZnpAcPS0WWYYjjl2k8bKKYKrw96H8ySJzA==
X-Received: by 2002:a05:701a:cccb:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b55686ffd7mr2284653c88.7.1795171082505;
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm8924731c88.11.2026.11.20.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Fri, 20 Nov 2026 10:37:53 +0000
Message-ID: <20261120103753.56194-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: stable@vger.kernel.org
---
v2: Collect Reviewed-by tag; no code change.
v1: https://lore.kernel.org/all/20261107221500.96825-1-dennylin0707@gmail.com/

 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0
