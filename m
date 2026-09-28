Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F433876A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573963; cv=none; b=J5XHi2Khmg2n413eTaouX3cwuu8c3en/gD6RZJu6fB5/+ur+CKlgpRb6Qh4upWVzRg3PV8sBIps5uX8stZoZggvY/0AkNcMWxLQEIz1MtsJlbq0eRfkc7t7Ua5Y9FkXtFROoCJ25L4onZsYKCo9/722vFqf1phwK8Z5qBeN+ahs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573963; c=relaxed/simple;
	bh=qDHuxNQTwiK4vLrjxltnQ7pSPnmhxpgaO7APWc3qf9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQ3dL0K/r2Wfn4AeM9GaSQcgxX+EAj2hOWftO2p9xPVW9HGQkOLQDbhW+zv12EiCD8F2Mbc0G6y31X1gNoiCTl8y4/DIBRWgFjflBi3UlZG3QYI4YgzZzWqYLbcsKOMnXR4z7EEbLRcSUNpJrfnmqctUuZAb4z9phh0EECuOUe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS5Xtrc/; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS5Xtrc/"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc7557d56c9so187054a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573954; x=1791178754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYoN39qS2O9tTjo4AMAAx7esJiOig4Qk9Kzt2+/v1lw=;
        b=JS5Xtrc/fcTbE1IGkEwrugUcgBX5LGRv/ArjsCtzu7PLZEfGPh7hklWpYVfxTQm0C4
         +psv5gvNUVP7Fr206QLvIhuwpsCw40+ZrgBansxXc6j/k5GJ8IqVZUmI0liZpASU+Hzp
         GAHHf9QdHUgaAA+PrzOHIl+l0yS8EAOLRK3ltLGf7SU+CmWcFQKPJB5mbzkrcs5MURIz
         4ysu4axdfSSo808d3X42Fzeq3Q+rzvsmG/DQwLQEBCNQ3gkyhuQTohQvKrz/+iDoM9EV
         SoHT+VUDUqCOCsKiwRq5GcABx6DwWsSESVFpNB3lrVWDhh+ARDF+u7RwsZ3VaSHOPSWy
         O7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573954; x=1791178754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYoN39qS2O9tTjo4AMAAx7esJiOig4Qk9Kzt2+/v1lw=;
        b=zVLm1SjvEUJDH+Pn4S7G6Vjqm5HIdSYeFsGpLsPhCyo1lIdaX07vbEHZgNXp0LSmJm
         ZCOeaGWIK9A4lFUFJqCFn1Tafq7HfWs3GVTeepsxulS9MoJqph6VfoTfRjgv1wmrqYEc
         l9Q6S258G3KA+//iyVq7dcLL1QSha6gdsS5saq3KzMusQvXpbCXW90COW0T7BjPdylPZ
         cLK1ORofuXeBcZqFTG+188z5WMpyWwIpAfWMrcYlHeLoa2KYpnuW7oTl+QiyQvul5Xvi
         0YH31iT3n8HNUqlRPWjAvh2yKSQbDv/gNOlkiZQSVeY3FiR+vIOKqpW0+WHu1o8nYL0/
         mGOw==
X-Forwarded-Encrypted: i=1; AKwUvBzcWsBcnupv5hlRjpmqjjGQ3Bn8+SSuuGg9XLQBTNqm1/cNbHVmsI5Gchi9eTiEiBhI5OCpSu3KKGKrr/gq@vger.kernel.org
X-Gm-Message-State: AFuF++nRdyHSbHLJbJwwn/x/R8c/m3H51+lzk02HTgDNpmAzW/lymTNm
	C7yH7WRfM1lSKFR8hlCoWrOyKwiQmfYwO+PYza2JQ2MnV+PO03j05S75
X-Gm-Gg: AYBFou0wOf1kFSt0rzH8dyN2TCqvrf2xH/hWWbLsDTPrHQS1uqsK97U7BPtgKan2L2J
	dwoGS+5CHS89KXxvI7MMAJF1z6klUPAwAcjoSe+/yT8n0I7aFcuXGDGmBRZJMfq+K5o7WF7teK8
	ddmnFRviyv/8MzwK34hIxaABW+mKgSJInTzkHmLEt6Jri92E40cLTtlZBnKoKH9kHiB1vz3tVxP
	Zck29//xootTBmyZNrEZHULTykNuBGdSGn5pkE83pGpAlc5tSY0J9FHCXs8LKoj/JK91sifKD7V
	oT2PjWQzQeVOfOEGc65Hob738S1ySTDYz7rD1OHO/Wi8KDkR8srfM923ReeUL7LU4qs4pin4jih
	XwT9HbXae25wsuKdBPkl3s7qi08VZ+yRFo7v4vqDu367f9VN5mZCLk9N+YiV0k5BSEtH2Rig2Sq
	CK9vM/4zNlkZFsJxeaNOgWr4OLdpWSf7Y6MeA8DXiuNmtyA5FFDIFoHP2VvUqD9BtpoVLcqE//w
	wunLiBR+SCvUg==
X-Received: by 2002:a05:6a21:1645:b0:3c3:2dc0:7cbd with SMTP id adf61e73a8af0-3de22b356bbmr12488753637.1.1790573954396;
        Sun, 27 Sep 2026 22:39:14 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87febb82357sm3591121b3a.61.2026.09.27.22.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:39:13 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v1 1/2] iommu: export iommu_get_dma_domain()
Date: Mon, 28 Sep 2026 13:38:50 +0800
Message-ID: <20260928053901.7270-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928053901.7270-1-liujianfeng1994@gmail.com>
References: <20260928053901.7270-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm/msm needs to recover the physical address behind a DMA address of
imported dma-bufs: with CONFIG_DMABUF_DEBUG=y the attachment sg_table
it hands to importers carries no struct page, and msm has to translate
sg_dma_address() back to a physical address through the attaching
device's DMA-API domain to map such buffers into its own pagetables
(see the follow-up drm/msm patch).

Export the helper so modularized drivers can use it.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/iommu/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9af..330f9a79248bd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2327,6 +2327,7 @@ struct iommu_domain *iommu_get_dma_domain(struct device *dev)
 {
 	return dev->iommu_group->default_domain;
 }
+EXPORT_SYMBOL_GPL(iommu_get_dma_domain);
 
 static void *iommu_make_pasid_array_entry(struct iommu_domain *domain,
 					  struct iommu_attach_handle *handle)
-- 
2.47.3

