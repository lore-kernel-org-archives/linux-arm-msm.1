Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FEF471CEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829259; cv=none; b=VOyhrdITpgNqZaS0iUcyyY4tSkxKCzR0stRXnTGeq/b0sSuHBJT19SDzKEbvK/FqFjoTaMvvNdAnCNsI5jthFZhk/aEj3Y5BEN1EaGfas5bvwqmMdOM/Z97wEqn/140fOrPFRKTIJkdK6zEloyT8csKCLN+SSVjUClqE/WLqwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829259; c=relaxed/simple;
	bh=TIyuPwxhEEv0uH+Xq1XETpYKoGnoUC45HMyviabeiCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A8XCDn6ioafLV1TfGppau2w6fH8GhnvfffcitJa83ol4PAnnrHVj7hL7u+4nZSxKglcSlwAKQAzK6jW6tpgjBLK8oGTn8BNWKZQkereyhMxLlyrRKSMVJL+YJ948NvyLx4xCiQVQJkHUA0PoNBmYpBNCcyLH4Ude17sXZrlH+hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ewBuk4+N; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ewBuk4+N"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CA1F41A11E9;
	Mon, 12 Oct 2026 18:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E81D601A6;
	Mon, 12 Oct 2026 18:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49A6D11D70602;
	Mon, 12 Oct 2026 20:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1KoVUXlucQrVW4bBWlvJlG2dmQ6Fg2nhuw6P+GEzKSM=;
	b=ewBuk4+NCSxnhTPtqOWinCmkIBQQ5Lw9K73+VkzXN6GCQmy2FyPhMI4PM8uUNtG30Op1e2
	BQvkWDNo2RdzgywnX7QOhAKdb47F3a4nwX/XjBcerUyq8nzpK6JmBLf8IHZZJ/lWWdb3i7
	FO++DJRdcCbAkAfnZq1As0nuk3y7i5AwIAEglwnbwo5LmSmCpo2RN5OC1t2bGz+lXBGUWa
	BAKIRNgGEWolKZa+Wg86ywBYYkoymsHxJ+JJb2ZMDVqUwAM2J6Sgq4mYbJ/Povp7DfMxYk
	ukpn0gEIZIt4uxGSEmRUZHcS0yq8cC9YHxjKQvVVA8lDNs0NNgBIlv68vRvm3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
References: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: fix read location register usage
 in config_nand_cw_read()
Message-Id: <179182925022.590599.2183404092012307300.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 28 Sep 2026 09:01:53 +0200, Gabor Juhos wrote:
> On QPIC v2 controllers, when the last codeword is being read, the read
> location values must be programmed into the READ_LOCATION_LAST_CW_*
> registers. Prior to commit 8c52932da5e6 ("mtd: rawnand: qcom: cleanup
> qcom_nandc driver"), the config_nand_cw_read() function did it right,
> but since then it always writes the read location values to the
> READ_LOCATION_* registers even if the actual codeword is the last one.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: qcom: fix read location register usage in config_nand_cw_read()
      commit: 94623942a66e031826756f9c92dbde9a12e2b4d2

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

