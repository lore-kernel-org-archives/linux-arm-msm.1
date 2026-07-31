Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67332BCF4C;
	Fri, 31 Jul 2026 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468234; cv=none; b=TME93+hKNrnGPDOuGWbIizBOmQnMRdK+WVniMrDgO+DjVIpCIzLQg8kb38+I1ra6a2KEwSl402URaSwUXhQo6ET3mxjpiC0xWRori5JyCk2DeDeAUrrEfUQrUtanKhQkoAbxDgSKlAUpEZgQYpxtuqSmf6HUM/h/Arw80OYpp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468234; c=relaxed/simple;
	bh=Jtqmcb71Xu5frIXDRo575cy5mZHNN2iBbWWd7egYba8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPVGhtWnBThPORgKbH8mK4VTD/oBx/W+ZpH6S1Ix0Gmo7z7vM2U/v/Ml5bQq/nNvVyYdRib7Yy71SjgAzNPAW+5+p0Mu4au7pHTCcPSJ8KMsUa6q44I4OnLzUcUZMFvcyRBn1EEbNqPH3/VJMOkkKtym5AiKpf4/HW8evfSHDI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1NLNr3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1NLNr3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3041F00A3A;
	Fri, 31 Jul 2026 03:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468233;
	bh=BS0t+wKc6rfl9bAB6KJhFvlXrj3sNU4njawXclSTBmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y1NLNr3P7+1WhmjQLYK6sJ68lHchcHxFpHbP3jkLfULUlsO55RFWC9cB2vZ5Rdgk3
	 hkBexYgWvVUm9iplH9dOHfKaUr54Z56WhwfZsM5XSsVu9hclBCj8k9FxjZL6yYrobv
	 twADHaZmOyikeTu0QTCrXgh9IrUAL9kp0XK7MriW2WPkOOSZaoePvU/WKq4/SQVaBi
	 Q6RI+HI3S4Utx89ym4DwB/QSOjKK8/pcN/MORcK0gtlXMfPE79MkUsjU6HN2fB+yfe
	 nuKCIeOmw2ggBNvkqjM39kDS1UVvya4izi8YKRk7AmfH6IXXRLXWh7glog+c0Is4Nw
	 sjBAlnNlXqyTw==
From: Bjorn Andersson <andersson@kernel.org>
To: Jack Pham <jack.pham@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Define the TBT extradata properly
Date: Thu, 30 Jul 2026 22:23:42 -0500
Message-ID: <178546821240.316167.16166249570600895932.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717-topic-tbt_extradata_fixup-v1-1-5caa18f1c8d3@oss.qualcomm.com>
References: <20260717-topic-tbt_extradata_fixup-v1-1-5caa18f1c8d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jul 2026 20:06:37 +0200, Konrad Dybcio wrote:
> Before the fixes-referenced commit, there was a trailing 'u32 reserved'
> after the payload array. That commit gobbled it up into the thunderbolt
> extradata. Push it back where it belongs.
> 
> There's no functional change, since the outer struct size remains
> identical - struct usbc_sc8280x_tbt_data and therefore the union it's a
> part of made up for the difference and the res bytes were ignored
> anyway.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink_altmode: Define the TBT extradata properly
      commit: b255c6f4e6b48e09227cd68777a5d2ec1d36dc31

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
