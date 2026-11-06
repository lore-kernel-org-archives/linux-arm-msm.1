Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990633;
	b=htleR7GEZqil3szbVPtB9ciJgEjXewMVDlX/24QazZoT56Z1Rb+WywvZp3x/uN6uQBVj
	 GnHJkIHGX/TSs8TfPtVHZhdNuS3JpcnwqHKSAPFWeBl/TlEl9zwDJ9Ta9x1qVozF6MnJn
	 7KyTG1geHBBNVyfnEZbLs/eBfWsUwGK2OcMoo2PtVi8d/cfN6aOlYnJtRCZbAhi0aeyc2
	 xWk06WFs2JTxl9DfN+exb56oeTWTDAyE44tI5jQl/PcwKic+JZiInbVufkdlsVMLyb+W6
	 pUJtKwrisw9o8e9MVlYjf1/OikxmDFENVTju5ZBq0LI5m4Qvtx1rjmy9HCnkYS4Tt2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
	b=DINuMMRzE0kJrc4QfUCBLOazAqjc732NiEgirWB2Hxp5r14u8P63nrYqq1N9UW4fwpEn
	 g7PN7GhTM/QKKRzjaHW3jE1FSkdWiILGHBLlzw3cx+9cGCE67rELAJYJ1BTODFvy+v0PA
	 7Qyvuf1zLFCK/Ebcm31ToQzbw2DfPVsKQ5Ap5w7ekiZhILp+xWrVydiefm/JGD8VRAdiQ
	 GvmAoyle4n3oXvHCMrnTqEE8I2OY8aujojy3RBZsT/OengsiOiE46EENixwPM1W6IrRM1
	 FY7LTURFlUIvSg59AOl4gTEYUfy2ooH0cn6RQWnBgdKVjvbhknY2nyL/TGfYd5UdCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLUt8Oox;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F62606D838
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 18:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F62606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLUt8Oox
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1588017eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990632; x=1794595432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
        b=hLUt8Oox1wh+RjoZr4soKfhuHh/efc9x9XCcVBYW0QcvUiwa2YY1pL35ARccV2i0o4
         FwF8RyC6rYr0xQx5cEi756PL0wOLo9s+GrN2Lrc4SnZzQfZ2XzrhfY4UWj5erNGeVZjh
         mW671qX5TKHR5fN1JPk1n9a9b4wSnGvjoFPf2rMdO41BSMjTObGWsd2oTxO1jyr2Foy3
         tBkdUavBMTWrVs/SWnNgADkv2nZPYotHLXnszKEJ5WuaaRQ10FSGBcL8+FdmWSUukYEB
         p4uU8/D1M/frnSvLA057OEh+5whQd94RHg5Yzsi/WJvHh35jl35xkNZm/+w9cg7/OXZt
         xqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990632; x=1794595432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
        b=X9Dq1uXmd4iO2652qD8AzsT70YkLKpQEpQ7K/GKWd9fLm4tHwEnOOdz064ErDAKhtf
         huJNYw5oq1w0CVF1tDKysaO0+yYQ2KASfT09nsyugVbn4ItcmYPhDqAFjhjJZ4UfsYzZ
         VxEbFi8oBYt8QOktzDn+9MpBuK3b9/mgyMJ2/7C8qn0IqVIMoP7ECwZ0mH1Adpcm6/lb
         QXL/wyMQI+0Xnwn4RCoKPap1R6H4NOeM4uTyRi9X8yJydExgj4BkjiYqnlB5xLrunBcg
         3bnPA0GVAsDNq98LqWVmQJCcXosnKdoAM7PbKzIXrNId4evc4aP4RoQhGVjCPyMGUJvP
         p3Sg==
X-Forwarded-Encrypted: i=1; AL+hErFNTmkB+50k2W5UJtLpdwiOsC5yQ9Iq05y9eSRgL3cm0sd9IDGIwhmvHlJkBOB3uFaGn+acFmkb9fYh5AYC@vger.kernel.org
X-Gm-Message-State: APuU4Z+5wbPnBcJM/SxwunvWPZCtOSzADFOSOBUzCGiUV+BlBdSzaCKs
	tsgc4r0h0/MifGRRc5pPvhDq9xZq16niaMy/ZJLVbtlZ0erflg0VU6f8
X-Gm-Gg: AYBFou0XWqo8z3JXchU+5sklng5nmFx2nvuJGTeaXtbetc+lVAlb4kZUEzoo/B8SdUv
	i9UnHySBse8yiTd65AmuqXtmWKqNFlUJwtEu0JTyUc3A+aKNYfBFd9HWftLHOCBfdz56bhiqVF3
	pQFwZNKT20pQVNsEIa99V/eH+pUduhIbHLUrCQytexUyW3rA9gQbI0XVBoxbGLORg1TjT4Az/Io
	OUguHo0gadK+8Z62HaT6RK8CqPizkeymPEV/aoBGW8rE17ARpKzsBo1VxXZYkF35YEM2k/lj49X
	vxbrDpzipkWP4c18E6Z01gXw4MAoULVk3JqQvHbx8T4T4LxM/ZjyXieio7CesNaG7fv7oXr525G
	tIl2y4jHrdor+U/FU3oYPfdAJOea7x2epQ+uU8wmF6kyQZKQAVQUdscfEb2hxowtDXkvb/W2bno
	jwpeHBT6synouU6Dvo6CP5W721d/FI1XuE/7eKZJetKGOkeWlk8qd5g0GBnSQdkcGlX/QRJ1rU9
	8BVkZeX1o9PhIF8GWxeA9j4cKYerFq8wsbZ214g3eoH3PKa3kGJHHxR8dCTzNX8ca0xMwaF1o9v
	wXTpJSZRp+gf44jHkY5v9nYg1Vrp
X-Received: by 2002:a05:693c:839b:10b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-36f76023a00mr5131720eec.25.1793990631801;
        Fri, 06 Nov 2026 10:43:51 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:51 -0800 (PST)
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
Subject: [PATCH 4/4] remoteproc: qcom: Fix bounds check in wcnss_da_to_va()
Date: Sat,  7 Nov 2026 00:13:11 +0530
Message-ID: <20261106184312.100-5-atul.akella@gmail.com>
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

offset is calculated as da - wcnss->mem_reloc and stored in a
32 bit signed int, while da and wcnss->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
wcnss->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < wcnss->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > wcnss->mem_size - offset) so no
intermediate sum can wrap.

Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_wcnss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..d95530e8be71 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -321,10 +321,12 @@ static int wcnss_stop(struct rproc *rproc)
 static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_wcnss *wcnss = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < wcnss->mem_reloc)
+		return NULL;
 	offset = da - wcnss->mem_reloc;
-	if (offset < 0 || offset + len > wcnss->mem_size)
+	if (offset > wcnss->mem_size || len > wcnss->mem_size - offset)
 		return NULL;
 
 	return (__force void *)wcnss->mem_region + offset;
-- 
2.43.0

