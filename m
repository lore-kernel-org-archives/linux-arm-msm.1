Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657097;
	b=A8AcxxDy4wmsTQISnqXeWm78+H9SJ0S7pfCpI0E/ZJoqDHZqrthqAKb40mx5LhQ3fbZJ
	 euwS3mUIjrwxwvO42pWm3gUoERC8roYZhrAVzWoB/SBaZY6jJCKnXrXYOlJx9rUCCQBmN
	 YUlla3gAJHu+iZSfcLC0T1T70UMOcrWeuX6ZQlgc0VS1VMK+5vtPLquZvHquY7nhMQ2U+
	 qMAQdpd5s/jJZGdoCn0tRwLuVD1Yu29G1jTpzB3QZVKmE7skmhWhfvw6EDF/azJh2yXIf
	 NenZ29NMH/Rof6lSLQJimuPFqFqGJt9+A3wAGM55ZXKD+3gB+cFnI4AIz9qfYjaEQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GUWlaGlH5mz8susnJ1tc1MkzHAkxNXlsievDEYhf0Jg=;
	b=jLEFFylw3XBeOjq7IvOOr4lGIRtN3OIWjQKaA4X60kL3QAf5+Tcyu/uQoqb4jb5xW22a
	 Fm5FLGCcbSLEefl/ub3wULjtKpgEx/werrmSLUkc1DPOFKwuoDMEd1Li7IA/m6pHE7uMy
	 AVa9SyN+KdBiAJCGaYnHM7PsycVabMcL1hfEx2tTlYaJvqvmjKQD1hnbgzQvoha73x4dJ
	 BWNYwB3oldK/BJ89AtEfErCGBTb7gj6EVE2msN8X04IAPI1TXO/wuWsXHPZ/tqlsbuYp1
	 I817teErkgbfhsI7NBEAEKK7pOYz+1k+1jS3YMOcirGAX716pxJVZY3NDH4lTjkcORg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luXXcERe;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D006606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D006606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luXXcERe
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2689664eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657097; x=1794261897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUWlaGlH5mz8susnJ1tc1MkzHAkxNXlsievDEYhf0Jg=;
        b=luXXcERe0DLoxr+m5iCUqVR7TXPe8qmgr/VZKDEqrp2+P+rKrC4TF8cZH4ma4ATHjv
         AEe8YuQLREM7gRcTJHn5nghwnZj1zXOTJP/mwgrfZbNtbNthBkTsg+F5FJwiUTNWDnHO
         HcoHjrs/tEDy6uU1p2RQbY89F6EKYIGuiiAxnIYruAIwqoLT5AbPboScigYsUnYjmxgS
         DvsGig2TxElhsEe0IsPJ/aSWWhxxuxoNz5R0wNQCqpemAZlWc6ZW+UpaM5f5KBJjvcLr
         aPyfTjnzMtQAQmulPofVcKjlA1UfhQbOca50MWnqhD9U8vO/yN3LL+1zEty6pkrQtlDm
         XQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657097; x=1794261897;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUWlaGlH5mz8susnJ1tc1MkzHAkxNXlsievDEYhf0Jg=;
        b=CAa1ldFDbMa2VTzQkfkwm64soSrBFqQ91O1+7T2QBojPFUQXtIlypDbhH7Z2gGyxis
         WJ/UythtnsOJlHQR61fHCv/jh8uhkALNNmSSNlQgGcR933yJXj6vdTQcbXExSm7Hhhgc
         JRZtr1XJUzfzuI3+zxUwp+U/9TA7N5xJtJeKcxykLYjXPv+3jzTAhA82jRbIrBYUz4hR
         ViTveVId/MtzNEjJzsZfS0r/Y9zBCX+TMQtfbmgP/E6icOvIB+BHBXnlHU79kzSJsWYf
         AL23ktPM14KM5JbqdkgRgtaMKT1XoGfQxXHa0zZ+B22xNLcb1EeRFnKSzetNSmNeF9Fc
         Dfyg==
X-Forwarded-Encrypted: i=1; AKwUvByEoMhAHmNTJgDL4XfSCWaaSAuyxqBB4m5TD4pggqe52AKAaCNAJezxswkec1L5eTFsIRvKk4nEqE1AGLsj@vger.kernel.org
X-Gm-Message-State: APuU4Z+jJZmhsTwKdilsf9yfowTH1Mu5l7/xBpaZdZvhoNUMF+vAEq+X
	O9fYmJdSJjpF7qyN6tMD+PTayY81YB2i4rG8yEgmPnnwA0v35XX8afSI
X-Gm-Gg: AYBFou2GomDwvF9kjZoU1MJq+7wZhDkZtLmb9jDzmQtG5GKv3PlvcUYz4qrNggswlmw
	A45w8lXkklttRZwZcK3hYcALHe2CsfN56S0OgyVzaiAJMk0j7yCUzdX+HTPCXp4wQEgcluqMd34
	+9/bxB+WykQvfmtOs9Z0z3hWFlHITqUQuFQdOOhYc4hjr/jkY1/F805SFl1eoX7wajtncckN7Na
	SlYv2Jqo9iAAYEZNeN0V64hZdUjsQi2a5npGqtB8AxNEaazZM1rr4i5zCCGTBUZ+qUJ+gDemIkE
	0I9KtVtdeXzH5kvyvK1W+ZKRgTQUHHjuPfbXhXd+2Kmv0g3b+rfQnjOkCxt01kxwN+fKH31y4Qo
	AyaWg971KfFWiSrkZzltsw/n+NHFT2CggwMK7V+fZj8M2G3+V71qizdrnWIsOsdMEUnJu4fNjdp
	xRLU1TPFghLGmrOEUKjdz8R87XHmkKtgdmqexeNz84oQJzn03GvwDAUGhBQH8GjDB/jOKzsXKlF
	sFIBgA/OiVZIcm09li5Vax8UxLD1nLAoHNOwciDyutK4foQlKM3C5dhbE0+iWHocTpuS0Je/Boy
	RPxeY3mvd+SfRWEuESSK1ZcqTZZpTiCIEe8dHYO0CHT9IfJVPOFlQQs1lKyHgzZQtw==
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr31228630eec.21.1793657096394;
        Mon, 02 Nov 2026 14:04:56 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm39334485eec.6.2026.11.02.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:55 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Tue,  3 Nov 2026 07:04:56 +0900
Message-ID: <20261102220456.1687-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <6cd9240d-5628-4c35-b7ca-bbbae7f62fe9@oss.qualcomm.com>
References: <20261023123512.1912-1-26rote@gmail.com> <6cd9240d-5628-4c35-b7ca-bbbae7f62fe9@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/2/26 10:34 PM, Konrad Dybcio wrote:
> On 10/23/26 2:35 PM, Joonhoe Kim wrote:
[...]
>> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
>> in pin assignment C, resume from s2idle fails with "phy initialization
>> timed-out", the dwc3 resume returns -110 and the following xHCI resume
>> hangs the system.
>
> This sounds like a gap in the DWC3 driver, we should bail out of r/w
> any registers if resume failed

Agreed, that is a separate problem. This patch only removes the PHY
timeout behind the -110 in this case.

I need to correct the last part, though. The hang was with an
out-of-tree dwc3 change that passes power_lost to xhci-plat. With it,
xhci_resume() went into xhci_reset() with the long timeout and
interrupts off. I haven't checked what mainline does after the failed
dwc3 resume. In v3 I'll end that paragraph with "the dwc3 resume
returns -110 and USB stops working".

Thanks,
Joonhoe Kim
