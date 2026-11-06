Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990613;
	b=IlckOFcLwTZvnXFCr6G6YTUq5VFNTxDsvJI85C5mnH4gqC5TW3SwVF4+s5rXOD3PfhiY
	 1Gvp9ah8omuWv7DZwKuuLO1LSiSzB2rh30LyxlGM88eI8g3w6mODRZmnGXVmQ4PwlbgLY
	 w3F2FHPjm6ORRhiOKk6JIsJgHEo3jfye7FZZ3wS4t8SMriAby7kGMmWy4SjxVAUAxJ7em
	 ZTGZNhL5XBEeTgoAwpEEx/S2sUo0aerGNT8vhXiRLa/8SqNDQcfLHH3f6XL9VB1fDhzYC
	 dQp2NVl1ltG/7tmf9h2tbEX8llXQn+aQ1WZfBHCe+u9iD89RhSH/hVV4g1vuGKQlLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
	b=c8acQK8adnMFOBWVps810Y1qutJwNWVJ0lDBZo7RFxnOQFyhcm/BAVxupkona6+7fiSP
	 sJwQnAst2P0oGL7TIuwZvpptiDQvGLNIF3sT3+aWdzz6LVunKp1adhZcjzqOHadHdwqhw
	 8s8XaiybV1rj3QQhJSH9NcQjkomoRPArccNaY760LpuIu8ywC+wu1ulMp/EU8OB+fbMD/
	 Rkqhij6nYDceg9j9dAy2rIc3MsLZJXxrTTGN89pxkM8AF6yJaFPj2YpsAPMKlchMBkMya
	 S9XwEGbNH69qoXbvHn9KDT6YJ76jnXRoW6IV+i1AmnhWYvZ8F52zjfCsHFQqgXzly5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMWL8YiI;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAFA606A335
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 18:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABAFA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMWL8YiI
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso488085eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990612; x=1794595412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
        b=BMWL8YiI++mvB2+iBIl7SxpDY70MvHgOpCS3VUgI8aa3d4A19vIjQ9kG4X36UKlpIL
         PvPbBpBn6lQN+f1BWsYsMt26DLPA6BydGxvfCR4ilo5BkyPF9Z0iDXCuq+dteIBtWI+k
         O79B8sl/Cr8D/C+BxicSkv4d7j/j1yn4H/HeBW9xXu5XihcfbQISkMEEwUe3P3nZg4sm
         bA/qlesPeqFwbhnunxXRb4ozrQSqAA/oJ2MDMu8c4ydu7BhNutywIXGQdmRk0ON21+U2
         e+q18qTOVblBKlyKvbDof31/hQykNmbNB4sOgA1fgTBx1a1wZDlg2pM+JemOJsruILh1
         SPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990612; x=1794595412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
        b=Mc1uQAbPsE+GENNns3rvIIg2R79/GrCrt9S0HOMzRlqrXX6YGFp3Qh0GiKpoqHs0yq
         q8D/v+Abx6/dd1Xl3G+ZkYcSE7tbCCXFaK2gUSJewmbIG/KU/6ffj+VCgb9tAF8AAKNo
         5/5LYtzhve1N1bGs9zfOs7mBKR/Azrg7PJTUwNDPm56OBmoEovcQzCjDzj7BilkMmATK
         nOvfhw4P4MAscUFXzaccqWfwp1NCcnWjlhJJFJTbkoaDrsRPlPyoZBwMdQDRqSuokgHC
         If4jApQps8XcrX6W3Heejn6hnftwUg0ZW7ATnCjAjNBxNoX7qLhBmGCmMQ0l6iN8iSBm
         hvLg==
X-Forwarded-Encrypted: i=1; AL+hErF8nCYUgrA9YoGvu1N7k4isap4iJFfpt3HwJjHwRfm0k+oMKrpHZOUZ++ug9Dnqkq69ZzsHpNv/r4ao8kJO@vger.kernel.org
X-Gm-Message-State: APuU4Z8IXbBemqSJoRnHnxTQj0lwYrzp5vq1BnwYwx4I5x4dObNqCR/B
	K1rABwze/EHnyJTF8AzAhuMudKkcR0egAvdu7MA7HzdN8tBHT/Gcozc3
X-Gm-Gg: AYBFou036p4gOwSAv8rDCTwp3eJnaM3Hi/HeQwl8f6GL6bXeDMJLuQ6+JndKcFmiH7e
	u0h99o0+rNZ33TVGxg9lKtfDFLI8HrNtkYCitggnIoJKLA2a5Xl88AHSDmJckA+uS3tvKKVygqU
	y1gDCsXjbLEv8oPkarK/pS8nh8PFgGMDt59IbUljqbnE5enc4UjM/sPjPjgVHnaGyyjXOKVCtdb
	fkgZ3VzTLgbrO1qLY7De4TlJTv39UiUJg9Eo1xtpsK+BmxNCBAncubLXjnO7yMKRNBAgOs3mibd
	WblSzV1RdisR15YdtQPpjSj5H91Tl8nf3+teUM21o+ubWzQZ87Cxm4ZbB6W0wsq26oEpySwgLOx
	sROS80vc4lAaeLzPvHGpTao4b5z3sCZfV0qaeQ0bd9w1fTAQQYkCP+O+x5gEBOuFCRFMWSkxGBQ
	jDdBWkOGQXIO5UkZX2PFhGHfCSvWqZ8y1tHENzR/UzveBJRB59U7SYI8Nl3pgsrSDu7yDSe9CTg
	iB6q449GPDyO8g8IfPHC5Rwg8VBGE3MXo2mo42fvFCYZb8sDuwkMdG5bHjN3PjA2pNGxSIM6FeJ
	Aoek/bLljbY868Pq4wIoVmebXr5G
X-Received: by 2002:a05:693c:2808:b0:36a:13df:749d with SMTP id 5a478bee46e88-36f76a1cc4bmr3692769eec.24.1793990611603;
        Fri, 06 Nov 2026 10:43:31 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:31 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] remoteproc: qcom: Fix bounds check in adsp_da_to_va()
Date: Sat,  7 Nov 2026 00:13:08 +0530
Message-ID: <20261106184312.100-2-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
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

offset is calculated as da - adsp->mem_reloc and stored in a
32 bit signed int, while da and adsp->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
adsp->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < adsp->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > adsp->mem_size - offset) so no
intermediate sum can wrap.

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 46d9169a37f6..1bf87cd0e9dd 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,12 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < adsp->mem_reloc)
+		return NULL;
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;
-- 
2.43.0

