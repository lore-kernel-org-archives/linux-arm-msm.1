Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900022;
	b=iRU7f0KYPGcMrjCbk0jy87QiChJXE/Rw0yDsmS0Nko/I/uj9NNRNCnh2aqO/x4EVjksS
	 DNOsRY5zN5quTANmJ6eLX/KkITwIEUYpFeF8hzXmjflnOliFH61YVkYCLtU9n5kw4E3v6
	 jlDD4iPsHmQAnK02cEm/+cZWjQ4G+9F1u//qnHosb4bAVIdypud/6xqjkvZb1gicA0xdD
	 TdFbRh68lrYv48DMnuKDkyJUu2es/20X7+cTpZb/wZwVLgff+xz8EPtTsfIDH3NvCDdwX
	 R4pZ1dMprHH+Nydo5Fk1jqVfV5B2eAtQ9S1f9okA4meFMqlHC4XKiZW4F8PjsmDtjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
	b=2nzK51rczrMq9yc70ddJNEvSHKViJO+OoHUhSMHyA9GAIPU0HSjeaHrfqhNdRrBN/7pk
	 T2W6Sdj97F29fptOiaEzADG6g1UQzlhlCG986afksXJ6juG2K/Hv0r9XIn8I2qiXbl/hH
	 /UVlDYOrP0eQA7jDu0VUhRcBuM2wcJmDQKIvuSwyTwxeWGTWRpIA/C3YnpTBimNP9MJfT
	 QstjzinKoLo/Dfs7kGUhW/Q0M1nIyUjbtQQItd+2IpJ/uf8XvVHAlLeb8RTO6ZLpm8UW9
	 P69FgBI6z3rZYLxW/TdA+mjkRa45RWcKR2C4X7Tv8Q1ZbejgV1XtvZHPFHgzUEqxizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyF6YzYk;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47296606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 17:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47296606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyF6YzYk
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53665358476so22391061cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 09:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900021; x=1794504821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
        b=GyF6YzYkwcfyfHnKibw8IIeooBvfyNHxkcAV1jJMTNU5vjvpnqKowG+uY7aet8ZC56
         bCDc2TnFAVbFHLSslzTWYowdMjW9xyNPrtFSHUJNrfVjj2Bsk3nohMzVdvyKoOYPPbZ5
         fwxFHNggWViaS7BwqCT9siMysvEgTFAEn4DvfwkkQVBZgF/vUg65F4lj6qmojUVRFazq
         uhYeVWakNOtCHxzescl7opm5E84JIE63yBwP4U0mcwPb64hN/pNzEIiT4TULT6rpcnL2
         8VcjlFTJGWMaSO0GV14/qZ3d7w9AaogkU7FRwen8DJg/A3vWBMWTeKi9pM40ixb97G+b
         Vvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900021; x=1794504821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJNy2Ck1RWiBBtfKia9ky+RnixbUgCX5yahdUPGgwzE=;
        b=HuwLyeERQyiuyCcAn3J9pgvR+fMVMlTz8Oehcok2cNymRaGKOYAEsKsF+BFXQsDbZL
         UyrblRVqSsVjA4kJvK70KqtxHUTRLeZUu4ZkEAondaqnPXDiATXrQt1iFjIh0Dso+mVg
         Ojar+8nA+O4VOTN7g5cNBoxATt8zTnIUCcaQgnT4retLcWePFiHywsy8J/f3JdvgGpXS
         X1OQa1Mcdma8ijTqmdV8KIhUSnK7LYimqPGqsFSLVhQ6u8DxKHkhXsaelHDZN2XLrou0
         8aN67ww/lYBwCJtxB78Bc0Rx3afSXdCXtZLstSphRR/sk41FXisnhR+yIocAFBC9g/nT
         m17w==
X-Gm-Message-State: APuU4Z9zhR5wIFMniRyCvgMKsVDt6cnZIYwZBvGPd0GS+oeokMrlnh/j
	5d11dPpCELH+RkAjWqNgJH0JvJfnlXfo4koghd0JQZ+OhIs4Rp14ij2C
X-Gm-Gg: AYBFou0fRiWq9Z8hk1Q43ytlVhlxvtu9r21+aPbUPzmanClbQ788L6F8b5MXVr7/iVN
	T/MuQswrWkX0DygU4JsbO4HbEKN0yeRZD7tf5l9jEglbBgtkkaden5WwpVhct66pebsVHMIFqbz
	EgHiefzV9lQNj5nsKUxtSJ2/8DEXr3DpSRS1Gf3hdUEPAqRqHYLkNCC80oDhScpUbduoxzbiRla
	NdymtL3m1HDDnQUHmcrz3xYYHdXIcSHjNtTDn/FM/XpC81PP58nGxjPjPMlC75NFH6dwX8HLHxZ
	sKAcwgYeBdHQT8htIzaN9yW2rtJB8EAn5F5SNUwk933NURtxhnd/lPC6Yyvk7jq/7YeTkG3EghW
	I3dffCBj8esWfxh2M9ygIaNa5QnK3pc8WvL/1doRAM6EL9gnbaI7KWUA2Lgr5JkZFtEYku1sMX5
	TdYRhwamfFrIkxd0nAyaNQluQEQH67ct8IhyoVIHXypprzl/Kwn5XxXPSUzjoKLqIy3/kgrUpRC
	r0mKISN26LVckDGMYDO9LGuWGyQYDbo/syHaa7sDt1wiA3V7cGXZJnfA2lpacRymlfk3V1/iEgd
	iWVNO0iFu9Ia1O6JQ53rREA1NQmGZ96lTkU3yoCeUavAecpv0HTm
X-Received: by 2002:a05:622a:5c8:b0:535:87c3:79e5 with SMTP id d75a77b69052e-542b7141181mr318589391cf.39.1793900021149;
        Thu, 05 Nov 2026 09:33:41 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10ff4bcdsm55937041cf.29.2026.11.05.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:33:40 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] remoteproc: qcom_q6v5_mss: Leak metadata buffer if reclaim fails
Date: Thu,  5 Nov 2026 12:32:24 -0500
Message-ID: <20261105173336.32359-2-oss.patchbox@gmail.com>
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

When the device tree describes no "metadata" memory region,
q6v5_mpss_init_image() allocates the MPSS metadata buffer with
dma_alloc_attrs(), assigns it to the modem and asks the MBA to
authenticate it. It then calls q6v5_xfer_mem_ownership() again to
assign the buffer back to HLOS.

If that second call fails, the buffer is still assigned to the modem,
but the function only warns and then returns the buffer to the DMA
allocator. The pages can then be reused by another part of the kernel
while the modem can still access them.

Leak the buffer in that case instead. The driver has no later point at
which it could retry the reassignment. The MBA and MPSS regions and a
"metadata" region from the device tree are never freed, so this is the
only place where a buffer that failed to be reclaimed goes back to the
allocator.

Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (arm64 defconfig, W=1); I have no Qualcomm board with a modem to
test it on.

 drivers/remoteproc/qcom_q6v5_mss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..1a5afce4e6c1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1128,9 +1128,12 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw,
 	/* Metadata authentication done, remove modem access */
 	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false,
 					     phys, size);
-	if (xferop_ret)
+	if (xferop_ret) {
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
+		/* The modem may still have access to the buffer, so leak it */
+		goto free_metadata;
+	}
 
 free_dma_attrs:
 	if (!qproc->mdata_phys)

base-commit: 8396089f91fa07dd77b580e045334e670f782ff8
-- 
2.43.0

