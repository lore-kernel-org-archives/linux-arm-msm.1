Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980808;
	b=Zpb0yHWrspmnsISt4eUMx9JPZRKp3c4f+m4g6XSCVzN8AH196jqR8nc2v9NOAzj0Gix0
	 8xa8kCEp4RGkNbCKCPxkcBnWYj+0l7PGXLzmnYjpuIIausk9ScPmaYlQZ30foqPn7UaBY
	 dS4E+5Iu8fQwaXoWDFWQZKYY/9/pjpL4h1bAvDvD3Z/CGRUUBbti7dJpX/oF6doMKgikI
	 tl4ABwydEGlCMQ2RezQPbDzMDHt/MLqg2O2hl76IGyq0uuLRrPeV1WXzuaa0bD30RJKoZ
	 kJc42PQfmvdjwV1EHgkvOUWZWAzKbMhYz2td0FM4YBMHSBffiF5zS9ogqQyy+WPo9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980808;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Wceg9P6rVwNxjmwcIYEWVnQy4iNxDncDteRZcyo/RpM=;
	b=cmteDiyeiIxOj5Eh7PBrCrgCja8H9l98kVcCIEuhJedv22iE2fPhW7tB23UrwpmsX/Nz
	 SRef3jg/BPK32o/UU+JfIVdzVt9jkkzzdFdjSBBCcXWOEBmNyC9ZNWr3C4Qktcb//DklU
	 6F4Xzrmcnh4NskWQn1ldr9Z6UdTKzUhigkYlyVE2azwMDQiMyyRyInyWJNCOmbxDDE6Pd
	 MQ6+82FGkNQ+v+eREYLqW+frGVYyGG0Ym1qMAcG0tugvFFAWz41jZGgBjX6bQ/nvtIlVY
	 zGzGq+GHJprbl6O5HyYc5JKu1LnjLRnYvrkBHakuinMFbg1vQDtGDKny1fS3tCQq4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cjAigSOr;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD4606A32A;
	Wed, 18 Nov 2026 05:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BD4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cjAigSOr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=Wceg9P6rVwNxjmwcIYEWVnQy4iNxDncDteRZcyo/RpM=;
	b=cjAigSOrME51iaV5zcc8XarZ4Pw/eqm7/k+fmHzbJZIKJA/5eJw3efBrlS2YeS
	E0J9aX9rwLP4vwmTqbMGW8/lzY+DrOcLyUjpho//VaYptHDDpU5WPNJUvj18Uaq1
	1GNhYghE420wYhsS4Q/tIfnXeP41iOK/yIoUql2Xc4tT4=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3l7KxO_1qDAR3IA--.59887S3;
	Wed, 18 Nov 2026 13:46:28 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: pdr: stop on an empty domain page
Date: Wed, 18 Nov 2026 13:46:27 +0800
Message-ID: <20261118134627.677805-1-shxzhaosr@163.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:_____wD3l7KxO_1qDAR3IA--.59887S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrykKFyxXry3uF1xGFWxJFb_yoW8Xr43pF
	s8Kas8Ww4UGr4fCr45Ga1DXa4FgFWSgrW0k3sIkwnrZF4UArZI9F1IkFyj9F4DCrWrJr42
	yrW7XryDuFyDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-2-8UUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7RQWVGr9O7QtggAA3M

pdr_locate_service() pages through the service registry by adding
resp->domain_list_len to domains_read until it reaches
resp->total_domains.  There is a clamp for a page that claims more
domains than the reply contains, but nothing for an empty one.

If a reply carries domain_list_len == 0 while total_domains stays
positive, domains_read never advances and the do-while re-issues the
same request forever.  Both fields come from the service registry
reply, so a faulty remote can trigger it.

Stop on an empty page; the loop then returns -ENXIO.

Found by static analysis of the request/response loop; not observed at
runtime.
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 drivers/soc/qcom/pdr_interface.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 6d879e1..c532925 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -432,6 +432,13 @@ static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
 		if (resp->domain_list_len > resp->total_domains)
 			resp->domain_list_len = resp->total_domains;
 
+		/*
+		 * A zero-length page that still claims more domains would
+		 * otherwise spin forever without advancing domains_read.
+		 */
+		if (!resp->domain_list_len)
+			break;
+
 		domains_read += resp->domain_list_len;
 	} while (domains_read < resp->total_domains);
 

