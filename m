Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC7D3546C6;
	Fri, 31 Jul 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468241; cv=none; b=Qo6qtETMVFI60zthVneKie8aF2jbfNkJnJ0tToKEPCGoA6jnzs8Q4TR7RFAl6LEPNXmo/Egr7/8XTSbR7l1sCr0+GdiEx7H+M5AqDl38B7XkaqYTEGSTDUjooacq4csr1jaWiez6IM5MYhpWBXvtOrqxvniyAVWbk+sYrymffD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468241; c=relaxed/simple;
	bh=c4SSgBzAT5xS3GvU+v97xB3fObq2t9jT4C8+rwBoCao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McRc+SdoQ1CxH1+KBzWxPkmshDWSxCvgbXlS/+cr7mgYuYscbkiDmyOERHYt8CkuktEdzqkUqmKiVSNmQepHY2/sZs1hOMhguQ/Qrn9uA8J+Ar5uB7MA0utWXIGppQYW4D3G9RutSDCshrNcft1IZV3ZKbWM8bT4MWg8UJZHBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i06ayIzm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i06ayIzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6672E1F00A3A;
	Fri, 31 Jul 2026 03:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468240;
	bh=F2qx42Bzp1IUtFDYZ6OvP8sXmerzSZVoO/gbWZ7bnQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i06ayIzmnQUyaRXSnUQVygfpyN+o5kRrT6p+V7gmp7eqvFd9CzQbFGyEP2H/kJEgc
	 YGKDVdFvZ5CO8HAx52h9ENmgIB/t4C/PLsdo3m1uECw0PrG/enD9u/X7kha3Drc8dj
	 uvg/h69KtVjxSgcP9wubL5FRQEpIudj0+oRvPu3ZYF3eopt/IqQH14LwNeNaQNGyhc
	 fSdciXqPCW2PK0qH0UjBrWK3M71+v0eY0QL1KLdftAGtiPpg7T1YZK1TgFK4kXNyqr
	 rinOJ8Y2wjjNYX56atxj7JjSsZn6yGzYvmHLSgHcBoS+EC7FcsC37CoLEZKGkQDS6M
	 SfbnffiLAe+PA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Misc. SCM driver fixes
Date: Thu, 30 Jul 2026 22:23:47 -0500
Message-ID: <178546821244.316167.18378570554814156564.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 15:19:36 +0530, Mukesh Ojha wrote:
> Some of the existing issue reported by Sasiko mentioned here
> 
> https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/
> 
> https://lore.kernel.org/all/20260624192418.92B761F000E9@smtp.kernel.org/
> 
> and the series is about addressing them.
> 
> [...]

Applied, thanks!

[1/3] firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
      commit: 966d23c7e68ea32679275a7e3d2383181002c868
[2/3] firmware: qcom: scm: Fix reserved memory cleanup on probe failure
      commit: b697b20cea4374d27e2134da4bb7b0ea39f36c8b
[3/3] firmware: qcom: scm: Fix tzmem state on probe retry
      commit: 9941fe8a04f3d258e07eb5899db3027252a4190f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
