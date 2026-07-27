Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BEE36B905;
	Mon, 27 Jul 2026 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186688; cv=none; b=Jfl5hcXAwn89VTDc6lxUgs2unsPZJDMRUe3H8I+/5cvMg6K/QVM8/V80ko5QNvZ1QwBi+N2YmuIKKehu9QWOgO5ZvRu4t5VEodjScesQayjWveKMLM6b7lrZpjWhT/6n4WTPxsJmBjiJJUwoSKrdeCcg8FspjltS2nmVEPU6bkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186688; c=relaxed/simple;
	bh=c1MacU9TFjDgCqqQ94edtfKTnJVFcN8VX+p4RBoK6I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbRUOqwLT/7f7+CmEtoJYGH+eS0TCcm/k76CXoqXbxLMGjzV0HJXXP8oA8n07QtcizKil4YpfcoC8xAKvn0sw5Qnw8XO7fr8cZ/cj2133Bu0P5rWi9/DCEvAZwpUV6q3brcY2mHOViFj/RcSegRQR07+Z0/czi8SmAZsvVjpDO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wq+geYhG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wq+geYhG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I28uE6eH6S+uEnHAqEevG8MSWevDOHqcv8vMnvASqAw=; b=wq+geYhG5tV3m2/aP+TcQiXh1s
	O5CW9DsCbHbmSho5DtuyDNoI4Yzk7VOz01xxE4NClhToCYIDqKUpKfEsTMOh1x4SX7KIhacBr5LS6
	750Ma6cj2ea2VqucV+XhXG6Zl2oNjNQsF2YI5JhDf0XzI3oNepDaPOUKeYnwg4qazASTQf5kaOmUc
	6EoDShoh1dMemhBhQ5N8yI0jLDSVTsSM/6RnoLXyMloCvCJjqWmlgMnlFm7lwuMksE9m9f0B/MYxr
	4oy0aZIbM9LqjESEsPxpdDPnXHZMj831+Aztt7uav/3Cgpc+dP/ROrgSAIH3vbKXGWLN+VS7mxmBQ
	W9NOL2Rg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSbd-00000003vpy-456K;
	Mon, 27 Jul 2026 21:11:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] soc: qcom: PDR_HELPERS, PDR_MSG are independent of QCOM_SOC
Date: Mon, 27 Jul 2026 14:11:24 -0700
Message-ID: <20260727211124.853520-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently QCOM_PDR_MSG depends on QCOM_SOC (it's inside the
"if QCOM_SOC" block). It appears to be independent of QCOM_SOC, as
though it was entered in the wrong location in the Kconfig file.

Moving QCOM_PDR_MSG after the end of the QCOM_SOC block fixes the
kconfig unmet dependencies warning and survives both randconfig and
allmodconfig builds.

WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
  Depends on [n]: QCOM_SOC [=n]
  Selected by [y]:
  - QCOM_PDR_HELPERS [=y] && NET [=y]

Caused by SLIM_QCOM_NGD_CTRL selecting QCOM_PDR_HELPERS.

Fixes: 0ac5c7d933de ("soc: qcom: pdr: extract PDR message marshalling data")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>

 drivers/soc/qcom/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260726.orig/drivers/soc/qcom/Kconfig
+++ linux-next-20260726/drivers/soc/qcom/Kconfig
@@ -90,9 +90,6 @@ config QCOM_PD_MAPPER
 	  implementation of the service. It is a simpler alternative to the
 	  userspace daemon.
 
-config QCOM_PDR_MSG
-	tristate
-
 config QCOM_PMIC_PDCHARGER_ULOG
 	tristate "Qualcomm PMIC PDCharger ULOG driver"
 	depends on RPMSG
@@ -297,6 +294,9 @@ endif
 # Options selected by other drivers from different subsystems must be outside
 # of the menuconfig if-block:
 
+config QCOM_PDR_MSG
+	tristate
+
 config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
 	select QCOM_SCM
